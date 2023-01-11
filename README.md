# ansible


## To run ansible and ask password

-k : to ask sudo password

```bash
ansible-playbook local.yml -K --ask-vault-pass
```

## To istall with tag (-t) node and ast sudo password (-k)

```bash
ansible-playbook local.yml -t node -K
```


