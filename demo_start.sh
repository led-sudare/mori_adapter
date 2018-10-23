cd ./server
bundle install
bundle exec rackup &
cd ../taro-mori-demo-raspi
./demo 0.0.0.0 6666