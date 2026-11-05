Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905894;
	b=4RZcTFYHXP1rw/XTpDoebLMPEndq/AUELa5jf048gQCR/ACA+5YIPFgUFBUMQLVre5Ca
	 TNPpmNyrPRXBMzyEEcJAVKHR/4H56zACHlCeJMB5c+NIt+ZuBPmwG47c9YJaFbw05DkWy
	 oWD4Ln23zmSC9mIbvlBEeTo6yEsmQz68+yAegyOofYFKDCXi/MX2yZ978RFzZsn39z8Gm
	 pLHr7+Dptdsyo3k0Rjz6TAOY8gtqrYc/hkyYZAKsjsLK2eN2biT7r2o2QFzKy880NJBrN
	 SZuEsDQNkbpwzp/3KOD70nQKXP3UwUIDwOBmMkNQqgVYUiyA+t9jLtJuOwJS9C5rzAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
	b=b74Y4O10YNdsFXPsJ7X6vNTuEwZy7vxv+jwQnQ/B71Z56hWqto4qNNMn63MBo7XdiR+p
	 BSD+RBD/zAy3BBWYpgWn7VWipz2HjJmF4ouZNdpR6OOIzQQ/m65WGFWY5VxrIzjkJ4yyG
	 UVdWVeupb80NgnDcMwDa1i94B7u3oQvZ3Jq6ne3mpVepXPUfiyZOuLOzhgj618/q2mONu
	 CJqhj4mlYYmJ+Mle+LILYucfE0Q0PZfFWsmirilBBhc8gd4l2VYCQgo9XOXKnkqy3emt3
	 gMmeoJOoBNSkxaLNbDY5cc6oplhsF2bm2PL2Zs0FRif5vIDscO8f/gzjuL9KvkXjUHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gguh5mw1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1A606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C1A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gguh5mw1
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so3699367a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793905892; cv=none;
        d=google.com; s=arc-20260327;
        b=PuthNLpe3HFfZRbldVIaaYTuPt7gTqFVMCs8BfgYdTcDLZz5UqBJ6w990XsY1tmQEB
         jxMrlB/IKAyHbqNaiNLKyHMPE7T6lkElCzOVSLC8dUqh7SFRDcExw5d0Yv/RQR3hpNo2
         rcUCrxQHjCkO2niaCjEemiekDvEjJaGjca1AckDTq6SjVJI3kY0r7h36K4ZEpX3hM1Qb
         pv/pLtCNAx7FNvbhO39CHOs3EEWKSalq5GuTu8jqS7VZPleAQprxmEH02stkYXee3Cmb
         MX4QY/MF0YahtK65J8eqy7iup4/NoMJtURxhyQSdFelF4o35Dh3ZuhnEGfFHH6pxjHKb
         dg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
        fh=8kiRg7P6IhD+OI7mOKK4rEuonq7CsfyK+rdspbS3R4Q=;
        b=RdAgNg+oObV7kBouYLKJQO+3iwfBdHqUCHAGrUORurXatAdt3hmHii/l2oHO1eMx5p
         LBecUSobLgFC3NnSXmrl8vAgnR2/MquZlYJreCTG6DrytY40Id3qihK1LI1DCGvum4ox
         73qTHy9rpFnFGlm25ONMWOeUSRHkXsYnpdl4eMso+FrQGb1CzRKwfwhvuwWaAZorVK2c
         fZDkQgKGMwQ3Le7Fcz2KaBKVFAhaPVgKL3TK+z/1Mm9ISy1yM/+7N1joCZU44zlAHOOz
         L42FkHI3Ina1M+AyX5rGCHFyc4T6zM7WkRQXJLUt5xeFIePUbZEKbOqjkWS2i1/L2Llr
         AQjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793905892; x=1794510692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
        b=Gguh5mw1KI6YBUsJFzC/Hk6S/1l0z07HBEw6ry59/x0/EYnGs0ARcmd8QeRIpPl7+l
         8+GtqlOVfnZgPU6qCcvm8TS/TrSF6HRjkRlfyeZ7DP9t/gFx/5AsNGKrUqcLLELImjMk
         jQF7OfOFBkOosjPUTcKF5dK/nqlYU/vlWYcWCQanUHsQJc2iFmjI/X5lXxs4Plx44UpS
         DD11gjLzF2dIHd/VA95jSZPWRigF7VX8NUE/7tS9Cx4gCnUUfxKUnWPHFmRRxeBK1lf5
         7wrdOP/98n3ig7v0ix0WPpWzGT94G1alpMDOGNjw66uBhuX7kHTfM1iPmbYkIUhDTKhj
         11sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905892; x=1794510692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
        b=UIOwTR0yLlq0V0PehNdPDUbrkRGpvwDeJmF1ctInSUW1i8Meda7Wzl/E8PQrdaFNxQ
         RWLolHMPIjqH2ZPtJElWXhGsetJGQdOhAKVsZMfvbuzI85XCMf+ot/UPVG69iG5Hs+r8
         MASOAAe5jCkLFx6EK5aoRsTHmjyGEr/yaKuWFWujEEmLUzY87gF+TYjcBMZNz6ZT8t4s
         pmpwLCSlCNVwflCKYKcZQP9efxu9DbKWw4M6XaR0JTF1fahfSVS6LSdgL5u1D6VyWEUn
         0WskegIrclD0OSO2l2ZhJZztB5uQSg2ugxXwOMEwLNTTR4/QI3GF7KsM97zQOo3BpbHW
         F1kA==
