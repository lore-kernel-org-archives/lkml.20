Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186DB382299
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272665; cv=none; b=CLJe6H/PXLi61tS+PdhW7h9JHYwVftBPRgXY7Bc0bt+gAMDqhYQzCTP9NHnRet+Yq9QNUgiN7XjJaQ/hvKrHQwDdDprdZ1zc+R3bhEHptjqas7DSQirjwr1V4n9a3h/lKTdcED0CRSNyucMUcdOdg+vdbnIeOpbyIveQRVE2l34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272665; c=relaxed/simple;
	bh=/QXEirN8X8y1VYcMvgkn21Q/DqSnpnnuwjtyIDmzKwc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E06ZgYHl2ULMFVNhZzhoabslN7d896US8ahjUyE7CqvsjSPuo9UvdPJ/MUaoQHTBZ/iDE5C2fdo1z3gkwv0d9EWA92rWwW02gApU1YdlwmxEMu8hcPSS4/mbVctGBkSROEu3ECDYNEQSB8JeK0besjd7VKTeUntirLhU/3JIVRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c324a0c0faso532964eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272662; x=1789877462;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IRtFngqzLaGfyooFNTH7M67EhtEHMUE2IHqjO4GeXI=;
        b=jCoI7WJljQpTo9kmav2bkx5/IbNbd8tOyLFvYXWuQpXgjHE4JL/ujeDGok1CeqIs74
         P/XqRDYI7J25o178ICMZBVzEXTjS+OZQi6xCqxcr57xVapiVn3y3qnItFjLU9pYycsRU
         Uw0tWgUm55jD8jC030sN597W00KJ0FwX+wxzyhXMYJcgTohyM5VV9EHz08weIaMjJP+0
         KUCeqvb0dGgvbjccN+sd4FBV7CoT2u4K50Y8E4yXwfo4WFdPhj8DJvE/RTY3EBRctJsT
         PdqqXGnc7a8aLjhVkH53/xdCbYLKWAsl5U6Chg4NCtM8NyHo9MsE06MtLKdgzXT9NqZF
         ny5g==
X-Forwarded-Encrypted: i=1; AKwUvBzvtCDiROOZw1ZSMNV98VR4Q1wPAQlGZoEgr5hdjBnhKyVSiRMcrfhu/snA+nVhrqSvdO4N2BgV0x3WY2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n1P0V/x5UwK1PMesOkTGkO2elmSCfZLqOOvDH5iZ+vUq0gUbcq
	R10d39jB5SOlI8ZclXYzjqy87shwI5LxX3eEfSToeM9eo49x6J8ZYXeUPi0J9tHrYd+jPhL6MV4
	ITNIzvjaJCI1h/x0E9/Ju37lP1DgqoPyvvIRVdT2QQZ8MEzkQ/PDENG2paqw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c3c3:20b0:6b0:4fbc:aecf with SMTP id
 006d021491bc7-6c0ba920feamr5160275eaf.24.1789272661994; Sat, 12 Sep 2026
 21:11:01 -0700 (PDT)
Date: Sat, 12 Sep 2026 21:11:01 -0700
In-Reply-To: <20260913032055.14922-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa62255.f670cee1.72fc4.000d.GAE@google.com>
Subject: Re: [syzbot] [batman?] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
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


