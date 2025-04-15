<template>
        <h1>Browse Articles</h1>
        <h2>Here you can browse all the articles</h2>
        <BButton variant="primary" @click="$router.push('/articlelist')">Go to Articles</BButton>
        <div class="browse-container">
            <div class="search-bar-container mx-auto">
                <SearchBar @search="onSearch" />
            </div>
            <div class="result-container">
                <ul v-if="results.length" class="result-list">
                    <li v-for="result in results" :key="result.id">
                        <SearchResultItem 
                            :title="result.title" 
                            :content="result.content" 
                            :tags="result.tags" 
                            @click.native="onSelect(result)"
                        />
                    </li>
                </ul>
                <p v-else class="text-center text-muted"> No results found </p>
            </div>
        </div>
</template>

<script>
import {BButton} from 'bootstrap-vue-next';
import SearchBar from '@/components/SearchBar.vue';
import SearchResultItem from '@/components/SearchResultItem.vue';

export default {
    name: 'Browse', 
    components: {
        BButton,
        SearchBar
    },
    data() {
        return {
            results: []
        };
    },
    methods:{
        async OnSearch(title, tags) {
            // Handle the search logic here
            if (!(title[0] == '""' && title[title.length - 1] == '""' && !title.includes('%') && !title.includes('_'))) {
                title = `%${title}%`;
            }
            try {
                const response = await axiomos.get('http://localhost:8000/articles', {
                    params: {
                        title: title,
                        tags: tags
                    }
                });
                this.results = response.data.posts ?? [];

                this.results.forEach(result => {
                    axios.get('http://localhost:8000/articles/' + result.id)
                        .then(response => {
                            result.content = response.data.content.length > 200?
                                response.data.content.substring(0, 200) + '...' :
                                response.data.content;
                            result.tags = response.data.tags;
                        })
                        .catch(error => {
                            console.error('Error fetching article content:', error);
                        });
                })
            }
            catch (error) {
                console.error('Error fetching articles:', error);
            }
        }
    },
    mounted() {
        this.onSearch({title: '', tags: []});
    }
};
</script>

<style>
.browse-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
    width: 100%;
    background-color: #f9f9f9;
}

.search-bar-container {
    width: 70%;
    padding: 20px;
    background-color: #ffffff;
    border-bottom: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.results-container {
    flex: 1;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    border: 1px solid #ddd;
    overflow-y: auto;
}

.results-list {
    list-style: none;
    padding: 0;
    margin: 0;
}
</style>