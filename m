Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF4239E60
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224746; cv=none; b=CmWZPjqAjcWpBEjMI8BtJNzI0ajFv9/Drsxcovhmj3laYIelfkr4cStg4nVnkW8bc2Ra2m2Vn+VLaZ5ai+Er39po/q1iwqJ66+0zIre+vuPd7km/rKQPmJAtwHJ2QGqCtT7jcOJhhaVn8f3XeT7OGFHwiQO58wUlIYWHORY3LNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224746; c=relaxed/simple;
	bh=VhbdhbfB4jK4rXTMZYajcxg+rYaXHGIHLygN/VzGa3s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=o2BWF+Wf9CBSdTZB5DfrW8iUQTypj23I9Dgg4s+Jg8Rk9zo8fE1k+tpuvaKKnjxbxJTBQbIsCWH/O/kRS+Dn2naVUosvEi0eYrYvfGNoPPmNTDTgAIoeHKedh6U+MjVgFrD5GeBidL8NOn+MlpSworBBQ7ENljupuu6X6wIBjec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46617932071so1290335fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224743; x=1790829543;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldXsmXgypLLL+wLsd1iuCDempyl4RLGRw/uTvRFLqqs=;
        b=k7jNe1vtMaM+nyvGH8WtSyN9bP/fdq7/rno35jYB7FbCqI4bCDAxwEP14P7mnV/znA
         bDmi3QezZLAMiap0U53f6vE2QvYGUwjIt+w5q19m1Uqn9eJxCyrom+YFqUFphyTUYbaU
         XD0jBJ4MadeBMqGm4ACMiozjJ1ukAc4ZvgayftfHM47povxkYzCie3cmRahtw0H/eXRW
         oHpUBTC19qBjR6dgYJgR3m0UDof+pm0oxufhCsjLx5XTeiN3xx4yTo1WLSrNLFcYLIDp
         R9DiBwe+h1j1rSYYRCq4LVBVTjYn2VInqiI/RDObgKdKnh+Bb+Q2npFNwi2uxyBW0y/B
         SIIQ==
X-Gm-Message-State: AFuF++k8ADX2sjm0bKWE8HZDPzRk+MOkTavzlBVqWF4nIPi2VPzH8Or2
	fmR512vvMEYIbQAkIxjKpVKwaDHuPKxF2A3Iw/2G/TrDR/+1Xqu3WM2aHGqzl6aEnyb7i4DxLld
	e41KGlQnM6F6FYVSvili7UqvboXphs+N71PUnm1AeXLNEV4lnCMvYz3mPd5E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:203:10b0:4c3:7073:8c4d with SMTP id
 5614622812f47-4d72aa4be39mr1140617b6e.20.1790224743287; Wed, 23 Sep 2026
 21:39:03 -0700 (PDT)
Date: Wed, 23 Sep 2026 21:39:03 -0700
In-Reply-To: <CANfDJ7J0ayM=DyztQX_CK1079M6y--j53grH3Lo-nMsvBh6Sxw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab4a967.80e1c6cc.1e8e5f.0009.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usbatm_usb_disconnect (2)
From: syzbot <syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	valigurasm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lost connection to test machine



