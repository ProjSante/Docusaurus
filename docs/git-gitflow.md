---
id: git-gitflow
title: GitFlow
sidebar_label: GitFlow
---

> We use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/). So, if you want to contribute, follow these steps:

## _Git_ a Copy
> Never `clone` straight from the project repo, do a fork to your repo and clone it from there.

There are 3 places were the code is stored:

- **upstream** - Which is the original project `github.com/ProjSante/<repository>`
- **origin** - `github.com/<your_user>/<repository>` Which is your copy of the repository
- **local** - 🤓💻 Which is you local copy `wokstation`

To do so:

1. **Fork**: `upstream` ➡️ `github.com/<your_user>/<repository>`
 by clicking on **fork** button on the top right corner of `upstream`

2. **Clone**: `github.com/<your_user>/<repository>` ️️➡️️️️ 🤓💻

```sh
# Go to where you want to download the project
$ cd ../path/to/projects
# Copy from your github repo to ../path/to/projects
$ git clone git@github.com:<your_user>/<repository>.git
# cd inside <repository>
$ cd <repository>
```

3. Add `upstream` 🤓💻 ↔️ `github.com/ProjSante/<repository>`
 
Now, you need to stablish a connection between your machine and the `upstream` necessary because others will contribute to the project, so you need a way to update your local files with those modifications

```sh
# Adding upstream
$ git remote add upstream git@github.com:ProjSante/<repository>.git
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

## Update your workstation 🤓💻
```sh
$ git checkout develop

# Make sure your upstream points to git@github.com:ProjSante/<repository>.git
$ git remote -v
# You must see (upstream) git@github.com:ProjSante/<repository>.git (fetch/push)

# If you don't
$ git remote add upstream git@github.com:ProjSante/<repository>.git
# (upstream) git@github.com:ProjSante/<repository>.git (fetch/pull)

# When you do
$ git pull upstream develop
```
## Working on an issue 🐛
Now, lets say you want to work on a feature from the `https://github.com/ProjSante/<repository>/issues`.
```sh
# Create a branch called feature/feature-12 if you're working on a feature of issue #12
$ git checkout -b feature/feature-<issue-nb>
```
Where `<issue-nb>` is the issue number from `https://github.com/ProjSante/<repository>/issues` you will be working on 

## Working 🎩
 Time to work and make logical commit blocks.

1. If along the way you stumble on something wrong, do NOT change it, Instead, submit an issue. Each pull request must contain only the code necessary for that issue
2. Test your code
3. Stage the files
```sh
$ git add <files-you-changed>
```
4. Commit with a **meaningful** message
```sh
$ git commit -m 'That message'
```

## Merging
Merge `feature/feature-<issue-nb>` back into `develop` branch
```sh
# Switch to branch 'develop'
$ git checkout develop

# Merge the modifications onto branch develop
$ git merge --no-ff feature/feature-<issue-nb>

```
> The **no-ff** flag avoids losing information about the historical existence of a feature branch


## Updating locally before Pull Request
Let's say, in the mean time others have contributed to this project. So, you need to update you files, with those updates. So, before you make a pull request
```sh
$ git pull upstream develop
```
You might have conflicts. It is when you and someone else modified the same file. You need to resolve them before proceeding.

Now, you have your local :nerd_face::computer: working directory updated.
Next step is to `push` the code firstly to your Github repo `github.com/<your_user>/<repository>`

## Push to your repo
Push modifications to your Github repo `github.com/<your_user>/<repository>`
```sh
# Resolve the conflicts, then push to your Github branch
$ git push origin develop
```
## Pull Request Time
Then open a Pull Request. Go to your fork of the project `github.com/<your_user>/<repository>` and smash that `Pull Request` button (just between the files and the clone/download button).

Checkout guidelines on how to make a **Pull Request** [here](git-pull-request)

## Delete Branch
If your Pull Request is accepted you can go on and delete that feature branch
```sh
# Delete branch feature/feature-nb
$ git branch -d myfeature
$ git push origin develop
```