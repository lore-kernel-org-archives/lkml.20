Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54684E73AE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609526; cv=none; b=N5jfeUdi1ayTgFaWW9kaaHtwtkgIfrZxsLCtd8eR/AKBRCvsRfqrPietUjwilemVvLO/hIa0zXkRAwfodV02ZGAEDaY4uDMU+Q8HNxS3LVMY4YCYBxmcShRD5t7KBsxtMHzfqRVRAIV3KclJ/5fQAEQVXUvbb5/unl8Z3scAOr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609526; c=relaxed/simple;
	bh=doEOg+US8J6B7U7K+soEsoXv74XX5RldXABoz5a9ZWI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GIcbbRskT6WpMb/AQe+wQStCkiWheNgVC/hVAmFCYn6GUXQ7jPWydeB5orjj5UyH5qcWhYfSe1e9C7xQ7jPF77Yud04QpuNuoQM9TQIdRuuTA9DKkgbo5RBFb23Hxw0K7EyNm3DNjjVitIDPIekpuLq5mGS7Q6/DYMtvGJ1FQZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so5446122b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609522; x=1791214322;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FHe/DKMDMNOxBT/djogDfbAwZkWmE/D6pcai+qSiHv8=;
        b=rP9Rzk2TyTTaO7BYPi5BTdUj7POHietMZy3zqoMU4SbUR8Few8U2zI9rhGR+ibLDuC
         B0eOGy2lQrdcpAvy9FiRhaF/l7fOsz4bb2rSqLk+OiBspj1BiZPlx0FaqvmCUVTGtMH8
         7ZQvE6vi0h5/9VdEi2Pnx6D/Xqv/xHtVF/ml1WSuyquY7PhdWtGrGQm1IY0cQdnMrFwO
         fDmGHK0zeuKIW93dU02/fc1PHQXmI/v74UhOqOzJXutji4B+m6h4IBcFMhLoSwYSSj5d
         gLsUpjhoDORhtaRdepXUbcvuLF77uoce2uGVR327K2dSaBlWH80Q64LA2kVS3QrqOx9B
         PHBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPiT5TtWeDg/UrlThpLVhNnIUgUvigUDO4ordZFfxe38MeSyrqVfCvEh4qMGgu4w3hqBlw4f/PlbmdGq8=@vger.kernel.org
X-Gm-Message-State: AFuF++niKkDA1Va6g1ZHS3xp0qCHPnJmRZPPt+Cux4qdA5RjeJmaKtoa
	kCkK2yucWweipGRqOfkEAlihe1azcin5N/tpmwceS/TlBvebSE7ptImyXUzW0mSdpbD7nZXUdOz
	e8xKdb4D+MWcWcmV7SW13JJSquAA3wDXwa8TB1c3QWOQIEpF3Sp1EVON2DFM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1929:b0:4e8:a7db:ce65 with SMTP id
 5614622812f47-4e8a7dbe054mr5703626b6e.53.1790609522318; Mon, 28 Sep 2026
 08:32:02 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:32:02 -0700
In-Reply-To: <20260928151833.GB536483@shredder>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba8872.c6a7fab7.e5ea7.0457.GAE@google.com>
Subject: Re: [syzbot] BUG: Address NUM::fb on device lo is missing its host route.
From: syzbot <syzbot+57f410c9a4f8d7a441d6@syzkaller.appspotmail.com>
To: idosch@nvidia.com, linux-kernel@vger.kernel.org, 
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


