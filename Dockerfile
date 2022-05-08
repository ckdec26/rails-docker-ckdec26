# ベースのイメージを指定
FROM ruby:2.7

# 本番向けに環境変数を追加
ENV RAILS_ENV=production

# 必要なライブラリのダウンロードとインストールの実行
# ここでは、JavaScript関連の「nodejs」と「yarn」をインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn

# ワークディレクトリの指定とローカルのソースをワークディレクトリへコピーする
WORKDIR /app
COPY ./src /app

# Ruby関連のライブラリ保管場所の指定とライブラリのインストールの実行
# ※ bundleは、bundlerのコマンド
# ※ bundlerは、gemの依存関係とバージョンを管理する為のツール
RUN bundle config --local set path 'vendor/bundle' \
    && bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
