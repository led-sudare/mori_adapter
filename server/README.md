# taro-mori-demo-raspi

## 環境構築

### Ruby2.5.0インストール

* windowsの場合  
[rubyinstaller.org](https://rubyinstaller.org/downloads/) からインストーラをダウンロードする。
* macの場合  
rbenvでruby2.5をインストールする。

### bunderインストール

`$ gem install bundler`

プロキシ設定が必要な場合は、設定してからbundlerをインストールすること。  
（環境変数 http_proxy を設定する）


https://rubygems.org/ にアクセスできないときは、ダウンロード元を http://rubygems.org/ へ変更する。

### gemインストール

bundlerを使ってgemをまとめてインストールする。

`$ bundle install`

## 実行

`bundle exec rackup`

HTTPポート番号は5001