## Dependencies

### Domain Names

Deployments requires that you create two records with your DNS registrar for point to the server and any subdomains.

```tx
A Records:
your-domain.com -> ${Server_IPv4}
*your-domain.com -> ${Server_IPv4}

AAAA Records:
your-domain.com -> ${Server_IPv6}
*your-domain.com -> ${Server_IPv6}
```

Without these the ingress (Traefik) can't use Host forwarding, so you need to limit yourself to PathPrefix. Fine for own services, but several external solutions breaks due to domains being used as a security/isolation boundary.
