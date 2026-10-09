Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29949B1FA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538569; cv=none; b=dE1uUwzxr0UGA8/L9IeKsiu0oBi/HipUfGRyLxEXMmZA5s+LC3rT7Qx8b3wnv/L9VzigGBoMl/tl+cGMQTwnwnkOUSJcLbDR49R6xE0xsmfzrbFIXpzxCztnzlmavBmb1FoxMJmDRFrJaZVQx1Ce5cmEqjOG5t9vOw1wamj4Zhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538569; c=relaxed/simple;
	bh=e5mFNFCY+YpRPFnSIYrZ3JAbaXa1IKv/Cmb0/5dztMA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rp/h0mRm0ySjqO3B4X5jddZNfDvg9weYKjnZV9B7q7vM8LEnbYaAzHVTQZ0hX5R/rNeypgFM8YVSqIDjoxVxwdF+pIyh2IU68rGaILJgyp7T3WOg63V01whju/usCi3a4gVGRlmZ2/X8iLYu+vqioXHSee5mb+F1EOfZl8ysjPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c467e19391so10930952b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538562; x=1792143362;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TPn/hSVpXKh5j5vQOeitEb2oZ8egKZZTrE5I1xMz4c=;
        b=jkOQZtw5ghbLT8G0kLSs3jb+kMXOcxCobY8eM3MAB9iLzfxdtBDypTqXn4txZM5m76
         UVkb3OIcTkyOjyMi3y0lacic+QZkgOtxXwD0dKv5Ehr4H2YiAdyeeiye4SW4HZXqKwj1
         X+yZXoejW6F/uB0UyXWC76aFpsmI3duU2C6K9XjzRBwvJ7W8zjL5WweeiChXZdM11I7p
         JfsoAunGxHwT+ioG4iRhrFRjmSHY41HpjlpEdrb8w4uDgzFteLeSPprDZa3DHx8+xQog
         NLJS2anPe7dbcV0ans+7padxWIv00j6r8wW6DDVtYCMc9K2pw1YEwYA6GRMxbzGm+cIG
         hceQ==
X-Forwarded-Encrypted: i=1; AKwUvBybdU8P41BlE8O6FQSIscVzRe5XLiWZFM/7fWw1esIUmnFp/JM5uX3CMuUq+QylY3jmzf6xRtOMrXVL1cA=@vger.kernel.org
X-Gm-Message-State: AFuF++knXAeL4/NUzqvgNVPWDDDX6/wTzSzQALq/RZcaTGS21rb5EK3B
	f+CBc+2FOvsgcotLu8bmo/b30b9NgtL+KNZ8QXW1ivHh4pwUEmuEwMvx49+AISM9JMjyG0tWn1U
	D00OBYaVN4tiOY+f7M9zfWiJzexXIO9tQpDQLDzYSPg1Hcz3GEV9u/UWC17U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1303:b0:4d6:9222:99f7 with SMTP id
 5614622812f47-50c59e37adcmr990347b6e.55.1791538562616; Fri, 09 Oct 2026
 02:36:02 -0700 (PDT)
Date: Fri, 09 Oct 2026 02:36:02 -0700
In-Reply-To: <20261009085232.236099-1-krishgulati7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac8b582.8cdf6287.1eb53.0042.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in report_descriptor_read
From: syzbot <syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com>
To: krishgulati7@gmail.com, linux-kernel@vger.kernel.org, 
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


