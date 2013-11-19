express = require 'express'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'


    jade:
      debug:
        files: [
          expand: true
          cwd: 'src'
          dest: 'dist'
          ext: '.html'
          src: '**/*.jade'
        ]
  startServer = (port, path, callback) ->
    app = express()

    app.use express.static path

    app.listen port

    console.log 'Listening on port:' + port

  grunt.registerTask 'server', 'Start server', ->
    @async()

    startServer 9999, 'build'