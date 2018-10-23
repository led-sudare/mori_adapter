## RaspberryPi環境構築

RaspberryPiセットアップ手順

* SDカードイメージ  
2018-04-18-raspbian-stretch.zip
* SSH有効  
sshという名称の空ファイルを作る
* パスワード変更（to 警告消す）  
`sudo raspi-config`
* apt-getアップデート  
`sudo apt-get update`  
`sudo apt-get upgrade`
* vimインストール  
`sudo apt-get install vim`
* FTP有効  
http://yamaryu0508.hatenablog.com/entry/2014/12/02/102648
* リモートデスクトップ有効  
`sudo apt-get install xrdp`
* boost, opencvインストール  
`sudo apt-get install libopencv-dev libboost1.62-all`

## ビルド・実行
`make`
`./demo`
 