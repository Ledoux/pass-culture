if [[ ! $(heroku apps:info -a pass-culture) ]]; then
  git init
  heroku create --app pass-culture --remote production
  sh scripts/production_heroku_add_buildpacks.sh
  heroku config:set --app pass-culture SERVER=express-webrouter
  heroku config:set --app pass-culture SITE_NAME=pass-culture
  heroku config:set --app pass-culture TAG=pass-culture-wbr
  heroku config:set --app pass-culture TYPE=production
  heroku config:set --app pass-culture URL=https://pass-culture.herokuapp.com
  if [[ ! -d "./scripts/production_secret.sh" ]]; then
    export TYPE=production && sh scripts/secret.sh
  fi
else
  if [[ ! -d ".git" ]]; then
    git init
    heroku git:remote --app pass-culture --remote production
  else
    echo ".git has been already initiated"
    if [[ "$(git remote | grep production)" == "production" ]]; then
      echo "remote has been already set"
    else
      heroku git:remote --app pass-culture --remote production
    fi
  fi
  echo "pass-culture has been already created"
fi
