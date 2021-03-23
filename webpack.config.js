const VueLoaderPlugin = require('vue-loader/lib/plugin');
const path = require('path');

module.exports = {
	entry: './src/app.js',
	module: {
		rules: [
			{ test: /\.js$/, use: 'babel-loader' },
			{ test: /\.vue$/, use: 'vue-loader' },
			{ test: /\.css$/, use: ['vue-style-loader', 'css-loader'] }
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
			vue$: 'vue/dist/vue.esm.js'
		}
	},
	plugins: [new VueLoaderPlugin()]
};
