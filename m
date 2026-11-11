Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794357781;
	b=fH9RpAKwirLzCBnATK/LWuJYAbh/8VVjYT6BEaTrVTjVTFdMnJWR3/+Y+aJ2KTd1gYsX
	 VUCAXcZ6iKDJsctxkp6BreFOLwtBxDtOv2GjuY4C6hJPuVWfbvPK8ssGKMwQ/RdRHpA/1
	 FNRrRpc6qas98ITpykJM673lKsqJRtfOQ/Lz2LWSBbuwoya3xelpzu7qw/7/ZTe4qgaCL
	 8NN4c+ADKiecIyQOYna4+pqmP9hPlEiTzlp285R3OyeQR1ZeTFJ6zzcvvU+N4481iqHIf
	 8V9znyfWnQ7E0yLST95cnxPVJa6mabFetD7E4xbnY54l9O0Nn7zIQ0SbXS8eCqTEcNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
	b=HSs/vAGyMuiblCO7gnb8hKlgSHwECTldjwByTt0SGMnHCwiVkXaAXDoUjIrsictpfMjN
	 pD/2mg5sCP7CBc+LPbchUwgXw50UFaKX45fgSl3CuLDVgU8hTu/WT786LYggiarNsQrNC
	 DRyroRdFTQ2/5Ot4x/xql3fMFK+fiBt86vb8OXFQIspthepW3/ssIjlpphvdxrzWUi7P/
	 t1L9xo8ddx6Rs8P5qsTRrNQCvGehF/ZoCkcWaHkNBFpi2Iz2d5zXN4e+iddd+42hvCFH6
	 iI4Bv00P1iLDsLvtsKYcj23xevxrPiCPJJyZBi6OMMDXL1bl7ZXDbddNeV/rhQT8JIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gavT6zB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gavT6zB7
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b360828905so27288567b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794357780; cv=none;
        d=google.com; s=arc-20260327;
        b=A9vmqjxfOqilj8PhiDLONEYMFc0Z7z+A6a8zMZ6Xzvh/y6Loj919z71LhdX2jfygfH
         F7FPT0SLnqCGwsoOSptXEguGrYik1dBOdp7OJT+qQ4g0KfFeS84T0USuwGbuEevFIjR2
         9+YkK4r7OVZlu5okT/qBuxiLmmQsWyc/GGyCEGzxVHYDSL2UhFfVW3VV9Zvgzms4JuQG
         biKobGFnRHFp7oipitKnGPSqKzLMdhqwtdIhlwHFk/5gPA9sC3DGH62Zhi7tWxxH1Vlt
         HHsskLq1ncUnitQ1WdEwDH9XcCyqcqXMfp3kFuQOiT16JnhI2/eJVx0W2YrIIGG8X0Dt
         /7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
        fh=b6UK5y1nCOQGqcdBay1Vw89EyRntAujmZ0dtrb22KGE=;
        b=lPVxEj32PcETDyH/Xn2lls+thnE8HHA/f6KD97cVSBRyVysmlrcKjq/BjWJx9CiIBm
         BKK+41BGD03royb7ASOL5lKfPO836pCI7bcvEge8ftREQkXz4RwW/NOI8K1npQiTiHNG
         5aHiUKYTyiSHlBVOZ/krZCMagfBIwXFj+Kvh8EWhgeSxyiELWF3h7Psnrb8xEXLMaGUD
         wu+ejYg1QnhyFae5MYogLA+NzHL5CgFPe07hl3SMCzHrqxn3SVuFOZgJsXvcXGrdlqke
         Y/EpSq6G5cbHtAaN4UyHXMccOmsW/S2Bs4yd/2lEjCOHEbKozaTBilOwwKpj9dGXUaxD
         hG0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794357780; x=1794962580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
        b=gavT6zB7Ced+m1M9YKMM/kNgjiLYaPq+uP27b5UroESrfV4Xa5ZkNdowfNFEk2ENi1
         PzceXHOdyNXssAZSSblGmM+NpWL+pg3xAcvmrqVSYLWsR+ikPLvx8zZMZaKJdU4iutoN
         J3QwfRGBCtkqnfJIw9x2uATO8CXDc2JU0XLtdtYF2vVL0w7aoURQbeuEpixh5khgAt/z
         5dWtQc/KZTRtRB2hIYV9x0ntylJTqXM/w7CWGXpWN3bVfrp/DbPuOAwiXj5C/ulE37l2
         b6K9V4Mk5lQLPiBkp6/cU5cf8gAYrcT+FYDkM99pCv30n6WU5/c19JcFr7SmB9ErNX/r
         99lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357780; x=1794962580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3NqXZkZbKGw3JC6mkweYll+c++WAqjqo3wZC+1QKlo=;
        b=w+6xed9eQhEZFB2/ZLXcvmd+V3Pobugp+0+YpHKESbQUVlhQ0TMg4kDURxXoKKJcv1
         zfpqTJjnzh64kIuTiUBbT3Xi6Bl87mf/e39dkWtLUaRsax252QLEFmUg94NKKLyhpXHY
         5ns4I9bLy2P/nS2rbVZOaHqrZBLrBRTdej64US8H+JDclHqg2VGLtpX3+RYeRWFh8tLN
         VJHXchoTdbVZAcgEzGoCeCdfFeTVcbVO4fAD3YODFNOOxHIOzZLbCeGCZYRDlaptWtn0
         8d/5VrV0dsP0d9lgIBilDCop6h2+tpgU94hwhiA44QVGLl7mcsN4dIVjbfR+dsXHPIQ3
         FfRA==
