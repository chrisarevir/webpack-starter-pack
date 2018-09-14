main() {
  CYAN=$'\e[1;36m'
  RED=$'\e[0;31m'
  NORMAL=$'\e[0m'

  if [ ! -f "package.json" ]; then
    npm init -y
  fi

  export PKG=classnames;
  npm info "$PKG@latest" devDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --save-dev "$PKG@latest"
  npm install react react-dom @procore/core-react

  if [ ! -d "src" ]; then
    mkdir src
  fi
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/src/index.js > src/index.js
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/.babelrc > .babelrc
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/.gitignore > .gitignore
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/.prettierrc > .prettierrc
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/postcss.config.js > postcss.config.js
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/tsconfig.json > tsconfig.json
  curl -fsSL https://raw.githubusercontent.com/chrisarevir/webpack-starter-pack/master/webpack.config.js > webpack.config.js

  if command -v npx  2>/dev/null; then
    npx json -I -f package.json -e 'this.scripts.start="NODE_ENV=development webpack-dev-server --progress --colors --hot --inline"'
    npx json -I -f package.json -e 'this.scripts.test="true"'
    npx json -I -f package.json -e 'this.scripts.coverage="true"'
    npx json -I -f package.json -e 'this.scripts["build:development"]="NODE_ENV=development webpack --progress --colors"'
    npx json -I -f package.json -e 'this.scripts["build:production"]="NODE_ENV=production webpack --colors"'
  else
    printf "${RED}"
    echo 'Please modify your package.json to have these following!'
    echo ''
    echo '"scripts": {'
    echo '  "start": "NODE_ENV='development' webpack-dev-server --progress --colors --hot --inline",'
    echo '  "test": "true",'
    echo '  "coverage": "true",'
    echo '  "build:development": "NODE_ENV=development webpack --progress --colors",'
    echo '  "build:production": "NODE_ENV=production webpack --colors"'
    echo '},'
    echo ''
    printf "${NORMAL}"
  fi

  printf "${CYAN}"
  echo '      ___           ___           ___           ___      '
  echo '     /  /\         /  /\         /  /\         /  /\     '
  echo '    /  /:/        /  /::\       /  /::\       /  /:/_    '
  echo '   /  /:/        /  /:/\:\     /  /:/\:\     /  /:/ /\   '
  echo '  /  /:/  ___   /  /:/  \:\   /  /:/~/:/    /  /:/ /:/_  '
  echo ' /__/:/  /  /\ /__/:/ \__\:\ /__/:/ /:/___ /__/:/ /:/ /\ '
  echo ' \  \:\ /  /:/ \  \:\ /  /:/ \  \:\/:::::/ \  \:\/:/ /:/ '
  echo '  \  \:\  /:/   \  \:\  /:/   \  \::/~~~~   \  \::/ /:/  '
  echo '   \  \:\/:/     \  \:\/:/     \  \:\        \  \:\/:/   '
  echo '    \  \::/       \  \::/       \  \:\        \  \::/    '
  echo '     \__\/         \__\/         \__\/         \__\/     '
  echo '     ___           ___                         ___         ___           ___           ___     '
  echo '    /__/\         /  /\         _____         /  /\       /  /\         /  /\         /__/|    '
  echo '   _\_ \:\       /  /:/_       /  /::\       /  /::\     /  /::\       /  /:/        |  |:|    '
  echo '  /__/\ \:\     /  /:/ /\     /  /:/\:\     /  /:/\:\   /  /:/\:\     /  /:/         |  |:|    '
  echo ' _\_ \:\ \:\   /  /:/ /:/_   /  /:/~/::\   /  /:/~/:/  /  /:/~/::\   /  /:/  ___   __|  |:|    '
  echo '/__/\ \:\ \:\ /__/:/ /:/ /\ /__/:/ /:/\:| /__/:/ /:/  /__/:/ /:/\:\ /__/:/  /  /\ /__/\_|:|____'
  echo '\  \:\ \:\/:/ \  \:\/:/ /:/ \  \:\/:/~/:/ \  \:\/:/   \  \:\/:/__\/ \  \:\ /  /:/ \  \:\/:::::/'
  echo ' \  \:\ \::/   \  \::/ /:/   \  \::/ /:/   \  \::/     \  \::/       \  \:\  /:/   \  \::/~~~~ '
  echo '  \  \:\/:/     \  \:\/:/     \  \:\/:/     \  \:\      \  \:\        \  \:\/:/     \  \:\     '
  echo '   \  \::/       \  \::/       \  \::/       \  \:\      \  \:\        \  \::/       \  \:\    '
  echo '    \__\/         \__\/         \__\/         \__\/       \__\/         \__\/         \__\/    '
  echo '                                                                                               '
  printf "${NORMAL}"
  echo '                                                                           ...is now installed!'
}

main
