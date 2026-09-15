Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC266481FA1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469531; cv=none; b=dcJESgAhUHo3+rFISnwz5hmYxy3JtZA92/RgV7N6nTWCosXz5nh+gHcvwW08ZZ0lAzpzaaxma6sRzXjWMtddR8lYSyeEr7iyGWB+qcD8CJGHiFJB+W5k7CwdcVr5PHWzJ3Dwv5LoNoNtdy/HCTCKjxITXkXohwjBE214XqTFoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469531; c=relaxed/simple;
	bh=/4kOwKI4dthME8ZS7SdMcx4YL3Tk5QgWQx2Bs41+uhY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uKY2NAQZmYiYCMBTgQYU1RChAnOg6gF/keBx1GX3SyFj2WdlGJzVaZ9AnOiK0tMTxOEweNDajtA1EnnLdz6HFEPnLicNu95Ov7y1T0rxFpdmoKSHz1DNCz7roLQZdztz6as17Bc1y9U/MuUW6rvXD4Uh9S4UqlWQry1ui/uC7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f653940ba4so6110355a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469525; x=1790074325;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmppWa1dd4E0urch+is+k1zQJxfBJvkkU7cmZ3P1Wr4=;
        b=iZrNFDNDEWUN23vExREc+cWE9iNzo0+I9+f9cR9oESwXfE0UPzesQvxHLN+iuzqwAz
         /ad6KL9bAXnCBc9C3FYFIcadBqDHsdGE4gb204JOetv+5MTFtTZ9yYbA81nA+i8NOL55
         4Z+4vLeyhEoRk+RO1bVCAZsVuPVVt2ZOxuXXaPBUCHu2e6QR1IwmyI1RiPiSUTg9biTR
         ezWv1nL8ZRsuLuwIpxRk6dCr5CtG+XEsFLwKy4rwRgp9vgft6iBC29SLGhswO74quZBS
         XZ7XKEW9emw3yPPqbygmoVw6WzvxS2uiA5EoYubOfDLqohiSrlHTp2A7myG9igGwhl4r
         OaFw==
X-Gm-Message-State: AFuF++kPKJWuscBSb2Q64cTujcLQK0Yap9CCCy8ctAWaGdF16RvuzWZ5
	81bEq9f6I7ud+7ZbaYgeTrBX0DvFst4tV8jJdKucaXuqmi12s+05sTJz6TvpX5SzJZVTBLPyTA2
	1O45CQGvZldG/FxU/JjmZkcW7QJu+SL1wayqmBfDSkR7RXEhjZG1udMaLNjo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b98:b0:6c0:2513:3e99 with SMTP id
 006d021491bc7-6c7380faddfmr197744eaf.24.1789469525079; Tue, 15 Sep 2026
 03:52:05 -0700 (PDT)
Date: Tue, 15 Sep 2026 03:52:05 -0700
In-Reply-To: <2baba8f8-085d-49ec-ab2d-7e7662858f6bn@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa92355.4c28b7d0.c1bba.0037.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] WARNING in udmabuf_create
From: syzbot <syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lost connection to test machine



