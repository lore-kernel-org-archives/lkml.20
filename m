Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809570;
	b=aTofdxPieyU60oe+Q26xgGwMPLBm1wiHDy4RTqNPakMz+8w73PLHOG8NjeZ8TykURtsL
	 vjSHh2YkTLcuMPsvmKtHK+hcCT6t6M3/xe3pks1pMar1X6yQp0WYgokpAtvNcVjF98YHx
	 Ue8/00pdI21Az8moLXZfbQCjKpqFYw7rRAiYUkx/oyVYqn94OZBy+DMG8TyKto/ewL+IG
	 8CghhIF/plQgbP92YQDO7wn7/Bumz1UBTWj4Y9GiYuzD6wgvHiWIi3xrhEtOAZHxckq4t
	 y7zphu2c6nxDB29Esa4tt41BwUUwxyB9pgGa7h7FjmpLbT8AsvPcV7uc8BsLDzIxAtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
	b=kZRvm6cwJkj9BKPZjJTRtij68GK4gWthZg9m+XVvrZ3YiBuDhrUeiMFKoKoG0U8rO9dr
	 ptCqvyjBQ5yKGUXQzoehBlqPP+LIHUmSo8dwIMfRZoSYZHN57FanPIYLuVYpdq9BCyxMP
	 f+ZxLlj5Ev1NZYuMjJMAHgt5Lk2fxSm8aM4wOlbBJaGmSYbZybd2DJbdPCQVe2qkE1skk
	 bpQ0SpVjKfAZjGHrUyNpEvSLXWFdlSeTwyJ7C7FDSeqdO1pqkIYXp/EJAip4CGqwCgfAK
	 eLXQzd0LDSWmXrmoMG2QBfwwLFzbnKNeNyWh078EjwadEe67mxdFBJ47rAndOP0Vffg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PkQndnVj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B7606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648B7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PkQndnVj
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-54492d8a988so355341cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809569; cv=none;
        d=google.com; s=arc-20260327;
        b=laGKmGvA4gZQRTM35pY3QXjMeeJDAHERBbfpDmhFOZU1LPuAtB3OBhUikkVwuO7DQi
         j32f3WtCKnnw5fmTxD4uQrnbkxWhAMw839oILW/jsq2gquYEJvj2Ru0BzfjYrh8cyteU
         qSkFgrIB3Pa6PV2+dipx+0teR2cGOcoS7QWQpT33C34VcoIBs02McNFYkmW065o08X15
         d/CgyqW5bM0h71+38NlNWAr6OdPTnXTsghpd6SQ/nnR/dY0I2l2m0t0srp28Ws8ScFrH
         lCWnDtpsebBVkIg/l+aN50433iJH5vCHXV8XNF22GG9KBiocyjmV1JBTpJZM/EqcuUhZ
         917w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        fh=yYkpt7l0qUxMNKGcpYTTh8qO5m1V+LIPpSopSHNZT+w=;
        b=YuQ+94mwWnRDKQ7DsIZOI722Bgh288tn5yw0VmSeSxVj5pigLyWtsPTML7a1OQRGxP
         9VsFQYsl0B4SiKypEJ6kfFaAsqVIQA1jJoJvaYEVKx0INalYqjaOj0STsfEaFLsuR9dg
         41b32FtGTX+3P1IQ01GeDx3TmwB2kD0xTWulCq+8uJp1YfoVd0B1RVT4oZQy9WCQYh3i
         I5uEWg4szS31lOoRQJSiC6+GFbQRdH1U0cb/KwQDlUs5LBxINrOhFHL6WzesoUJQKXfp
         iMuUjrkSZSY4wkSvgD/cmrKgpHQN8fqB3JoAzxLU99JwmT+7IYINaTXh9FTr3VU6kRop
         E8ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809569; x=1794414369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        b=PkQndnVjODxfjk8gWoorlSWxkVs/Yt5AWI09ReVaivDetcOVoiHlse74NWIkMgMaeb
         FO2aotMPrv6Lzhpa4STmuW3+HlnXlLkdo4v/bfjyhhO7kuZDShCgQwC2McSN7nSDbAnA
         ON0bC5dM29QNnL7HT0hpEhyAa2qFUgX+11YrSQQfiA2PV0W+vrOCmGZ+W3X52hDqBOOW
         /QpB4VOrYkjQC4GFqDPnbDmu7Kr4n3Bz1vzOx9XcoZrrt86Uq+8zP5948IA4yQq0VNIl
         8ehpcuEVERdPPEspxAeYIMQj+53DYvfn9JvKi4J1dhamhRs4yXIXU4g3G9VZWSm3UdiX
         dHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809569; x=1794414369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        b=CyCLy01+pOdcUMeKQ/JaAxwjPwGLcLdDgJj9RdX6eZuyTZFapdGsum90aqoASJmBxP
         1QXL/TBe2OlfVWvyJ791lXwlrBhvgidbZJonh+Z+bYpfjQdEcg3dqH6Ud4U/s/yMU3lE
         29W390GNfoGSiXf3SDDC7B0u0tR5KQUtKGeb6Z80OGHpS2zCgdCByeGOKxn+u5cCjxPd
         IpMvdzozrLVrIgQBIuHVi+OxBVGgwniAmiqt+KxsULaYIzpE6SBX2nKxDz3vKmKgvpHF
         ZwjysywTkXCnpoE3RWIGnrp3XEgxtNpg7hIFLdP4JityST6UL84iPpKjqy2Y67NXCaY9
         g7zA==
