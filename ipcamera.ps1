config t
ip routing
ip dhcp pool CAMERA6
host 10.11.50.6 255.255.255.0
client-identifier 001a.070a.27e4
ip dhcp pool CAMERA8
host 10.11.50.8 255.255.255.0
client-identifier 0006.f690.ba60
end
show ip dhcp binding