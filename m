Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409028;
	b=XlwKJ2bijKswf3n5u27mn78YJ+TCu1gO319cDEhjXKqOyg/17TUr6RU98EoV24P3ISxh
	 ZUiKyM1w5wc2WWs0dmcdOdXwJ8fA3lsaqQEhLRp5Zb1BJYlkFWDs6DNvTHjpKpwCb1N7p
	 D0AZdLGkZ4yQZpiL4RhVTuAn6UBKYW6Y02So0HENULXIGGMk3OirU1LGGvfzejRMoIJJ0
	 xv0A/wBTeJKHY7zNCJcalc07uAD4GEYI3GSfiDXN1tOHcIcXt6tyDuZ7e0JnEYK5M2jo7
	 mLrIb4xFKm5phRyqS57UmwujeaNgiXDLxlgkh5UacEHEm7Qz0YUThdvUdiEQezDNnVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ug9mwWVFwbnhzGL168EwFXRoMbjgNuP6wmRVD3M5jGk=;
	b=UI8rrr7S2m2gjyZ2cTwRZ4JOygPHPdra+R4rKn8bnp0wGflVj8iVP15GkGz2MAP309W5
	 XIWnPc5/aoeArpMIcwjnV0t1IpF2LJ3wUGWzy2ZCFavDUweEJfjVSUMLATNWtPK9KLVG4
	 J6kLD1rgKG3eT9GTZbfEHNqkyXQxJJnjU29ulo2ciN9ne1khV1r52vs9xZdPbzH/K01zJ
	 TO5yHWGsh0mfK2qGqrAfdIcmJy8gVrcrskLkNHmdG64jnxwc4uGFjvSXu18ir0+fxTBat
	 VJOD99DIqj24YaxhOfyVBRln2LzlToTPCQT5b5sdKoIAPgvTKu1MyHRsRQx0r0LZj7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jnn1s/if";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80DB606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80DB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnn1s/if
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso846335e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409026; x=1795013826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ug9mwWVFwbnhzGL168EwFXRoMbjgNuP6wmRVD3M5jGk=;
        b=jnn1s/ifW/VfsoGU+9f/Vl1N/ELbTsf94NWl8f9wy7plMiC2GuLI2SSo6Y5f8kc1nr
         bqilepJZlPgVgBFM3Cl532BVFs9FkBPvtuFBB1/fXnZ05jtJPiY3DJLWusJraOLlzMTb
         QiylWPVUUPpEl7Abk5lQBJ/gpdH/WL81VAvZa2AqytLDn4NvO1wgoaD+MCLBbOkE3iwp
         WLROH+SID+3ikLf6q6uIpQ6p4lxuDsmeDDqSL4XQ5y5CDfOuCHh+T2aepqPuhs1zOMwX
         c1SyoG81XjPYn6PvcUBadRXw8853apnXRlWuO6hjZPFaymeSJmkQQo1NwfuGFeXWpsqR
         5F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409026; x=1795013826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ug9mwWVFwbnhzGL168EwFXRoMbjgNuP6wmRVD3M5jGk=;
        b=UndIzS/eAwlpGRDrs1biO8N+r4v0A9X/aerV8PKswBMlLs7b7jJRG+RYHJsrjiZTiM
         s1FniVS4vr33Eoim5Wuq+rNcEEq01LaLZeDzFU4EtZn9K1sIfpLcAgm8KSYKcyeLBsRA
         7Pc+/BIiDUIwXgcOWNM3ExVDcG+Xd5aHIcghlZOA/f/EOAHjISN37juuSz1oEu0RSHD7
         i8WZ4S6VJePwr/JPQJlr3qLHBw6EHACMMT/jaO3q/ptywcz9WHAVzFqKPZkWp064Y0o0
         H559ZVoXNVfq+xrSxOhjkniWXT9CI/J6tm/QZBIwCJnOfT7pSb+kSsnAhTau3FGTsNdI
         qjYw==
X-Forwarded-Encrypted: i=1; AL+hErGa+BbgD7aSnkyOs+IRKjR46n8S6NF7wJgnzNRfgANxQMageEBSlkCFun1XoUyHOhXA5ukmBm4vCl+N8VM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nC0gWMoIjVkVOxC/A2apZI/K98lHz5UluGdm2NgCV2GbXtH+M
	QoeAf0jLiph+QNyF0MyCpe4eFsxRx7d1pSxh3AZnoq2WwetFOd4ywEGLMNYWCQ==
