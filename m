Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D250372EFF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230466; cv=none; b=aiuGwyuVaf2DNiIF7lOzanXnKQ7qK753gXsw5dPL3FoFFg2D62nimjvCHDo8vLd05dLA9a+HrfaZUC+zhs+SrFX/JLXzFBbZjoqwT+B5aYDTCeGVCfYUvMup8W+rQvVQ1FLjqi/B9NOvK+fDsmxU6FjAvqiGd2mZEO7Ub1TZQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230466; c=relaxed/simple;
	bh=OXGA0lsN3HGjK5PziEyTTWuQUolshONcm2PCfTQXZCI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uvrNRvt1Va55vNB0GcC35yrMxZKaq7PZEiofA03Ks50bD2xlU1E3LdnljB40CcGuVCvt9x6R4ZN8LGWU8JxmUCIq8D5A6RF+gWlYtkf7ZClUAd7bPXRoq32GJLJKpyON9xdr6+SlZW3mIELJudIJdHeqVC7dZz8g8loSyroz+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b38ea4c6acso1832531b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791230463; x=1791835263;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eIjs3nLgDHcMG8Boah1VwXC/M8b9HBoUlPE50cZ2lpU=;
        b=PQZuzV3u7ZuYCFAkVflvMkt3dJpCeMzUaF4uvwHd1Un7Dnagaj74Vpv/0j22mfYgCk
         2p+hrER/u7FyadILr5t+ADG96OA+ZZJOW2ZSVBiZXkFbbEeSkWq5Z9RbSzAwzIyYlggo
         nnCojIiesZsUlX+DerNhEZRiZxK94oHjwdv1fu3o7/VEFthM7hWXY1v98HI0rRbZRURQ
         O0vzNt55QJ/9DWyUzG2LRdKT5XEVitiorIfsqeD1YyIUgkVAvPYCpIuCIH6HaORlAShl
         fSC3hUUoD5EQP1A/SGxOP/03BQ/bn23OBqWEPdtqTxFceMx6LhgULhuYQm23FpO2Wldk
         fHTQ==
X-Gm-Message-State: AFuF++kQNkEVJSZeC+BlJtkEUwk6A4K0yaLT/gIGsre9e1GLEA5EQEwC
	O6RzIVYOMCBKKkyE/KnDP8VhfC0NmKtkYsIJ3WxOx+SFzl0tuLgI/c8akNN03/1JYEilijfD8ZD
	VxRdM9NkRKI8trnFWFc0ZeTAfXCyiR+CxQM8HlS6i02Pw6Le4mfHQgHRg7ck=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1fb:b0:4f1:6ab6:8fc0 with SMTP id
 5614622812f47-4f5288c00c5mr11024670b6e.15.1791230463041; Mon, 05 Oct 2026
 13:01:03 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:01:03 -0700
In-Reply-To: <20261005154152.14841-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac401ff.53659fcc.25f34.00a3.GAE@google.com>
Subject: Re: [syzbot] [pm?] kernel BUG in mark_free_pages
From: syzbot <syzbot+609c80047e3e808b465c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to copy binary to VM: failed to run ["ssh" "-p" "22" "-F" "/dev/null=
" "-o" "UserKnownHostsFile=3D/dev/null" "-o" "IdentitiesOnly=3Dyes" "-o" "B=
atchMode=3Dyes" "-o" "StrictHostKeyChecking=3Dno" "-o" "ConnectTimeout=3D10=
" "root@10.128.10.9" "mkdir" "-p" "ci-upstream-kasan-gce-root-test-job-para=
llel"]: exit status 255



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
 -ffile-prefix-map=3D/tmp/go-build2341481522=3D/tmp/go-build -gno-record-gc=
c-switches'
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
HEAD detached at 57bbd979bc5
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D57bbd979bc50a3acd0eac610ef944726ba358063 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20261002-100947"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D57bbd979bc50a3acd0eac610ef944726ba358063 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20261002-100947"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D57bbd979bc50a3acd0eac610ef944726ba358063 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20261002-100947"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"57bbd979bc50a3acd0eac610ef944726ba=
358063\"
/usr/bin/ld: /tmp/ccowJ8dD.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         67f0943b Merge tag 'selinux-pr-20261005' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D23e5acac5c98285=
f
dashboard link: https://syzkaller.appspot.com/bug?extid=3D609c80047e3e808b4=
65c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D17b1cf255800=
00

