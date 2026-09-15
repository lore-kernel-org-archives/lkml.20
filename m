Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDAF39E17E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472464; cv=none; b=kXKTFDbh3dwurtSYlGeBSTep9lxEVcCwjRdH8AfOEtkPaMjlOrchgQZFcJnFAPGI8NdXCc4Cu3Nz6dCcCKQBhMUQsNXsgJC8JYZDSWvoNS+hMQ7kkKk2d3oSNJ1YWLFEyKBOlCNgsFNUtZUTXWibGmaOorzG0+Q+c/Xqh+u/Cf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472464; c=relaxed/simple;
	bh=sbdK1Wj4msl7y1y2DnPgr0EJ0vb9IyPM1Oj2U7gbIF0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=l+cFbNgViLslMiu+tGLMJtisgmnfKiwPSMGVTEUZWC/itGUX4p4E/nXPIkFc+XYBaU09B5x/HYlCEt7RAcC8tf9tyPLI2gfioUX8wdDtLpRuT3pMV/3TzhwPMPtzpHhU7IcEmVrIITmLqsqzlxj1LNftAH2RQpEBKeItWlPoH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b325074c26so6880765b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472461; x=1790077261;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC1RvQTz80yPw2q4pjFaa2bb0g3j62xhY+4ZL+zxCtM=;
        b=rQ+V1aUo7qb7TSXBbAWbXnFkYg2EUHmvBF1RghyXAvP+7WySLuosi8Afh0/b296Spq
         B5nd+yfyc/gk+ziDp1oP1092PsOOKcfbfNm6JKxHYRhDdCkUKc3tXP5o01YfVE3OIl+r
         8jVjyRijLx6AVulhfi7XHUX206VohGARxMJNFLuXsLgtPZSX8RCpEHFUos+S8ANjDw5w
         tNSKA7ea8wZ4ALpOOJeGwm8YAipYeIYvH5+BU6CAFOjjzI0/ZpUHjOtsV01uFRgVEnGj
         aHoTBJP39rqj32f+Wf5HLNsCYVs0beqSby0sOSZFxxObkcw2RFCv6VQ5+nEtjXpnP+Cn
         MRMg==
X-Gm-Message-State: AFuF++l7NSPbT6yDq+6K0YOCLd7TY8v8AmwZzYGWuUSQFdmffVgzhpvD
	fcgs2vwnczwfg8t53ExFVe53RBlyobuztyaD1urtlni3i8o/qrpsc+4yKfQ2PkBQo12mYjHRJAH
	vzkkMBSwZXa8cX678ZzMuLRiXgo//RlEHliLd35PPm3SS4VOm8bm/HDK0w/4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc1:b0:6c0:853f:7e6e with SMTP id
 006d021491bc7-6c53fd88fc5mr4476926eaf.7.1789472461554; Tue, 15 Sep 2026
 04:41:01 -0700 (PDT)
Date: Tue, 15 Sep 2026 04:41:01 -0700
In-Reply-To: <467ab5f4-b68b-4c4e-8766-33f25fc73b8en@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa92ecd.a211d2ce.1a5198.02ab.GAE@google.com>
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


