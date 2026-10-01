Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAA52CCF7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867501; cv=none; b=f2v5x9oBS3k8dJga7Kwd1eCwYzp8IFnjkEYiXWci50VX1yF7H5e5HXOLGmrXtExwKNBWmI5UPBOuUB3KmGMonUIAYKkEKiXlCuSVQeMR+TtADu7jZb4i+BvY6f9LbkZpg7sRQQ5Pbl/Qy/CECuCpbK+6VL7+Zmc8krV9H6/jCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867501; c=relaxed/simple;
	bh=EEhYHKuZRU8N4CvJtmFQrQYoJF5vje97pFD6O8Bi1EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwXg8lIVTnRBnYr+VdxDVR5VMeDrLU143o6dAB0S8ZKjlJaKWicGa+z0DWjB1zdJiYXkkelZt0riHq6jDs+nKZWmrf1eB10h7jl/ewDyAAaDvGH9f5fdMIkTTnyQgQtc3QIx/yJ0OjSAHT3eh2AOleGSExIzfcAD8lMZ7LErLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3jpM0j0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jj7sOOEG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3jpM0j0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jj7sOOEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790867498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azZdzyTJXKsY/NOXI9K1keUMxXiDFP6nyKUzlPveb4M=;
	b=F3jpM0j0bCVptDVUrnN4116ojxr4ha7xl2j4+x2g0cdPxRT85DrFvcRwmpnf0LZwSxjSyM
	o6HPnwRDXVLjnzfSYL4/sT5je4ih71dCtyzga1ZxoF7Ieoxt6Bd+p9D9PEJFJ2jjknIPXU
	H6B2jsQqu4PPotqX5abkSH06FSrGY8U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-kvyVRN36M0uXymS7yBgbAQ-1; Thu, 01 Oct 2026 11:11:37 -0400
X-MC-Unique: kvyVRN36M0uXymS7yBgbAQ-1
X-Mimecast-MFC-AGG-ID: kvyVRN36M0uXymS7yBgbAQ_1790867496
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e735659b7so50148195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790867496; x=1791472296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azZdzyTJXKsY/NOXI9K1keUMxXiDFP6nyKUzlPveb4M=;
        b=Jj7sOOEGTZrsOxHV7BqCIOIKiyp57FJntRI73A/L27waOdXJ+EMJ9AOzvYDcxkIpIo
         nceSHtYVSP+l6oUMFnQ1drUWHQYftZgF6x+XB5X+2cVjyJpU742GUmgCw+UG5WPOiooy
         a97LzMHQU2fNkwQPewNMQ38dqYykO1wCDXgsywPJzSU2pcY0atr2ZLAE0qnWfYjqAyab
         OWZ6ZA/cyJ1HWtMPRbSj4kWbaCDe0dfljrQlzvkosGTuEPT1PtfbwO1E/jDCHnvEkMly
         IoWbc13Yf9RxOHiWkUyhokD48rXdtXAMjbnGUPWUKiR1MVx3FGny3DhLa+8+w7w4g1Xq
         hu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867496; x=1791472296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azZdzyTJXKsY/NOXI9K1keUMxXiDFP6nyKUzlPveb4M=;
        b=NmM4BeefX7MMIV7h28tIcvL7b5LE4FoBfZKER484Sl2MhK+G3j5LqDln1EneaA/91I
         VIYJPEJ5kicNXub0Ge88MM8/7FcnHYivES8JLG039TIIixyU1KxerXCOfEVnnv2nPNVA
         rhISZihVxbF+zGhK+zo2s7VsvCkge26osx0mLKJFSHFViM0joqaBl0OmHsKwh7hq4ljD
         3W81bkTTb0d7MH78JG8ncu5jXf2Q6rfWS8d23+LugaPH6EGcCa9nmzbd7Eg/orSLEi2E
         4sOaG3VW4D2KdMQozofOpZm153eRuPaOJFlbgzXRoP/AMINw/eRp2CXO4KP6RFMC3Hz9
         6Iqw==
X-Forwarded-Encrypted: i=1; AKwUvBzVDNkCm8yskK6QGEfZzPIfDql2UNCGAqNoBc9y3/8HpjsqnaUoa/nFni/1Hwb/Q04MOLAXaJ0RownCEPI=@vger.kernel.org
X-Gm-Message-State: AFuF++loWPwVMgiHphAFWviAM2AFwJ7T/4W48BCPPnOeoJR+uEYgwoxF
	Hzpnfh7ZM1H0Vq5a5YFCtn4qEHKxlUs1fBftIZTMwxKwQtKb3IlxHohQamf3NvWmbbgFpKjSJO8
	bamRhodKGOeK1r3iqfiZ6sqY3FMs9LCKk3yEFFRtQbIIZisXrPJEOKVN+cXVmjDdbSw==
