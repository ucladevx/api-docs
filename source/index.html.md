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

Through this RESTful interface, the UCLA Courses API provides you with all the registrar course data. Currently, enrollment statuses are not real time, but they do contain the correct number of total spots. This API is for the current school year, and does not contain any past years data. We currently only have Winter and Spring Course Data.

## Get Courses

```shell
curl -L "http://www.bruinscan.com/courses"
```

> The above command returns JSON structured like this:

```json
[
  {
    sections: "Lec 1|*|Dis 1A|*|Dis 1B|*|Dis 1C",
    instructors: "Bianchi, D.|*|TA|*|TA|*|TA",
    statuses: "Open 90 of 90 Left|*|Open 30 of 30 Left|*|Open 30 of 30 Left|*|Open 30 of 30 Left",
    locations: "Franz Hall 1178|*|Mathematical Sciences 7124B|*|Mathematical Sciences 7124A|*|Mathematical Sciences 7124A",
    day_times: "TR 9:30am-10:45am|*|T 2pm-2:50pm|*|T 3pm-3:50pm|*|W 12pm-12:50pm",
    quarter: "Spring",
    subject: "Atmospheric and Oceanic Sciences (A&O SCI)",
    course: "1 - Climate Change: From Puzzles to Policy",
    url: "https://sa.ucla.edu/ro/ClassSearch/Results?t=18S&sBy=subject&sName=Atmospheric+and+Oceanic+Sciences+%28A%26O+SCI%29&subj=A%26O+SCI&crsCatlg=1+-+Climate+Change%3A+From+Puzzles+to+Policy&catlg=0001&cls_no=%25&btnIsInIndex=btn_inIndex&btnIsExchange=False"
  },
  ...
]

```

This endpoint retrieves a list of courses. Provide no parameters to get all courses.

### HTTP Request

`GET http://www.bruinscan.com/courses`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
quarter   | false     | Filter by quarter (Fall, Winter, Spring, Summer)
subject   | false     | Filter by major, partial matches supported. Ex: Comp, Computer, Computer Science will all return courses with major "Computer Science (COM SCI)" (and maybe more)

----------------
# Events

Welcome to the Mappening Events API! We provide you with all the events happening now and in the future around UCLA. The easiest way to see this in action is to go the url [`http://api.ucladevx.com/v2/events`](http://api.ucladevx.com/v2/events) and receive all the events. See the explanation of the event object returned below. We offer many ways to search and filter these events through our api though you could do it yourself.

## Event Object
```json
{
  "features": [
    {
  "geometry": {
    "coordinates": [-118.44681959102,
      34.070367696979
    ],
    "type": "Point"
  },
  "id": "175752283196850",
  "properties": {
    "cover_picture": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/27021656_1621551394602436_6299488329760837839_o.jpg?oh=057a6b50a89f8a1fa3684c7c25563b86&oe=5B035F3D",
    "description": "LA Hacks is one of the biggest student-run hackathons on the West Coast, held every spring at UCLA’s iconic Pauley Pavilion. Over 1000 students from distinguished universities across the nation work together in teams to challenge themselves and create something beyond their comfort level - all in the span of 36 hours. Collaborate and build creative solutions to problems, while pushing the limits of your mind and body to make something amazing. From Evan Spiegel (CEO, Snapchat) and Sean Rad (CEO, Tinder), to 8 time gold medalist, Apolo Ohno, and a special pre-screening of HBO’s Silicon Valley, LA Hacks has welcomed many leaders and role models in tech. With industry mentors, technical workshops, and founder panels, LA Hacks works to broaden the scope of technology. EVENT DETAILS: Date: March 30th - April 1st, 2018 Location: Pauley Pavilion WHO WE ARE: LA Hacks epitomizes innovation, perseverance, and also pushing hackers to test their potential. We are UCLA students from many corners of campus, all united by one big goal: to give over 1000 college students the opportunity to come together and collaborate with industry leaders and innovative companies to develop impactful products with cutting-edge technologies.",
    "end_time": "2018-04-01T15:00:00-0700",
    "hoster": "LA Hacks",
    "is_canceled": false,
    "name": "LA Hacks 2018",
    "place": {
      "location": {
        "city": "Los Angeles",
        "country": "United States",
        "latitude": 34.070367696979,
        "longitude": -118.44681959102,
        "state": "CA",
        "street": "301 Westwood Plz",
        "zip": "90095"
      },
      "name": "Pauley Pavilion"
    },
    "start_time": "2018-03-30T16:00:00-0700",
    "stats": {
      "attending": 179,
      "interested": 1473,
      "maybe": 1473,
      "noreply": 293
    },
    "time_updated": "2018-03-25 19:10:07.585374"
  },
  "type": "Feature"
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
* **start_time**: string start time of event in the format `Sat, 17 Feb 2018 23:30:00 GMT-0800`
* **is_canceled**: boolean indicating event is canceled
* **duplicate_occurrence**: Boolean indicating this is a single event taking place on multiple days i.e a weekly farmers market, not a multiday event like a hackathon


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

`http://api.ucladevx.com/v2/events`<br/>
Simply return all future and present events at UCLA. Like all API calls returns a JSON with a feature key containing the array of GeoJSON events as shown.

`http://api.ucladevx.com/v2/events/search`<br/>
Allows search of all future and present events of UCLA. Allows queries of category, term in event name or description, and date start time using get url parameters. The strings are case insensitive.

Parameter | Required  | Description
--------- | -------   | -----------
category  | false     | Filter by category, check /categories to get list of potential categories
date      | false     | Filter by start_date, accepts almost any standard time formats
term      | false     | Filter by the prsence of the term in name and description of events

`http://api.ucladevx.com/v2/events/categories`<br/>
`http://api.ucladevx.com/v2/events/categories/<event_date>`<br/>
Checks which categories are available. Pass in a specific date in the url to only get the categories for events on that day. The parser will accept most standard date formats. Return categories in a JSON where the single 'categories' key has a list of category key value pairs

`http://api.ucladevx.com/v2/events/name/<event_name>`<br/>
Returns the single event that matches the event_name. The event object will be in the same format as above with a single event or no event. Pass the event_name in the url.

`http://api.ucladevx.com/v2/events/id/<event_id>`<br/>
Returns the single event that matches the id. The event object will be in the same format as above with a single event or no event. Pass the event_id in the url.
