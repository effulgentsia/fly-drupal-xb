This is a starting point for creating an app on https://fly.io for testing Drupal 11 with Experience Builder alpha.

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
