#!/usr/bin/env python3
import argparse
import os
import yaml
import stat
import sys
import requests
from termcolor import colored

parser = argparse.ArgumentParser(description='Perform Yale-related tasks')
parser.add_argument('verb')
args = parser.parse_args()

CREDENTIALS_PATH = os.path.expanduser('~') + '/.yale_credentials.yml'
credentials = {
    'NetID': '',
    'Password': '',
}
if os.path.isfile(CREDENTIALS_PATH) and os.path.getsize(CREDENTIALS_PATH) is not 0:
    with open(CREDENTIALS_PATH, 'r') as f:
        credentials = yaml.load(f, loader=yaml.SafeLoader)
else:
    credentials['NetID'] = input('NetID: ')
    from getpass import getpass
    credentials['Password'] = getpass('Password: ')
    with open(CREDENTIALS_PATH, 'w') as f:
        yaml.dump(credentials, f)
    os.chmod(CREDENTIALS_PATH, stat.S_IRUSR | stat.S_IWUSR)

# Warn if group or public can read config and the private details therein.
if os.stat(CREDENTIALS_PATH).st_mode & (stat.S_IRGRP | stat.S_IROTH):
    print('Warning: config file may be accessible by other users.', file=sys.stderr)

CONFIG_PATH = os.path.expanduser('~') + '/.yale.yml'
config = {
}
if os.path.isfile(CONFIG_PATH) and os.path.getsize(CONFIG_PATH) is not 0:
    with open(CONFIG_PATH, 'r') as f:
        config = yaml.load(f)
else:
    config = {key: input(key + ': ') for key in config.keys()}
    config.update({
        # Nothing here yet
    })
    with open(CONFIG_PATH, 'w') as f:
        yaml.dump(config, f)

if args.verb == 'dining':
    response = requests.get('http://www.yaledining.org/fasttrack/locations.cfm?version=3').json()
    for location in response['DATA']:
        for index, value in enumerate(location):
            print('{column}: {value}'.format(column=response['COLUMNS'][index],
                                             value=value))
        print()
