const express = require("express");
const bodyParser = require('body-parser')

const app = express();
app.use(bodyParser.text({type: "*/*"}));

app.post("/", function(req, res) {
  const target = process.env.TARGET || "World";
  res.send("Hello, " + req.body + "!");
});

const port = process.env.PORT || 8080;
app.listen(port, function() {
  console.log("Server started on port", port);
});