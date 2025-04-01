<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <div>
      <input
        type="text"
        v-model="searchQuery"
        placeholder="Digite aqui o nome da empresa que deseja buscar."
      />
      <button @click="performSearch">Buscar</button>
    </div>
    <div v-if="results.length > 0">
      <h3>Resultados da pesquisa.</h3>
      <ul>
        <li v-for="(result, index) in results" :key="index">{{ result }}</li>
      </ul>
    </div>
    <div v-else-if="searchPerformed">
      <p>Nenhum resultado encontrado.</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Relatório de empresas",
  props: {
    msg: String,
  },
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
        alert("Por favor execute uma consulta.");
        return;
      }

      try {
        const response = await axios.post("http://127.0.0.1:5000/api/search", {
          params: { query: this.searchQuery },
        });
        this.results = response.data.results || [];
        this.searchPerformed = true;
      } catch (error) {
        console.error("Erro ao realizar consulta:", error);
        alert("Um erro ocorreu durante o processo de consulta.");
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
