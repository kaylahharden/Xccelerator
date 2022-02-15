var mongoose = require('mongoose');
var Schema = mongoose.Schema

var userSchema = new Schema({                       //new datd object of user login info
    email: String,
    password: String
});

const User = mongoose.model("myuser", userSchema);   // creates a data object which is a userSchema
module.exports = myuser;                               // allows us to access the userschema from the server.js file
