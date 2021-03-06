const VueLoaderPlugin = require('vue-loader/lib/plugin');
const path = require('path');

module.exports = {
	entry: {
		app: './src/app.js'
	},
	module: {
		rules: [
			{ test: /\.js$/, use: 'babel-loader' },
			{ test: /\.vue$/, use: 'vue-loader' },
			{ test: /\.css$/, use: ['vue-style-loader', 'css-loader'] },
			{
				resourceQuery: /blockType=i18n/,
				type: 'javascript/auto',
				loader: '@kazupon/vue-i18n-loader'
			}
		]
	},
	output: {
		filename: '[name].bundle.js',
		path: path.resolve(__dirname, 'web/assets/js'),
		clean: true
	},
	optimization: {
		runtimeChunk: 'single'
	},
	/**
	 * This to allow templating to work
	 */
	resolve: {
		alias: {
			vue$: 'vue/dist/vue.esm.js',
			'@': path.resolve(__dirname, 'src')
		}
	},
	plugins: [new VueLoaderPlugin()]
};
