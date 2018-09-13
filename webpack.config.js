const path = require('path')
const webpack = require('webpack')

let output = {
  path: '/',
  publicPath: 'http://localhost:5000/',
  filename: '[name].bundle.js',
  libraryTarget: 'umd',
}

let plugins = []

if (process.env.NODE_ENV === 'production') {
  output = {
    path: `${__dirname}/build/`,
    filename: '[name].bundle.js',
    libraryTarget: 'umd',
  }

  plugins = plugins.concat([new webpack.HotModuleReplacementPlugin()])
}

module.exports = {
  devServer: {
    host: '0.0.0.0',
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
    port: '5000',
  },

  devtool: 'inline-source-map',

  entry: {
    list: path.resolve(__dirname, 'src/index.js'),
  },

  mode: process.env.NODE_ENV,

  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
      {
        test: /\.jsx?$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
      },
      {
        test: /\.s?[ca]ss$/,
        exclude: /node_modules/,
        use: [
          { loader: 'style-loader' },
          {
            loader: 'css-loader',
            options: { modules: true, importLoaders: 1 },
          },
          {
            loader: 'postcss-loader',
          },
        ],
      },
      {
        test: /\.(eot|svg|ttf|woff2?)$/,
        use: ['file-loader'],
      },
    ],
  },

  output,

  plugins,

  resolve: {
    extensions: ['.scss', '.js', '.jsx', '.ts', '.tsx'],
  },
}
