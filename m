Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4C2F1FDF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709464; cv=none; b=NrA9ckzPVyM7QoNZ7ZpS+dZY8Qf0yO+OyFicwEhXaxwnCLvmy2N1MOlyTdc4DqWLvfgy/Ta/e/WPyemmJTV267SGOZa7F3evpqTxSBbDhg7FletS5Zf+z/yjhgKkoysKhqlk2P0ksJ/mDwK217fRFHB4ERxtPT0WHxjHmVLSoU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709464; c=relaxed/simple;
	bh=AQGbT+57m2bWw3I9uMed8dCXXWwbmrUgORLiPtWUPmA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=U0sC+qQcQJ1LOncbDw8YXUImcWP2PmaEULAkJ9InbBVmpL6QPwpjqIYoPDQHEvVpqIEHnoVXBeoo4NeOaT1o/3V9ik1ZFyp+JaqnBovnsomTs4KzEFo33VDnlKZbiMBKGfvhrJlpMqxQJBe5hUJ5xW34jyoYorqeNSzkD4G2Iog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8051cdb9338so568119a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789709462; x=1790314262;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jx2P8eWubv34fNaz66AydUkXQRNiSOcBAcdJsuByp7o=;
        b=wyBJYj8sWXlNbw0oVZ5cqeo0Bu2lZBFYfY8mJnqnv5C2/mOsdjRMkUWwxjqeOjQSrr
         zfHwZae3KjskLrqmhww5Kjzzg7SoQjyVB8WcSixrxnznOjo94yUKqSqV3nJNK8Gstc9E
         QWZWQWi4OOyInbTbdMBvKuVLkZeZm3vv85iP40UWbtwSC5GlK0c2gAnuER7IzjRddLq8
         gRG0ppXLiLW7AN+ZprkvzKp5On+DhNE1+n2WhxsCQLcgkmVtJLDxpSuWAjhrqduoUub/
         PxIC0Py/fZOCubL6VJZeewjAkhgN16pD5/mqkZuYfS3juvQTnGY3CLcZkBt0I/Dim39M
         GwLw==
X-Forwarded-Encrypted: i=1; AKwUvByD0lqWFIIc/OXdU4fnLbhOudzxc0jiJjLHa/IqncsxV+YLNC6yO3t21n0hcwXkz5EdlgHkbsm9wFtoQZk=@vger.kernel.org
X-Gm-Message-State: AFuF++kF4T9cSH5NkIZHJq4ac2qIF2YZwULXEpUtG1S2pR3ez14QaQ1Q
	bktWQOwnL1v51K4Fgu6proXjWpjGdRlQE5PtkZ9TrQN51vAMx+IkhH/+ZSNb9u//krSSTE/gekZ
	AdMHA5E6eMN1FFEguwuDE/yB4MSU7vL6EjPElb+8cCv7F2eUFnezhB/ijrpE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f02f:b0:6c7:cd95:f109 with SMTP id
 006d021491bc7-6ca9b52b57emr1375904eaf.29.1789709461801; Thu, 17 Sep 2026
 22:31:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:31:01 -0700
In-Reply-To: <20260918051712.24978-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaccc95.b398a7c9.1f86be.002f.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in __dynamic_dev_dbg
From: syzbot <syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
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


