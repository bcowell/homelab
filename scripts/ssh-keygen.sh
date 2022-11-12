#!/bin/bash
filename=~/.ssh/id_ed25519
comment="$(whoami)@$(hostname)"
ssh-keygen -t ed25519 -P '' -f $filename -C $comment