Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B373769E4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143952; cv=none; b=kpJSePGWK1h1flUR4NSG+xzE3Uv+j28nxmxMpLcSE9kyUJQxqPrf+dQvG7JM7gXhk9CQpPIDwRbsFGSCwjGJ7iFtRvoIv4lP7CTZ7lh6Qt5Yuez/YP2cpl9uE9UFdnWan7t3apejFApjO/bqI1r6lOj25j09gyuiCfuOEBDd9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143952; c=relaxed/simple;
	bh=4tPXz9Rk1K2hYpb1RQXWkMQ+evQ0zQw4aKRNdaLFJ1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olzSJu1M/IG0A4NcLJuZg6yNLQi+hTE4P7C7RoefEhy2tcexker+gstbbWrTXk7z9DSySbMwjsWR/IrqaKP0H4fOb6yD8nAgWxKcLTYeLKwmMeKOUAr5YxAQRDRxYTrNf0DZhfu/eYSBTO5Bn5UbWin0PeDzz6QqNiYjr32QNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvEalBya; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvEalBya"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1819024e9so5659635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143949; x=1792748749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yTTx2Y1mYahBzavN4Jz6BN2wpn9UC39g5vXrmyYTrgw=;
        b=WvEalByaJidOdH7bttBwj+91tVBvIzndLfVbmyS8MQq4SrHPudIgBfuA1EvN0fRJLV
         GwIdeTngYyBdvhX4DkQn7GhUIiqgkAaPHfeHiAc8JeMT6je9TlLqzfMlCtAi9kRyW2mz
         0FgQrnSy+7SDoRo4Yr5SMxS5C8xwvuRHn6mP8dCjByVD5VSzsfFnK6qyCpQqrI53Bs5c
         31z8KfFKOorHdKHjzD0j1J4WTD/5sXoHyK9CYybXVEVpcBw0d5zPCS0CvRe0aOTanQl/
         RjMuKnyvFq6nQX1qY6rtv2qrxV/eCsPntPpwcyHr3Gi5cqf5ZnvFvkVdmDEw8kLWXiDf
         i31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143949; x=1792748749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTTx2Y1mYahBzavN4Jz6BN2wpn9UC39g5vXrmyYTrgw=;
        b=BFcRLEPxt7JO/ivbczlfbEmF+YDk3BwYNnqe4krfZvG/F/3lY7VHF9l/DOD6f/u1V8
         oNSaXkLvioft66u6b3At+btrLAEZ+p9f50EvGsbg5AqCMtb8wkQEwZWeCgs3Wr34T0RD
         DJXpzNhBeuyrL+vWqau8Eh55tgX+vXAPWAos2YSzVWYdVu0L4QY/AaQGCHAtVrDiljKW
         PZJaemxioeBfZ/OybdaHw7E8xu5e9RHJ+kd2Ow6EC4YJSo9SXsC0S4AYXooGDLUZ64kO
         lMwrY3cPHycF7wX/t+yIuPKAtRLyWG+2LF0CD5h8SeFP/0Uyh42+ZP83fsVvsyrFc6mm
         V+Vg==
X-Forwarded-Encrypted: i=1; AKwUvByC5OFbNw4OYVq3ek7XK1p16qfdp7mBuB3AQkGW4lbGiOhcP1mwxhdKN3G86TbzzH7bLRBlUYEE4zhMSo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhF8L6j4gh4UA4JCD3brtYl7Gt1f440ikcF/Ve1raOQwXz/mdf
	44Ypbe7IW5sMzrSXT/vVbwaHEUj8PUjjGFjrS8tI7yb66DkUpTS29pOs
