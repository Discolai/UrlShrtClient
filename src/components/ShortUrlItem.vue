<template>
  <div class="h3 text-center mt-4">
    <b-link :href="shortUrl.shortUrl">{{ shortUrl.shortUrl }}</b-link>
    <span class="mx-3">&rarr;</span>
    <b-link :href="shortUrl.redirectUrl">{{ shortUrl.redirectUrl }}</b-link>
  </div>
</template>
<script>
export default {
  name: "ShortUrlItem",
  props: ["shortUrl"]
};
</script>
<style lang="scss" scoped></style>
