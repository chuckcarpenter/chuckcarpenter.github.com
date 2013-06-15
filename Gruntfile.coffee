'use strict'

module.exports = ->
    # load all grunt tasks
    require('matchdep').filterDev('grunt-*').forEach @loadNpmTasks
    
    opts = 
        cleanDir: 'output/*'
        content: 'content'
        outputDir: 'output'
        pelican: 'pelican'
        pelicanOpts: 'pelicanconf.py'
        theme: 'content/themes/carpenter-v1'

    # Initialize the configuration.
    @initConfig
        opts: opts
        
        pkg: @file.readJSON 'package.json'
        
        banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
        '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
        ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n'
        
        'bower-install':
          # Point to the html file that should be updated
          # when you run `grunt bower-install`
            html: 'themes/carpenter-v1/templates/base.html'

          # Optional:
          # If your scripts shouldn't contain a certain
          # portion of a url, it can be excluded
          #ignorePath: 'app/'
        
        clean: ['<%= opts.cleanDir %>']

        watch:
            coffee:
                files: ['<%= opts.theme %>/static/src/scripts/{,*/}*.coffee']
                tasks: ['coffee:dist']
            compass:
                files: ['<%= opts.theme %>/static/src/styles/{,*/}*.{scss,sass}']
                tasks: ['compass']

        connect:
            options:
                base: '<%= opts.outputDir %>'
                port: 8000
                # change this to '0.0.0.0' to access the server from outside
                hostname: 'localhost'
            # livereload:
            #     options:
            #         middleware: (connect)->
            #             return [lrSnippet, mountFolder(connect, '<%= opts.outputDir %>')]
            # dist:
            #     options:
            #         middleware: (connect)->
            #             return [lrSnippet, mountFolder(connect, '<%= opts.outputDir %>')]

        open:
            server:
                path: 'http://localhost:<%= connect.options.port %>'
        
        shell:
            publish:
                command: 'pelican <%= opts.content %> -o <%= opts.outputDir %> -s <%= opts.pelicanOpts %>'
                options:
                    stdout: true
            devserver:
                command: [
                    './develop_server.sh start'
                    'grunt open:server'
                    ].join '&&'
                options:
                    stdout: true
            devstop: 
                command: './develop_server.sh stop'
            github:
                command: [
                    'grunt shell:publish'
                    './ghp-import -m \'Update site at ' + @template.today(now) + '\' <%= opts.outputDir %>'
                    'git push origin master --force'
                    ].join '&&'
                options:
                    stdout: true   

        coffee:
            dist:
                files:
                    # rather than compiling multiple files here you should
                    # require them into your main .coffee file
                    expand: true
                    cwd: '<%= opts.theme %>/static/src/scripts'
                    src: '*.coffee'
                    dest: '<%= opts.theme %>/static/js'
                    ext: '.js'
            # test:
            #     files:
            #         expand: true
            #         cwd: '.tmp/spec'
            #         src: '*.coffee'
            #         dest: 'test/spec'
                     
        compass:
            options:
                sassDir: '<%= opts.theme %>/static/src/styles/'
                cssDir: '<%= opts.theme %>/static/css/'
                imagesDir: '<%= opts.theme %>/static/images/'
                javascriptsDir: '<%= opts.theme %>/static/js/'
                fontsDir: '<%= opts.theme %>/static/fonts/'
                relativeAssets: true
            server:
                options:
                    debugInfo: true                 

        # Specify source files to the JSHint task.
        jshint:
            options:
                curly: true
                eqeqeq: true
                immed: true
                latedef: true
                newcap: true
                noarg: true
                sub: true
                undef: true
                unused: true
                boss: true
                eqnull: true
                browser: true

        @renameTask 'regarde', 'watch'

        @registerTask "test", ["jshint"]

        @registerTask "build", [
            "clean"
            #"coffee"
            #"compass:dist"
        ]

        # Run local server
        @registerTask 'server', (target) ->
            if target is 'dist'
                return @task.run(['build', 'open', 'connect:dist:keepalive'])

            @task.run [
                #'clean'
                'coffee:dist'
                'compass:server'
                #'shell:publish'
                'connect'
                'open'
                #'watch'
            ]

        # Default task.
        @registerTask "default", [
          "clean"
          "shell:publish"
          "test"
          "build"
        ]