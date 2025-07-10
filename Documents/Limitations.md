# WireGuard: Limitations and Considerations

While I've found WireGuard to be an excellent and modern VPN solution for what our company required, it's not a silver bullet. Below I will be listing some of the limitations that I've found and while none of them have been complete dealbreakers for me, it's best you consider them carefully, especially if security scrutiny is rampant in your company.

## 1. No user authentication

This software will use public/private key pairs to authenticate. There's no:

- Username/password login.
- MFA/TOTP integration.
- Central authentication like AD, RADIUS or LDAP.

This means you'll have to be careful during offboarding procedures as there is really no way to automate this as far as I've seen.

## 2. No logging or audit trails

WireGuard doesn't log:

- Connection attempts.
- Session duration.
- Data transferred.

This is by design as the developers want to keep the software lightweight and secure from my understanding. However, do consider your security policies before deployment.

## 3. Windows service isn't perfect

On Windows:

- WireGuard runs **per-tunnel**, not as a global service.
- Autostarting will require a powershell command.
- User management will require an additional GPO to configure.

## 4. Centralization

No certificate authority means:

- If a peer's private key is compromised, you have to manually remove their key from all servers and regenerate 