Warning: Permanently added '10.128.0.41' (ED25519) to the list of known hos=
ts.
2026/10/09 09:34:35 parsed 1 programs
2026/10/09 09:34:35 serving rpc on tcp://43817
[  102.876825][  T925] cfg80211: failed to load regulatory.db
[  106.327252][ T5632] cgroup: Unknown subsys name 'net'
[  106.439832][ T5632] cgroup: Unknown subsys name 'cpuset'
[  106.443439][ T5632] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  108.162061][ T5632] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  111.819814][ T5652] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  111.895801][ T5652] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  111.896346][ T5652] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  111.896898][ T5652] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  111.902540][ T5652] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  114.332029][   T52] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  114.341885][   T52] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  114.343656][   T52] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  114.361467][   T52] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  114.362876][   T52] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  115.050524][ T5660] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  115.050711][ T5660] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  115.050850][ T5660] bridge_slave_0: entered allmulticast mode
[  115.052750][ T5660] bridge_slave_0: entered promiscuous mode
[  115.066100][ T5660] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  115.066473][ T5660] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  115.067077][ T5660] bridge_slave_1: entered allmulticast mode
[  115.073434][ T5660] bridge_slave_1: entered promiscuous mode
[  115.203238][ T5660] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  115.237612][ T5660] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  115.351254][ T5660] team0: Port device team_slave_0 added
[  115.367447][ T3373] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  115.367473][ T3373] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  115.367963][ T5660] team0: Port device team_slave_1 added
[  115.589878][ T5660] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  115.589899][ T5660] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  115.589927][ T5660] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  115.680889][ T5660] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  115.680911][ T5660] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  115.680940][ T5660] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  115.793147][   T38] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  115.793171][   T38] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  115.967068][ T5660] hsr_slave_0: entered promiscuous mode
[  115.969950][ T5660] hsr_slave_1: entered promiscuous mode
[  116.396134][   T52] Bluetooth: hci0: command tx timeout
[  116.512868][ T5660] netdevsim netdevsim3 netdevsim0: renamed from eth0
[  116.529158][ T5660] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  116.530373][ T5660] netdevsim netdevsim3 netdevsim1: renamed from eth1
[  116.539523][ T5660] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  116.550138][ T5660] netdevsim netdevsim3 netdevsim2: renamed from eth2
[  116.566932][ T5660] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  116.567879][ T5660] netdevsim netdevsim3 netdevsim3: renamed from eth3
[  116.571472][ T5660] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  116.680185][ T5660] 8021q: adding VLAN 0 to HW filter on device bond0
[  116.709742][ T5660] 8021q: adding VLAN 0 to HW filter on device team0
[  116.726696][   T13] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  116.726857][   T13] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  116.753165][   T13] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  116.753330][   T13] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  116.868524][ T5660] 8021q: adding VLAN 0 to HW filter on device batadv0
[  116.940028][ T5660] veth0_vlan: entered promiscuous mode
[  116.952983][ T5660] veth1_vlan: entered promiscuous mode
[  116.991256][ T5660] veth0_macvtap: entered promiscuous mode
[  117.005351][ T5660] veth1_macvtap: entered promiscuous mode
[  117.032181][ T5660] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  117.050081][ T5660] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  117.124391][   T59] netdevsim netdevsim3 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.125110][   T59] netdevsim netdevsim3 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.125403][   T59] netdevsim netdevsim3 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.125442][   T59] netdevsim netdevsim3 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  117.799185][   T13] netdevsim netdevsim3 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  119.087949][   T13] netdevsim netdevsim3 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  120.448211][   T13] netdevsim netdevsim3 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  120.500961][   T13] netdevsim netdevsim3 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  120.612426][   T13] bridge_slave_1: left allmulticast mode
[  120.612473][   T13] bridge_slave_1: left promiscuous mode
[  120.613994][   T13] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  120.642935][   T13] bridge_slave_0: left allmulticast mode
[  120.642959][   T13] bridge_slave_0: left promiscuous mode
[  120.643537][   T13] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  120.800837][   T13] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  120.803647][   T13] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  120.829743][   T13] bond0 (unregistering): Released all slaves
[  121.362267][   T13] hsr_slave_0: left promiscuous mode
[  121.363205][   T13] hsr_slave_1: left promiscuous mode
[  121.364924][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  121.365067][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  121.387394][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  121.387417][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  121.420376][   T13] veth1_macvtap: left promiscuous mode
[  121.420458][   T13] veth0_macvtap: left promiscuous mode
[  121.420618][   T13] veth1_vlan: left promiscuous mode
[  121.421002][   T13] veth0_vlan: left promiscuous mode
[  121.712487][   T13] team0 (unregistering): Port device team_slave_1 remo=
ved
[  121.730041][   T13] team0 (unregistering): Port device team_slave_0 remo=
ved
[  121.880288][ T5281] 8021q: adding VLAN 0 to HW filter on device eth1
[  122.378773][ T5281] 8021q: adding VLAN 0 to HW filter on device eth2
[  122.808975][ T5281] 8021q: adding VLAN 0 to HW filter on device eth3
[  123.211497][ T5281] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build95449590=3D/tmp/go-build -gno-record-gcc-=
switches'
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
HEAD detached at 1e72964b0
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260817-123423"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260817-123423"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260817-123423"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"1e72964b0111319984575e60f266d1fa0a=
98abb5\"
/usr/bin/ld: /tmp/cc4sYuge.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         af32da41 Merge tag 'net-7.3-rc7' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3De54cfa0d265a296=
a
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbc537ca7a0efe3398=
8eb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D108bb9d15800=
00

