---
id: git-dev-environment
title: Dev Environment
sidebar_label: Dev Environment
---

> We use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) and [here](git-gitflow) you can find detailed info from clone to pull requests.

> This section is specific for setup the developer environment for the **[WebApp](github.com/ProjSante/webapp)**, for other environments consult the appropriate section on the navigation bar on the left side.

You need to setup your developer environment if you want to test, implement and contribute. Here's how you do it.

## TL;DR

1. Install tools 🔧
	1. Dev: [git](https://git-scm.com/) and [node](https://nodejs.org/)
	2. Test: [Postman](https://www.getpostman.com/) (*suggestion)
2. _Git_ a copy of the [webapp](github.com/ProjSante/webapp)
	1. Fork - [webapp repo](github.com/ProjSante/webapp) ➡️ `github.com/<your_user>/webapp`
	2. Clone - `github.com/<your_user>/webapp` ➡️ 🤓💻
	3. Add `upstream remote` - 🤓💻 ➡️ [github.com/ProjSante/webapp](github.com/ProjSante/webapp)
3. Setup Database: ☁️
	- Get a connection string on [Mongo DB Atlas](https://cloud.mongodb.com/user#/atlas/login)
4. Setup config: 🔒
	- Create `config/keys-dev.js` and export `mongoURI` and `jwtSecret`
5. npm install
	- On server and client
6. npm run dev
	- On server to launch localhost:3000
7. Test API: Postman _*suggestion_
8. Deploy Heroku
9. Do your Magic 🎩

<hr />

## 1. Install Tools 🔧
When using **Github** from the command line you can either use `HTTPS` or `SSH`. The advantage of using `SSH` is that you don't need to insert id and password with the commands and the links are different
```sh
# HTTPS exemple
$ https://github.com/ProjSante/webapp.git
# SSH example
$ git@github.com:ProjSante/webapp.git
```
> Even if they are equivalent, we are going to use **SSH**. Adjust accordingly.

`SSH` is advised over HTTPS, go [here](https://help.github.com/en/articles/connecting-to-github-with-ssh) to setup your keys

## 2. _Git_ a Copy
There are 3 places were the code is stored:

- **upstream** - Which is the original `upstream` repository in Github
- **origin** - `github.com/<your_user>/webapp`: Which is your copy of the repository
- **local** - 🤓💻: Which is you local copy `wokstation`

To do so:

1. **Fork**: [upstream](github.com/ProjSante/webapp) ➡️ `github.com/<your_user>/webapp`
 by clicking on **fork** button on the top right corner of [upstream](https://github.com/ProjSante/webapp)

2. **Clone**: `github.com/<your_user>/webapp` ️️➡️️️️ 🤓💻

```sh
# Go to where you want to download the project
$ cd ../path/to/projects
# Copy from your github repo to ../path/to/projects
$ git clone git@github.com:<your_user>/webapp.git
# cd inside webapp
$ cd webapp
```

3. Add `upstream` 🤓💻 ↔️ [github.com](github.com)ProjSante/webapp

See the git connections you can make with your machine
```sh
$ git remote -v
```
Usualy you have `origin`, which is `github.com/<your_user>/webapp`
 
Now, you need to stablish a connection between your machine and the [upstream](github.com/ProjSante/webapp).
This is necessary because others will contribute to the project, so you need a way to update your local files with those modifications

```sh
$ git remote add upstream git@github.com:ProjSante/webapp.git
```

Verify it by
```sh
$ git remote -v
```
You will see `origin` and `upstream`.

If it has been a long time you did the `clone` you can update you local machine by doing 
```sh
# Fetch everything from the original project and merge it in my local machine
$ git pull upstream develop

# Make also sure your Github repo is updated
$ git push origin develop
```

## 3. **Setup Database**: ☁️

If you want to interact with the database through register, login, admit patient, etc. you need to configure the database connection.
It consists on creating your **connection string**, which has the following format:

```js
mongodb+srv://<db-user>:<password>@webapp-vx27f.mongodb.net/test?retryWrites=true&w=majority
```
The database used in this project is [mongoDB](https://www.mongodb.com/) and we use [mongoose](https://mongoosejs.com/) library to make things easier.

So, in order to get your connection string you need to create an account on the [Mongo DB Atlas](https://cloud.mongodb.com/user#/atlas/login). This is the official MongoDB service for hosting a cloud based DB.
There, you will create a cluster and add a DB user `<db-user>` (not your account) under `Security > Database Access`. Edit your user's actions to `readWriteAnyDatabase`. Then, your connection string will be at `Atlas > Clusters > Connect > Connect your Application`. The **connection string** above have two fileds that have to be updated `<db-user>` and `<password>`.

This connection string will be added in the `config` folder under `keys-dev.js` file. **This file must created**. We'll see how to create it and add the connection string in the next session.

## 4. Setup config 🔒
There are some **secret** variables you don't want anybody to see, like the connection string to your database or your secret key to decrypt authentication. On the other hand, they need to be visible in your code. So, both of them will be hidden from outside through the `config` file. Here, you have the structure of the config folder:

- config
	- `keys.js`
	- `keys-dev.js`
	- `keys-prod.js`

`keys.js` will decide wich file to `export` depending on your `process.env.NODE_ENV` variable. If it is production, it will fetch data on variables declared in your hosting platform (check how to set it on Heroku [section 7. Setup Heroku](#7.-Setup-Heroku-🚀) if you want to deploy). Now, in `development` mode, it will `export` the `keys-dev.js`. So, the content of this file won't be staged (`.gitignore`) will be:
```js
module.exports = {
  mongoURI  : 'mongodb+srv://<db-user>:<password>@webapp-vx27f.mongodb.net/test?retryWrites=true&w=majority',
  jwtSecret : 'l7865jhf43g2v2b33454jkh6khg'
};
```
`jwtSecret` just need to be a random string of characters and numbers. It is used to cryptograph the exchange of JWT (Jason Web Token) during authentication.


## 5. `npm install`
You have to install server (back end) and client (front end) `node_modules` packages. By convention, they are not versioned and therefore will not be in the `cloned` repository. In the terminal:
```sh
# Go inside the root folder
$ cd .../path/to/webapp
# Install Back End packages
$ npm install
# Go to client (Front End) folder
$ cd client
# Install Front End packages
$ npm install
```

## 6. `npm run dev`
We use `concurrently` in development mode, so you can run client and server, concurrently 😮.
So, fireup 🚀
```sh
# Go to webapp folder
$ cd .../path/to/webapp
# Fire Front and Back ends
$ npm run dev
```

See the app running on `Open localhost:3000`

## 7. Test API: [Postman](https://www.getpostman.com/downloads/)
Now, you should be able to interact with the app locally and make tests.
We use [Postman](https://www.getpostman.com/downloads/) to validate server requests.
If you want to use it, don't forget to add in the **Headers** tab `Content-type: application/json` and `x-auth-token: <token-value>`.

## 8. Deploy Heroku 🚀
If you want to deploy the application you can use [Heroku](https://dashboard.heroku.com/). Here's how to do it using the terminal and the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).

1. Verify installation `$ heroku --version`
2. Login `$ heroku login`
3. Create an app and set an upstream to Heroku `heroku`
```sh
$ heroku create
Creating app... done, ⬢ <name-of-your-app-in-heroku>

$ heroku git:remote -a <name-of-your-app-in-heroku>
```
4. Set up Configuration variables for database on https://dashboard.heroku.com > your-app-in-heroku > settings > Reveal Config. vars:
```js
KEY: "MONGO_URI"
value: "mongodb+srv://<db-user>:<password>@webapp-vx27f.mongodb.net/test?retryWrites=true&w=majority"
```
5. Deploy 
```sh
$ git add .
$ git commit -m 'A meaningfull modification description'
$ git push heroku <branch-you-wana-push>:master
```

6. Checkout going live
```sh
$ heroku open
```

## 9. Do your Magic 🎩
> We use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) and [here](git-gitflow) you can find detailed info from clone to pull requests.

Under [GitFlow](git-gitflow) you will find all information on how to stablish you git environment.

Be sure to:

- Before you work on a feature leave a message at the corresponding issue page ([WebApp issues](https://github.com/ProjSante/webapp/issues))
- If you see any problem do **not** fix it, submit an issue instead
- Make logical commit blocks