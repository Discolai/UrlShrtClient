<template lang="html">
  <!-- form-inline align-items-start justify-content-between -->
  <form class="" v-on:submit="handleSubmit">
    <div class="form-row">
      <b-form-group class="form-grouping col-sm-12 col-md-5">
        <b-input-group prepend="Url">
          <b-form-input
            class="form-control-lg"
            id="url-input"
            v-model="RedirectUrl"
            placeholder="https://example.com"
            :state="externalValid('RedirectUrl')"
            novalidate
          />
        </b-input-group>

        <b-form-invalid-feedback
          v-for="(error, i) in externalErrors.RedirectUrl"
          :key="i"
          :state="externalValid('RedirectUrl')"
        >
          {{ error }}
        </b-form-invalid-feedback>
      </b-form-group>
      <b-form-group class="form-grouping col-sm-12 col-md-6">
        <b-input-group :prepend="apiEndpoint">
          <b-form-input class="form-control-lg" id="slug-input" v-model="Slug" novalidate />
        </b-input-group>

        <b-form-invalid-feedback v-for="(error, i) in externalErrors.Slug" :key="i" :state="externalValid('Slug')">
          {{ error }}
        </b-form-invalid-feedback>
      </b-form-group>
      <b-form-group class="col-sm-12 col-md-1">
        <b-button class="btn-lg" variant="primary" type="sumbit">Shorten</b-button>
      </b-form-group>
    </div>
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

  computed: {
    apiEndpoint() {
      return process.env.VUE_APP_API_ENDPOINT;
    }
  }
};
</script>

<style lang="scss" scoped>
.form-grouping {
  max-width: 19.5rem !important;
}
</style>
