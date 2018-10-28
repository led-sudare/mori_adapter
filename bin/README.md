# bin
## demo_build.sh
* bundle install
* taro-mori-demo-raspiのmake
## demo_start.sh
* ※このスクリプトはsystemdで呼ばれることを想定して、最初に30秒sleepする処理があります。
* serverのappを実行してサーバーを立上げる。
* taro-mori-demo-raspiを実行してサーバーにdemo ledをUDP送信する。