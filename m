Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52188369D7C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371546; cv=none; b=cDNNDtPgipW1QEkX9M1X015OvxHrhVzZwpMIosUmmoHUWoNBJste/e8pINJUSiK66xZklbq5ezQ1EtvZXnm2kPgw/MgFr6xb/5U9cWoab4O8tQkfaQWE20UfYgEcODnoURj4ASnresDM3WCz0pu7ZKvTrIfmuwHcz83a7Wnx3vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371546; c=relaxed/simple;
	bh=KR0/tcWoL/mZd12+SDEqDTB2tE8iLq+uKarTKSOpO58=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FjaCp69AK4aFLb7BxDojxHrM+Tgw5Dqp74cCxjK4jrwfJoiSaiBFydPxcPanrU9cCYCTfjRz7ztVsh6OlIpWcKnJKuwnSTO44go++vgGAKv65zd/qNiFi/Flmm7QbKb1QRsut4L11Z+ZYQ8qI6as5Wwi3lzSoFDHT1NZcmFUUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c1538bc4c0so1344958eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371543; x=1789976343;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vv2lvyyvEterozcPCc7dGxfOavpQPip/6EJz2S9gJRM=;
        b=WhCIqIfdJp0BnsdjKDs3VTlfBIS7k8ofTOMxQvXizJ9xxtg7sPA+YJlgj0YrN0LUdj
         Dv+aQlmdVjr+OTrUG953xYflIxbAbhE0OM4NbmxC27Ci2xPq6Ggq170vejh+eaTD/e/X
         SncBaX5f+le8tqi07LAqYf+QxKqalxvxq8B5KBf3/r3rfYq+tlSHSQBVP09thwNxoyNK
         yN81p2Nut5WARF8PJg1kbI9Rpyf9GOPZH1JYs1PADw9RaF5EBPfgbOo10XMZ1xj/AFyX
         e12NM3sXwLgp6HP+qXnpV/WwzqsXEDf4Rn9wPl9L+RmovkXG1rs0nfR6RuZvTC7tCEmw
         6GVg==
X-Forwarded-Encrypted: i=1; AKwUvBy9JMEJuC+38wu1UbuvEtootw/Vn9I7dRwh5u+GKuyyRjZ6In7x3U4q3Wv6aGwQ9sZoYX8GxAFKfTXbPEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nGFN+R2cPGlLCTGvoQIEYrvx4tMMnvnrEJ0XmeulSkhADo6bcq
	Y4x8/LFKlTNDFdYYBhqBnkXimWONE9aH0n7YFWElhV8WBvUyYVpMSFI4+k63sf9qRA85vRbd1a3
	AS08plkRj6N8/TEfWtkmUD7p9xlTE1gRtwR+2wJpc7+QLq+8o4Gjpka/GQxg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f022:b0:6ae:a950:9faa with SMTP id
 006d021491bc7-6c53ea5bfd8mr552924eaf.10.1789371542938; Mon, 14 Sep 2026
 00:39:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:39:02 -0700
In-Reply-To: <6aa79dcd.717c4d5f.2255e.48efSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7a496.4c28b7d0.c1bba.0015.GAE@google.com>
Subject: Re: [syzbot] [batman?] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lost connection to test machine



[  104.852219][ T1219] cfg80211: failed to load regulatory.db
Warning: Permanently added '10.128.0.93' (ED25519) to the list of known hos=
ts.
2026/09/14 07:37:15 parsed 1 programs
2026/09/14 07:37:15 serving rpc on tcp://34817
[  113.874515][ T5628] cgroup: Unknown subsys name 'net'
[  113.950099][ T5628] cgroup: Unknown subsys name 'cpuset'
[  113.953008][ T5628] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[  115.529192][ T5628] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  119.248082][ T5641] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
[  119.264382][ T5641] ebtables: xtables 32bit compat interface no longer s=
upported in namespaces and will be removed soon.
[  119.266018][ T5641] arp_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  119.270470][ T5641] ip_tables: xtables 32bit compat interface no longer =
supported in namespaces and will be removed soon.
[  119.271534][ T5641] ip6_tables: xtables 32bit compat interface no longer=
 supported in namespaces and will be removed soon.
