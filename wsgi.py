#!/usr/bin/env python

import re
import os
import sys
import time
import redis
import bottle
import logging
import urllib2
import urlparse
import contextlib

from bottle import get, post, request, route

STATIC_ROOT = os.path.join(os.path.dirname(__file__), 'static')

reservation_url = os.environ.get("RESERVATION_URL",'localhost')

logging.basicConfig()
log = logging.getLogger('bottle-currency')
log.setLevel(logging.DEBUG)

url = urlparse.urlparse(os.environ['REDIS_URL'])
rdb = redis.Redis(host=url.hostname, port=url.port, password=url.password)

def currencies(db=[]):
    if not db:
        with open("currencies.dat", 'r') as f:
            for line in f.readlines():
                symbol, title = line.strip().split("\t", 1)
                db.append((symbol, title))
    return db

class ConnectionError(Exception): pass
class ServiceError(Exception): pass

value_rx = re.compile(r'\d+\.\d+')

def get_upstream_rate(src, dst):
    url = ("%s/calculator.php?original=%s&target=%s&value=1.0") % (SERVICE_URL,
                                                                   src, dst)
    try:
        with contextlib.closing(urllib2.urlopen(url)) as stream:
            result = stream.read()
    except urllib2.URLError:
        log.exception("url error")
        raise ConnectionError("Cannot connect upstream server!")
    except urllib2.HTTPError:
        log.exception("http error")
        raise ConnectionError("Cannot communicate upstream server")

    if result == "Currency Code not found":
        raise ServiceError("Currency code not found")
    if not re.match(r'\d+\.\d+', result):
        raise ServiceError("Unexpected upstream server response")

    return float(result)

@route('/')
def home():
    return bottle.template('home', currencies=currencies())

@route('/rate/:src#[A-Z]{3}#/:dst#[A-Z]{3}#')
def get_rate(src, dst):
    for i in range(3):
        try:
            rate = rdb.get(src + dst)
            if rate is None:
                rate = get_upstream_rate(src, dst)
                rdb.setex(src + dst, rate, 3*60*60)
            return '' if rate == '' else str(float(rate))
        except ConnectionError:
            time.sleep(1) # recoverable, retry after 1 sec
        except:
            log.exception("Unexpected error")
            raise # non-recoverableasdf
    raise # the 3rd connection errorasdf

@route('/static/:filename')
def serve_static(filename):
    return bottle.static_file(filename, root=STATIC_ROOT)

@route('/login')
def login():
    return bottle.template('login')

@route('/login', method='POST')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if username == 'joshb':
        return bottle.template('authenticated')
    else:
        return "<p>Login failed.</p>"

@route('/find')
def find():
    return bottle.template('find')

@route('/find', method='POST')
def do_find():
    zip = request.forms.get('zip')
    name = request.forms.get('name')
    if zip == '98126':
        return bottle.template('results')
    else:
        return "<p>No results found, please try again! </p>"

@route('/schedule')
def schedule():
    return bottle.template('schedule')

@route('/schedule', method='POST')
def do_schedule():
    try:
        urllib2.urlopen(reservation_url)
    except urllib2.URLError:
        log.exception("url error")
        raise ConnectionError("Can't connect to the upstream server")
        return bottle.template('error.tpl')
    except urllib2.HTTPError:
        log.exception("http error")
        raise ConnectionError("Can't connect to the upstream server")
        return bottle.template('error.tpl')
    else:
        return bottle.template('success.tpl')

application = bottle.app()
application.catchall = False

if os.getenv('SELFHOST', False):
    bottle.run(application)
