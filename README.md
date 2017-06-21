# vaddy-privatenet-docker

PrivateNet 版 VAddy(https://github.com/vaddy/go-vaddy) を Docker コンテナ内で実行します。PrivateNet 版 VAddy を気軽に動かしてみたいというような用途に向いています。

PrivateNet 版 VAddy で Web アプリケーションをスキャンするまでには以下のような作業が必要になります。

* 検査対象の Web アプリケーションを用意する
* PrivateNet 版 VAddy ツールをインストールする

ローカルの開発環境で作業できるとはいえ、このような環境の構築にはそれなりに手間がかかるものです。私自身、もう少し気軽に、いつでも、誰でも VAddy でスキャンできる環境を用意したいと思い、このような Docker 環境を作ってみました。

気軽に実行できることに重点を置いているため、セキュリティの観点からはあまり望ましくないこともやっています。あくまでも、お試し環境としてご利用ください。

なお、このドキュメントでは PrivateNet 版 VAddy 自体の詳細な設定方法などは割愛してます。PrivateNet 版 VAddy の利用方法は公式ドキュメント(https://vaddy.net/ja/docs/private-step00.html)を参照してください。

# 必要なもの

* Docker ホスト
  * 1.12.6 で動作確認しています。
  * Docker コンテナからインターネットへ SSH 接続可能な環境が必要です。

* Docker Compose
  * Compose File のバージョンは 2.1 を利用しています。

# Docker コンテナ構成(Docker Compose サービス構成)

* webapp
    * VAddy による検査対象の擬似 Web アプリケーションです。アプリケーションといっても、静的な HTML ファイルを配置しているだけです。最低限の動作確認だけできればよいと考え、このようになっています。

* vaddy
  * PrivateNet 版 VAddy のコンテナです。インストール作業や初期設定などを Dockerfile で実行しています。
  * このコンテナから webapp に対して docker-compose.yml で links を指定しており、このコンテナから webapp に対して VAddy によるスキャンが実行されます。

# 使い方

## 設定ファイルの編集

https://github.com/nomnux/vaddy-privatenet-docker/blob/master/vaddy/privatenet/conf/vaddy.conf を自分の環境に合わせて編集してください。パラメータの意味については公式ドキュメントを参照してください。

## 認証ファイルの保存

VAddy の認証ファイルを　https://github.com/nomnux/vaddy-privatenet-docker/blob/master/webapp/html/vaddy-verification-file.html　として保存してください。ファイル名は VAddy から発行された認証ファイルの名前で保存してください。

## Docker コンテナの起動

以下のコマンドを実行することで、　https://vaddy.net/ja/docs/private-step00.html の ＜接続テスト＞ (connect コマンドの実行)までの処理が完了します。Docker コンテナを起動している限り、connect コマンドにより生成されたセッションが継続します。

```
$ git clone https://github.com/nomnux/vaddy-privatenet-docker.git
$ cd vaddy-privatenet-docker
$ docker-compose up -d
```
## VAddy によるクロール

通常の手順でクロールしてください。

## VAddy によるスキャン

通常の手順でスキャンしてください。

