Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F282D2382
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509446; cv=pass; b=ZADYQLSVGm8wFm3QgTcmmLZwhyhUXGomB9KyL/W0pLfwex2Ijr0rt5SHcImyQzEJGYwSG2Q8E+gcJT89bxCXN8Emuwc0lZKzIxs8YEKl78Iu2FvyKyWTMXOWt3FmqcMVG7X6Z++e+pDA0wsbWS5Xs4W9CJHp7ASkcyefyn6qmhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509446; c=relaxed/simple;
	bh=B09UMPWh/F9lgVNS1GuZqMBkiWEj9ROYTWux+VQ0uNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrXTLgXDyDsjvPKWrBvyORGQf2Vg3YnkYAtGfQSXZLofIZGLfeMW06VI/LrlioXCbIvUTHgni+a7SGqWBXlXn3/mKBmSVVshpQi7Aw0smFFXETuwxn97cbGpvf2I2C667LgZ1zM1lNVJeoA24SBn1MDJ5Up7pKpsfptPFYwEmG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ipEDkMGq; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ipEDkMGq"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d5fc2cd8so32961cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789509443; cv=none;
        d=google.com; s=arc-20260327;
        b=cPNYLPf1qdg0pSGx4SLzrvKtF2y2mLlLLH/CVBbzAR2BtRX63cHZeuVcccopImnjtB
         Dg67N6TD4rWwtFzuwWDM/e/a1V/ExIk1TI6Oi3QsqsRj7mwnTIXmvHGx6NBKQklqNR80
         Tn9bqvk1HRLiRiO4D52acZplwDP9SIUYCvH9HORpABKnk7SxsLyHldU8VlvR0h3dDwB9
         eoGQJ1ZxFd5sKekqnKS8mc1yW7U38S5GRpxPXU+/3th1B1ZeHPRmYf0dxfo7dJ7frrp+
         p0QWKVtMmzlFjH7deJm5iXTS849m+xowLU8SlM6Tk/uBNV51aDq4DUXqk/NATPqLHQ33
         P9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9uGtBRGXnZY424iSjz1/0UOFBlLVhJloiHB5FKGB/s=;
        fh=RMlIaNAzkPjs5xYPfZqqRvt6P52t6E+4apYYP+hUVBg=;
        b=T9/jT82wf5Va1CKoAP7hbsntUCAZDcKceF2Wkl+dKKQrwUqTtIlD6N3hDhmarIgaw2
         UKMjmC0mUPdgmA+i8LPHNKNTxgB0oogviByjldlaWc16sikcpuNw4lXy+tryHJ+BDkbw
         7FqeXnsv17w9Gr/prQW6h/Uq9lvRM3ubwdYb3m0yq+ob2sJlVvBddtjPlOz1zx0Nqgmn
         9L8CjiO/CPwMM+hExHwog4rhHQrYGnL6h3g7o9y+6rf9VzQasGqZKPeI75VcR1CzoTc6
         rJf1tLus98eLago8fcjSqbBNKRoreUh+CWXyLyiDwXNF4ok4w7BfQw4HiUj+WOxG2Ako
         FG2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789509443; x=1790114243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9uGtBRGXnZY424iSjz1/0UOFBlLVhJloiHB5FKGB/s=;
        b=ipEDkMGqukG0jyBp2kn1IeUA9WH+8G7GKHbNihH+uOglI1iaTWVW09oTSJzzPlRlCf
         Xu/US/6DTx0PBLf2fpSyg4pFRVJvdpOtVRq7iQ6qefPdwx9UG7tmJy7KNOfVVQvTTFbs
         dv/c3GKapgx47JPgyhfpp3jzhJ+vukA9ELN3yueQ5lIwyjpoupnmQeLN5bVNIieQUb4z
         xo2Xd2AgudibnU3riqSg9sFht6Gt4gg1IhY923t8DeSsV5ZfGiIiKo56uWLcv77q/ouV
         1FqSuw9QhABRpjDCOnttcKm3m7ihldnSS+Y0U64kYcibszYtJK9CbADRNVP8/qaJsSCh
         v6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509443; x=1790114243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9uGtBRGXnZY424iSjz1/0UOFBlLVhJloiHB5FKGB/s=;
        b=hrPDJZSx3wblLwd+dz4PposOGZoxmgEG9Su6Nchh8P8lvSgnmOUVqJeh4LGQ45/XfB
         O1vmB/pvSIpNE1vdw5gXFkEPxh7hol+MyZnSi6zIdLNjtPxgjDyDHrUWLKdea67204JC
         UUJ928RlupCtZX/d+dQXVfwexmV3l3rV6Q0yvU5OnNkOKZPq6ReVtX/RzmaqNcodM2Fh
         GIeho0T8uFNati/+r9ei9jxD1CksluJmd2W4zbKStAqXi2/gSGjCnUpJLJL/B4cokPQC
         B73W11DZo79yXlHI4OfBEzhrzJlINfnibnDKMz9uS0/7hykXc/g51nVI1bGogfZvqP3L
         8LLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFmQ1JaZMGPl+dJoX98G6mm6h5IXne0mtm8i03+iM3XbipKEqEpdxBpi1oLC3Ci48GKKCnRgnuN64Mg/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++maaOGOwRKvIWFlpSpar68bl9TRYWyHlQnn8CWY9icmA8PUKHsB
	sn22wZcfHmiX9FHVzWPdEa/1SgjDuxGdiV0yR5IGy3boRgPbORrAibkTS3WSTSJnUHxQxdUIyHJ
	NbuF+W9s06o48M2Jl2a9pGoltvdgrfaNTbIJWzO06
