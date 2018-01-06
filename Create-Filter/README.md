# Dovecot-Imap
----
## Run remote_create_subject_filter
**Param Description**
* Param 1: Remoter server address
* Param 2: Remote server password
* Param 3: Sieve path as configured in Dovecot configuration
* Param 4: Filter in the  subject field. It will create the filter for "exact match" in subject field
* Param 5: Folder to move the mail 
Example:
./remote_create_subject_filter.sh "fmaster@mail1.cc.com"  "fmaster" "~/seive" "user1" "user.user1"
----
