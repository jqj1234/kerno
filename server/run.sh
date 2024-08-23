#!/bin/bash

pm2 start ./app.js --name "kerno-serve"
tail -f /dev/null
