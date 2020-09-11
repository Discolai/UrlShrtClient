<template>
  <div>
    <a v-bind:href="shortUrl.shortUrl">{{ shortUrl.shortUrl }}</a>
    =>
    <a v-bind:href="shortUrl.redirectUrl">{{ shortUrl.redirectUrl }}</a>
  </div>
</template>
<script>
export default {
  name: "ShortUrlItem",
  props: ["shortUrl"]
};
</script>
<style lang="scss" scoped></style>
