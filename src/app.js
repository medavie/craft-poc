import Vue from 'vue';
import NewsArticleList from './components/NewsArticleList.vue';

new Vue({
	el: '#app',
	delimiters: ['${', '}'],
	components: {
		NewsArticleList
	}
});