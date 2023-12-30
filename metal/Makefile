default: cluster

~/.ssh/id_ed25519:
	ssh-keygen -t ed25519 -P '' -f "$@"

cluster:
	ansible-playbook cluster.yaml

console:
	ansible-console
