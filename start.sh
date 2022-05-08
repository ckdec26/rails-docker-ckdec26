# Shellスクリプトのおまじない
#!/bin/sh

# 以下、環境変数「RAILS_ENV」が「production」の場合は、「assets:precompile」を実行する。
if [ "${RAILS_ENV}" = "production" ]
then
    bundle exec rails assets:precompile
fi

# railsサーバーを起動させる
bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0


