import { createApp } from 'vue';
import App from './App.vue';

const app = createApp(App);

// Example: Accessing Vue config
console.log(app.config); // Ensure this is defined

app.mount('#app');