This is not the usual documentation. It's more for personal reminding purpuses.

# Ourbit Blog
This is the ourbit blog at [http://ourbit.norbertoherz.com](http://ourbit.norbertoherz.com)

This is heavily relying on Jekyll and GitHub for being built. It is bilingual, reason why I used to use plugins and build it on-permise. Maintaining that was a PITA. I decided to shift to the approach proposed here: [https://www.sylvaindurand.org/making-jekyll-multilingual/](https://www.sylvaindurand.org/making-jekyll-multilingual/) and it worked like charm (no pagination, though).

## QA
I decided to go for a QA environment. This is achieved by forking the blog into a different organization (ourbit-qa). That way I can see the changes on github before impacting the productive one. When doing so, it's important to configure and test with the proper `base-url` and roll it back when merging the pull request in Prod.
This is intended for big or structural changes. Not needed for just publishing a new post.

## Publishing a new POST
It can be done by adding the proper files in gh-pages. However, it's strongly recommended to create branches for doing that. If needed, fork to a private repo to store the post until published.

---


