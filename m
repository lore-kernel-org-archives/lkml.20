Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBAC30C159
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617125; cv=none; b=NxglqrEuptnimA4LALdwzhtx89oTzdWxwZKceyCcLWf3ynYiIughvwKupuSgxlKbJLMPQfFgX/7mJ5SdQ65KybTRwFtQBZlRFBjrXQiQH6oCDYTElUQBRMBNhyB2ffDpkBk9xKZj3ykkCL23cV+03e9Vj8rSJSbqq7wD93ggVfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617125; c=relaxed/simple;
	bh=+JCgMpvBJalv1MXXOi64uAFUIMqT6e8/KHvkXszsmCI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FEx8dYw9WVZWj146TNLwXdvGnUK1GhYbDRL008yaVzHWMJ/8rxL79X71HhogweFoHiCt6FRmwxx94ls9DYEwBWkcNul1ekewYxKhkv+9V4dQ3fQZG0fP/GMtgSSgLK8S5Ln5N2iHjVIatvxgTr+uX1mKeq8du11mMAgBMnqsOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c21c2859ceso277047eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617123; x=1790221923;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sY04xP3lQNYWfbnp2IXuGco+rzZL/onAMpSjX9AzzFk=;
        b=0hzTmMOtQhY9xAta2sfWxZ+Ay0NFOZgkgUV2j974hy4ulW+jPS0DRRF6t/V57NNBV/
         1Jo/cuM5kfrykiSXYqaB165FnBy6gfE0BuhsmwcuBZGc00NCJmZRN2xLOF1TrwcTVuGu
         vXV2pxd5z//uoLazgJ51MDeE7x/1ziyJ3EHBHqqfus4lWfg/pB2WS+o/1ygZGB9uVncC
         UBQ/R6STmDroXLb5aeaDeip8X3IPTRYuwWPdD0wsKKUnPQ+5FHf2C6y2YPSUcD4378jW
         iKPUQn/2OuXsx0W2rdnfcIBr6QGPlJ3VE6yV3UDE66DvhT+wcBhnZe2JmcDE0hiSL1eT
         +IgA==
X-Gm-Message-State: AFuF++lLpaEno1nHNvIfcwehE8SrgEHD8Jrz0nI9S8Q1VqptpjsOZLzX
	ixeacf+oc1dd9scy2fK9agvfE7alHJUOcSYmSbNDMv1oIKDguSZHiQZzjuhgdbbk/2dxcKf7Py5
	ienJo6i7RByOyj9IUEZktDc8ZwwHNVelQkD0pANhSlK5f8UGZH/NKXJbocls=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:310a:b0:6b3:61fa:102 with SMTP id
 006d021491bc7-6c7d39f9678mr4117009eaf.34.1789617123162; Wed, 16 Sep 2026
 20:52:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:52:03 -0700
In-Reply-To: <CAFJkwZzcu4-z0b+nc4Ki0DjaL3=DWfE7mXgfjL0VK6RL8AK36w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab63e3.71f81b7d.278072.000e.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to copy syz-executor to VM: scp failed: failed to run ["scp" "-P" "7=
267" "-F" "/dev/null" "-o" "UserKnownHostsFile=3D/dev/null" "-o" "Identitie=
sOnly=3Dyes" "-o" "BatchMode=3Dyes" "-o" "StrictHostKeyChecking=3Dno" "-o" =
"ConnectTimeout=3D10" "-v" "-O" "/syzkaller/jobs/linux/gopath/src/github.co=
m/google/syzkaller/bin/linux_amd64/syz-executor" "root@localhost:/syz-execu=
tor"]: exit status 1



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
 -ffile-prefix-map=3D/tmp/go-build3200815817=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/cclPQ5Yy.o: in function `Connection::Connect(char const*,=
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1666ebf95800=
00

