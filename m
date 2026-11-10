Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339905;
	b=J1SxNsTjtAX+AAoRwMZ9cG0VHIkr0z29kd6mjWqrxYs+5eBY/DEzNgsfTCdnVf2O3e2P
	 tHMt6/p3ocFl4fYO+ei116W3iapi96dozPRZZEdiP26k7b4myBLRfT+5zZgvDao2ovfLj
	 2p0kpGmAqeoVbwpmgM6z9u58nbefIG0hPTF3LtO7YOufHP1DwHa7qCBlz838DLSQOEI+I
	 9QEagM7uK9AsvsErwI66FT3oM2sElcqORKUh+mLN5Ej95m4unCdUmiq3RSThPzT1vEEuA
	 HYr7soVTbQ7TGj25dvysWW5mBmXp8pzo+Xrc8VnHSWWAm4J0IwNPmr8g6vJpkk7VD6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=219PjLGBLrfkBstZfpxq/zO1XBceKdGtDDmzL3mxW6c=;
	b=qWxGWiSjsBnorrMEdK7WQMi/irXviFBlZZjJcsQyZBr68R6xwq6lpDCMQ87Khf/aJf+P
	 2Woa3NIiz5RKHEOKzRyVfeRnxh7ADN91jutgOFrFXDyRftD/yM5VBd4unsXKoHJF095aP
	 5Y2LZB2gKmG/nPYFfcT6jFHO2stDF5o5fs4n95iKUEfbNpAdqGVlZb6jcWBoCANbImN4/
	 2Cl1bspGbiK+GKThb6iQkbGqxNFC4oPPQ7sPBFcNClxPzWk0nHxzCMSz9qH2W35jlnigp
	 LEG/1b7bSu8KPJutAU7OtuBfIcMfbwq5ebARS8o2V0va60TSqmvztNWyxZkMlEkkIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51465606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51465606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c734afb8deso2680233b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339904; x=1794944704;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=219PjLGBLrfkBstZfpxq/zO1XBceKdGtDDmzL3mxW6c=;
        b=BU3/efnv483S8lAzVMMpHH53CAruBIgmIVTJZ/L+dT1gk9xFPa02j0m+0vOOMs5R9c
         BdfNn0dvBIo5/OwA5ZfTJcyMsijsWj7Bt5lilt37uAVnhIHLRAOQkDxIbryC6LLoEb9D
         4gTscRgGG+dKq+sWjaFJTACbBuuHOv0RYCQ9gcl8CtCm25FzaVZBzn+AP5oeLnmaH/VA
         r72tvVQTAuKHjRJYUwrymY0gucRd1BwU6/lTzysfNjLd3QliSY7YKyQ0KfLvDOiNZde4
         P6TQxnqm96Iy9iyhz0X20iJat+eZ0HcneEiFl9AYXV2+3WyfgdM4gANEnVcJ9SasXA7E
         Pt3Q==
X-Gm-Message-State: APuU4Z/i/sRuolXhM6v+lD8IPq7HBAKogZXGtQz5vOGWF1GZ/1cpUuGm
	3nt4V8ubA5Yatpcg6MjwRRe7xFotEPaWv7yXI0gEeL0e2DERb7zwZGj6CEqsVCio0fONlviWUOE
	auIGiIfNLkzve0dhE7HxSE7rg3QeV77i6w5feKhIXGRAW/OKr0zkW+toB0cI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f51:b0:54e:7cf0:c0b9 with SMTP id
 5614622812f47-5683ce19639mr3234235b6e.64.1794339904290; Tue, 10 Nov 2026
 11:45:04 -0800 (PST)
Date: Tue, 10 Nov 2026 11:45:04 -0800
In-Reply-To: <CAO7_G+yzCcvqn1+e0EtEk6=BxyK0yFEZPC7hVU7fma5zk-MnBA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af37440.c2a1e073.10a5a1.1174.GAE@google.com>
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
From: syzbot <syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

SYZFAIL: failed to recv rpc

SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).


Warning: Permanently added '[localhost]:55209' (ED25519) to the list of kno=
wn hosts.
2026/11/10 19:43:45 parsed 1 programs
2026/11/10 19:43:45 serving rpc on tcp://44245
[   46.806227][ T5734] cgroup: Unknown subsys name 'net'
[   46.893911][ T5734] cgroup: Unknown subsys name 'cpuset'
[   46.897550][ T5734] cgroup: Unknown subsys name 'rlimit'
qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0) is smaller than=
 the requested size (0x400000)
qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0) is smaller than=
 the requested size (0x400000)
[   47.058702][ T1130] ata1.00: Read log 0x10 page 0x00 failed, Emask 0x1
[   47.058717][ T1130] ata1: failed to read log page 10h (errno=3D-5)
[   47.058729][ T1130] ata1.00: exception Emask 0x1 SAct 0x380 SErr 0x0 act=
ion 0x0
[   47.058739][ T1130] ata1.00: irq_stat 0x41000000
[   47.058751][ T1130] ata1.00: failed command: WRITE FPDMA QUEUED
[   47.058757][ T1130] ata1.00: cmd 61/00:38:36:81:05/20:00:00:00:00/40 tag=
 7 ncq dma 4194304 ou
[   47.058757][ T1130]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   47.058788][ T1130] ata1.00: status: { DRDY }
[   47.058797][ T1130] ata1.00: failed command: WRITE FPDMA QUEUED
[   47.058803][ T1130] ata1.00: cmd 61/00:40:36:a1:05/20:00:00:00:00/40 tag=
 8 ncq dma 4194304 ou
[   47.058803][ T1130]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   47.058833][ T1130] ata1.00: status: { DRDY }
[   47.058842][ T1130] ata1.00: failed command: WRITE FPDMA QUEUED
[   47.058848][ T1130] ata1.00: cmd 61/c8:48:36:c1:05/0f:00:00:00:00/40 tag=
 9 ncq dma 2068480 ou
[   47.058848][ T1130]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   47.058878][ T1130] ata1.00: status: { DRDY }
[   47.059522][ T1130] ata1.00: configured for UDMA/100
[   47.060364][ T1130] ata1: EH complete
[   71.140054][ T1442] ieee802154 phy0 wpan0: encryption failed: -22
[   71.140114][ T1442] ieee802154 phy1 wpan1: encryption failed: -22
[   76.260682][ T2395] cfg80211: failed to load regulatory.db
[   77.598236][ T1130] ata1.00: NCQ disabled due to excessive errors
[   77.598250][ T1130] ata1.00: exception Emask 0x0 SAct 0x40000 SErr 0x0 a=
ction 0x6 frozen
[   77.598265][ T1130] ata1.00: failed command: WRITE FPDMA QUEUED
[   77.598272][ T1130] ata1.00: cmd 61/00:90:36:a1:05/20:00:00:00:00/40 tag=
 18 ncq dma 4194304 ou
[   77.598272][ T1130]          res 40/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x4 (timeout)
[   77.598303][ T1130] ata1.00: status: { DRDY }
[   77.598338][ T1130] ata1: hard resetting link
[   77.923282][ T1130] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 30=
0)
[   77.924116][ T1130] ata1.00: configured for UDMA/100
[   77.924338][ T1130] ata1: EH complete
Setting up swapspace version 1, size =3D 127995904 bytes
[   78.684000][ T5734] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   80.705164][ T5753] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   80.743728][ T5753] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   80.745528][   T38] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   80.745540][   T38] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   80.761605][ T5753] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   80.826474][ T1169] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   80.826488][ T1169] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   81.255232][ T5783] br_netfilter no longer supported in user namespaces
[   81.421318][ T5783] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   81.421570][ T5783] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   81.619224][ T5815] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   81.620095][ T5815] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   81.620778][ T5815] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   81.621504][ T5815] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   81.621954][ T5815] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   82.036534][ T5784] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   82.037138][ T5784] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   82.037206][ T5784] bridge_slave_0: entered allmulticast mode
[   82.038224][ T5784] bridge_slave_0: entered promiscuous mode
[   82.041159][ T5784] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   82.041225][ T5784] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   82.041283][ T5784] bridge_slave_1: entered allmulticast mode
[   82.042083][ T5784] bridge_slave_1: entered promiscuous mode
[   82.056544][ T5784] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   82.057858][ T5784] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   82.071287][ T5784] team0: Port device team_slave_0 added
[   82.072573][ T5784] team0: Port device team_slave_1 added
[   82.083563][ T5784] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   82.083574][ T5784] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   82.083588][ T5784] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   82.085206][ T5784] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   82.085215][ T5784] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   82.085229][ T5784] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   82.116630][ T5784] hsr_slave_0: entered promiscuous mode
[   82.117141][ T5784] hsr_slave_1: entered promiscuous mode
[   82.369913][ T5784] netdevsim netdevsim9 netdevsim0: renamed from eth0
[   82.376209][ T5784] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   82.377262][ T5784] netdevsim netdevsim9 netdevsim1: renamed from eth1
[   82.380116][ T5784] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   82.380866][ T5784] netdevsim netdevsim9 netdevsim2: renamed from eth2
[   82.386962][ T5784] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   82.388402][ T5784] netdevsim netdevsim9 netdevsim3: renamed from eth3
[   82.391729][ T5784] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   82.416527][ T5784] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   82.416645][ T5784] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   82.417096][ T5784] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   82.417193][ T5784] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   82.469095][ T5784] 8021q: adding VLAN 0 to HW filter on device bond0
[   82.484256][   T63] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   82.485301][   T63] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   82.502895][ T5784] 8021q: adding VLAN 0 to HW filter on device team0
[   82.507456][   T63] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   82.507546][   T63] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   82.515219][   T63] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   82.515287][   T63] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   82.794103][ T5784] 8021q: adding VLAN 0 to HW filter on device batadv0
[   82.944564][ T5784] veth0_vlan: entered promiscuous mode
[   82.948109][ T5784] veth1_vlan: entered promiscuous mode
[   82.962868][ T5784] veth0_macvtap: entered promiscuous mode
[   82.965747][ T5784] veth1_macvtap: entered promiscuous mode
[   82.973689][ T5784] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   82.978359][ T5784] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   83.028783][   T14] netdevsim netdevsim9 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   83.029066][   T14] netdevsim netdevsim9 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   83.029087][   T14] netdevsim netdevsim9 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   83.029105][   T14] netdevsim netdevsim9 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   83.066068][   T13] netdevsim netdevsim9 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   83.164702][   T13] netdevsim netdevsim9 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   83.258043][   T13] netdevsim netdevsim9 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   83.319660][   T13] netdevsim netdevsim9 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   84.441016][   T13] bridge_slave_1: left allmulticast mode
[   84.441041][   T13] bridge_slave_1: left promiscuous mode
[   84.441512][   T13] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   84.444540][   T13] bridge_slave_0: left allmulticast mode
[   84.444553][   T13] bridge_slave_0: left promiscuous mode
[   84.444976][   T13] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   84.541766][   T13] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   84.546845][   T13] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   84.548305][   T13] bond0 (unregistering): Released all slaves
[   84.613074][   T13] hsr_slave_0: left promiscuous mode
[   84.613487][   T13] hsr_slave_1: left promiscuous mode
[   84.613915][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   84.613931][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   84.614532][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   84.614542][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   84.618239][   T13] veth1_macvtap: left promiscuous mode
[   84.618278][   T13] veth0_macvtap: left promiscuous mode
[   84.618325][   T13] veth1_vlan: left promiscuous mode
[   84.618363][   T13] veth0_vlan: left promiscuous mode
[   84.755242][   T13] team0 (unregistering): Port device team_slave_1 remo=
ved
[   84.765279][   T13] team0 (unregistering): Port device team_slave_0 remo=
ved
[   84.829397][ T5441] 8021q: adding VLAN 0 to HW filter on device eth2
[   84.996382][ T5441] 8021q: adding VLAN 0 to HW filter on device eth3
[   85.136235][ T5441] 8021q: adding VLAN 0 to HW filter on device eth4
[   85.264192][ T5441] 8021q: adding VLAN 0 to HW filter on device eth5


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1399445064=3D/tmp/go-build -gno-record-gc=
c-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.26.0'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at d2e5fb956a
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Dd2e5fb956ad222b37a913979e04dc012f4868836 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260903-102143"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Dd2e5fb956ad222b37a913979e04dc012f4868836 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260903-102143"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dd2e5fb956ad222b37a913979e04dc012f4868836 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260903-102143"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"d2e5fb956ad222b37a913979e04dc012f4=
868836\"
/usr/bin/ld: /tmp/cclh0b8o.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         067c5c24 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc40cb9cd7a4b919=
a
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dfefa0af09f7891b18=
00e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D166c044d5800=
00

