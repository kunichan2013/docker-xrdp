Docker RDPイメージ
==================

このイメージは、Ubuntu上でRDPサーバを動作させてDockerを
シンクライアント環境として利用するデモイメージです。


イメージのビルド
----------------

下記のコマンドでDockerイメージをビルドします。

```
# docker build -t docker-rdp .
```

自動的にxrdpパッケージやスクリプトを組み込んだコンテナを作成してくれます。
プロキシ環境などでうまく動作しない場合は、Dockerfileに適当に

  ENV http_proxy=

...という行を追加してください。


コンテナの実行
--------------

下記の用にROOT_PASSWORD変数でrootのパスワードを指定してください。コンテナを起動すると
指定したポートでRDPクライアントで接続できます。RDPサーバはコンテナ内の3389番で起動します。

```
# docker run -it -p 3389:3389 -e ROOT_PASSWORD=<yourpasswrod> docker-rdp
```



