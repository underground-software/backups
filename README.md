# backups

Script and scheme to keep KDLP ORBIT production data storage redundant

## Current Status

Currently, we simply copy the user database into the repository with a unix timstamp suffix appended to the original filename. This is implmenented by the daily cronjob that invokes our `do_local_backup.sh`.

## Development Task List 

- [ ] create secure method to pull backups to external system
- [ ] investigate which other data needs to be backed up
- [ ] automate external backups
