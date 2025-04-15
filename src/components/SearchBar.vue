<template>
    <div class="search-bar">
        <b-form-input 
            type="text" 
            v-model="title" 
            placeholder="Search..." 
            @input="onSearch" 
            class="mb-2"
        />
        <b-form-tags 
            v-model="tags" 
            placeholder="Add tags..." 
            @input="onSearch"
            class="mb-2"
        />
        <BButton variant="primary">Search</BButton> 
    </div>
</template>

<script>
import { BButton, BFormInput, BFormTags } from 'bootstrap-vue-next'

export default {
    name: "SearchBar",
    components: {
        BButton,
        BFormInput,
        BFormTags
    },
    data() {
        return {
            title: "",
            tags: []
        }
    },
    methods: {
        onSearch() {
            this.$emit("search", { title: this.title, tags: this.tags })
        }
    }
}
</script>

<style scoped>
.search-bar {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 10px 0;
}

.search-bar .form-control {
    width: 100%;
    max-width: 400px;
    padding: 8px 12px;
    font-size: 16px;
}
</style>