[  121.334097][ T5666] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  121.338021][ T5666] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  121.338232][ T5666] bridge_slave_0: entered allmulticast mode
[  121.341025][ T5666] bridge_slave_0: entered promiscuous mode
[  121.353220][ T5666] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  121.353501][ T5666] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  121.353686][ T5666] bridge_slave_1: entered allmulticast mode
[  121.355722][ T5666] bridge_slave_1: entered promiscuous mode
[  121.434681][ T5666] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  121.458570][ T5666] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  121.515626][ T5666] team0: Port device team_slave_0 added
[  121.531678][ T5666] team0: Port device team_slave_1 added
[  121.573221][ T5666] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  121.573235][ T5666] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  121.573249][ T5666] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  121.581147][ T5666] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  121.581169][ T5666] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[  121.581195][ T5666] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  121.732585][ T5666] hsr_slave_0: entered promiscuous mode
[  121.733348][ T5666] hsr_slave_1: entered promiscuous mode
[  121.937442][ T5666] netdevsim netdevsim1 netdevsim0: renamed from eth0
[  121.945618][ T5666] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[  121.948185][ T5666] netdevsim netdevsim1 netdevsim1: renamed from eth1
[  121.963090][ T5666] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[  121.990464][ T5666] netdevsim netdevsim1 netdevsim2: renamed from eth2
[  121.992839][ T5666] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[  121.995183][ T5666] netdevsim netdevsim1 netdevsim3: renamed from eth3
[  122.012233][ T5666] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[  122.065151][ T5666] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  122.065402][ T5666] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  122.066001][ T5666] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  122.066607][ T5666] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  122.130740][   T37] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  122.131846][   T37] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  122.169256][ T5666] 8021q: adding VLAN 0 to HW filter on device bond0
[  122.190400][ T5666] 8021q: adding VLAN 0 to HW filter on device team0
[  122.214365][   T37] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  122.214447][   T37] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  122.233900][   T37] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  122.234002][   T37] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  122.329395][ T5666] 8021q: adding VLAN 0 to HW filter on device batadv0
[  122.380927][ T5666] veth0_vlan: entered promiscuous mode
[  122.404874][ T5666] veth1_vlan: entered promiscuous mode
[  122.444443][ T5666] veth0_macvtap: entered promiscuous mode
[  122.451686][ T5666] veth1_macvtap: entered promiscuous mode
[  122.475228][ T5666] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  122.496834][ T5666] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  122.540927][   T61] netdevsim netdevsim1 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  122.563724][   T59] netdevsim netdevsim1 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  122.565323][   T37] netdevsim netdevsim1 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  122.567465][   T37] netdevsim netdevsim1 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  122.773657][   T37] netdevsim netdevsim1 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  122.863583][   T37] netdevsim netdevsim1 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  122.928890][   T37] netdevsim netdevsim1 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  124.498043][   T37] netdevsim netdevsim1 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  124.548496][   T59] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  124.548523][   T59] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  124.632676][   T59] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  124.632699][   T59] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  124.765000][ T4931] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[  124.780274][ T4931] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[  124.782685][ T4931] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[  124.783771][ T4931] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[  124.784622][ T4931] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
execution of simple program fails: NOTFAIL: arptable checkpoint: getsockopt=
(ARPT_SO_GET_ENTRIES) failed. table=3Dfilter (errno 22: Invalid argument).
[  126.157372][   T37] bridge_slave_1: left allmulticast mode
[  126.157419][   T37] bridge_slave_1: left promiscuous mode
[  126.160359][   T37] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  126.185651][   T37] bridge_slave_0: left allmulticast mode
[  126.185682][   T37] bridge_slave_0: left promiscuous mode
[  126.186197][   T37] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  126.473726][   T37] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  126.490305][   T37] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  126.492294][   T37] bond0 (unregistering): Released all slaves
[  126.674816][   T37] hsr_slave_0: left promiscuous mode
[  126.688746][   T37] hsr_slave_1: left promiscuous mode
[  126.690592][   T37] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  126.690805][   T37] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  126.694661][   T37] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  126.694691][   T37] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  126.771268][   T37] veth1_macvtap: left promiscuous mode
[  126.771330][   T37] veth0_macvtap: left promiscuous mode
[  126.771660][   T37] veth1_vlan: left promiscuous mode
[  126.771755][   T37] veth0_vlan: left promiscuous mode
[  127.121665][   T37] team0 (unregistering): Port device team_slave_1 remo=
ved
[  127.162343][   T37] team0 (unregistering): Port device team_slave_0 remo=
ved
[  127.304149][ T5277] 8021q: adding VLAN 0 to HW filter on device eth1
[  127.777376][ T5277] 8021q: adding VLAN 0 to HW filter on device eth2
[  128.517336][ T5277] 8021q: adding VLAN 0 to HW filter on device eth3
[  129.332540][ T5277] 8021q: adding VLAN 0 to HW filter on device eth4
[  140.702987][ T1310] ieee802154 phy0 wpan0: encryption failed: -22
[  140.703065][ T1310] ieee802154 phy1 wpan1: encryption failed: -22


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
 -ffile-prefix-map=3D/tmp/go-build4012198568=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/cc6qZiym.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x145): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null
[INFO] Unsupported architecture '386', skipping check.



Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5e4e3a0e188a497=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Da079f084653164a65=
2d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D15ec9c8e5800=
00

