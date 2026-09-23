Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BD3DDB03
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200865; cv=none; b=fNtLtER8IY+PGDeInFSLfZlDdsRwhkhK1VJ1RT5ISV4tsW2DRrabCJJe7IbRi7QrrVwFmf/STX465lcrFbU6ihOsAYPPiOR2fAE7savdfLLKSxpUgXplnz+J+XA3Brd4zp9lIhdcJaV2aF2MvpJrkqD4bo7rOt4NVhwIRNATp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200865; c=relaxed/simple;
	bh=nALnp8J0kmSBRXGTa5UATe1pe0a31PCyBJxcf4U9b9I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LQ7nwBgA0Z+gVDAjoJlz6NmKT2ZzDWry9mVTwbcLQpVVrIRE0bA8WgEbLlMfLFPc4NaMzEEIuQ5AU6o+Nr1IBnzYyvtgcDEtHB624Y5GWMLl03uxeYSbqTu6Sq9HLvdJ885Q219sjRQ/1KxxAMAMockL2bjVw5kbCcGnkLnZKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so2767995b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200862; x=1790805662;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znmcBXeLRP+rJX05Zo8WD6IDGUgUq827202TM0kus88=;
        b=DpRYnu/8k97JoLkM28ZbBeB8OXFqjiT1A+rpeu1ezJC6LCvLnjNumPjZw3ZmNaQXIX
         cTv5wBOXgKD0Q6BjkJjnnvDa2EOmshTWhNL1qGUI6pDvoNcv/Qvbzkzo7Znq68SZnhS2
         NvrAG+wYW+ujjp1Jd+ulYL1kMCpRu3hNq64wfkTQwVyvl+soYRtappl3LsY4TBJXO+cK
         A3j6U29TU1ki6PDkKHs7//Ukrs7NhoIDLoqTM5rPSveHLebZYHxHJZ3bytuRIwYJHdFS
         0L+dplYTo+BHcf/CIHe4HAbUMOJK0UQBmVhMvBuzd6qyN/wY7klTS2+d1hUglxzmTulE
         pyGg==
X-Gm-Message-State: AFuF++kn9A2k2OKMFptSShsVlvuGyZfFQaXK8VEzGKEfwO5b6BxA8hpf
	/5uQDL4/Vn/HdJWDgj8lOEOuxubcuNcIj6eAnNmN6Bqen7gHo50RAzhAL57PIDol3hCxid0hRNc
	Jr8LJJv798eQOPpydvpFiVMQXPhAQvq//l7Atv9+XsC9mGXkSCdB9zrccysk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1303:b0:4cc:3535:1998 with SMTP id
 5614622812f47-4d72c13d9camr603128b6e.10.1790200862387; Wed, 23 Sep 2026
 15:01:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:01:02 -0700
In-Reply-To: <CANfDJ7LzXYw=ZoG8Qx=Gu81SDpGSQDSg-paPQVpZo_+dTGGA7w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab44c1e.fb6b21f1.1b3075.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usbatm_usb_disconnect (2)
From: syzbot <syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	valigurasm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lost connection to test machine



