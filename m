Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792433463;
	b=j3xc0xkYfnbiXTzb3EMmyMR+lkzItUxM8c+Fa8juz40B4wkxyJjhhSy66P6iJONVNogH
	 2QnIFASwvMI/prq8j46/4i0611TQ3u5CMaBs/Iao20bkj0WVxj7fuW6kE735eDXrXOCFe
	 b5m3YOW/3NR3U4dZtEoCFldUByEHER0CcXZlO7v2wzR8U8vCADI7I6QJgke2bJFNt4wVB
	 ob//U+V+GIoHjzw7JW8tcLUCoYJ7GkKiMNaHY1/OSz+n2ERNfREnSUGAAQWabp0RiGkvF
	 2CRCqJq4u6tldswRKksidKnXy1dq1tsExq06aE3BH2lmLst7Lc0fkpzLl0uKhGmIdaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sw/oJwCnvvZ5IV8SeRYvDYH7RjC/pEaouYLNvORoNPY=;
	b=XFVerMHQqOdWpcGI3EgDv8PMhS6tZm1CUYN+5RJUPmkVRR0VwatPE26zaKtDsDxRaHjC
	 P247inGY3GlnpWl++oDoSwqjK7hmcjbqLW0lwg8HtaZOv/qD/h41Z2gEx3OPytkcBGV6Y
	 xoCZU0M1Dw545Wm9s/zoXL9u1SJ97VFg0aniDwwBF8dixJkNGETuGBCV3NZptxsQQuEBj
	 PUT23J12b5SRn/2dylE297aaGMjbOs1svd0NBtmWr4RfWnD0cyC6AXaBzZthtyAIEKxrU
	 YvWyfaUFe1dZ8H6Qf5XHRMibNVzDJt8qB1skl69ORf6KfVmp0mh1fZG/i+Or6ssE9Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XawbiBWp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D560A2612
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32D560A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XawbiBWp
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1177a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792433461; cv=none;
        d=google.com; s=arc-20260327;
        b=ZB8ww1836o20pLSEppJnpNAmCPCpuoEH0yhawMQwCgTt+42evrOt36kLdTI5zqQg12
         wokhCCFKmC74W8zpbPYhPYey8izkwveIsfSDepOPGZzQjL4Qp/4ZErgVjvvNXM1NIjso
         n9egPYQP33KOFr/kpYMZJ/kdu3r0+y2a3pVF6y/MN6y81j6m/MqYh77fjzd7dAYyfiNa
         DH4Za2nW0nv66GMryJsTXrynkRnf+MJCzclHb4MSfzRFedheTV53220hgxGkYEyD0IBC
         kDraAFUOzEN5VXS9RsEqnFqyw+g0uvM0k7ITREGHaKFKaBX9SoGS225ujdEJxtkCm3bc
         CcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sw/oJwCnvvZ5IV8SeRYvDYH7RjC/pEaouYLNvORoNPY=;
        fh=roBnLnTqTdBWu4EnBqe/KZIK0vxo6YqUz5tyBWyDHTw=;
        b=CYKeHADoPvYPl07qLKHjRnjL3zolnmt2eYwMcI2JouR/P73MnU4r/R5ErXBBuayZdP
         FaNt4k2fl+T2hdTb4ap7NKbmA8AMAk42ZJ1zecmypyylXqgzDGGnjRzShOAFwh7THgcK
         bwrY73jgiFxO1A89mMm60MuMA/dGvVksVKavqrBHqqmlVkN5H5MmomepgmhKldA3r93d
         0NJWnN+RFHVq2nhwuH+c1BF+Dm6rLy69A6Fa+uU1bhFavCD4xk4a63KM0vJNKOnor+C7
         Pr8lzBHun/nzsBrw++3Xiotjei/BvGKo1YyzLW6m+d9wic1AFyc3xVdjO+qwqD8/WvAb
         XNNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792433461; x=1793038261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sw/oJwCnvvZ5IV8SeRYvDYH7RjC/pEaouYLNvORoNPY=;
        b=XawbiBWpxBaAbJCrp6sgW2SrdZ1nnwwZpb55aOpDcvSk2bKzJwU1rtiwSM3BYw+QSy
         LJhAib2gkkrM6hvyqj6cFrseRPshfhQRFHI+wcKvTO6v2OG5pJsNNCRuBeaxF6u0m7HX
         JXPn9HOOgvBL3V5ucDb9YnCe9xLndgmSa028loyJqNJZyPnk2lB5Rf7dJDSgKYRD8CPi
         7AkWiYGkZBb8LEB7OtBJ5gyeXCFsDV/+GHZEte8rjxoONXoBGaKzXWPF0WAjPvht8BZf
         eYNk1rocisjaLhsnKFdGUhnEMtqGwefaZ1ZVYRBDLYzW9SgpYKVAvdgoohRuM90dhpeG
         YIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433461; x=1793038261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sw/oJwCnvvZ5IV8SeRYvDYH7RjC/pEaouYLNvORoNPY=;
        b=jfs8LiHw5Gz6nEADctVXebY1Kxp5xfDm2B7/SxUB9SH8xryJ44OHVk9MexquSElwX7
         g+z13jHz20r8GypCWNiE1fXiRL6BbbqXPd5GGLnTjTtANyGRNc7UtWFmufMMJD3AHDet
         ldptuSBUlz9O/xv13greGe9jJIWyMQc95M5f0OiZhd3Ym/St5M5SIV5OxhaiRvahmjTv
         /WjMqvnJoVxMIG15hZnumzXqLwbgISCwG+XyqRrbl2eQBNDtAhki9avNHI45ZkX2M1Nh
         OT+78mBL8oEu2iOXFUjSH+jdyl0h7efdRPVZUKGCoHX17eg2Wwq7auJTssLvSaX/rKdj
         eF6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYvt8gt51r+dPBTSiqA6upgWUmh3OU95jMKumZIeV/6ZbLMnkbdSuTGP4C3+HzmetKE9UbDQkHpo0+2aU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvcYHhRWtTaAV5HG1A8aWmhJx6a5yx+TZY0luNWxh40rTg+C7e
	xL+OVLAQw3xbPsI95acHEPJbSYWZX9ltyv8NsW5LpGF+tHUlip06gnc0jKERhQezVYJewz5ptCO
	zZz3GJnqP4HdhFHjPqg5H48pS1AMRiSh98//G4PlL
