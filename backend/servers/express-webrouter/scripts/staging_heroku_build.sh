if [[ ! $(heroku apps:info -a staging-pass-culture) ]]; then
  git init
  heroku create --app staging-pass-culture --remote staging
  sh scripts/staging_heroku_add_buildpacks.sh
  heroku config:set --app staging-pass-culture SERVER=express-webrouter
  heroku config:set --app staging-pass-culture SITE_NAME=pass-culture
  heroku config:set --app staging-pass-culture TAG=pass-culture-wbr
  heroku config:set --app staging-pass-culture TYPE=staging
  heroku config:set --app staging-pass-culture URL=https://staging-pass-culture.herokuapp.com
  if [[ ! -d "./scripts/staging_secret.sh" ]]; then
    export TYPE=staging && sh scripts/secret.sh
  fi
else
  if [[ ! -d ".git" ]]; then
    git init
    heroku git:remote --app staging-pass-culture --remote staging
  else
    echo ".git has been already initiated"
    if [[ "$(git remote | grep staging)" == "staging" ]]; then
      echo "remote has been already set"
    else
      heroku git:remote --app staging-pass-culture --remote staging
    fi
  fi
  echo "staging-pass-culture has been already created"
fi
