#!/bin/bash

/etc/init.d/apache2 start
/etc/init.d/mysql start
tail -f /dev/null
