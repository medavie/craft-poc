<template>

    <div>
        
        <h1>{{ $t('header') }}</h1>

        <news-article-list v-bind="$attrs"/>

    </div>
    
</template>

<script>
import NewsArticleList from '@/components/NewsArticleList.vue';

export default {
	name: 'NewsArticleApp',
	inheritAttrs: false,
	components: {
		NewsArticleList
	}
}
</script>

<i18n>
	{
		"en": {
			"header": "Recent News in Vue"
		},
		"fr": {
			"header": "Recent News in Vue"
		}			
	}
</i18n>


