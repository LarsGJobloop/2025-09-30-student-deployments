## Dependencies

### Domain Names

Deployments requires that you create two records with your DNS registrar to point to the server and any subdomains. A record for the top domain and another for wildcards (only needed if you route to dynamic subdomains).

```tx
A Records:
your-domain.com -> ${Server_IPv4}
*your-domain.com -> ${Server_IPv4}

AAAA Records:
your-domain.com -> ${Server_IPv6}
*your-domain.com -> ${Server_IPv6}
```

Without these the ingress (Traefik) can't use Host forwarding, so you need to limit yourself to PathPrefix. Fine for own services, but several external solutions breaks due to domains being used as a security/isolation boundary.

### TLS Certificates

Currently this configuration uses Let's Encrypt's DNS01 challenge type for minting certificates and have them signed for subdomains. This setup requires that you add your access credentials for the domain with your DNS Registrar.

Example:
- You have a domain registered with Domeneshop that you wish to use
- Get an API token for configuring the records from them `domeneshop.no -> My Domains -> API Tokens`
- Add the content in the two files listed as secrets in the [manifest](/manifests/deployments/development/compose.yaml) to the server (requires server runtime access).

> [!NOTE]
>
> Domeneshops API tokens are unscoped (without customer support) and long lived. Making this an extremely risky setup. Avoid at all cost for accounts which controls domains that are critical for business continuity.