Warning: Permanently added '[localhost]:54685' (ED25519) to the list of kno=
wn hosts.
2026/09/18 05:30:02 parsed 1 programs
2026/09/18 05:30:02 serving rpc on tcp://32951
[   47.745155][ T5743] cgroup: Unknown subsys name 'net'
[   47.852384][ T5743] cgroup: Unknown subsys name 'cpuset'
[   47.856459][ T5743] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   48.886846][ T5743] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   51.358683][ T5755] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   51.365586][ T5755] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   51.375529][ T5755] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   51.379024][   T37] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   51.379041][   T37] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   51.518286][  T228] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   51.518311][  T228] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   52.518770][   T66] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   52.526974][   T66] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   52.535189][   T66] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   52.539813][   T66] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   52.540335][   T66] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   52.541643][ T5769] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   52.542691][ T5769] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   52.542775][ T5769] bridge_slave_0: entered allmulticast mode
[   52.545963][ T5769] bridge_slave_0: entered promiscuous mode
[   52.558325][ T5769] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   52.558372][ T5769] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   52.558428][ T5769] bridge_slave_1: entered allmulticast mode
[   52.560598][ T5769] bridge_slave_1: entered promiscuous mode
[   52.584378][ T5769] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   52.611029][ T5769] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   52.648950][ T5769] team0: Port device team_slave_0 added
[   52.660980][ T5769] team0: Port device team_slave_1 added
[   52.719483][ T5769] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   52.719500][ T5769] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   52.719521][ T5769] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   52.737518][ T5769] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   52.737533][ T5769] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   52.737551][ T5769] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   52.909782][ T5809] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   52.910132][ T5809] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   52.936259][ T5769] hsr_slave_0: entered promiscuous mode
[   52.942371][ T5769] hsr_slave_1: entered promiscuous mode
[   53.428872][ T5769] netdevsim netdevsim4 netdevsim0: renamed from eth0
[   53.436610][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   53.437232][ T5769] netdevsim netdevsim4 netdevsim1: renamed from eth1
[   53.441662][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   53.442889][ T5769] netdevsim netdevsim4 netdevsim2: renamed from eth2
[   53.457545][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   53.468017][ T5769] netdevsim netdevsim4 netdevsim3: renamed from eth3
[   53.472353][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   53.554786][ T5769] 8021q: adding VLAN 0 to HW filter on device bond0
[   53.574890][ T5769] 8021q: adding VLAN 0 to HW filter on device team0
[   53.583923][   T37] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   53.584039][   T37] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   53.592421][   T37] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   53.592552][   T37] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   53.917390][ T5769] 8021q: adding VLAN 0 to HW filter on device batadv0
[   54.072213][ T5769] veth0_vlan: entered promiscuous mode
[   54.077626][ T5769] veth1_vlan: entered promiscuous mode
[   54.092533][ T5769] veth0_macvtap: entered promiscuous mode
[   54.094902][ T5769] veth1_macvtap: entered promiscuous mode
[   54.106231][ T5769] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   54.111897][ T5769] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   54.141095][   T12] netdevsim netdevsim4 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   54.141137][   T12] netdevsim netdevsim4 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   54.141165][   T12] netdevsim netdevsim4 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   54.141194][   T12] netdevsim netdevsim4 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   54.184771][   T12] netdevsim netdevsim4 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   54.261521][   T12] netdevsim netdevsim4 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   54.340989][   T12] netdevsim netdevsim4 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   54.428677][   T12] netdevsim netdevsim4 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   55.676684][   T12] bridge_slave_1: left allmulticast mode
[   55.676720][   T12] bridge_slave_1: left promiscuous mode
[   55.679098][   T12] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   55.685646][   T12] bridge_slave_0: left allmulticast mode
[   55.685669][   T12] bridge_slave_0: left promiscuous mode
[   55.685832][   T12] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   55.793840][   T12] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   55.796673][   T12] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   55.798080][   T12] bond0 (unregistering): Released all slaves
[   55.875181][ T5450] 8021q: adding VLAN 0 to HW filter on device eth2
[   55.907074][   T12] hsr_slave_0: left promiscuous mode
[   55.907494][   T12] hsr_slave_1: left promiscuous mode
[   55.907913][   T12] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   55.907928][   T12] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   55.908530][   T12] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   55.908540][   T12] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   55.917255][   T12] veth1_macvtap: left promiscuous mode
[   55.917296][   T12] veth0_macvtap: left promiscuous mode
[   55.917345][   T12] veth1_vlan: left promiscuous mode
[   55.917401][   T12] veth0_vlan: left promiscuous mode
[   56.037674][   T12] team0 (unregistering): Port device team_slave_1 remo=
ved
[   56.054457][   T12] team0 (unregistering): Port device team_slave_0 remo=
ved
[   56.103005][ T5450] 8021q: adding VLAN 0 to HW filter on device eth3
[   56.289426][ T5450] 8021q: adding VLAN 0 to HW filter on device eth4
[   56.450317][ T5450] 8021q: adding VLAN 0 to HW filter on device eth5


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
 -ffile-prefix-map=3D/tmp/go-build3502523694=3D/tmp/go-build -gno-record-gc=
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
HEAD detached at f41e228a2e7
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Df41e228a2e7b883d75a56aa602070c9893ccb54c -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260915-092900"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Df41e228a2e7b883d75a56aa602070c9893ccb54c -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260915-092900"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Df41e228a2e7b883d75a56aa602070c9893ccb54c -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260915-092900"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_386
x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
	-m32 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_386=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"f41e228a2e7b883d75a56aa602070c9893=
ccb54c\"
/usr/bin/ld: /tmp/ccyeqg4J.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         5dd1818b Merge tag 'for-next-keys-v7.3-rc4' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd61c584072d6137
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb70=
8fc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1741b8c95800=
00

