Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793304733;
	b=dvegMv43mCCrzzjUU8hhT9iXHNdQJSbTpixAGzZdQenWZoxDhCs6htQfHT3IK9Gn8x/J
	 Ai2lwBqSZn9qX0zw2i8J/0odk+4VjFuLXSaddtT8bpIM6BnbSKlnrUOZUGtWxqhRKT3TP
	 XwEfjQyLqNRxuIazXv7NrlZ6/6oz0AlFrJ+KwXrD6xZGNNVHwP5UUknMQTZv751QtTEi5
	 kGaX5L+BxF4Vhh0MSowzjfzGQkjIE13Y/5QsxHWBbgPsM73zRUHDcS6RQFvtoTkDWsl44
	 iaD9DMj2Ny7VqP09URNyYZsTGMJ0OdC3ICs4fqt6cyqhYDYm0xsP5Xi+pvQ02+zOtLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I4MkKR6JIP2KDMXQy0atyZipWl/GBl7GkfJx4r11tBk=;
	b=f9FXUJsuqbkPN3B5YMe4a8TvXk5jRRI88Z8SCh1U3s8zuk0niHb93RQGx2xIXP0KB8NA
	 d3o7VksP3t//Z+RlCvqGUifDXRc+WBbHPBPqRvygTS+eFS/oq1x7O5cqlw3S8gQHn4zhY
	 fNuVN0OS+XdUs8WwSzZBoTwfzUTxe7XzwGWOQG53nZ2oMI4JVP139ouoVbBreguL6iRvZ
	 GY8WELvhv8HTTwgKQP//sIvGi8sCBwCKY2nU1plGVUYFQb+GZTKhR2hxAuYk3TZvWGN6q
	 yqU6aw3qxFt7U9YhqrD4R8NGFP2sjR3utl9CSMOKxyq4K+i1qz+MWl9+ZGeNY6OJhHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UFwV7/FK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE59606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFwV7/FK
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso1285184a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793304732; cv=none;
        d=google.com; s=arc-20260327;
        b=Z15WdZYdXRbv345wXpt76QA5oIGXuU+xyy/yWO4GuE4/6qsBD5HDYeeVMMfvmfDHUy
         hdcqOYlooemFwpwmGw6Qy+nhtqsV2i7/yI6ZSqTJrtsi+uxHhGx0Xo9OOzZT4jIIW9+6
         1Tkt7cII7QTiYTAJxUkrO5V0a6F7zVh8vyo5Wrr1devAoYox+l1ZpKdpHeh/2LGT21eS
         NjS5Qv/Mt4kyIAZUp0JghDZIGlMPcEv3cFaixogy5xv3szutPFuUDUW2Qtnu3BTfUcpE
         ECClmKNTq6tc4VkiVSOZMzB8jBLSHr2ahtZv1FfaKfKNBkV4HNp2WRaIvgyHIgPJZMiW
         CwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4MkKR6JIP2KDMXQy0atyZipWl/GBl7GkfJx4r11tBk=;
        fh=VU3wktpV5CAbYx4CRtposaMK6jFYoMpZGs0FgYmIzfY=;
        b=YL/5Sq/IDdr5ReqOj3HVj1DXy/GYEv9NE7qQjYyDQWQUlva3XDy3mX002NbidHpbkz
         jfvfc/2mBj81cL89IvisQvCPuCw4wafDYyzPVUj6b2vRoVf+eS22CCi0XbWOlLU5IR0y
         TIajBgADLdGyjdaZgbt/k0Vy6ZCWkJp20fA4gCaSf/DVET8qSPBjg/7aCLWyTMLGDIWn
         FiPe5Ox5o3yMeSg7S2qzavN2N47iaivUChvG9/5uscLuXgs+5J+GGwjyh3K0FDy+lSz6
         KOtB3RLA6M9aDvEYXRcbMH0PGsM8E0ykRYzm1b5UhdNq6stYhCY8gQxQwTbHiIEDTALB
         0gpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793304732; x=1793909532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4MkKR6JIP2KDMXQy0atyZipWl/GBl7GkfJx4r11tBk=;
        b=UFwV7/FKl/rLJt4F063/DU5f1VBHC2QGKLaJqYcvpvIf0z6uEzyITXltH+3AkSOCb0
         ANgAAbay/s/fF46r9m9qjUtcK67KTMp6IfbIClkolwhY7TvfhzKUA4nyKDykKiAIxxMS
         kpJIhOkum+Jk/JP1ELIGskm6cXKoTVBA7lt3PrfcQYwpJ7XDAXeoivLWFc7cAmem9J+z
         NFJ2wgS9fJXPxhFGjEl8Gvvti+mkczGgQN0+RflZOFnQt3e/MOiIjyKActMH8T8EG+is
         vcgFCBGPKHEP6tYcWfiKFPYpijHZkLCL1jvcgmfwz2kA3THg/Mwnrd08Hz+6mhbtU8TO
         x3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304732; x=1793909532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4MkKR6JIP2KDMXQy0atyZipWl/GBl7GkfJx4r11tBk=;
        b=FQrGyhcmzoWWj0cYFoJpNNjTN/jwHotxLfY4TI2eWbCcYSfzjZga+/y8S2EpZAanDN
         uVaHDeirB2Jp9sFffe/lVPpKNOVU+z0sbVDbmQj/zgVWXfYgSae2R9ET/y1IwvUVYwrw
         DZCzSRuKovMUKdOEP0rFpTA5Z9sGU+FC02DFqj+DfElP9dkeoUsFLsKzTEW1S+ZyBjvw
         8y7wMimHucVFSUSrWxrjx7YnmhPLArN/x22pf34MEW9M5j/qmJIu2jrHs9UnMCdaiF5s
         5L1SN/0z4i4d+bF7UC1aNQySqh/qCiQQCnd81B4d60oH+qBNvgRXjcu3Bz7xQeAupEtn
         Futg==
