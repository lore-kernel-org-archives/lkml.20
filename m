Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897793AD539
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617485; cv=none; b=n7sQkvET6M4VA9lPCdSz9zaSnH+wYpITshtyXqipGDOujB+4nT4vwVNpMbZvh2SV36u3i4z2JfJy9BMZnopFLFVbSfqhLb/rgaE8wp1qXv7F8r2mw5Q5ysRsegh48tVlLcgqwzc6W5BFiPCcywYqb/JWhjrD9UuLNbg+0Y8o3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617485; c=relaxed/simple;
	bh=/I60K4itcPdKDeoFYlV0JOOONS5CqWsMQKdGvLmYXfk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BvECH91hpdkAQVRXbQS35qYLcNbIF16YaHDEFJbzW/P6saBB/Qis6ny4YbEDVJFKXgQ7C2UCZzPza1dtXSFlZ1kqyjTGVQ2nLmL2Si2oUuw8ftaaEAcOdonX0pls8XCR4YIWZ5yzUHRpD1x9f/uTwVb6J5Oi6FWIxA17UXvlWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c7f1caa802so401179eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617482; x=1790222282;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3eON63qMvssZ7WPA4vke2VDR1fBCT2cQ8L5ilsw9Mgg=;
        b=Nga9TzHTa3JHhXX3v9ctoiQCyWa4O5QNlxgiDGNB55p/PvLMYK4Pa43ix18lANHdLm
         yZ7w8yQTpAUlTPMNCHdU7XdELFLM2Pjjs6S6X1XA4Qig96Qpc6wR7G1PBn+BTzyXIY9y
         W/m0t8PweUmqhetm+8ERomYQWwUcifVsUeNzHfdKbPW7ZuITi0PNrFOzqZ/qmR1jwVyY
         cPzW4xUM20HAQtibLHMHo+M7AnShxzMaYk5g6Ui7VBkea2pC3AxAzmr3lYzVdZWNMHDm
         sGCt/YtBhcYWiCBf6dHXAL7suuF9Y6Byes57m9seK+VoNJK1Z1VomgTx11Ofjszymufj
         TEQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsNZO/Rye2GVp6Tmrc1N7JayU8c8LkhTuVPUoT+wtP3CpqZZ/PAPKzRO6k23W2UA/eio8A2Yb+I3I7NmE=@vger.kernel.org
X-Gm-Message-State: AFuF++nBMGcvQcdeFh7ob5Oj9gZ8jcko6/xjBUVXMm73zPGb9MT37f2y
	wdw+KDQN91IbkLaZCWguMsXoEngZXtZeU32UE04bKxoc1YoZCRnI7iMV7bAYBfjDgFYXLrTHbIl
	/pu/53tYb9qKsUXTqrXutNqa1Ww5PYHQx2ylUlTOxwAuVBnPDG9CnIdqX/FA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1845:b0:6b7:46fa:169f with SMTP id
 006d021491bc7-6c7d45ecda4mr4636208eaf.52.1789617482044; Wed, 16 Sep 2026
 20:58:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:58:02 -0700
In-Reply-To: <6aab3f26.0d1f51e9.29e58a.f7e3SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab654a.71f81b7d.278072.000f.GAE@google.com>
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


