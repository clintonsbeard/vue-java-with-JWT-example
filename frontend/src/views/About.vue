<template>
  <div class="about">
    <h1>This is an about page</h1>
    <h1 v-if="isAdmin()">You're an Admin</h1>
    <ul>
      <li v-for="(item, index) in itemList" v-bind:key="index">{{ item }}</li>
    </ul>
  </div>
</template>

<script>
import auth from '../auth';

export default {
  name: 'about',
  components: {},
  itemList: [],
  methods: {
    isAdmin() {
      if (auth.getUser().rol == 'admin') {
        return true;
      }
      return false;
    }
  },
  created() {
    /* Example of how to pass the JWT Token in your Fetch requests
       the process is the same for all requests, after Login:  GET, POST, PUT, DELETE

      The Authorization header is required, it needs to be 'Bearer ' + the token
      so it will alway be this line.  You can cut and paste this header section, and the
      credentials to each fetch you make to the APIs that required Authentication

      credentials: 'same-origin' tell the API server that it created the token
    */
    fetch(`${process.env.VUE_APP_API_URL}/api/list`, {
        method: 'GET',
        headers: new Headers({
          Authorization: 'Bearer ' + auth.getToken(),   
        }),
        credentials: 'same-origin',  
      })
      .then((response) => {
        return response.json();
      })
      .then((items) => {
        this.itemList = items;
      })
      .catch((err) => console.error(err));
  }
}
</script>