X-Forwarded-Encrypted: i=1; AKwUvBxu1zGIIeCKrkWMiqCsrL0K/QTmCXHU38MFZnC2OvNXMtLMMslF/sbq4/W9RC9eIO+cUrYIyF8cCxYbpHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLtVjd9ltHhA0hjy26FBok32QuWO+Vc2lzPn5j1Wum2QGsgjqL
	aZ9MhOwCqtDtMGfSqGbakC6yc5DdTb48Vo5Pv3nh5rlM7/hSI51SlNE0GlipuabCYbcu6w6goPD
	6mhBRzLJ/OVOO3r0rLVat42O6WM0eJXo=
X-Gm-Gg: AYBFou1kge6/u1cexVot/+GL1oWIl2g8TxOkzSAcvgDgIpTacjRSdq7C3PRJQ8mVUcI
	N2r2VTWpKRJqQ5Qax6FJwGYT/6Ab8RkCy/FLWm6BGXnJq8LSTTjkbHpgxp2hGa1+dYqfUjdB+Go
	Qh3uXMK3uCGxUDSB0X+VkszCGp5PbocDbjjQd1ipINRi3N78xzkED8Zabo8y5at4OqSigGQgbe3
	M5EYGYi90yTl66YoDU4FNFbWHqMp48LtyiHwatQQcB2+2/KgKpwBO40DqW0m3l4FFNkhrTw0jAF
	5/WN4p4L26x2BsNn5AfaSIonSk81IlhYyKx3f7uc+zQuMipUFycDuaIhZ+juecuBFAKXvTKO82O
	jf1CAtiMG5dYLSxVuC6qY4iG76fRenhRnvXPIt6GuUB36mW5jLkarTdkzcqsCW9vrPBgo/Nu+bL
	7U9fjiDnvAN/uGC3us+QaapJZx3DiW+f/Irpc4WqsNq8WNu7PKOJsv0kM=
