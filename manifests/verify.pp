# Defined Resource: bsl_account::verify
# ===========================
#
# Will verify status of a Bitswarm.io user/organization account and optionally
# fail catalog.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `account_id`
# Bitswarm Account ID
#
# Examples
# --------
#
# @example
#    bsl_account::verify{ 'bitswarmlabs':
#      fail_if_not => true,
#    }
#
# Authors
# -------
#
# Reuben Avery <ravery@bitswarm.io>
#
# Copyright
# ---------
#
# Copyright 2016 Bitswarm Labs Inc
#
define bsl_account::verify(
  $account_id = $name,
  $tenant_id = undef,
  $fail_if_not = false,
  $emerg_if_not = false,
) {
  include 'bsl_account::config'

  $_verified = true
  $_failure_message = 'derp'

  if $_verified {
    if empty($tenant_id) {
      # notify { "## bsl_account_id ${account_id} verified (NOT TENANT)": }
    }
    else {
      # notify { "## bsl_account_id ${account_id} verified (TENANT)": }
    }
  }
  else {
    $failure_message = "bsl_account_id ${account_id} invalid: ${_failure_message}"

    if $emerg_if_not {
      emerg($failure_message)
    }

    if $fail_if_not {
      fail($failure_message)
    }
    else {
      err($failure_message)
    }
  }
}
