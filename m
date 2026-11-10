Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338343;
	b=r3G1EwuHf+FwBvC1P0QmccIWrpEqPYRQE87lat2N3P8MZz/fp89ICf/TvHAv9lqFX/8T
	 epNmm8nuPYJI22HPEccvqPuzymLq+5Bgay21WmbNHZ3e0cfAFo2tFXBsBC5BDpdJb+JUN
	 XSSZHMMovtpPbcpgoeljCpHy70Josr775eSYquuUgU4ivYlpR1Tgd9EBTJyU6LkOI+xeP
	 NbQraW6twSstEr+KeTo8b2odzH5pF4psrBe3rDWNc85tEbCdf7A0qBMDIz4rSk1C4eu1s
	 24bq/EVtAO3ecivgIontmhzTj/h4G1s3mdNk5By3m98OirXnz0oA2d8xmYKpsrEAatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338343;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BBBpoQdOo1zj3nCTlhOj84mEJaqVJUaKe0sIIXCjUI4=;
	b=Lmu+cM1lBzYXr3LosJDqor1bAYLHP2b50C5yHiH4kYOvLm6t0ngvQKNsZfwejafB0oQm
	 +zlY6iey5v/XHed6phXV7w4M4KOHh5Mu6hz+5owS19JtQPevlUosgspG46Mc5+txV7WvB
	 R6qD5AlOE1l9MNpiBceYnPeP+UOLI2vIa2+iJibxMpqGIurb583TJGfzfnicw0XO2fbxN
	 1kDOaEhtlBX3+Ofbqw7AF7oU2Kv8sDTtE43ESg0hbp0m2j6jBsTldTZ1m6TQ4pg0l2MeL
	 GZix3lsPw5QpRz2pd+bsMoCuC+d/rsTfk9zQnMaJl2bdgCoth1d8RP9MjYdV7sy66Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1495606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1495606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab260600easo3478813b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338341; x=1794943141;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBBpoQdOo1zj3nCTlhOj84mEJaqVJUaKe0sIIXCjUI4=;
        b=vJtmTq1Ki9pupRFGcpKf9RqIzmiATbblukf3peR60+PYbN1APog1wU3U06hpsczb3D
         m9T9GMGwXbPYyMYDp+DEfQnwnI3pP2ZiMtfttK73ZPyKKfzUB90dgqnbtQbQgIljSRt7
         hVREc098b3/j8BaPNi7Updj87//5GuAZwiTvFOPKZVy/OE80694VaFtNzueRiI6fugmo
         eHtZU5BPialgNYBtnzYbCP/XNEUy4SZLO8d3vnivTAs+9lXAuRnfA3OlAuLTbqsf5EY3
         Tspctu4v/59TG54+UGTLTRRUgjqO6mYs/3eG9+cWrnjkC14TUJuw74q8I0VufeK2rCSJ
         oRig==
X-Gm-Message-State: APuU4Z8yMrM8w5GQIa8IrEQV6gWsc1h8O64qi0cqnYhJwJHGjZ4IQvqo
	MVpsKY4ReIFvbh3+08afMUY3B9ydBjn2aOM8HM5YrOeykgYXNJKcKgFtoNwwd3sRNaGgv5d9LMJ
	Jk8JoUuA7hf9CD0F0eDHt8SovoLXLBGaSOL8NbZ17U37Mqt+VGEHMaldE4MI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b08:b0:4fb:b543:dc3c with SMTP id
 5614622812f47-56872851d5bmr2107359b6e.5.1794338341719; Tue, 10 Nov 2026
 11:19:01 -0800 (PST)
Date: Tue, 10 Nov 2026 11:19:01 -0800
In-Reply-To: <CAO7_G+zVhxDF7obCuC6gyTByFqw7G4fLrSKRRYxpdgt8B-iRig@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af36e25.6ea51c61.3838e6.0013.GAE@google.com>
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


