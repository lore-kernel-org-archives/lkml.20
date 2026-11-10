Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337624;
	b=ZMBRBBpNOaJWN9t1nFZ5jmKuWlBjwdnjVm/YGl5bmpk5aj9ZF7wagbjtoeYlKiP4E2bg
	 JU5TQElAx3BphmCIjreBHS9GUkQ8fFdsmLTq1KFU6kcVku7Vd0/HVUHD3P6n6Prwmq7Iq
	 +geKKHokE/Xad7yuFM0+R62RLLPqwHtMbeMGQuoESFnv4H8qJ8Kz+UGUQm6GULJHpVd7c
	 +y1hjjY//CmtnUR3pVUb6rOeL3xOMFb3anUl7o0Fd8q8+AykgNYidVrV1l8za1L/+vxQP
	 acljgEXlFq4CcWl/gsR0GlAh9qL0m0EP3E1gbX05rUrubNEES1J83jo6Hk3Av+Uwjww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vlby6041ECtgOwb7v+uxt/j1gpy27aER6pnxN/tGMZY=;
	b=buhvE2pcoRYWAQxxEdasejNwVGDfF+vwdchqMFBdMIiwiB9z40V8eI0LgdnGqNIhj32H
	 EWAbRvHSkUUi4t5HnokfmoYeCperKbQM0fQRSQd+4MEbkUzwaMvgPsjeI6vL160zvvXBa
	 Xeo7HcPym436jvuOMDGxgdQdex/POIzPO43JoIas3gkN7dRZI/vLE1rbIrVx4kyc5gv9U
	 MgnF0QHOJPBHACDaA/AuWJ/fxoSqDy7dpqALUu9zd2nJaXrjfspIp46K27SJc3lpsktO2
	 raqGMvnbAQo6wdfudmD+rXJTt+KBQa1Fw7kGG4UMiz7BdUxktnA3rXQDoUC77LOXBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF59606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83edc5c5ae9so1411595a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337623; x=1794942423;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vlby6041ECtgOwb7v+uxt/j1gpy27aER6pnxN/tGMZY=;
        b=02CcMDphAoUwx2sbPipZUV+o7pOlDngqw9rpzLAP3Nee1FRL/DpzvHkYhHG1biGjlg
         UQ1bVW8sMff9mdehprRpAG6LcPmrCmN/kuTngqWPS4eXP2AB+Kc4YrxLRjBaT4ZzzlFB
         YkI+JXUf+mYRvBS3cZbMA+KCrcwPxhm0+kLvQ4be61+zEwzzH+gIaJ9fRM3oglLyEjUM
         pvy6I3Viwrq1eh6DbJEH+IBSvM/ptWuHf/MhnUbxRqeEufRZjMCXp7j2PnlqaqSdaVTp
         snEEE17ssf7NnTHB74V+jUGFf4HC7nLkLO9qYTvWY+0g7lPUB8+4XGySYj79dDogZFyC
         qjnA==
X-Gm-Message-State: APuU4Z86h10157WrtnIZXhLJqdPxVGOv4Wm3GMmfmuWbP1g/w1MmoSsh
	7o1qFuhazfX3FjMulMKb8FHMPj+lEOQw8YHJVRNYQYZYi+vq5uqxJRX0AXLbSk3lpRq2KIqtF27
	zh83/g54UeWfNvMqGJ+5n3TorH1Mm5P3R/2tHzbXyii0LVMPO9rBvLxkwf4c=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f1f:b0:55c:8a7:7eb4 with SMTP id
 5614622812f47-5683c7b63b8mr2692988b6e.2.1794337623067; Tue, 10 Nov 2026
 11:07:03 -0800 (PST)
Date: Tue, 10 Nov 2026 11:07:03 -0800
In-Reply-To: <CAO7_G+zpXKbKY8ggsBsprzCw9M7NSvCyQ-f4KQSM8Etx6GEqKA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af36b57.17ff5aea.1b027f.019b.GAE@google.com>
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
From: syzbot <syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
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


