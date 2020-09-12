// Load the AWS SDK for Node.js
const AWS = require('aws-sdk');
// Set the region 
AWS.config.update( {
  region: 'ap-southeast-2',
  endpoint: "http://localhost:4566"
});

// Create the DynamoDB service object
const ddb = new AWS.DynamoDB({apiVersion: '2012-08-10'});

const timeNow = (new Date()).getTime();

const params = {
  TableName: 'device-stats',
  Item: {
    'deviceId' : {S: 'mc-home'},
    'timestampEpochKey' : {N: timeNow.toString() },
    'speed' : {N: "4324325"}
  }
};

// Call DynamoDB to add the item to the table
// ddb.putItem(params, function(err, data) {
//   if (err) {
//     console.log("Error", err);
//   } else {
//     console.log("Success", data);
//   }
// });


ddb.putItem(params).promise()
  .then(function(data) {
    console.log("Success", data);
  })
  .catch(function(err) {
    console.log("Error", err);
  });

