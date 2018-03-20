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

Welcome to the Mappening Events API! We provide you with all the events happening now and in the future around UCLA. The easiest way to use this is to simply go to the url `api.ucladevx.com/events` and receive all the events. See the explanation of the event object returned below. We offer many ways to search and filter these events through our api though you could do it yourself.

## Event Object
```json
    {
      "geometry": {
        "coordinates": [
          -118.451994,
          34.071474
        ],
        "type": "Point"
      },
      "id": "1766863560001661",
      "properties": {
        "category": "<NONE>",
        "cover_picture": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/27356375_1972757046097696_6206118120755555565_o.jpg?oh=2240b43f536e76f9cf00410f602af386&oe=5B136061",
        "description": "Hack on the Hill IV (HOTH) is a 12 hour, beginner-friendly hackathon designed to give beginners a glimpse into what a real hackathon would be and feel like. During HOTH, there are workshops, mentors, and amazing prizes for the best hacks. As a sequel to HOTH III, HOTH IV features double the attendance and hacking tracks hosted by different ACM committees. We are also excited to announce that we'll be providing select hardware for hacking as well! LEARN MORE AND SIGN-UP HERE (applications close 2/10 at midnight): https://hoth.splashthat.com/ Sponsored by IS Associates, a UCLA-sponsored organization that provides an educational forum for the management and understanding of information technology. Learn more at: https://isassociates.ucla.edu",
        "duplicate_occurrence": "NO",
        "end_time": "Sat, 17 Feb 2018 23:30:00 GMT-0800",
        "event_name": "ACM Hack | Hack on the Hill IV",
        "free_food": "NO",
        "hoster": {
          "id": "369769286554402",
          "name": "UCLA Class of 2020"
        },
        "is_cancelled": false,
        "start_time": "Sat, 17 Feb 2018 08:30:00 GMT-0800",
        "stats": {
          "attending": 97,
          "interested": 199,
          "maybe": 199,
          "noreply": 107
        },
        "ticketing": {
          "ticket_uri": "https://hoth.splashthat.com/"
        },
        "venue": {
          "id": "955967887795957",
          "location": {
            "city": "Los Angeles",
            "country": "United States",
            "latitude": 34.071474,
            "longitude": -118.451994,
            "state": "CA",
            "street": "330 De Neve Dr Ste L-16",
            "zip": "90024"
          },
          "name": "Carnesale Commons"
        }
      },
      "type": "Feature"
    }
```

An *event* object is a [GeoJSON](http://geojson.org/) which means it has the following keys:

* *geometry*: with a type of "Point" and coordinates for latitude and longitude
* *id*: a unique id for this event
* *properties*: this contains all the event information and will be explored below
* *type*: always "Feature"

### Essential Event Properties

These properties must exist and have a valid value for every event.

* *event_name*: string of event's name
* *stats*: JSON for events from Facebook with attendance stats from at ~6 hour accuracy. Will have 4 keys 'attending', 'noreply', 'interested', and 'maybe' each with a integer value.
* *start_time*: string start time of event in the format `Sat, 17 Feb 2018 23:30:00 GMT-0800`
* *is_cancelled*: boolean indicating event is cancelled

### Potential Event Properties

These properties must exist in every event, but will often be marked with `<NONE>` if there is no valid value. So be sure to check for `<NONE>` values in your code and properly handle it.

* *description*: string description
* *venue*: JSON with a location key with another JSON. This inner location JSON contains a mandatory country, city, latitude, and longitude. There are a variety of other potential venue details such as name, street, or zip. See the example event.
* *cover_picture*: url to a photo for the event
* *ticketing*: JSON with a single ticket_uri element with a url to the ticketing site or <NONE>
* *end_time*: string end time of event in the format Sat, 17 Feb 2018 23:30:00 GMT-0800
* *free_food*: YES/NO if event has free food. Currently just a strong NO. But will be updated as the Mappening team rolls out the autocategorization machine learning model.
* *end_time*: string start time of event in the format `Sat, 17 Feb 2018 23:30:00 GMT-0800`
