Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958E35B632
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537145; cv=none; b=H1s2AUD9hYCZqdtAChLKfe53GaO5n1AbiukzkHhUxE3/wqCwhiiv306/Lu4zx/2omRfgwEUCUlNVkpl6lOlTyzRMeoN3VmyQcyex/O53lqjb8Xy/6vrdrE5GUThwjdcPSx3OPRoC5cBUyzDwmSvjKt97zGQEOdtEKjMo9UF16go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537145; c=relaxed/simple;
	bh=a43s/9tQ1UFMbPlNRp8ZB4FMsmBZSSARJkao5QgjrHA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f53nBpcZV8ciO+PKjtTNiGWpAamI9amrYWh1X2U17o4TMGio8Rsv0ZuQsh7nR7ajVfYspEMAxmCd/E3m/zW4oclH/RlbvVlwUv3waoMqXEKe0d5s1ds94DVc9t8pyLVC/nToSxQqSpz5u3tEWKD0o888mLuZTz+jBV52wf86amY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so3828893b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537143; x=1790141943;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mq52F4Td//LH7OPVQoJApvUSsDGDHjBE1peH+X+HP+I=;
        b=1PJt7D09Tp/NaxjncqtiiUWzMgTq/7/fl7ZDmOw3AtZPthJTacGOrFsJEgwQQVqe1x
         f8/GIHPHx7ozWUTHU2AlFLv4KzAmKhHNBZFniyvbGUrpPokvx0p6GFBBR95IB50EPcQ+
         cY5kLw0ZGfnJAllhfHvVtKvA0JRwhDDhx2F+oP7FvPpba4uPjyTT3tpEXXMYp5ICe2Hh
         PZwhCrwQP5ERMrGt1Ucoz+vHIbXWtBVyrq93FitI22LBIZbO6GEnvEkihzpStdGT5Yfo
         dyAsNn8eoueZ05lQzQ9JTm0L9HoP7myO6MEgBjrRhVoSxAS1tlYPaOh4LNxzPKk6gk07
         ZGug==
X-Gm-Message-State: AFuF++nrsMppVdRAPcU29qFBCYyXxCC3pHe5XZ4tw8pEBVzyG7U0J1Lj
	5AmjGyX8vhMVMJMFs1YwLD6uCFPlsb6rRnA/v/02/gzky4Vt3/jmNGMj4vinK5hMRYJJQ90+Cbd
	cp25Lp0DK5u7Aqv5aZQHnQ6Lk3Y0vxpH6eEBql+o7+Z8afI1YzF24kMsOd18=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f09:b0:4b3:941a:e7c7 with SMTP id
 5614622812f47-4ca4a0e136bmr1519555b6e.15.1789537142878; Tue, 15 Sep 2026
 22:39:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 22:39:02 -0700
In-Reply-To: <2212efb6-e38c-43c3-97c1-5139c55ee576n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaa2b76.f81106d8.2ab401.0072.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] WARNING in udmabuf_create
From: syzbot <syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

SYZFAIL: failed to recv rpc

SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).


no interfaces have a carrier
[   83.165290][ T5279] 8021q: adding VLAN 0 to HW filter on device bond0
[   83.176651][ T5279] eql: remember to turn off Van-Jacobson compression o=
n your slave devices
Starting crond: OK
Starting sshd: OK