syzkaller login: qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0=
) is smaller than the requested size (0xa4000)
[   40.695586][ T1132] ata1.00: Read log 0x10 page 0x00 failed, Emask 0x1
[   40.695609][ T1132] ata1: failed to read log page 10h (errno=3D-5)
[   40.695625][ T1132] ata1.00: exception Emask 0x1 SAct 0x40000001 SErr 0x=
0 action 0x0
[   40.695642][ T1132] ata1.00: irq_stat 0x41000000
[   40.695657][ T1132] ata1.00: failed command: WRITE FPDMA QUEUED
[   40.695668][ T1132] ata1.00: cmd 61/c0:00:d6:d4:04/02:00:00:00:00/40 tag=
 0 ncq dma 360448 out
[   40.695668][ T1132]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   40.695725][ T1132] ata1.00: status: { DRDY }
[   40.695744][ T1132] ata1.00: failed command: WRITE FPDMA QUEUED
[   40.695754][ T1132] ata1.00: cmd 61/20:f0:b6:cf:04/05:00:00:00:00/40 tag=
 30 ncq dma 671744 out
[   40.695754][ T1132]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   40.695804][ T1132] ata1.00: status: { DRDY }
[   40.698151][ T1132] ata1.00: configured for UDMA/100
[   40.699728][ T1132] ata1: EH complete
qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0) is smaller than=
 the requested size (0x74000)
[   41.145768][ T1132] ata1.00: Read log 0x10 page 0x00 failed, Emask 0x1
[   41.145794][ T1132] ata1: failed to read log page 10h (errno=3D-5)
[   41.145811][ T1132] ata1.00: NCQ disabled due to excessive errors
[   41.145827][ T1132] ata1.00: exception Emask 0x1 SAct 0xc000 SErr 0x0 ac=
tion 0x0
[   41.145847][ T1132] ata1.00: irq_stat 0x41000000
[   41.145865][ T1132] ata1.00: failed command: WRITE FPDMA QUEUED
[   41.145877][ T1132] ata1.00: cmd 61/a0:70:76:23:05/03:00:00:00:00/40 tag=
 14 ncq dma 475136 out
[   41.145877][ T1132]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   41.145936][ T1132] ata1.00: status: { DRDY }
[   41.145953][ T1132] ata1.00: failed command: WRITE FPDMA QUEUED
[   41.145965][ T1132] ata1.00: cmd 61/a0:78:16:27:05/01:00:00:00:00/40 tag=
 15 ncq dma 212992 out
