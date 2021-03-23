<template>
	<article class="news-article">
		<div class="card">
			<div class="card-body">
				<p class="card-title">{{ newsArticle.header }}</p>
				<img v-if="image" :src="image.url" :alt="image.alt" />
				<p class="card-text">
					{{ newsArticle.summaryText }}
				</p>
				<a :href="newsArticle.url">Continue reading</a>
			</div>
		</div>
	</article>
</template>
<script>
export default {
	props: ['newsArticle'],
	name: 'NewsArticle',
	computed: {
		image: function() {
			return this.newsArticle && this.newsArticle.image && this.newsArticle.image[0] ? this.newsArticle.image[0] : null;
		}
	}
};
</script>
