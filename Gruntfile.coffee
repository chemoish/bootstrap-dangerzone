module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      dev:
        files: [
          'dist/script/app.js': 'src/script/**/*.coffee'
        ]

    jade:
      dev:
        files: [
          expand: true
          cwd: 'src'
          dest: 'dist'
          ext: '.html'
          src: '**/*.jade'
        ]

    stylus:
      dev:
        files: [
          'dist/style/app.css': 'src/style/app.styl'
        ]
        options:
          compress: false
          urlfunc: 'url'
      prod:
        files: '<%= stylus.dev.files %>'
        options:
          urlfunc: '<%= stylus.dev.options.urlfunc %>'

    concat:
      dev:
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

    connect:
      server:
        options:
          base: 'dist'
          port: 8787

    copy:
      dev:
        files: [
          cwd: 'src'
          dest: 'dist/img/'
          expand: true
          flatten: true
          src: 'img/**/*'
        ,
          cwd: 'vendor/bower_components'
          dest: 'dist/fonts/'
          expand: true
          flatten: true
          src: 'font-awesome/fonts/**/*'
        ]

    uglify:
      my_target:
        files: [
          'dist/script/app.js': 'dist/script/app.js'
          'dist/script/vendor.js': 'dist/script/vendor.js'
        ]

    watch:
      coffee:
        files: 'src/**/*.coffee'
        options:
          interrupt: true
        tasks: 'coffee:dev'

      grunt:
        files: 'Gruntfile.coffee'

      jade:
        files: 'src/**/*.jade'
        options:
          interrupt: true
        tasks: 'jade:dev'

      stylus:
        files: 'src/**/*.styl'
        options:
          interrupt: true
        tasks: 'stylus:dev'

  grunt.registerTask 'default', 'Running development environment...', [
    'build:dev'
    'connect'
    'watch'
  ]

  grunt.registerTask 'build:dev', 'Running development tasks...', [
    'coffee:dev'
    'jade:dev'
    'stylus:dev'
    'concat:dev'
    'copy:dev'
  ]

  grunt.registerTask 'build:prod', 'Running production tasks...', [
    'coffee:dev'
    'jade:dev'
    'stylus:prod'
    'concat:dev'
    'copy:dev'
    'uglify:my_target'
  ]