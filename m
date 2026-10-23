Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763347;
	b=YhQJGooVSfOXtvCwfJV8Rho68VfHNV8qi5OV61aJeNP+DUjUWIiLNLh+94uX6kkeZ32b
	 EjZCIWDDEuoNr4K/kjaQLdh+GQFRE3v8ke2HcKmWRrXJdFkpnrpwQwrkaozvdL6SgBSy9
	 wphopWZENqgQjVYfE/Ev1i9s2VYm95oMKwD+MOiyGKDp63mJyhxHOZCQlebb57itbpXGf
	 +NnRtaHoHkxHxAQFGMqqTz+0KT4iA1aH9259lyCgtZS3rxBSZkhRTIAWye9ViY7Fv8Hxb
	 k/32t7sfbB7y/rZKPgwHi2JTE2Rjdio+JDRh0D+ZKxQMGw9pksIn3fhJathRPR9ZjbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lADM6itUBZwyMq6HdMlP1DiVjIl458v5XJJQdVmxpDU=;
	b=eAAHRU5cFY+WgMgDLIg/IVLVkuchTdImwJY4nkUWovOWMruqDbGU74AEXw7BkkQ3Cj2p
	 rnHJFhqqJHbRD93cGcBRPsNKrvxNI4aaLMGaCkNA70hcE8sVpLOlCyfl2r5zw5nueWXoF
	 sD5K77RAYYVKmxjAdlbPucjoyZERkyQIhatp2MZNG1mtznkEwtIRawFGRgh90LNLYXtqf
	 tRz3vPSFXCaAMwqH81TCsOM1r55wFZf/28kFGO0ziv9uDjkDm/SGGBepczSv/7RLSNYei
	 yApF0dNWO8mkhaXA+uBOK6lWU3Czoj1sCvlI5k/NWHbQBPGlqIp7YYhseAhSF049hbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ck3SHypY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3670606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3670606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ck3SHypY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215344409so1001525e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763345; x=1793368145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lADM6itUBZwyMq6HdMlP1DiVjIl458v5XJJQdVmxpDU=;
        b=Ck3SHypYRrk1suhVZfWywGwBzo9joU0vXQYeXrJVBKm6jKF1uVNjRXOzHMq+ZnGzud
         BAnYM0P8/uGJV1ZbiarlSGrZYQkNbZ+HSqIzgZ4oHpVizEMxuUEyP9yWJXn1flZa9Dp3
         jjvWHQ/Js+9q3ws3qDXHgZwbL0I1OWsbnER4NZDZftOMRbHyu8e1Fpj1SqMsSNO3Bbez
         BwTQhMuryU5ZrnnDMUaFlgwAs8TqP7UJ+7iN6J5b6XY6KBA8cKeVjnaZy5Dp8TO9VgdT
         R4Gsv8EF6x0CD4cCfG0/22csmHUWlFHhEe6LN3HOCjO8W+v7QWYBCHLji0mlRLYbb8JG
         KwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763345; x=1793368145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lADM6itUBZwyMq6HdMlP1DiVjIl458v5XJJQdVmxpDU=;
        b=pyE2n7qRxqr8yDZMZvgguz1rI4lHVF7wa7Ga633DzjtTEPSFEBFBF3mM8jL1iYb/hL
         AkghmxSBRmFRBIQDzBsWs5+idxijJpN159xake78FASLJbNe/xu4NSLw/K7DlzG1RHHI
         efABu4ZlqqQMiCmmXYift3iFPQ1sDDY/8uuvF9klkTAS2JZGcRYrkniR0898LWsO7DQ7
         ZA82mi+cxio2zfh15FGU1hR9zoeYtw9AdyxtMJem0wwFnD3DJxLihDgtSxaJox8OPEPf
         iuGAwQoLTb6DcHzO/l2Sl56gw+3MgOSuv9YjjFySbZvgMjvP+NSKTTxyJ4zFNZI9bVcW
         Kg/g==