X-Gm-Gg: AYBFou1KjPHufNWGNFVnBLohdU8fofvpnNR1FXp6PU2sldTQW03KBj0iRv4Gv7wT3ZO
	ZYoAu7MGKdiIhesQLb96gV4MZK/MX2qLSvspNpSaoJRMOsugfNmx5/h9eMwfl+SfgAxHabjhiVv
	2vWDwlZFeOCReq0R6zm1ZFQTI/22EhE4qlXXshsn47zaj0bRyE8iAWodMtrZ2nsnD6vcc4r3INd
	+wt8KAaSZ9sCK1X3ya+LKtkmOQ1psG9wAbnvCTZjCQxFgzxhj2VpcZz2MXQi563SGMpueuCq9mO
	3d1eC4zrRmGxH7jRGDd6rsMk8EP/baTzPdTI1+P7iNGsPcsBaZBZVFw=
X-Received: by 2002:a05:6402:a542:10b0:6b1:bc48:2238 with SMTP id
 4fb4d7f45d1cf-6b3e5a09b7cmr341a12.11.1792433460748; Mon, 19 Oct 2026 11:11:00
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015060430.5877-1-ravi.bangoria@amd.com> <20261015060430.5877-4-ravi.bangoria@amd.com>
 <CALMp9eRTG=uLkAWohYW0HOoS1xvNc_0brovYsfbCUS_mf4H3Kw@mail.gmail.com> <09e61c95-97bd-46c7-9d96-c3926e324c26@amd.com>
In-Reply-To: <09e61c95-97bd-46c7-9d96-c3926e324c26@amd.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 19 Oct 2026 11:10:48 -0700
X-Gm-Features: AclHuK96mVnG1xIwf-S_D2KmcmixkT9fy4R8_miYUa2Z7RmYqEds8TdrEX_ogIw
Message-ID: <CALMp9eS_jTjJCY_NUbg3r-QPdFT70pyB_=ZgYi2qAe8pyGzmuw@mail.gmail.com>
Subject: Re: [PATCH 3/3] perf/amd/ibs: Simplify event state handling with IBS_CAPS_DIS
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Jayapal Ashwin Nair <janair@amd.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, x86@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Santosh Shukla <santosh.shukla@amd.com>, 
	Ananth Narayan <ananth.narayan@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:32=E2=80=AFAM Ravi Bangoria <ravi.bangoria@amd.co=
