Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794344066;
	b=sPkSlJq+9lsQ90sCpSDDk4Myye8Tmvl5CHd5OSXM6mPQifZyrX7BMdRrhWPo+yn+nfhq
	 dy+s79fkjbEb0M+y+JIdu4OqiP0FUjkwOF2MjxbNpmQ7SjO36W8bbT0w4BukjhBXyfQ9/
	 fODhxaQkFYyqrIq5elvIqFDCRpqNgaiKsNElS66ffkhCKBpPALNn+gnEDkW76cX9JAI4F
	 DqHXv7M2PaIs2Br+FZ7vP0tUFqbsHif2pMzz7iaRouJLxFkA14mrnOscw8x0TccED+ikv
	 BayNTYUIw1VwLBtxPlM8OI7Lif22smFDziy4BE4p5JLxYHnP7xWc6uaywdjodyCDP+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yvRZ4NPr9zuipnBz8AO8lnblNbdj7j1u7mqaDBMXrDI=;
	b=c/6aDDfQ6LBroRXdzLYSbSDPXYy3mU9RvQWSBRmCkst7w2FQyT0SKyD9n99I9UwXYdLj
	 l4CpXTw1MOPZ0+eWwTyiQraSUTIiwxU+REijRfdTrufuGMMRRxSqnRepSkgkdbYQELxHX
	 77MtLQMNbJskWlxQD3vBPKfXgPOqrp71PNG0kymeozq/wKEpzf80MFzBSDBhULYEgA2XY
	 tUsamu28we9/FIH/r8MMz284OiqUBopjAeFLfbPBeOrbViBc+43TKnneKLwvEEknaq05/
	 t3s1ClYuw3j6ZzHlI+NMh4AC7yDEEfN8b9cUBMWwkwL2J14vEK+vRswo/sK1EOfiuuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HqLXqdjG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HqLXqdjG
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5383c97c8cfso2131cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794344065; cv=none;
        d=google.com; s=arc-20260327;
        b=O/OdFJucolgVT6+uWR8Ax+6d5qQ3p2XPy2Yn1ssWIitTvSdrByF7VoBZVmqT6iCSYk
         F9NmVdSswkLpT3Si/nFKYYe2y9/jpB71esfLmnu2CO1iWVXiW7pLPDb5fR3JKGj1PFrB
         72Ajf0XutHfiC+9EqH3EFW/9/XPU/Ur80jPGbDeqUcaZb59qm3hcZ9rFaqIm1DcAojr7
         zxZYIf5fgudMMxISO5Gnr5Ybw3CJ8HZ8dhVGaTL+e8X5DAqr7gc3iNtd8PatV5J3hIEu
         Gywd/UTnxWSvR04Un69R+oy/Mnb1C7Eqa6WDyxBB8yNVjXM/gfeKObwFafnN2nVD4eCQ
         e0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yvRZ4NPr9zuipnBz8AO8lnblNbdj7j1u7mqaDBMXrDI=;
        fh=VjZkbxby20w4WO0JtQq+Pk2aZGALnmduQkzX2/d/T9Y=;
        b=Uit54FAMvWpophjH0gvpaK22JlIrXv3mJF+J4fjUj/i+B2GH5aDoRImHSiF7q1abcz
         dBFM38PYM+O35RkkBpkJz+0jAu3URGKZd2de0yFlRPkn86e8/J/omeTw3j3CjUDs4r/F
         2x4pi3Sd4uP4QkOqcwAuTQnQ4tONx3k/2pP5NSr1PbNiSGqd3c+qNH35NGriyZqVnAhL
         eEc5g92CgS4bOniT+0k/UJkRBlBoMxAzglEhcE6HZlH/kodKjMebIao0ytdLyjKvV6nK
         DECaE7cTotq8O/kn4WLC91aryYpxJtIQ8qPWP/MLdmY+Wk65ajDtekHqOsrmI1bL6tgT
         gMyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794344065; x=1794948865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvRZ4NPr9zuipnBz8AO8lnblNbdj7j1u7mqaDBMXrDI=;
        b=HqLXqdjGksHj2xeUYspVxQBvoaC9CVLusThXKKPbIhlRo/gE53F0SPzlbtC5addZH9
         8CL75IL2O9J2A3rK6XMfkZUcGBzoS4NJY474L3AVCdOloVTOzoqNoXcy7/16LbSFge1t
         QGx9OqAbTL9eh9Tl7GdxyrOF9tYRxpktqMpFT+vTb06UrdCsFb4lbz1zfcx1Zt211TKQ
         l+Cp23DRHWvdoChdc9RyvE0TAsrKdpnNw79DTP2dPFILh30y8jtYgHROQ0znv5fZVZ7f
         StsbPmg4q9F3AmH9NkMz8U8V1NyYp05LFIFxp4WJ80El6jIriIllWz6zCEf5WSnEcEVs
         XE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344065; x=1794948865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvRZ4NPr9zuipnBz8AO8lnblNbdj7j1u7mqaDBMXrDI=;
        b=hXEbqmaqH3BAoM8NJgBm28k4y5Jw+T9R/40utz4NHLVgMAvHW61pP37oufumiEIpaC
         X5qVbwhH6ZqxQivbWafyDAa/i9AWrdx5MTerDHxjhmPHR4+OpPVG8ISmBdxbiRn9e+HS
         qmVWWz+r/ZnrdI5awdOHGMCTzYyMT4KHxYicKO0t5oF+6+B3TLlcTtn376w6It5adtPN
         xEsb6tAQOy9XeaOWX9kv9B3p+f6mb5jD7RyEIttugniW2hS+POBpZlTpdaTL5T55fOt1
         wAStMzoKEWuDix86PjyJZXH6i/APSdQYrn29SMzTf8UxTRSwnkp732c5FWLaVWlzrqVc
         q5qg==
