<template>
    <div class="dashboard-page">
        <h1>CSV Search Dashboard</h1>
        <div class="search-container">
            <input
                type="text"
                v-model="searchQuery"
                placeholder="Enter your search query"
            />
            <button @click="performSearch">Search</button>
        </div>
        <div class="results-container" v-if="results.length > 0">
            <h2>Search Results</h2>
            <ul>
                <li v-for="(result, index) in results" :key="index">
                    {{ result }}
                </li>
            </ul>
        </div>
        <div v-else-if="searchPerformed && results.length === 0">
            <p>No results found.</p>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "DashboardPage",
    data() {
        return {
            searchQuery: "",
            results: [],
            searchPerformed: false,
        };
    },
    methods: {
        async performSearch() {
            if (!this.searchQuery.trim()) {
                alert("Please enter a search query.");
                return;
            }

            try {
                const response = await axios.post("http://127.0.0.1:5000/search", {
                    query: this.searchQuery,
                });
                this.results = response.data.results || [];
                this.searchPerformed = true;
            } catch (error) {
                console.error("Error performing search:", error);
                alert("An error occurred while performing the search.");
            }
        },
    },
};
</script>

<style scoped>
.dashboard-page {
    font-family: Arial, sans-serif;
    padding: 20px;
}

.search-container {
    margin-bottom: 20px;
}

input {
    padding: 8px;
    margin-right: 10px;
    width: 300px;
}

button {
    padding: 8px 15px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

.results-container {
    margin-top: 20px;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    padding: 5px 0;
    border-bottom: 1px solid #ddd;
}
</style>