Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215A04A3D5B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311764; cv=none; b=l3TsolBvOKDVwG6Fj7pesEWrAxyd+deHheUuQXx5NSvD2R+k1+PV7JLRh0Pd/nOx2WqVlT6PFrXObO8yq7SjybA2X+eO4l+JSCpWohUlf37grdLuavwaQiZnzf/SWl03Sp4JbeCdPqvpzEQN8CKy3lqWirmTGhruqY6R0GyDIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311764; c=relaxed/simple;
	bh=MJy1KO8C3nVlf5g5Aawz83/HQvIYLE9+MubyKFN09f4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=laHmxz70+fXGz7+UHy2CRs0g3GrVYXDqGed2lHpRWMWZYcRhypQGSAOVSzww/2UmTdp3msfLp0fQcmYrwQFJhACENp72FzX9B0LqvwpeDJboocVjDCTCFRLF7rdB4nNuaWj+qE/LgfE+wUAW3QoZk3fFjqs2jteoy+JWtLsDXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dab94dc3e7so4963551b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791311762; x=1791916562;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5YGkPZ+I9bHxtgfGqV/v2znaGVJqsv7UmgalcOYRu8=;
        b=TW+Nn9TP9SIFQL23v1lKVQGgeXRrrEiJDPJqAX4OXsb7m+OeSorEJMw5YgjNYOStYL
         9YV/NRY4n/X2y2MWnyYrZFqdUWdGOD4yqWWJsDrr+w4GzSJ8XAGYe3r7vqH+VYGGk77R
         KmaSKs+OiwweZz+2i0bwDwBZhvITcMCgbr9gxNaYDSElZEEQV/Ac7mOZUwg6tLdVqHtB
         5t77hNSc0wcjkCRjsSZVFsCXPLEMgyxgbvQIkC7k2q6+9jA6+EkHhsQ1NE5NeSSSarvG
         oRASMGE950AHlHgmO5LhPqDEmwnSUJig7puLyhhI9EfG27C/iibkc325gxdNoHmIQhWM
         DR1A==
X-Gm-Message-State: AFuF++lsOV+fLtqhkxG8PqY83+L58zMHR7QitrPycKhFFZWBInIQwTqZ
	7aUeCUu66/aTPoZLYlEdb73b3iDIO+DtkhKpuM9B0llEAzlqZthQmYVY8HyJgLXvToI7HSyCqnN
	5iPpAIFul4NJk00r5ll3vMTbvrC1DpvYmbnZ4ISOJMDtyAvt1e9Z+a4pdTQs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f2a:b0:4fb:ac9b:b067 with SMTP id
 5614622812f47-4fbac9bbd3emr1914959b6e.64.1791311761784; Tue, 06 Oct 2026
 11:36:01 -0700 (PDT)
Date: Tue, 06 Oct 2026 11:36:01 -0700
In-Reply-To: <20261006111946.2164-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac53f91.9ad129c8.3ce5b3.0007.GAE@google.com>
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
" "root@10.128.1.101" "mkdir" "-p" "ci-upstream-kasan-gce-root-test-job-par=
allel"]: exit status 255



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
 -ffile-prefix-map=3D/tmp/go-build1553598807=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccVovhno.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         69f80fef Merge tag 'ata-7.3-rc7' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D23e5acac5c98285=
f
dashboard link: https://syzkaller.appspot.com/bug?extid=3D609c80047e3e808b4=
65c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1389d8355800=
00

