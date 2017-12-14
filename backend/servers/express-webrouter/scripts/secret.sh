if [ $TYPE = 'production' ]; then
  awk '{print "heroku config:set --app pass-culture "$0";"}' scripts/"$TYPE"_secret.sh | xargs -0 bash -c;
else
  awk '{print "heroku config:set --app $TYPE-pass-culture "$0";"}' scripts/"$TYPE"_secret.sh | xargs -0 bash -c;
fi
