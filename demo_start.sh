cd ./server
bundle install
cd ../taro-mori-demo-raspi
./make
cd ../server
bundle exec rackup &
cd ../taro-mori-demo-raspi
./demo 0.0.0.0 6666