---
title: DevX API Docs

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# DevX API

Welcome to the UCLA DevX API! You can use our API to access different data that from around campus that we have gathered.

# Courses

Through this RESTful interface, the UCLA Courses API provides you with all UCLA courses since Fall 2016.
## Get Courses

```shell
curl -L "http://api.ucladevx.com/courses"
```
> The above command returns JSON structured like this:

```json
[
  {
    major: "COM SCI",
    courseTitle: "Freshman Computer Science Seminar",
    courseNum: "COM SCI 1-1",
    quarter: "18F"
    professor: "Darwiche, Adnan"
  },
  ...
]
```

This endpoint retrieves a list of courses since Fall 2016.

### HTTP Request

`GET http://api.ucladevx.com/courses`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
quarter   | false     | Filter by quarter (Fall, Winter, Spring, Summer)
subject   | false     | Filter by major, partial matches supported. Ex: Comp, Computer, Computer Science will all return courses with major "Computer Science (COM SCI)" (and maybe more)

# Events

Welcome to the [bmaps.io](https://bmaps.io) Events API! We provide you with all the events happening now and in the future around UCLA. The easiest way to see this in action is to go the url [`http://api.ucladevx.com/events`](http://api.ucladevx.com/events) and receive all the events. See the explanation of the event object returned below. We offer ways to search and filter these events through our api OR you could do it yourself.

## Event Object
> Sample cURL requests:


```shell
curl -L "http://api.ucladevx.com/events"
curl -L "http://api.ucladevx.com/events/search?date=2020-02-23"
```

> The above commands returns JSON structured like this:

```json
{
  "features":
  [
  // ..... (returns array of events)
    {
      "geometry":{
          "coordinates":[
            -118.44679734261,
            34.070326200922
          ],
          "type":"Point"
      },
      "id":"1248256822042123",
      "properties":{
          "categories":[
            "CAUSE",
            "NETWORKING",
            "FILM"
          ],
          "cover_picture":"https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/82598205_2702290309861867_6876664617137864704_o.png?_nc_cat=103&_nc_ohc=QfTXZVDx2kwAX9b5oEj&_nc_ht=scontent.xx&oh=8e0d9e56e3792dbadf4713c56dbc106a&oe=5EFFB000",
          "description":"LA Hacks is one of the biggest student-run hackathons on the West Coast, held every spring at UCLA’s iconic Pauley Pavilion. Over 1000 students from distinguished universities across the nation work together in teams to challenge themselves and create something beyond their comfort level - all in the span of 36 hours. Collaborate and build creative solutions to problems, while pushing the limits of your mind and body to make something amazing.\n\nFrom Evan Spiegel (CEO, Snapchat) and Sean Rad (CEO, Tinder), to 8 time gold medalist, Apollo Ohno, and a special pre-screening of HBO’s Silicon Valley, LA Hacks has welcomed many leaders and role models in tech. With industry mentors, technical workshops, and founder panels, LA Hacks works to broaden the scope of technology.\n\nEVENT DETAILS:\n\nApplication Deadline: February 10th\nDate: March 27th - March 29th, 2020\nLocation: Pauley Pavilion \n\nWHO WE ARE:\n\nLA Hacks epitomizes innovation, perseverance, and also pushing hackers to test their potential. We are UCLA students from many corners of campus, all united by one big goal: to give over 1000 college students the opportunity to come together and collaborate with industry leaders and innovative companies to develop impactful products with cutting-edge technologies.",
          "end_time":"2020-03-29T15:00:00-0700",
          "free_food":False,
          "name":"LA Hacks 2020",
          "place":{
            "location":{
                "city":"Los Angeles",
                "country":"United States",
                "latitude":34.070326200922,
                "located_in":"464048593780958",
                "longitude":-118.44679734261,
                "state":"CA",
                "zipcode":"90045"
            },
            "name":"UCLA Pauley Pavilion"
          },
          "start_time":"2020-03-27T17:00:00-0700",
          "stats":{
            "attending":0,
            "interested":0,
            "maybe":0,
            "noreply":0
          }
      },
      "type":"Feature"
    },
    //.........
  ]

}
```

An **event** object is a [GeoJSON](http://geojson.org/) which means it has the following keys:

* **geometry**: with a type of "Point" and coordinates for latitude and longitude
* **id**: a unique id for this event
* **properties**: this contains all the event information and will be explored below
* **type**: always "Feature"

### Essential Event Properties

These properties must exist and have a valid value for every event.

* **name**: string of event's name
* **stats**: JSON for events from Facebook with attendance stats from at ~6 hour accuracy. Will have 4 keys 'attending', 'noreply', 'interested', and 'maybe' each with a integer value.
* **start_time**: string start time of event in the format `2020-02-22T08:00:00-0800`


### Potential Event Properties

These properties can exist, but are not guaranteed. Make sure to check for existence in the JSON before using.

* **description**: string description
* **hoster**: string name of event host
* **place**: JSON with a location key with another JSON. This inner location JSON contains a mandatory country, city, latitude, and longitude. There are a variety of other potential venue details such as name, street, or zip. See the example event.
* **cover_picture**: url to a photo for the event
* **ticket_uri**: url to the ticketing site
* **free_food**: YES/NO if event has free food. Currently just a strong NO. But will be updated as the Mappening team rolls out the autocategorization machine learning model.
* **end_time**: string end time of event in the format `Sat, 17 Feb 2018 23:30:00 GMT-0800`
* **time_updated**: last time event information was updated


## Event API

`http://api.ucladevx.com/events`<br/>
Returns all future and present events at UCLA (even includes limited past event data). JSON structure has a feature key containing the array of Event Objects as shown.

`http://api.ucladevx.com/events/search`<br/>
Allows search of all future and present events of UCLA. Allows queries of category, term in event name or description, and date start time using get url parameters. The strings are case insensitive.

Parameter | Required  | Description
--------- | -------   | -----------
date      | false     | Filter by start_date, accepts almost any standard time formats
term      | false     | Filter by the prsence of the term in name and description of events

`http://api.ucladevx.com/events/categories`<br/>
`http://api.ucladevx.com/events/categories/<event_date>`<br/>
Checks which categories are available. Pass in a specific date in the url to only get the categories for events on that day. The parser will accept most standard date formats. Return categories in a JSON where the single 'categories' key has a list of category key value pairs

`http://api.ucladevx.com/events/name/<event_name>`<br/>
Returns the single event that matches the event_name. The event object will be in the same format as above with a single event or no event. Pass the event_name in the url.

`http://api.ucladevx.com/events/id/<event_id>`<br/>
Returns the single event that matches the id. The event object will be in the same format as above with a single event or no event. Pass the event_id in the url.

# Dining

Through this RESTful interface, the UCLA Dining API provides you with all the data about dinning halls at UCLA.

## Get overview menu

```shell
curl -L "http://api.ucladevx.com/dining/menu/overviewMenu"
```

> The above command returns JSON structured like this:

```json
{
    menus: [
        {
        menuDate: "2018-04-02",
            detailedMenu: {
                breakfast: {
                    De Neve: {
                        Flex Bar: [
                            {
                                name: "Salvadorian Breakfast",
                                recipelink: "http://menu.dining.ucla.edu/Recipes/140219/1",
                                itemcodes: {
                                    V: "Vegetarian_Menu_Option",
                                    AMLK: "Contains_Dairy",
                                    AEGG: "Contains_Eggs",
                                    ASOY: "Contains_Soy"
                                },
                                nutrition: {
                                    serving_size: "Serving Size 1 each",
                                    Calories: "300",
                                    Fat_Cal.: "96",
                                    Total_Fat: ["10.7g","16%"],
                                    Saturated_Fat: ["2.6g","13%"],
                                    Trans_Fat: ["0.3g","-1"],
                                    Cholesterol: ["100.1mg","33%"],
                                    Sodium: ["437.2mg","18%"],
                                    Total_Carbohydrate: ["43.9g","34%"],
                                    Dietary_Fiber: ["3.3g","13%"],
                                    Sugars: ["10.4g","-1"],
                                    Protein: ["8g","-1"],
                                    Vitamin A: "26%",
                                    Vitamin C: "37%",
                                    Calcium: "5%",
                                    Iron: "11%",
                                    ingredients: "Fried Plantains (Plantain, Olive Oil Blend), Eggs, Water, Corn Tortilla, Rice, Black Beans (Black Beans, Sea Salt, Granulated Garlic, Granulated Onion, Cumin), Tomato, Onion, Sour Cream, Green Onion, Green Bell Pepper, Red Bell Pepper, Onion, Olive Oil Blend, Trans-Fat Free Margarine, Olive Oil Blend, Sea Salt, Sea Salt, Sea Salt, Pepper, Pepper",
                                    allergens: "Milk, Eggs, Soybeans"
                                }
                            },
                            ....
                        ]
                    },
                    ....
                },
                lunch: {
                    ...
                },
                dinner: {
                    ...
                }

            }
        }
        ...
    ]
}
```

This endpoint retrieves a list of overview menu for each dining hall for 7 days (starting from today). No parameter is needed. Note that in nutrition part, the first value indicates the mass and the second value indicates the percentage. If a value is not available, it is denoted by "-1"

### HTTP Request

`GET http://api.ucladevx.com/dining/menu/overviewMenu`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --

## Get detailed menu

```shell
curl -L "http://api.ucladevx.com/dining/menu/detailedMenu"
```

> The above command returns JSON structured like this:

```json
{
    menus: [
        {
        menuDate: "2018-04-02",
            detailedMenu: {
                breakfast: {
                    De Neve: {
                        Flex Bar: [
                            {
                                name: "Salvadorian Breakfast",
                                recipelink: "http://menu.dining.ucla.edu/Recipes/140219/1",
                                itemcodes: {
                                    V: "Vegetarian_Menu_Option",
                                    AMLK: "Contains_Dairy",
                                    AEGG: "Contains_Eggs",
                                    ASOY: "Contains_Soy"
                                },
                                nutrition: {
                                    serving_size: "Serving Size 1 each",
                                    Calories: "300",
                                    Fat_Cal.: "96",
                                    Total_Fat: ["10.7g","16%"],
                                    Saturated_Fat: ["2.6g","13%"],
                                    Trans_Fat: ["0.3g","-1"],
                                    Cholesterol: ["100.1mg","33%"],
                                    Sodium: ["437.2mg","18%"],
                                    Total_Carbohydrate: ["43.9g","34%"],
                                    Dietary_Fiber: ["3.3g","13%"],
                                    Sugars: ["10.4g","-1"],
                                    Protein: ["8g","-1"],
                                    Vitamin A: "26%",
                                    Vitamin C: "37%",
                                    Calcium: "5%",
                                    Iron: "11%",
                                    ingredients: "Fried Plantains (Plantain, Olive Oil Blend), Eggs, Water, Corn Tortilla, Rice, Black Beans (Black Beans, Sea Salt, Granulated Garlic, Granulated Onion, Cumin), Tomato, Onion, Sour Cream, Green Onion, Green Bell Pepper, Red Bell Pepper, Onion, Olive Oil Blend, Trans-Fat Free Margarine, Olive Oil Blend, Sea Salt, Sea Salt, Sea Salt, Pepper, Pepper",
                                    allergens: "Milk, Eggs, Soybeans"
                                }
                            },
                            ....
                        ]
                    },
                    ....
                },
                lunch: {
                    ...
                },
                dinner: {
                    ...
                }

            }
        }
        ...
    ]
}
```

This endpoint retrieves a list of detailed menu for each dining hall for 7 days (starting from today). No parameter is needed. Note that in nutrition part, the first value indicates the mass and the second value indicates the percentage. If a value is not available, it is denoted by "-1"

### HTTP Request

`GET http://api.ucladevx.com/dining/menu/detailedMenu`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --


## Get activity level

```shell
curl -L "http://api.ucladevx.com/dining/menu/ActivityLevels"
```

> The above command returns JSON structured like this:

```json
{
    level: {
        Covel: "35%",
        De Neve: "30%",
        FEAST at Rieber: "40%",
        Bruin Plate: "38%"
    }
}

```

This endpoint retrieves a JSON that has the current activity level for all 4 dining halls. Note that if the dining hall is closed, the activity level is denote by "-1%".

### HTTP Request

`GET http://api.ucladevx.com/dining/menu/ActivityLevels`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --


## Get hours

```shell
curl -L "http://api.ucladevx.com/dining/menu/Hours"
```

> The above command returns JSON structured like this:

```json
[
    {
        hourDate: "2018-04-01",
        hours: [
            {
                hall_name: "Covel",
                breakfast: "CLOSED",
                lunch: "CLOSED",
                dinner: "5:00 pm - 9:00 pm",
                late_night: "CLOSED"
            },
            {
                hall_name: "De Neve",
                breakfast: "CLOSED",
                lunch: "CLOSED",
                dinner: "5:00 pm - 8:00 pm",
                late_night: "9:00 pm - 1:00 am"
            },
            {
                hall_name: "FEAST at Rieber",
                breakfast: "CLOSED"
            },
            {
                hall_name: "Bruin Plate",
                breakfast: "CLOSED",
                lunch: "CLOSED",
                dinner: "5:00 pm - 8:00 pm",
                late_night: "CLOSED"
            },
            {
                hall_name: "Bruin Café",
                breakfast: "CLOSED",
                lunch: "CLOSED",
                dinner: "5:00 pm - 9:00 pm",
                late_night: "9:00 pm - 12:00 am"
            },
            {
                hall_name: "Café 1919",
                breakfast: "CLOSED"
            },
            {
                hall_name: "Rendezvous",
                breakfast: "CLOSED",
                lunch: "CLOSED",
                dinner: "5:00 pm - 8:00 pm",
                late_night: "CLOSED"
            },
            {
                hall_name: "De Neve Grab 'n' Go",
                breakfast: "CLOSED"
            },
            {
                hall_name: "The Study at Hedrick",
                breakfast: "CLOSED",
                lunch: "CLOSED",
                dinner: "5:00 pm - 9:00 pm",
                late_night: "9:00 pm - 2:00 am"
            }
        ]
    },
  ...
]
```

This endpoint retrieves a list of hours of operations for each dining hall and cafe for 7 days (starting from today). If a dining hall or a cafe is closed, it is denoted with a "CLOSED".

### HTTP Request

`GET http://api.ucladevx.com/dining/menu/Hours`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --
