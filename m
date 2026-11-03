Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793733003;
	b=ksY35vz0FgWZmtYnS/DGBI5IgKQdDi/ynnet00xDjROOTle4NlqwlnpqTdPyEtuKKTbW
	 scE3+nVofbzax6vygFAN/ZcAdl/aX3OVzzKqHVC+Vc8Wc2bVl5uMbTzaZczihthc3rdCh
	 Lb6nDVDVzq1lSA8koqu35erdB2+L2rJIimTyTC2sr1iDwUBwPImONxmnX/iurxl+AcaOk
	 TBte2OflF2Ff/1szujHq3Lop8Kxr8wa6aJT88aeEBGU8RuAxaTsvkAQVXONvdFFnV4QC0
	 ibL1ghTnODTjqKk/cI3i6dXHuqKibhP+7ZxWpzuuY+pPFCC89/higUoMnFl++YMR/zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K+4cGjYBMwET5S3/yL1y9WI8cj6ga2fX+l6VhSdIjFo=;
	b=L8mPP7cKKWZsd5Xk0V05cARrfyU/SB63uAUuxCba1yvQqU3YixzvMfW4nwGrGp2EEnQl
	 xSmEbRV1IokltiEXeNNPrgrtl7e/QQK2D1yAK5IdIDlODsm8L6PO9i6DFRJG5GR2D11iQ
	 UHymyJbo6CWh+SVMhm7Ej7WJH/1pNmUmhn70D//NyPXdRLV0xfOAoRCyp0CK3YLrVp3El
	 oSrfArWuu+jSWllRRySi2gWrojPGfI7KTKeqoLmVS6ZKcdIZR3wHtejkn5jQEwtxjnOff
	 KNXI2/5zumC56HI1zAyudY9Q28YyTT3G4TrQYe8Ds7QXDDCkhCbYousioy0lenrIQ6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WE1jRdNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07EC606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07EC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WE1jRdNV
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab41538192so923a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793733002; cv=none;
        d=google.com; s=arc-20260327;
        b=POpRPQe+wRjIUEIYtQIg3A9WVD4xT/FwYVBIH5ROeTzB4Q8d9kBAzMzpFXxKZ9WkGP
         ImxJ4MxGErbd2c4Yn9w5idOXQzxO6dzRdcTfXumxJoMZRClULyuRfz/FL0BVBgM0gQEG
         h5FnXuSDzyjUJojKXMjbswwxM1sGXSi/3jmXbfSnD3e4Tqo8xikHOqYBYrPYdfN/k0w3
         TX8QNplAgiw8crPPnEl+gYi8BXRPoqKcvWH0PBx4vVoRO2kYBGYr33hGma4HVl6mE4yO
         L3J92ExnW+xgQLvWadDLP6D9Qrozw6MwmNbdNsVhb0wxkZ8QshEgY+J9qLkvrtxB5MS2
         +PqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+4cGjYBMwET5S3/yL1y9WI8cj6ga2fX+l6VhSdIjFo=;
        fh=OLQcIGFqIjme/iiO9IjErDhEJlMf/gxhfQAOKowhvMk=;
        b=VDEpS0RXm9B0xRVhJdd5kDKIU3Gq5LKwcQZ5ewwORDA+DcZOlgrGV9FGx/HZnuOoOv
         AvOwgO9Mx5mLIQ0lMJpkn+dFcSk1QY4dTcjsg+PcixPdZPIY+vRYs/ebBVPhyPpBGlD8
         qvo0/WzYzpbePYnTLoEdSSMTS3mr9I7VRNs4dAvxtUlmNNjIsqr9uR+5NmsLJRIyIwzV
         POIf+mbFJlZIyAoa6Q0/oCd0JrEOn6AfkC9QteTgeokhg7DmFXM0rjaa/Xtc4cr17W+E
         4vjHHI7ENOvGSvDagDp4eynBY6XBQmRIHAb+VqjpySeJz9WO6Gd+C4yiHg68p+4df2cs
         xCMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733002; x=1794337802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+4cGjYBMwET5S3/yL1y9WI8cj6ga2fX+l6VhSdIjFo=;
        b=WE1jRdNVSlJlkT+X3hyEmsqPJSVOTnfHup9E3BmA4yucOx2NMZJb49EeibHoThNAHM
         WR7TEkDiL+duBhQhyIATdRcovxX6tGCSlyrawtlbFc7BonTPUOrG0qPrU8sKAtkSnSHT
         XSne8WMJrTMz9G56eAOxCdTLtqAvmTq3XYQaxshD+rSWgpqQ6AgPzHIrOoYMY5btbxMr
         uYRtb6XECf7ioi1PoZMebV8ay7iluf1dMcb6E/sMazc7/lB6P7mQjQfVwsCDrJaSNnms
         rRdUQTZ9FGGt2B3WfW/IStJ6QxCAN2jNNqWOHirlr1+Y7bR52Nsv49B8PLGcC8Rc60Vh
         eGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733002; x=1794337802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+4cGjYBMwET5S3/yL1y9WI8cj6ga2fX+l6VhSdIjFo=;
        b=hA0b6uFt2QYxEmX7rRrT0YKdeRI/waGjEFmdKF4iGl6hAPI4LclY4aa1fPWtsS18xI
         w0DSWu5uWFzLNdpM4Aq2GxJTDa/mjUaxMwKvtuVFVxsOLweWlXL72a0r1bvopBsizk55
         vtJCiyZd+PLQcaYpk0wlDTUBVHZ41duSzsUT8ZUNwlxAbdspKk2uLahh4i+2B/admU+K
         oPHYiLHP70RKOO8MbnKN+9/GjxpiQpA2FrvDmOZYD4SKbecLeLqacdbq1fpIaTut5IX8
         eoMQ6/Fw9VujJubqaDYDPCTcJFoQ4lBktySozGbZz8nFmxwjTr0TG8pqnkHCIR9xuVys
         1l7g==
