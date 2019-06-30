mori adapter
===


# Docker🐳
## Get Started🏁

1. Get src
    ```sh
    $ git clone https://github.com/led-sudare/mori-adapter.git
    ```

2. Build
    ```sh
    $ docker image build -t mori-adapter:alpine --no-cache .
    $ docker image ls
    mori-adapter        alpine               f3ef95e889d1        20 seconds ago      89.9MB
    ```

3. Run
    ```sh
    $ docker container run -d --rm --name mori-adapter mori-adapter:alpine
    ```

*others*

* Show state
    ```sh
    $ docker container ps
    CONTAINER ID        IMAGE                 COMMAND                CREATED             STATUS              PORTS               NAMES
    dbed0d5274a3        mori-adapter:alpine   "bundle exec rackup"   28 seconds ago      Up 25 seconds                           mori-adapter
    ```

* Stop container
    ```sh
    $ docker container stop mori-adapter
    ```


# Manual
## 環境構築
### Ruby2.5.0インストール

* windowsの場合  
[rubyinstaller.org](https://rubyinstaller.org/downloads/) からインストーラをダウンロードする。  
* macの場合  
rbenvでruby2.5をインストールする。  


### bunderインストール

```sh
$ gem install bundler
```
プロキシ設定が必要な場合は、設定してからbundlerをインストールすること。  
（環境変数 http_proxy を設定する）  

https://rubygems.org/ にアクセスできないときは、ダウンロード元を http://rubygems.org/ へ変更する。  


### gemインストール

bundlerを使ってgemをまとめてインストールする。  
```sh
$ bundle install
```


## 実行
```sh
$ bundle exec rackup
```

HTTPポート番号は5001  
