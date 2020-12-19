function ApiGet()
{
  fetch('https://jsonplaceholder.typicode.com/users')
   .then(response => response.json())
   .then(json => console.log(json))
}



function ApiPost()
{
 fetch('https://jsonplaceholder.typicode.com/todos', {
 method: 'POST',
 body: JSON.stringify({
 name: "Taylor",
 surname: "Swift"
 }),
 headers: {
 "Content-type": "application/json"
 })
 .then(response => response.json())
 .then(json => console.log(json))
}



function ApiGet2()
{
  const userAction = async () => {
   const response = await fetch('http://example.com/movies.json');
   const myJson = await response.json(); //extract JSON from the http response
   // do something with myJson
 }
}




function ApiPost2()
{
  const userAction = async () => {
    const response = await fetch('http://example.com/movies.json', {
      method: 'POST',
      body: myBody, // string or object
      headers: {
        'Content-Type': 'application/json'
      }
    });
    const myJson = await response.json(); //extract JSON from the http response
    // do something with myJson
  }

}
