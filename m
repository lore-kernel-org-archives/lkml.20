Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0D286D4D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466706; cv=none; b=ku55UgyqDLAC8nJcezOatzaRtQsE7ycPZhjdbQfqd35NIe+RDkai60KfXhTUEcwi8XsuWdpGbZZFUk6NttP1/iziegzM6BFwrgo6LoYs+5Gf5BKMgiR/+sa8iT9OuAKdBJxl0He8w2MU/MYTP1MD42YwQsIhftX23imo0zyHO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466706; c=relaxed/simple;
	bh=F1uBDC2zP+TMfNTo9zJ5lDTprixca6JNBAvDUFVoeJY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fvKoDJr+gENaQZ2N1+5k0wXBRKZliO8AoMSNlpZ0dC2x+xCdbgQyGcREBIUcLMoCLkUZLHYa/yN7BOMVi5yGt5elSz6T+xkpheEsIWofhiwORv2ia+XrEfQILny34+AYRSCexhlxxzFGFjYd+F4idNQiIWiO6c1fdD2NfUTJ8zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8009280834fso5075464a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466703; x=1790071503;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TDWZiVtv7YyTWGYJEVCzf5IxcBhuXFNL5sYwfB3CfkE=;
        b=KXAg1WJev9Btftdhxpa07jAWwSabdNHB/woaRCUuXQU48wa16zk87yINInGOSqGWYV
         Yv1Yhajb7y7BgwfzLnLprVFd39DSpaQ4GlqLNioJ3NIiyh5jQEKgDn0bjwPlhros+1k2
         kPeBzj9/MfheWbH7dEX4/fIt/lxDAcqJ9yImJ1HSQKd9LjlAen8V09jRLovmGLvf1CIM
         kdZ+IPO4LiGidLsuWCP1GX5DnxYAHU46uXx1bCk/2L1QDT8hYmxpKRgyAFmLP7KnkRdD
         JCkhyh3HYkb3zFwv3U6OQvyMZYOu/OcjR2hrLrBrfR5jHY625p/QDlufsGhOCAABaNuT
         GN1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwg0EBcJsRTRoXNHQYpKrHUmiocY/Ze+UJ1q4/YVG+SLSQkJnsBBED1UKMiLyeEY6poW0ir6wKV5SCdTYU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRIY5nUdKpGGOyuefdi+sDwmefP5v7k3KFuykv6NhkPBfo1hdt
	K6J22TKEU0fBJmrGyChiPVKShDs079HuvCVJiFtcSwoI6+CFTps8iJi3NaAVC0yHzCsFEtep45w
	rQy3AI2oFzZs6R1vIp2Q+uKUIn9M27W6/+PKXhBqVED95f0d2xChmG8QXUtA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:807:b0:6b1:705d:b29e with SMTP id
 006d021491bc7-6c541a43c51mr5954327eaf.26.1789466703469; Tue, 15 Sep 2026
 03:05:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 03:05:03 -0700
In-Reply-To: <6aa8a19d.1a29d466.b1607.109dSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa9184f.4c28b7d0.c1bba.0034.GAE@google.com>
Subject: Re: [syzbot] [kvm?] INFO: task hung in kvm_gmem_release (2)
From: syzbot <syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com>
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


