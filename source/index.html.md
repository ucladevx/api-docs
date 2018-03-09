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

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
quarter   | false     | Filter by quarter (Fall, Winter, Spring, Summer)
subject   | false     | Filter by major, partial matches supported. Ex: Comp, Computer, Computer Science will all return courses with major "Computer Science (COM SCI)" (and maybe more)


