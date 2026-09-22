Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272EF550DC2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086782; cv=pass; b=N6bzH6Du3TjSz4pGmYN17mzKDLRTeHRqyAwGvISNtyE/mDJeCFsIYLz6f8iPVRuh5II1zQcShfozyWWki84dkWLWdkf6JzZtbPo68BzW8WGmgScexuK3nYKckvTP0MV3p25EOOMRzfY3qpX55tXn3ebM9i4nXjw9UVPi09TZ1d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086782; c=relaxed/simple;
	bh=zkz5RLnud3RzFc6Ib7cQ62atsctMsdRsODmModBNlG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWBP1ogrrDsusjb03jXZSiW+Rxlr76m+hSnDoWh4P3I36Yn2xonLF4V+EBT3AnwmE7w6QEo1RUqUPfGRJx1UbCCsoBvy747cQj/ofAWNR1+MAHAhoFVRMglvRBPynTLuwdNWv2YNStLLlzozvowH6V78JCQPpZjFs60lwqrfYgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPxk8rAW; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPxk8rAW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso623642366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790086779; cv=none;
        d=google.com; s=arc-20260327;
        b=Vnoo8cwdKyFij5moHILHnmFzEq2ruRbV78Qy8hZRQo4KCugIDIw807O/HibFiq7q+g
         uAdsgDaX62ZNLtSfNSqJEKYw579C1TX7PuViKlWMK5+IwhUpk+zRSGiXyxt8ESZWiQeA
         WRSFRNWHzh22VwGhvxzb/O9/IV35WlXErtdJl4O/d2QYx8i8ML6cq9d+2BytYqbf28qq
         +5JpxRYR3rjMGOvQzJdDctivS0iZmE0nVM1m21f0VPLEynt8B3DL5ZpEOJLnZs5kpQEm
         xFCxfZ6UF7M421F/ZDpquNsZnGWy9kQFKVsD+DdUabIkQ4xh2rCh7KtmxpOXzuco7Y53
         adnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3/tNZqWYHwZZzsWF4FchE0g7ESkGTQfDfnqo89GOpIU=;
        fh=Ax1GIcdf/7rE8mWvVpHdmQaa+83sTAqTftamgEfVIss=;
        b=IiZeyHpo96YHSP2u9/yitYhSpMifCwRXebL1nQvTQwL24RUU/EQJjt6FVWcIU/2MkE
         i/wNf5quhxyxrAB6wLx91LWeqdO6gYQ9JknMlmk3e6zM/UU8CkmPGkbbPLcCP2ZRZM9T
         L8hrWg3+dq1goiIOeTBgSSIFK84BBLNEDwOYG8qLmm3zIKa6eXTV2hGCMxjSZijBZWT1
         6e6ci1jRYHP8LIqS82xjgjLh7Gv7+DMkvpEEUNbo8+WCFXCtP02PLBDjpgUxzeEq2AnT
         //Lt/ZGOHS4xGZ6VLMTpju5ixM+SyWSC8goIE6uzIiWVF6StJf2Wis3eJ/GERyNwrGab
         heMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790086779; x=1790691579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/tNZqWYHwZZzsWF4FchE0g7ESkGTQfDfnqo89GOpIU=;
        b=FPxk8rAWZ9hRK5p6cxc+AWyhoMUOfY5e2+AIksz0Z8kfpw+jAL1oTHNtVmBsx4C1L3
         S/vNZmF6N9fYbDR5SdlxnhZsakJ3id31hZErUarwk+6uY2Az09Rr9sdyNo8E7xtCVcXs
         +giQ+eqgGP/OaZd9brLIEd2FSlWsmZlRPEagv/yG+RV/9K9lvPVOVAa81IGGf5Rioar/
         0mi1xa0FCBRyo5mraI1wZUPtNe75uvtVoiBoC2vkzNvz23tfyn1UHOPnXD5uqaccp6SB
         LFgn5G2rFLIQ+oOdnFX3mEkSmztOX50jmZ99g2NQhrdLq7OYdx5lhzJMsG223dBM+wnR
         TzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086779; x=1790691579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/tNZqWYHwZZzsWF4FchE0g7ESkGTQfDfnqo89GOpIU=;
        b=yrus2n/+xXTWHLPG818EWAB26/8aX8xkFVtwvsfrKVxjgr60I0dANA7Jh19xY3gX4z
         Zbz/KcuVQufYRDTeO1kyiMkOYAPh+tYfczXxYGiuEw4WY533E01yPIviVnWRP1TNX9ip
         itP5RcSEj4ssochB10VhSghnli+v46gajDm5G7YkTEmh74ZsC5BMmZjmkxPQH6Pc9bQz
         KqkN//emhM8rlsOwgRzLBIRCMTF7aSRnSEoOY4Z2Q5VPO91FWDa+oWp7gCz3EVjkCseA
         bMWZzGmHdRRZawJAyrfOA9dtH4wQwZda2UpAph7IuXsfUe9WucvDzIA/QPW6N586MSwZ
         aWuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjc2iwffyOU3GdQ7ucKHA6EL1c4cR0b3EKM/dgp8KRzWPQcc80zjni/zL9P4baXM/kNEEaLObDgfMt1QQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lUsvZW/htgiR+EIuGXwgv75fKaJ+RmaiPemsp8wd0QeVipEO06
	fybNLglA+Lwq2gWpQ9jqwxYXa1sCANd7k6rPO2HtNl/nAdM2ptGCjW6aQYlUzh9E4n9vXlj9qCt
	kyBs3UP5qG2UeY56M2+G9DzDMPL6EpA7ZIxPp0Qebsg==