Warning: Permanently added '10.128.1.180' (ED25519) to the list of known ho=
sts.
2026/09/15 10:03:47 parsed 1 programs
2026/09/15 10:03:47 serving rpc on tcp://35899
[   92.298308][   T10] cfg80211: failed to load regulatory.db
[   94.705243][ T5628] cgroup: Unknown subsys name 'net'
[   94.819768][ T5628] cgroup: Unknown subsys name 'cpuset'
[   94.823833][ T5628] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   96.633598][ T5628] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   99.775137][ T5645] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   99.798351][ T5645] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   99.815191][ T5645] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  100.401545][ T1175] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  100.401572][ T1175] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  100.456794][   T50] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  100.456818][   T50] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  101.850164][ T5670] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  101.850560][ T5670] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  102.501627][ T5676] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  102.502376][ T5676] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  102.502493][ T5676] bridge_slave_0: entered allmulticast mode
[  102.504536][ T5676] bridge_slave_0: entered promiscuous mode
[  102.522188][ T5676] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  102.522347][ T5676] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  102.522511][ T5676] bridge_slave_1: entered allmulticast mode
[  102.533089][ T5676] bridge_slave_1: entered promiscuous mode
[  102.590213][ T5676] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  102.592992][ T5676] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  102.632923][ T5676] team0: Port device team_slave_0 added
[  102.636138][ T5676] team0: Port device team_slave_1 added
[  102.669819][ T5676] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  102.669834][ T5676] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  102.669858][ T5676] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  102.672214][ T5676] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  102.672229][ T5676] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  102.672260][ T5676] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  102.791250][ T5676] hsr_slave_0: entered promiscuous mode
[  102.792721][ T5676] hsr_slave_1: entered promiscuous mode
[  102.977390][ T5676] netdevsim netdevsim6 netdevsim0: renamed from eth0
[  102.984696][ T5676] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  102.996682][ T5676] netdevsim netdevsim6 netdevsim1: renamed from eth1
[  103.011000][ T5676] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  103.012159][ T5676] netdevsim netdevsim6 netdevsim2: renamed from eth2
[  103.032735][ T5676] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  103.033682][ T5676] netdevsim netdevsim6 netdevsim3: renamed from eth3
[  103.051624][ T5676] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  103.089001][ T5676] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  103.089112][ T5676] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  103.089670][ T5676] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  103.089758][ T5676] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  103.183781][ T5676] 8021q: adding VLAN 0 to HW filter on device bond0
[  103.206356][ T1175] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  103.208344][ T1175] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  103.236601][ T5676] 8021q: adding VLAN 0 to HW filter on device team0
[  103.245025][ T1037] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  103.245127][ T1037] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  103.275267][ T1175] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  103.276466][ T1175] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  103.682714][ T5676] 8021q: adding VLAN 0 to HW filter on device batadv0
[  103.944689][ T5676] veth0_vlan: entered promiscuous mode
[  103.963472][ T5676] veth1_vlan: entered promiscuous mode
[  104.009708][ T5676] veth0_macvtap: entered promiscuous mode
[  104.016196][ T5676] veth1_macvtap: entered promiscuous mode
[  104.051538][ T5676] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  104.073599][ T5676] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  104.163515][ T1175] netdevsim netdevsim6 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  104.163925][ T1175] netdevsim netdevsim6 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  104.163961][ T1175] netdevsim netdevsim6 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  104.164004][ T1175] netdevsim netdevsim6 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  104.338037][   T13] netdevsim netdevsim6 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  104.481043][   T13] netdevsim netdevsim6 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  104.541977][   T13] netdevsim netdevsim6 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  104.620294][   T13] netdevsim netdevsim6 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  105.627300][   T52] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  105.627982][   T52] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  105.628534][   T52] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  105.629728][   T52] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  105.630376][   T52] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  105.917265][   T13] bridge_slave_1: left allmulticast mode
[  105.917315][   T13] bridge_slave_1: left promiscuous mode
[  105.918225][   T13] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  105.951678][   T13] bridge_slave_0: left allmulticast mode
[  105.951709][   T13] bridge_slave_0: left promiscuous mode
[  105.953700][   T13] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  106.194217][   T13] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  106.218127][   T13] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  106.219936][   T13] bond0 (unregistering): Released all slaves
[  106.358701][   T13] hsr_slave_0: left promiscuous mode
[  106.359698][   T13] hsr_slave_1: left promiscuous mode
[  106.361694][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  106.361805][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  106.364165][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  106.364186][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  106.428453][   T13] veth1_macvtap: left promiscuous mode
[  106.428514][   T13] veth0_macvtap: left promiscuous mode
[  106.428623][   T13] veth1_vlan: left promiscuous mode
[  106.428718][   T13] veth0_vlan: left promiscuous mode
[  106.729824][   T13] team0 (unregistering): Port device team_slave_1 remo=
ved
[  106.749999][   T13] team0 (unregistering): Port device team_slave_0 remo=
ved
[  106.863908][ T5281] 8021q: adding VLAN 0 to HW filter on device eth1
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  107.874113][ T5281] 8021q: adding VLAN 0 to HW filter on device eth2
[  108.744031][ T5281] 8021q: adding VLAN 0 to HW filter on device eth3
[  109.188685][ T5281] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build40483423=3D/tmp/go-build -gno-record-gcc-=
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
/usr/bin/ld: /tmp/cc3yk8t3.o: in function `Connection::Connect(char const*,=
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
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5e4e3a0e188a497=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dab6273c58262b9de5=
6d9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D155f21155800=
00

