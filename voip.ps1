conf t
 voice service voip
  allow-connections h323 to sip    
  allow-connections sip to h323
  allow-connections sip to sip
  supplementary-service h450.12
 sip
   bind control source-interface fa0/0
   bind media source-interface fa0/0
   registrar server expires max 600 min 60
!
 voice register global
  mode cme
  source-address 10.11.100.8 port 5060
  max-dn 12
  max-pool 12
  authenticate register
  create profile sync
 voice register dn 1
   number 1128
   allow watch
   name 1128
 voice register dn 2
   number 1127
   allow watch
   name 1127
!
  voice register pool 1
    id mac F0C3.71A5.1B8D
    number 1 dn 1
    dtmf-relay sip-notify
    username 1128 password 1128
    codec g711ulaw
!
  voice register pool 2
    id mac 76e5.5268.cba5
    number 1 dn 2
    dtmf-relay sip-notify
    username m27 password m27
    codec g711ulaw
!
*******call other countries!!!********
config t
!
dial-peer voice _ voip
destination-pattern k..
session protocol sipv2
session target sip-server
codec g711ulaw
exit
          
sip-ua
sip-server ipv4:192.168.k.1