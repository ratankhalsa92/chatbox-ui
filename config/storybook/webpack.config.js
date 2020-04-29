const path = require('path');
const StylelintPlugin = require('stylelint-webpack-plugin');

// Export a function. Accept the base config as the only param.
module.exports = async ({ config, _mode }) => {
  // `mode` has a value of 'DEVELOPMENT' or 'PRODUCTION'
  // You can change the configuration based on that.
  // 'PRODUCTION' is used when building the static version of storybook.

  // Make whatever fine-grained changes you need
  config.module.rules.push({
    test: /\.scss$/,
    loaders: ['style-loader', 'css-loader', 'sass-loader'],
    include: path.resolve(__dirname, '../../'),
  });

  config.module.rules.push({
    test: /\.(ts|tsx)$/,
    loader: require.resolve('babel-loader'),
  });
  config.node = {
    fs: 'empty',
  };
  config.resolve.modules.push('/src');
  config.resolve.extensions.push('.ts', '.tsx');
  config.plugins.push(new StylelintPlugin());

  // Return the altered config
  return config;
};
