Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133383;
	b=uvXKbxb71yn9asujUOw7NT3snF9ra0eYrV23npJFLpasMBw6VB1Wh8hYQe7xiNDKCyUf
	 rqweC0ZcnlRdFDHIPjCWg53f7y+nfWRqzM56RfPEM//rC2U3gMOLn3JiyWkibKIsrd4YI
	 TgpKmuZVAdC7YHNEAsub053X+cNRhYpQ3hg8C8oLf/xSHqJbCaZBV05ZAIObZ6MtIkp2j
	 WbFDgnEv/gI/IUFvfUxWLpX2PZQgHz1z4q9BZpN/X+JFCf2DOrJ+S9QYhN1jEvqyB3SKF
	 NluDpD8LRdKRBenKGn7uL5LufC2kW+S3W8qsQrAoCcxKZMb3Wh46bVcg/0fUkgoIXUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=8GtAD6HbjH00+H6gvNuTUrqNIpHGwHybZFgplHDVGvQ=;
	b=RHXk8bpTbT8J37ql8/yxv5iqJOk0dW/KP41KpXuT4t60lppwtanIQvX7tLf+lwuVVrtV
	 tQa4WVtPgrwawMiPSNCEclpt4HLPelz8O8hx8aSq5i5ex3qb1KZwwXyXFJ2sP0b5cemiD
	 E2iA7WWyoEzpYvdsW12aEWWJ4No1lAE9hMHB2UGFq4feanBiy8LgB4rirLmxHz4n7zTnK
	 41Md2hMUeMH6pWCLAmuU3amKkwjwYjSfch3PCLQs9lJFolymIxXneA/ZSR8xDCzcaQENi
	 iwevdRBISGDVBI7pn29RgO9bDz1mEow6kIqipDRIdTuMIgo6X3Wo3muinFtJuUZiYYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97942606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97942606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4adae31e4b1so13684fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794133381; x=1794738181;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8GtAD6HbjH00+H6gvNuTUrqNIpHGwHybZFgplHDVGvQ=;
        b=1cbFZaCc0WIatBV+vVoBBeyJRj5DC0s/EQnM6r6sPQv11vIJKCZKHLbmkq5GX1Hh6V
         wZm3x5qadnr0OT1ntBkVJbhvEd2lHpqrEKd8KNYyRse37gmGf6q00hi4TNt1U+Q6kErj
         Xxiuecip7OPkck1wF/R/Quime2dbZj1MMSoYUMGbQ4Hfk+b7GJsyRcz3M5UcH5ZFYQOo
         +pn5uWKDiH0O+vdQ8yQQS0mvsU3k/9IwQO6y1Z/FUj4RTDPhpqH/iZ2Td5JXcIOq/yC+
         O1glsVWVHceHiLjjzT9FUMAmKBYJNRDXAQuyQTIIaswoJuSpsyYAF8lY2za8RImEDs+Z
         4mgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7upzWOi3zTq6Ubw8Bp7QC+9l88tHIZngpGgxO8dcUqIq+ChI95F7yMizEdh24u6XtnNFmCONHYlTU01w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c1kAzH+HLGV7V+XEogJIyD0Xk0Cs8jycy0XaXYIVs1rNIRK0R
	LJQ//fqCpyVECuyJDPTV1OS5ZSEjdavo9QR4kiqzBSRoEQtWEFKnWwdEqHyXfcDZfeTlpJVNQCu
	gVpDGNlzstx44VS017hsHzenc7XIa9KeVxFfPABO7AlibrW36+5Yoz24tZc0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1686:b0:4d6:9252:48c9 with SMTP id
 5614622812f47-5681444e34cmr626724b6e.53.1794133381403; Sun, 08 Nov 2026
 02:23:01 -0800 (PST)
Date: Sun, 08 Nov 2026 02:23:01 -0800
In-Reply-To: <CACbwGuT_hdDk1-VAbhZ1Q9O=3F4FrU1c35FwmyY+Uy_BquzztQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af04d85.c4c6bce2.24c2d9.0005.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to read ELF symbols: no symbol section

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
 -ffile-prefix-map=3D/tmp/go-build1443466748=3D/tmp/go-build -gno-record-gc=
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
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"1e72964b0111319984575e60f266d1fa0a=
98abb5\"
/usr/bin/ld: /tmp/ccwrmVQs.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         9b1d4b86 add bounded root write oracle
git tree:       https://storage.googleapis.com/vrp-syzbot-owned-fixture-811=
055272945-1108/bare-repo-9b1d4b8 main
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Daac4d89c42a30c8=
5
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc22bb42560ec86726=
aba
compiler:       owned-fixture-1108

Note: no patches were applied.
