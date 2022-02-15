var mongoose = require('mongoose');
var Schema = mongoose.Schema

var userSchema = new Schema({                       //new object of user login info
    email: String,
    password: String
});

const User = mongoose.model("myuser", userSchema);   // creates a data object which is a userSchema
module.exports = User;                               // allows us to access the cuserschema from the server.js file
