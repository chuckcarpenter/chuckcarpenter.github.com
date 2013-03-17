#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = u'Chuck Carpenter'
SITENAME = u'Chuck Carpenter'
#TAGLINE = 'does stuff the hard way'
#SITEURL = 'http://localhost:8000'
SITEURL = 'http://chuckcarpenter.github.com'

TIMEZONE = 'America/New_York'
DEFAULT_LANG = u'en'
LOCALE = ''
DEFAULT_DATE_FORMAT = ('%b %d, %Y')

THEME = 'content/themes/carpenter-v1/'
PATH = 'content/'
PAGE_DIR = ('static/')
ARTICLE_DIR = ('journal/')
DEFAULT_CATEGORY = 'journal'
ARTICLE_URL = 'journal/{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = 'journal/{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
RELATIVE_URLS = False
MARKUP = 'md'
#MD_EXTENSIONS = ''
#PLUGINS = ['webassets.filter.stylus']

#FEED_DOMAIN = SITEURL
#FEED = 'feeds/all.atom.xml'
#CATEGORY_FEED = 'feeds/category.%s.atom.xml'
#TAG_FEED = 'feeds/tag.%s.atom.xml'
#DEFAULT_METADATA = ''

#GOOGLE_ANALYTICS = 'UA-29827268-2'
#DISQUS_SITENAME = 'wting'
#GITHUB_URL = 'http://github.com/chuckcarpenter.github.com/'
#TWITTER_USERNAME = 'chuckcarpenter'


# Blogroll
# LINKS =  (('Pelican', 'http://docs.notmyidea.org/alexis/pelican/'),
#           ('Python.org', 'http://python.org'),
#           ('Jinja2', 'http://jinja.pocoo.org'),
#           ('You can modify those links in your config file', '#'),)

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
