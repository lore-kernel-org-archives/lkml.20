Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829829;
	b=u+HJNfiXi5iVlF5M+w9mPFhqkPStX0SGmw5T+qn91YozhGIJ5MjMrsBFED5ADIdnKHDU
	 ViBCX0By+TfZD1V9nuD1I9AVNOUCoqgynzIWDO5dkJp4fbB8/AVH6bnWppPTZDeLqpEHV
	 zKT/1CiE5TP782emKmCWKBP5gSh70ds1mvBKXeQwWjJK7psdsStAh9A0si4YA31dtk1f3
	 VrVgGhvIxLBCxNJioakLNrItscfo3HeQLzz90khKHW7RokIqBEa1VHtWBGLr8fqLoMb1u
	 hTszxbaWzeUhUyED2IE0WIRXPZY1PQIBPS5t037Zq73V82JodlNL8JC5co6HyRvAgRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
	b=jOfBNH8aKk0eBoVP9ZpJhKO4oqqfMSrj35kp8ggxFjb+EZRJHVM2lRhApo5P9QjeP8QE
	 Ccy+c1JqMUS9pU2paf5o2orw7pWWJ5txaB6/FfaGgKohrDd6bXeL9D1n6AeqRxL8Q0Z2J
	 ucJl/Jd0QBRq6CVP+2s3yudS7OYLTFZF5MLGAIEOXwSorfTa6eyUwio8HFGD0NhG1Y4ZN
	 0nHcS7+okyEerT9vcA4G7cat76itxXGnKy0eVEzXVzuWMbP2qNIPx8t53++a2RC0oKWXH
	 3ex6642qUtl/cIBBJR9nO7exirxkY+iFMivh7IQZi481wtQiG0SiE0IdMSPuY8J/+zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC2606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBC2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1630922a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829827; cv=none;
        d=google.com; s=arc-20260327;
        b=UnRwrOO4WkOajPt19vXSvU++jRa5HQFWB3iWfGNkUo1QQ2EKbEHBea+vZVxCCXK7kL
         iwOqpAA9mtXbNISoLianFSK8n5+1f24TmuWA7gDNRg36fvvJwJ3qNYrAHBt/H34rHJAy
         /lFtDz5H2Bs9RwvHjFV2QkyJjMSYIiJ5p1hggK/maMUtjiPNhPySrO9fUK+S1+bbR4Pr
         i1kFXn9ydB5MGtEoMEl/VlZNciGcojcwXKC/nhve0rzU8l6HReo5tEjZmFtcEaK858mC
         z4TCM8aFzGRi8nRXiNyBzCypVnky6BOVtdbIz1PsQ92MyuNNi6ksbEuwaHBWiS4wXv1+
         +jTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        fh=nMWkTebBYhZHokoO2+zUYuPQY/sxgY6CXNj35uJvVEw=;
        b=aHjRa9mfmxBlP9TVh1azs04bV2sIHjLULcr9h6oppDtZfFdv/yBEy8YFA7vCyigk9L
         g2v4z2y6ssaglXA3ZddZZ1j5hfYfF4/fkJ2SotREzrOX9qcriABhZXh4YVE6VomDYuXL
         rJUnFGcHedE2B0RyA1ZqIwNUcidIqOREMXzQ7ZlvZ6SbAW0O3K9BoarWBZXZRdLt5C2N
         +WMrrXQqWjM7myuTXyOB7la+kGoeeT101XxEhcrVsZL8RaRNWBY4XPZwNrVNVgd9ckmu
         kKi6u/eGIJqn7H+aShycH4ubffr201tFtElExJ8aSoSRLhDFxLU0TEZWnIdZlF/UdXhj
         D8WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829827; x=1793434627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=QwTwqqUYzR4KMcjZ6tN3E7hw4q93B9dRCKd+92TnzApqiNKVxy9e3nOyWW54DY3jbg
         Ojsm+hc5971JCcfIrnwHh5AOki5VuhkbJKi2mOzK7wpGE4KFLMdJKywO6CuWLrvqLilv
         4iZB7FUgOsGFsggrv3fVelxSSBSYmX9hCrd+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829827; x=1793434627;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=zyZuLGO9F29k3AF9RxVjmwjDVl8fwfVLbJy+rRle/69fNwoiJ0izMXaeqO2vvACtQZ
         ttSwFhN1UJCxkTZjGO2JaCiD1ca2Vk8o5cOOKSV2mCZnclhsv3+z4+7yNsf67FbYvzG4
         fwgG0nRAzBJgMX4oKZivRFX7qEg6+erzXI2WOkT0ntw+IKHEP1grQMm38lKW/OKsCxjT
         iZXBr5S8yCtBP0TesIojsuXxCALIeVcRyC2VQf3md1AZpapTeghLurpC2fX2TpvXRvn+
         F2iKj8TI6gOLtCgPFvaGoiuj9G96RxObmg0Gcl+oLN81HNVdCzyhQXs/VSdJZoysuEx7
         ZIuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsQEO8xO330SoHjkFRNXF2UITycNSkZ0JRj9F6TUomp5fqjqeqw0GZYOg7FG+UG9MYNm4d2EmNUzMciGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTiM1qSYNIYPlQOVZD7MuhBuNB/z+8I0B7TbxiL8JfAYaHzbZn
	edAuSMwdTChkFHgWtfu4T3NZxZqPDkbEfkDpolAvE7N4zvoFAsrRlVCoP+OL4BV7UMd4HXwfBYs
	2X/gCObdY4JIgSnOWJ61VPkGmjOoqAMns3pNyKdod
X-Gm-Gg: AYBFou0U8oWs4/+DwQ9AeujBC/YFyKqWlV+0NpVCwWeXu3cA1HF6Q/haMBsSnOz+w8h
	zkbFmb3NEkgomH4nOntVYo4BK5zW0fM5wHAKNqVyiNM1hB++7KPGXX7aOjJQ84PWgXk8g7tVXXH
	PCBG5xg3w8zV+/ua4ipgzr0VR3ML+sgilkb4wYaenBfUtk5yNlHarvocjiQHUWFToGfXFd/feKJ
	iUASvEvDIDGNNoFh3/uVflfdsFauDeaa8yoytOwO5+tSdV8EupPtF2Xcpms0ND5327tKOyeUNt8
	P71VSllIF42DgkJ/jny3qzauRt0PqBSV6vb0tWitZcsYOHkaomFgOr2fvBAsUMjZNhLU0SZ3DV1
	PP2RV9/ntuekq8A7yclu0PfrIc17vRYFa4m0qViN7Nykc++fXZ9kf+6IY
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr1861005a12.19.1792829827097; Sat, 24 Oct 2026
 01:17:07 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:03 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:35 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:03 -0700
X-Gm-Features: AclHuK9YCJ7Mk4mSQDTbJDAZNMre28fNrdZjyMOx5ekb1ShhYgH8OFHnaV7iO1Y
Message-ID: <CAFLszTg6B2p30-RcmO6fk+2mdHwSdghU6PXotz0m=gqdk5dRNg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a
 specified FIT_ITS script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: boot: Support building image.fit from a specified FIT_ITS script

Most of this patch is generic kbuild rather than arm64: the top-level
Makefile clean pattern, cmd_lz4_frame, the compressed .dtb rules, the
dtb-y filtering in Makefile.dtbs and the FIT_ITS handling in
Makefile.lib. Please can you split the lz4-frame and compressed-DTB
rules into their own 'kbuild:' patch, with the kbuild maintainers on
Cc?

>
> Allow passing `FIT_ITS=<path>` on the make command line (relative to
> either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
> to assemble the FIT image from a checked-in `.its` script via `mkimage`
> instead of auto-generating a FIT image with `scripts/make_fit.py`. When
> `FIT_ITS` is not specified, `image.fit` continues to be built using
> `scripts/make_fit.py` as before.
>
> Supporting a checked-in `.its` script includes:
> - Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
>   standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
>   bootloaders such as U-Boot and depthcharge, plus generic compressed
>   DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
>   `scripts/Makefile.dtbs`.
> - Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
>   `$(FIT_ITS)` and automatically building the referenced kernel image
>   target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
>   blobs.
> - Populating any omitted `compatible` property on
> [...]
>
>  Makefile                 |  2 +-
>  arch/arm64/Makefile      |  3 +++
>  arch/arm64/boot/Makefile |  9 +++++---
>  scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 5 deletions(-)

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
> +ifdef FIT_ITS_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))

Just to check, is it intended that this also restricts 'make dtbs' and
'make dtbs_install' whenever FIT_ITS is set, not just image.fit? If
so, please say so in the commit message. Also, matching on notdir
means a DTB with the same name in another vendor directory would be
built too. There are no such duplicates today, but comparing the
directory with $(obj) would be more robust.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
> +			fdt=$$(fdtget $@ $$conf fdt); \
> +			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
> +			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
> +			compat=$$(fdtget -ts "$$dtb" / compatible); \

A FIT configuration can list more than one fdt (a base followed by
overlays, e.g. fdt = 'fdt-1', 'fdt-2'). Then $$fdt is 'fdt-1 fdt-2',
the sed range never matches, $$inc is empty and fdtget fails on
'$(objtree)/.dtb', breaking the build. Please can you use only the
first word here, since the base DTB carries the root compatible?

> +		configs=$$(fdtget -l $@ /configurations); \
> +		for c in $$configs; do \

BTW, adding 'compatible' to the configuration nodes after mkimage runs
would break any configuration signature, since the properties of a
signed config node are hashed. mkimage isn't given -k here, so signing
isn't supported anyway, but a comment would stop someone adding
signing later without noticing.

Regards,
Simon