Warning: Permanently added '10.128.0.152' (ED25519) to the list of known ho=
sts.
[  104.110945][   T26] cfg80211: failed to load regulatory.db
2026/09/24 04:37:36 parsed 1 programs
2026/09/24 04:37:36 serving rpc on tcp://45101
[  108.765106][ T5627] cgroup: Unknown subsys name 'net'
[  108.845318][ T5627] cgroup: Unknown subsys name 'cpuset'
[  108.849022][ T5627] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  110.759122][ T5627] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  115.031120][ T5645] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  115.107820][   T63] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  115.107856][   T63] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  115.144771][ T5645] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  115.168053][ T5646] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  115.168581][ T5646] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  115.197491][ T5646] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  115.449611][   T15] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  115.449637][   T15] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  115.976932][ T5664] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  115.978489][ T5664] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  115.980422][ T5664] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  116.010825][ T5664] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  116.012286][ T5664] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  119.679966][ T5683] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  119.681240][ T5683] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  119.681447][ T5683] bridge_slave_0: entered allmulticast mode
[  119.684621][ T5683] bridge_slave_0: entered promiscuous mode
[  119.729993][ T5683] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  119.730125][ T5683] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  119.730266][ T5683] bridge_slave_1: entered allmulticast mode
[  119.737183][ T5683] bridge_slave_1: entered promiscuous mode
[  119.792880][ T5683] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  119.797134][ T5683] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  119.857045][ T5683] team0: Port device team_slave_0 added
[  119.860034][ T5683] team0: Port device team_slave_1 added
[  119.908092][ T5683] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  119.908107][ T5683] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  119.908142][ T5683] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  119.918496][ T5683] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  119.918552][ T5683] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  119.918620][ T5683] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  120.065869][ T5683] hsr_slave_0: entered promiscuous mode
[  120.067223][ T5683] hsr_slave_1: entered promiscuous mode
[  120.309950][ T5683] netdevsim netdevsim1 netdevsim0: renamed from eth0
[  120.331221][ T5683] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  120.332756][ T5683] netdevsim netdevsim1 netdevsim1: renamed from eth1
[  120.338769][ T5683] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  120.340191][ T5683] netdevsim netdevsim1 netdevsim2: renamed from eth2
[  120.379794][ T5683] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  120.391372][ T5683] netdevsim netdevsim1 netdevsim3: renamed from eth3
[  120.395616][ T5683] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  120.522673][ T5683] 8021q: adding VLAN 0 to HW filter on device bond0
[  120.571852][ T5683] 8021q: adding VLAN 0 to HW filter on device team0
[  120.586140][ T1107] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  120.587099][ T1107] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  120.623606][ T1107] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  120.623719][ T1107] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  121.166859][ T5683] 8021q: adding VLAN 0 to HW filter on device batadv0
[  121.225906][ T5683] veth0_vlan: entered promiscuous mode
[  121.245659][ T5683] veth1_vlan: entered promiscuous mode
[  121.283334][ T5683] veth0_macvtap: entered promiscuous mode
[  121.288501][ T5683] veth1_macvtap: entered promiscuous mode
[  121.328425][ T5683] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  121.347773][ T5683] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  121.385467][   T61] netdevsim netdevsim1 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  121.441224][   T15] netdevsim netdevsim1 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  121.441689][   T12] netdevsim netdevsim1 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  121.441730][   T12] netdevsim netdevsim1 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  121.545150][   T15] netdevsim netdevsim1 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  121.735392][   T15] netdevsim netdevsim1 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  121.813228][   T15] netdevsim netdevsim1 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  122.585900][   T15] netdevsim netdevsim1 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  123.977067][   T15] bridge_slave_1: left allmulticast mode
[  123.977125][   T15] bridge_slave_1: left promiscuous mode
[  123.978185][   T15] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  124.009571][   T15] bridge_slave_0: left allmulticast mode
[  124.009602][   T15] bridge_slave_0: left promiscuous mode
[  124.009818][   T15] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  124.205269][   T15] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  124.208371][   T15] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  124.209896][   T15] bond0 (unregistering): Released all slaves
[  124.322497][   T15] hsr_slave_0: left promiscuous mode
[  124.323234][   T15] hsr_slave_1: left promiscuous mode
[  124.324049][   T15] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  124.324083][   T15] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  124.325113][   T15] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  124.325139][   T15] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  124.335409][   T15] veth1_macvtap: left promiscuous mode
[  124.335600][   T15] veth0_macvtap: left promiscuous mode
[  124.335904][   T15] veth1_vlan: left promiscuous mode
[  124.336341][   T15] veth0_vlan: left promiscuous mode
[  124.635344][   T15] team0 (unregistering): Port device team_slave_1 remo=
ved
[  124.659419][   T15] team0 (unregistering): Port device team_slave_0 remo=
ved
[  125.298901][ T5277] 8021q: adding VLAN 0 to HW filter on device eth1
[  125.817831][ T5277] 8021q: adding VLAN 0 to HW filter on device eth2
[  126.281718][ T5277] 8021q: adding VLAN 0 to HW filter on device eth3
[  126.874157][ T5277] 8021q: adding VLAN 0 to HW filter on device eth4
[  139.942150][ T1311] ieee802154 phy0 wpan0: encryption failed: -22
[  139.942221][ T1311] ieee802154 phy1 wpan1: encryption failed: -22


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
 -ffile-prefix-map=3D/tmp/go-build2772565244=3D/tmp/go-build -gno-record-gc=
c-switches'
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
HEAD detached at 853b104bb45
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D853b104bb454141a5b0fc0e4218ec78e9f34ffb1 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260918-062331"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D853b104bb454141a5b0fc0e4218ec78e9f34ffb1 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260918-062331"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D853b104bb454141a5b0fc0e4218ec78e9f34ffb1 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260918-062331"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"853b104bb454141a5b0fc0e4218ec78e9f=
34ffb1\"
/usr/bin/ld: /tmp/ccrvmrqk.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         62f4c998 Merge tag 'parisc-for-7.3-rc5' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d4242cb1c54cdf=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9ca2c9f85bd8b5e46=
516
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1048b4055800=
00

