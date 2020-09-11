<template>
  <div id="app">
    <b-container>
      <h3>UrlShrt</h3>
      <UrlForm v-on:shorten-url="shortenUrl" :externalErrors="formErrors" />
      <ShortUrlItem v-if="shortUrl" v-bind:shortUrl="shortUrl" />
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
        .then((data) => {
          this.shortUrl = data;
          this.formErrors = [];
        })
        .catch((err) => {
          err.json().then((data) => (this.formErrors = data.errors));
        });
    }
  }
};
</script>

<style></style>
