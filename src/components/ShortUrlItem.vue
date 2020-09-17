<template>
  <div class="">
    <b-input-group>
      <b-form-input ref="url-readonly" class="url-readonly form-control-lg" :value="shortUrl.shortUrl" readonly />
      <b-input-group-append>
        <b-button variant="primary" @click="copyUrl" v-b-popover.bottom="'Copied'">Copy</b-button>
      </b-input-group-append>
    </b-input-group>

    <div class="h5 mt-3 d-flex justify-content-between flex-wrap">
      <div>
        <span>Long url: </span>
        <b-link :href="shortUrl.redirectUrl">{{ shortUrl.redirectUrl }}</b-link>
      </div>
      <b-link @click="resetUrl">Shorten another url</b-link>
    </div>
  </div>
</template>
<script>
export default {
  name: "ShortUrlItem",
  props: {
    shortUrl: {
      type: Object,
      required: true
    }
  },
  methods: {
    copyUrl() {
      this.$refs["url-readonly"].select();
      document.execCommand("copy");

      setTimeout(() => {
        this.$root.$emit("bv::hide::popover");
      }, 5000);
    },
    resetUrl() {
      this.$emit("reset-shortUrl");
    }
  }
};
</script>
<style lang="scss" scoped>
.url-readonly {
  background-color: white !important;
}
</style>
