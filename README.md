This is a starting point for creating an app on https://fly.io for testing Drupal 11 with Experience Builder alpha.

This app is configured to take advantage of Fly's auto-suspend and auto-resume features, so the app always appears available other than a short (less than a second) latency to resume from idle, while only getting billed for the time that it's receiving traffic. With the default configuration of a shared CPU with 1GB RAM machine, this is about $6/mo if serving traffic 24/7, or $0.06/mo or less if receiving traffic for only 1% or less of the minutes in a month. This makes it affordable to spin up as many of these apps as desired: for example, for different testers, demos, or code branches/MRs.

At present, the SQLite database and Drupal's public files directory are on the VM itself, so if the VM fully stops (not just suspends) and restarts (which can happen at any time for various reasons), the database and files are reset to their original state. A future improvement to this could be to move these to durable Tigris S3 buckets using Litestream and TigrisFS.

Instructions:
1. Clone this repo to a working directory.
2. Get an account on https://fly.io and install Fly's CLI.
3. Run the following, replacing `my-app` with your desired app name and `admin_password` with your desired password for Drupal user 'admin'.

```
fly app create my-app
fly --app my-app secrets set DRUPAL_PASSWORD=admin_password
fly --app my-app deploy
fly --app my-app scale count 1
```

4. Navigate to https://my-app.fly.dev and enjoy!
