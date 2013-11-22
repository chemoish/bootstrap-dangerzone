# bootstrap-dangerzone

Bootstrap dangerzone is a dangerously suggestful methodology for seeding your projects with the following technologies:

 * [AngularJS](http://angularjs.org/)
 * [Font Awesome](http://fontawesome.io/)
 * [jQuery](http://jquery.com/)
 * [Twitter Bootstrap](http://getbootstrap.com/)

And written without html, css, or javascript using:

* [CoffeeScript](http://coffeescript.org/)
* [Jade](http://jade-lang.com/)
* [Stylus](http://learnboost.github.io/stylus/)

## So what does this buy me?

The dangerzone is perfect for people who want to get started developing without the headache of setting up a development environment every time. The project has already configured the basics of compilation, watcher, and a server tasks.

It also comes with a biased folder structure that accommodates both small and large projects.

## Quick start

1. Install [node](http://nodejs.org/)

*Note: windows users will have to add nodejs to environment path*

2. Install [npm](http://nodejs.org/download/)

*Note: windows users will have to add npm to environment path*

3. Install [grunt](http://gruntjs.com/)

```
npm install -g grunt-cli
```

4. Install [bower](http://bower.io/)

```
npm install -g bower
```

5. Install npm depedencies

```
npm install -d
```

6. Install bower dependencies

```
bower install
```

7. Compile, run, watch, develop

```
grunt
```

## Folder structure *concept*

After you execute the ```grunt``` command, along with installing the dependencies for npm and bower, your project will look a lot different. Orly?

See below for folder structure intended by the creator:

bootstrap-dangerzone/
├── dist/ (website files to be distributed - do not touch)
│   ├── fonts/
│   ├── scripts/
│   │   ├── app.js
│   │   └── vendor.js
│   ├── style/
│   │   ├── app.css
│   │   └── vendor.css
│   └── index.html
├── src/ (website files to be edited)
│   ├── scripts/
│   │   └── app.coffee
│   ├── style/
│   │   ├── components/ (generic components)
│   │   ├── layout/
│   │   │   ├── content.styl
│   │   │   ├── header.styl
│   │   │   └── footer.styl
│   │   ├── mixin/
│   │   ├── template/ (specific website views/pages/content)
│   │   ├── app.styl
│   │   ├── base.styl (tag customization)
│   │   ├── font.styl (font/google font additions)
│   │   ├── icon.styl
│   │   └── variable.styl (website colors, etc)
│   └── index.jade
├── vendor/
│   └── bower_components/ (managed by bower - do not touch)
├── .bowerrc
├── .gitignore
├── bower.json
├── Gruntfile.coffee
├── package.json
└── README.md

## TODO

* Explain grunt tasks
* Explain how to extend grunt file
* Explain how to extend folder structure: assts, img, fonts
* Explain how to extend scripts/styles
* Provide example of phony app folder structure so that we don't have to create a bunch of empty directories to convey this information
* Include ngTemplates