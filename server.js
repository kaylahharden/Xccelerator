// reference: https://www.youtube.com/watch?v=vKCdVAg5h40&list=RDCMUC2D6eRvCeMtcF5OGHf1-trw&start_radio=1&rv=vKCdVAg5h40&t=514

const express = require('express')
const res = require('express/lib/response')
const mongoose = require('mongoose')

var app = express()  // creates an express object to be used throughout

// make a schema: an object/template that holds or data = carPostSchema.js
var Data = require('./carPostSchema')  // accesses the object created in the carPost schema

mongoose.connect("mongodb://localhost/postedCars")  // mongoose will connect to mongoDB and go to the postedCars folder

mongoose.connection.once("open", function(){   // once we are connected to the database, it will print out this message

    console.log("Connected to database!")

}) .on('error', function(error){

    console.log("Failed to connect: " + error)  // prints out the error message if we encounter one

})

// route to create a carPost (POST request)
app.post("/create", function(request, response){  // sends a POST request that will create a new post
    // 'request' holds the data we are getting from the app (car make, color)
    // 'response' holds the data we are going to send back to the app

    var carPost = new Data({   // create a new carPost object that we imported from the Schema

        make: request.get("make"),
        color: request.get("color")

    })

    carPost.save().then(function(){    // once it is saved, the .then function will be called

        if (carPost.isNew ==  false){     // .isNew returns false if the data was saved in the database an on the server
            console.log("Car post was saved!") 
            response.send("Car post was saved!")   // confirmation message is also sent to the app
        } 
        else{
            console.log("Failed to save car post")
            response.send("Failed to save car post")
        }
    })  
})

// route to get all carPosts (GET request)
app.get("/fetch", function(request, response){
    Data.find({}).then(function(dbPosts){    // finds everything in the database
        response.send(dbPosts)   // responds by sendin all the posts
    })   
    // this is where we would refine the search in the brackets (ex. specific to location, color, make, ...)
})


// route to delete a carPost (POST request)
app.post("/delete", function(request, response){
    Data.findOneAndRemove({  // we are going to identify each note by the id
        _id: request.get("id")   // gets the specific error id that we want to delete by
    }, function(error){
        if (error == null){
            console.log("Error is null, still deleted: " + error)
        }else{
            console.log("Failed to delete: " + error)
        }
    })
    response.send("Deleted!")
})

// route to update a carPost (POST request)
app.post("/update", function(request, response){
    Data.findByIdAndUpdate({ //specifies the first object we want to update (by id)
        _id: request.get("id")
    }, {  // sends the new data back to the server
        make: request.get("make"),
        color: request.get("color")
    }, function(error){
        if (error == null){
            console.log("Error is null, still updated: " + error)
        }else{
            console.log("Failed to update: " + error)}
    })
    response.send("Updated!")
})


// http://10.84.115.109:8084/create
var server = app.listen(8084, "10.84.115.109", function(){     // listens on specified port number on my ip address
    console.log("Server is running...")
})  