X-Forwarded-Encrypted: i=1; AL+hErHqzQ5fp83y0XQV0q+PWn412P40YHNw8EjJ/hEgvTUIvZ5Q1l5zqNkQnfG8D9ERyoZxdttPtf8f+lh1aWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cFLdictsMDbYLrXXOvLrPip8p3tWRIqxzAj5Nhvo/IMhkw3u/
	xwKojfM1OJZmTwFlhz2e4tpXYS2eK8DYPtk6rP0j4+Tc8daxbULftdlE/4nB8Iak+x0vBVYOSwe
	Wd9EFgciFTna9b3jWPS81zw7Y72ola1p1bHxcXyEm
X-Gm-Gg: AYBFou1nBmENR9NhWhYGoJqf8ndFDN0SIFSsWG3zbEwnGguEHTInxwDV6J+H4SB6RmK
	GcphBE1QBPRevnlwS6bzb5XWIW3NLHHrxZSTgE99DrrNCDQJnu7GIBJXX3D7vopZEOxo2+W1bPs
	rV+SRhN0jr6UN315RpYkdvdLaucrs+W7e9n+urvv/zEsp9ez5xiafhqn72YlkDZLgDi4+JOw+Rx
	mktdj4ELn1oaMVOknpJRt4XBptamld/5VaBI224EFO1emyHOe7MvilgcR10XHvhbq44bZxShcNs
	Y84HJ47ZSSGfdSzi1Hg3hsitMlouvD1AgMDCQekudFkz2iuCEUOYtHrOP1+u2a2uKuECKpkvEEO
	s2MJuin3UMcnSdlNGGcD+ezFsV3ESFPjqfpqEBHJdjQqP+6h8goZnPKBkSNNLy1fxIpo=
X-Received: by 2002:a05:622a:4c8c:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-5569edef00fmr3545561cf.3.1794344061730; Tue, 10 Nov 2026
 12:54:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104043006.1199857-1-irogers@google.com>
In-Reply-To: <20261104043006.1199857-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 10 Nov 2026 12:54:09 -0800
X-Gm-Features: AclHuK8u7iu3KreUV1BOly4WRgYcjdLxbePAeQ91RkjuMYcADS4FO3F63l0qY-8
Message-ID: <CAP-5=fVJfHEt1NTJg43tyGoQuJO4AgBaHzBZQHN9fqPef7i5=A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] tools build: Fixes for libbfd -lzstd dependency
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 8:30=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> This series addresses build problems when linking against static
> libbfd/libopcodes on distributions like Fedora where binutils is built
> with zstd section decompression support (requiring '-liberty -lz -lzstd'
> together).

Hi,

Namhyung/Arnaldo, could you help review the tools/build and tools/perf
parts of this (patches 1 and 2)? The objtool and bpftool changes have
Peter's and Quentin's tags.

Thanks,
Ian

> In v2, commit 89d001d48ec7 ("tools build: Add zstd to the binutils
> library feature tests") landed in tools/build/feature/Makefile at the
> same time, creating a merge conflict and only adding '|| $(BUILD_BFD)
> -lzstd' without '-liberty -lz' or the corresponding
> libbfd-liberty-z-zstd feature check in perf and bpftool (so even if
> test-libbfd.bin passed with -lzstd, perf and bpftool would link only
> '-lbfd -lopcodes' without '-lzstd').
>
> v3 rebases onto perf-tools-next (v7.4-rc1), fixes commit 89d001d48ec7 in
> patch 1/4, collects the Acked-by tags from Quentin Monnet and Peter
> Zijlstra, updates the LIBOPCODES_LIBS comment in tools/objtool/Makefile,
> and moves the AI assistance disclosure from commit trailers to the cover
> letter.
>
> v2: https://lore.kernel.org/all/20260909204122.1993010-1-irogers@google.c=
om/
> v1: https://lore.kernel.org/linux-perf-users/20260909181030.1870496-1-iro=
gers@google.com/
>
> AI Assistance Disclosure (per Documentation/process/coding-assistants.rst=
):
> - Tools used: Antigravity coding assistant and Sashiko automated patch
>   review.
> - Summary of prompts and assistance: Rebased the 4-patch series onto
>   perf-tools-next, resolved the conflict with commit 89d001d48ec7 in
>   tools/build/feature/Makefile, incorporated review feedback and
>   Acked-by tags, and verified with scripts/checkpatch.pl.
>
> Ian Rogers (4):
>   tools build: Add explicitly sequenced -lzstd to libbfd feature
>     fallback
>   perf build: Add explicitly sequenced -lzstd to libbfd feature fallback
>   bpftool: Add explicitly sequenced -lzstd to libbfd feature fallback
>   objtool: Add explicitly sequenced -lzstd to libopcodes fallback
>
>  tools/bpf/bpftool/Makefile   |  4 ++++
>  tools/build/Makefile.feature |  3 ++-
>  tools/build/feature/Makefile | 19 +++++++++++++------
>  tools/objtool/Makefile       |  7 ++++---
>  tools/perf/Makefile.config   |  3 +++
>  5 files changed, 26 insertions(+), 10 deletions(-)
>
> --
> 2.56.0.385.gac671c819a-goog
>
