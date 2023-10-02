#!/bin/bash

# configuratie van firewall
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw allow 80
ufw allow 443

# herladen van firewall
ufw reload
