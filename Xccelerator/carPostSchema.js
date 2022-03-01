var mongoose = require('mongoose')
var Schema = mongoose.Schema

var carPost = new Schema({   // defines a new data object of what the car post will hold

    make: String,
    color: String,
    latitude: Number,
    longitude: Number

})

const data = mongoose.model("data", carPost)   // creates a data object which is a carPost schema
module.exports = data  // allows us to access the carPost schema from the server.js file