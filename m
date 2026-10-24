Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829840;
	b=gtgZP1o0lwSNqiYtzUjgCFT9BCEUXkJOdMl+nRVPjUPHQQJUQl61H0P6OhQsjpc5YEpD
	 48jH+PbxANHndNizCM35D13juUb99hWl0bM+wiKo4SaW7VQkcZSnIJMqTHA/nX9jxxGyd
	 zzP2dbHTVf3/UCQT5W6itFU8oRMeaPWFUqkRs5Q2QpSfG5Q1wJYDUPmWYp0mZGLc6TO5Z
	 bgbjc/S/yQRrqgJVvLHplqUQzfB477mdLHfh4diQDIO3gsKKuNsmdSrZ4LZg6d4ZtFduk
	 u8rMJVUE2aMrOfsxJzI+rzrCrQFhrvsFm9DT2ZFi/tNzQFIU/cCj0m4C0euprxN8L/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
	b=EkBTIL8qX1UOHQmlBBmx58VmFCL9VYQkTt19mhRQuHzQj8iTc/F3Vxsb3rpf+NGeHjVF
	 mLDKApynav0GuJv2bGQQfJJIO3lLhbiyu3LAIvbOt+4cWGHU9zEVJok8gBDds0z8fr/+v
	 1kLd2YdqCSSiXVC78NKXspq0BrKOeYG2s9BdClig0O+bbfLFwMXOfNKchrbBaxD/E1cFp
	 ker0Bi6j+ZPTKlPLndEv+LIxHHtoLZzjL/PYqJU5ql3pSwry2B0HkCzmELbblM1q11gK4
	 a2WiCECqfQywSVZMnTnkDH5mmbCVTVL0pa/SimD+KKEt8j5egzFHZ8UpvFd5rBWqHQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314C606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A314C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so838644a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829839; cv=none;
        d=google.com; s=arc-20260327;
        b=pNKl4sDOAMv2Ewre4C4ZtAickHf8l+74xoUeUQC9LY3lxyn+SafBwCL+dBQ4JOaA6r
         YobYS4O3r2OejBjJrBTB280iKVbBqIAimMmR4A5rs96mRCOK/odrExW182+Jrxs3uCqy
         ePFOrySHvUzQp0xgMgaFvYYc2jjLK827ZiiTKxlUDaOTcjRgabaxPBIn719QJB3qYkOd
         YpPTv0hyEndikTDF3rku7V0nHfUYqzr+VA39395H5/wCVqabMdf8c5wouiO9YAXTy0ys
         lsB+RdqGs7P1Qu/jcDF9qfrnTqfHmIbI1SSw3J30DoqXjHP9v4vI5OO1q/26rfdhAQXq
         RC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        fh=7ueCdZj3jW6hKM5JvqRgeMIQkulakcqAdm+dvlTVUkI=;
        b=jQmLy7fRjixm9IAVJZsztzM1udbemSKmR4NH0O9dj69Yrf/dzC1lGk5sIcid2rA2Of
         +hPhIuRUvtuFBmqHXJ0oN/l9CCjr1M0E6KB/hLPXxtmssvvxaoM874jw7F8bR3P3kjoT
         Cgwhwec6n+fkk20WLXVWmv053BWRtHYX7XkeThTjoAxMa9PYBeACcsaubxT0Lr0jPDw/
         zHFzYWBXJU5OTvxTck5SQvYRxoaDrhsV5a3k11/6rz1OIqJXmFtulD+IzJ/wAbFWs389
         yKMbbugMIvj0qH9FzvUHMiuB7zf6A/ahUdChIhjpbEx1m3SZQ8yNvsZ/c9rvgQTcCsAf
         b7QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829839; x=1793434639; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=ErxrGqoPZ/nb9CghxeboTYWi19dHZA+oLth5nqNwXEPLgCivWeROkUq1jgI00pLPis
         mnvEJZESOATfA4bwGakbWHbrbZfTg6q/+BsXRBGx/nCeAqO9mecP3eklEPue7ZRetFgl
         WAQbY6p0/CHxOoA6764p2Z33kLx+HvfLIdMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829839; x=1793434639;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=H635j+7UV7cMENBx3gJp0cVvG8csYjNuqdyqgUqkx1oAo2oVP7xzuozv8z4Y1GpYtd
         YTU7uTc08cDiA0cv9G/O1PlLL/WjNHZZgp7WJjfjd/+f2sIvZuxSnXPezEv5PtVoBqP2
         bRSSgrM4dZPVm5pouPB1Rcf6orVjhgfSH5Fdiw32BC/f6Z78PiowlNAXpBHI12Oa15Wn
         1YpkFGiYZezOjLKVFQI68Q2zaXjnIEUcIcZXfJXojfgW+wZlKua9bdRRGMOQt6FAeLNI
         JeJXT1D9nS9czcHO9ZdZ37U7272NdjqDiNxuXR3dcscOVHv98ge+iA5ooioTgQya03FO
         UDvw==