X-Gm-Gg: AYBFou2qtR4aZ77uHBkOmeaP6becUfxjpmY/MaUg8asMR1LncVvSJCLlOG6BZVImW+7
	f/IkR5nXfEO3o+bYe2089O8eFiDBWdNCX5bdNUrTX8vaPSwooosbrmiu4K7mmhBSci8+uUXQnYO
	7VF/X2VVPeaqlla1q6wh9M177f9RZ/b47zKSye8W4d6BHTJyMVP7L62XOI3FExSzw3YIasheeLZ
	mUtv53k5HEkgNkY1+H8crsaeDTvQm4IY3Cy4b4SRAiX8naH1ppctEGq3eWpYiKu5xeEOGvixP/t
	lEwfLxihIMHzpv8B/rNvx8nWWGYqIy9o8LqP0oE7dDhDSZHCdohlTC3McYZlor39ydjWzV6JiMP
	oQUYhMNL/xZJ5SiGhPSxfovrPs7NMSZwWQZhmPJ09Y10npS5Evv6nIpidHN87Qhz+23NUtNhJR2
	bLg9h+eniWw5dUTSEe1+uWOwzo9Hy5LZcDV+mz2slfGWpGGS4XVyMlpTQCZuSD1Hv3g4lJv9fRl
	T/GixEOFFE2scDt2hUejbdK8lJbvQsheY+v9GHc+5N6WAkqhUBH6bZKPtteRwP4srlEJzHd9fuj
	zXtm/IlG/9Zq73c7XhZ2vDfcLwbvM71b+4XbPqKT809um8bnCp5ghKJz
X-Received: by 2002:a05:600c:1c01:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ba091a9528mr60771345e9.0.1794409025757;
        Wed, 11 Nov 2026 06:57:05 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5553casm1683435e9.14.2026.11.11.06.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:57:05 -0800 (PST)
Date: Wed, 11 Nov 2026 17:57:01 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, mingo@kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <avRzGYNT-_p3KP9R@scheduler.schedules>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <a98c40701cc874318e7fe475d90795c6@kernel.org>
 <20261111130512.GO2668200@noisy.programming.kicks-ass.net>
 <20261111131152.GD2669272@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111131152.GD2669272@noisy.programming.kicks-ass.net>

Hi Peter!

I was just going to sleep but I thought I'll finish reviewing this, then
sleep or maybe don't sleep.

Big mistake. Nevermind let me have a look...

