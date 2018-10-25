#!/bin/bash
cd `dirname $0`
cd ../server
bundle exec rackup &
cd ../taro-mori-demo-raspi
./demo 0.0.0.0 6666