syzkaller
syzkaller login: [  114.243158][    T9] cfg80211: failed to load regulatory=
.db
Warning: Permanently added '10.128.0.233' (ED25519) to the list of known ho=
sts.
2026/09/16 05:37:24 parsed 1 programs
2026/09/16 05:37:24 serving rpc on tcp://37581
[  121.891431][ T5631] cgroup: Unknown subsys name 'net'
[  122.014742][ T5631] cgroup: Unknown subsys name 'cpuset'
[  122.024234][ T5631] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  123.962440][ T5631] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  128.498958][ T5644] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  128.521252][ T5644] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  128.524188][ T5644] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  129.376802][ T5653] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  129.377579][ T5653] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  129.514072][ T5659] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  129.514855][ T5659] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  129.515648][ T5659] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  129.516637][ T5659] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  129.517407][ T5659] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  130.480696][   T45] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  130.480735][   T45] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  130.543973][   T59] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  130.543998][   T59] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  132.024638][ T5677] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  132.025532][ T5677] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  132.025672][ T5677] bridge_slave_0: entered allmulticast mode
[  132.027949][ T5677] bridge_slave_0: entered promiscuous mode
[  132.076170][ T5677] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  132.076834][ T5677] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  132.077022][ T5677] bridge_slave_1: entered allmulticast mode
[  132.102933][ T5677] bridge_slave_1: entered promiscuous mode
[  132.174547][ T5677] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  132.187486][ T5677] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  132.250540][ T5677] team0: Port device team_slave_0 added
[  132.254042][ T5677] team0: Port device team_slave_1 added
[  132.300085][ T5677] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  132.300106][ T5677] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  132.300139][ T5677] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  132.303509][ T5677] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  132.303529][ T5677] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  132.303640][ T5677] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  132.507651][ T5677] hsr_slave_0: entered promiscuous mode
[  132.509065][ T5677] hsr_slave_1: entered promiscuous mode
[  132.809314][ T5677] netdevsim netdevsim7 netdevsim0: renamed from eth0
[  132.845685][ T5677] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  132.847749][ T5677] netdevsim netdevsim7 netdevsim1: renamed from eth1
[  132.874511][ T5677] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  132.876090][ T5677] netdevsim netdevsim7 netdevsim2: renamed from eth2
[  132.884908][ T5677] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  132.887927][ T5677] netdevsim netdevsim7 netdevsim3: renamed from eth3
[  132.915834][ T5677] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  133.036266][ T5677] 8021q: adding VLAN 0 to HW filter on device bond0
[  133.070741][ T5677] 8021q: adding VLAN 0 to HW filter on device team0
[  133.079036][ T2225] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  133.079162][ T2225] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  133.126108][   T45] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  133.126199][   T45] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  133.813277][ T5677] 8021q: adding VLAN 0 to HW filter on device batadv0
[  134.186699][ T5677] veth0_vlan: entered promiscuous mode
[  134.207669][ T5677] veth1_vlan: entered promiscuous mode
[  134.293216][ T5677] veth0_macvtap: entered promiscuous mode
[  134.311660][ T5677] veth1_macvtap: entered promiscuous mode
[  134.349115][ T5677] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  134.379343][ T5677] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  134.492045][   T62] netdevsim netdevsim7 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  134.551786][ T2225] netdevsim netdevsim7 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  134.552284][ T2225] netdevsim netdevsim7 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  134.620447][   T62] netdevsim netdevsim7 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  134.799248][   T59] netdevsim netdevsim7 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  135.874694][   T59] netdevsim netdevsim7 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  136.855213][   T59] netdevsim netdevsim7 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  136.952225][   T59] netdevsim netdevsim7 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  137.224278][   T59] bridge_slave_1: left allmulticast mode
[  137.224334][   T59] bridge_slave_1: left promiscuous mode
[  137.226112][   T59] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  137.275171][   T59] bridge_slave_0: left allmulticast mode
[  137.275201][   T59] bridge_slave_0: left promiscuous mode
[  137.275530][   T59] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  137.665003][   T59] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  137.680748][   T59] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  137.682596][   T59] bond0 (unregistering): Released all slaves
[  137.832212][   T59] hsr_slave_0: left promiscuous mode
[  137.832917][   T59] hsr_slave_1: left promiscuous mode
[  137.833650][   T59] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  137.833676][   T59] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  137.836225][   T59] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  137.836252][   T59] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  137.888093][   T59] veth1_macvtap: left promiscuous mode
[  137.888147][   T59] veth0_macvtap: left promiscuous mode
[  137.888227][   T59] veth1_vlan: left promiscuous mode
[  137.888334][   T59] veth0_vlan: left promiscuous mode
[  138.251598][   T59] team0 (unregistering): Port device team_slave_1 remo=
ved
[  138.291619][   T59] team0 (unregistering): Port device team_slave_0 remo=
ved
[  138.436400][ T5279] 8021q: adding VLAN 0 to HW filter on device eth1
[  139.193435][ T5279] 8021q: adding VLAN 0 to HW filter on device eth2
[  139.758608][ T5279] 8021q: adding VLAN 0 to HW filter on device eth3
[  139.843453][ T1313] ieee802154 phy0 wpan0: encryption failed: -22
[  139.843541][ T1313] ieee802154 phy1 wpan1: encryption failed: -22
[  140.207942][ T5279] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build264506101=3D/tmp/go-build -gno-record-gcc=
-switches'
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
HEAD detached at 85995287a88
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D85995287a888340d8818a8f3c43e2e89555eea21 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260902-115702"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D85995287a888340d8818a8f3c43e2e89555eea21 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260902-115702"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D85995287a888340d8818a8f3c43e2e89555eea21 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260902-115702"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"85995287a888340d8818a8f3c43e2e8955=
5eea21\"
/usr/bin/ld: /tmp/cc3OdTDn.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         e7c98468 udmabuf: cap page count to allocation-safe li..
git tree:       https://github.com/yutao-intel/linux.git fix-dri-udmabuf_cr=
eate
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5e4e3a0e188a497=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbfeed181d1ce9ec87=
a8f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386

Note: no patches were applied.
