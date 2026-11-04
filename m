Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793764347;
	b=J8hEWTbjzF67DGgOeTPl6l2aJxZuEC8zNPbu+Z66/7AsXAUKxDnicC9wGtsDvtxCauwy
	 Ar7gwPQITEtARsMKrwAtlhqlEhtRJ2oPqGMN0OQaw9fS/xe9xYwwoJM6K/Vz88rBaRAV3
	 mDQeeFRR6o7rwQyNxREYnQI+twUSEBxUJRX32p2imMYXBo2eDoy0JoCboCs9vg2CzkYii
	 K/L2kZ9DxE6nAZXVDq7mqywQ1TU7vfF4/gylIpLpcvzBZ6u63OYqq6ifOT2J5X7XaeDTe
	 zDOqKAO8VpJIiGpCa/tEnkUY+Mwrr9/Ry+co+dain9msN+vbaDn09VD8Ed/fGcpKJwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/g2fOuDzTYwvHEhcFkEd8PhDWXPMHGDTGEwN2Grkr/A=;
	b=SM3wSy0wgspzV7Em9zpImMGOfmzpTmwdh96rGozC1npf6c5aPS20uszNpOqiYKBRf8CN
	 4XJzNSdzhkIyE8Xf0lcZMsvCsyQk+OZFlfB6meG/XZjWW8/uq6EYcAA7csSxCDdb5YErz
	 JYprsESh65bWkTgxbXGiJSA29QXJA2qHtf3gY7Hu6XT3mCERsNiFIJa9mgnmdDMsP4S8v
	 39CwMRrepORqXiWELJP+BFyYXL/fo2GxstyBt6pFnXBfKS3uu+epAwGy5p3I4fx4Z6ceC
	 WMOUSjClHQgc2sokIXEL1cE9ecvRoNUGoMnl+ATBFWE4MoiTBeBESmq9nB5C5JYt3KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eafGwUUQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29E606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A29E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eafGwUUQ
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so155301cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793764346; cv=none;
        d=google.com; s=arc-20260327;
        b=fWTth+y7vktszX+t9+5hTYLfO+U30hfZTbT2wgvKOU2HIJU0KR/pXITqOEl4aACDXR
         c5MhyQQ9d6zIOhoctagKz848R3LxbWMSIff5l1u0dX1A2bm8JkVEGDjeWLUQQQOfp/3e
         GSf1VXTZhnL+iFCQ+WnI5Y4hF3b5jeB/Rrdiol/BUXoqfR4y3teRX3qj98iZUZxc4CeN
         9xuKyyDiB0cZEplgET0z7OYuSN9iF2DFbv5R9+ZMi+d7qszEVc4gtfjjSSv2U7MNwcqG
         aKY6ISRUuWXXa2KAaJUNpGtbQnCzghIVFlQm+U0LpNG2/uMkPa9X/GV13JcpbWVbjO/2
         ghQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/g2fOuDzTYwvHEhcFkEd8PhDWXPMHGDTGEwN2Grkr/A=;
        fh=mzW3m7tQrsPS3/11xsxiXX8VIDOa/CKrmn/PAqdAZss=;
        b=EJgR2pqcZKB9TRZynUZ6tl5i6qjpx0QrdEbiaiyn1uC2OniNL5tuKPoAEpgDO8XRnv
         gwJ22wNelM0dAqkoiJH7WnlXVp3z5wv8O24EQyyAF6kgU1Z6/NfPpBE4DP4ilTeLzeoV
         tyUrzJ4wSbzlvKDuGbTEnumZj7YkEW1OJ8N5jZWt0VffgVb/VQIqIaxzLCJ95kbjAUfb
         2T7A6zWkXY53TwBr5LPujFtRHBCM4qXqyl7gAQmFNhxVPdfRFMlx9Mw3k5054Nk/r4bz
         n//aVDhIiXfIwJW4Dkp6nsE9LktdWyt8IwbUg5gxHDJ5/4vhSiUbwcRd91NHDIodx4mW
         cCMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793764346; x=1794369146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/g2fOuDzTYwvHEhcFkEd8PhDWXPMHGDTGEwN2Grkr/A=;
        b=eafGwUUQrFhEpLkjWbnoV1L0W756BjRTAxnbCJIHH6B5QpOy7wizi7SLRV1ggPRlVe
         FmoWLWWlePArboThc03i0s25BRjZUVIMGvRIh0hufaxqbZbZzHZjiXuRpnA36R7MtXxW
         /k6233OeiDqADpAJrYrjyqvMyuhq28pvKwW9U4l+ywg5YhCze45Lb2DQC65sOzB6AkkM
         1wB3ZxKztom9FztBL5DfDCemrJwNRTAIRF/CdiAZJxZtANbVLCDN0I/mMuHuyEUtY6jF
         Bi8G3K5ykli/dwkIxVsARiRcWFL21oZ4g08dbs0nXwBLlcdbujs/tFDm5AOds52Zvh1/
         REEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764346; x=1794369146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g2fOuDzTYwvHEhcFkEd8PhDWXPMHGDTGEwN2Grkr/A=;
        b=MvZ2tWXFqpCEyq/GTH1NGbHfS0hV5LmcOFrZnhE56iWOIMfkXK+3QEAIJrlBLv7AuO
         BUXhAopFJk29IGFNsasSrZeh4ZjHAMeLT3nv97CYngDCBtNY9OVmSy+egdXqJyzqBuyR
         mNDQPAHU6Ox7xBsyZdAP0NObaXyP1ED7WjKqtFQYz2uxwFnYzHpP29+AihOHDfIXP2K7
         V4G3zvvUzJXOY8hRtaRGBPLvityxwRxNUCQ9VgUvzHdDbe6dJ0smsGADwDgCV/257jVB
         y3DJAkE5dDwfFWjNs90fGwhcoa1SFlsLDjxWEFM4ZoelpnyrJMsEw274HLVoWWVgRlYe
         4Imw==
