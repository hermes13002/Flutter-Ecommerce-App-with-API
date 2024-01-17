# FakeStore API

Basic implementation of fetching and displaying data from API in flutter app
* write a method to fetch data from API
* call the method to give us the API response (JSON)
* create a model class for the JSON response for parsing the JSON response to a dart object
* create a listview builder wrapped inside a future builder
* pass the dart object details into the listview builder

We use a method to get the API response, then we use a model class to convert the API response to a dart object, map the JSON keys into the model class fields, we write a function to fetch data from API, in our function which returns Future<List<Product>>, our function returns in the future, a list and each element is of type Product, after this, we use FutureBuilder to build on data and insert ListView.builder in it to display the data.

![Screenshot_1705472525](https://github.com/hermes13002/Flutter-Ecommerce-App-with-API/assets/82550064/28e3f005-6921-46aa-bd79-daf2f3efff4a)
![Screenshot_1705472514](https://github.com/hermes13002/Flutter-Ecommerce-App-with-API/assets/82550064/035a0689-2c42-4afb-8c95-948dd608051f)
![Screenshot_1705472486](https://github.com/hermes13002/Flutter-Ecommerce-App-with-API/assets/82550064/44f3470a-a0e4-445b-83aa-8a074c5a4d3c)
