<template lang="html">
  <form class="form" v-on:submit="handleSubmit">
    <b-form-group label="Redirect url" label-for="url-input">
      <b-form-input
        id="url-input"
        v-model="RedirectUrl"
        placeholder="https://example.com"
        :state="externalValid('RedirectUrl')"
        novalidate
      />

      <b-form-invalid-feedback
        v-for="(error, i) in externalErrors.RedirectUrl"
        :key="i"
        :state="externalValid('RedirectUrl')"
      >
        {{ error }}
      </b-form-invalid-feedback>
    </b-form-group>
    <b-form-group label="Slug" label-for="slug-input">
      <b-form-input id="slug-input" v-model="Slug" novalidate />

      <b-form-invalid-feedback v-for="(error, i) in externalErrors.Slug" :key="i" :state="externalValid('Slug')">
        {{ error }}
      </b-form-invalid-feedback>
    </b-form-group>
    <b-button variant="primary" type="sumbit">Shorten</b-button>
  </form>
</template>

<script>
export default {
  name: "UrlForm",
  props: ["externalErrors"],
  methods: {
    handleSubmit(e) {
      e.preventDefault();
      const longUrl = {
        RedirectUrl: this.RedirectUrl,
        Slug: this.Slug.trim() || null
      };
      this.$emit("shorten-url", longUrl);
    },

    externalValid: function(field) {
      if (!(field in this.externalErrors)) return null;
      return this.externalErrors[field].length === 0;
    }
  },

  data: function() {
    return {
      RedirectUrl: "",
      Slug: ""
    };
  },

  computed: {}
};
</script>

<style lang="css" scoped></style>
