<template>
    <BCard 
        class="result-item mb-3" 
        :title="title"
        style="cursor: pointer;"
    >
        <BCardText>{{ content }}</BCardText>
        <ul class="list-inline">
            <li 
                v-for="(tag, index) in tags" 
                :key="index" 
                class="list-inline-item badge bg-primary"
            >
                {{ tag }}
            </li>
        </ul>
    </BCard>
</template>

<script>
import { BCard, BCardBody, BCardTitle, BCardText } from 'bootstrap-vue-next';
export default {

    name: 'SearchResultItem',
    components: {
        BCard,
        BCardBody,
        BCardTitle,
        BCardText
    },
    props: {
        title: {
            type: String,
            required: true
        },
        content: {
            type: String,
            default: ''
        },
        tags: {
            type: Array,
            default: () => []
        }
    }
};
</script>

<style>
.result-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
