Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBDD374185
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611005; cv=none; b=OXPVXPa62wz9mBLugwI4LsIKGEXo5D3Wo7NHA8t61UrE634PQpakZZHmdiHKXV69+f+TLye/oC/vsYV3pqrGGXkvwOKCdzb1FwGiFA6xsxNT3iziDKV+U1JBWJuwNZER3Y2zDW4PHitPMgofW/AShb0lQOO9fDAfv6ie2OThbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611005; c=relaxed/simple;
	bh=+Dl/tlOjkK9Oy1CD4VfRQmuMcK/Yrw67ItCJ0RHmS5c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h7hXCIgBtVOprTGAbSXLv4qCj7veIqBa/Q9CKM61qIj/7GEjb6UBt39HMdiY+fuqG9B4x6nsQ3ms5H+rCSXSHdDlRDZtE4FQWX1AA9kl3fcirC1A/g7d6Jbcq4eW4mq3HiIB8KegWGnKBbcOJTbEAhg/P1P5bnH8jIZWE8RqOzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c27804563dso500994eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611002; x=1790215802;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BvxtfAt1xjzuY2Tgn0BiYiy3eBa2TKfmLVqygm4RTIk=;
        b=ckZs2BMNT0ekVXfc+VW5z38i3Rpy5RZsV1oVmmxr+sjelcUrDcETVTFmlsGnZ97Tlk
         4xY6RbLBTM2kCkqTUTWfmiT+HilApZdNOvPCf2So/6Mg7gBDwbrRGK4U3znbdYVasple
         b3ymoFcZgwWLtUJpmU99Gjxot5Yb2Hs3D+K2CfmIZbqAK5HB7jwnVAQPO9e4DDf45W/L
         dfLxHq0lMEcN774YjY7rz8X959kcb97zhIugcJO/eRZ0BOydKiDYMJbvf7gfo+1ZF7Kf
         Q+bXYuj+Cs/pXoUwMq8Dv2bGfEHpyOnZWYPZM2ncRb5PifA4o/BF0B95Fk1Qy+j6zdSK
         Deeg==
X-Forwarded-Encrypted: i=1; AKwUvBypqwXqFU7QkZIp3ZDS/Y4S7uUMkTwyClMwDjRdTTDulUj7sN4stxa3LarKgJ54JUzdNp8Uln7cUjim9v8=@vger.kernel.org
X-Gm-Message-State: AFuF++n5DDmPp2xfq7o55wxhaUQTidmrxxAlt/leh1fSj/dWamUWpbK0
	zemdf+Khru02gk5GPPXDAvSmd50eYg+g58FEW/Fi8XpPJMCGhP7t8Ug4iFAb+zMsu9RgFJpaPQN
	MfXT+h/MuMjOgWmf9v7fgIjCZ7gLjOuwYjwDftBN1GEBaRSx/rK0nFko4qes=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2907:b0:6c1:e01b:3b1e with SMTP id
 006d021491bc7-6c7d45e26cemr5057817eaf.48.1789611002269; Wed, 16 Sep 2026
 19:10:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:10:02 -0700
In-Reply-To: <20260917015317.975430-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab4bfa.b398a7c9.1f86be.0009.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

lost connection to test machine



syzkaller login: qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0=
) is smaller than the requested size (0x400000)
[   91.925486][   T10] cfg80211: failed to load regulatory.db
Warning: Permanently added '[localhost]:30539' (ED25519) to the list of kno=
wn hosts.
2026/09/17 02:08:46 parsed 1 programs
2026/09/17 02:08:46 serving rpc on tcp://38533
[   96.572980][ T5287] cgroup: Unknown subsys name 'net'
[   96.624230][ T5287] cgroup: Unknown subsys name 'cpuset'
[   96.628137][ T5287] cgroup: Unknown subsys name 'rlimit'
[  117.530042][ T1024] ata1.00: exception Emask 0x0 SAct 0x4000 SErr 0x0 ac=
tion 0x6 frozen
[  117.530070][ T1024] ata1.00: failed command: WRITE FPDMA QUEUED
[  117.530078][ T1024] ata1.00: cmd 61/00:70:36:81:04/20:00:00:00:00/40 tag=
 14 ncq dma 4194304 ou
[  117.530078][ T1024]          res 40/00:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x4 (timeout)
[  117.530107][ T1024] ata1.00: status: { DRDY }
[  117.530148][ T1024] ata1: hard resetting link
[  117.854290][ T1024] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 30=
0)
[  117.855240][ T1024] ata1.00: configured for UDMA/100
[  117.855521][ T1024] ata1: EH complete
Setting up swapspace version 1, size =3D 127995904 bytes
[  119.296232][ T5287] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
qemu-system-x86_64: ahci: PRDT length for NCQ command (0x0) is smaller than=
 the requested size (0xa8000)