X-Gm-Gg: AYBFou09XSW5eAnKnjkJRMi+yKbExlX1I6G1HHiwkf/FVIEpFVtgNqH8fGbcdRKKNjl
	R4ivwzNEyXiIXdVGqDLB+qwlzABXjTl/okwWl3w2xLShYWInQ3dilaxAK7hJ4MXMPTKJDG8FHOT
	lpdwFsH5VVZ1t8YACDidxMC2K2DBbWJ7lm4S5hC2JWU9hCXuKu39MixxaZPNalpRe2L0ognKoWP
	ZcfqMEGv8O1Ym3D+eRWo78835Bosvd7VZJbw45aDwnliu7dK103biA8LnOcUeXGqAVTrcywgEIL
	1upUhbR9n6auKNdR3FYIVzc+OwOjr+J6fSdC3HSstzq+peOE3z8pO9fdQomsRqHIej+y7dLbmcz
	frkGHQZpYG1CA
X-Received: by 2002:a17:907:3f0a:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2a158299d8mr1195821966b.47.1790086779239; Tue, 22 Sep 2026
 07:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-7-vincent.guittot@linaro.org> <20260922101735.GR776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260922101735.GR776954@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Sep 2026 16:19:26 +0200
X-Gm-Features: AcwNN1Xy54zDw4ahM98Ul9L2UM8O-l61d96SXNqfO5J2Z6fbweyL-0ChSNIlyjA
Message-ID: <CAKfTPtAi8J9mdLx9DhBCwMK3dy8ffNkvL25irdvgnenj5GKuxw@mail.gmail.com>
Subject: Re: [PATCH 6/8] sched/eevdf: Add per cpu cached min_slice
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 12:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Sep 21, 2026 at 05:22:36PM +0200, Vincent Guittot wrote:
> > In order to use min_slice during cpu selection, update a cached value when
> > needed after en/dequeing a new task. This cached value includes current
> > task.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 739a3af60520..a01a88dde811 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1089,6 +1089,21 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
> >  RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
> >                    run_node, min_vruntime, min_vruntime_update);
> >
> > +static DEFINE_PER_CPU(u64, rq_min_slice) = INT_MAX;
>
> Would it not be better to place this in struct rq, near data that is
> already accessed in select_idle_siblings()? This more or less guarantees
> a cache miss.

Yes, probably.


>
> > +static u64 get_rq_min_slice(struct rq *rq)
> > +{
> > +     return READ_ONCE(per_cpu(rq_min_slice, cpu_of(rq)));
> > +}
> > +
> > +static void __update_rq_min_slice(struct rq *rq)
> > +{
> > +     u64 min = cfs_rq_min_slice(&rq->cfs);
> > +
> > +     if (min != get_rq_min_slice(rq))
> > +             WRITE_ONCE(per_cpu(rq_min_slice, cpu_of(rq)), min);
> > +}
> > +
> >  /*
> >   * Enqueue an entity into the rb-tree:
> >   */
