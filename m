Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FF36F90C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468689; cv=none; b=Zjes3ORdWSsq7l+9UURjBa9acUuy+wY+x8mDpEO0J81OZMwTgMyD8ZULEBa3UHomlz08ZbDRdV/4rhgaS87wPeVSS2RGctwSLLfjlCf4bKySNlXn7iTO017aYiyr91oKh1oWmrZaGuYuzCrySP1LF9WDK/OIhKc3WS9PNf2X3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468689; c=relaxed/simple;
	bh=WwFOrVEAJkodMSm7OvD5Jrb5T3cXnrxHGVAufwjtK2o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ss4BdQ8Qxe2IaRp8TGyA0tnXT94goJlptPMo5T+hQ3Sll3FNi8yhL5oR+QHciN+JyJJMEADtpr3kJTJkDYbdzmNQ7VKZuTO/jNGCxvRXZCNcpAjycSsOJ7ypxDwWl1ly27PUK8rN6pn+GGX2ZRT0hpxNoCP/U1HXyfVsJA4tOnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1c1538784so5087372eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468683; x=1790073483;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwnM7qKCSV+kgbS5FNbbsZAmLUjjoRo3vkTJmWXYitA=;
        b=GEc9O+jhOZH4baVMTdORq5bMXJdWqGE6Xrpa0T6d73LINAGceHF76jjyHx6EMNTELd
         5o6HQ1PrkRPzXC6JdhoLk3+z7c0kbCPBEwUq3g+K9SEwTaStScRQs6gQYpr1gJVf8N3S
         USudET2mzDeW7T7qpPs43qEGvH8TkvPFmxv31/Be/L1wJ6kPjLmXv+WG2KcHP2uqE3pX
         jPayks/2jMTCkG2XiScvYeOnZA7vFt1Hnt4cSpqFKaVQQFIqMeNP+YFtQZSLfpo/5Dqc
         +pGVVGUruDUD0BnBfF1Wu8hR5pVWdPopm7iWiTyinAM6Qlef/TqVMn7gJxI42sgD6waS
         BzFw==
X-Forwarded-Encrypted: i=1; AKwUvByWZKLwq4kVIzwyM2A+AXde+gN9fHlprZTPpH81mPbX+5cUahfZvrCpgk17rRoFBTRPLoePNb0O8vs0+1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kFCW5eiT0PzdgRk0/IAfCAZBi6R4qYjGJWV21RdVtoy4CqqU1v
	t4MX9lMJY1mPdJiD/hScbQiOzGS0j97W3NGFgg/iJwuGKCqi2CM2qhLlg1wn+9o/+obMP0bF/4H
	m5mEHmida4ufZX5ZpCgGqn1X2LK9RGTtlill1U90Z1DHJUGTo84IJQlHU3v8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f00f:b0:6b7:46fa:1693 with SMTP id
 006d021491bc7-6c541b4515bmr4180325eaf.40.1789468683054; Tue, 15 Sep 2026
 03:38:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 03:38:03 -0700
In-Reply-To: <6aa8a1a7.231dd6a4.33cf5b.44f0SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa9200b.a211d2ce.1a5198.02aa.GAE@google.com>
Subject: Re: [syzbot] [batman?] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
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


