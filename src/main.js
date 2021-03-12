import Vue from 'vue';
import ProviderApp from './ProviderApp.vue';

new Vue({
	el: '#provider-app',
	delimiters: ['${', '}'],
	components: {
		ProviderApp
	},
	/*render: (h) => h(ProviderApp)*/
});