m> wrote:
>
> Jim,
>
> Thanks for the detailed review.
>
> >> The IBS_{FETCH|OP}_CTL2[Dis] bit allows IBS sampling to be stopped wit=
hout
> >> a RMW of IBS_{FETCH,OP}_CTL. Systems providing this bit therefore do n=
ot
> >> require the IBS_STARTED and IBS_STOPPED states used to coordinate cont=
rol
> >> MSR updates with late NMIs.
> >
> > CTL2[Dis] doesn't make late NMIs go away. Hence, this patch needs a
> > 50us poll. With the two-line fix in my original patch, the existing
> > scheme handles late NMIs indefinitely: IBS_STOPPED remains set until a
> > late NMI consumes it, even if the event has been restarted in the
> > meantime. This patch trades that for a 50us window, after which a late
> > NMI is unknown (which *is* fatal with unknown_nmi_panic). Moreover,
> > since we still have to handle hardware without IBS_CAPS_DIS, we now
> > have two state machines instead of one.
>
> IBS_STOPPED only records that "a late NMI might exist". It can't tell
> whether the disable actually completed or whether that late NMI has
> already arrived. Trying to infer from software state is fundamentally
> broken, since the WRMSR and a software state transition can't be made
> atomic.
>
> Given that Zen6 provides a clear hardware state machine, I believe using
> it, rather than a software state machine, is the right approach.
>
> I ran a fuzzer for several hours with my patch (+Manali's patch [1]) and
> saw no Unknown NMIs on Zen6.
>
> However, With your patch[2] (+Manali's patch), the same fuzzer continued
> to produce quite a few Unknown NMIs on Zen6. One race I was able to
> identify (with your patch applied) is described below.
>
> ---
>   o FETCH and OP both are enabled.
>
>   perf_ibs_stop() /* For OP */
>   {
>        set IBS_STOPPED
>        op state: ENABLED | STARTED |
>                  STOPPING | STOPPED
>
>        OpVal is 0 in hardware
>
>                                                NMI due to FETCH
>                                                {
>                                                     FETCH: Val=3D1, sampl=
e handled,
>                                                     fetch re-armed
>
>                                                     OP: STARTED is set, O=
pVal is 0 so
>                                                     test_and_clear(IBS_ST=
OPPED)
>                                                     clears the STOPPED st=
ate
>
>                                                     OP continues to run, =
it overflows,
>                                                     sets OpVal=3D1 and a =
new NMI is
>                                                     latched by the OP har=
dware
>
>                                                     return handled=3D2
>                                                }
>
>        op state: ENABLED | STARTED |
>                  STOPPING
>
>        WRMSR OpCtl2.Dis=3D1
>        leaves the valid sample in OpCtl
>
>        clear IBS_STARTED
>
>        op state: ENABLED | STOPPING
>
>                                                NMI (late) due to OP
>                                                {
>                                                     FETCH: Val=3D0 -> ret=
urn 0
>
>                                                     OP: STARTED is clear =
and
>                                                     STOPPED is already cl=
ear.
>
>                                                     return 0 without read=
ing
>                                                     IbsOpCtl
>
>                                                     return handled=3D0
>
>                                                     Unknown NMI
>                                                }
> ---
>
> [1]: https://lore.kernel.org/r/20260310060022.15120-2-manali.shukla@amd.c=
om
> [2]: https://lore.kernel.org/r/20261007234815.4026028-1-jmattson@google.c=
om
>
> [...]
>
> >> +/* ->stop() for platforms with additional CTL2[Dis] bit. */
> >> +static void perf_ibs_stop_dis(struct perf_event *event, int flags)
> >> +{
> >> +       struct hw_perf_event *hwc =3D &event->hw;
> >> +       struct perf_ibs *perf_ibs =3D container_of(event->pmu, struct =
perf_ibs, pmu);
> >> +       struct cpu_perf_ibs *pcpu =3D this_cpu_ptr(perf_ibs->pcpu);
> >> +       u64 config;
> >> +       u64 ctl2;
> >> +
> >> +       WARN_ON_ONCE(test_bit(IBS_STOPPING, pcpu->state));
> >> +
> >> +       set_bit(IBS_STOPPING, pcpu->state);
> >
> > This function needs to be reentrant. If an IBS event is a sibling in a
> > group led by a core PMU event, and the leader is throttled,
> > perf_event_throttle_group() will stop the IBS sibling from the core
> > PMU's NMI handler:
> >
> >     amd_pmu_v2_handle_irq() ->
> >       perf_event_overflow() ->
> >         __perf_event_overflow() ->
> >           __perf_event_account_interrupt() ->
> >             perf_event_throttle_group() ->
> >               perf_event_throttle() ->
> >                 perf_ibs_stop() ->
> >                   perf_ibs_stop_dis()
>
> Core and IBS, both are of hardware PMU type and thus can not be
> grouped together.

Ah. In that case, perf_ibs_stop() can only be reached in NMI context
from perf_ibs_handle_irq(), so I retract my objection.

> [...]
>
> >> +       if (in_nmi())
> >> +               wrmsrq(hwc->config_base, config);
> >
> > As we saw above, in_nmi() doesn't mean that we're in
> > perf_ibs_handle_irq() for this sample. If IBS Val=3D1 and the IBS NMI i=
s
> > still pending, this clears Val. When the IBS NMI arrives,
> > perf_ibs_handle_irq() finds CTL2[Dis]=3D1 and Val=3D0, and therefore
> > returns 0, leading to an unknown NMI.
>
> The back-to-back NMI handling logic in the x86 generic NMI code should
> already handle this. No?

Given the skid that the 50us poll is designed to accommodate, I'm not
sure that the back-to-back code always handles it, but since
perf_ibs_stop() can only be reached in NMI context from
perf_ibs_handle_irq(), I retract this objection, too.

There are still problems for older hardware (e.g. the race you
identified above predates my change), but that's a different
discussion.

Reviewed-by: Jim Mattson <jmattson@google.com>
