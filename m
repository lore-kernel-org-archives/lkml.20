Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7BD1AA1F4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440905; cv=none; b=oihSiHVjbZjwBN8PUenRoM18vVgq1Uw70703Sh1OSvYpaOS9WsXzRaWmME9Ao+zjqPbfjbcdJMPc8p7Ve1/r/HtkqMV0fbPgSo/hd7R6th2zk3SYDBbnKs6vmte20UlE1/QMhmZrT7NtnYfWDEVNjTRuvgFw8xAEXx3DjuXai3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440905; c=relaxed/simple;
	bh=XUPNUB6tayFHFgyDg/e7Yshf08dIVjJu0YjPkM4oDtU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UPYmzeJTrBnhWlE9u1WZmphouessvkKmoIesGutW0D2b1A8vKXmNTQ6T+9rJsv9Tv3G1PXnyjRmLApSI8ch48ZOJiDMTMyxZcHaY9VgS2BWi3vCm7AE5OXUo+g4EcCHkOe45PzQFgUyzOq/GqrdlVKdEJZMMdexOKuLXX2aCmK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a17dafd042so5103990eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440902; x=1790045702;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=40EQ2i/Xd+FyKjpdpa65OPJyM4ejmHIi76SNLxlvIms=;
        b=n4ipUm5yHxTzmnraOeuTMNZArlxitG1V+SHdgMVEeCqF549JKEMbyJSp+GCjtKMIFM
         P0rIuBWijueYfzuDxWRCJMYnvi94Pau0igWX1glNd4CW1l1yOn7TsnwC0tFn/JJ/Ltab
         3MBhsN2XmJSino8pmccF+6+g2Ux1Rc1kIWNhj0Awvq28Qj3QUP0R2nvDKKdfFPEWAbRk
         l8cdy/vio7UR9snpxrHzXZ4rCMzEZp+QV9SOs0pQjTgr9uP64QevtDdZZ2yNYQH5zdsb
         jWWoDUhbJHqm8XjupOp12ZsAQyfFK78EBjmJfl2dltSCPMhJARE13zZ0wnDtN6M63aNf
         wVag==
X-Forwarded-Encrypted: i=1; AKwUvBwDCGm8mODFku7V0SZn7cCxyjxI+4SUEQx/TdpnEQW0jTO4zhAqkPb1dEXfj2UY0Yzdnjr9K5XGNpA3Fxg=@vger.kernel.org
X-Gm-Message-State: AFuF++lCJvZaErQ8o+dQBalQdgTEG/wwODGmX8ErAOmcixCyqRxbWgW/
	DCV1boBMoWBWqGMXCVGG8w2kWRmIe3rEBof9GKdWKOe3yrSJ4rCbtr2UX603CKS9oTDp0V5//3t
	4feJPSSdKVuyyaAbeDO62fTbd8dS+yfipwTuq89SF4FWi/FVkij5nQNe+CTM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1609:b0:6c1:1734:2ec9 with SMTP id
 006d021491bc7-6c541a46da1mr4636750eaf.28.1789440902425; Mon, 14 Sep 2026
 19:55:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:55:02 -0700
In-Reply-To: <6aa8a1b2.bfa0a463.33fe0e.0882SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8b386.4c28b7d0.c1bba.002c.GAE@google.com>
Subject: Re: [syzbot] [mmc?] WARNING: ODEBUG bug in vub300_disconnect
From: syzbot <syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
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


