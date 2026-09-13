Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EC2F8E98
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273445; cv=none; b=GWahufkFsIEtww1uQx5m+z/kTjtfkBuNo36Z+T6BTyg4eCBgnX7w9sqFFO2KRw6eEGkZRGAU/bmsNNwRxG2okG0EGyDMnHph1+2bq+NKEOwqgGYMZYixs4UYTgWz4z7ukDgJsc/CYer9bcEVvaU91KauW8mTKBdCisthoUnc1mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273445; c=relaxed/simple;
	bh=tMQduL2mOOdtZiYAUtZEc8SUzX3rBgs6MoL2SQoMhU0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RwD3CSltSVSIHsW22ESg2GF3hxZ0D0/8S4vzsmq/ZYqQrQBvxaFSVoC5hNs/KAM5lLs8yvRQnHshNBftmq/7oWdMI0GNPIodIONgDtPWJkA7Z9AwE3rjF4EabL/4RdGhwvhdUcJM6pZAltRA60Dg1p0DzdSzCwd7QiO97AKFVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c27804563dso1217781eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789273443; x=1789878243;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ft9XCRiTM2eJ7QiLTCzxPv5Fu7p0pn0dRz3O165vQ6w=;
        b=EgPBVAs6jco/6ldCOyHlclKouUX8KGiBOH+2SN8AkrP57YV1aye1jw7w22Nxhn4qE4
         2cyE/nwF1l+Le3csETYlbFPEneWK1PZpC4kEsHmS7/HQpDbwH7oUm63fbksURaSe8p41
         PiLCbt9bUOppl76qI3uXp8AcnZ+LXODVEVv7OH3B6mThORsqZdKSEQYNTymv7zz0WaHK
         azms2fWZI198szyJVXj4xR6GErEDyP9c/o6viRqbBmk+JPwLPvOcHmbIvnnjNZwPZ0gr
         +JQyAMutEhky0y9itWZy9c1yemByS+giPPAUE8EqRiLTingargTbINsWxt94cB8coyLz
         sP3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcOEV+XAoyJvcs1t5h8EzUqGpT4nBYe6Yiy1Vk4UozKL3/eKxz35VkXFAGvI/x2jd0OcESGEaQi4hyIkM=@vger.kernel.org
X-Gm-Message-State: AFuF++moAuMtUWVT1sbtmScwzkNias9bn/h261leAX4m+C6uzF7i6RZl
	1EZn6T2I0EffFtnSGMc4bCF3T5Q2uiadzwTlqlkQYosjEvg22CI4Zru3oEU7Ht4PULJLxgBrfwn
	Oxre1THdszeai6A0KuyEZLkMZu8FG4xpyNGBayXujVBVEkVYzc/vlut/DoZc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2c2:20b0:6bd:5506:aae0 with SMTP id
 006d021491bc7-6c0ba537bf2mr5065557eaf.22.1789273443128; Sat, 12 Sep 2026
 21:24:03 -0700 (PDT)
Date: Sat, 12 Sep 2026 21:24:03 -0700
In-Reply-To: <20260913032113.14940-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa62563.f2639fcc.29487d.004d.GAE@google.com>
Subject: Re: [syzbot] [batman?] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
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