X-Forwarded-Encrypted: i=1; AKwUvByeHXDYPUu3F2rm4guSnOEwAM4wrpd9L/8bbqbIRL7DvsCTKJgQg6jNwXHDvSqUDu2T/bKAMhFke1+4yu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SzomUBha3a7GegXQktTu8UUDaUM5inVppyt7IGnYQqF8bR1hf
	b6/2WCcpy6ytHuBMFowC6FSpQF6HIT7GO81SK6n5Vet5NS9ULY8yo72Zkb6X58eE/M93mK+jcsN
	ElMXKWlCUyJQ4w56FVwgISU3FCNu6IUQ=
X-Gm-Gg: AYBFou0Dj/FjxwNBUsaQGAJht9XJQdeVGwgdiK8N28/zBIrNPytoxNvfJitBHn4QeP/
	ZbI7qf8KYmRF77SasB7ydUPYG6FCwe/Ed+aMXkspgX5YI5xlsd82poa6dwtzXsIBeCCsyAW6VYf
	lMk8BsyzzJ731SeqHMKr5G+Q+RARZhNfOP8MUEDlG3Hb/lhmmR5RoFTaxfxskfkvpN5Au5sKM+N
	F6Ps40jMk09ovAQrbv7vKihwHFdEb3hCJG8rodijKBheqgDAd41x8e0Mm7adp4s5jK90mtevbJL
	4mJ/RFVCf9++Sd61s7iXjZaYCkTQDBusVCWgrbbXTXCrGmZvOTGkAYc8tOOIUb4M5TJ4e8Bf73N
	rwHeM4CxMLn9nqF86W2tRHw7bq79iTBUJd1WrBx3kmDSOtN4oFb018birLM+CPTDnT/Fw7RjAqC
	XYk+ACwEThk03ddkuf8tgILQ==
X-Received: by 2002:a05:6402:2742:b0:6b5:76be:62e0 with SMTP id
 4fb4d7f45d1cf-6b5977ef792mr143941a12.35.1793905892223; Thu, 05 Nov 2026
 11:11:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-12-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-12-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Nov 2026 20:11:20 +0100
X-Gm-Features: AclHuK_C_Cie3ArOrjKqlHZt7jfTNl-4Nhbo7AW6B15vErDFBBi4J5x1cuUYTes
Message-ID: <CA+=Fv5SxHnUTDzV0R_E8KdiASOUijsSSgWFwmy=WmAdvUi3iOQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] alpha/perf: sample only retired instructions for
 precise events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Nov 4, 2026 at 7:49=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> ProfileMe samples include instructions killed on a wrong path, which
> show up as hot spots in perf report although they did no work. On an
> EV7 loop with a randomly mispredicted branch, 19% of the samples were
> killed before being mapped and another 48% later.
>
> PEBS and AMD IBS op samples are of retired instructions only, so make
> precise_ip imply the retired filter, unless filters are given. The
> profileme bit still selects every sample. With cycles:p, both kinds of
> killed sample went to 0%.
>
> DTB miss samples, whose instruction is aborted, are then dropped too:
> cycles:p reports DTB hits only, and the misses need cpu/cycles,trapped/p.
>
> The kept samples carry the full period, as do those AMD IBS keeps when
> its swfilt discards others. So in frequency mode the sample rate, and
> the event count perf report estimates from the periods, fall by the
> share of killed instructions: to about a third on that loop.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 32a8b5c98381..7e34eac0ea47 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -837,6 +837,11 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>         if (attr->config1 && !profileme)
>                 return -EINVAL;
>         hwc->config =3D attr->config1;
> +       /* As with PEBS, precise samples are of retired instructions. */
> +       if (attr->precise_ip && !attr->config1 &&
> +           !(attr->type =3D=3D PERF_TYPE_RAW &&
> +             (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
> +               hwc->config =3D ALPHA_PERF_CONFIG1_RETIRED;
>
>         if (attr->type =3D=3D PERF_TYPE_RAW &&
>             (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
>
> --
> 2.55.0
>

All 77717 instructions:p samples I checked on my ES40 matched the
retired predicate. Using cpu/event=3D2,profileme=3D1/ gave me the
unfiltered view, including the DTB miss samples.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
