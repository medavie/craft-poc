<template>
	<ul class="row news-article-list">
		<li v-for="newsArticle in newsArticles" :key="newsArticle.id" class="col-sm-4 col-xs-12 news-article-list-item">
			<news-article :news-article="newsArticle" />
		</li>
	</ul>
</template>
<script>
import NewsArticle from './NewsArticle.vue';

export default {
	props: ['newsArticles'],
	name: 'NewsArticleList',
	components: {
		NewsArticle
	}
};
</script>