Warning: Permanently added '10.128.1.177' (ED25519) to the list of known ho=
sts.
2026/09/15 10:36:35 parsed 1 programs
2026/09/15 10:36:35 serving rpc on tcp://36671
[   97.008320][ T5631] cgroup: Unknown subsys name 'net'
[   97.146437][ T5631] cgroup: Unknown subsys name 'cpuset'
[   97.150104][ T5631] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   97.577622][   T10] cfg80211: failed to load regulatory.db
[   98.952704][ T5631] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  102.463188][ T5645] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  102.468100][ T5645] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  102.468498][ T5645] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  102.468788][ T5645] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  102.469155][ T5645] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  104.670974][ T5680] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  104.671498][ T5680] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  104.671624][ T5680] bridge_slave_0: entered allmulticast mode
[  104.676501][ T5680] bridge_slave_0: entered promiscuous mode
[  104.701324][ T5680] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  104.701462][ T5680] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  104.701645][ T5680] bridge_slave_1: entered allmulticast mode
[  104.707565][ T5680] bridge_slave_1: entered promiscuous mode
[  104.755188][ T5680] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  104.758093][ T5680] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  104.801186][ T5680] team0: Port device team_slave_0 added
[  104.808350][ T5680] team0: Port device team_slave_1 added
[  104.836597][ T5680] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  104.836612][ T5680] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  104.836639][ T5680] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  104.838815][ T5680] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  104.838832][ T5680] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  104.838864][ T5680] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  104.961449][ T5680] hsr_slave_0: entered promiscuous mode
[  104.963188][ T5680] hsr_slave_1: entered promiscuous mode
[  105.141888][ T5680] netdevsim netdevsim1 netdevsim0: renamed from eth0
[  105.155219][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  105.156750][ T5680] netdevsim netdevsim1 netdevsim1: renamed from eth1
[  105.161486][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  105.163701][ T5680] netdevsim netdevsim1 netdevsim2: renamed from eth2
[  105.195893][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  105.197198][ T5680] netdevsim netdevsim1 netdevsim3: renamed from eth3
[  105.209126][ T5680] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  105.255166][ T5680] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  105.255262][ T5680] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  105.255686][ T5680] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  105.255772][ T5680] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  105.350068][ T5680] 8021q: adding VLAN 0 to HW filter on device bond0
[  105.378361][   T12] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  105.379845][   T12] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  105.415939][ T5680] 8021q: adding VLAN 0 to HW filter on device team0
[  105.433157][   T80] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  105.433259][   T80] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  105.441920][   T12] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  105.442026][   T12] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  105.562918][ T5680] 8021q: adding VLAN 0 to HW filter on device batadv0
[  105.619871][ T5680] veth0_vlan: entered promiscuous mode
[  105.636147][ T5680] veth1_vlan: entered promiscuous mode
[  105.676296][ T5680] veth0_macvtap: entered promiscuous mode
[  105.681087][ T5680] veth1_macvtap: entered promiscuous mode
[  105.711601][ T5680] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  105.729189][ T5680] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  105.765089][   T42] netdevsim netdevsim1 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  105.770453][   T42] netdevsim netdevsim1 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  105.770501][   T42] netdevsim netdevsim1 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  105.832641][   T80] netdevsim netdevsim1 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  105.974888][   T80] netdevsim netdevsim1 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.097260][   T80] netdevsim netdevsim1 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.189599][   T80] netdevsim netdevsim1 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.656817][   T52] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  106.657692][   T52] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  106.658215][   T52] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  106.659613][   T52] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  106.660392][   T52] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  107.325697][   T80] netdevsim netdevsim1 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  107.446452][   T50] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  107.446481][   T50] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  107.505920][   T50] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  107.505944][   T50] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  108.836631][   T80] bridge_slave_1: left allmulticast mode
[  108.836678][   T80] bridge_slave_1: left promiscuous mode
[  108.838492][   T80] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  108.845622][   T80] bridge_slave_0: left allmulticast mode
[  108.845707][   T80] bridge_slave_0: left promiscuous mode
[  108.846394][   T80] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  109.026958][   T80] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  109.029905][   T80] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  109.031739][   T80] bond0 (unregistering): Released all slaves
[  109.123743][   T80] hsr_slave_0: left promiscuous mode
[  109.124600][   T80] hsr_slave_1: left promiscuous mode
[  109.125726][   T80] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  109.125760][   T80] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  109.126927][   T80] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  109.126946][   T80] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  109.181999][   T80] veth1_macvtap: left promiscuous mode
[  109.188497][   T80] veth0_macvtap: left promiscuous mode
[  109.188647][   T80] veth1_vlan: left promiscuous mode
[  109.189658][   T80] veth0_vlan: left promiscuous mode
[  109.566173][   T80] team0 (unregistering): Port device team_slave_1 remo=
ved
[  109.599106][   T80] team0 (unregistering): Port device team_slave_0 remo=
ved
[  109.788679][ T5279] 8021q: adding VLAN 0 to HW filter on device eth1
[  110.520208][ T5279] 8021q: adding VLAN 0 to HW filter on device eth2
[  111.351931][ T5279] 8021q: adding VLAN 0 to HW filter on device eth3
[  111.769916][ T5279] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build1226858570=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccItziqN.o: in function `Connection::Connect(char const*,=
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
dashboard link: https://syzkaller.appspot.com/bug?extid=3Da079f084653164a65=
2d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D13707df95800=
00

