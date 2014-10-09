#!/usr/bin/env python

import pika

parameters = pika.URLParameters('amqps://admin:b9afcf0373310067792a1c8c1a9df6264a88cc1a@10.8.59.99:5671/%2f')
connection = pika.BlockingConnection(parameters)
channel = connection.channel()
method_frame, header_frame, body = channel.basic_get('hello')
if method_frame:
    print method_frame, header_frame, body
    channel.basic_ack(method_frame.delivery_tag)
else:
    print 'No message returned'