Warning: Permanently added '[localhost]:6819' (ED25519) to the list of know=
n hosts.
2026/11/10 19:04:41 parsed 1 programs
2026/11/10 19:04:41 serving rpc on tcp://42245
[   55.963375][ T5742] cgroup: Unknown subsys name 'net'
[   56.074706][ T5742] cgroup: Unknown subsys name 'cpuset'
[   56.080672][ T5742] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   57.409559][ T5742] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   59.695528][ T5753] br_netfilter no longer supported in user namespaces
[   59.875947][ T5753] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   59.936142][ T5753] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   59.936380][ T5753] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   59.936642][ T5753] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   59.936863][ T5753] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   60.511799][ T5755] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   60.512258][ T5755] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   60.512367][ T5755] bridge_slave_0: entered allmulticast mode
[   60.513749][ T5755] bridge_slave_0: entered promiscuous mode
[   60.517106][ T5755] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   60.517184][ T5755] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   60.517279][ T5755] bridge_slave_1: entered allmulticast mode
[   60.518687][ T5755] bridge_slave_1: entered promiscuous mode
[   60.627709][ T5755] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   60.634100][ T5755] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   60.653715][ T5755] team0: Port device team_slave_0 added
[   60.655721][ T5755] team0: Port device team_slave_1 added
[   60.667483][ T5755] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   60.667493][ T5755] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   60.667507][ T5755] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   60.669146][ T5755] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   60.669154][ T5755] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   60.669168][ T5755] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   60.705286][ T5755] hsr_slave_0: entered promiscuous mode
[   60.706202][ T5755] hsr_slave_1: entered promiscuous mode
[   60.942218][   T38] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   60.942232][   T38] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   61.091172][   T57] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   61.091187][   T57] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   61.183299][ T5755] netdevsim netdevsim3 netdevsim0: renamed from eth0
[   61.188345][ T5755] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   61.189037][ T5755] netdevsim netdevsim3 netdevsim1: renamed from eth1
[   61.195751][ T5755] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   61.213344][ T5755] netdevsim netdevsim3 netdevsim2: renamed from eth2
[   61.219620][ T5755] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   61.221457][ T5755] netdevsim netdevsim3 netdevsim3: renamed from eth3
[   61.227586][ T5755] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   61.301564][   T65] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   61.303404][   T65] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   61.304783][   T65] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   61.309632][   T65] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   61.316544][   T65] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   61.412526][ T5755] 8021q: adding VLAN 0 to HW filter on device bond0
[   61.422578][ T5755] 8021q: adding VLAN 0 to HW filter on device team0
[   61.430476][   T57] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   61.430588][   T57] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   61.437671][   T57] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   61.437766][   T57] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   62.030796][ T5755] 8021q: adding VLAN 0 to HW filter on device batadv0
[   62.065809][ T5755] veth0_vlan: entered promiscuous mode
[   62.104328][ T5755] veth1_vlan: entered promiscuous mode
[   62.119783][ T5755] veth0_macvtap: entered promiscuous mode
[   62.123188][ T5755] veth1_macvtap: entered promiscuous mode
[   62.131833][ T5755] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   62.135888][ T5755] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   62.164634][ T5771] netdevsim netdevsim3 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   62.164916][ T5771] netdevsim netdevsim3 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   62.164938][ T5771] netdevsim netdevsim3 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   62.164958][ T5771] netdevsim netdevsim3 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   62.261207][   T14] netdevsim netdevsim3 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   63.811497][   T14] netdevsim netdevsim3 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   65.287829][   T14] netdevsim netdevsim3 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   65.371984][   T14] netdevsim netdevsim3 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   65.503178][   T14] bridge_slave_1: left allmulticast mode
[   65.503231][   T14] bridge_slave_1: left promiscuous mode
[   65.503831][   T14] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   65.507795][   T14] bridge_slave_0: left allmulticast mode
[   65.507817][   T14] bridge_slave_0: left promiscuous mode
[   65.507980][   T14] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   65.634809][   T14] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   65.637628][   T14] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   65.639515][   T14] bond0 (unregistering): Released all slaves
[   65.727181][   T14] hsr_slave_0: left promiscuous mode
[   65.728327][   T14] hsr_slave_1: left promiscuous mode
[   65.729104][   T14] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   65.729125][   T14] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   65.730246][   T14] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   65.730262][   T14] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   65.741743][   T14] veth1_macvtap: left promiscuous mode
[   65.741806][   T14] veth0_macvtap: left promiscuous mode
[   65.741943][   T14] veth1_vlan: left promiscuous mode
[   65.742076][   T14] veth0_vlan: left promiscuous mode
[   65.935455][   T14] team0 (unregistering): Port device team_slave_1 remo=
ved
[   65.945027][   T14] team0 (unregistering): Port device team_slave_0 remo=
ved
[   66.043375][ T5444] 8021q: adding VLAN 0 to HW filter on device eth2
[   66.242059][ T5444] 8021q: adding VLAN 0 to HW filter on device eth3
[   66.430099][ T5444] 8021q: adding VLAN 0 to HW filter on device eth4
[   66.642015][ T5444] 8021q: adding VLAN 0 to HW filter on device eth5
[   71.222149][ T1439] ieee802154 phy0 wpan0: encryption failed: -22
[   71.222242][ T1439] ieee802154 phy1 wpan1: encryption failed: -22


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
 -ffile-prefix-map=3D/tmp/go-build845281019=3D/tmp/go-build -gno-record-gcc=
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
HEAD detached at d2e5fb956a
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Dd2e5fb956ad222b37a913979e04dc012f4868836 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260903-102143"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Dd2e5fb956ad222b37a913979e04dc012f4868836 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260903-102143"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dd2e5fb956ad222b37a913979e04dc012f4868836 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260903-102143"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"d2e5fb956ad222b37a913979e04dc012f4=
868836\"
/usr/bin/ld: /tmp/cc4F8CFT.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         067c5c24 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc40cb9cd7a4b919=
a
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dfefa0af09f7891b18=
00e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1777944d5800=
00

