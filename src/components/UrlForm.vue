<template lang="html">
  <form class="form" v-on:submit="handleSubmit">
    <div class="input-group">
      <label for="redirectUrl">Redirect url</label>
      <input v-model="redirectUrl" class="form-control" id="redirectUrl" type="text" />
    </div>
    <div class="input-group">
      <label for="slug">Slug</label>
      <input v-model="slug" class="form-control" id="slug" type="text" />
    </div>
    <button class="btn btn-primary" type="sumbit">Shorten</button>
  </form>
</template>

<script>
export default {
  name: "UrlForm",
  methods: {
    handleSubmit(e) {
      e.preventDefault();
      const longUrl = {
        redirectUrl: this.redirectUrl,
        slug: this.slug.trim() || null
      };
      this.$emit("shorten-url", longUrl);
    }
  },
  data: function() {
    return {
      redirectUrl: "",
      slug: ""
    };
  }
};
</script>

<style lang="css" scoped></style>
