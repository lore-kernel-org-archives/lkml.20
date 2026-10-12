Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695148A8A4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814462; cv=pass; b=Ilrz517uv1wsAZMSi3EwDy3joIUKi2X1lwigjAmRUD0vBNdO+XHOqUsNL/DaXEUQ8J01NFcPA6Rt+WpsZ88g2S6j5Bkz9qTARnIc+WddwZ5q/GwKnOsNN1lF/adcvDHqg26PAdImjq3gqPNm2+ov8OS9J4aBnrLHQ4KdqZ76KxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814462; c=relaxed/simple;
	bh=YEw3BCM/PoYgb0zSYAg0r4bFcJsnobtOYbAb7vYR2XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtCJVGIYdM9lLZGBonVShb7nAM7FRq8ek7rzpKuAqlZww5CUcaVhdqlYDfobBdp61m3qEAJ/nDyDx081r5iVlpjcg/3qfovO+r3/XlgFnAjF7ILP0cM8UaKiv8qDRfqdj/IOG6mG7lLFo1yfx7eAz+cNmeYG34C1bWLpx97PZOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PFD7WvcM; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFD7WvcM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2566038a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814460; cv=none;
        d=google.com; s=arc-20260327;
        b=f6RcBYl2csKJNgyR9yNKrwGdDrrf+yXpZ72FpfaYttIuhUPra2yFUOJMRKHynBzrQm
         SSnDsO1iLwc08mZQh8aaBgghgLUaf/qXUaz9HavNB02qbdyruh8jVhPVf7C9ymnPASsA
         203CY275Rx70Tw1v9Uyt9rrKxcwkoOeR9Td8SdspdyxDRK8OlTqv/YmfNKWaWQRlu3t9
         VJTMMLvDAJBvH3b86O0xlMLkKqDGfhRzaz+Lgncjchu1degcIjNu7XCXdqYAb3Sl9BuB
         IXFdM7+/2+qAKfbEzYJlCaWr/XkO29+4w0mfxMuL3geT8gqA4GuuWB2rfwT9yaHyGYL1
         UKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NCzAE7gW6XqdbBbYpEXlyCwe1KctWvIRVnjVQu62JPA=;
        fh=J0rJtEHgr9ntp+cfPlofKutMWkGuHsDtS88h7TePzXo=;
        b=cRMQrvE/Q+iON2prz/noA9QWMVLYpvXopR7Ihep31sm6BQrHSpd9d0HYlBHbHJf+kk
         jpBqhHpAfbvj4z4yrG38vEWTutindwyyqQEhgOl1BSR5t+3QGxIJEjxmADiqRlZ9NlwN
         OlVFb2LZy3+SjWH0MFhTZCS1Akch9tTwqOACCS1mk8AdS14omwZoPLba/dRYvijjzNX9
         MRAF44tpV57pD2tXsVVxcpx/ijywo1PnUdc0T5ssJqrpkrDTAgZUTpL5r0xcBWt2WvTI
         Zc8ys6KgB6BwkhdOIEQozc59tWU1NNLa/T9Oe/Tb7xXjnSdXLTADpS+RimP2PAtdNzru
         v+Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791814460; x=1792419260; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCzAE7gW6XqdbBbYpEXlyCwe1KctWvIRVnjVQu62JPA=;
        b=PFD7WvcM27AcnG3phS4McQrUsb04iVEtbyf5heCBdcP/cimwg6FrdevxtFPaxaHnbu
         AI/PfZTDq7AG52oO0NRemPzFXWacTyFHnyvdR93Yubgk+5qG3d8E8gjYT3cUrt1OGB3/
         jJuy4XVogm14EzL45B9i/t5ypMThQafSl/LjnJOgR+gaOZnNOdLotj34jV91W8CPpuIz
         2+yX69C+y5I8tKog0b5f52gPC+UOoPKXPynuoqJsTHOl5H2GrEvbVWEqCX4IF+0+1Pm3
         ymRp0Q2CXlcPgiyNTDMIWU/BAEcPwGUJS7uBZX08t4ZqGYgeYMEv3EQsWJqTvXJv3aCo
         yFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814460; x=1792419260;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NCzAE7gW6XqdbBbYpEXlyCwe1KctWvIRVnjVQu62JPA=;
        b=GLLjLwHJ5ZlDPZfox4FknvdpS8HejoC/GR9Q4WaRcoq0tViyvXfKjIbWQCFB6LYrtc
         +D7cbFbj/42GcO5TaPHyTO0rJRQOa5EG46HKvsi1SaF6SGlyWjg+lw0ishDYxYV6oReB
         cOp8mt2385eb/tKHY1ZH90SXHRH41iCm+Y8L97l2OBBsaQXifX06HWjy1Y2dw2UsY7+H
         OJRZurTO4UNwb91alGtYGxgLBccSO3W1UtySd6DkWhH6tpWxoCAjQQ0xcjqW3sDZcCy2
         MvDNipzUOT7mfCAUK6+YCDJICn7nzJQW0ROPAZBzRRMnhpFIobv0sO/TpddBldgdyKZ5
         onew==
