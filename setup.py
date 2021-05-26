from setuptools import setup

README = """
See the README on `GitHub
<https://github.com/uw-it-aca/linkbot>`_.
"""

url = "https://github.com/uw-it-aca/zoom-apps"
setup(
    name='zoom-apps',
    author="UW-IT AXDD",
    author_email="aca-it@uw.edu",
    install_requires=[
        'tornado>=6,<7']
    license='Apache License, Version 2.0',
    description='zoom apps n statics',
    classifiers=[
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3.6',
    ],
)