X-Forwarded-Encrypted: i=1; AKwUvBwEmH9o/f9eMWIBmDhUvuHEOlOlguVRAvWIhrMRjMltfWRqzOXG9+5Tffim0Lhk1DCBp3WG8RmhBqNgEms=@vger.kernel.org
X-Gm-Message-State: APuU4Z93xPAgqypd4vGo7MUUTcDVdyPPrpBI8kFOHBs0scx1zRLnuhym
	WVoS6ngSLABcbKKPg4Lqfnu52YeTEuka85Sk01OCYaLQSiPbudCAmhaRsNsmcAy6ZYwYegv0nhl
	c421U3FClG2caMj7FKgIDxzI7JfI6/jSz9CvXGL8X
X-Gm-Gg: AYBFou1LAglvH3WaaYzCF3rb3m2kJoc/lMlFPae4gtrgEfnehM3z1jcFcHyszFCV8o+
	Kv1vjSfHh30i/X6tDRpJqG8+u6B3jnzhgSAEN8M3lOpKoV4LTAm1IZyPkUoPuD7s6JCHBUpDERR
	ml+7VqOuRvTcN5OxgO+1rCZAhRDUhlvZO/RlpySJ4E/6MxA40DeM5/2VegnZgsJCi/nN2yJ3o0d
	GIVzjjG33RTVx6zufp4vYXCQ+J5i2oxyD0grQOU0XYndnmzEJDlj7xFIxGSQquKE/4prGr1VyDX
	LV9o4qf8oDA4NDB2QZ+RcH/7ohcd49yxv+XZev0vJ439XKkmM4Y9pxJTVesw9q82C5cpOkQGUZ5
	L6gXqGl+bLlQm9Py7TnQlSsFI/meTJ5cpXHO5X8t4oaBzibNf/uPrA2g1bBQrGQYTCsXOQlcUvy
	bV32nAJ/ZSwJs=
X-Received: by 2002:a05:622a:4894:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-54b4cd278d4mr21858561cf.8.1793809568468; Wed, 04 Nov 2026
 08:26:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104160716.2910873-1-bwicaksono@nvidia.com>
In-Reply-To: <20261104160716.2910873-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 08:25:57 -0800
X-Gm-Features: AclHuK-GeTinNBFNoWnfPGGAtOY6Xq1W9g3atyK1ujiBfiA8CNbeKnUu-zkauLA
Message-ID: <CAP-5=fXriq3akwKxsxSuBZ0M=1OMuCe8ig_j-r6ehfCeCVAYcQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, ctshao@google.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:08=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.c=
om> wrote:
>
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of the Tegra410 PCIe PMU instances.
>
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
>
> The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
> and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. perf only strips the number at
> the end of a PMU name, so the instances of each socket were treated as a
> different PMU, and these events and metrics gave one result per socket
> and were reported incorrectly (e.g. with --metric-only), as discussed in
> v1 and v2. Patches 6 and 7 fix this:
>
> - Patch 6 adds a check of the cpumasks of all merged PMU instances to the
>   zero-count skip in perf stat, so a socket that counts nothing shows 0
>   instead of having its row hidden.
> - Patch 7 treats both numbers of the NVIDIA PCIe PMU names as the
>   suffix, so the instances on all sockets are merged as nvidia_pcie_pmu
>   or nvidia_pcie_tgt_pmu. Per-RC results are still available with
>   --no-aggr or -A.
>
> Changes in v3:
> - Replace v2 patches 7-9 (merging PMU instances that match the same
>   comma-separated json Unit, naming a merged counter after all of its
>   PMUs, and the ABI document) with a special case for the NVIDIA PCIe
>   PMU names in pmu_name_len_no_suffix(), perf_pmu__match_wildcard() and
>   pmu_name_cmp(). Thanks to Ian Rogers for the suggestion.
>
> Changes in v2:
> - Move the uncore JSON out of the sys directory and remove the
>   "Compat" fields. Thanks to Ian Rogers for the feedback.
> - Drop "perf jevents: Process model files before sys subdirectories",
>   which this series no longer needs.
> - Add UCF SLC and memory bandwidth metrics from all sources to local
>   CMEM (read, write and read+write) and from local sources to local
>   CMEM and to remote memory, PCIe bandwidth metrics to local
>   destinations, and read+write bandwidth metrics for UCF SLC, UCF
>   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
>   Rogers and Chun-Tse Shao for the pointers.
>
> v2: https://lore.kernel.org/all/20261030174816.1544471-1-bwicaksono@nvidi=
a.com/
> v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia=
.com/
>
> Besar Wicaksono (7):
>   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>     aliasing
>   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
>   perf stat: Check merged PMU instance's cpumasks when skipping zero
>     counts
>   perf pmus: Treat both numbers of NVIDIA PCIe PMU names as suffix

Other than the nit the that commit messages adding events refer to it
as "PMU aliasing":

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
>  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
>  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
>  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
>  tools/perf/util/pmu.c                         |   9 +
>  tools/perf/util/pmus.c                        |  23 +
>  tools/perf/util/stat-display.c                |  20 +
>  10 files changed, 1416 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-c=
pu_mem.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vclink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vdlink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vlink_c2c.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie_tgt.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-u=
cf.json
>
> --
> 2.43.0
>