X-Forwarded-Encrypted: i=1; AKwUvBzOQbAsCkT6gGrXBAa8pOwEGBWc33qeHPxBlwOtfr6AH4YCgD601+ZB4INv/IPm9VwMO43SrEgUZwKCpVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G5PnU2ER14V8h3zUx5qVumFZQcIqi6oSGwWxbWdLiMS/8FWVe
	WeP6f0KDe90YlXK+tD7ua+sTZ3NjhOhlgLSBPCAXbi38T83PTj6If9OPhq0bWaF0h/eUM/X3fOW
	7pNlF56ZhIcPC+XfvCUtaYq9OEgM+MMg=
X-Gm-Gg: AYBFou2/rBsk/b24oGCc231SEXjdjhDktfxfvLFDm7A/eK6fndyaw+L5R381PMTI9u8
	KoJQUO5afyW0R5DuMWR0x+eghHuGC3kSLMLJQ/r6UHnG8le5aT0OeswnyMP58SbVHc1kY3F5lrI
	o1tzaSttWlrk77AmlblzI8kYliE5auBhFRsmWJ7Ypk+rsk2HcZxQhbLqq2Ueae2vVK0umoCiZwk
	YioxtkH3C3DJcm8z2W7lV6QnBjtVgFixnEHLeJF2GGeASQPANKv+2qaS0D7SjwJqCcBLvIZiZBc
	aj7d0xxKPqAhQaTvPQ7QYmwHsJkaBQLR3ZZHoK/MnOk+WR1y9QqdGrRaAmjJ1NewHCst+WSXuaZ
	uPJ7+XQBCOdGiod2cKb+k0gljuppE7I8Yy5WrMyOzcjxo+CwCdeo+l2JqL1l7ip0i0CYhQ0YosT
	4SKfrBim5MMg0AGmm7CRd5eRNJXYdzlBvosw==
X-Received: by 2002:a17:90b:1b12:b0:3ac:9e76:aa9e with SMTP id
 98e67ed59e1d1-3ae89573fa9mr12431023a91.3.1793733002279; Tue, 03 Nov 2026
 11:10:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023124157.75524-1-puranjay@kernel.org> <CAEf4Bzb2jEjqpZrmtTk_+YCW3_jU8fcVzk26CBZnxkpYJ8kCbQ@mail.gmail.com>
 <317a989b-c79a-41a3-8c0a-7e952bdae6d0@amd.com>
In-Reply-To: <317a989b-c79a-41a3-8c0a-7e952bdae6d0@amd.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 3 Nov 2026 11:09:49 -0800
X-Gm-Features: AclHuK_PFt2J5xDqIZ8k--bqZaPNNyMF_lX84RrlZyhcj3U0kfhEDPOFvmuNTeU
Message-ID: <CAEf4BzY4FYFuT2iSU+fEApnKK4LjHe3i0Xpq_kd4rt4iDLK3XA@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/amd/lbr: Freeze LBR on PMI only when kernel
 branches are recorded