On Wed, Nov 11, 2026 at 02:11:52PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 11, 2026 at 02:05:12PM +0100, Peter Zijlstra wrote:
> > On Wed, Nov 11, 2026 at 01:18:42AM -1000, Tejun Heo wrote:
> > > Hello,
> > > 
> > > On Sat, Nov 07, 2026 at 12:59:25PM +0100, Peter Zijlstra wrote:
> > > >  static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
> > > >  {
> > > > -	struct task_struct *p;
> > > > +	rq_modified_begin(rq, &rt_sched_class);
> > > > +	balance_rt(rq, rf);
> > > > +	if (rq_modified_above(rq, &rt_sched_class))
> > > > +		return RETRY_TASK;
> > > 
> > > This exposes an underlying problem on the DL side. rq->next_class is
> > > raised only by wakeup_preempt(), but dl_server_start(), dl_task_timer()
> > > and dl_server_timer() enqueue a DL entity and open-code resched_curr()
> > > without going through it. prev_balance() ran before any class was
> > > picked, so it didn't matter. Now, pick_task_dl() has already returned
> > > NULL when balance_rt() drops the lock, and rq_modified_above() is the
> > > only thing which can notice a DL entity queued in the meantime:
> > > 
> > >   CPU0 RT task blocks, pick_task_dl() returns NULL
> > >        pick_task_rt(), balance_rt() drops the rq lock
> > >   CPU1 wakes a fair task onto CPU0, dl_server_start()
> > >   CPU0 relocks, rq_modified_above() is false
> > >        picks an RT task with the fair server queued
> > 
> > A very nice catch, but I'm not entirely convinced it wasn't a problem
> > before.
> > 
> > Similar argument could be made for FAIR vs EXT, and picking a FAIR task
> > while an EXT server is pickable.
> > 
> > > resched_curr() doesn't help as __schedule() clears it on prev after the
> > > pick. I can trigger this with NO_RT_PUSH_IPI and a delay added in the
> > > lock drop. With RT_PUSH_IPI, pull_rt_task() doesn't drop the lock.
> > > 
> > > Maybe the DL sites should raise rq->next_class where they enqueue and
> > > resched, so that they behave the same as regular wakeups?
> > 
> > Yes, something like that. I think the below captures all enqueues,
> > irrespective of rescheds. I'll add it as fix at the start of the series.
> > 
> > (although maybe I'll massage this a little more and create a helper,
> > doing the same thing over and over like this is daft)
> > 
> > Thanks!
> 
> ---
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -715,8 +715,7 @@ static struct rq *dl_task_offline_migrat
>  	return later_rq;
>  }
>  
> -static void
> -enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags);
> +static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags);
>  static void enqueue_task_dl(struct rq *rq, struct task_struct *p, int flags);
>  static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags);
>  static void wakeup_preempt_dl(struct rq *rq, struct task_struct *p, int flags);
> @@ -1184,7 +1183,7 @@ static enum hrtimer_restart dl_server_ti
>  			dl_se->dl_defer_running = 1;
>  		}
>  
> -		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> +		enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
>  
>  		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
>  			resched_curr(rq);
> @@ -1520,7 +1519,7 @@ static void update_curr_dl_se(struct rq
>  					replenish_dl_new_period(dl_se, rq);
>  					start_dl_timer(dl_se);
>  				} else {
> -					enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> +					enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
>  				}
>  			} else {
>  				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
> @@ -1812,7 +1811,7 @@ void dl_server_start(struct sched_dl_ent
>  
>  	trace_sched_dl_server_start_tp(dl_se, cpu_of(rq), dl_get_type(dl_se, rq));
>  	dl_se->dl_server_active = 1;
> -	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
> +	enqueue_dl_entity(rq, dl_se, ENQUEUE_WAKEUP);
>  	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
>  		resched_curr(dl_se->rq);
>  }
> @@ -2379,8 +2378,8 @@ static void __dequeue_dl_entity(struct s
>  	dec_dl_tasks(dl_se, dl_rq);
>  }
>  
> -static void
> -enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
> +static bool
> +_enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
>  {
>  	WARN_ON_ONCE(on_dl_rq(dl_se));
>  
> @@ -2418,7 +2417,7 @@ enqueue_dl_entity(struct sched_dl_entity
>  		if (flags & ENQUEUE_WAKEUP)
>  			task_contending(dl_se, flags);
>  
> -		return;
> +		return false;
>  	}
>  
>  	/*
> @@ -2442,7 +2441,7 @@ enqueue_dl_entity(struct sched_dl_entity
>  	 * deferred task and still got to wait, don't enqueue.
>  	 */
>  	if (dl_se->dl_throttled && start_dl_timer(dl_se))
> -		return;
> +		return false;
>  
>  	/*
>  	 * We're about to enqueue, make sure we're not ->dl_throttled!
> @@ -2457,6 +2456,13 @@ enqueue_dl_entity(struct sched_dl_entity
>  	}
>  
>  	__enqueue_dl_entity(dl_se);
> +	return true;
> +}
> +
> +static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags)
> +{
> +	if (_enqueue_dl_entity(dl_se, flags))
> +		rq->next_class = &dl_sched_class;
>  }
>  
>  static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags)
> @@ -2534,7 +2540,7 @@ static void enqueue_task_dl(struct rq *r
>  	if (task_on_rq_migrating(p))
>  		flags |= ENQUEUE_MIGRATING;
>  
> -	enqueue_dl_entity(dl_se, flags);
> +	enqueue_dl_entity(rq, dl_se, flags);
>  
>  	if (dl_server(dl_se))
>  		return;

Let's say a fair task named TA is working in CPU1, a DL task named DA is
waking up. We enter the normal wakeup path, and call enqueue_task_dl()
and from there enqueue_dl_entity(). enqueue_dl_entity() sets next_class
to dl_sched_class. Later enqueue, when we call wakeup_preempt TA does
not gets preempted because:

void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
{
	struct task_struct *donor = rq->donor;

	if (p->sched_class == rq->next_class) {
		rq->next_class->wakeup_preempt(rq, p, flags);

We already set next_class to DL, so we call wakeup_preempt_dl().

And it just early returns.

So, we have a fair task working while a new woken DL task just sits
around...

I also tested this:

On hackery, the latency of DA was 12 us, with hackery + above diff it
was 200 ms. On idle, it was 12 us to 3 seconds.

I'm not sure what is the cleanest fix tho. So this time there is no
diff.

Hope I'm not missing something :-).



Cheers,

Kayra