Warning: Permanently added '10.128.1.134' (ED25519) to the list of known ho=
sts.
2026/09/13 04:22:43 parsed 1 programs
2026/09/13 04:22:43 serving rpc on tcp://37535
[  116.176242][ T5638] cgroup: Unknown subsys name 'net'
[  116.269550][ T5638] cgroup: Unknown subsys name 'cpuset'
[  116.273132][ T5638] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  118.238222][ T5638] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  122.080438][ T5656] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  122.089651][ T5656] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  122.090390][ T5656] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  122.090846][ T5656] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  122.091650][ T5656] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  123.409262][   T59] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  123.409296][   T59] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  123.476253][   T28] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  123.476281][   T28] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  124.797912][ T5687] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  124.798648][ T5687] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  124.798767][ T5687] bridge_slave_0: entered allmulticast mode
[  124.800981][ T5687] bridge_slave_0: entered promiscuous mode
[  124.813217][ T5687] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  124.813604][ T5687] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  124.813939][ T5687] bridge_slave_1: entered allmulticast mode
[  124.823934][ T5687] bridge_slave_1: entered promiscuous mode
[  124.896349][ T5687] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  124.899978][ T5687] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  124.943163][ T5687] team0: Port device team_slave_0 added
[  124.949239][ T5687] team0: Port device team_slave_1 added
[  124.980872][ T5687] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  124.980887][ T5687] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  124.980906][ T5687] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  124.983146][ T5687] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  124.983163][ T5687] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  124.983188][ T5687] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  125.108569][ T5687] hsr_slave_0: entered promiscuous mode
[  125.109992][ T5687] hsr_slave_1: entered promiscuous mode
[  125.328019][ T5687] netdevsim netdevsim2 netdevsim0: renamed from eth0
[  125.335055][ T5687] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  125.338239][ T5687] netdevsim netdevsim2 netdevsim1: renamed from eth1
[  125.361418][ T5687] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  125.362677][ T5687] netdevsim netdevsim2 netdevsim2: renamed from eth2
[  125.384673][ T5687] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  125.396089][ T5687] netdevsim netdevsim2 netdevsim3: renamed from eth3
[  125.400660][ T5687] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  125.458346][ T5687] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  125.458443][ T5687] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  125.458916][ T5687] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  125.459003][ T5687] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  125.511088][   T12] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  125.512830][   T12] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  125.583866][ T5687] 8021q: adding VLAN 0 to HW filter on device bond0
[  125.613658][ T5687] 8021q: adding VLAN 0 to HW filter on device team0
[  125.632260][   T12] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  125.632355][   T12] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  125.657712][ T3381] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  125.657829][ T3381] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  125.761435][ T5687] 8021q: adding VLAN 0 to HW filter on device batadv0
[  125.823171][ T5687] veth0_vlan: entered promiscuous mode
[  125.838830][ T5687] veth1_vlan: entered promiscuous mode
[  125.880567][ T5687] veth0_macvtap: entered promiscuous mode
[  125.893101][ T5687] veth1_macvtap: entered promiscuous mode
[  125.922257][ T5687] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  125.942931][ T5687] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  125.996954][ T3381] netdevsim netdevsim2 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  126.035840][   T12] netdevsim netdevsim2 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  126.035892][   T12] netdevsim netdevsim2 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  126.035929][   T12] netdevsim netdevsim2 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  126.178076][   T28] netdevsim netdevsim2 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  126.273669][   T28] netdevsim netdevsim2 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  127.290556][ T4939] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  127.293666][ T4939] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  127.303209][ T4939] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  127.321967][ T4939] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  127.322912][ T4939] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  127.749294][   T28] netdevsim netdevsim2 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  129.060155][   T28] netdevsim netdevsim2 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  129.193163][   T28] bridge_slave_1: left allmulticast mode
[  129.193213][   T28] bridge_slave_1: left promiscuous mode
[  129.195628][   T28] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  129.226471][   T28] bridge_slave_0: left allmulticast mode
[  129.226496][   T28] bridge_slave_0: left promiscuous mode
[  129.226693][   T28] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  129.401009][   T28] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  129.415575][   T28] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  129.418884][   T28] bond0 (unregistering): Released all slaves
[  129.557582][   T28] hsr_slave_0: left promiscuous mode
[  129.558709][   T28] hsr_slave_1: left promiscuous mode
[  129.560038][   T28] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  129.560072][   T28] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  129.561438][   T28] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  129.561459][   T28] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  129.621885][   T28] veth1_macvtap: left promiscuous mode
[  129.621958][   T28] veth0_macvtap: left promiscuous mode
[  129.622726][   T28] veth1_vlan: left promiscuous mode
[  129.622866][   T28] veth0_vlan: left promiscuous mode
[  130.090234][   T28] team0 (unregistering): Port device team_slave_1 remo=
ved
[  130.119539][   T28] team0 (unregistering): Port device team_slave_0 remo=
ved
[  130.278530][ T5284] 8021q: adding VLAN 0 to HW filter on device eth1
[  131.131201][ T5284] 8021q: adding VLAN 0 to HW filter on device eth2
[  131.820035][ T5284] 8021q: adding VLAN 0 to HW filter on device eth3
[  132.254108][ T5284] 8021q: adding VLAN 0 to HW filter on device eth4
[  133.727287][ T1311] ieee802154 phy0 wpan0: encryption failed: -22
[  133.727357][ T1311] ieee802154 phy1 wpan1: encryption failed: -22


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
 -ffile-prefix-map=3D/tmp/go-build98667249=3D/tmp/go-build -gno-record-gcc-=
switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
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
HEAD detached at b6a5eeb7114
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Db6a5eeb7114b1887514b0d74ca39167dfbfa4603 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260911-102446"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Db6a5eeb7114b1887514b0d74ca39167dfbfa4603 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260911-102446"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Db6a5eeb7114b1887514b0d74ca39167dfbfa4603 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260911-102446"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"b6a5eeb7114b1887514b0d74ca39167dfb=
fa4603\"
/usr/bin/ld: /tmp/ccgeWNYg.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         2f0c1cf7 Merge tag 's390-7.3-3' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5e4e3a0e188a497=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Da079f084653164a65=
2d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D14dd55f95800=
00