[  121.760867][ T1024] ata1.00: Read log 0x10 page 0x00 failed, Emask 0x1
[  121.760887][ T1024] ata1: failed to read log page 10h (errno=3D-5)
[  121.760897][ T1024] ata1.00: NCQ disabled due to excessive errors
[  121.760905][ T1024] ata1.00: exception Emask 0x1 SAct 0xc000 SErr 0x0 ac=
tion 0x0
[  121.760915][ T1024] ata1.00: irq_stat 0x41000000
[  121.760925][ T1024] ata1.00: failed command: READ FPDMA QUEUED
[  121.760932][ T1024] ata1.00: cmd 60/40:70:36:51:05/05:00:00:00:00/40 tag=
 14 ncq dma 688128 in
[  121.760932][ T1024]          res 50/04:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[  121.760961][ T1024] ata1.00: status: { DRDY }
[  121.760968][ T1024] ata1.00: error: { ABRT }
[  121.760977][ T1024] ata1.00: failed command: READ FPDMA QUEUED
[  121.760983][ T1024] ata1.00: cmd 60/c0:78:76:56:05/02:00:00:00:00/40 tag=
 15 ncq dma 360448 in
[  121.760983][ T1024]          res 50/04:00:00:00:00/00:00:00:00:00/00 Ema=
sk 0x1 (device error)
[  121.761010][ T1024] ata1.00: status: { DRDY }
[  121.761017][ T1024] ata1.00: error: { ABRT }
[  121.762668][ T1024] ata1.00: configured for UDMA/100
[  121.763094][ T1024] sd 0:0:0:0: [sda] tag#14 FAILED Result: hostbyte=3DD=
ID_OK driverbyte=3DDRIVER_OK cmd_age=3D0s
[  121.763126][ T1024] sd 0:0:0:0: [sda] tag#14 Sense Key : Aborted Command=
 [current]=20
[  121.763149][ T1024] sd 0:0:0:0: [sda] tag#14 Add. Sense: No additional s=
ense information
[  121.763173][ T1024] sd 0:0:0:0: [sda] tag#14 CDB: Read(10) 28 00 00 05 5=
1 36 00 05 40 00
[  121.763186][ T1024] I/O error, dev sda, sector 348470 op 0x0:(READ) flag=
s 0x84700 phys_seg 168 prio class 2
[  121.763396][ T1024] sd 0:0:0:0: [sda] tag#15 FAILED Result: hostbyte=3DD=
ID_OK driverbyte=3DDRIVER_OK cmd_age=3D0s
[  121.763421][ T1024] sd 0:0:0:0: [sda] tag#15 Sense Key : Aborted Command=
 [current]=20
[  121.763442][ T1024] sd 0:0:0:0: [sda] tag#15 Add. Sense: No additional s=
ense information
[  121.763464][ T1024] sd 0:0:0:0: [sda] tag#15 CDB: Read(10) 28 00 00 05 5=
6 76 00 02 c0 00
[  121.763475][ T1024] I/O error, dev sda, sector 349814 op 0x0:(READ) flag=
s 0x84700 phys_seg 88 prio class 2
[  121.763614][ T1024] ata1: EH complete
[  124.582483][ T5311] soft_limit_in_bytes is deprecated and will be remove=
d. Writing any value to this file has no effect. Please report your usecase=
 to linux-mm@kvack.org if you depend on this functionality.
qemu-system-x86_64: hw/ide/core.c:925: ide_dma_cb: Assertion `prep_size >=
=3D 0 && prep_size <=3D n * 512' failed.
Connection to localhost closed by remote host.


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
 -ffile-prefix-map=3D/tmp/go-build1383433036=3D/tmp/go-build -gno-record-gc=
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
HEAD detached at 12a0a44a11e
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D12a0a44a11e4f0e07457f2b9d76763cd609f4f86 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260915-150835"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D12a0a44a11e4f0e07457f2b9d76763cd609f4f86 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260915-150835"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D12a0a44a11e4f0e07457f2b9d76763cd609f4f86 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260915-150835"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"12a0a44a11e4f0e07457f2b9d76763cd60=
9f4f86\"
go: downloading google.golang.org/grpc v1.83.2
go: downloading golang.org/x/crypto v0.55.0
go: downloading golang.org/x/net v0.58.0
go: downloading golang.org/x/text v0.41.0
/usr/bin/ld: /tmp/ccn9ay4F.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         f6e7b42b Merge tag 'sysctl-7.03-fixes-rc4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3De909ffe6b35dddb=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3Db9529ebe6a9394ddf=
825
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D14cb93f95800=
00