Warning: Permanently added '10.128.0.238' (ED25519) to the list of known ho=
sts.
[   97.786558][  T991] cfg80211: failed to load regulatory.db
2026/09/15 10:50:08 parsed 1 programs
2026/09/15 10:50:08 serving rpc on tcp://44173
[  102.370241][ T5634] cgroup: Unknown subsys name 'net'
[  102.510422][ T5634] cgroup: Unknown subsys name 'cpuset'
[  102.514396][ T5634] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  104.351724][ T5634] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  108.056785][ T5648] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  108.062797][ T5648] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  108.068861][ T5648] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  108.582737][ T4937] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  108.583577][ T4937] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  108.584222][ T4937] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  108.585462][ T4937] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  108.609300][ T4937] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  109.734410][   T59] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  109.734443][   T59] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  109.782322][ T1166] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  109.782348][ T1166] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  110.483132][ T5676] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  110.483793][ T5676] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  111.173280][ T5681] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  111.174077][ T5681] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  111.174210][ T5681] bridge_slave_0: entered allmulticast mode
[  111.180442][ T5681] bridge_slave_0: entered promiscuous mode
[  111.205644][ T5681] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  111.205725][ T5681] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  111.205839][ T5681] bridge_slave_1: entered allmulticast mode
[  111.207192][ T5681] bridge_slave_1: entered promiscuous mode
[  111.273019][ T5681] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  111.284131][ T5681] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  111.326721][ T5681] team0: Port device team_slave_0 added
[  111.329659][ T5681] team0: Port device team_slave_1 added
[  111.364079][ T5681] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  111.364095][ T5681] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  111.364120][ T5681] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  111.371516][ T5681] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  111.371563][ T5681] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  111.371642][ T5681] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  111.490683][ T5681] hsr_slave_0: entered promiscuous mode
[  111.491890][ T5681] hsr_slave_1: entered promiscuous mode
[  111.681668][ T5681] netdevsim netdevsim7 netdevsim0: renamed from eth0
[  111.695207][ T5681] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  111.698832][ T5681] netdevsim netdevsim7 netdevsim1: renamed from eth1
[  111.716309][ T5681] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  111.718026][ T5681] netdevsim netdevsim7 netdevsim2: renamed from eth2
[  111.721600][ T5681] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  111.722634][ T5681] netdevsim netdevsim7 netdevsim3: renamed from eth3
[  111.730316][ T5681] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  111.870717][ T5681] 8021q: adding VLAN 0 to HW filter on device bond0
[  111.897849][ T5681] 8021q: adding VLAN 0 to HW filter on device team0
[  111.905286][   T13] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  111.905412][   T13] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  111.937788][ T1166] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  111.937887][ T1166] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  112.340978][ T5681] 8021q: adding VLAN 0 to HW filter on device batadv0
[  112.604890][ T5681] veth0_vlan: entered promiscuous mode
[  112.619788][ T5681] veth1_vlan: entered promiscuous mode
[  112.660128][ T5681] veth0_macvtap: entered promiscuous mode
[  112.664268][ T5681] veth1_macvtap: entered promiscuous mode
[  112.695347][ T5681] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  112.714375][ T5681] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  112.748603][   T50] netdevsim netdevsim7 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  112.748650][   T50] netdevsim netdevsim7 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  112.748685][   T50] netdevsim netdevsim7 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  112.748718][   T50] netdevsim netdevsim7 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  112.882798][   T59] netdevsim netdevsim7 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  112.981434][   T59] netdevsim netdevsim7 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  113.059638][   T59] netdevsim netdevsim7 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  113.129303][   T59] netdevsim netdevsim7 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  114.003889][   T59] bridge_slave_1: left allmulticast mode
[  114.003941][   T59] bridge_slave_1: left promiscuous mode
[  114.005600][   T59] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  114.040756][   T59] bridge_slave_0: left allmulticast mode
[  114.040789][   T59] bridge_slave_0: left promiscuous mode
[  114.042310][   T59] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  114.373228][   T59] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  114.391864][   T59] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  114.394015][   T59] bond0 (unregistering): Released all slaves
[  114.560846][   T59] hsr_slave_0: left promiscuous mode
[  114.562142][   T59] hsr_slave_1: left promiscuous mode
[  114.563318][   T59] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  114.563353][   T59] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  114.565447][   T59] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  114.565470][   T59] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  114.626880][   T59] veth1_macvtap: left promiscuous mode
[  114.626941][   T59] veth0_macvtap: left promiscuous mode
[  114.627063][   T59] veth1_vlan: left promiscuous mode
[  114.627209][   T59] veth0_vlan: left promiscuous mode
[  114.939935][   T59] team0 (unregistering): Port device team_slave_1 remo=
ved
[  114.960914][   T59] team0 (unregistering): Port device team_slave_0 remo=
ved
[  115.141058][ T5283] 8021q: adding VLAN 0 to HW filter on device eth1
[  115.879786][ T5283] 8021q: adding VLAN 0 to HW filter on device eth2
[  116.704848][ T5283] 8021q: adding VLAN 0 to HW filter on device eth3
[  117.419422][ T5283] 8021q: adding VLAN 0 to HW filter on device eth4
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  133.617311][ T1316] ieee802154 phy0 wpan0: encryption failed: -22
[  133.617371][ T1316] ieee802154 phy1 wpan1: encryption failed: -22


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
 -ffile-prefix-map=3D/tmp/go-build3857553325=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccoD0zzS.o: in function `Connection::Connect(char const*,=
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
