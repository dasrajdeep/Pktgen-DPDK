#!/bin/bash

./build/app/pktgen -c 0xfffff -w 3b:00.0,txq_inline=256,txqs_min_inline=4 -- -T -P -m "[2:4].0
