---
id: api-routes
title: Routes
sidebar_label: Routes
---

This API follows the REST (REpresentational State Transfer) architecture and return data in JSON (JavaScript Object Notation) format.

________________________________________________________________

## Endpoints
- `/api/auth`: authentication verification
- `/api/users`: user creation and information
- `/api/patients`: data from admission to discharge
- `/api/relays`: data from devices

When interacting with API, header must contain:

- `Content-type: application/json`
- `x-auth-token: token`: (when applicable :lock:)

________________________________________________________________
## `auth`

### 🔒 GET `/api/auth`

**Response**
```json
{
  "preferences": {
  "pulse": {
    "danger": {
      "minLevel": 60,
      "maxLevel": 180
    },
    "warning": {
      "minLevel": 80,
      "maxLevel": 172
    }
  },
  "oxygensat": {
    "danger": {
      "minLevel": 0.5,
      "maxLevel": 2
    },
    "warning": {
      "minLevel": 0.7,
      "maxLevel": 1.7
    }
  },
  "_id": "5d8e59e7419ed60a9434ca77",
  "firstname": "John",
  "lastname": "Travolta",
  "institution": "Pulp Fiction",
  "jobtitle": "Superstar",
  "email": "test@test.com",
  "date": "2019-09-27T18:50:15.149Z",
  "__v": 103
}
```

### POST `/api/auth`

❗️`email` and `password`

**Request**
```json
{
	"email": "dan@chua.com",
	"password": "dan123"
}
```
**Response**
```json
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2c2VyIjp7ImlkIjoiNWQ4ZTU5ZTc0MTllZDYwYTk0MzRjYTc3In0sImlhdCI6MTU3MDQ0MDA0NSwiZXhwIjoxNjAxOTc2MDQ1fQ.5MlUZdOvwjjZK3r6ol19C83apfVCd4OQhr6Pc9saXv8"
}
```

________________________________________________________________
## `users`

### POST `/api/auth`

❗️`firstname`, `lastname`, `institution`, `jobtitle`, `email` and `password`

**Request**
```json
{
	"firstname": "Dan",
	"lastname": "Duncan",
	"institution": "Eagle Hospital",
	"jobtitle": "Head of Surgery",
	"email": "ean@chua.com",
	"password": "12345",
	"preferences" : {
		"oxygensat"     : {
			"danger"  : {
				"minLevel" : 0.43,
				"maxLevel" : 2.1111
			},
			"warning" : {
				"minLevel" : 0.7,
				"maxLevel" : 1.8765
			}
		}
	}
}
```
> `"preferences"` can be provided if necessary, but they can be easily updated on the `PUT` method. If not provided, default values are:
```json
"preferences" : {
	"oxygensat"     : {
		"danger"  : {
			"minLevel" : 0.5,
			"maxLevel" : 2.0
		},
		"warning" : {
			"minLevel" : 0.7,
			"maxLevel" : 1.7
		}
	},
	"pulse"     : {
		"danger"  : {
			"minLevel" : 60,
			"maxLevel" : 180
		},
		"warning" : {
			"minLevel" : 80,
			"maxLevel" : 160
		}
	}
```
**Response**
```json
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImakIjoiNWQ5YjBiZmE4N2I5NTMxMTFiOGI5MTBlIn0sImlhdCI6MTU3MDQ0MjIzNCwiZXhwIjoxNjAxOTc4MjM0fQ.Hot04y_oSsdI8zU8KtsD_KGUVVbDfjiK5P_cBMBaa6k"
}
```

### 🔒 PUT `/api/users`

❗️`firstname`, `lastname`, `institution`, `jobtitle`, `email` and `password`

> **Request and response are the same as the `POST` method.**

### 🔒 DELETE `/api/users`

**Response**
```json
{
    "msg": "User Removed"
}
```
________________________________________________________________
## `patients`

### 🔒 GET `/api/patients`

**Response**
```json
"devices": [
	{
		"patient":
		{
			"status": "admitted",
			"admission": "2019-10-07T08:16:34.619Z",
			"firstname": "Clark",
			"lastname": "Kent",
			"observation": "Eat a kryptonite"
		},
		"measures": [
			{
				"_id": "5d9b10fb04f4a117aa9f6b08",
				"pulse": 0.34,
				"oxygensat": 0.011,
				"date": "2019-10-07T10:18:35.501Z"
			}
		],
		"_id": "5d9af462954ad200175a19b8"
	},
	{"patient":{}, "measures":[{}], "_id": "String"}
]
```

