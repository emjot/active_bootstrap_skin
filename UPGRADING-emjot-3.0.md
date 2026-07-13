# Upgrading from `emjot-2.3.2` to `emjot-3.0.0`

`emjot-3.0.0` is a backward-incompatible release. Plan a short migration in each consuming app.

## 1. Gemfile

Remove `bootstrap-sass` and update the tag:

```ruby
# REMOVE:
# gem 'bootstrap-sass', git: 'https://github.com/emjot/bootstrap-sass', branch: 'remove-sassc'

gem 'active_bootstrap_skin',
  git: 'https://github.com/emjot/active_bootstrap_skin',
  tag: 'emjot-3.0.0'
```

## 2. `active_admin.scss`

Switch from `@import` to `@use`:

```scss
// Before (emjot-2.3.2):
@import "bootstrap-sprockets-dartsass";
@import "active_bootstrap_skin";

// After (emjot-3.0.0):
@use "bootstrap-sprockets-dartsass";
@use "active_bootstrap_skin";
```

## 3. `active_admin.js`

Remove `bootstrap-sprockets` — Bootstrap JS is no longer used:

```javascript
// Before (emjot-2.3.2):
//= require active_admin/base
//= require bootstrap-sprockets
//= require active_bootstrap_skin

// After (emjot-3.0.0):
//= require active_admin/base
//= require active_bootstrap_skin
```

## 4. Reinstall and recompile assets

```bash
bundle install
bin/rails assets:clobber assets:precompile   # or your usual asset build
```

## 5. Smoke-test

Verify Active Admin pages, action icons, and the responsive burger menu (≤ 768px viewport).

## What changed

| Area | emjot-2.3.2 | emjot-3.0.0 |
|------|-------------|-------------|
| Bootstrap source | `bootstrap-sass` gem | Vendored in this gem |
| Sass syntax | `@import` | `@use` / `@forward` |
| Bootstrap JS | Required via `bootstrap-sprockets` | Not needed; mobile nav toggle in `active_bootstrap_skin` |
| Sass deprecations | Warnings with dartsass-rails | Addressed in vendored Bootstrap + skin |

If your app has custom SCSS that `@import`s Bootstrap variables or mixins from `bootstrap-sass`, migrate those files to `@use` as well.