Warning: Permanently added '10.128.1.106' (ED25519) to the list of known ho=
sts.
2026/09/23 21:58:53 parsed 1 programs
2026/09/23 21:58:53 serving rpc on tcp://36741
[  108.303160][  T923] cfg80211: failed to load regulatory.db
[  112.594660][ T5628] cgroup: Unknown subsys name 'net'
[  112.732732][ T5628] cgroup: Unknown subsys name 'cpuset'
[  112.746517][ T5628] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  114.653895][ T5628] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  118.241459][ T5649] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  118.312791][ T5649] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  118.342551][ T5649] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  118.935095][ T1161] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  118.935132][ T1161] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  119.314186][   T60] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  119.314208][   T60] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  119.514008][ T5659] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  119.514671][ T5659] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  120.499036][ T5685] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  120.504897][ T5685] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  120.505931][ T5685] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  120.507278][ T5685] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  120.541791][ T5685] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  122.840866][ T5680] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  122.841743][ T5680] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  122.842082][ T5680] bridge_slave_0: entered allmulticast mode
[  122.862531][ T5680] bridge_slave_0: entered promiscuous mode
[  122.889547][ T5680] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  122.889656][ T5680] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  122.889794][ T5680] bridge_slave_1: entered allmulticast mode
[  122.891937][ T5680] bridge_slave_1: entered promiscuous mode
[  122.984739][ T5680] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  123.001661][ T5680] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  123.051936][ T5680] team0: Port device team_slave_0 added
[  123.055615][ T5680] team0: Port device team_slave_1 added
[  123.112267][ T5680] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  123.112288][ T5680] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  123.112327][ T5680] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  123.116516][ T5680] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  123.116534][ T5680] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  123.116558][ T5680] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  123.261249][ T5680] hsr_slave_0: entered promiscuous mode
[  123.262263][ T5680] hsr_slave_1: entered promiscuous mode
[  123.471857][ T5680] netdevsim netdevsim8 netdevsim0: renamed from eth0
[  123.487856][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  123.489120][ T5680] netdevsim netdevsim8 netdevsim1: renamed from eth1
[  123.493156][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  123.494176][ T5680] netdevsim netdevsim8 netdevsim2: renamed from eth2
[  123.504829][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  123.507973][ T5680] netdevsim netdevsim8 netdevsim3: renamed from eth3
[  123.548418][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  123.652099][ T5680] 8021q: adding VLAN 0 to HW filter on device bond0
[  123.685093][ T5680] 8021q: adding VLAN 0 to HW filter on device team0
[  123.702139][   T60] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  123.702279][   T60] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  123.730774][   T78] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  123.730885][   T78] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  124.170694][ T5680] 8021q: adding VLAN 0 to HW filter on device batadv0
[  124.430316][ T5680] veth0_vlan: entered promiscuous mode
[  124.447342][ T5680] veth1_vlan: entered promiscuous mode
[  124.488229][ T5680] veth0_macvtap: entered promiscuous mode
[  124.492929][ T5680] veth1_macvtap: entered promiscuous mode
[  124.527631][ T5680] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  124.540115][ T5680] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  124.647568][ T1161] netdevsim netdevsim8 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  124.647619][ T1161] netdevsim netdevsim8 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  124.647655][ T1161] netdevsim netdevsim8 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  124.647690][ T1161] netdevsim netdevsim8 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  124.806492][ T1161] netdevsim netdevsim8 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  124.903314][ T1161] netdevsim netdevsim8 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  124.980877][ T1161] netdevsim netdevsim8 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  125.116872][ T1161] netdevsim netdevsim8 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  125.883310][ T1161] bridge_slave_1: left allmulticast mode
[  125.883361][ T1161] bridge_slave_1: left promiscuous mode
[  125.884401][ T1161] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  125.920237][ T1161] bridge_slave_0: left allmulticast mode
[  125.920268][ T1161] bridge_slave_0: left promiscuous mode
[  125.920607][ T1161] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  126.095488][ T1161] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  126.110922][ T1161] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  126.112236][ T1161] bond0 (unregistering): Released all slaves
[  126.223248][ T1161] hsr_slave_0: left promiscuous mode
[  126.226835][ T1161] hsr_slave_1: left promiscuous mode
[  126.233387][ T1161] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  126.233431][ T1161] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  126.241512][ T1161] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  126.241585][ T1161] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  126.286396][ T1161] veth1_macvtap: left promiscuous mode
[  126.286461][ T1161] veth0_macvtap: left promiscuous mode
[  126.286648][ T1161] veth1_vlan: left promiscuous mode
[  126.286760][ T1161] veth0_vlan: left promiscuous mode
[  126.654559][ T1161] team0 (unregistering): Port device team_slave_1 remo=
ved
[  126.682089][ T1161] team0 (unregistering): Port device team_slave_0 remo=
ved
[  126.875676][ T5279] 8021q: adding VLAN 0 to HW filter on device eth1
[  127.409335][ T5279] 8021q: adding VLAN 0 to HW filter on device eth2
[  127.993497][ T5279] 8021q: adding VLAN 0 to HW filter on device eth3
[  128.438182][ T5279] 8021q: adding VLAN 0 to HW filter on device eth4
[  139.019729][ T1313] ieee802154 phy0 wpan0: encryption failed: -22
[  139.019831][ T1313] ieee802154 phy1 wpan1: encryption failed: -22


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
 -ffile-prefix-map=3D/tmp/go-build3081947690=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/cctVKtvW.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         fe2ec837 Merge tag 'hid-for-linus-2026092202' of git:/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d4242cb1c54cdf=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9ca2c9f85bd8b5e46=
516
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D111234055800=
00

