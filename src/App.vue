<template>
  <div id="app">
    <h3>UrlShrt</h3>
    <UrlForm v-on:shorten-url="shortenUrl" />
  </div>
</template>

<script>
import UrlForm from "./components/UrlForm.vue";

const BASE_URL = process.env.VUE_APP_API_ENDPOINT;
export default {
  name: "App",
  data: function() {
    return {
      shortUrl: null,
      formErrors: []
    };
  },

  components: {
    UrlForm
  },

  methods: {
    shortenUrl(longUrl) {
      fetch(`${BASE_URL}/u`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: JSON.stringify(longUrl)
      })
        .then((res) => {
          if (res.ok) return res.json();
          else return Promise.reject(res);
        })
        .then((data) => (this.shortUrl = data))
        .catch((err) => err.json())
        .then((data) => (this.formErrors = data.errors));
    }
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
