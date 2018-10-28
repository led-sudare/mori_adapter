#!/bin/bash
cd `dirname $0`
sleep 30 #systemdで自動起動できるようにするため
cd ../server
bundle exec rackup &
cd ../taro-mori-demo-raspi
./demo 0.0.0.0 6666