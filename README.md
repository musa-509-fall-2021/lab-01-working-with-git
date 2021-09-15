# Working with Git and GitHub

## Steps
1. **Fork** this repository to your account
2. **Clone** your fork to your computer
    * Requires you to install `git`
    * Could use a [GUI](https://desktop.github.com/) or a [CLI](https://github.com/git-guides/install-git)
3. Import datasets from [OpenDataPhilly](https://opendataphilly.org/) into Carto
    * Licenses and Inspections Business Licenses (maintained by the City of Philadelphia)
    * Philadelphia Neighborhoods (maintained by Azavea)
    * (optional) PWD Stormwater Billing Parcels (maintained by the City of Philadelphia)
4. Explore the data sets
    - How many business licenses in total?
    - How many businesses with a null geometry?
    - What are all of the types of business licenses?
    - How many neighborhoods are there in this dataset?
    - Any fields appropriate to use as a unique key for neighborhoods?
5. Fill in the 3 queries in this repository.
    * **Commit** each file to your local repository as you fill it out.
6. **Push** your code to your repository on GitHub and submit a **Pull Request** back to the original repo.

## Definitions

**GitHub** is:
* A web platform for hosting and collaborating on code, built on **Git**.
* There are other web platforms built on Git (like BitBucket, GitLab). GitHub is the most popular one.

**Git** is:
* An open-source distributed source-control manager (SCM) or version control system (VCS). "SCM" and "VCS" can be used interchangably.
* There are other SCMs (like Mercurial, Subversion). Git is the most popular one (I think?).

Why should I use a **SCM/VCS**?:
* It remembers what changes I made so I don't have to (because I'm not going to).
* It makes merging two modified versions of a code base more manageable

## Other Notes

You can run all of the SQL for this lab on Carto, but I have had questions about installing PostGIS locally instead:
 * For Mac, I recommend [Postgres.app](https://postgresapp.com/)
 * For Windows, I recommend [EDB](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