Warning: Permanently added '10.128.1.174' (ED25519) to the list of known ho=
sts.
2026/09/15 11:39:16 parsed 1 programs
2026/09/15 11:39:16 serving rpc on tcp://40329
[  164.032451][ T5644] cgroup: Unknown subsys name 'net'
[  164.136368][ T5644] cgroup: Unknown subsys name 'cpuset'
[  164.141195][ T5644] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  166.199670][ T5644] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  170.039756][ T5655] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  170.066765][ T5655] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  170.069747][ T5655] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  170.748703][ T4936] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  170.750332][ T4936] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  170.751133][ T4936] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  170.794058][ T4936] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  170.795173][ T4936] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  172.618702][   T13] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  172.618731][   T13] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  172.704043][   T49] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  172.704068][   T49] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  173.936465][ T5688] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  173.937304][ T5688] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  174.893786][ T5695] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  174.894352][ T5695] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  174.894468][ T5695] bridge_slave_0: entered allmulticast mode
[  174.895993][ T5695] bridge_slave_0: entered promiscuous mode
[  174.909520][ T5695] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  174.910196][ T5695] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  174.910684][ T5695] bridge_slave_1: entered allmulticast mode
[  174.917803][ T5695] bridge_slave_1: entered promiscuous mode
[  174.988942][ T5695] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  175.003307][ T5695] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  175.039371][ T5695] team0: Port device team_slave_0 added
[  175.048961][ T5695] team0: Port device team_slave_1 added
[  175.079853][ T5695] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  175.079869][ T5695] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  175.079894][ T5695] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  175.089178][ T5695] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  175.089247][ T5695] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  175.089313][ T5695] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  175.219468][ T5695] hsr_slave_0: entered promiscuous mode
[  175.220866][ T5695] hsr_slave_1: entered promiscuous mode
[  175.462685][ T5695] netdevsim netdevsim8 netdevsim0: renamed from eth0
[  175.475140][ T5695] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  175.479413][ T5695] netdevsim netdevsim8 netdevsim1: renamed from eth1
[  175.504861][ T5695] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  175.505847][ T5695] netdevsim netdevsim8 netdevsim2: renamed from eth2
[  175.509981][ T5695] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  175.538865][ T5695] netdevsim netdevsim8 netdevsim3: renamed from eth3
[  175.550904][ T5695] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  175.596778][ T5695] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  175.596992][ T5695] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  175.597537][ T5695] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  175.597930][ T5695] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  175.709168][ T5695] 8021q: adding VLAN 0 to HW filter on device bond0
[  175.736293][   T49] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  175.737639][   T49] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  175.774915][ T5695] 8021q: adding VLAN 0 to HW filter on device team0
[  175.793556][ T1127] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  175.793704][ T1127] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  175.826576][ T1127] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  175.826677][ T1127] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  176.299025][ T5695] 8021q: adding VLAN 0 to HW filter on device batadv0
[  176.565305][ T5695] veth0_vlan: entered promiscuous mode
[  176.585921][ T5695] veth1_vlan: entered promiscuous mode
[  176.650471][ T5695] veth0_macvtap: entered promiscuous mode
[  176.669091][ T5695] veth1_macvtap: entered promiscuous mode
[  176.700205][ T5695] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  176.721025][ T5695] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  176.822810][   T13] netdevsim netdevsim8 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  176.822864][   T13] netdevsim netdevsim8 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  176.822902][   T13] netdevsim netdevsim8 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  176.822938][   T13] netdevsim netdevsim8 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  176.927812][ T1127] netdevsim netdevsim8 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  177.042283][ T1127] netdevsim netdevsim8 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  177.748476][ T1127] netdevsim netdevsim8 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  178.374034][ T1127] netdevsim netdevsim8 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  179.252590][ T1127] bridge_slave_1: left allmulticast mode
[  179.252632][ T1127] bridge_slave_1: left promiscuous mode
[  179.253798][ T1127] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  179.257783][ T1127] bridge_slave_0: left allmulticast mode
[  179.257805][ T1127] bridge_slave_0: left promiscuous mode
[  179.259188][ T1127] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  179.468567][ T1127] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  179.483504][ T1127] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  179.485895][ T1127] bond0 (unregistering): Released all slaves
[  179.611377][ T1127] hsr_slave_0: left promiscuous mode
[  179.613582][ T1127] hsr_slave_1: left promiscuous mode
[  179.614734][ T1127] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  179.614773][ T1127] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  179.618745][ T1127] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  179.618773][ T1127] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  179.685609][ T1127] veth1_macvtap: left promiscuous mode
[  179.685678][ T1127] veth0_macvtap: left promiscuous mode
[  179.685913][ T1127] veth1_vlan: left promiscuous mode
[  179.686015][ T1127] veth0_vlan: left promiscuous mode
[  180.098022][ T1127] team0 (unregistering): Port device team_slave_1 remo=
ved
[  180.130421][ T1127] team0 (unregistering): Port device team_slave_0 remo=
ved
[  180.315425][ T5281] 8021q: adding VLAN 0 to HW filter on device eth1
[  181.056031][ T5281] 8021q: adding VLAN 0 to HW filter on device eth2
[  181.813895][ T5281] 8021q: adding VLAN 0 to HW filter on device eth4
[  182.339157][ T5281] 8021q: adding VLAN 0 to HW filter on device eth3


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
 -ffile-prefix-map=3D/tmp/go-build429373818=3D/tmp/go-build -gno-record-gcc=
-switches'
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
/usr/bin/ld: /tmp/cch4vc37.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         0d2c6557 dma-buf: udmabuf: cap page count to allocatio..
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
