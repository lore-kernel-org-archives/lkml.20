Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00D3A3E72
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790205958; cv=none; b=CwMjWwbGKGOu4fTmNtpdSn62BEduHojNW+BsWecWlL5h1up2KFINLcqBvxzlLA/UvTf0QDse5+Kg3KSR97zqFe/hBOFJz+KLAF5lSn0/deJOKllOmlvG5mI+wG1p1XN4TMQEdRX/PSmLOMpagtHzSdwMaFJFQh5dvc430js/rQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790205958; c=relaxed/simple;
	bh=UDMYcoFOtKBAIydWZlFUmiGQh998nMACarhzwVJvnPQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dBxcHhIIqbwYJI9Wxm1v+JKubkIZD3WehY/L/mZAw4pnPlh+Y8bWj54lI5kuLPvPa4Fo2p0acg5Ul5+oysHAepjIojgNzDLIxcSB27Pxnc85C6tE3WJF5Zg/+V61k+nE/3Swj32qgrA9FbXMZkUh9y8sKWZ4ZxDKH5f8CCiFA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cb254da90eso2664258b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790205955; x=1790810755;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dkazD8KibbfYcEsOUr3qllPGXLP/mYEbB5Yc3z7dgGw=;
        b=NsWmTrQw27gGbp7FFL3zNCjs6mDoA0zNjAd7rt0DIklMbULrY+47ITUwUyP4W+gbmt
         kQNG5vKes0EyMM4dFfoySq/UH/vCO+xCFuFlenQ/AiuGDnEvMIVCRIbonszg3+42QU8U
         472PA1vGdfWU3EP7e8BpPjaZh5M69vh2DnhN2bFjJTBg/89QQTgOsQ2modB+e/WG/x1t
         PbY0ZKXJmmzaA5QaJsEvi9VkwSfenGq1S8wX6UzEoq8iEdITf42YD4dctDMvFPNHOIpf
         Bir0n/r7N3t/k0XthzfXnYYhJ0jMaqNsp+FuWDJ1AesL4701xq83jNvJ2PNLoy1h9VlK
         q1Sg==
X-Gm-Message-State: AFuF++lcx7Oti7BoHK0sm2RUtler7jYF6Ke7rx4NGMWGHWO6m+wsdvd1
	g3dnrVSg1NaEKFweI+t3cqgss8boReBFwun/bwxuAi4/WvyKpOpolvY2VdInDiX1rAk+Mce5+fR
	xrcwPOEfV7foJdjb0ml90v7EhmRQwTKPRAeppWqJ2LluDJTNslmzSrla6kMs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f69:b0:4c5:7d0d:7a5f with SMTP id
 5614622812f47-4d72c1440bbmr860561b6e.6.1790205955216; Wed, 23 Sep 2026
 16:25:55 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:25:55 -0700
In-Reply-To: <6ab152fc.71f81b7d.15fa6d.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab46003.80e1c6cc.1e8e5f.0005.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] INFO: task hung in usbatm_usb_disconnect
 (2)
From: syzbot <syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] INFO: task hung in usbatm_usb_disconnect (2)
Author: valigurasm@gmail.com

#syz test: upstream master

On Thu, 24 Sept 2026, 01:01 syzbot, <
syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com> wrote:

> Hello,
>
> syzbot tried to test the proposed patch but the build/boot failed:
>
> lost connection to test machine
>
>
>
> Warning: Permanently added '10.128.1.106' (ED25519) to the list of known
> hosts.
> 2026/09/23 21:58:53 parsed 1 programs
> 2026/09/23 21:58:53 serving rpc on tcp://36741
> [  108.303160][  T923] cfg80211: failed to load regulatory.db
> [  112.594660][ T5628] cgroup: Unknown subsys name 'net'
> [  112.732732][ T5628] cgroup: Unknown subsys name 'cpuset'
> [  112.746517][ T5628] cgroup: Unknown subsys name 'rlimit'
> Setting up swapspace version 1, size = 127995904 bytes
> [  114.653895][ T5628] Adding 124996k swap on ./swap-file.  Priority:0
> extents:1 across:124996k
> [  118.241459][ T5649] soft_limit_in_bytes is deprecated and will be
> removed. Writing any value to this file has no effect. Please report your
> usecase to linux-mm@kvack.org if you depend on this functionality.
> [  118.312791][ T5649] ebtables: xtables 32bit compat interface no longer
> supported in namespaces and will be removed soon.
> [  118.342551][ T5649] arp_tables: xtables 32bit compat interface no
> longer supported in namespaces and will be removed soon.
> [  118.935095][ T1161] wlan0: Created IBSS using preconfigured BSSID
> 50:50:50:50:50:50
> [  118.935132][ T1161] wlan0: Creating new IBSS network, BSSID
> 50:50:50:50:50:50
> [  119.314186][   T60] wlan1: Created IBSS using preconfigured BSSID
> 50:50:50:50:50:50
> [  119.314208][   T60] wlan1: Creating new IBSS network, BSSID
> 50:50:50:50:50:50
> [  119.514008][ T5659] ip_tables: xtables 32bit compat interface no longer
> supported in namespaces and will be removed soon.
> [  119.514671][ T5659] ip6_tables: xtables 32bit compat interface no
> longer supported in namespaces and will be removed soon.
> [  120.499036][ T5685] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 >
> 1
> [  120.504897][ T5685] Bluetooth: hci0: unexpected cc 0x1003 length: 249 >
> 9
> [  120.505931][ T5685] Bluetooth: hci0: unexpected cc 0x1001 length: 249 >
> 9
> [  120.507278][ T5685] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 >
> 4
> [  120.541791][ T5685] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 >
> 2
> [  122.840866][ T5680] bridge0: port 1(bridge_slave_0) entered blocking
> state
> [  122.841743][ T5680] bridge0: port 1(bridge_slave_0) entered disabled
> state
> [  122.842082][ T5680] bridge_slave_0: entered allmulticast mode
> [  122.862531][ T5680] bridge_slave_0: entered promiscuous mode
> [  122.889547][ T5680] bridge0: port 2(bridge_slave_1) entered blocking
> state
> [  122.889656][ T5680] bridge0: port 2(bridge_slave_1) entered disabled
> state
> [  122.889794][ T5680] bridge_slave_1: entered allmulticast mode
> [  122.891937][ T5680] bridge_slave_1: entered promiscuous mode
> [  122.984739][ T5680] bond0: (slave bond_slave_0): Enslaving as an active
> interface with an up link
> [  123.001661][ T5680] bond0: (slave bond_slave_1): Enslaving as an active
> interface with an up link
> [  123.051936][ T5680] team0: Port device team_slave_0 added
> [  123.055615][ T5680] team0: Port device team_slave_1 added
> [  123.112267][ T5680] batman_adv: batadv0: Adding interface:
> batadv_slave_0
> [  123.112288][ T5680] batman_adv: batadv0: The MTU of interface
> batadv_slave_0 is too small (1500) to handle the transport of batman-adv
> packets. Packets going over this interface will be fragmented on layer2
> which could impact the performance. Setting the MTU to 1532 would solve the
> problem.
> [  123.112327][ T5680] batman_adv: batadv0: Not using interface
> batadv_slave_0 (retrying later): interface not active
> [  123.116516][ T5680] batman_adv: batadv0: Adding interface:
> batadv_slave_1
> [  123.116534][ T5680] batman_adv: batadv0: The MTU of interface
> batadv_slave_1 is too small (1500) to handle the transport of batman-adv
> packets. Packets going over this interface will be fragmented on layer2
> which could impact the performance. Setting the MTU to 1532 would solve the
> problem.
> [  123.116558][ T5680] batman_adv: batadv0: Not using interface
> batadv_slave_1 (retrying later): interface not active
> [  123.261249][ T5680] hsr_slave_0: entered promiscuous mode
> [  123.262263][ T5680] hsr_slave_1: entered promiscuous mode
> [  123.471857][ T5680] netdevsim netdevsim8 netdevsim0: renamed from eth0
> [  123.487856][ T5680] 8021q: adding VLAN 0 to HW filter on device
> netdevsim0
> [  123.489120][ T5680] netdevsim netdevsim8 netdevsim1: renamed from eth1
> [  123.493156][ T5680] 8021q: adding VLAN 0 to HW filter on device
> netdevsim1
> [  123.494176][ T5680] netdevsim netdevsim8 netdevsim2: renamed from eth2
> [  123.504829][ T5680] 8021q: adding VLAN 0 to HW filter on device
> netdevsim2
> [  123.507973][ T5680] netdevsim netdevsim8 netdevsim3: renamed from eth3
> [  123.548418][ T5680] 8021q: adding VLAN 0 to HW filter on device
> netdevsim3
> [  123.652099][ T5680] 8021q: adding VLAN 0 to HW filter on device bond0
> [  123.685093][ T5680] 8021q: adding VLAN 0 to HW filter on device team0
> [  123.702139][   T60] bridge0: port 1(bridge_slave_0) entered blocking
> state
> [  123.702279][   T60] bridge0: port 1(bridge_slave_0) entered forwarding
> state
> [  123.730774][   T78] bridge0: port 2(bridge_slave_1) entered blocking
> state
> [  123.730885][   T78] bridge0: port 2(bridge_slave_1) entered forwarding
> state
> [  124.170694][ T5680] 8021q: adding VLAN 0 to HW filter on device batadv0
> [  124.430316][ T5680] veth0_vlan: entered promiscuous mode
> [  124.447342][ T5680] veth1_vlan: entered promiscuous mode
> [  124.488229][ T5680] veth0_macvtap: entered promiscuous mode
> [  124.492929][ T5680] veth1_macvtap: entered promiscuous mode
> [  124.527631][ T5680] batman_adv: batadv0: Interface activated:
> batadv_slave_0
> [  124.540115][ T5680] batman_adv: batadv0: Interface activated:
> batadv_slave_1
> execution of simple program fails: NOTFAIL: arptable checkpoint:
> getsockopt(ARPT_SO_GET_ENTRIES) failed. table=filter (errno 22: Invalid
> argument).
> [  124.647568][ T1161] netdevsim netdevsim8 netdevsim0: set [1, 0] type 2
> family 0 port 6081 - 0
> [  124.647619][ T1161] netdevsim netdevsim8 netdevsim1: set [1, 0] type 2
> family 0 port 6081 - 0
> [  124.647655][ T1161] netdevsim netdevsim8 netdevsim2: set [1, 0] type 2
> family 0 port 6081 - 0
> [  124.647690][ T1161] netdevsim netdevsim8 netdevsim3: set [1, 0] type 2
> family 0 port 6081 - 0
> [  124.806492][ T1161] netdevsim netdevsim8 netdevsim3 (unregistering):
> unset [1, 0] type 2 family 0 port 6081 - 0
> [  124.903314][ T1161] netdevsim netdevsim8 netdevsim2 (unregistering):
> unset [1, 0] type 2 family 0 port 6081 - 0
> [  124.980877][ T1161] netdevsim netdevsim8 netdevsim1 (unregistering):
> unset [1, 0] type 2 family 0 port 6081 - 0
> [  125.116872][ T1161] netdevsim netdevsim8 netdevsim0 (unregistering):
> unset [1, 0] type 2 family 0 port 6081 - 0
> [  125.883310][ T1161] bridge_slave_1: left allmulticast mode
> [  125.883361][ T1161] bridge_slave_1: left promiscuous mode
> [  125.884401][ T1161] bridge0: port 2(bridge_slave_1) entered disabled
> state
> [  125.920237][ T1161] bridge_slave_0: left allmulticast mode
> [  125.920268][ T1161] bridge_slave_0: left promiscuous mode
> [  125.920607][ T1161] bridge0: port 1(bridge_slave_0) entered disabled
> state
> [  126.095488][ T1161] bond0 (unregistering): (slave bond_slave_0):
> Releasing backup interface
> [  126.110922][ T1161] bond0 (unregistering): (slave bond_slave_1):
> Releasing backup interface
> [  126.112236][ T1161] bond0 (unregistering): Released all slaves
> [  126.223248][ T1161] hsr_slave_0: left promiscuous mode
> [  126.226835][ T1161] hsr_slave_1: left promiscuous mode
> [  126.233387][ T1161] batman_adv: batadv0: Interface deactivated:
> batadv_slave_0
> [  126.233431][ T1161] batman_adv: batadv0: Removing interface:
> batadv_slave_0
> [  126.241512][ T1161] batman_adv: batadv0: Interface deactivated:
> batadv_slave_1
> [  126.241585][ T1161] batman_adv: batadv0: Removing interface:
> batadv_slave_1
> [  126.286396][ T1161] veth1_macvtap: left promiscuous mode
> [  126.286461][ T1161] veth0_macvtap: left promiscuous mode
> [  126.286648][ T1161] veth1_vlan: left promiscuous mode
> [  126.286760][ T1161] veth0_vlan: left promiscuous mode
> [  126.654559][ T1161] team0 (unregistering): Port device team_slave_1
> removed
> [  126.682089][ T1161] team0 (unregistering): Port device team_slave_0
> removed
> [  126.875676][ T5279] 8021q: adding VLAN 0 to HW filter on device eth1
> [  127.409335][ T5279] 8021q: adding VLAN 0 to HW filter on device eth2
> [  127.993497][ T5279] 8021q: adding VLAN 0 to HW filter on device eth3
> [  128.438182][ T5279] 8021q: adding VLAN 0 to HW filter on device eth4
> [  139.019729][ T1313] ieee802154 phy0 wpan0: encryption failed: -22
> [  139.019831][ T1313] ieee802154 phy1 wpan1: encryption failed: -22
>
>
> syzkaller build log:
> go env (err=<nil>)
> AR='ar'
> CC='gcc'
> CGO_CFLAGS='-O2 -g'
> CGO_CPPFLAGS=''
> CGO_CXXFLAGS='-O2 -g'
> CGO_ENABLED='1'
> CGO_FFLAGS='-O2 -g'
> CGO_LDFLAGS='-O2 -g'
> CXX='g++'
> GCCGO='gccgo'
> GO111MODULE='auto'
> GOAMD64='v1'
> GOARCH='amd64'
> GOAUTH='netrc'
> GOBIN=''
> GOCACHE='/syzkaller/.cache/go-build'
> GOCACHEPROG=''
> GODEBUG=''
> GOENV='/syzkaller/.config/go/env'
> GOEXE=''
> GOEXPERIMENT=''
> GOFIPS140='off'
> GOFLAGS=''
> GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0
> -ffile-prefix-map=/tmp/go-build3081947690=/tmp/go-build
> -gno-record-gcc-switches'
> GOHOSTARCH='amd64'
> GOHOSTOS='linux'
> GOINSECURE=''
> GOMOD='/syzkaller/jobs-2/linux/gopath/src/
> github.com/google/syzkaller/go.mod'
> GOMODCACHE='/syzkaller/jobs-2/linux/gopath/pkg/mod'
> GONOPROXY=''
> GONOSUMDB=''
> GOOS='linux'
> GOPATH='/syzkaller/jobs-2/linux/gopath'
> GOPRIVATE=''
> GOPROXY='https://proxy.golang.org,direct'
> GOROOT='/usr/local/go'
> GOSUMDB='sum.golang.org'
> GOTELEMETRY='local'
> GOTELEMETRYDIR='/syzkaller/.config/go/telemetry'
> GOTMPDIR=''
> GOTOOLCHAIN='auto'
> GOTOOLDIR='/usr/local/go/pkg/tool/linux_amd64'
> GOVCS=''
> GOVERSION='go1.26.0'
> GOWORK=''
> PKG_CONFIG='pkg-config'
>
> git status (err=<nil>)
> HEAD detached at 853b104bb45
> nothing to commit, working tree clean
>
>
> tput: No value for $TERM and no -T specified
> tput: No value for $TERM and no -T specified
> Makefile:31: run command via tools/syz-env for best compatibility, see:
> Makefile:32:
> https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
> go list -f '{{.Stale}}' -ldflags="-s -w -X
> github.com/google/syzkaller/prog.GitRevision=853b104bb454141a5b0fc0e4218ec78e9f34ffb1
> -X github.com/google/syzkaller/prog.gitRevisionDate=20260918-062331"
> ./sys/syz-sysgen | grep -q false || go install -ldflags="-s -w -X
> github.com/google/syzkaller/prog.GitRevision=853b104bb454141a5b0fc0e4218ec78e9f34ffb1
> -X github.com/google/syzkaller/prog.gitRevisionDate=20260918-062331"
> ./sys/syz-sysgen
> make .descriptions
> tput: No value for $TERM and no -T specified
> tput: No value for $TERM and no -T specified
> Makefile:31: run command via tools/syz-env for best compatibility, see:
> Makefile:32:
> https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
> bin/syz-sysgen
> <https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-envbin/syz-sysgen>
> touch .descriptions
> GOOS=linux GOARCH=amd64 go build -ldflags="-s -w -X
> github.com/google/syzkaller/prog.GitRevision=853b104bb454141a5b0fc0e4218ec78e9f34ffb1
> -X github.com/google/syzkaller/prog.gitRevisionDate=20260918-062331"  -o
> ./bin/linux_amd64/syz-execprog
> github.com/google/syzkaller/tools/syz-execprog
> mkdir -p ./bin/linux_386
> x86_64-linux-gnu-g++ -o ./bin/linux_386/syz-executor executor/executor.cc \
>         -m32 -O2 -pthread -Wall -Werror -Wparentheses
> -Wunused-const-variable -Wframe-larger-than=16384 -Wno-stringop-overflow
> -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variable
> -Wno-unused-command-line-argument -static-pie -std=c++17 -I.
> -Iexecutor/_include   -DGOOS_linux=1 -DGOARCH_386=1 \
>         -DHOSTGOOS_linux=1
> -DGIT_REVISION=\"853b104bb454141a5b0fc0e4218ec78e9f34ffb1\"
> /usr/bin/ld: /tmp/cctVKtvW.o: in function `Connection::Connect(char
> const*, char const*)':
> executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEPKcS1_]+0x145):
> warning: Using 'gethostbyname' in statically linked applications requires
> at runtime the shared libraries from the glibc version used for linking
> ./tools/check-syzos.sh 2>/dev/null
> [INFO] Unsupported architecture '386', skipping check.
>
>
>
> Tested on:
>
> commit:         fe2ec837 Merge tag 'hid-for-linus-2026092202' of git:/..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
> dashboard link:
> https://syzkaller.appspot.com/bug?extid=9ca2c9f85bd8b5e46516
> compiler:       Debian clang version 22.1.8
> (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: i386
> patch:
> https://syzkaller.appspot.com/x/patch.diff?x=11123405580000
>
>
