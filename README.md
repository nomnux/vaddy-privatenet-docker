# vaddy-privatenet-docker
PrivateNet 版 VAddy(https://github.com/vaddy/go-vaddy)を Docker コンテナとして実行します。

# Docker コンテナ構成

* webapp: 検査対象の擬似 Web アプリケーションのコンテナです。アプリケーションといっても、静的な HTML ファイルを配置しているだけです。最低限の動作確認だけできればよいと考え、このようになっています。

* vaddy: PrivateNet 版 VAddy のコンテナです。公式ドキュメントのスタートアップガイド(https://vaddy.net/ja/docs/private-step00.html)に記載されている初期設定などを Dockerfile で実行しています。

# 使い方

```
$ git clone https://github.com/nomnux/vaddy-privatenet-docker.git
$ cd vaddy-privatenet-docker
$ docker-compose up -d 
```

上記のコマンドを実行することで、https://vaddy.net/ja/docs/private-step00.html の ＜接続テスト＞ (connect コマンドの実行)までの処理が完了します。
