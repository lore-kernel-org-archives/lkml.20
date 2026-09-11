Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271434040B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135802; cv=pass; b=RFGYM1iT+1/KeTjixga5Yl67fCV9rFDUJ9t3fu+v5qd+/6ExteaEfJIdAooUh+icHefbLqNgYDIfj3et6vt0B1YPpTK9Iz43mCMoK82bzuh+nCuJrqDTnkNoPv5DZ8GxPWd/fRpzit+Z20dCGk93ynykll5iqy03fQj9XbRDRkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135802; c=relaxed/simple;
	bh=BXHcVrzULy2P7pi6JCluTa8JLwdwkFL7M0JRWFKvrbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjsW4FkxLfXdkyddWp2XcMkfoOqfxqVD0wyVKsvwFmJRPqG+0ZzzLZFoTfmDvDFfVAC7c5+HadPXIKYnRKWzYtpS8kZ2ROgZJdA3URZnOlZHdZO5T454GcOyJD2LNLzfaKT5O9H6K40D9BUwmuneBHukk+nVESZtuRZtAOSUz8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUea+pkK; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUea+pkK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c29667ed561so118004566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789135797; cv=none;
        d=google.com; s=arc-20260327;
        b=d9ozgXooyaCFmd1UVtqDVkhbKr075pXs3q6KIetpS0iaqv7wNkBryminsWzqHKbdUh
         M+SmGSeIU69YnpUeRiwRkIkRYnFjle3mN6iUkWEtYXCYN2PN36i6Nzjr4jP5AQq+ORO0
         SiKYGdu8U1LGE01aYFxA/AdtSnA9sB5O9TfLo0eOUUc/0Y1QBXrucLb3Ab7YZO0cGyiH
         RcO9p+SQzYVW2LM8Q/rgl/+cPwII/NpssJtf3x8QRJxVLjts0FZZBOzXtBFOmC1jDJET
         MYUJLdMEyYEMeUTUDSwOHI2AR8JRAtuhOybBOTrtJ/HuhqP9t2iw5kWw6f9pETAMwh8P
         f1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=asSRwE5cbcPAH7dLq3F4QWLPbKujKZoFILSeoVrS0vs=;
        fh=5vdM+YEUdX6FzIfJcKH6BRzqDN8AtmW36iYNUHQCIlU=;
        b=nzYcptHlf47/8i+iVL05992ISOAzgokiBjuxCKeoL0TBFQC9rFiWpubGhxJME9WqTp
         2XqbzaTo8AMciCkAatxpX/oJEu5YCSgBOxOlcc5I/D2VfRqc6YBZ5CIgYOO8/DSOB1d0
         rAJMDvOb0t3OziWwe3dCNeFhIZKzKTb1L5+sTicKH4bmYACbp0zt9sak00J2+qe3P3P4
         xUmIdn8I2HyJzg8M+YkcD3WiMfF7NTZwxllt6XMzWLrpWnwlD4ZbwfpYHpBUrYgurhpm
         JUVlhRucEHtmFpziWQJYEQuQFovHlmTb8OTtLwoxfb71eRtI6AN9qmJOn5hNIS+hG/kI
         vPNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789135797; x=1789740597; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asSRwE5cbcPAH7dLq3F4QWLPbKujKZoFILSeoVrS0vs=;
        b=gUea+pkKlixWGYD69Q5hPHdfCjHRx/2vD4BgBDHiNxW/N+r2nJ1FBJg3RNf5XIz8/S
         sX+kJmevcoXIvCMsvobrcETikTOFy0xV6ufmKBSlijzhYPUOXAX+nEXH73+eRqUzFLT/
         SrZklq1+jed6BW/4C5IncKu3ulhQ3Go3vr6m8QH+INzuGkDiPQRqp4EKz5soCTHN2A/D
         O7qal+UqreYwdBB07jcpMWz0F0fWfnmlvXNtfx2P2PJcTr9+aBefb6LRaz3rDkHVFHpp
         NInprnIaifN//YmN/AKOjLX3EppqNKzOH43V88KOd0CNZm1rZ0sjhQPW4jCSyi+lCX3h
         Ha+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135797; x=1789740597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=asSRwE5cbcPAH7dLq3F4QWLPbKujKZoFILSeoVrS0vs=;
        b=n3swhSVBvxPpr9Nvn/rQhHmRlRKVOo9NpbZOYd+vPZ64/2MVg5QTGBrb6zTMxLhGFD
         Xzv8+fBvpZxxYjFsksinboeoCRmYsPHZUcr3CnN7BketBFuEmZNFNWz1TKmcdDRJTbn5
         +iMKia83vCUFdF3mANwIlszbSV2fKGCe646UQlM/TxnSIr6QYlL+Oy9nFqS6P4s/WKD9
         ENZ7BQeJKAXKHd+EQC7s1jo3gCr6M4GOhioS0j4cUSWmHG2MNhDKZWi3PmPJjEIefa+r
         Mp+ZWL5w+akOVxZpY+kz9jPrgLczMgJKoQT8eqe5XV/yQARgDMyzTHLVcYzPxho3SFH2
         LZLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGHCzHqlaJ2cGwD+EtCPCam+slPjrn14Ke1dpfONcRiHIl0+lv7ojOiXXFGTvNVqqWTLSveC7oqPmVazo=@vger.kernel.org
