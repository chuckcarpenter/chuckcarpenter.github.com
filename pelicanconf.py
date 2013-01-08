#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = u'Chuck Carpenter'
SITENAME = u'Chuck Carpenter'
#TAGLINE = 'does stuff the hard way'
SITEURL = 'http://localhost:8000'

TIMEZONE = 'America/New York'
DEFAULT_LANG = u'en'
LOCALE = ''
DEFAULT_DATE_FORMAT = ('%b %d, %Y')

THEME = 'content/themes/carpenter-v1/'
DEFAULT_CATEGORY = 'code'
ARTICLE_URL = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
RELATIVE_URLS = False
MARKUP = 'md'
#MD_EXTENSIONS = ''
#PLUGINS = ['webassets.filter.stylus']

#FEED_DOMAIN = SITEURL
#FEED = 'feeds/all.atom.xml'
#CATEGORY_FEED = 'feeds/category.%s.atom.xml'
#TAG_FEED = 'feeds/tag.%s.atom.xml'
#DEFAULT_METADATA = ''

PAGE_DIR = ('static/')
ARTICLE_DIR = ('posts/')

#GOOGLE_ANALYTICS = 'UA-29827268-2'
#DISQUS_SITENAME = 'wting'

# Blogroll
LINKS =  (('Pelican', 'http://docs.notmyidea.org/alexis/pelican/'),
          ('Python.org', 'http://python.org'),
          ('Jinja2', 'http://jinja.pocoo.org'),
          ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = 3
REVERSE_ARCHIVE_ORDER = True
DISPLAY_PAGES_ON_MENU = True

# A list of files to copy from the source to the destination
# FILES_TO_COPY = (
#         ('robots.txt', 'robots.txt'),
#         ('images/favicon.ico','favicon.ico'),
#         )