To: Sandipan Das <sandipan.das@amd.com>
Cc: Puranjay Mohan <puranjay@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:08=E2=80=AFAM Sandipan Das <sandipan.das@amd.com> =
wrote:
>
> On 30-10-2026 01:42, Andrii Nakryiko wrote:
> > On Fri, Oct 23, 2026 at 5:42=E2=80=AFAM Puranjay Mohan <puranjay@kernel=
.org> wrote:
> >>
> >> On CPUs with X86_FEATURE_AMD_LBR_PMC_FREEZE the LBR is always frozen o=
n
> >> PMI, so the branch stack ends before the IP and callchain, which are
> >> taken when the NMI is delivered. IBS rejects branch-stack events, so
> >> there is no precise alternative.
> >>
> >> The freeze only keeps the PMI handler's branches out of the stack, whi=
ch
> >> matters only when branches into the kernel are recorded; without it th=
e
> >> stack fills with the handler's own branches. A user-only filter does n=
ot
> >> record them, and parts without the feature are never frozen (see commi=
t
> >> 598c2fafc06f ("perf/x86/amd/lbr: Use freeze based on availability")).
> >>
> >> Freeze unless the value written to LBR_SELECT, which is shared by all
> >> events on the CPU, suppresses branches into the kernel.
> >>
> >> With perf record -e ex_ret_brn_tkn:u -j any,u on a Zen 5 part running
> >> CPython, the function of the sampled IP differs from the function of
> >> LBR[0].to in 84.3% of samples with the freeze and in 0.1% without it.
> >>
> >> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> >> ---
> >>  arch/x86/events/amd/lbr.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
> >> index a55646fcb8465..7ec50380ac81d 100644
> >> --- a/arch/x86/events/amd/lbr.c
> >> +++ b/arch/x86/events/amd/lbr.c
> >> @@ -392,7 +392,7 @@ void amd_pmu_lbr_sched_task(struct perf_event_pmu_=
context *pmu_ctx,
> >>  void amd_pmu_lbr_enable_all(void)
> >>  {
> >>         struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
> >> -       u64 lbr_select, dbg_ctl, dbg_extn_cfg;
> >> +       u64 lbr_select =3D 0, dbg_ctl, dbg_extn_cfg;
> >>
> >>         if (!cpuc->lbr_users || !x86_pmu.lbr_nr)
> >>                 return;
> >> @@ -405,7 +405,12 @@ void amd_pmu_lbr_enable_all(void)
> >>
> >>         if (cpu_feature_enabled(X86_FEATURE_AMD_LBR_PMC_FREEZE)) {
> >>                 rdmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> >> -               wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl | DEBUGCTLMSR_FRE=
EZE_LBRS_ON_PMI);
> >> +               /* Freeze unless the filter suppresses branches into t=
he kernel */
> >> +               if (lbr_select & LBR_KERNEL)
> >
> > On Intel CPU side, we reset this FREEZE bit in
> > __intel_pmu_lbr_enable() if is_lbr_call_stack_bit_set(), with the
> > comment "LBR callstack does not work well with FREEZE_LBRS_ON_PMI.".
> > So this is not *exactly* what Intel side of things is doing, and I'm
> > not sure I fully understand the differences, so hopefully someone more
> > knowledgeable can help.
> >
> > But what Puranjay is trying to do here is to at least make a
> > user-mode-only LBR and IP + callstack to be coherent (for PGO data
> > collection, which we then use for user space app compilation), by
> > disabling freezing for LBR.
> >
> > It doesn't seem like there is anything we can do on AMD hardware for
> > when we want kernel-side LBR and precise IP to be in sync,
> > unfortunately, but at least for user-space only case it would allow us
> > to not plain disable freezing altogether at kernel boot time.
> >
> > Does this approach make sense?
> >
>
> Yes, the intent to keep the LBR and IP coherent is clear. However, my
> concern is that this may end up dropping the branches preceding the
> hotspots since a CPU might keep executing in userspace until the PMI
> handler runs. I'm not sure about the effect that this is going to have
> on PGO but what if we rely on a mechanism (UAPI + tool flags) to let
> users explicitly request freeze?
>
> If there is an use-case where freeze helps, then the facility can be
> explicitly requested.

heh, it's actually the other way, freezing **hurts** consistency
here... should API requested freeze *opt-out*? because freezing, if
supported by CPU, currently, is the default behavior not requiring
opt-in. Or are you proposing to not enable freeze (even if
cpu_feature_enabled(X86_FEATURE_AMD_LBR_PMC_FREEZE) is true), and then
make user space request freezing with the new UAPI config flag?

I'm not against expanding UAPI, but it feels like a very quirky little
thing which also stems from AMD-only limitation of not supporting
precise IP capture with LBR enabled


BTW, the alternative that internal customers actually requested
initially instead of this was to completely disable freezing at start
up through the kernel command line. Which seems like the worst
outcome.

Thoughts? This all seems unfortunately messy, but hopefully we can
figure out some non-intrusive but workable solution.

>
> >
> >> +                       dbg_ctl &=3D ~DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> >> +               else
> >> +                       dbg_ctl |=3D DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> >> +               wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> >>         }
> >>
> >>         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
> >>
> >> base-commit: 0f443787a7f6ae907975742680aac2600483eaf1
> >> --
> >> 2.53.0-Meta
> >>
>
