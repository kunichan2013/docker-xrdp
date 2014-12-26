Docker VNCイメージ
==================

このイメージは、Ubuntu上でVNCサーバを動作させてDockerをシンクライアント環境として利用するデモイメージです。


イメージのビルド
----------------

下記のコマンドでDockerイメージをビルドします。

```
# docker build -t docker-vnc .
```

自動的にVNCパッケージやスクリプトを組み込んだコンテナを作成してくれます。
プロキシ環境などでうまく動作しない場合は、Dockerfileに適用にENV http_proxy=...という行を追加してください。


コンテナの実行
--------------

下記の用にVNC_PASSWORD変数でvncのパスワードを指定してください。コンテナを起動すると
指定したポートでVNCクライアントで接続できます。VNCサーバはコンテナ内の5901で起動します。

```
# docker run -it -p 5901:5901 -e VNC_PASSWORD=<yourpasswrod> docker-vnc
```