X-Forwarded-Encrypted: i=1; AKwUvBxd6LFS2u2dTzpqAMjrwVJ9jLa6vL4I0gPT+LyTlDwlM+iQRVeOk/FiH6qj/FermQTlfLxArEcGme99W2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI61hniekXrF5RYJVm2fXshuzUZKuzkhM36109BdQCZwCxIeqh7
	GIxkBqmIHGf0ScKB8/ecGq0PN9RGi2W+L0V8MvS2LjKHWJw8YLMstO65
X-Gm-Gg: AYBFou3/yn79tpzLD37vHsUtSN1yrQIo+Fo+IW5ms0EOECv9LFCsraThfEeDGKl6qJy
	3xMcAqJC9sGvgygPJXfm2/90CSjgwl4BVnAS2vv/STIUEgO36h9i4l/mw57RvXDZq4xs7LPcIei
	cNyDdrTiShvbkfxUbw0W+WDdNHgd64FmEgHZMsfuuAloUntB7tfmdjU8ufTLMxN46DbhEl2rmPG
	LjvYyyKzKjmMhHS4GtfHsAmqtAC4p4fzqs910ARihxt1IX82V3cduDmDSu7BQ+Equ9oj+y2ylPx
	IUBO/o5P7SwwnZ2rS+KG5s75NuVhiEjTNfCIdNfV4ERNiqvLvEGzi6TXWCUcvVyep76F1LvdtT8
	ekxMWDo/UN84Q0cFuDSF4M9deyLDWnCbOgVFMZ4hzahSVDdkSyQmeAQ0bwp+H1bAcT1fvm2Ulf5
	mLMhEks96JseWFBCK4f6i9Ze+8vVKF1yBljF9qWeqTgZi3xrbuYZ/4JKggr3O2CgnKJ+kRoBXgi
	bq+0NZyI9N1H5xrCyg+Rvyu5yecbfwoMTUrmoXb5R+Jz+UkkzsNR0BWusKaZrEhj4vN1SXYImjK
	hZ0hc/k4
X-Received: by 2002:a05:600c:5955:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4a211cb40f2mr28461605e9.2.1792763344664;
        Fri, 23 Oct 2026 06:49:04 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a92a42adsm5970285e9.3.2026.10.23.06.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:49:04 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:49:00 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Don <joshdon@google.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	jakub@okonski.org, longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, cgroups@vger.kernel.org, jstultz@google.com, qyousef@layalina.io
Subject: Re: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
Message-ID: <attitenhAXB86seS@scheduler.schedules>
References: <20261019182622.1584454-1-vincent.guittot@linaro.org>
 <20261021131313.GM2823843@noisy.programming.kicks-ass.net>
 <CAKfTPtDOZ0=nrQe1-WSTamgU0qqdJVvD3KZPtnsqwwnE53BSKA@mail.gmail.com>
 <ati_o5c-SoiOp529@scheduler.schedules>
 <20261021145042.GQ2823843@noisy.programming.kicks-ass.net>
 <CABk29Nv2ZzB1KGEuPmx4VmxTJ6pKmikGMr8cvzzDhHZSKpkgvg@mail.gmail.com>
 <20261022114705.GW88198@noisy.programming.kicks-ass.net>
 <CABk29NviVUAK6B_deQ7qah8eABiCikbFpTwDEO2hdproGLdLwQ@mail.gmail.com>
 <20261022212150.GW2823843@noisy.programming.kicks-ass.net>
 <20261023132956.GD409038@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261023132956.GD409038@noisy.programming.kicks-ass.net>