X-Gm-Gg: AYBFou19hIKnxohWcmFL6Pas+wQHkJndiDv6v7L/YCGr3EXFmb4U2+Rzzoq5Ys56tBI
	lmXpbEuB2cX1BAPxUz5SHk+vyBshbPj8CBqX3CF91NV4vf5rD30XEKx/4NikHcqp46epfpEyNHF
	up3SB1XVeSWK0nERCUdLOIQtuIQ8hPey6CZb8DGLKHn9eA4nvNJ0bey2GLaER1jelwrjqqsBcAi
	sFShOliFv2bexKF/GNqCNoOQfIaf2El1y9rMXKVNgrnvZytLKlJnxBJ9l+Oq88m4t57lRBolJSj
	lUBGRKRxD5Fbr2tLXscWDNOyf1ie5GudimOpGCVD3gB7bB8jlZd+wX3uXYsLjPK56ZFq2A5yh5U
	KwiMe9XINgX/SSL8atBh92sIvltXm
X-Received: by 2002:a05:600d:4443:10b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a024230c71mr23974065e9.15.1790867495904;
        Thu, 01 Oct 2026 08:11:35 -0700 (PDT)
X-Received: by 2002:a05:600d:4443:10b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a024230c71mr23973655e9.15.1790867495404;
        Thu, 01 Oct 2026 08:11:35 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm92989035e9.1.2026.10.01.08.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:34 -0700 (PDT)
Date: Thu, 1 Oct 2026 17:11:32 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrea Righi <arighi@nvidia.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Haufe <dhaufe@simplextrading.com>,
	Cao Ruichuang <create0818@163.com>,
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>,
	ionut.nechita@windriver.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <ar54JPCpCZTITK6B@jlelli-thinkpadt14gen4.remote.csb>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001142735.GT2009045@noisy.programming.kicks-ass.net>

On 01/10/26 16:27, Peter Zijlstra wrote:
> On Wed, May 13, 2026 at 11:13:03AM +0200, Juri Lelli wrote:
> > The dl_server_timer() originally caused spurious IPIs on nohz_full
> > cores, breaking isolation guarantees. While such IPIs cannot be observed
> > on recent kernels, dl-server timers for tick-stopped isolated CPUs still
> > fire unnecessarily on housekeeping cores.
> > 
> > The problem is that dl-servers are not coordinated with nohz_full tick
> > state. Even when the tick stops on an isolated CPU, its dl-server timer
> > continues to fire on housekeeping, wasting cycles and potentially
> > affecting housekeeping CPU performance.
> > 
> > Fix by managing servers in sched_can_stop_tick():
> > 
> > - When RT tasks run with CFS/SCX tasks, start the appropriate server(s)
> >   and keep the tick running
> > - When only RT tasks remain, stop all servers and allow tick to stop
> >   (except for >1 RR tasks which need the tick for round-robin)
> > - When only CFS/SCX tasks remain, stop all servers before stopping tick
> > 
> > Introduce dl_servers_stop_all() to reduce duplication and abstract
> > server management from core.c. Unify RT handling into one block that
> > handles both RR and FIFO cases.
> > 
> > Note on SCX: While SCX is incompatible with isolcpus=domain, it does
> > support nohz_full. The ext_server handling in this patch targets
> > nohz_full configurations without domain isolation.
> > 
> > Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> > Reported-by: David Haufe <dhaufe@simplextrading.com>
> > Closes: https://lore.kernel.org/lkml/CAKJHwtOw_G67edzuHVtL1xC5Vyt6StcZzihtDd0yaKudW=rwVw@mail.gmail.com
> > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > ---
> 
> I was most confused with this IPI talk, since dl-server are strictly
> per-cpu and was thinking you must be meaning timer interrupts.
> 
> But AFAICT the normal dl timers are ABS_HARD, and !PINNED, so the whole
> NOHZ_FULL muck will move them around for no win. Oh well. Do we want the
> below?

The below makes sense to me.

> Anyway, yes, I think this is more or less the best we can hope for. In
> the down-thread case where someone is running both FIFO and CFS tasks,
> they get to keep the pieces, since that is violating NOHZ_FULL premise
> anyway.

I think what Ionut lamented wrt the behavior before dl-servers is that
the tick was stopped if you had an always running FIFO task (even if a
CFS was starving). With the below we start the dl-server, but we also
keep the tick active and that unnecessarily perturbs the FIFO task,
since maybe we don't need it as the dl-server has its own timer set.

