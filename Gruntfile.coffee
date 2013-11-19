express = require 'express'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    concat:
      debug:
        files: [
            dest: 'dist/style/vendor.css'
            src: [
              'vendor/bower_components/twitter/dist/css/bootstrap.css'
              'vendor/bower_components/font-awesome/css/font-awesome.css'
            ]
          ,
            dest: 'dist/script/vendor.js',
            src: [
              'vendor/bower_components/jQuery/jquery.js'
              'vendor/bower_components/angular/angular.js'
              'vendor/bower_components/twitter/dist/js/bootstrap.js'
            ]
        ]

    copy:
      debug:
        files: [
          dest: 'dist/img/'
          expand: true
          flatten: true
          src: 'src/img/**/*'
        ,
          dest: 'dist/fonts/'
          expand: true
          flatten: true
          src: 'vendor/bower_components/font-awesome/fonts/**/*'
        ]

    coffee:
      debug:
        files: [
          'dist/script/app.js': 'src/script/**/*.coffee'
        ]

    jade:
      debug:
        files: [
          expand: true
          cwd: 'src'
          dest: 'dist'
          ext: '.html'
          src: '**/*.jade'
        ]

    stylus:
      debug:
        files: [
          'dist/style/app.css': 'src/style/**/*.styl'
        ]

  startServer = (port, path, callback) ->
    app = express()

    app.use express.static path

    app.listen port

    console.log 'Listening on port:' + port

  grunt.registerTask 'server', 'Start server', ->
    @async()

    startServer 9999, 'dist'