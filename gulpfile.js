/* eslint-env node */

require("babel-register");

var tasks = require("path").join(__dirname, "tasks");

require("fs").readdirSync(tasks).forEach(function(file) {
  require("./tasks/" + file);
});