X-Gm-Gg: AYBFou0YNjhDLdMP/iPQTGpw7kIYcWjiOuLt3noL+BvG1ng5SZpmwU1EbSLc9ugWJsv
	5DAZaCvyWXNjBC+Mw8tnQN3hCURI8Ktc+OgdnZ7ar5SmwhBswtaZmCfK5IRratiHcVyMjPl1ziT
	3RHZDdMI5Aj40zAIIgRLwR4TDRAyEErq5mfe/PgWPq2b6eVxPe3bZHZglWu3662Qu2iWdqhDjpE
	hHY5830yJsJzYrLc0igcpBFDPWA/2zTVTji+wiXHhDYSTFq/59x+k2ROEuX6zwaHE/PgymYk2bF
	gik38GoIGGJXh1Sv8NNfQxVuWkNNiXQ5tBWgZRhAqfLSI+9ImK4QzXcA0MenT2NhOerr+CGzAkS
	tQdsoABQ0mw==
X-Received: by 2002:a05:622a:1486:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-5324676bdaemr5224271cf.0.1789509442044; Tue, 15 Sep 2026
 14:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_5A81C3E27E416B65341A899C62ADD6FF0D0A@qq.com> <8dd3659d-8395-49da-94c0-3f18880ead1f@linux.intel.com>
In-Reply-To: <8dd3659d-8395-49da-94c0-3f18880ead1f@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 14:57:10 -0700
X-Gm-Features: AcwNN1WxEywFYfwOJBptmCG3QDtYhtfOZ01mz34Ua51FH_hYVe15d-webU3R3vs
Message-ID: <CAP-5=fVhiB-shPhspmUzrid+JcUEXcE3pkqN6tSg=ECFZBx5Ow@mail.gmail.com>
Subject: Re: [PATCH] perf: Fix lockdep warning in perf_event_throttle_group
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com, peterz@infradead.org
Cc: Jianhui Zhou <jianhuizz@qq.com>, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, james.clark@linaro.org, jonaszhou@zhaoxin.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+a945e9d15c8a49a7a7f0@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:15=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
>
> On 11/12/2025 8:34 PM, Jianhui Zhou wrote:
> > When perf samples a tracepoint like trace_lock_acquire with high
> > frequency, it can trigger a WARN_ON in perf_event_throttle_group()
> > due to lockdep assertion failure in for_each_sibling_event().
> >
> > The issue is that for_each_sibling_event() requires either:
> > 1. Holding ctx->mutex, OR
> > 2. Having IRQs disabled (since ctx->lock is IRQ-safe)
> >
> > The call trace shows the problematic path:
> > futex_wake
> >   lock_acquire
> >     trace_lock_acquire
> >       perf_trace_lock_acquire
> >         perf_tp_event
> >           perf_swevent_event
> >             __perf_event_overflow
> >               __perf_event_account_interrupt
> >                 perf_event_throttle_group
> >                   for_each_sibling_event [WARN]
> >
> > In this tracepoint path, IRQs may be enabled and neither ctx->lock
> > nor ctx->mutex is held.
> >
> > The fix adds guard(irqsave)() protection around the sibling list
> > iteration in perf_event_throttle_group().
> >
> > Reported-by: syzbot+a945e9d15c8a49a7a7f0@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/69122cb3.a70a0220.22f260.00ff.GAE@g=
oogle.com/T/
> > Signed-off-by: Jianhui Zhou <jianhuizz@qq.com>
> > ---
> >  kernel/events/core.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 1fd347da9026..253c514e9452 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -2700,6 +2700,11 @@ static void perf_event_throttle_group(struct per=
f_event *event)
> >       struct perf_event *sibling, *leader =3D event->group_leader;
> >
> >       perf_event_throttle(leader);
> > +    /*
> > +     * Disable IRQs to protect sibling iteration; for_each_sibling_eve=
nt()
> > +     * needs ctx->mutex or IRQs off.
> > +     */
> > +     guard(irqsave)();
>
> This seems the simplest way to fix the issue although it may bring a slig=
ht
> overhead if hard irq is already disabled. Thanks.
>
> Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

It seems this was never submitted, should it be?

Thanks,
Ian

> >       for_each_sibling_event(sibling, leader)
> >               perf_event_throttle(sibling);
> >  }
