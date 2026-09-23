Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1623D0910
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202245; cv=none; b=EtsLVA6ar/r2fJ7m9a3FabW4hfHvX8JP0FMe+g9794sQXsA42oFgVpJNuxIvxDtlEPzMqybDFiO6l/6lVMOAwsDl5SpFlAv9vvWkzQpH55DBbTQBtxBhn5EekAxuH75eoDMCmyJqybyScZAy8ks0j9scPlhcOaxzTKl0Il/Utks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202245; c=relaxed/simple;
	bh=Q5tsa5JKNeuIyh5GXqSq1gbIeZrDAEKOQP249nVrAwM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NUWy7gwiZ6+iTBs7kcV2UTHk2Y6nNmPTrrngAoMXc+PSwimtiRdWnvQ28Kigdyh9kpSRQJKGPK6cN9js4g/J9VHjmfoRBi66bg7WEhLPedSoxYLkL6lEj9JovKSNQz0a8sr41FEKaK/IZjHxA9SDCJN4FeiFnXCS5Y+pUNNZ5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso2147710b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202242; x=1790807042;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBzEWA0GvFaGfJ0UdhAWTww1NInIqhmsUs/dJTRmG5k=;
        b=Zs3npjsiPNGbDl/QxgSUe+IWGX7hRXtbm4dz3ocopNI2AerI7NGIIYY1OT+arPp5mN
         btBhYpdn/h+D/FnuFGMqLw98nyhTMJF2QWm4vOxzX+fyPpqzi5Z7rXCjl5k47yFfK4me
         xxT+MgDSCJKXzrFJDSBc3vyKdk0dUGZ6W55xDg/Xg8t/D73lOAmmxBYc0WD7LDSgXsuM
         IkfVrqb+5iqfZbs+bU5V4QdkH+A8xrcw+3WjNqp6hHosV3e+gmnvlZ093eXFJ1AVCcNL
         042iIwurdSgbtSnXpi1TlhuOpYQ5thOx71b+AK+wzh6CgEZVTUEDBn4GvsGVrVll4Lue
         D84w==
X-Gm-Message-State: AFuF++lFhppvdnLjDzagiPQ0B6AW9THLfAsXRnYLBPiDFjXkas8FMOsM
	mba6EHNwa0NyI1Sxdm9eSaNw222wGQY6M7Ka/jo62EQsCVWMUkBzN0arhT7OjpaamGCMz6N2+T/
	LiRWN6lsUGUCizkonfijENdKnlFYn3ZrbuudjdBbM11O6fekDRQn/CcBwhsk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:238d:b0:4b2:8d7b:41b8 with SMTP id
 5614622812f47-4d72e7679d8mr643956b6e.18.1790202242051; Wed, 23 Sep 2026
 15:24:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:24:02 -0700
In-Reply-To: <20260923213522.136838-1-raghunathpalla.0209@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab45182.fb6b21f1.1b3075.0003.GAE@google.com>
Subject: Re: [syzbot] [block?] WARNING in blk_mq_free_tag_set
From: syzbot <syzbot+02b37e31e64ea5cb6d29@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, raghunathpalla.0209@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lost connection to test machine



