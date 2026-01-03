# 2026-01-02 23:33:53 by RouterOS 7.20.6
# system id = UCzMB2f5bED
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/interface list
add name=WAN
add name=LAN
/ip hotspot profile
add dns-name=hotspot.local hotspot-address=192.168.88.1 name=hsprof1 \
    use-radius=yes
/ip pool
add name=hs-pool-3 ranges=192.168.88.2-192.168.88.254
/ip hotspot
add address-pool=hs-pool-3 disabled=no interface=ether2 name=hotspot1 \
    profile=hsprof1
/interface list member
add interface=ether1 list=WAN
/ip address
add address=192.168.18.0/24 interface=ether1 network=192.168.18.0
add address=192.168.88.1/24 interface=ether2 network=192.168.88.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server
add address-pool=hs-pool-3 interface=ether2 name=dhcp1
/ip dhcp-server network
add address=192.168.88.0/24 comment="hotspot network" gateway=192.168.88.1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=drop chain=forward dst-address=1.1.1.1 dst-port=443 \
    out-interface-list=all port="" protocol=tcp src-address=0.0.0.0
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.88.0/24
/ip hotspot user
add name=admin
/radius
add address=35.227.71.209 service=hotspot
add address=35.227.71.209 service=hotspot
