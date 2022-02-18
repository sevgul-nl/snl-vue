<template>
  <div id="app">
    <div class="container page p-4">
      <h4 class="bg-primary text-white text-center p row">
        <span class="text-center">Projects</span>
      </h4>
      <div class="row">
        <div class="col font-weight-bold">Task</div>
        <div class="col-6 text-center font-weight-bold">Done</div>
      </div>
      <div class="row" v-for="t in completedProjects" v-bind:key="t.action">
        <div class="col">{{ t.project }}</div>
        <div class="col-6 text-center">
          <input
            type="checkbox"
            v-model="t.completed"
            class="form-check-input"
          />
        </div>
      </div>
      <div class="row py-2">
        <div class="col">
          <input v-model="newProject" class="form-control" />
        </div>
        <div class="col-6">
          <button class="btn btn-primary" v-on:click="addProject">Add</button>
        </div>
      </div>
      <div class="row bg-info py-1 mt text-white">
        <div class="col text-center">
          <input
            type="checkbox"
            v-model="hideCompleted"
            class="form-check-input"
          />
          <label class="form-check-label font-weight-bold">
            Hide completed
          </label>
        </div>
        <div class="col text-center">
          <button class="btn btn-sm btn-warning" v-on:click="deleteCompleted">
            Delete Completed
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "app",

  data() {
    return {
      projects: [
        { project: "Vue.js Application", completed: false },
        { project: "React  Spring Boot SPA ", completed: false },
        { project: "Spring e-shop", completed: false },
      ],
      hideCompleted: true,
      msg: "baki was here !...",
    };
  },
  computed: {
    completedProjects() {
      return this.hideCompleted
        ? this.projects.filter((t) => !t.completed)
        : this.projects;
    },
  },
  methods: {
    addProject() {
      this.projects.push({
        project: this.newProject,
        completed: false,
      });
      this.newProject = "";
    },
    deleteCompleted() {
      this.projects = this.projects.filter((t) => !t.completed);
    },
  },
};
</script>