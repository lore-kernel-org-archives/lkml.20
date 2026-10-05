Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8444AB8E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191360; cv=pass; b=r6Kkqq6h0ELCyNrZGsCjiyYyekj6B6nMvPoQRWUNfuw4J/fJOkna2ewxTfuQ9F5BglSta1Y09gpHM/nhDOFsrst62qP5gk/9PM3hjILNkKaQ2DQ8QM2Wp78vVLwPcprkSR4sRn9okAif0sFtiLNeGbMhu4U1ofNOcqLNKo+K+no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191360; c=relaxed/simple;
	bh=Pg3fz4PNkRiCGc9O+mF7at92p5TplzPaQRJoEH/LflM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ra5qa5ETBCNd+jWR2Jhg3OxWG9uDLqj9vz2CB67pSIPUc25D2IHW7PUgc+2aacLDlJ1HaY9KPsCVewUECEPyi0gJ0iSySTsSSrrysAqSwlA0f3iHlujIAS0kWxKqDbbw+JXlOHf1D5qzeuWKP5uLmY4lN8ZiGqV2ZhmS85fSz3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mxg5srN+; arc=pass smtp.client-ip=74.125.229.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mxg5srN+"
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so184221c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791191358; cv=none;
        d=google.com; s=arc-20260327;
        b=Eub6MdwAEfox1mUWWs3AbvUsml8J29FbKE1hk7KD6jrSi8iPw9HBMM19A4w8K6iGDG
         bANCOBIFmHlvPmJHOO1OmZ6jp4q9EsdIjo2zmip5gzXYiS/nvCo1it1ARw7prpcKp1EE
         /DCZVgP3RkXag7DwmOQ4hKXo2vr/FtYBFUY4Ctx6XjSjuqefQRFdsxf19n5ThtcuE5V/
         xZ3jVtOuMJoY41D4jrzIbl7Hts73SCLGCQ65MMnnMqBd5OtmnpowVh2USk5gCVDS0SbR
         cgSZHSPoGVUNse8BbAD4KQzgMNCPTX2VpXXzlPHMXnxaXQfx24EYAvElsiNgIURi5Nqw
         Vymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Duw2nxZN8kxbqWipjB3kgCvhqho4PD5wPOWTNu1vMgg=;
        fh=lda34ToGeGRHec9JhXU7+DbXVCgBcC1o5vhiWY2R/k8=;
        b=rY8SO+EkI2eAB4finRSD76bSf1lAa2vmuiX2/ydLIEsiLIwmb2mRGVF/FqI2KBsdau
         sju57q+Aeu304KA+totdjcmxXpJJgvgN/itMjtylLKnZHaV5zm4MZ5BqnI0cdRhuJTtV
         pw27n2BEczJbKSBrM/CbzReijtP7z4vbOabyAOJrHwT5Cmog3a8sY2+GHppa3Lwchco/
         OicjjRI1MtvUZhrK/JlCR+FJ/NefbfFiAoJMtK2sq5S5weh/F77AzDX+mfO46PqbQioD
         37Y6m+yBxW3ddzfBipwtsYjdsGP/iF12Z54H79dJ7pc/ubAmXiIfFsy5HA7H/hgtiNP4
         VhvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791191358; x=1791796158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Duw2nxZN8kxbqWipjB3kgCvhqho4PD5wPOWTNu1vMgg=;
        b=Mxg5srN+7sS/ZVlUtug/gEXsF43wQEcqFuqSfqHZGy3dm3MoNEvDzf4pC2oLo9uc7t
         LNY4JL/RirtESuiatR65kMleV92vGlaLchXGHOD40vns8YELAcVBlpnfstdjkdkFn7An
         /b/wSTGStGlYPk77qbeV1LXCjVWXuRem7Au3PNJoF4NksLDGPb91YbJ5oKGM8mdJKllz
         /7dqgcFimcTKNSA/NsamItP6amYaQ4wRK6GuhkK631JjDKL/5dyAMH+ITsCIs0cite5h
         P98DfUWuHgPh1Ksza3BONdhqLzD1O0p7h1CxkwuuW8JhOUgJdxKxwFTY1roErLFk0wlV
         dxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191358; x=1791796158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Duw2nxZN8kxbqWipjB3kgCvhqho4PD5wPOWTNu1vMgg=;
        b=szktM/KLDT59rUBZDJhtswK4QAFCvwPF8KK4H4F306Eo9h3mkxIx03ORw0pYvpxTBD
         k2nYktygDKPg/GHbuvRJ6NUCyskhhOY55ZJlBeDBAmnDclEiQo/LLEeQyPlXQMfre0kC
         whJS6iMuwahZt4sZt56c8Cp9pbtir6LBsjRd19B6jIoRLxi2Bc7WmrUHOYRr92lsxrZy
         17GNwImrFoePGUgAc1nnCG6lmaaX7WR6ZWBn0zw+M+oe+SuD6Ia3B9XzrY1lDThpBcNc
         jB2xsc+XX6ENy3buuNLU3xwicXsiiH2VTKuQloA3GWShGTvSTd6ifuUalfDP+omtErFT
         AsLw==
