---
id: start-document
title: Doc Environment
sidebar_label: Doc Environment
---

This document is build with <a href="https://docusaurus.io/en/"><a href="https://gohugo.io/">Docusaurus</a>, visit that page for more detailed info on how to interact with this doc.

> This section is specific for setup the document environment for the **[Docs](github.com/ProjSante/Docusaurus)**, for other environments consult the appropriate section on the navigation bar on the left side.

You need to setup your developer environment if you want to test, implement and contribute. Here's how you do it.

## TL;DR

1. Install tools 🔧
	1. Dev: [git](https://git-scm.com/) and [node](https://nodejs.org/)
2. _Git_ a copy of the [Docs](github.com/ProjSante/Docusaurus)
	1. Fork - [Docusaurus repo](github.com/ProjSante/Docusaurus) ➡️ `github.com/<your_user>/Docusaurus`
	2. Clone - `github.com/<your_user>/Docusaurus` ➡️ 🤓💻
	3. Add `upstream remote`: 🤓💻 ➡️ [github.com/ProjSante/Docusaurus](github.com/ProjSante/Docusaurus)
3. npm install
	- On `/Docusaurus/website`
4. npm start
	- On `/Docusaurus/website` checkout [localhost](http://localhost:3000/)
5. Do Your Magic 🎩
6. Deploy Heroku

<hr />

## 1. Install Tools 🔧
When using **Github** from the command line you can either use `HTTPS` or `SSH`. The advantage of using `SSH` is that you don't need to insert id and password with the commands and the links are different
```sh
# HTTPS exemple
$ https://github.com/ProjSante/Docusaurus.git
# SSH example
$ git@github.com:ProjSante/Docusaurus.git
```
> Even if they are equivalent, we are going to use **SSH**. Adjust accordingly.

`SSH` is advised over HTTPS, go [here](https://help.github.com/en/articles/connecting-to-github-with-ssh) to setup your keys

## 2. _Git_ a Copy
There are 3 places were the code is stored:

- **upstream** - Which is the original `upstream` repository in Github
- **origin** - `github.com/<your_user>/Docusaurus`: Which is your copy of the repository
- **local** - 🤓💻: Which is you local copy `wokstation`

To do so:

1. **Fork**: [upstream](github.com/ProjSante/Docusaurus) ➡️ `github.com/<your_user>/Docusaurus`
 by clicking on **fork** button on the top right corner of [upstream](https://github.com/ProjSante/Docusaurus)

2. **Clone**: `github.com/<your_user>/Docusaurus` ️️➡️️️️ 🤓💻

```sh
# Go to where you want to download the doc
$ cd ../path
# Copy from your github repo to ../path
$ git clone git@github.com:<your_user>/Docusaurus.git
# cd inside Docusaurus
$ cd Docusaurus
```

3. Add `upstream` 🤓💻 ↔️ [github.com](github.com)/ProjSante/Docusaurus

See the git connections you can make with your machine
```sh
$ git remote -v
```
Usualy you have `origin`, which is `github.com/<your_user>/Docusaurus`
 
Now, you need to stablish a connection between your machine and the [upstream](github.com/ProjSante/Docusaurus).
This is necessary because others will contribute to the project, so you need a way to update your local files with those modifications

```sh
$ git remote add upstream git@github.com:ProjSante/Docusaurus.git
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

## 3. `npm install`
You have to install docusaurus `node_modules` packages. By convention, they are not versioned and therefore will not be in the `cloned` repository. In the terminal:
```sh
# Go inside the Docusaurus/website folder
$ cd .../path/to/Docusaurus/website
# Install packages
$ npm install
```

## 4. `npm start`
So, fireup 🚀
```sh
# Go to website folder
$ cd .../path/to/Docusaurus/website
# Fire Up Docs
$ npm start
```

## 5. Do your Magic 🎩
> We use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) and [here](git-gitflow) you can find detailed info from clone to pull requests.

Under [GitFlow](git-gitflow) you will find all information on how to stablish you git environment.

Be sure to:

- Before you work on a feature leave a message at the corresponding issue page ([Docusaurus issues](https://github.com/ProjSante/Docusaurus/issues))
- If you see any problem do **not** fix it, submit an issue instead
- Make logical commit blocks

## 6. Deploy Docs 🚀
There is a 🎩 🐚 script `deploy.sh`.

🔥 up