X-Gm-Gg: AYBFou3h3rNLioZE14wzoz+ISLhotZun3SNRNuDCnGQWm9df9Hw63ZvG9QA9Yck5Pae
	ray6pQQodCmxVEvCH4D9j6usb1iKKbkSav3ll/11eT5WSonIwdCxAIfzOK0e76E8FnIFPU06ScW
	oAuWVxIUjpmfO3rUWCu0BqCjGJ9NQGztL2uPOmasgys7ETEAQjFU4pWseRpt88rfXPCfNbjBj8C
	EH7cheTgxavZTlGP4cGlQ+6nS/xwGzPGF7vUdULRV2/N17wmyio0KcgItCOpp6RGhAUiK+7Nm/9
	E1xtwDyS/FAe66K+Dr8KZbG7JKV+X6/Nz7KRK9WuajONY/SmIe/CSta4WP0uNhIuxWHinyhUcLf
	NouQQrgR4sGwJbjbsjHq0EHSznzBBKd/RjYNWmgbUWKpm+eONcW0WapfXMLAzgy0e0R4IQ+rEAd
	X7r6pxuP0WDyxsPMF2NyDAcH5tv6xXbPmGcTsXwuzYyhYRMHX4m73fqPrXhAU26XxfayV2/HXKe
	N7TGhhWAir8W+NiUSD6vrs16A==
X-Received: by 2002:a05:600c:871a:b0:4a1:cfa7:e965 with SMTP id 5b1f17b1804b1-4a1cfa7eadcmr19158585e9.1.1792143949302;
        Fri, 16 Oct 2026 02:45:49 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c575esm3520740f8f.10.2026.10.16.02.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:45:48 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:45:45 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	christian.loehle@arm.com, elif.topuz@arm.com, linux-kernel@vger.kernel.org, 
	mingo@kernel.org, sh@gentwo.org
Subject: Re: [PATCH v3] sched/eevdf: Fix vprot across reweighting
Message-ID: <atHwIzHeWaw1kXXm@scheduler.schedules>
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
 <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>

On Fri, Oct 16, 2026 at 11:15:31AM +0200, Vincent Guittot wrote:
> On Fri, 16 Oct 2026 at 10:46, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> >
> > Currently in reweighting, while a tasks vruntime changes dead protection
> > could go alive, or alive protection could decrease, increase and go dead.
> > Fix it.
> >
> > Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> > Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> > ---
> >
> > Changes v2->v3:
> > * Rebase and move the enqueue_task_fair() block to if (!curr) block.
> >
> >
> > Not tested at all :-(. But I think
> > This should'a cover the shced_change_begin() path same,
> > since curr == NULL, so we always enter if (!curr) block.
> >
> >  kernel/sched/fair.c | 28 ++++++++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 0feec172fd37..4593d0122d66 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4892,12 +4892,15 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
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
> 
> This part looks good

:-)
> 
> >                 if (!curr)
> >                         __enqueue_entity(cfs_rq, se);
> >                 cfs_rq->h_nr_queued++;
> > @@ -8155,8 +8158,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> >         int task_new = !(flags & ENQUEUE_WAKEUP);
> >         struct sched_entity *se = &p->se;
> >         struct cfs_rq *cfs_rq = &rq->cfs;
> > -       unsigned long weight;
> > -       bool curr;
> > +       unsigned long weight, old_weight;
> > +       bool curr, live, running;
> > +       s64 dist;
> >
> >         if (task_is_throttled(p) && enqueue_throttled_task(p))
> >                 return;
> > @@ -8200,8 +8204,24 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> >         weight = enqueue_hierarchy(p, flags);
> >
> >         if (!curr) {
> > +               running = task_current_donor(rq, p);
> > +               live = running && protect_slice(se);
> 
> IMO, "protected" is a better name than "live".

OK. Will rename it.

> 
>  se != curr so why is this needed?

sched_change_begin() sets .running as task_current_donor(), then if
.running is true calls put_prev_task(). put_prev_task_fair() sets
cfs_rq->curr to NULL. While the task still is the donor. Then we enter
sched_change_end(), we call enqueue_task() with cfs_rq->curr == NULL but
the donor is still p. There is set_next_task() call afterwards, but it
does not sets protection since its called with SNT_NORMAL.

> 
> > +
> > +               if (live) {
> > +                       old_weight = se->h_load.weight;
> > +                       dist = se->vprot - se->vruntime;
> > +               }
> >                 reweight_eevdf(cfs_rq, se, weight, false);
> >                 place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> > +
> > +               if (live) {
> > +                       if (weight != old_weight)
> > +                               dist = div64_long(dist * old_weight, weight);
> > +                       se->vprot = se->vruntime + dist;
> > +               } else if (running) {
> > +                       cancel_protect_slice(se);
> > +               }
> > +
> >                 __enqueue_entity(cfs_rq, se);
> >         }
> >
> > --
> > 2.53.0
> >

Thanks for the review!
