Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EFB3537E8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615865; cv=none; b=OoaP62kN5FBA7udz6WxYlJoSRdZcrqrzbFyFJXP6YWUoccxjGCi23MGr3llFnUd9cYbiSnsSoEYGgmVckvFKg15uLuFfDNdhFWK3z66LJXxXl3XN25XZTBc4B0BLIzpIhiJwB4K118FvL0b7NE9oZtsVSFpq6FJJS8L33rvsiIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615865; c=relaxed/simple;
	bh=rxk7fso1o3wK31qUu3QJmNtIBiTfRI40ccT2UByVrDc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=idNStOyrB48GcNcJP1H8Q3W8ucfRQ4ZYsZpeiW4irSYaSRUSe160FY+/CnSkwy0YMs/BjEtelqLAxyz7VMWVqYTGQGmAShV6+X/eo/G1Gi5pxhurjKLIzsAtXcdn3g3wWIiUNVB3iKYxVEDAQXTkTRO1X2kpU656TzTAG0pw5ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab1so517130b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615862; x=1790220662;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAepP7PV9A2x6X0c1PyiTMWeSt1H+aGoFOa/H+X+7nQ=;
        b=TxyYkR7glWpC2V22kZIrxnwomIibdcWvQIjo/T9TZ3CKHcrZ3vK9k6o7cW5RGCtCKK
         kjMaG1vFUk2eMi9XLZ7O/y9uKsvj4jJeSOWLYI/XWWIr+vu2oU7M+4tS7C8Aln2mRWlF
         QIB2Rgy0ULZJTlYyN6Q7xHEsT3NsiXhwK4+jPyjbDoKMqRo9JrX1As6pvpCzDLNa75ib
         Z3hBxKSyeL67NFtFX3WNsRzuz6SWI2SOJ0S/+IqmCBKZ3xiTjGQ1bxJRt/5X6AOAsceW
         woSgSdPDquXsdsh/erzW8xCznecCTgukpK3zAbjjM3NdWbfL30UCtvmrFdhQ8Y37JdoB
         ssTA==
X-Gm-Message-State: AFuF++mn/H0hdP+p85jdQLlQJbpgqp2qFmx6Augg/lqyjSjVo9hbTaV4
	Lkg6FAZOeX17TRHT+gTGOrvNQrqcTiUE8fcujP6quTSQsDJ6jrhWB4i9p7VgbLlBVi/dJbT716T
	dWyYl9+Vml7f/cyY1q0CzpF6bY/KBm9HtiwOisKjVMCCs5bsBB96wqkHn/iY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c222:b0:4b3:7baa:f944 with SMTP id
 5614622812f47-4cb67af5a05mr1422926b6e.2.1789615862377; Wed, 16 Sep 2026
 20:31:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:31:02 -0700
In-Reply-To: <CAFJkwZx1RyUmXg4RNqQPKVCdyu4-N_4G_JhtL7xGihU5RFnnqw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab5ef6.b398a7c9.1f86be.000f.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to copy syz-execprog to VM: scp failed: failed to run ["scp" "-P" "1=
5791" "-F" "/dev/null" "-o" "UserKnownHostsFile=3D/dev/null" "-o" "Identiti=
esOnly=3Dyes" "-o" "BatchMode=3Dyes" "-o" "StrictHostKeyChecking=3Dno" "-o"=
 "ConnectTimeout=3D10" "-v" "-O" "/syzkaller/jobs/linux/gopath/src/github.c=
om/google/syzkaller/bin/linux_amd64/syz-execprog" "root@localhost:/syz-exec=
prog"]: exit status 1



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
 -ffile-prefix-map=3D/tmp/go-build950368554=3D/tmp/go-build -gno-record-gcc=
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
/usr/bin/ld: /tmp/ccxK4Fsx.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3De909ffe6b35dddb=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3Db9529ebe6a9394ddf=
825
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D150ddbf95800=
00