X-Forwarded-Encrypted: i=1; AKwUvBxBlNLwHvAqFnrKEDcK3Rq7hsgujQyAfEune6BqFWSo7l5k6Pa4af/rUVYCcpX6LUAhzgjjKLomb2U+X80=@vger.kernel.org
X-Gm-Message-State: AFuF++n3E2TlIXPtw9okV4b25hATLZGYO23xGK2qTmzoheP+sT3Qmz/A
	63Cpn3g3brU0sWmY9+KdTIOtc4CFO+aGTSuvdQjcUYzggS9CVInOjvKK6D7kn0kR/1m5yRtWFR3
	vjepPLGnRkZcJhJTAsXwD2ifYOikISg==
X-Gm-Gg: AYBFou14raUQpcxNi9SYgPhrllI3uvoGFvw6uwYGDUr7oG7cGuGStGPqd+uC36Jv1C/
	EBlQJ4Lo+oZZGG+NNUqj/rdhtNjcdxzS54X08KdPTEC/P/xcCFpMhVr9SSW+KSTJQkWTSXV0Btx
	pOkh7cBuijsdPf4W8YAwJNSDD0p1n+sJAog6+kNKdDow02ZveBRklWruADBVi4CLjL3cilpgp3R
	BvoRWEP4XR67oyGh2kYscNEN1ahSJ+0YTxfbfK8m4yJRcjw0QHyF2aTNruuW3FOUA5MhYZ4dIJu
	SsqY6zpBckPMv9ZOyXA1awvv5w0SWFfNeFxnMAaxHyZ7h1Qk/6zO57CQmeNgSzMT+yU=
X-Received: by 2002:a05:701b:4583:20b0:151:ceb3:e105 with SMTP id
 a92af1059eb24-151cec32443mr9674795c88.11.1791191358038; Mon, 05 Oct 2026
 02:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-2-0f00417b41bc@gmail.com>
 <20261004083036.613169-1-kunwu.chan@gmail.com>
In-Reply-To: <20261004083036.613169-1-kunwu.chan@gmail.com>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 5 Oct 2026 02:09:05 -0700
X-Gm-Features: AclHuK93ndMC4ovSjSP_cU8HjtSfyaChQiTBQ98ae5wltCXWwtXcA60S-czM1oQ
Message-ID: <CALa+Y17BOR0DBLS9-vns2SQfRhCueT0f82XCVojHhg9uacOX+w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/9] mm/damon/core: replace the access report
 buffer with per-context rings
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, Wei Xu <weixugc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kunwu,

Thanks for looking into this.  Yes, in v3 I made the drain raise
nr_accesses once per drained sample.  My intent was that a region
receiving several samples in one interval should show a stronger signal
than a region receiving one, and it let the existing access-pattern
schemes act on the samples unchanged.

> Unlike page-table or page-fault based access checks, where an access
> report is generated from a deterministic access observation, a
> hardware-sampled report represents a statistical hardware event whose
> frequency depends on the PMU configuration.
>
> For the same workload, nr_accesses may therefore have different
> scales when monitored with different PMU sampling configurations
> (for example, PEBS at a given frequency versus IBS with a different
> sample period).

Agreed, and that made me look at where this information belongs.
DAMON's data attributes monitoring already keeps a per-probe hit count
for each region, probe_hits[], which the probe weights apply to, and a
PMU sample is exactly such a data attribute sample.

So in v4 [1] the drain no longer touches nr_accesses at all; its scale
stays with the access check primitives, independent of the PMU and its
sampling settings.  A sample instead raises the region's probe_hits[]
count, at most once per sampling interval, the same per-interval bound
a probe hit has for the samples DAMON takes itself, which keeps the
count within the samples per aggregation.  The meaning differs a little:
DAMON's own sampling tests one address per region, while a perf hit
means that at least one PMU sample landed in the region during the
interval.  To act on the samples, a context sets a probe weight, which
puts it in DAMON's data attributes-only mode, and its DAMOS schemes
select regions with probe_hits_wsum filters.

> Should we document this distinction, so that users configuring DAMOS
> schemes with nr_accesses thresholds understand that the value depends
> on the hardware sampling source?

With v4, nr_accesses thresholds no longer depend on the sampling
source.  What still does is how likely a region is to get a probe hit
in an interval, so yes, that should be documented.  I left the
documentation out of the RFC until the design settles, and will cover
it there.  Since I was already respinning for the v3 review, I folded
this into v4 so that there is a testable series before Plumbers.

[1] https://lore.kernel.org/all/20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com/

Thanks,
Ravi