[   41.145965][ T1132]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   41.146021][ T1132] ata1.00: status: { DRDY }
[   41.147166][ T1132] ata1.00: configured for UDMA/100
[   41.147598][ T1132] ata1: EH complete
Warning: Permanently added '[localhost]:10258' (ED25519) to the list of kno=
wn hosts.
2026/11/10 19:18:00 parsed 1 programs
2026/11/10 19:18:00 serving rpc on tcp://40647
[   49.837740][ T5740] cgroup: Unknown subsys name 'net'
[   49.959097][ T5740] cgroup: Unknown subsys name 'cpuset'
[   49.965851][ T5740] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   51.285808][ T5740] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   54.028891][ T5749] br_netfilter no longer supported in user namespaces
[   54.237822][ T5750] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   54.247672][ T5750] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   54.256697][ T5749] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   54.257053][ T5749] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   54.257585][ T5749] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   54.822081][ T5780] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   54.824858][ T5780] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   54.825442][ T5780] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   54.826993][ T5780] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   54.828355][ T5780] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   55.710030][   T58] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   55.710052][   T58] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   55.796138][   T64] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   55.796159][   T64] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   56.105302][ T5792] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   56.105995][ T5792] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   56.106127][ T5792] bridge_slave_0: entered allmulticast mode
[   56.107440][ T5792] bridge_slave_0: entered promiscuous mode
[   56.112162][ T5792] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   56.112277][ T5792] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   56.112364][ T5792] bridge_slave_1: entered allmulticast mode
[   56.113667][ T5792] bridge_slave_1: entered promiscuous mode
[   56.243179][ T5792] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   56.249968][ T5792] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   56.279929][ T5792] team0: Port device team_slave_0 added
[   56.284745][ T5792] team0: Port device team_slave_1 added
[   56.336955][ T5792] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   56.336971][ T5792] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   56.336993][ T5792] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   56.339364][ T5792] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   56.339379][ T5792] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   56.339399][ T5792] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   56.444453][ T5792] hsr_slave_0: entered promiscuous mode
[   56.445602][ T5792] hsr_slave_1: entered promiscuous mode
[   56.680553][ T5792] netdevsim netdevsim6 netdevsim0: renamed from eth0
[   56.688922][ T5792] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   56.690068][ T5792] netdevsim netdevsim6 netdevsim1: renamed from eth1
[   56.699110][ T5792] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   56.699933][ T5792] netdevsim netdevsim6 netdevsim2: renamed from eth2
[   56.704044][ T5792] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   56.706330][ T5792] netdevsim netdevsim6 netdevsim3: renamed from eth3
[   56.720592][ T5792] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   56.792642][ T5792] 8021q: adding VLAN 0 to HW filter on device bond0
[   56.806874][ T5792] 8021q: adding VLAN 0 to HW filter on device team0
[   56.812901][   T38] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   56.813038][   T38] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   56.821070][   T38] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   56.821208][   T38] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   57.141849][ T5792] 8021q: adding VLAN 0 to HW filter on device batadv0
[   57.318971][ T5792] veth0_vlan: entered promiscuous mode
[   57.326614][ T5792] veth1_vlan: entered promiscuous mode
[   57.347385][ T5792] veth0_macvtap: entered promiscuous mode
[   57.353637][ T5792] veth1_macvtap: entered promiscuous mode
[   57.371911][ T5792] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   57.379296][ T5792] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   57.395826][ T5763] netdevsim netdevsim6 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.415584][ T5763] netdevsim netdevsim6 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.466761][ T5763] netdevsim netdevsim6 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.466810][ T5763] netdevsim netdevsim6 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.486746][ T5763] netdevsim netdevsim6 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   57.578846][ T5763] netdevsim netdevsim6 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   57.644338][ T5763] netdevsim netdevsim6 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   57.731907][ T5763] netdevsim netdevsim6 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   58.942574][ T5763] bridge_slave_1: left allmulticast mode
[   58.942609][ T5763] bridge_slave_1: left promiscuous mode
[   58.943154][ T5763] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   58.953895][ T5763] bridge_slave_0: left allmulticast mode
[   58.953921][ T5763] bridge_slave_0: left promiscuous mode
[   58.954168][ T5763] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   59.093813][ T5763] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   59.100475][ T5763] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   59.101961][ T5763] bond0 (unregistering): Released all slaves
[   59.186544][ T5763] hsr_slave_0: left promiscuous mode
[   59.187330][ T5763] hsr_slave_1: left promiscuous mode
[   59.188152][ T5763] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   59.188175][ T5763] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   59.189445][ T5763] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   59.189461][ T5763] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   59.197738][ T5763] veth1_macvtap: left promiscuous mode
[   59.197837][ T5763] veth0_macvtap: left promiscuous mode
[   59.197946][ T5763] veth1_vlan: left promiscuous mode
[   59.198079][ T5763] veth0_vlan: left promiscuous mode
[   59.400764][ T5763] team0 (unregistering): Port device team_slave_1 remo=
ved
[   59.411607][ T5763] team0 (unregistering): Port device team_slave_0 remo=
ved
[   59.482765][ T5444] 8021q: adding VLAN 0 to HW filter on device eth2
[   59.705030][ T5444] 8021q: adding VLAN 0 to HW filter on device eth3
[   59.930489][ T5444] 8021q: adding VLAN 0 to HW filter on device eth4
[   60.141057][ T5444] 8021q: adding VLAN 0 to HW filter on device eth5


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
 -ffile-prefix-map=3D/tmp/go-build4239141871=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccLPlc5j.o: in function `Connection::Connect(char const*,=
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1632d84d5800=
00