X-Gm-Message-State: AFuF++ldsVpBOgBtBN2bTXPeROD3PsleaxeL4xRQLJkWt0OZaYVuYNoJ
	+gUHrhL6ZHDlWUWBXUCm22Hq8PgzE92x5QXtOi0uGbvsRhJuKxfWojXKaNsyVQCWVOXw7GDah7P
	pF+P3Daez+j4o/G1IXY0Z5bgFFHYd1ShD1KrZCCHJhw==
X-Gm-Gg: AYBFou1BfP+SE2B8qHvQ51qA+9KEoTbQ1WZ1YgXPAPSupzzfgez1UIDty6y/JPmNzXy
	4f4yRJb5CtvUfOCf1DsNgd87r8FeQyf1W7S720KFugb8oo8ysmqUPB0b+klFmDNZ2RIRk6PgJOV
	09iv7d1u7J5HP0k0aoeNy0NgjHCFdqzd/vcqowgqiRHMZSWOWEEckdoboIyOqq6Z47l5OcO3uTq
	OzCQpEZm53CFAIWDVkGymRv9MnwVsaANHMV5JYiJsNBdsrF3r8FDV+v+70aWHc85nu9G2WqwWG4
	rG7/iEeg1kH7w2Dgqlzzd+/XxURlAmqZkHopeqKDKlt6bM1Dp4G6tNOsV9/ptzZqsvyKJs2GU2u
	J06OCtPyVQz+R
X-Received: by 2002:a17:907:d8e:b0:c26:2205:3df8 with SMTP id
 a640c23a62f3a-c2966535251mr192834866b.9.1789135797220; Fri, 11 Sep 2026
 07:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org>
 <20260911112056.GY776954@noisy.programming.kicks-ass.net> <CAKfTPtD_aJeAh1biW6gKCLK6BnYcNtbz-FJvxUzZ1tD3V=43mw@mail.gmail.com>
 <20260911135951.GG1837346@noisy.programming.kicks-ass.net>
In-Reply-To: <20260911135951.GG1837346@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 11 Sep 2026 16:09:45 +0200
X-Gm-Features: AcwNN1UsJXn3l1DyF-8sJoEFgt24e5CRafdmusWYJwq_vaA1c5H4jimqUP3jBgU
Message-ID: <CAKfTPtApFGcYA22Qtg3OyYEt6EJw_FW9_VV=_vgE_HtNY3V9og@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Shubhang Kaushik <shubhang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 15:59, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Sep 11, 2026 at 02:36:41PM +0200, Vincent Guittot wrote:
>
> > > @@ -15293,11 +15297,12 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
> > >
> > >         WARN_ON_ONCE(se->sched_delayed);
> > >
> > > -       if (hrtick_enabled_fair(rq))
> > > -               hrtick_start_fair(rq, p);
> > > -
> > >         update_misfit_status(p, rq);
> > >         sched_fair_update_stop_tick(rq, p);
> > > +
> > > +repick:
> > > +       if (hrtick_enabled_fair(rq))
> > > +               hrtick_start_fair(rq, p);
> >
> > While at it, you might want to replace:
> > vdelta = se->deadline - se->vruntime;
> > by
> > vdelta = se->vprot - se->vruntime;
> > in hrtick_start_fair()
>
> That should be a separate patch.

ok

>
> >
> > >  }
> > >
> > >  void init_cfs_rq(struct cfs_rq *cfs_rq)
>
> But that made me thing; do we want something like so folded in here?
>
> Since we got picked again, we should set vprot again, no?

No, because we want to allow picking another task as soon as the
current task has run at least its "min" slice and a new eligible task
is enqueued instead of waiting the end of the next period of slice

This also means that we can't simply replace deadline by vprot as i
proposed above because once we are after vprot we need deadline

>
> ---
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15279,11 +15279,8 @@ static void set_next_task_fair(struct rq
>         se = &p->se;
>         cfs_rq->curr = se;
>
> -       if (on_rq) {
> +       if (on_rq)
>                 reweight_eevdf(cfs_rq, se, weight, se->on_rq);
> -               if (first)
> -                       set_protect_slice(cfs_rq, se);
> -       }
>
>         if (task_on_rq_queued(p)) {
>                 /*
> @@ -15301,6 +15298,9 @@ static void set_next_task_fair(struct rq
>         sched_fair_update_stop_tick(rq, p);
>
>  repick:
> +       if (on_rq)
> +               set_protect_slice(cfs_rq, se);
> +
>         if (hrtick_enabled_fair(rq))
>                 hrtick_start_fair(rq, p);
>  }
