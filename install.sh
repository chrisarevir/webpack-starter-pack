main() {
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

  CYAN=$'\e[1;36m'
  NORMAL=$'\e[0m'
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
