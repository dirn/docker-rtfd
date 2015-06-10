DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',  # Not used with sqlite3.
        'PASSWORD': '',
        'HOST': 'db',
        'PORT': '',
    }
}

REDIS = {'host': 'cache', 'db': 0, 'port': 6379}

ES_HOSTS = ['search:9200']

SOCIALACCOUNT_PROVIDERS = {
    'github': {
        'SCOPE': ['user:email', 'read:org', 'admin:repo_hook', 'repo'],
    }
}

GITHUB_PRIVACY = 'private'
ALLOW_PRIVATE_REPOS = True
