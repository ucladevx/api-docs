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

# Dining

Through this RESTful interface, the UCLA Dining API provides you with all the data about dinning halls at UCLA. 

## Get overview menu

```shell
curl -L "https://api.ucla-eats.com/api/v1/menu/overviewMenu"
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

`GET https://api.ucla-eats.com/api/v1/menu/overviewMenu`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --

## Get detailed menu

```shell
curl -L "https://api.ucla-eats.com/api/v1/menu/detailedMenu"
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

`GET https://api.ucla-eats.com/api/v1/menu/detailedMenu`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --


## Get activity level

```shell
curl -L "https://api.ucla-eats.com/api/v1/menu/ActivityLevels"
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

`GET https://api.ucla-eats.com/api/v1/menu/ActivityLevels`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --


## Get hours

```shell
curl -L "https://api.ucla-eats.com/api/v1/menu/Hours"
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

`GET https://api.ucla-eats.com/api/v1/menu/Hours`

<!-- <button class="try-it">Try it out</button> -->

### Query Parameters

Parameter | Required  | Description
--------- | -------   | -----------
--        | --        | --