X-Forwarded-Encrypted: i=1; AKwUvBzh4i9ga+kBWmgCuirNQLfu107MKv8URgcozNoRDreizmNaj6q7AKK/LjgcY99zg8n7E8jvIeZfzHH/+Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0aRXMyhdqji3XwAHGG3q4dtwvTMauziPQRlqQhH0cKg0ZHJRm
	eGXBiJ3ILBoqiWDsjVjXgDzAU6rPPACE4iNGk0yOOWYNmMOZo8/oyxpRtWypJjXH0wsYInQs/ed
	e/eOblGOWgaoKfh0oukkgzJP70z19w/IugJknpC2m
X-Gm-Gg: AYBFou2s64tfT6IrAWa8gOUcf/57dd54K/wFp0KTBYq/hv2lpB0Nd9+N0tDhARDZY5a
	0wzHoa828PXMfMsuv1rcY4lq9NsgzzJRSgNPa1n55b/Wh3LCY8UcHPM5iTnHlvIZWvMnUWHt5//
	6IJ//3g/9Xv+iMuj18bwOVlWJHbbiUY0O9UFvlxwSCawXvZjVbiVgLyI/mt1hz0bV3PxOg89Ucb
	SZo8WZAZpYiyGfZrPYbYbUAyp6uiWL7jEr+wUFvceI8U0n6jDB3b4w0ncnWfj/29neSfItJIdsM
	EYNNYr4U/TSU6bf3OioPULllgUeXIEauqoDN6gLEw9UTNpLEX5OiIZhWheetj6xBP996tNQd/Ou
	odJhProHfjOd3vG8EUNOb9IkkgVtQKiUlL8KR
X-Received: by 2002:a17:90b:2891:b0:3ad:4a8b:c6e1 with SMTP id
 98e67ed59e1d1-3adea9dca56mr1447422a91.19.1792829839011; Sat, 24 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:14 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:13:02 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:14 -0700
X-Gm-Features: AclHuK-tg0PdtuvuCVecn4H2MwI1d9lfukkzfH1KNqgDlJ_Y2JdAvjK8N50Iivk
Message-ID: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
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
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
>
> Add opt-in support for factoring the DTBs inside a compiled FIT image
> into shared base DTBs and per-board overlays using `fdtfactor` when
> `FIT_FACTOR_DTBS=1` is passed to make:

Please can you add a short paragraph at the start saying why this is
wanted (the bootloader needs a base DTB plus a per-board DTBO) and
where fdtfactor comes from? It is not in scripts/dtc, so someone
reading the git log won't know where the tool lives or which version
is needed. A link to the dtc series would help.

>
> - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
>   included in the FIT image so they retain `/__symbols__` and
>   `/__local_fixups__` metadata needed for factoring.
> - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
>   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
>   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/Makefile.dtbs |  8 ++++++++
>  scripts/Makefile.lib  | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  MAKE_FIT := $(srctree)/scripts/make_fit.py
> +FDTFACTOR ?= fdtfactor
> +FDTFACTOR_ARGS ?= --strip-local-fixups

Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
host. So FIT_FACTOR_DTBS=1 uses whatever fdtfactor happens to be on
the PATH, and the build does not depend on it. Is the plan to sync
fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
be worth saying so under the --- line.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS += -@ -L
> +endif
> +endif

One thing I'd like to check is composite DTBs (the foo-dtbs :=
base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
is that fdt_overlay_apply() merges the overlay's __symbols__ into the
base but drops its __local_fixups__ after using them to renumber
phandles inside the overlay. So the __local_fixups__ in a composite
DTB only cover the base part, even though both inputs were built with
-L

This doesn't affect lga or trogdor, but the make_fit.py path packs
every DTB in dtbs-list, and qcom has lots of composite entries
(lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
to find phandle properties, it may silently produce a bad overlay for
these. Please can you check this? It might be enough to detect such
DTBs and skip or refuse them.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
> -		done
> +		done \
> +		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)

Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
nodes with compression = 'lz4' as in sc7180-trogdor.its from patch 7?
If not, FIT_FACTOR_DTBS=1 with that .its will either fail or silently
skip the DTBs. Either way, it would be worth mentioning in the commit
message.

Regards,
Simon
