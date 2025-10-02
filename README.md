## Remote Host

Currently there's no Domain configured for the services here, which makes some of the routing break.

A partial fix while developing is to add an entry to your `/etc/hosts` with **your** instance IP address and then ensure the Traefik labels in the manifests corresponds to the entry.

Example `/etc/hosts` entry:
```txt
46.62.204.170 remote.development
```

> [!NOTE]
>
> IETF have reserved a very limted set of domains for free use (only `***.local`), so be mindfull that all other might cause collision and clean up `/etc/hosts` after you are done
