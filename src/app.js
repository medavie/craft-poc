import Vue from 'vue';
import NewsArticleApp from '@/components/NewsArticleApp.vue';
import VueI18n from 'vue-i18n';

Vue.use(VueI18n);

// Create VueI18n instance with options
const i18n = new VueI18n({
	locale: 'en' // set locale
});

new Vue({
	i18n,
	el: '#app',
	delimiters: ['${', '}'],
	components: {
		NewsArticleApp
	}
});
