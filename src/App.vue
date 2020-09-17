<template>
  <div id="app">
    <b-container class="main-container">
      <div class="main-wrapper mx-auto">
        <header class="d-flex align-items-center">
          <img src="/logo.svg" alt="" width="64" height="auto" />
          <h1 class="ml-3">UrlShrt</h1>
        </header>
        <section class="h2 mt-4">
          A simple and customizable url shortener
        </section>
        <div class="short-section">
          <UrlForm v-if="shortUrl === null" class="mt-4" v-on:shorten-url="shortenUrl" :externalErrors="formErrors" />
          <ShortUrlItem v-if="shortUrl" v-bind:shortUrl="shortUrl" @reset-shortUrl="resetUrl" />
        </div>
      </div>
    </b-container>
  </div>
</template>

<script>
import UrlForm from "./components/UrlForm.vue";
import ShortUrlItem from "./components/ShortUrlItem.vue";

const BASE_URL = process.env.VUE_APP_API_ENDPOINT;
export default {
  name: "App",
  data: function() {
    return {
      shortUrl: null,
      formErrors: {}
    };
  },

  components: {
    UrlForm,
    ShortUrlItem
  },

  methods: {
    shortenUrl(longUrl) {
      fetch(`${BASE_URL}u`, {
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
        .then((data) => {
          this.shortUrl = data.data;
          this.formErrors = [];
        })
        .catch((err) => {
          err.json().then((data) => (this.formErrors = data.errors));
        });
    },
    resetUrl() {
      this.shortUrl = null;
    }
  }
};
</script>

<style>
.main-wrapper {
  max-width: 80%;
  min-width: 30%;
  padding-top: 5%;
}
.short-section {
  margin-top: 5rem;
}
#app {
  height: 100vh;
}
</style>