X-Forwarded-Encrypted: i=1; AKwUvBzAtg5uXJbaP43zBqk+sy+Pd61GF6P7wm/t88DgJqAy/mK04p/NFW1qU1F2pCC0V+IpT1LGH9WwqO8cpN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8d/BDb4TEt5sy1aJYOHjhPh8DSb2bnoEMj4+vY8j+txumzurY
	Cko7aSmI7Ny4uLp357m5/6fnx2tpqLVMTEszq2D+4A92bNED6g7rbMfiQwW5Za/rYraa1X4B5rl
	iLuaDpBrkd80KO1cnNQwqSLNLkC8S9U4H+jpUYeqW4g==
X-Gm-Gg: AYBFou0ip1thed09uYWG2k1O7vfQwNiCaHot54r9vlAPiUy4t/SBb8d4nUaRyZVZH0g
	MioTCJ+wgRd5hbjDX3JWDrxHOdLNXtrrWusGYgH+qdGvjI7MLvIfVStqIy2niPogDyexS/22nZi
	aPo8no3wLa6mjxcZ4kQ9S/K/J6Mv5uPo5qj3fjU9s8oEMlPa++p9bF+/wIuJrffvolC8mslp4Yn
	57ST1Ahp5AThY/2QJw0pVJmBULQlDHHd2Kb/0RyAKV8ypVmYKy6vdy0IjTuna5CDoxWLC9yBEsj
	2SOrkCcAOwN9pcAETnlI5lm2NxiSntTp3HK87Ae5WEZ/FPSfRW5p3quX2nDtBJwfZGG8TgSjJNO
	1bFlOXJ47WOQ=
X-Received: by 2002:a05:6402:52d6:b0:6ad:b23f:e325 with SMTP id
 4fb4d7f45d1cf-6b17c29829emr7557284a12.20.1791814459546; Mon, 12 Oct 2026
 07:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKfTPtC_DjYGmnHuV8x9HEoea87pfrpfNWwHT=sGeSP8UOL2Og@mail.gmail.com>
 <20261012135920.3247-1-kayracizmeci@gmail.com>
In-Reply-To: <20261012135920.3247-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Oct 2026 16:14:07 +0200
X-Gm-Features: AclHuK_KMpYrx2GnOO8HKVwMiaFe6JNjjeAU-8-ojEk_3mxXKNItDvclCFj-pCk
Message-ID: <CAKfTPtDDWo4n_AS6fSryz3NenDvKw04shmGM3wcv_MF-teDHGQ@mail.gmail.com>
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: bsegall@google.com, christian.loehle@arm.com, dietmar.eggemann@arm.com, 
	elif.topuz@arm.com, juri.lelli@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, sh@gentwo.org, 
	vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 15:59, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> > I don't get why you need to a se->rel_vprot and all these changes . If
> > we want to ensure that protection will not be re enabled because of
> > rescale, we just need the below
>
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 5c98d8dfce5d..e83836fe44ef 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4951,12 +4951,15 @@ static void reweight_eevdf(struct cfs_rq
> > *cfs_rq, struct sched_entity *se,
> >         update_load_set(&se->h_load, weight);
> >
> >         if (on_rq) {
> > -               if (rel_vprot)
> > -                       se->vprot += avruntime;
> >                 se->deadline += avruntime;
> >                 se->rel_deadline = 0;
> >                 se->vruntime = avruntime - se->vlag;
> >
> > +               if (rel_vprot)
> > +                       se->vprot += avruntime;
> > +               else if (curr)
> > +                       se->vprot = se->vruntime;
> > +
> >                 if (!curr)
> >                         __enqueue_entity(cfs_rq, se);
> >                 cfs_rq->h_nr_queued++;
>
> > or the below which is even simpler because vprot, vlag and deadline
> > are rescaled with the same ratio but it implies useless div64_long()
> > when the protection is already canceled
>
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 5c98d8dfce5d..5d1b16780b52 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4936,7 +4936,7 @@ static void reweight_eevdf(struct cfs_rq
> > *cfs_rq, struct sched_entity *se,
> >                 se->vlag = entity_lag(cfs_rq, se, avruntime);
> >                 se->deadline -= avruntime;
> >                 se->rel_deadline = 1;
> > -               if (curr && protect_slice(se)) {
> > +               if (curr) {
> >                         se->vprot -= avruntime;
> >                         rel_vprot = true;
> >                 }
>
> Here:
>
> https://lore.kernel.org/all/20261001164609.244156-1-kayracizmeci@gmail.com/
> https://lore.kernel.org/all/e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com/
>
> Because on_rq can get false. And alive protection complicates things.
> And this diff alone wouldn't work.
>
> IDK what else we could do to fix this both cases cleanly tbh.
> But there could be a cleaner way.

Before 819224e506bc ("sched/fair: Remove dead code on
enqueue_task_fair()"), the reweight_eevdf() was not called for curr so
the false was always true. If we can finally have enqueue curr then we
should skip this case

>
> Thanks,
>
> Kayra
>
>
