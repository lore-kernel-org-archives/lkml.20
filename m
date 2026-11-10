Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339123;
	b=nvttU1MLvvDyghgEN/ops773DEHD9+KfzDq55zVkwpJXtCwhirLZlJDLTDE7C3HXJZgJ
	 uvlD1wc5HNK93hCSZQMr34eu2Ky6MJZ+9dWCVdNkIYjRJvbLqKX0nloGQ81T5o2LzFXYZ
	 szNtqG80bvOwgf6UCtYW/Zsm2jQFEhS20u9IxgnuYKiO+B4HK0725987wLqMK2D5DmHDY
	 B/vKPPUzVFc7BwQmjJfmspuoGi4RRtmkH2/uw8C9H17wTD4A27xlMl2M5V/VCdanuRlMj
	 tL2h8nPVdopZnqH4RsdmwoEcwG6K1LBv/bTCsfzCLpSLQVx/edL0FDfWBJFrLmfSeCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339123;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hg8muFw73Ly4Zco7LmveLyp4TUlEpioGYOFODcwiEyQ=;
	b=R7RfH+F9Ot4TAINksS6YCcCWrCTCikI+1OOMS2bE7NEJHoWRlQsHvIMlLf8bjblwcpiN
	 /ng8J7UBWoK4z6fr9yMOpwc08iaY/Xr1JJSWZ1VkzO+m9m7aDgwsx7ioPXI5al7xjNMp9
	 GCn8fZh2AAgifTpUK4Th082iUPBji7AxpofbXZrkW0zXPJfsaCjQWhJAp2rTBok2OF6eq
	 Hm28AKnNsDUlOVkovdA7OaMLp0at2MLHAcgOLPyTyujSgvgWUxI99ybA4Ov5BPPHdB+zc
	 4JXiEDETsylnRa4AAMlaNz0EMX3J1lqifgZO3G3s2qjdUjhZ9D6VYRLP44i5527cZfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C32606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C32606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-568249fbf5eso3367903b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339122; x=1794943922;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hg8muFw73Ly4Zco7LmveLyp4TUlEpioGYOFODcwiEyQ=;
        b=WDU8DelxwsHJlTJqNyosW+X3GXIpwuPt6fyBYTma/H7VYYx43U54OWpXK6waA5CtAc
         wRBQ0apxKrjwZ7J2ONNa30kj45mI+ACiXU3Zr9ORO9zIJDvDHiFXrsR0fgds0QSVEJq+
         570115S/pLcSiDD8PT9vc7khn8y9CsSKIRAzMZM2f+8MPlmiTaSwmhL1fza4fwkICmd1
         Qkip1lttUtFV5Ax7Rv9VxORKjXro3cDbdAoB70BR/hPOXk7yEtabp1paSZKdjCZFM3Ji
         75evOKTjvkrFMplnqall/YMWPpy7A3p9eTnVntplk5iDAUwzCZ7yruX+XwFstd3+Us8d
         A+gw==
X-Gm-Message-State: APuU4Z+yqV3ZK40Wr5Rn1HFnGpvCkx4MEA5PHqHrbiPaDhY0AawCLLm9
	nYbOYLGKgZQMQAyzv3N3ZqLrMJ4jEuR3XQlkMvn6b+sd3I5fK1DlVKzjNtiVYnlrMZHu1UHl9Wr
	iSvQBxxCFiIDtEe8qAo2YIAXQwGII0XvGvbT2xHfJOhcADlU670GVjKRYZnM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5389:b0:53b:87e5:8c9a with SMTP id
 5614622812f47-5683cc9ed86mr2613620b6e.17.1794339122166; Tue, 10 Nov 2026
 11:32:02 -0800 (PST)
Date: Tue, 10 Nov 2026 11:32:02 -0800
In-Reply-To: <CAO7_G+yrCB_-fcq2Fh+pKgYmkd8a7RpCNh1jJgnJ30wHrUSQuQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af37132.6ea51c61.3838e6.0014.GAE@google.com>
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


qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0) is smaller than=
 the requested size (0x301000)
[   41.844215][ T1129] ata1.00: Read log 0x10 page 0x00 failed, Emask 0x1
[   41.844240][ T1129] qemu-system-x86_64: ahci: PRDT length for NCQ comman=
d (0x0) is smaller than the requested size (0x400000)
ata1: failed to read log page 10h (errno=3D-5)
[   41.844257][ T1129] ata1.00: exception Emask 0x1 SAct 0x40000001 SErr 0x=
0 action 0x0
[   41.844276][ T1129] ata1.00: irq_stat 0x40000000
[   41.844292][ T1129] ata1.00: failed command: WRITE FPDMA QUEUED
[   41.844304][ T1129] ata1.00: cmd 61/10:00:3e:99:04/0f:00:00:00:00/40 tag=
 0 ncq dma 1974272 ou
[   41.844304][ T1129]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   41.844356][ T1129] ata1.00: status: { DRDY }
[   41.844375][ T1129] ata1.00: failed command: WRITE FPDMA QUEUED
[   41.844385][ T1129] ata1.00: cmd 61/08:f0:36:81:04/18:00:00:00:00/40 tag=
 30 ncq dma 3149824 ou
[   41.844385][ T1129]          res 50/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[   41.844439][ T1129] ata1.00: status: { DRDY }
[   41.845428][ T1129] ata1.00: configured for UDMA/100
[   41.846224][ T1129] ata1: EH complete
[   71.003538][  T856] cfg80211: failed to load regulatory.db
[   72.321505][ T1129] ata1.00: exception Emask 0x0 SAct 0x40000000 SErr 0x=
0 action 0x6 frozen
[   72.321540][ T1129] ata1.00: failed command: WRITE FPDMA QUEUED
[   72.321551][ T1129] ata1.00: cmd 61/00:f0:36:21:05/20:00:00:00:00/40 tag=
 30 ncq dma 4194304 ou