Warning: Permanently added '10.128.1.133' (ED25519) to the list of known ho=
sts.
2026/09/23 22:22:32 parsed 1 programs
2026/09/23 22:22:32 serving rpc on tcp://38311
[   80.752692][ T5630] cgroup: Unknown subsys name 'net'
[   80.884056][ T5630] cgroup: Unknown subsys name 'cpuset'
[   80.887002][ T5630] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   82.538994][ T5630] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   85.496053][ T1286] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   85.496079][ T1286] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   85.531000][ T1177] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   85.531023][ T1177] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   85.583390][ T5644] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   85.587092][ T5644] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   85.589928][ T5644] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   87.002024][ T5660] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   87.002551][ T5660] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   87.076393][   T10] cfg80211: failed to load regulatory.db
[   87.473879][ T5672] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   87.475240][ T5672] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   87.477852][ T5672] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   87.490326][ T5672] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   87.491035][ T5672] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   88.269004][ T5679] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   88.269871][ T5679] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   88.269983][ T5679] bridge_slave_0: entered allmulticast mode
[   88.271043][ T5679] bridge_slave_0: entered promiscuous mode
[   88.276598][ T5679] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   88.276702][ T5679] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   88.276877][ T5679] bridge_slave_1: entered allmulticast mode
[   88.278620][ T5679] bridge_slave_1: entered promiscuous mode
[   88.317810][ T5679] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   88.321176][ T5679] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   88.354044][ T5679] team0: Port device team_slave_0 added
[   88.355878][ T5679] team0: Port device team_slave_1 added
[   88.378475][ T5679] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   88.378487][ T5679] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   88.378505][ T5679] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   88.382019][ T5679] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   88.382035][ T5679] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   88.382060][ T5679] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   88.470363][ T5679] hsr_slave_0: entered promiscuous mode
[   88.471884][ T5679] hsr_slave_1: entered promiscuous mode
[   88.615879][ T5679] netdevsim netdevsim8 netdevsim0: renamed from eth0
[   88.624106][ T5679] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   88.626007][ T5679] netdevsim netdevsim8 netdevsim1: renamed from eth1
[   88.632773][ T5679] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   88.634150][ T5679] netdevsim netdevsim8 netdevsim2: renamed from eth2
[   88.647163][ T5679] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   88.648072][ T5679] netdevsim netdevsim8 netdevsim3: renamed from eth3
[   88.661771][ T5679] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   88.744000][ T5679] 8021q: adding VLAN 0 to HW filter on device bond0
[   88.767054][ T5679] 8021q: adding VLAN 0 to HW filter on device team0
[   88.776887][ T1286] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   88.777039][ T1286] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   88.788827][ T1177] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   88.789042][ T1177] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   89.099652][ T5679] 8021q: adding VLAN 0 to HW filter on device batadv0
[   89.290291][ T5679] veth0_vlan: entered promiscuous mode
[   89.296863][ T5679] veth1_vlan: entered promiscuous mode
[   89.330971][ T5679] veth0_macvtap: entered promiscuous mode
[   89.334462][ T5679] veth1_macvtap: entered promiscuous mode
[   89.352460][ T5679] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   89.367216][ T5679] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   89.422390][ T1177] netdevsim netdevsim8 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   89.422436][ T1177] netdevsim netdevsim8 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   89.422468][ T1177] netdevsim netdevsim8 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   89.422499][ T1177] netdevsim netdevsim8 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   89.509842][ T1098] netdevsim netdevsim8 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   89.585930][ T1098] netdevsim netdevsim8 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   89.648640][ T1098] netdevsim netdevsim8 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   89.703114][ T1098] netdevsim netdevsim8 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   90.718117][ T1098] bridge_slave_1: left allmulticast mode
[   90.718178][ T1098] bridge_slave_1: left promiscuous mode
[   90.718874][ T1098] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   90.746800][ T1098] bridge_slave_0: left allmulticast mode
[   90.746834][ T1098] bridge_slave_0: left promiscuous mode
[   90.747521][ T1098] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   90.979230][ T1098] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   90.995086][ T1098] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   90.996813][ T1098] bond0 (unregistering): Released all slaves
[   91.148321][ T1098] hsr_slave_0: left promiscuous mode
[   91.155032][ T1098] hsr_slave_1: left promiscuous mode
[   91.156175][ T1098] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   91.156208][ T1098] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   91.178520][ T1098] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   91.178552][ T1098] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   91.206888][ T1098] veth1_macvtap: left promiscuous mode
[   91.206945][ T1098] veth0_macvtap: left promiscuous mode
[   91.207052][ T1098] veth1_vlan: left promiscuous mode
[   91.207135][ T1098] veth0_vlan: left promiscuous mode
[   91.763448][ T1098] team0 (unregistering): Port device team_slave_1 remo=
ved
[   91.783056][ T1098] team0 (unregistering): Port device team_slave_0 remo=
ved
[   91.887617][ T5280] 8021q: adding VLAN 0 to HW filter on device eth1
[   92.266831][ T5280] 8021q: adding VLAN 0 to HW filter on device eth2
[   92.765505][ T5280] 8021q: adding VLAN 0 to HW filter on device eth3
[   93.215118][ T5280] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build2242253634=3D/tmp/go-build -gno-record-gc=
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
HEAD detached at abce1216496
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Dabce12164965bc4439aad38d787d980496e3f106 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260922-204430"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Dabce12164965bc4439aad38d787d980496e3f106 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260922-204430"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dabce12164965bc4439aad38d787d980496e3f106 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260922-204430"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"abce12164965bc4439aad38d787d980496=
e3f106\"
/usr/bin/ld: /tmp/cc8l0oCx.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d4242cb1c54cdf=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D02b37e31e64ea5cb6=
d29
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D107bb4055800=
00