> >  kernel/sched/core.c     | 46 +++++++++++++++++++++++++++-------------------
> >  kernel/sched/deadline.c | 14 ++++++++++++++
> >  kernel/sched/sched.h    |  1 +
> >  3 files changed, 42 insertions(+), 19 deletions(-)
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index b905805bbcbe4..6d05ce9b1dfe6 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -1414,30 +1414,40 @@ static inline bool __need_bw_check(struct rq *rq, struct task_struct *p)
> >  
> >  bool sched_can_stop_tick(struct rq *rq)
> >  {
> > -	int fifo_nr_running;
> > -
> >  	/* Deadline tasks, even if single, need the tick */
> >  	if (rq->dl.dl_nr_running)
> >  		return false;
> >  
> >  	/*
> > -	 * If there are more than one RR tasks, we need the tick to affect the
> > -	 * actual RR behaviour.
> > +	 * If there are RT tasks, we may need the tick (for >1 RR tasks),
> > +	 * but we must also service lower-priority CFS/SCX tasks via dl-servers.
> >  	 */
> > -	if (rq->rt.rr_nr_running) {
> > -		if (rq->rt.rr_nr_running == 1)
> > -			return true;
> > -		else
> > +	if (rq->rt.rt_nr_running) {
> > +		bool cfs_or_scx_queued = false;
> > +
> > +		if (rq->cfs.h_nr_queued) {
> > +			dl_server_start(&rq->fair_server);
> > +			cfs_or_scx_queued = true;
> > +		}
> > +#ifdef CONFIG_SCHED_CLASS_EXT
> > +		if (rq->scx.nr_running) {
> > +			dl_server_start(&rq->ext_server);
> > +			cfs_or_scx_queued = true;
> > +		}
> > +#endif
> > +		if (cfs_or_scx_queued)
> >  			return false;
> > -	}
> >  
> > -	/*
> > -	 * If there's no RR tasks, but FIFO tasks, we can skip the tick, no
> > -	 * forced preemption between FIFO tasks.
> > -	 */
> > -	fifo_nr_running = rq->rt.rt_nr_running - rq->rt.rr_nr_running;
> > -	if (fifo_nr_running)
> > +		/*
> > +		 * Only RT tasks, no CFS/SCX. Stop servers to prevent spurious
> > +		 * wakeups. Tick can stop for single RR or any FIFO, but must
> > +		 * run for multiple RR (round-robin behavior).
> > +		 */
> > +		dl_servers_stop_all(rq);
> > +		if (rq->rt.rr_nr_running > 1)
> > +			return false;
> 
> I don't see why we would stop the dl-server in the false case. If we
> don't stop the tick, nobody should be caring about those timers anyway.
> 
> It would make more sense to me to have dl_server_stop_all() only in this
> true case.

OK.

> >  		return true;
> > +	}
> >  
> >  	/*
> >  	 * If there are no DL,RR/FIFO tasks, there must only be CFS or SCX tasks
> 
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 0663c00c41c0..5388bde93410 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -401,6 +401,7 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se);
>   */
>  static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
>  {
> +	enum hrtimer_mode mode = HRTIMER_MODE_REL_HARD;
>  	struct hrtimer *timer = &dl_se->inactive_timer;
>  	struct rq *rq = rq_of_dl_se(dl_se);
>  	struct dl_rq *dl_rq = &rq->dl;
> @@ -459,8 +460,10 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
>  	dl_se->dl_non_contending = 1;
>  	if (!dl_server(dl_se))
>  		get_task_struct(dl_task_of(dl_se));
> +	else
> +		mode |= HRTIMER_MODE_PINNED;
>  
> -	hrtimer_start(timer, ns_to_ktime(zerolag_time), HRTIMER_MODE_REL_HARD);
> +	hrtimer_start(timer, ns_to_ktime(zerolag_time), mode);
>  }
>  
>  static void task_contending(struct sched_dl_entity *dl_se, int flags)
> @@ -1061,6 +1064,7 @@ static inline u64 dl_next_period(struct sched_dl_entity *dl_se)
>   */
>  static int start_dl_timer(struct sched_dl_entity *dl_se)
>  {
> +	enum hrtimer_mode mode = HRTIMER_MODE_ABS_HARD;
>  	struct hrtimer *timer = &dl_se->dl_timer;
>  	struct dl_rq *dl_rq = dl_rq_of_se(dl_se);
>  	struct rq *rq = rq_of_dl_rq(dl_rq);
> @@ -1112,7 +1116,9 @@ static int start_dl_timer(struct sched_dl_entity *dl_se)
>  	if (!hrtimer_is_queued(timer)) {
>  		if (!dl_server(dl_se))
>  			get_task_struct(dl_task_of(dl_se));
> -		hrtimer_start(timer, act, HRTIMER_MODE_ABS_HARD);
> +		else
> +			mode |= HRTIMER_MODE_PINNED;
> +		hrtimer_start(timer, act, mode);
>  	}
>  
>  	return 1;
> 

