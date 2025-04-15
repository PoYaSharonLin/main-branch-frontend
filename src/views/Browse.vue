<template>
    <div>
        <h1>Browse Articles</h1>
        <h2>Here you can browse all the articles</h2>
        <!-- <BButton variant="success">Success</BButton><br><br>
        <div class="btn btn-sucsess">Success</div> -->
        <BButton variant="primary" @click="$router.push('/articles')">Go to Articles</BButton>
    </div>
</template>

<script>
import {BButton} from 'bootstrap-vue-next';

export default {
    name: 'Browse', 
    components: {
        BButton
    }
};
</script>

<style>
/* Add your styles here */
</style>