Warning: Permanently added '10.128.0.185' (ED25519) to the list of known ho=
sts.
2026/09/13 04:09:14 parsed 1 programs
2026/09/13 04:09:14 serving rpc on tcp://42357
[   91.749254][ T5628] cgroup: Unknown subsys name 'net'
[   91.869767][ T5628] cgroup: Unknown subsys name 'cpuset'
[   91.873399][ T5628] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   92.178249][  T191] cfg80211: failed to load regulatory.db
[   93.607422][ T5628] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   96.947156][ T5645] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   96.948216][ T5645] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   96.948595][ T5645] bridge_slave_0: entered allmulticast mode
[   96.950185][ T5645] bridge_slave_0: entered promiscuous mode
[   96.968422][ T5645] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   96.968718][ T5645] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   96.969269][ T5645] bridge_slave_1: entered allmulticast mode
[   96.975443][ T5645] bridge_slave_1: entered promiscuous mode
[   97.026823][ T5645] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   97.029726][ T5645] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   97.067622][ T5645] team0: Port device team_slave_0 added
[   97.069828][ T5645] team0: Port device team_slave_1 added
[   97.102251][ T5645] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   97.102266][ T5645] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   97.102285][ T5645] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   97.104507][ T5645] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   97.104523][ T5645] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   97.104555][ T5645] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   97.215470][ T5645] hsr_slave_0: entered promiscuous mode
[   97.216673][ T5645] hsr_slave_1: entered promiscuous mode
[   97.398344][ T5645] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   97.412041][ T5645] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   97.414367][ T5645] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   97.432631][ T5645] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   97.433618][ T5645] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   97.450817][ T5645] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   97.451832][ T5645] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   97.463020][ T5645] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   97.509246][ T5645] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   97.509351][ T5645] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   97.510344][ T5645] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   97.510441][ T5645] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   97.601541][ T5645] 8021q: adding VLAN 0 to HW filter on device bond0
[   97.622801][   T13] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   97.624447][   T13] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   97.650519][ T5645] 8021q: adding VLAN 0 to HW filter on device team0
[   97.665658][  T178] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   97.666209][  T178] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   97.672175][   T13] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   97.672269][   T13] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   97.779043][ T5645] 8021q: adding VLAN 0 to HW filter on device batadv0
[   97.837288][ T5645] veth0_vlan: entered promiscuous mode
[   97.852320][ T5645] veth1_vlan: entered promiscuous mode
[   97.887743][ T5645] veth0_macvtap: entered promiscuous mode
[   97.892494][ T5645] veth1_macvtap: entered promiscuous mode
[   97.924641][ T5645] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   97.947413][ T5645] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   97.966227][  T178] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   97.966277][  T178] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   97.966313][  T178] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   97.966349][  T178] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   98.071576][ T5645] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[   98.090891][ T5645] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[   98.092461][ T5645] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   98.093655][ T5645] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[   98.100047][ T5645] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[   98.289039][   T13] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   98.359069][   T13] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   98.438317][   T13] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   98.520399][   T13] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  100.678728][   T13] bridge_slave_1: left allmulticast mode
[  100.678774][   T13] bridge_slave_1: left promiscuous mode
[  100.679609][   T13] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  100.709850][   T13] bridge_slave_0: left allmulticast mode
[  100.709884][   T13] bridge_slave_0: left promiscuous mode
[  100.711333][   T13] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  100.933400][   T13] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  100.945521][   T13] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  100.947693][   T13] bond0 (unregistering): Released all slaves
[  101.087990][   T13] hsr_slave_0: left promiscuous mode
[  101.088880][   T13] hsr_slave_1: left promiscuous mode
[  101.089964][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  101.089999][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  101.092194][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  101.092217][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  101.144588][   T13] veth1_macvtap: left promiscuous mode
[  101.144658][   T13] veth0_macvtap: left promiscuous mode
[  101.157659][   T13] veth1_vlan: left promiscuous mode
[  101.157855][   T13] veth0_vlan: left promiscuous mode
[  101.519019][   T13] team0 (unregistering): Port device team_slave_1 remo=
ved
[  101.543965][   T13] team0 (unregistering): Port device team_slave_0 remo=
ved
[  101.732210][ T5281] 8021q: adding VLAN 0 to HW filter on device eth1
[  101.927935][ T5733] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  101.929869][ T5733] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  101.930662][ T5733] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  101.933694][ T5733] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  101.938741][ T5733] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[  103.054501][ T5281] 8021q: adding VLAN 0 to HW filter on device eth2
[  103.182145][   T50] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  103.182168][   T50] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  103.334883][   T50] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  103.334908][   T50] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  104.157903][ T5281] 8021q: adding VLAN 0 to HW filter on device eth3
[  104.824327][ T5281] 8021q: adding VLAN 0 to HW filter on device eth4
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).


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
 -ffile-prefix-map=3D/tmp/go-build3774646112=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccFcuwRo.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         2f0c1cf7 Merge tag 's390-7.3-3' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5e4e3a0e188a497=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Da079f084653164a65=
2d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D175d55f95800=
00