[   72.321551][ T1129]          res 40/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x4 (timeout)
[   72.321601][ T1129] ata1.00: status: { DRDY }
[   72.321649][ T1129] ata1: hard resetting link
[   72.646494][ T1129] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 30=
0)
[   72.647439][ T1129] ata1.00: configured for UDMA/100
[   72.647691][ T1129] ata1: EH complete
Warning: Permanently added '[localhost]:31181' (ED25519) to the list of kno=
wn hosts.
2026/11/10 19:31:24 parsed 1 programs
2026/11/10 19:31:24 serving rpc on tcp://46365
[   79.004885][ T5750] cgroup: Unknown subsys name 'net'
[   79.134080][ T5750] cgroup: Unknown subsys name 'cpuset'
[   79.139134][ T5750] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   80.470828][ T5750] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   82.853082][ T5760] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   82.870654][ T5760] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   82.879298][ T5760] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   83.020826][ T5773] br_netfilter no longer supported in user namespaces
[   83.154564][ T5773] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   83.154852][ T5773] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   83.780501][   T68] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   83.780523][   T68] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   83.875702][   T68] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   83.875718][   T68] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   84.091124][ T5832] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   84.092413][ T5832] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   84.092833][ T5832] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   84.093874][ T5832] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   84.094321][ T5832] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   84.121156][ T5780] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   84.122077][ T5780] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   84.122180][ T5780] bridge_slave_0: entered allmulticast mode
[   84.123151][ T5780] bridge_slave_0: entered promiscuous mode
[   84.141075][ T5780] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   84.141171][ T5780] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   84.141612][ T5780] bridge_slave_1: entered allmulticast mode
[   84.142798][ T5780] bridge_slave_1: entered promiscuous mode
[   84.215418][ T5780] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   84.221957][ T5780] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   84.248965][ T5780] team0: Port device team_slave_0 added
[   84.254455][ T5780] team0: Port device team_slave_1 added
[   84.280176][ T5780] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   84.280193][ T5780] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   84.280214][ T5780] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   84.284994][ T5780] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   84.285014][ T5780] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   84.285035][ T5780] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   84.423649][ T5780] hsr_slave_0: entered promiscuous mode
[   84.426706][ T5780] hsr_slave_1: entered promiscuous mode
[   84.684141][ T5780] netdevsim netdevsim6 netdevsim0: renamed from eth0
[   84.689820][ T5780] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   84.690609][ T5780] netdevsim netdevsim6 netdevsim1: renamed from eth1
[   84.694534][ T5780] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   84.695342][ T5780] netdevsim netdevsim6 netdevsim2: renamed from eth2
[   84.699510][ T5780] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   84.700415][ T5780] netdevsim netdevsim6 netdevsim3: renamed from eth3
[   84.702833][ T5780] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   84.826990][ T5780] 8021q: adding VLAN 0 to HW filter on device bond0
[   84.846339][ T5780] 8021q: adding VLAN 0 to HW filter on device team0
[   84.852806][   T38] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   84.853180][   T38] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   84.862643][   T38] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   84.862698][   T38] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   85.186557][ T5780] 8021q: adding VLAN 0 to HW filter on device batadv0
[   85.383527][ T5780] veth0_vlan: entered promiscuous mode
[   85.390385][ T5780] veth1_vlan: entered promiscuous mode
[   85.415572][ T5780] veth0_macvtap: entered promiscuous mode
[   85.419971][ T5780] veth1_macvtap: entered promiscuous mode
[   85.430797][ T5780] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   85.437743][ T5780] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   85.491628][   T14] netdevsim netdevsim6 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   85.521992][   T14] netdevsim netdevsim6 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   85.522034][   T14] netdevsim netdevsim6 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   85.522064][   T14] netdevsim netdevsim6 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   85.558282][ T5812] netdevsim netdevsim6 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   85.635294][ T5812] netdevsim netdevsim6 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   85.696264][ T5812] netdevsim netdevsim6 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   85.841148][ T5812] netdevsim netdevsim6 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   87.595495][ T5812] bridge_slave_1: left allmulticast mode
[   87.595530][ T5812] bridge_slave_1: left promiscuous mode
[   87.596427][ T5812] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   87.599943][ T5812] bridge_slave_0: left allmulticast mode
[   87.599965][ T5812] bridge_slave_0: left promiscuous mode
[   87.600143][ T5812] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   87.708233][ T5812] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   87.710902][ T5812] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   87.714475][ T5812] bond0 (unregistering): Released all slaves
[   87.787731][ T5812] hsr_slave_0: left promiscuous mode
[   87.788517][ T5812] hsr_slave_1: left promiscuous mode
[   87.789254][ T5812] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   87.789275][ T5812] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   87.790212][ T5812] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   87.790222][ T5812] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   87.798747][ T5812] veth1_macvtap: left promiscuous mode
[   87.798783][ T5812] veth0_macvtap: left promiscuous mode
[   87.798830][ T5812] veth1_vlan: left promiscuous mode
[   87.798867][ T5812] veth0_vlan: left promiscuous mode
[   87.974363][ T5812] team0 (unregistering): Port device team_slave_1 remo=
ved
[   87.979464][ T5812] team0 (unregistering): Port device team_slave_0 remo=
ved
[   88.038058][ T5445] 8021q: adding VLAN 0 to HW filter on device eth2
[   88.225642][ T5445] 8021q: adding VLAN 0 to HW filter on device eth3
[   88.407846][ T5445] 8021q: adding VLAN 0 to HW filter on device eth5
[   88.609210][ T5445] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build1302820052=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccGyTJVs.o: in function `Connection::Connect(char const*,=
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D15e433695800=
00