Warning: Permanently added '[localhost]:25612' (ED25519) to the list of kno=
wn hosts.
2026/09/28 15:31:20 parsed 1 programs
2026/09/28 15:31:20 serving rpc on tcp://36177
[   47.553227][ T5746] cgroup: Unknown subsys name 'net'
[   47.698693][ T5746] cgroup: Unknown subsys name 'cpuset'
[   47.702860][ T5746] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   48.856439][ T5746] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   51.171997][ T5752] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   51.176597][ T5752] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   51.187163][ T5752] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   51.584025][   T46] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   51.584041][   T46] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   51.638990][   T38] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   51.639014][   T38] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   52.584253][ T5769] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   52.584749][ T5769] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   52.584809][ T5769] bridge_slave_0: entered allmulticast mode
[   52.586142][ T5769] bridge_slave_0: entered promiscuous mode
[   52.588800][ T5769] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   52.588842][ T5769] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   52.588899][ T5769] bridge_slave_1: entered allmulticast mode
[   52.589826][ T5769] bridge_slave_1: entered promiscuous mode
[   52.609061][ T5769] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   52.612156][ T5769] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   52.634772][ T5769] team0: Port device team_slave_0 added
[   52.637853][ T5769] team0: Port device team_slave_1 added
[   52.659595][ T5769] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   52.659612][ T5769] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   52.659634][ T5769] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   52.661967][ T5769] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   52.661981][ T5769] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   52.662001][ T5769] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   52.698031][ T5769] hsr_slave_0: entered promiscuous mode
[   52.698964][ T5769] hsr_slave_1: entered promiscuous mode
[   52.831553][ T5769] netdevsim netdevsim5 netdevsim0: renamed from eth0
[   52.838068][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   52.839020][ T5769] netdevsim netdevsim5 netdevsim1: renamed from eth1
[   52.847513][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   52.848454][ T5769] netdevsim netdevsim5 netdevsim2: renamed from eth2
[   52.853584][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   52.854492][ T5769] netdevsim netdevsim5 netdevsim3: renamed from eth3
[   52.860087][ T5769] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   52.924459][ T5769] 8021q: adding VLAN 0 to HW filter on device bond0
[   52.939304][ T5769] 8021q: adding VLAN 0 to HW filter on device team0
[   52.944711][   T74] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   52.945117][   T74] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   52.953389][   T74] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   52.953436][   T74] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   53.267244][ T5769] 8021q: adding VLAN 0 to HW filter on device batadv0
[   53.432851][ T5769] veth0_vlan: entered promiscuous mode
[   53.438431][ T5769] veth1_vlan: entered promiscuous mode
[   53.457016][ T5769] veth0_macvtap: entered promiscuous mode
[   53.460801][ T5769] veth1_macvtap: entered promiscuous mode
[   53.473078][ T5769] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   53.480407][ T5769] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   53.509123][   T12] netdevsim netdevsim5 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   53.566894][   T12] netdevsim netdevsim5 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   53.575956][ T5761] netdevsim netdevsim5 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   53.655132][ T5761] netdevsim netdevsim5 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   53.674478][   T12] netdevsim netdevsim5 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   53.689000][ T5818] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   53.689955][ T5818] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   53.690417][ T5818] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   53.691659][ T5818] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   53.692196][ T5818] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   53.737071][   T12] netdevsim netdevsim5 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   54.878528][ T5840] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   54.878912][ T5840] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   55.016366][   T12] bridge_slave_1: left allmulticast mode
[   55.016404][   T12] bridge_slave_1: left promiscuous mode
[   55.017015][   T12] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   55.021736][   T12] bridge_slave_0: left allmulticast mode
[   55.021756][   T12] bridge_slave_0: left promiscuous mode
[   55.021918][   T12] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   55.161216][   T12] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   55.163318][   T12] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   55.164136][   T12] bond0 (unregistering): Released all slaves
[   55.256269][   T12] hsr_slave_0: left promiscuous mode
[   55.258264][   T12] hsr_slave_1: left promiscuous mode
[   55.258734][   T12] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   55.258752][   T12] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   55.260433][   T12] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   55.260445][   T12] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   55.277158][   T12] veth1_macvtap: left promiscuous mode
[   55.277216][   T12] veth0_macvtap: left promiscuous mode
[   55.277298][   T12] veth1_vlan: left promiscuous mode
[   55.277352][   T12] veth0_vlan: left promiscuous mode
[   55.467919][   T12] team0 (unregistering): Port device team_slave_1 remo=
ved
[   55.483319][   T12] team0 (unregistering): Port device team_slave_0 remo=
ved
[   55.574371][ T5449] 8021q: adding VLAN 0 to HW filter on device eth2
[   55.834084][ T5449] 8021q: adding VLAN 0 to HW filter on device eth3
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[   56.022767][ T5449] 8021q: adding VLAN 0 to HW filter on device eth4
[   56.418782][ T5449] 8021q: adding VLAN 0 to HW filter on device eth5


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
 -ffile-prefix-map=3D/tmp/go-build4086096228=3D/tmp/go-build -gno-record-gc=
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
HEAD detached at 1e72964b011
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
/usr/bin/ld: /tmp/ccPHEVZY.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         72d3fcf8 Linux 7.3-rc5
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da2a10c7c0ac9ebc=
2
dashboard link: https://syzkaller.appspot.com/bug?extid=3D57f410c9a4f8d7a44=
1d6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D17c0f6055800=
00

