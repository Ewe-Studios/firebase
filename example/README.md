# Example Project
Files within project provides a template which can be used to quickly setup your project for working with firebase.

It requires a few modifications after being copied:

1. Get correct project id value in `.firebaserc` (either manually or by running `firebase init`)

In `.firebaserc` replace <PROJECT-ID> with your correct id
```
{
  "projects": {
    "default": "<PROJECT-ID>"
  }
}
```

2. Install node modules within the `functions` directory

```
cd functions
npm install
npm run build
```

This directory will contain all code for functions you wish deployed to firebase and able to be executed by you.

3. Feel free to update the rules in the `database.rules.json` and `firestore.rules` files as desired.