X-Forwarded-Encrypted: i=1; AKwUvByGCZBSvTF99vQRE12SyttoITBnt2JW0K0//BZFxijwLufbAMEu6CXh/ucyu/rGrlUOCeFMXelHwz+2oeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wFAyUH9b1zr4dcC4NqjPr8GBD2aN/FEuWKqrCuCZYmOSNC/VB
	BCpoIMCLWVTFoO3+WNLXYZb780TEIW+31pHW79wEVDRjoNReKky8FJITKMrI4eUOM+tczDMHjLT
	+R7iX2q9JhE4ukCcNraCnUnykAJPu4vc+K52A6Mhb
X-Gm-Gg: AYBFou0SGWbg8IgLenvsHknyNdoThNsNUzFlTKCmNhDtIK/OWihHbXyM+fSX8vLh/uJ
	ZDmyd7/yznUo2iQ2Hl5WLv7jTb1svfTQWUwXDm9z5F6BDN3NVjRyIWe5lXMBIjrPLCBbVCwgiw8
	QmECLa9iNFg1Yip7CaV7fZ7T9zUe8Y1CSqRfHAhJomewXBBmLJcyNEyN7ChZESb76MfUkJig0Lc
	URrDFjTKFbGH3yeJhJOfLh0rljp6KAYw96KF6SPUSHYQ8uNg4g8H28AOHZgtwnjLnpD5mjnT9B5
	jLBf1w35eFKna39CcX6YJwuRDM2Yewwod+1waPwPSHQyo0vXlNK65rbKQJ2AVdhWad9+iEZUWm2
	x/b+qhJhLW5LfRFd+UeVokLrRJvsKT3lhIAW8ew==
X-Received: by 2002:a05:622a:618b:b0:536:3d22:fb83 with SMTP id
 d75a77b69052e-54b869b4baamr3521871cf.13.1793764345554; Tue, 03 Nov 2026
 19:52:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013231430.2163505-1-irogers@google.com> <20261022204627.1813821-1-irogers@google.com>
In-Reply-To: <20261022204627.1813821-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 19:52:13 -0800
X-Gm-Features: AclHuK8hlH9H6wxsJLQi9dS0KEfV63lJxJUbaBWyywfSEr5o0bpezg-oHDXNyWc
Message-ID: <CAP-5=fXh4VD5bimc-pEezOJXLRX-pYHOzx9j=sFo0VRiPgsmsQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] perf build: Support building BPF skeletons with bpf-gcc
To: irogers@google.com, acme@kernel.org, cupertino.miranda@oracle.com, 
	jose.marchesi@oracle.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, eddyz87@gmail.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 1:46=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Currently the perf build requires clang (>=3D 12.0.1) to compile BPF
> skeleton programs (.bpf.c -> .bpf.o). bpf-gcc (>=3D 14.0.0) also supports
> BPF CO-RE and BTF generation and is already supported in
> tools/testing/selftests/bpf/Makefile.
>
> This series updates the perf build to support both clang and bpf-gcc:
> - Patch 1 updates Makefile.config, Makefile.perf, and bpf_skel.mak to
>   prefer bpf-gcc when building perf with GCC (CC_NO_CLANG=3D1) and clang
>   when building with Clang/LLVM (CC_NO_CLANG=3D0), while respecting
>   explicit BPF_GCC=3D... or CLANG=3D... command-line overrides and fallin=
g
>   back to whichever compiler is available.
> - Patch 2 adds make_bpf_skel_clang and make_bpf_skel_bpf_gcc build-test
>   targets to tools/perf/tests/make, reuses tools/build/Makefile.feature
>   for feature detection, and verifies with
>   'perf check -q feature bpf_skeletons' that BPF skeleton support is
>   enabled (or disabled for make_no_bpf_skel) as expected.
>
> v3: Reuse tools/build/Makefile.feature and tools/scripts/utilities.mak
>     in tools/perf/tests/make rather than open-coding compiler feature
>     probes, and explicitly check for exit code 1 from 'perf check' in
>     make_no_bpf_skel so crashes are not masked by shell negation.
> v2: Pass only -dumpfullversion when querying BPF_GCC_VERSION, guard
>     against an empty version string, and fix version-ge3 / version-lt3
>     in tools/scripts/utilities.mak so empty or <3-component version
>     strings do not shift awk fields and evaluate as false in version-lt3.
>
> Ian Rogers (2):
>   perf build: Support building BPF skeletons with bpf-gcc
>   perf test make: Add BPF skeleton build tests for clang and bpf-gcc

Ping. Just to note that the 2 patches are clean with Sashiko:
https://sashiko.dev/#/patchset/20261022204627.1813821-1-irogers%40google.co=
m

Thanks,
Ian

>  tools/perf/Makefile.config     | 83 +++++++++++++++++++++++++++-------
>  tools/perf/Makefile.perf       |  8 +++-
>  tools/perf/bpf_skel.mak        | 36 ++++++++++-----
>  tools/perf/tests/make          | 71 ++++++++++++++++++++++------
>  tools/scripts/Makefile.include |  1 +
>  tools/scripts/utilities.mak    |  4 +-
>  6 files changed, 159 insertions(+), 44 deletions(-)
>
> --
> 2.56.0.307.g5fe7bd680c-goog
>
