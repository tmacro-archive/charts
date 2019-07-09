{{ define "keycloak.realm-configmap" -}}
{{ $config := .Values.keycloak -}}
{{ $realmDefaults := .Values.keycloak.realmDefaults -}}
{{ $clientDefaults := .Values.keycloak.clientDefaults -}}
{{ $realmName := .Values.keycloak.realmName -}}
{{ $realmConfig := $config.keycloak.realmConfig -}}
{
  "id": "{{ default $realmName $realmConfig.id }}",
  "realm": "{{ default $realmName $realmConfig.realm }}",
  "enabled": {{ default $realmDefaults.enabled $realmConfig.enabled | toJson }},
  "notBefore": {{ default $realmDefaults.notBefore $realmConfig.notBefore | toJson }},
  "revokeRefreshToken": {{ default $realmDefaults.revokeRefreshToken $realmConfig.revokeRefreshToken | toJson }},
  "refreshTokenMaxReuse": {{ default $realmDefaults.refreshTokenMaxReuse $realmConfig.refreshTokenMaxReuse | toJson }},
  "accessTokenLifespan": {{ default $realmDefaults.accessTokenLifespan $realmConfig.accessTokenLifespan | toJson }},
  "accessTokenLifespanForImplicitFlow": {{ default $realmDefaults.accessTokenLifespanForImplicitFlow $realmConfig.accessTokenLifespanForImplicitFlow | toJson }},
  "ssoSessionIdleTimeout": {{ default $realmDefaults.ssoSessionIdleTimeout $realmConfig.ssoSessionIdleTimeout | toJson }},
  "ssoSessionMaxLifespan": {{ default $realmDefaults.ssoSessionMaxLifespan $realmConfig.ssoSessionMaxLifespan | toJson }},
  "ssoSessionIdleTimeoutRememberMe": {{ default $realmDefaults.ssoSessionIdleTimeoutRememberMe $realmConfig.ssoSessionIdleTimeoutRememberMe | toJson }},
  "ssoSessionMaxLifespanRememberMe": {{ default $realmDefaults.ssoSessionMaxLifespanRememberMe $realmConfig.ssoSessionMaxLifespanRememberMe | toJson }},
  "offlineSessionIdleTimeout": {{ default $realmDefaults.offlineSessionIdleTimeout $realmConfig.offlineSessionIdleTimeout | toJson }},
  "offlineSessionMaxLifespanEnabled": {{ default $realmDefaults.offlineSessionMaxLifespanEnabled $realmConfig.offlineSessionMaxLifespanEnabled | toJson }},
  "offlineSessionMaxLifespan": {{ default $realmDefaults.offlineSessionMaxLifespan $realmConfig.offlineSessionMaxLifespan | toJson }},
  "accessCodeLifespan": {{ default $realmDefaults.accessCodeLifespan $realmConfig.accessCodeLifespan | toJson }},
  "accessCodeLifespanUserAction": {{ default $realmDefaults.accessCodeLifespanUserAction $realmConfig.accessCodeLifespanUserAction | toJson }},
  "accessCodeLifespanLogin": {{ default $realmDefaults.accessCodeLifespanLogin $realmConfig.accessCodeLifespanLogin | toJson }},
  "actionTokenGeneratedByAdminLifespan": {{ default $realmDefaults.actionTokenGeneratedByAdminLifespan $realmConfig.actionTokenGeneratedByAdminLifespan | toJson }},
  "actionTokenGeneratedByUserLifespan": {{ default $realmDefaults.actionTokenGeneratedByUserLifespan $realmConfig.actionTokenGeneratedByUserLifespan | toJson }},
  "sslRequired": {{ default $realmDefaults.sslRequired $realmConfig.sslRequired | toJson }},
  "registrationAllowed": {{ default $realmDefaults.registrationAllowed $realmConfig.registrationAllowed | toJson }},
  "registrationEmailAsUsername": {{ default $realmDefaults.registrationEmailAsUsername $realmConfig.registrationEmailAsUsername | toJson }},
  "rememberMe": {{ default $realmDefaults.rememberMe $realmConfig.rememberMe | toJson }},
  "verifyEmail": {{ default $realmDefaults.verifyEmail $realmConfig.verifyEmail | toJson }},
  "loginWithEmailAllowed": {{ default $realmDefaults.loginWithEmailAllowed $realmConfig.loginWithEmailAllowed | toJson }},
  "duplicateEmailsAllowed": {{ default $realmDefaults.duplicateEmailsAllowed $realmConfig.duplicateEmailsAllowed | toJson }},
  "resetPasswordAllowed": {{ default $realmDefaults.resetPasswordAllowed $realmConfig.resetPasswordAllowed | toJson }},
  "editUsernameAllowed": {{ default $realmDefaults.editUsernameAllowed $realmConfig.editUsernameAllowed | toJson }},
  "bruteForceProtected": {{ default $realmDefaults.bruteForceProtected $realmConfig.bruteForceProtected | toJson }},
  "permanentLockout": {{ default $realmDefaults.permanentLockout $realmConfig.permanentLockout | toJson }},
  "maxFailureWaitSeconds": {{ default $realmDefaults.maxFailureWaitSeconds $realmConfig.maxFailureWaitSeconds | toJson }},
  "minimumQuickLoginWaitSeconds": {{ default $realmDefaults.minimumQuickLoginWaitSeconds $realmConfig.minimumQuickLoginWaitSeconds | toJson }},
  "waitIncrementSeconds": {{ default $realmDefaults.waitIncrementSeconds $realmConfig.waitIncrementSeconds | toJson }},
  "quickLoginCheckMilliSeconds": {{ default $realmDefaults.quickLoginCheckMilliSeconds $realmConfig.quickLoginCheckMilliSeconds | toJson }},
  "maxDeltaTimeSeconds": {{ default $realmDefaults.maxDeltaTimeSeconds $realmConfig.maxDeltaTimeSeconds | toJson }},
  "failureFactor": {{ default $realmDefaults.failureFactor $realmConfig.failureFactor | toJson }},
  "defaultRoles": {{ default $realmDefaults.defaultRoles $realmConfig.defaultRoles | toJson }},
  "requiredCredentials": {{ default $realmDefaults.requiredCredentials $realmConfig.requiredCredentials | toJson }},
  "otpPolicyType": {{ default $realmDefaults.otpPolicyType $realmConfig.otpPolicyType | toJson }},
  "otpPolicyAlgorithm": {{ default $realmDefaults.otpPolicyAlgorithm $realmConfig.otpPolicyAlgorithm | toJson }},
  "otpPolicyInitialCounter": {{ default $realmDefaults.otpPolicyInitialCounter $realmConfig.otpPolicyInitialCounter | toJson }},
  "otpPolicyDigits": {{ default $realmDefaults.otpPolicyDigits $realmConfig.otpPolicyDigits | toJson }},
  "otpPolicyLookAheadWindow": {{ default $realmDefaults.otpPolicyLookAheadWindow $realmConfig.otpPolicyLookAheadWindow | toJson }},
  "otpPolicyPeriod": {{ default $realmDefaults.otpPolicyPeriod $realmConfig.otpPolicyPeriod | toJson }},
  "otpSupportedApplications": {{ default $realmDefaults.otpSupportedApplications $realmConfig.otpSupportedApplications | toJson }},
  "scopeMappings": {{ default $realmDefaults.scopeMappings $realmConfig.scopeMappings | toJson }},
  "clients": [
{{ range $clientConfig := .Values.keycloak.clients }}
    {
      "id": {{ default (uuidv4) $clientConfig.id | toJson }},
      "clientId": {{ default $clientDefaults.clientId $clientConfig.clientId | toJson }},
      "enabled": {{ default $clientDefaults.enabled $clientConfig.enabled | toJson }},
      "surrogateAuthRequired": {{ default $clientDefaults.surrogateAuthRequired $clientConfig.surrogateAuthRequired | toJson }},
      "clientAuthenticatorType": {{ default $clientDefaults.clientAuthenticatorType $clientConfig.clientAuthenticatorType | toJson }},
      "redirectUris": {{ default $clientDefaults.redirectUris $clientConfig.redirectUris | toJson }},
      "webOrigins": {{ default $clientDefaults.webOrigins $clientConfig.webOrigins | toJson }},
      "notBefore": {{ default $clientDefaults.notBefore $clientConfig.notBefore | toJson }},
      "bearerOnly": {{ default $clientDefaults.bearerOnly $clientConfig.bearerOnly | toJson }},
      "consentRequired": {{ default $clientDefaults.consentRequired $clientConfig.consentRequired | toJson }},
      "standardFlowEnabled": {{ default $clientDefaults.standardFlowEnabled $clientConfig.standardFlowEnabled | toJson }},
      "implicitFlowEnabled": {{ default $clientDefaults.implicitFlowEnabled $clientConfig.implicitFlowEnabled | toJson }},
      "directAccessGrantsEnabled": {{ default $clientDefaults.directAccessGrantsEnabled $clientConfig.directAccessGrantsEnabled | toJson }},
      "serviceAccountsEnabled": {{ default $clientDefaults.serviceAccountsEnabled $clientConfig.serviceAccountsEnabled | toJson }},
      "publicClient": {{ default $clientDefaults.publicClient $clientConfig.publicClient | toJson }},
      "frontchannelLogout": {{ default $clientDefaults.frontchannelLogout $clientConfig.frontchannelLogout | toJson }},
      "protocol": {{ default $clientDefaults.protocol $clientConfig.protocol | toJson }},
      "attributes": {{ default $clientDefaults.attributes $clientConfig.attributes | toJson }},
      "authenticationFlowBindingOverrides": {{ default $clientDefaults.authenticationFlowBindingOverrides $clientConfig.authenticationFlowBindingOverrides | toJson }},
      "fullScopeAllowed": {{ default $clientDefaults.fullScopeAllowed $clientConfig.fullScopeAllowed | toJson }},
      "nodeReRegistrationTimeout": {{ default $clientDefaults.nodeReRegistrationTimeout $clientConfig.nodeReRegistrationTimeout | toJson }},
      "defaultClientScopes": {{ default $clientDefaults.defaultClientScopes $clientConfig.defaultClientScopes | toJson }},
      "optionalClientScopes": {{ default $clientDefaults.optionalClientScopes $clientConfig.optionalClientScopes | toJson }}
    },
{{ end }}      
    {
      "id": "44d55197-b182-41c6-bead-3abb26a0c554",
      "clientId": "security-admin-console",
      "name": "${client_security-admin-console}",
      "baseUrl": "/auth/admin/Applications/console/index.html",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [
        "/auth/admin/Applications/console/*"
      ],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": true,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "authenticationFlowBindingOverrides": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "protocolMappers": [
        {
          "id": "dc71abb9-bfcf-4ffb-b7cd-f6c0d516b8f4",
          "name": "locale",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "locale",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "locale",
            "jsonType.label": "String"
          }
        }
      ],
      "defaultClientScopes": [
        "web-origins",
        "role_list",
        "roles",
        "profile",
        "email"
      ],
      "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
      ]
    },
    {
      "id": "e4f454ef-262d-4184-a0e9-bf5c6e9200c2",
      "clientId": "account",
      "name": "${client_account}",
      "baseUrl": "/auth/realms/Applications/account",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "defaultRoles": [
        "view-profile",
        "manage-account"
      ],
      "redirectUris": [
        "/auth/realms/Applications/account/*"
      ],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "authenticationFlowBindingOverrides": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "defaultClientScopes": [
        "web-origins",
        "role_list",
        "roles",
        "profile",
        "email"
      ],
      "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
      ]
    },
    {
      "id": "d6a5b56b-719e-4064-8b63-dc01d8fb044e",
      "clientId": "admin-cli",
      "name": "${client_admin-cli}",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": false,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": true,
      "serviceAccountsEnabled": false,
      "publicClient": true,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "authenticationFlowBindingOverrides": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "defaultClientScopes": [
        "web-origins",
        "role_list",
        "roles",
        "profile",
        "email"
      ],
      "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
      ]
    },
    {
      "id": "71e96671-edfc-4f0b-8119-a2c9df6cbca4",
      "clientId": "broker",
      "name": "${client_broker}",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "authenticationFlowBindingOverrides": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "defaultClientScopes": [
        "web-origins",
        "role_list",
        "roles",
        "profile",
        "email"
      ],
      "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
      ]
    },
    {
      "id": "e3b50210-620f-405b-9a0a-fc063814cfb2",
      "clientId": "realm-management",
      "name": "${client_realm-management}",
      "surrogateAuthRequired": false,
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [],
      "webOrigins": [],
      "notBefore": 0,
      "bearerOnly": true,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "directAccessGrantsEnabled": false,
      "serviceAccountsEnabled": false,
      "publicClient": false,
      "frontchannelLogout": false,
      "protocol": "openid-connect",
      "attributes": {},
      "authenticationFlowBindingOverrides": {},
      "fullScopeAllowed": false,
      "nodeReRegistrationTimeout": 0,
      "defaultClientScopes": [
        "web-origins",
        "role_list",
        "roles",
        "profile",
        "email"
      ],
      "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
      ]
    }
  ],
  "clientScopes": [
    {
      "id": "e11ae6ca-10bf-4f3d-8e32-f42f3b1b2c80",
      "name": "address",
      "description": "OpenID Connect built-in scope: address",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "true",
        "display.on.consent.screen": "true",
        "consent.screen.text": "${addressScopeConsentText}"
      },
      "protocolMappers": [
        {
          "id": "990494b1-1556-4b5a-8330-14e3ae2a59e3",
          "name": "address",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-address-mapper",
          "consentRequired": false,
          "config": {
            "user.attribute.formatted": "formatted",
            "user.attribute.country": "country",
            "user.attribute.postal_code": "postal_code",
            "userinfo.token.claim": "true",
            "user.attribute.street": "street",
            "id.token.claim": "true",
            "user.attribute.region": "region",
            "access.token.claim": "true",
            "user.attribute.locality": "locality"
          }
        }
      ]
    },
    {
      "id": "07abdc85-f143-42a7-b5b7-3f2092fa3660",
      "name": "email",
      "description": "OpenID Connect built-in scope: email",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "true",
        "display.on.consent.screen": "true",
        "consent.screen.text": "${emailScopeConsentText}"
      },
      "protocolMappers": [
        {
          "id": "10de5dbe-27ea-49a4-af76-54d1693bb633",
          "name": "email",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String"
          }
        },
        {
          "id": "301ed357-9462-49ac-9617-117dfd1df9e6",
          "name": "email verified",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "emailVerified",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email_verified",
            "jsonType.label": "boolean"
          }
        }
      ]
    },
    {
      "id": "0e967768-a3db-4fcd-aa9b-d08155de7721",
      "name": "microprofile-jwt",
      "description": "Microprofile - JWT built-in scope",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "true",
        "display.on.consent.screen": "false"
      },
      "protocolMappers": [
        {
          "id": "54f3b1f1-5be1-4c2d-afe0-9b4681dfd59c",
          "name": "upn",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "upn",
            "jsonType.label": "String"
          }
        },
        {
          "id": "f30e2497-09a3-4f14-8695-f1614db2ae85",
          "name": "groups",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-realm-role-mapper",
          "consentRequired": false,
          "config": {
            "multivalued": "true",
            "user.attribute": "foo",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "groups",
            "jsonType.label": "String"
          }
        }
      ]
    },
    {
      "id": "0fffcb2c-58e0-42a6-9174-c61741e2766b",
      "name": "offline_access",
      "description": "OpenID Connect built-in scope: offline_access",
      "protocol": "openid-connect",
      "attributes": {
        "consent.screen.text": "${offlineAccessScopeConsentText}",
        "display.on.consent.screen": "true"
      }
    },
    {
      "id": "19c4a4dd-7186-4bdf-8295-b834dcada04e",
      "name": "phone",
      "description": "OpenID Connect built-in scope: phone",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "true",
        "display.on.consent.screen": "true",
        "consent.screen.text": "${phoneScopeConsentText}"
      },
      "protocolMappers": [
        {
          "id": "ac2406c6-0d3e-4feb-9df7-0c1a0d3e3d7b",
          "name": "phone number",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "phoneNumber",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "phone_number",
            "jsonType.label": "String"
          }
        },
        {
          "id": "ad5ee46a-86f0-4dc9-8087-e2cf52221d7f",
          "name": "phone number verified",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "phoneNumberVerified",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "phone_number_verified",
            "jsonType.label": "boolean"
          }
        }
      ]
    },
    {
      "id": "56857438-811a-4c8c-8871-15df559c3ce7",
      "name": "profile",
      "description": "OpenID Connect built-in scope: profile",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "true",
        "display.on.consent.screen": "true",
        "consent.screen.text": "${profileScopeConsentText}"
      },
      "protocolMappers": [
        {
          "id": "747ebac0-e458-4403-b40d-6a4f09b9d7b4",
          "name": "given name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "ac71653d-9513-4619-89f2-baf59e6114e6",
          "name": "full name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-full-name-mapper",
          "consentRequired": false,
          "config": {
            "id.token.claim": "true",
            "access.token.claim": "true",
            "userinfo.token.claim": "true"
          }
        },
        {
          "id": "ba4d7dd3-3580-4bf3-8505-46e2c95330cc",
          "name": "zoneinfo",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "zoneinfo",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "zoneinfo",
            "jsonType.label": "String"
          }
        },
        {
          "id": "1ca0a329-62ac-48b6-8f51-5c0a3fb29f77",
          "name": "nickname",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "nickname",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "nickname",
            "jsonType.label": "String"
          }
        },
        {
          "id": "ac93bf33-64cf-4850-b9f3-96c5f62a5778",
          "name": "picture",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "picture",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "picture",
            "jsonType.label": "String"
          }
        },
        {
          "id": "eaea553f-c564-4ccc-81bf-e4cf9146859e",
          "name": "locale",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "locale",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "locale",
            "jsonType.label": "String"
          }
        },
        {
          "id": "61410ecf-c182-4f7a-a58d-e1b21e01ee5d",
          "name": "family name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "d527f062-1a12-42f6-b75c-91cb0898e1e8",
          "name": "website",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "website",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "website",
            "jsonType.label": "String"
          }
        },
        {
          "id": "1fdef537-0189-46e2-a459-f1cb007be6d6",
          "name": "gender",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "gender",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "gender",
            "jsonType.label": "String"
          }
        },
        {
          "id": "1a2dfa7a-7ced-4887-bd2f-112a262d3834",
          "name": "updated at",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "updatedAt",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "updated_at",
            "jsonType.label": "String"
          }
        },
        {
          "id": "39aee373-c67d-4662-abdc-6e4a47d5651d",
          "name": "middle name",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "middleName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "middle_name",
            "jsonType.label": "String"
          }
        },
        {
          "id": "f1b26ec5-5681-4372-84ee-edc55529c1e7",
          "name": "username",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-property-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String"
          }
        },
        {
          "id": "6c51c3e8-a89c-4f6e-81f7-56ba4408538c",
          "name": "profile",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "profile",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "profile",
            "jsonType.label": "String"
          }
        },
        {
          "id": "b0ea08a1-d851-4467-a089-f73bc8d0a683",
          "name": "birthdate",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-attribute-mapper",
          "consentRequired": false,
          "config": {
            "userinfo.token.claim": "true",
            "user.attribute": "birthdate",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "birthdate",
            "jsonType.label": "String"
          }
        }
      ]
    },
    {
      "id": "2f09ec94-69a7-4598-8fe5-63e2a7a47210",
      "name": "role_list",
      "description": "SAML role list",
      "protocol": "saml",
      "attributes": {
        "consent.screen.text": "${samlRoleListScopeConsentText}",
        "display.on.consent.screen": "true"
      },
      "protocolMappers": [
        {
          "id": "703c9a89-109e-4475-b2a7-a6f6a994a097",
          "name": "role list",
          "protocol": "saml",
          "protocolMapper": "saml-role-list-mapper",
          "consentRequired": false,
          "config": {
            "single": "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role"
          }
        }
      ]
    },
    {
      "id": "3e9696ae-c5a8-4b4b-a4d1-aed00869e434",
      "name": "roles",
      "description": "OpenID Connect scope for add user roles to the access token",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "false",
        "display.on.consent.screen": "true",
        "consent.screen.text": "${rolesScopeConsentText}"
      },
      "protocolMappers": [
        {
          "id": "fa649d44-5cc4-4e71-8f7d-b116c6eab6a5",
          "name": "audience resolve",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-audience-resolve-mapper",
          "consentRequired": false,
          "config": {}
        },
        {
          "id": "ea227ed2-d54a-4c80-8f78-ff5d502fe9e4",
          "name": "realm roles",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-realm-role-mapper",
          "consentRequired": false,
          "config": {
            "multivalued": "true",
            "user.attribute": "foo",
            "access.token.claim": "true",
            "claim.name": "realm_access.roles",
            "jsonType.label": "String"
          }
        },
        {
          "id": "aad78a80-7753-4406-9a38-8b5a56e65c32",
          "name": "client roles",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usermodel-client-role-mapper",
          "consentRequired": false,
          "config": {
            "multivalued": "true",
            "user.attribute": "foo",
            "access.token.claim": "true",
            "claim.name": "resource_access.${client_id}.roles",
            "jsonType.label": "String"
          }
        }
      ]
    },
    {
      "id": "a43040b9-1058-4342-8a29-2c00c33c65d1",
      "name": "web-origins",
      "description": "OpenID Connect scope for add allowed web origins to the access token",
      "protocol": "openid-connect",
      "attributes": {
        "include.in.token.scope": "false",
        "display.on.consent.screen": "false",
        "consent.screen.text": ""
      },
      "protocolMappers": [
        {
          "id": "0ca8d311-8830-463d-8e6d-da3b6cfce588",
          "name": "allowed web origins",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-allowed-origins-mapper",
          "consentRequired": false,
          "config": {}
        }
      ]
    }
  ],
  "defaultDefaultClientScopes": [
    "email",
    "role_list",
    "roles",
    "profile",
    "web-origins"
  ],
  "defaultOptionalClientScopes": [
    "microprofile-jwt",
    "offline_access",
    "phone",
    "address"
  ],
  "browserSecurityHeaders": {
    "contentSecurityPolicyReportOnly": "",
    "xContentTypeOptions": "nosniff",
    "xRobotsTag": "none",
    "xFrameOptions": "SAMEORIGIN",
    "xXSSProtection": "1; mode=block",
    "contentSecurityPolicy": "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
    "strictTransportSecurity": "max-age=31536000; includeSubDomains"
  },
  "smtpServer": {},
  "eventsEnabled": false,
  "eventsListeners": [
    "jboss-logging"
  ],
  "enabledEventTypes": [],
  "adminEventsEnabled": false,
  "adminEventsDetailsEnabled": false,
  "components": {
    "org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy": [
      {
        "id": "6df192bf-be5b-453d-af25-f17160bf6645",
        "name": "Allowed Protocol Mapper Types",
        "providerId": "allowed-protocol-mappers",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "allowed-protocol-mapper-types": [
            "oidc-address-mapper",
            "saml-role-list-mapper",
            "saml-user-property-mapper",
            "oidc-full-name-mapper",
            "oidc-sha256-pairwise-sub-mapper",
            "oidc-usermodel-property-mapper",
            "saml-user-attribute-mapper",
            "oidc-usermodel-attribute-mapper"
          ]
        }
      },
      {
        "id": "06bb7cd8-0ad7-46e6-9737-f506292c57a0",
        "name": "Allowed Client Scopes",
        "providerId": "allowed-client-templates",
        "subType": "authenticated",
        "subComponents": {},
        "config": {
          "allow-default-scopes": [
            "true"
          ]
        }
      },
      {
        "id": "ba622d08-ff84-4efb-9647-23739efdfceb",
        "name": "Full Scope Disabled",
        "providerId": "scope",
        "subType": "anonymous",
        "subComponents": {},
        "config": {}
      },
      {
        "id": "0239c3d7-f0db-4f6b-b859-74efc6601554",
        "name": "Max Clients Limit",
        "providerId": "max-clients",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "max-clients": [
            "200"
          ]
        }
      },
      {
        "id": "cba72032-1b45-43db-ba68-620c24896def",
        "name": "Trusted Hosts",
        "providerId": "trusted-hosts",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "host-sending-registration-request-must-match": [
            "true"
          ],
          "client-uris-must-match": [
            "true"
          ]
        }
      },
      {
        "id": "1d2efd1e-c68e-406b-985a-b25823651b11",
        "name": "Allowed Protocol Mapper Types",
        "providerId": "allowed-protocol-mappers",
        "subType": "authenticated",
        "subComponents": {},
        "config": {
          "allowed-protocol-mapper-types": [
            "oidc-usermodel-property-mapper",
            "saml-role-list-mapper",
            "saml-user-property-mapper",
            "oidc-full-name-mapper",
            "oidc-sha256-pairwise-sub-mapper",
            "saml-user-attribute-mapper",
            "oidc-usermodel-attribute-mapper",
            "oidc-address-mapper"
          ]
        }
      },
      {
        "id": "391a4937-5574-457a-bf87-3b5a1300edb8",
        "name": "Allowed Client Scopes",
        "providerId": "allowed-client-templates",
        "subType": "anonymous",
        "subComponents": {},
        "config": {
          "allow-default-scopes": [
            "true"
          ]
        }
      },
      {
        "id": "0a4f6b39-2d6b-43ac-b663-46161e78d324",
        "name": "Consent Required",
        "providerId": "consent-required",
        "subType": "anonymous",
        "subComponents": {},
        "config": {}
      }
    ],
    "org.keycloak.keys.KeyProvider": [
      {
        "id": "3d2d2d45-83d2-4dbd-8ce2-b459d27f1895",
        "name": "aes-generated",
        "providerId": "aes-generated",
        "subComponents": {},
        "config": {
          "priority": [
            "100"
          ]
        }
      },
      {
        "id": "a2f693db-1905-4414-82e1-29fb3cd98d7a",
        "name": "hmac-generated",
        "providerId": "hmac-generated",
        "subComponents": {},
        "config": {
          "priority": [
            "100"
          ],
          "algorithm": [
            "HS256"
          ]
        }
      },
      {
        "id": "06deeae8-79da-474d-9eb9-71878977414f",
        "name": "rsa-generated",
        "providerId": "rsa-generated",
        "subComponents": {},
        "config": {
          "priority": [
            "100"
          ]
        }
      }
    ]
  },
  "internationalizationEnabled": false,
  "supportedLocales": [],
  "authenticationFlows": [
    {
      "id": "bdadbde5-be7e-4e95-91bc-022eb3df2128",
      "alias": "Handle Existing Account",
      "description": "Handle what to do if there is existing account with same email/username like authenticated identity provider",
      "providerId": "basic-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "idp-confirm-link",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "idp-email-verification",
          "requirement": "ALTERNATIVE",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "flowAlias": "Verify Existing Account by Re-authentication",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "3960cd79-2273-49a5-98a0-3fcc4665c417",
      "alias": "Verify Existing Account by Re-authentication",
      "description": "Reauthentication of existing account",
      "providerId": "basic-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "idp-username-password-form",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-otp-form",
          "requirement": "OPTIONAL",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "e98488c8-f58f-4e62-b551-293b1ca5c630",
      "alias": "browser",
      "description": "browser based authentication",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "auth-cookie",
          "requirement": "ALTERNATIVE",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-spnego",
          "requirement": "DISABLED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "identity-provider-redirector",
          "requirement": "ALTERNATIVE",
          "priority": 25,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "flowAlias": "forms",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "91449df4-cb86-4538-8a81-0d21c7da3da9",
      "alias": "clients",
      "description": "Base authentication for clients",
      "providerId": "client-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "client-secret",
          "requirement": "ALTERNATIVE",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "client-jwt",
          "requirement": "ALTERNATIVE",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "client-secret-jwt",
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "client-x509",
          "requirement": "ALTERNATIVE",
          "priority": 40,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "156ce578-0049-4116-adad-3f70e2f865b1",
      "alias": "direct grant",
      "description": "OpenID Connect Resource Owner Grant",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "direct-grant-validate-username",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "direct-grant-validate-password",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "direct-grant-validate-otp",
          "requirement": "OPTIONAL",
          "priority": 30,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "2fa097b0-37e9-4df9-b94f-e4a574c1c721",
      "alias": "docker auth",
      "description": "Used by Docker clients to authenticate against the IDP",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "docker-http-basic-authenticator",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "aa58f47e-d656-420e-827a-54acf756e187",
      "alias": "first broker login",
      "description": "Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticatorConfig": "review profile config",
          "authenticator": "idp-review-profile",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticatorConfig": "create unique user config",
          "authenticator": "idp-create-user-if-unique",
          "requirement": "ALTERNATIVE",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "requirement": "ALTERNATIVE",
          "priority": 30,
          "flowAlias": "Handle Existing Account",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "fe32ec3e-0a60-42d5-a4a7-defed47f41a3",
      "alias": "forms",
      "description": "Username, password, otp and other auth forms.",
      "providerId": "basic-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "auth-username-password-form",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-otp-form",
          "requirement": "OPTIONAL",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "c35f740b-edc7-4b15-b68a-abe7e49081c6",
      "alias": "http challenge",
      "description": "An authentication flow based on challenge-response HTTP Authentication Schemes",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "no-cookie-redirect",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "basic-auth",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "basic-auth-otp",
          "requirement": "DISABLED",
          "priority": 30,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "auth-spnego",
          "requirement": "DISABLED",
          "priority": 40,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "d2eed109-d966-4ff2-bcfb-99e8a0fc7c77",
      "alias": "registration",
      "description": "registration flow",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "registration-page-form",
          "requirement": "REQUIRED",
          "priority": 10,
          "flowAlias": "registration form",
          "userSetupAllowed": false,
          "autheticatorFlow": true
        }
      ]
    },
    {
      "id": "29a37958-439a-48e5-b426-48a1337da038",
      "alias": "registration form",
      "description": "registration form",
      "providerId": "form-flow",
      "topLevel": false,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "registration-user-creation",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "registration-profile-action",
          "requirement": "REQUIRED",
          "priority": 40,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "registration-password-action",
          "requirement": "REQUIRED",
          "priority": 50,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "registration-recaptcha-action",
          "requirement": "DISABLED",
          "priority": 60,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "5aecdb8d-a2a3-43ec-9c5d-307a09a11f2d",
      "alias": "reset credentials",
      "description": "Reset credentials for a user if they forgot their password or something",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "reset-credentials-choose-user",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "reset-credential-email",
          "requirement": "REQUIRED",
          "priority": 20,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "reset-password",
          "requirement": "REQUIRED",
          "priority": 30,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        },
        {
          "authenticator": "reset-otp",
          "requirement": "OPTIONAL",
          "priority": 40,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    },
    {
      "id": "b3609ece-43d2-4afb-bcb0-a98a205aa4c7",
      "alias": "saml ecp",
      "description": "SAML ECP Profile Authentication Flow",
      "providerId": "basic-flow",
      "topLevel": true,
      "builtIn": true,
      "authenticationExecutions": [
        {
          "authenticator": "http-basic-authenticator",
          "requirement": "REQUIRED",
          "priority": 10,
          "userSetupAllowed": false,
          "autheticatorFlow": false
        }
      ]
    }
  ],
  "authenticatorConfig": [
    {
      "id": "45883e5d-c018-4858-99b5-c488754764cf",
      "alias": "create unique user config",
      "config": {
        "require.password.update.after.registration": "false"
      }
    },
    {
      "id": "140afca0-e377-4275-818b-c56ff3a3353b",
      "alias": "review profile config",
      "config": {
        "update.profile.on.first.login": "missing"
      }
    }
  ],
  "requiredActions": [
    {
      "alias": "CONFIGURE_TOTP",
      "name": "Configure OTP",
      "providerId": "CONFIGURE_TOTP",
      "enabled": true,
      "defaultAction": false,
      "priority": 10,
      "config": {}
    },
    {
      "alias": "terms_and_conditions",
      "name": "Terms and Conditions",
      "providerId": "terms_and_conditions",
      "enabled": false,
      "defaultAction": false,
      "priority": 20,
      "config": {}
    },
    {
      "alias": "UPDATE_PASSWORD",
      "name": "Update Password",
      "providerId": "UPDATE_PASSWORD",
      "enabled": true,
      "defaultAction": false,
      "priority": 30,
      "config": {}
    },
    {
      "alias": "UPDATE_PROFILE",
      "name": "Update Profile",
      "providerId": "UPDATE_PROFILE",
      "enabled": true,
      "defaultAction": false,
      "priority": 40,
      "config": {}
    },
    {
      "alias": "VERIFY_EMAIL",
      "name": "Verify Email",
      "providerId": "VERIFY_EMAIL",
      "enabled": true,
      "defaultAction": false,
      "priority": 50,
      "config": {}
    }
  ],
  "browserFlow": "browser",
  "registrationFlow": "registration",
  "directGrantFlow": "direct grant",
  "resetCredentialsFlow": "reset credentials",
  "clientAuthenticationFlow": "clients",
  "dockerAuthenticationFlow": "docker auth",
  "attributes": {
    "_browser_header.xXSSProtection": "1; mode=block",
    "_browser_header.xFrameOptions": "SAMEORIGIN",
    "_browser_header.strictTransportSecurity": "max-age=31536000; includeSubDomains",
    "permanentLockout": "false",
    "quickLoginCheckMilliSeconds": "1000",
    "_browser_header.xRobotsTag": "none",
    "maxFailureWaitSeconds": "900",
    "minimumQuickLoginWaitSeconds": "60",
    "failureFactor": "30",
    "actionTokenGeneratedByUserLifespan": "300",
    "maxDeltaTimeSeconds": "43200",
    "_browser_header.xContentTypeOptions": "nosniff",
    "offlineSessionMaxLifespan": "5184000",
    "actionTokenGeneratedByAdminLifespan": "43200",
    "_browser_header.contentSecurityPolicyReportOnly": "",
    "bruteForceProtected": "true",
    "_browser_header.contentSecurityPolicy": "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
    "waitIncrementSeconds": "60",
    "offlineSessionMaxLifespanEnabled": "false"
  },
  "keycloakVersion": "6.0.1",
  "userManagedAccessAllowed": false
}
{{ end -}}