### 🔒 GET `/api/patients/:_id`

**Response**
```json
{
    "patient": {
        "status": "admitted",
        "admission": "2019-10-07T10:29:21.609Z",
        "firstname": "Clark",
        "lastname": "Kent",
        "observation": "Eat a kryptonite"
    },
    "measures": [
        {
            "_id": "5d9b148204f4a117aa9f6b0a",
            "pulse": 0.34,
            "oxygensat": 0.011,
            "date": "2019-10-07T10:33:38.457Z"
        }
    ],
    "_id": "5d9b138104f4a117aa9f6b09"
}
```

### 🔒 POST `/api/patients`

❗️`firstname` and `lastname`

**Request**
```json
{
	"firstname": "Jack",
	"lastname": "Sparrow",
	"observation": "Felt from boat"
}
```

**Response**
```json
{
    "patient": {
        "status": "admitted",
        "firstname": "Jack",
        "lastname": "Sparrow",
        "observation": "Felt from boat",
        "admission": "2019-10-07T10:41:02.244Z"
    },
    "_id": "5d9b163e04f4a117aa9f6b0c",
    "measures": []
}
```

### 🔒 PUT `/api/patients/:_id`
❗️`status`, `firstname` and `lastname`

**Request**
```json
{
	"status": "surgery",
	"firstname": "Jack",
	"lastname": "Sparrow",
	"observation": "Felt from boat; Broken arm, intervention on Room 2"
}
```

**Response**
```json
{
    "patient": {
        "status": "surgery",
        "firstname": "Jack",
        "lastname": "Sparrow",
        "observation": "Felt from boat; Broken arm, intervention on Room 2",
        "admission": "2019-10-07T10:44:58.468Z"
    },
    "_id": "5d9b172a04f4a117aa9f6b0d",
    "measures": []
}
```

### 🔒 DELETE `/api/patients/:_id`

**Response**
```json
[
	{
		"patient": {
			"status": "admitted",
			"admission": "2019-10-07T10:29:21.609Z",
			"firstname": "Clark",
			"lastname": "Kent",
			"observation": "Eat a kryptonite"
		},
		"measures": [
			{
				"date": "2019-10-07T10:33:38.457Z",
				"_id": "5d9b148204f4a117aa9f6b0a",
				"pulse": 0.34,
				"oxygensat": 0.011
			}
		],
		"_id": "5d9b138104f4a117aa9f6b09"
	}
]
```
________________________________________________________________
## `relays`

### 🔒 GET `/api/relays`

**Response**
```json
[
	{
		"patient": {
			"status": "admitted",
			"admission": "2019-10-07T10:29:21.609Z",
			"firstname": "Clark",
			"lastname": "Kent",
			"observation": "Eat a kryptonite"
		},
		"measures": [
			{
				"date": "2019-10-07T10:33:38.457Z",
				"_id": "5d9b148204f4a117aa9f6b0a",
				"pulse": 0.34,
				"oxygensat": 0.011
			}
		],
		"_id": "5d9b138104f4a117aa9f6b09"
	}
]
```

### 🔒 PUT `/api/relays`

> Measurement is added to the beginning of the `measures` vector. So that `measures[0]` is always the most up-to-date information on a patient.

**Request**
```json
{
	"id": "5d9b138104f4a117aa9f6b09",
	"pulse": 0.54,
	"oxygensat": 0.211
}
```
**Response**
```json
{
	"patient":
	{
		"status": "admitted",
		"admission": "2019-10-07T10:29:21.609Z",
		"firstname": "Clark",
		"lastname": "Kent",
		"observation": "Eat a kryptonite"
	},
	"measures": [
		{
			"_id": "5d9b19e504f4a117aa9f6b0f",
			"pulse": 0.54,
			"oxygensat": 0.211,
			"date": "2019-10-07T10:56:37.101Z"
		},
		{
			"date": "2019-10-07T10:33:38.457Z",
			"_id": "5d9b148204f4a117aa9f6b0a",
			"pulse": 0.34,
			"oxygensat": 0.011
		}
	],
	"_id": "5d9b138104f4a117aa9f6b09"
}
```
________________________________________________________________


## Definitions

| 📖 |Definitions                        |
| -- |:----------------------------------|
| 🔒 | Authorization required through JWT|
| ❗️ | Required fields                   |