On Fri, Oct 23, 2026 at 03:29:56PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 22, 2026 at 11:21:50PM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 22, 2026 at 10:49:36AM -0700, Josh Don wrote:
> 
> > > Took me a bit to parse this double traversal. I think this is broken
> > > for the clear side?
> > > 
> > > root
> > >   |
> > >  A ( 2 tasks)
> > >  |
> > >  B (3 tasks)
> > > 
> > > If we start out with A marked as idle, then we have
> > > root: h_nr_idle = 5
> > > A: h_nr_idle = 3
> > > B: h_nr_idle = 0
> > > 
> > > When we clear, we'll first start with B and subtract 3...
> > > root: h_nr_idle = 2
> > > A: h_nr_idle = 0
> > > B: h_nr_idle = 0
> > > 
> > > Then we go to A and try to subtract 5 leading to
> > > root: h_nr_idle = -3
> > > 
> > 
> > Argh. Yes, I seem to have gotten it wrong. I'll try again in the
> > morning.
> 
> Bah, so I can't operate cgroup well enough to actually set up the above
> scenario. I think I'm stuck in cgroup-v2 mode which disallows this. I
> should probably ask one of the AI thingies to write me a script.
> 
> Anyway, I think the below *should* work. It seems to behave for the
> simple cases I did test.
> 
> This also fixes that init thing you noted, and yes, we can use this as
> an optimization for the find_matching_se() -- although I still think
> those semantics are weird, but whatever. If that's what people really
> want.
> 
> ---
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0ab15f03cb94..731befb0f671 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8970,7 +8970,7 @@ void __init sched_init(void)
>  		rq->nr_running = 0;
>  		rq->calc_load_active = 0;
>  		rq->calc_load_update = jiffies + LOAD_FREQ;
> -		init_cfs_rq(&rq->cfs);
> +		init_cfs_rq(&rq->cfs, NULL);
>  		init_rt_rq(&rq->rt);
>  		init_dl_rq(&rq->dl);
>  #ifdef CONFIG_FAIR_GROUP_SCHED
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index e6a3b516c703..9914498df0e2 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1090,6 +1090,7 @@ void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
> +	SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
>  	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
>  	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
>  			cfs_rq->avg.load_avg);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b5546cd27dba..2fcb01a514c5 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15581,8 +15581,10 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
>  		hrtick_start_fair(rq, p);
>  }
>  
> -void init_cfs_rq(struct cfs_rq *cfs_rq)
> +void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
>  {
> +	if (parent)
> +		cfs_rq->idle = parent->idle;
>  	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
>  	cfs_rq->zero_vruntime = (u64)(-(1LL << 20));
>  	raw_spin_lock_init(&cfs_rq->removed.lock);
> @@ -15633,7 +15635,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>  			goto err;
>  
>  		se = tg_se(tg, i);
> -		init_cfs_rq(cfs_rq);
> +		init_cfs_rq(cfs_rq, tg_cfs_rq(parent, i));
>  		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
>  		init_entity_runnable_average(se);
>  	}
> @@ -15767,6 +15769,37 @@ int sched_group_set_shares(struct task_group *tg, unsigned long shares)
>  	return ret;
>  }
>  
> +struct tg_set_idle_struct {
> +	struct task_group *tg;
> +	long idle;
> +	int cpu;
> +};
> +
> +static int tg_set_idle_up(struct task_group *tg, void *data)
> +{
> +	struct tg_set_idle_struct *tsi = data;
> +	struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, tsi->cpu);
> +	struct sched_entity *se = tg_se(tg, tsi->cpu);
> +	int old_idle = grp_cfs_rq->idle;
> +	long task_delta;
> +
> +	grp_cfs_rq->idle += tsi->idle;
> +
> +	if (tg == tsi->tg)
> +		return 0;
> +
> +	if (!!old_idle == !!grp_cfs_rq->idle)
> +		return 0;
> +
> +	task_delta = grp_cfs_rq->h_nr_queued - grp_cfs_rq->h_nr_idle;
> +	if (!task_delta)
> +		return 0;
> +
> +	task_delta *= tsi->idle;
> +	cfs_rq_of(se)->h_nr_idle += task_delta;
> +	return 0;
> +}

I think this works wrong again on here AFAICT :-):

ROOT
  |
  A (3 Tasks)
  |
  B (2 Tasks)

When we do A idle, it should be:

B = 0, A = 2, ROOT = 5.

We start from B, We add +2 to A. Now, B = 0, A = 2, ROOT = 0.
Then we get to A. 5 - 2 is 3, we add h_nr_idle 3 and ROOT = 3.
While it should be 5, no?

Thanks!

Kayra
