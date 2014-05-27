# Healthcare Scheduler Demo

## Technology Stack

 * ActivePython - http://www.activestate.com/activepython
 * Bottle web framework - http://bottlepy.org/
 * Redis NoSQL database - http://redis.io/

Then open application in a browser.

    $ stackato open

### Without Stackato

It is possible to run the app without Stackato, if necessary.

 1. Install and start Redis database, see http://redis.io for details

 1. Install dependencies:

    $ pypm install -r requirements.txt
 
 2. Run the app:

    $ SELFHOST=1 python ./wsgi.py
    
Then open http://127.0.0.1 in a browser.