X-Forwarded-Encrypted: i=1; AL+hErF74dKb3Y0ET0Pdjos2ar/EtgYuoaGBwPtjB/DKloybrHAiLzYEBEdvUvPqQyLJ2+xCoN02cNTrrH2bR7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OnWF8xkTbgX7zj9P7lm/xcEn59I9xAGDpw9FxRhrcWwlMkQ5h
	hRG8pQIjLfNq1Tr88gYKPQ6xgil7jNNo+DhZ0ArwpJPddqf09b5V1jRSMVStX1bDz+yQcc/R6mN
	oOe1PWjIv2i44tCHv6uafazNcXGyp+qAEjWoiK7qA
X-Gm-Gg: AYBFou18BXMPsRjIZljwBm0WxlpN6ZdEU69i+51JMsn/zfNn+5at+CHzB//aC3e4mKF
	SGq/ur9v7FJ30yAtLN9KmdKh0TscFbuKY9vkhX0kybj3roVdhBrNosp9etWKTDnlmJogYNyeNoo
	qwdjf10QkfWPFxxi5o4JMcMwOqcpMQdh53RyzfAMKWG5oyngwWs3GYE2X2CJGgIHM/bXVPasZDa
	zgCSl0sRFzb+lvgyrtr5UlTRmWPzd/m7fY4AmOsVTMVR4UOxAkKghFZsrs/lIEHNGEJWE4Mweh2
	1s1xNR2bxxbapK9Ln0o3f/isdjk07c7ovij0NlJbMk1HuSpSE42BRN3snaTRh+GUPXYUJsd0Yrc
	2JsPCkp1Oi0qIOSwN7TxThwMy7QzXkShgiC2PWCSDLwUHlHmiz6R/jseKTJHRHLn3r/PZ6nVr5k
	TJk2SbowE4N6lZ
X-Received: by 2002:a05:690c:3181:b0:8b0:d468:e9ee with SMTP id
 00721157ae682-8b3a816adf0mr6153587b3.72.1794357779171; Tue, 10 Nov 2026
 16:42:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028214534.1919398-1-song@kernel.org>
In-Reply-To: <20261028214534.1919398-1-song@kernel.org>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 10 Nov 2026 16:42:47 -0800
X-Gm-Features: AclHuK-0KLQUOFaipVD5nVJPEq1dS14yAA31ZsSQdOg065mPf1YgIqvWrXbDoNo
Message-ID: <CADBMgpzvSnbu+ZzPYd5_d5Hx+1d1zAyU6sk27EZ0tnH7_JGMdg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] klp-build: Fix dependent patches, add selftests
To: Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:45=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> klp-build fails when a later patch in the series depends on an earlier
> one, because it fixes each patch against the original source on its
> own.  Patch 1 fixes this by combining the patches into a single patch
> before adding the #line directives.

