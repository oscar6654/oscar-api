var blocmetrics = {};


  blocmetrics.report = function(eventName){
    var event = { name: eventName };
    var request = new XMLHttpRequest();
    request.open("POST", "http://oscar-api.herokuapp.com/api/events", true);
    //request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.onreadystatechange = function(){};
    request.send(JSON.stringify(event));
  }

// // curl -v -H "Accept: application/json" -H "Origin: http://registered_application.com" -H "Content-Type: application/json" -X POST -d '{"name":"foobar"}'  http://localhost:3000/api/events