Warning: Permanently added '[localhost]:50937' (ED25519) to the list of kno=
wn hosts.
2026/09/15 02:54:08 parsed 1 programs
2026/09/15 02:54:08 serving rpc on tcp://40509
[   51.018830][ T5747] cgroup: Unknown subsys name 'net'
[   51.127646][ T5747] cgroup: Unknown subsys name 'cpuset'
[   51.131500][ T5747] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   52.520450][ T5747] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   55.451428][ T5757] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   55.490979][   T46] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   55.490999][   T46] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   55.492341][ T5757] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   55.510392][ T5757] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   55.641838][   T46] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   55.641860][   T46] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   56.829529][   T66] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   56.830575][   T66] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   56.831401][   T66] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   56.832139][   T66] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   56.832528][   T66] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   56.932617][ T5802] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   56.932896][ T5802] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   57.032911][ T5769] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   57.033003][ T5769] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   57.033119][ T5769] bridge_slave_0: entered allmulticast mode
[   57.034729][ T5769] bridge_slave_0: entered promiscuous mode
[   57.039314][ T5769] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   57.039361][ T5769] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   57.039450][ T5769] bridge_slave_1: entered allmulticast mode
[   57.040442][ T5769] bridge_slave_1: entered promiscuous mode
[   57.119251][ T5769] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   57.137264][ T5769] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   57.350160][ T5769] team0: Port device team_slave_0 added
[   57.362939][ T5769] team0: Port device team_slave_1 added
[   57.417359][ T5769] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   57.417377][ T5769] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   57.417396][ T5769] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   57.430308][ T5769] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   57.430327][ T5769] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   57.430354][ T5769] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   57.605499][ T5769] hsr_slave_0: entered promiscuous mode
[   57.606694][ T5769] hsr_slave_1: entered promiscuous mode
[   57.976208][ T5769] netdevsim netdevsim5 netdevsim0: renamed from eth0
[   57.987128][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   57.988702][ T5769] netdevsim netdevsim5 netdevsim1: renamed from eth1
[   57.992159][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   57.993845][ T5769] netdevsim netdevsim5 netdevsim2: renamed from eth2
[   58.000578][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   58.004100][ T5769] netdevsim netdevsim5 netdevsim3: renamed from eth3
[   58.012316][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   58.103684][ T5769] 8021q: adding VLAN 0 to HW filter on device bond0
[   58.119294][ T5769] 8021q: adding VLAN 0 to HW filter on device team0
[   58.128805][   T37] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   58.128939][   T37] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   58.131296][   T37] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   58.131377][   T37] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   58.510343][ T5769] 8021q: adding VLAN 0 to HW filter on device batadv0
[   58.677549][ T5769] veth0_vlan: entered promiscuous mode
[   58.685197][ T5769] veth1_vlan: entered promiscuous mode
[   58.711173][ T5769] veth0_macvtap: entered promiscuous mode
[   58.715695][ T5769] veth1_macvtap: entered promiscuous mode
[   58.730261][ T5769] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   58.738604][ T5769] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   58.775395][   T13] netdevsim netdevsim5 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   58.776413][   T13] netdevsim netdevsim5 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   58.776445][   T13] netdevsim netdevsim5 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   58.776473][   T13] netdevsim netdevsim5 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   58.837077][ T5784] netdevsim netdevsim5 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   59.005630][ T5784] netdevsim netdevsim5 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   59.117565][ T5784] netdevsim netdevsim5 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   59.176795][ T5784] netdevsim netdevsim5 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   60.017438][ T5784] bridge_slave_1: left allmulticast mode
[   60.017469][ T5784] bridge_slave_1: left promiscuous mode
[   60.018373][ T5784] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   60.023532][ T5784] bridge_slave_0: left allmulticast mode
[   60.023546][ T5784] bridge_slave_0: left promiscuous mode
[   60.023645][ T5784] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   60.151598][ T5784] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   60.156955][ T5784] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   60.158031][ T5784] bond0 (unregistering): Released all slaves
[   60.230072][ T5784] hsr_slave_0: left promiscuous mode
[   60.230565][ T5784] hsr_slave_1: left promiscuous mode
[   60.230997][ T5784] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   60.231012][ T5784] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   60.231870][ T5784] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   60.231879][ T5784] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   60.237922][ T5784] veth1_macvtap: left promiscuous mode
[   60.238016][ T5784] veth0_macvtap: left promiscuous mode
[   60.238146][ T5784] veth1_vlan: left promiscuous mode
[   60.238231][ T5784] veth0_vlan: left promiscuous mode
[   60.377488][ T5784] team0 (unregistering): Port device team_slave_1 remo=
ved
[   60.388544][ T5784] team0 (unregistering): Port device team_slave_0 remo=
ved
[   60.447040][ T5451] 8021q: adding VLAN 0 to HW filter on device eth2
[   60.654287][ T5451] 8021q: adding VLAN 0 to HW filter on device eth4
[   60.861929][ T5451] 8021q: adding VLAN 0 to HW filter on device eth3
[   61.026589][ T5451] 8021q: adding VLAN 0 to HW filter on device eth5


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
 -ffile-prefix-map=3D/tmp/go-build1170068323=3D/tmp/go-build -gno-record-gc=
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
HEAD detached at 1fe56c0af80
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D1fe56c0af80df10ab9f07819d9fa709dc9971ae1 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260910-094642"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D1fe56c0af80df10ab9f07819d9fa709dc9971ae1 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260910-094642"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D1fe56c0af80df10ab9f07819d9fa709dc9971ae1 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260910-094642"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"1fe56c0af80df10ab9f07819d9fa709dc9=
971ae1\"
/usr/bin/ld: /tmp/ccbm6IKO.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D85bc5cc2fc7394d=
9
dashboard link: https://syzkaller.appspot.com/bug?extid=3Df4a0159ce6802a0a4=
774
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D14978df95800=
00