I'm curious, what is the advantage of using separate .patch files?
Since patches can require changes/conflict resolutions for older
kernels, we commit all patches into per-target-kernel branches and
generate the .patch file on the fly at build time.

>
> Patch 2 does this while validating the patches, before the original
> kernel build, so problems with the patches show up without waiting for
> a build.
>
> Patch 3 moves the patch processing into a new script,
> klp-prepare-patch, which klp-build runs.  It doesn't need a kernel
> build, so it can be tested on its own.
>
> Patches 4-12 add a kselftest target, livepatch/test_klp_build.  Each
> test builds a small source tree, runs klp-prepare-patch on some
> patches, and checks the patch it prints.  The tests compile nothing,
> need no root, and take about a second.  To run them:
>
>   make -C tools/testing/selftests/livepatch/test_klp_build tests

Ran these tests and they work on my end (applied on v7.4-rc1).

Tested-by: Dylan Hatch <dylanbhatch@google.com>

>
> Changes in v2:
> - Patch 1: describe combine_patches() without "refresh", rename
>   fix_patches() to process_patches(), keep the combined patch in
>   $COMBINED_PATCH rather than $PATCHES, change the status message to
>   "Processing patch(es)", fold get_patch_{input,output}_files() into
>   get_patch_files(), and keep tmp.patch in klp-tmp (Josh)
> - New patch 2: process the patches while validating them, before the
>   original kernel build (Josh)
> - Replace the --patch-only option with a klp-prepare-patch script,
>   which the selftests run directly (Josh).  The intermediate patch
>   without #line directives now lives in klp-prepare-patch's own
>   temporary directory, which is removed on exit.
> - Make the dependent patches test a case of test-basic.sh (Sashiko)
> - Name the selftest helpers and subjects after klp-prepare-patch
>
> v1: https://lore.kernel.org/all/20261017002441.716615-1-song@kernel.org/
>
> Song Liu (12):
>   klp-build: Fix dependent patches in a series
>   klp-build: Process the patches before building the original kernel
>   klp-build: Move patch processing to klp-prepare-patch
>   selftests/livepatch: Add tests for klp-prepare-patch
>   selftests/livepatch: Test klp-prepare-patch with dependent patches
>   selftests/livepatch: Test klp-prepare-patch with independent patches
>   selftests/livepatch: Test klp-prepare-patch with patches which cancel
>     out
>   selftests/livepatch: Test klp-prepare-patch with created and deleted
>     files
>   selftests/livepatch: Test where klp-prepare-patch adds #line
>     directives
>   selftests/livepatch: Test klp-prepare-patch with unsupported files
>   selftests/livepatch: Test klp-prepare-patch with patches which don't
>     apply
>   selftests/livepatch: Test klp-prepare-patch with offset and fuzz
>
>  scripts/livepatch/Makefile                    |   3 +-
>  scripts/livepatch/klp-build                   | 137 +--------
>  scripts/livepatch/klp-prepare-patch           | 277 ++++++++++++++++++
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/livepatch/README      |  16 +
>  .../livepatch/test_klp_build/Makefile         |  26 ++
>  .../livepatch/test_klp_build/functions.sh     | 149 ++++++++++
>  .../livepatch/test_klp_build/run-tests.sh     |  68 +++++
>  .../livepatch/test_klp_build/test-basic.sh    |  93 ++++++
>  .../test_klp_build/test-cancelling-patches.sh | 102 +++++++
>  .../test-independent-patches.sh               | 124 ++++++++
>  .../test_klp_build/test-line-directives.sh    | 175 +++++++++++
>  .../test-new-and-deleted-files.sh             |  94 ++++++
>  .../test_klp_build/test-offset-and-fuzz.sh    | 120 ++++++++
>  .../test_klp_build/test-patch-not-applying.sh |  73 +++++
>  .../test_klp_build/test-unsupported-files.sh  |  30 ++
>  16 files changed, 1366 insertions(+), 122 deletions(-)
>  create mode 100755 scripts/livepatch/klp-prepare-patch
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/Make=
file
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/func=
tions.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/run-=
tests.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-basic.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-cancelling-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-independent-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-line-directives.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-new-and-deleted-files.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-offset-and-fuzz.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-patch-not-applying.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test=
-unsupported-files.sh
>
> --
> 2.53.0-Meta
>
>
