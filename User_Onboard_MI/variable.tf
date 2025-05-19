variable "user_input" {
  description = "List of user objects"
  type        = list(object({
    displayName        = string
    userPrincipalName  = string
    mailNickname       = string
    password           = string
  }))
}


variable "subscription_id" {
  type        = string
  default = "03fd5f14-f166-4b6e-8829-3b6432cdfeff"
  description = "Subscription ID where the policies will be assigned"
}