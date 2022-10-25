#!/usr/bin/env python

"""
setup.py
"""

from setuptools import setup, find_packages

setup(
    name='CMservice',
    version='2.0.2',
    description='',
    author='DIRG',
    author_email='dirg@its.umu.se',
    license='Apache 2.0',
    url='',
    packages=find_packages('src/'),
    package_dir={'': 'src'},
    package_data={
        'cmservice.service': [
            'data/i18n/locales/*/LC_MESSAGES/*.mo',
            'templates/*.mako',
            'site/static/*',
        ],
    },
    classifiers=['Development Status :: 4 - Beta',
                 'Topic :: Software Development :: Libraries :: Python Modules',
                 'Programming Language :: Python :: 3.4'],
    install_requires=[
        'Babel==2.7.0',
        'Click==7.0',
        'Flask==1.1.1',
        'Flask-Babel==0.12.2',
        'Flask-Mako==0.4',
        'Jinja2==2.11.3',
        'Mako==1.1.0',
        'MarkupSafe==1.1.1',
        'SQLAlchemy==1.3.11',
        'Werkzeug==0.16.0',
        'alembic==1.3.1',
        'certifi==2019.11.28',
        'dataset==1.1.2',
        'future==0.18.2',
        'gunicorn==20.0.4',
        'idna==2.8',
        'itsdangerous==1.1.0',
        'pycryptodomex==3.9.4',
        'pyjwkest==1.4.2',
        'python-dateutil==2.8.1',
        'python-editor==1.0.4',
        'pytz==2019.3',
        'requests==2.22.0',
        'six==1.13.0',
        'urllib3==1.25.7'
    ],
    zip_safe=False,
    message_extractors={'.': [
        ('src/cmservice/**.py', 'python', None),
        ('src/cmservice/**/service/templates/**.mako', 'mako', None),
        ('src/cmservice/**/service/site/**', 'ignore', None)
    ]}
)