[   97.772398][   T30] cfg80211: failed to load regulatory.db
Warning: Permanently added '10.128.1.171' (ED25519) to the list of known ho=
sts.
2026/09/17 03:56:49 parsed 1 programs
2026/09/17 03:56:49 serving rpc on tcp://36781
[  107.425166][ T5633] cgroup: Unknown subsys name 'net'
[  107.545023][ T5633] cgroup: Unknown subsys name 'cpuset'
[  107.548768][ T5633] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  109.417916][ T5633] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  112.955691][ T5646] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  112.962789][ T5646] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  112.996505][ T5646] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  113.265373][ T5649] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  113.265924][ T5649] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  115.512391][ T5665] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  115.513183][ T5665] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  115.513330][ T5665] bridge_slave_0: entered allmulticast mode
[  115.515484][ T5665] bridge_slave_0: entered promiscuous mode
[  115.529061][ T5665] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  115.529366][ T5665] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  115.549236][ T5665] bridge_slave_1: entered allmulticast mode
[  115.557769][ T5665] bridge_slave_1: entered promiscuous mode
[  115.630326][ T5665] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  115.634285][ T5665] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  115.686289][ T5665] team0: Port device team_slave_0 added
[  115.689012][ T5665] team0: Port device team_slave_1 added
[  115.730273][ T5665] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  115.730299][ T5665] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  115.730326][ T5665] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  115.733142][ T5665] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  115.733159][ T5665] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  115.733183][ T5665] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  115.862291][ T5665] hsr_slave_0: entered promiscuous mode
[  115.863274][ T5665] hsr_slave_1: entered promiscuous mode
[  116.076825][ T5665] netdevsim netdevsim4 netdevsim0: renamed from eth0
[  116.092514][ T5665] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  116.093733][ T5665] netdevsim netdevsim4 netdevsim1: renamed from eth1
[  116.098383][ T5665] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  116.099220][ T5665] netdevsim netdevsim4 netdevsim2: renamed from eth2
[  116.134480][ T5665] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  116.135457][ T5665] netdevsim netdevsim4 netdevsim3: renamed from eth3
[  116.139947][ T5665] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  116.197762][ T5665] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  116.198152][ T5665] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  116.199090][ T5665] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  116.199183][ T5665] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  116.311983][ T5665] 8021q: adding VLAN 0 to HW filter on device bond0
[  116.335679][   T35] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  116.336716][   T35] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  116.366715][ T5665] 8021q: adding VLAN 0 to HW filter on device team0
[  116.383604][ T1025] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  116.383705][ T1025] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  116.407438][   T35] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  116.407552][   T35] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  116.844519][ T5665] 8021q: adding VLAN 0 to HW filter on device batadv0
[  117.096930][ T5665] veth0_vlan: entered promiscuous mode
[  117.113794][ T5665] veth1_vlan: entered promiscuous mode
[  117.156179][ T5665] veth0_macvtap: entered promiscuous mode
[  117.167677][ T5665] veth1_macvtap: entered promiscuous mode
[  117.193491][ T5665] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  117.212241][ T5665] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  117.232386][   T35] netdevsim netdevsim4 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.280820][   T12] netdevsim netdevsim4 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.281325][   T12] netdevsim netdevsim4 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.281370][   T12] netdevsim netdevsim4 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  117.396824][   T35] netdevsim netdevsim4 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  117.447398][   T52] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  117.458211][   T52] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  117.468719][   T52] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  117.472847][   T52] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  117.480842][   T52] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  117.517254][   T35] netdevsim netdevsim4 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  117.859496][ T1025] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  117.859521][ T1025] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  117.918179][  T140] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  117.918204][  T140] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  118.615243][   T35] netdevsim netdevsim4 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  119.627933][   T35] netdevsim netdevsim4 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  120.427475][   T35] bridge_slave_1: left allmulticast mode
[  120.427525][   T35] bridge_slave_1: left promiscuous mode
[  120.429778][   T35] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  120.462567][   T35] bridge_slave_0: left allmulticast mode
[  120.462600][   T35] bridge_slave_0: left promiscuous mode
[  120.462856][   T35] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  120.719836][   T35] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  120.737618][   T35] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  120.752620][   T35] bond0 (unregistering): Released all slaves
[  120.907249][   T35] hsr_slave_0: left promiscuous mode
[  120.914686][   T35] hsr_slave_1: left promiscuous mode
[  120.922848][   T35] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  120.922909][   T35] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  120.940373][   T35] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  120.940400][   T35] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  120.972218][   T35] veth1_macvtap: left promiscuous mode
[  120.972279][   T35] veth0_macvtap: left promiscuous mode
[  120.972394][   T35] veth1_vlan: left promiscuous mode
[  120.972483][   T35] veth0_vlan: left promiscuous mode
[  121.426768][   T35] team0 (unregistering): Port device team_slave_1 remo=
ved
[  121.462985][   T35] team0 (unregistering): Port device team_slave_0 remo=
ved
[  121.649607][ T5279] 8021q: adding VLAN 0 to HW filter on device eth1
[  122.528940][ T5279] 8021q: adding VLAN 0 to HW filter on device eth2
[  123.247846][ T5279] 8021q: adding VLAN 0 to HW filter on device eth3
[  123.683122][ T5279] 8021q: adding VLAN 0 to HW filter on device eth4


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
 -ffile-prefix-map=3D/tmp/go-build175183130=3D/tmp/go-build -gno-record-gcc=
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
/usr/bin/ld: /tmp/cc10CeFE.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5e4e3a0e188a497=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dab6273c58262b9de5=
6d9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1542b9255800=
00

