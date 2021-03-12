const HtmlWebpackPlugin = require('html-webpack-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const path = require('path');

module.exports = {
	entry: './src/main.js',
	module: {
		rules: [
			{ test: /\.js$/, use: 'babel-loader' },
			{ test: /\.vue$/, use: 'vue-loader' },
			{ test: /\.css$/, use: ['vue-style-loader', 'css-loader'] }
		]
	},
	output: {
		filename: 'main.js',
		path: path.resolve(__dirname, 'web/assets/js')
	},
	plugins: [
		/*
		new HtmlWebpackPlugin({
			template: './src/index.html'
		}),
		*/
		new VueLoaderPlugin()
	]
};
