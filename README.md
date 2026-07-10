# ActiveBootstrapSkin (emjot's Fork)

Bootstrap skin for Active Admin.

This fork vendors Bootstrap 3.4.1 SCSS directly into the gem (no `bootstrap-sass` dependency) and uses the modern Sass module system (`@use` / `@forward`) for compatibility with dartsass-rails.

## Installation

Add the gem to your Gemfile:

```ruby
gem 'active_bootstrap_skin',
  git:    'https://github.com/emjot/active_bootstrap_skin',
  branch: 'emjot' # or e.g. tag: 'emjot-3.0.0'
```

`bootstrap-sass` is **not** required — Bootstrap styles are included in this gem.

## Usage

In `active_admin.scss`, use `active_bootstrap_skin`. If you use dartsass-rails, include `bootstrap-sprockets-dartsass` before it (sprockets-rails >= 3.4.2 is expected). **Comment out or remove the default Active Admin stylesheets.**

```scss
// Active Admin's got SASS!
// @import "active_admin/mixins";
// @import "active_admin/base";

// Active Bootstrap
@use "bootstrap-sprockets-dartsass"; // only if you use dartsass-rails
@use "active_bootstrap_skin";
```

In `active_admin.js`, require `active_bootstrap_skin` for the mobile nav toggle. Bootstrap's JavaScript is **not** required.

```javascript
//= require active_admin/base
//= require active_bootstrap_skin
```

## Upgrading

Upgrading from `emjot-2.3.2`? See [UPGRADING-emjot-3.0.md](UPGRADING-emjot-3.0.md).

## Testing

For gem development, compile the skin the same way a consuming app would (Dart Sass via `sass-embedded`):

```bash
bundle install
bundle exec rake test
```

Optional:

```bash
bundle exec rake compile                       # write CSS to tmp/compile/
FATAL_DEPRECATIONS=1 bundle exec rake test     # fail on Sass deprecation warnings
```

CI runs `rake test` on pull requests and on pushes to `emjot` (Ruby 3.2 and 3.3).

## Screens

![Login](https://cloud.githubusercontent.com/assets/1997137/14111523/49c1e80c-f5f5-11e5-9fd4-d1700428b167.png)

![Admin](https://cloud.githubusercontent.com/assets/1997137/14111565/6f684bd2-f5f5-11e5-9c8c-afc0ac8ab05e.png)

![Admin Responsive](https://cloud.githubusercontent.com/assets/1997137/14111613/8fd64eb4-f5f5-11e5-9024-0d0dbf4c4b88.png)

![Admin viewport](https://cloud.githubusercontent.com/assets/1997137/15280259/d47272f4-1b58-11e6-86e8-b35836557890.png)

![Admin dropdown](https://cloud.githubusercontent.com/assets/1997137/15280303/57980aea-1b59-11e6-9cda-b58573a03f84.png)