X-Received: by 2002:a17:90b:2891:b0:3ac:7c52:fb04 with SMTP id
 98e67ed59e1d1-3ae897ab44emr53096a91.44.1793304732221; Thu, 29 Oct 2026
 13:12:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023124157.75524-1-puranjay@kernel.org>
In-Reply-To: <20261023124157.75524-1-puranjay@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 29 Oct 2026 13:12:00 -0700
X-Gm-Features: AclHuK8MkbbkbEYYrLZY6y9oQnDFH2cmvw9bwmFuv3G0y6W5whRHgCqUuNX5aMs
Message-ID: <CAEf4Bzb2jEjqpZrmtTk_+YCW3_jU8fcVzk26CBZnxkpYJ8kCbQ@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/amd/lbr: Freeze LBR on PMI only when kernel
 branches are recorded
To: Puranjay Mohan <puranjay@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:42=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> On CPUs with X86_FEATURE_AMD_LBR_PMC_FREEZE the LBR is always frozen on
> PMI, so the branch stack ends before the IP and callchain, which are
> taken when the NMI is delivered. IBS rejects branch-stack events, so
> there is no precise alternative.
>
> The freeze only keeps the PMI handler's branches out of the stack, which
> matters only when branches into the kernel are recorded; without it the
> stack fills with the handler's own branches. A user-only filter does not
> record them, and parts without the feature are never frozen (see commit
> 598c2fafc06f ("perf/x86/amd/lbr: Use freeze based on availability")).
>
> Freeze unless the value written to LBR_SELECT, which is shared by all
> events on the CPU, suppresses branches into the kernel.
>
> With perf record -e ex_ret_brn_tkn:u -j any,u on a Zen 5 part running
> CPython, the function of the sampled IP differs from the function of
> LBR[0].to in 84.3% of samples with the freeze and in 0.1% without it.
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  arch/x86/events/amd/lbr.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
> index a55646fcb8465..7ec50380ac81d 100644
> --- a/arch/x86/events/amd/lbr.c
> +++ b/arch/x86/events/amd/lbr.c
> @@ -392,7 +392,7 @@ void amd_pmu_lbr_sched_task(struct perf_event_pmu_con=
text *pmu_ctx,
>  void amd_pmu_lbr_enable_all(void)
>  {
>         struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
> -       u64 lbr_select, dbg_ctl, dbg_extn_cfg;
> +       u64 lbr_select =3D 0, dbg_ctl, dbg_extn_cfg;
>
>         if (!cpuc->lbr_users || !x86_pmu.lbr_nr)
>                 return;
> @@ -405,7 +405,12 @@ void amd_pmu_lbr_enable_all(void)
>
>         if (cpu_feature_enabled(X86_FEATURE_AMD_LBR_PMC_FREEZE)) {
>                 rdmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> -               wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl | DEBUGCTLMSR_FREEZE=
_LBRS_ON_PMI);
> +               /* Freeze unless the filter suppresses branches into the =
kernel */
> +               if (lbr_select & LBR_KERNEL)

On Intel CPU side, we reset this FREEZE bit in
__intel_pmu_lbr_enable() if is_lbr_call_stack_bit_set(), with the
comment "LBR callstack does not work well with FREEZE_LBRS_ON_PMI.".
So this is not *exactly* what Intel side of things is doing, and I'm
not sure I fully understand the differences, so hopefully someone more
knowledgeable can help.

But what Puranjay is trying to do here is to at least make a
user-mode-only LBR and IP + callstack to be coherent (for PGO data
collection, which we then use for user space app compilation), by
disabling freezing for LBR.

It doesn't seem like there is anything we can do on AMD hardware for
when we want kernel-side LBR and precise IP to be in sync,
unfortunately, but at least for user-space only case it would allow us
to not plain disable freezing altogether at kernel boot time.

Does this approach make sense?


> +                       dbg_ctl &=3D ~DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> +               else
> +                       dbg_ctl |=3D DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> +               wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
>         }
>
>         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
>
> base-commit: 0f443787a7f6ae907975742680aac2600483eaf1
> --
> 2.53.0-Meta
>
