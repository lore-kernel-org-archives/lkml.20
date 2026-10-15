Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAC521235
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068401; cv=none; b=De/vjbjIwTsFqDQn+b1KAb512hiKy6SGnASLIEXE4J7usd/r66rDAl4HTFeTfhKxxKjQhMz+ic+qGpcscO6z1/NRha1cX8HW7wojifdVK73YGhuzlitFWmktKeRfkXkXzLMn5vO5+N3NxNPvsa2bQ14ZC7cFpKHTWFmgqd+tbGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068401; c=relaxed/simple;
	bh=b5djHBQZj6XKcIRKvPBjF4Q5MjaXxHepnfBInCfgW68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZh8xF9L4tzana3RMi/30xL4YlmRax8e/he0KwFuSWSVOnwGx8/mi4+ZhX4uBllnYnl4d3OA4HAnauYfYQj51YSB1O+w4FCSK92dJRKJeM+Q2NWbXPVctgaxbZVws0MeQEJpDrEdnTiQxBFaaXt47JM13Vb0x/y3fJJ3Sm2jQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwyfIGjH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nwWIQNYx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwyfIGjH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nwWIQNYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792068398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3jxrtF495xyt4BGycflUgk7MdI2072wPhxZ0GWgHPlo=;
	b=MwyfIGjHxd4E48as+y0CAygpENa7Pg07upxCj/zkmIQ8b9RwFS8lS7EOFsWQ+q+slshSYP
	mBSwR2Tsydy0rQ18djeoE5RcoAr+srsgKIjpN2BQMibVGO/42vSF5TYs4VH07vZzGEMIjg
	4oSHHh5sua443BlywhquL1Gcl1S3Gyk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-4omimJyHN3-2MK8KNqDnIA-1; Thu, 15 Oct 2026 12:46:37 +0000
X-MC-Unique: 4omimJyHN3-2MK8KNqDnIA-1
X-Mimecast-MFC-AGG-ID: 4omimJyHN3-2MK8KNqDnIA_1792068396
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1af80b913so29407405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792068396; x=1792673196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jxrtF495xyt4BGycflUgk7MdI2072wPhxZ0GWgHPlo=;
        b=nwWIQNYxDz5p3oCOUqjaWg86hTbN6ayymSYMC5qJKWF1L9u046qDyOBb7ggWoyKptc
         QP5JQiy0yMvMkMH6QR4nCGz/RD5lH1ghrLu0ogciX2XiX70VdfmG8Th1rp7DQM6sotcl
         N87/eWvtHdNGb7FLr6X/ZfKxlz5ixMR0Z4t+GWnq+PjQGUbmT5gq+9cE49MhhqIlFNKe
         /PprOgRGqBaFuTSxq+/AxO9UcAnGlnBEPlIcb92SBu5ylNLiHGYjINtbdwJEw1lQ1edC
         AMTq/xTSUpcrqYCZCfd4SrDOkGX4p1fl/HaGDRY3YTglfKDm5sb+SEkFWTv4sLrqXxRU
         Taug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068396; x=1792673196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jxrtF495xyt4BGycflUgk7MdI2072wPhxZ0GWgHPlo=;
        b=0ziL0G/uJO8h8xz3OXhVWzlTeGyJMJFepCK0UiP0aK9hEPXqRH1ZAki97BrVi+5+dk
         y++KMlvi9E92bK6cun2U2yGlexWdX2GHsvKJ/PWoizspzk/r3L29pUcN4IogG1pQxwp3
         rgucu2Js/dxeGre2Tdvd8DjFP4QdlpfmV5/27inCde7ddmTwaYcBOiE9+q1sxd7gGnGW
         ObU8kpeeECd/gRGryHH3c1g7lfUzKAUdGA3Mkfbq5WHlUtr1O+4aiugX6VrSF2YWa4sX
         Io+23cJXhJS0rwLUFCHba70Dg9uWdwS4Zi3LJ5kk2G/sw8vp7TRwGAlOJVr89Q3QkA32
         +MxA==
X-Forwarded-Encrypted: i=1; AKwUvBwenqfGtigYS+wz/QiBpBlaXNlsWov7DPgOhqS+2LH2Q9Ki+mFQzqeUNl6tS+XTH8C4SKSNXcY9Lx1iDcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwmZXBggy9c7fa1H2yJcvQJgUlKz/slQIelKBBdZj3wcGAHjkO
	++qD10JXSmJXT3tfYI3fgb4L5FIl/WOty2+ReQRCLBFauu7Yi1aDYSghLNoNllN3Fnkz9QOqO2a
	30w3uF32o0HtQJUuCIPHpk36YWG8/7NfKY6NcruJ3t1SuMULme1aCZrFMhAf3xqzRHA==
X-Gm-Gg: AYBFou3wk7LVeyP+mTjMG8bUH9bs8Fe9kn33lGAuMfUWQZHbx+QPm7abmLUryKwKqyf
	P+erCSRcJCuP5XQOHogdt4YINps/aehfLW20dpwhY3z7SSpsRhG4Zc782JVcOyKQXwQjDa6ohvH
	7LoMPXO0kHLNJ3MDJ5bPvKArKuYRCCZomXqk4KMWi/JaHnCokuulXjzD8pT+QMI/cSUK2SEmaCS
	yjbDr6jM5YhRumL0MwsQb9ZZvvsCENAdZ04OjGyfRjyhVQ46bukpemMhrE+fXsxtZiUT2p67ZHj
	oLkpG27wlVDla8cby6+RpuSCGqM3F1WXkknZ24QU7o+q+3jC4pX7dR0418a4Eb5UopmOHw9mDpF
	YRbaOBKYbYQjURbyt/ED2xg0UrAdEt0M=
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a18e4ca1dcmr371393535e9.18.1792068395917;
        Thu, 15 Oct 2026 05:46:35 -0700 (PDT)
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a18e4ca1dcmr371392945e9.18.1792068395444;
        Thu, 15 Oct 2026 05:46:35 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.35.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm18764163f8f.19.2026.10.15.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:46:34 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:46:32 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	bristot@kernel.org, arighi@nvidia.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, dhaufe@simplextrading.com,
	create0818@163.com, frn1furkan10@gmail.com
Subject: Re: [PATCH v3] sched/deadline: Make dl-server nohz full aware
Message-ID: <atDLKLaAerqK1Hhz@jlelli-thinkpadt14gen4.remote.csb>
References: <20261013133010.390823-1-ionut.nechita@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013133010.390823-1-ionut.nechita@windriver.com>

Hello,

Thank you for posting this.

On 13/10/26 16:30, Ionut Nechita (Wind River) wrote:
> From: Ionut Nechita <ionut.nechita@windriver.com>
> 
> On a nohz_full core, a dl-server has to be armed when an RT task coexists
> with runnable CFS (or SCX) tasks, so the lower-priority class still gets
> its reserved bandwidth (fair_server default 50ms/1s) instead of being
> starved by the RT task.
> 
> Doing that the way v2 did, by arming the server and then returning false

I don't think we want to put this kind of historical discussion
reference into the changelog. I would only document what the current
solution does.

> from sched_can_stop_tick() for as long as a CFS/SCX task is queued, keeps
> the tick running for the whole time that task waits, not just while the
> server actually runs. On an isolated nohz_full core that is the more
> expensive of the two costs: measured with a SCHED_RR hog and a CFS task
> visiting the core about once per second, the tick never stopped again
> (200 irq_vectors:local_timer_entry per second, tick_stop reporting
> dependency=SCHED), against ~19/s with the fair server disabled.
> 
> The deferred server spends most of its period in the zero-laxity wait
> state: throttled, off the dl_rq, waiting for its timer. That wait is
> driven by an hrtimer and needs no tick. Keep the two concerns separate:
> 
>   - sched_can_stop_tick() arms rq->fair_server (and rq->ext_server for
>     SCX) when RT coexists with the respective class, but does not force
>     the tick for a merely deferred server. A non-deferred start enqueues
>     the server immediately; that is rechecked right after via
>     rq->dl.dl_nr_running and does keep the tick.
> 
>   - inc_dl_tasks()/dec_dl_tasks() call sched_update_tick_dependency()
>     for dl_server entities. Servers skip add_nr_running()/
>     sub_nr_running(), so until now nothing re-evaluated the tick when
>     the timer enqueued the server or when it was throttled again. The
>     tick is now started when the server is enqueued, so its runtime is
>     enforced from the tick, and dropped again once it leaves the dl_rq.
> 
> The servers are deliberately never stopped from sched_can_stop_tick().
> dl_server_start()/dl_server_stop() carry the GRUB accounting of
> rq->dl.running_bw through the "active contending" / "active non
> contending" state machine, with an inactive_timer in between. Stopping a
> server from a path that runs on every enqueue and dequeue cycles that
> state machine at a rate it is not meant for: a stop that finds the
> inactive timer still armed subtracts running_bw that the matching start
> did not add back, which underflows running_bw and trips WARN_ON_ONCE()
> in __sub_running_bw() and WARN_ON() in task_non_contending(). Teardown is
> left to the existing lazy path in __pick_task_dl(), which stops a server
> when it has no task of its class to pick. The cost is that a tickless
> core keeps taking the server's defer and inactive timers, which is a few
> interrupts per period, not a tick.

Kind of feel this is not completely ideal. nohz_full configurations
usually don't want to suffer from any kind of interference, even a
"quick" hrtimer expiration is usually too much (also considering it
seems useless).

> All of this is confined to nohz_full CPUs: sched_update_tick_dependency()
> returns early for housekeeping CPUs, so sched_can_stop_tick() (and with
> it the new arming) only runs where the tick can be stopped.
> 
> Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> Reported-by: David Haufe <dhaufe@simplextrading.com>
> Closes: https://lore.kernel.org/lkml/CAKJHwtOw_G67edzuHVtL1xC5Vyt6StcZzihtDd0yaKudW=rwVw@mail.gmail.com
> Suggested-by: Juri Lelli <juri.lelli@redhat.com>
> Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
> ---
> Changes from v2 [1]
> 
> - Rework the mechanism following the discussion on v2 [2]. Instead of
>   returning false from sched_can_stop_tick() while a CFS/SCX task is
>   queued (which pins the tick on the isolated core for the whole wait),
>   only arm the server there and let the tick stop while the server is
>   deferred. The tick is kept, and dropped again, from
>   inc_dl_tasks()/dec_dl_tasks() as the server enters and leaves the
>   dl_rq, so it runs only during the server's service window. Measured
>   tick rate on the isolated core drops from CONFIG_HZ to ~the service
>   window (see commit message).
> - Do not stop the servers from sched_can_stop_tick(). Cycling
>   dl_server_start()/stop() at enqueue/dequeue rate underflows
>   rq->dl.running_bw and trips the WARN_ON_ONCE() in __sub_running_bw()
>   and WARN_ON() in task_non_contending(); splats and a reproducer were
>   posted in the v2 thread [3]. Teardown is left to the lazy path in
>   __pick_task_dl(). As a result dl_servers_stop_all() is no longer
>   needed and is dropped.
> - Keep the SCX ext_server handling from v2 (arm rq->ext_server when RT
>   coexists with SCX tasks).
> - Rebased onto tip/sched/core.
> 
> Open question for maintainers: because the servers are no longer stopped
> here, a tickless isolated core keeps taking the server's defer/inactive
> hrtimers (a few interrupts per period, not a tick). Peter's idea in the
> v2 thread of marking the dl-server timers PINNED would keep those on the
> isolated core itself and address the housekeeping-side wakeups the
> original v2 targeted; it was parked pending a remote hrtimer_start_on().
> This patch does not depend on it.
> 
> The running_bw underflow splats and reproducer mentioned above, and
> Peter's PINNED-timer suggestion, are both in the v2 thread [2].
> 
> [1] https://lore.kernel.org/lkml/20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com/
> [2] https://lore.kernel.org/lkml/aszViUxPLBuH0h7L@jlelli-thinkpadt14gen4.remote.csb/
> 
>  kernel/sched/core.c     | 32 +++++++++++++++++++++++++++++++-
>  kernel/sched/deadline.c |  4 ++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 71d3c948e14ae..0177c950a4885 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1440,10 +1440,40 @@ bool sched_can_stop_tick(struct rq *rq)
>  {
>  	int fifo_nr_running;
>  
> -	/* Deadline tasks, even if single, need the tick */
> +	/*
> +	 * Deadline tasks, even if single, need the tick. This includes a
> +	 * dl-server while it is enqueued and serving its class: its runtime
> +	 * is enforced from the tick.
> +	 */
>  	if (rq->dl.dl_nr_running)
>  		return false;
>  
> +	/*
> +	 * RT coexists with a lower-priority class: make sure the matching
> +	 * dl-server(s) are armed, so CFS/SCX still get their reserved
> +	 * bandwidth even though the tick is about to be stopped. While a
> +	 * server is only deferred (throttled, waiting for its timer) it is
> +	 * not on the dl_rq and needs no tick; once the timer enqueues it,
> +	 * inc_dl_tasks() re-evaluates the dependency.
> +	 *
> +	 * dl_server_start() is a no-op for an already active server (or one
> +	 * with no runtime configured), and the servers are never stopped
> +	 * from here: their start/stop pair carries the GRUB accounting of
> +	 * rq->dl.running_bw, which must not be cycled at enqueue/dequeue
> +	 * rate.
> +	 */
> +	if (rq->rt.rt_nr_running) {
> +		if (rq->cfs.h_nr_queued)
> +			dl_server_start(&rq->fair_server);
> +#ifdef CONFIG_SCHED_CLASS_EXT
> +		if (rq->scx.nr_running)
> +			dl_server_start(&rq->ext_server);
> +#endif
> +		/* A non-deferred start enqueues a server right away. */
> +		if (rq->dl.dl_nr_running)
> +			return false;

Oh, and we can get rid of the bool I used in v2. OK.

> +	}
> +
>  	/*
>  	 * If there are more than one RR tasks, we need the tick to affect the
>  	 * actual RR behaviour.
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index c0ebdcde5fe5d..589c4c881c31b 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2259,6 +2259,8 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
>  
>  	if (!dl_server(dl_se))
>  		add_nr_running(rq_of_dl_rq(dl_rq), 1);
> +	else
> +		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));
>  
>  	inc_dl_deadline(dl_rq, deadline);
>  }
> @@ -2271,6 +2273,8 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
>  
>  	if (!dl_server(dl_se))
>  		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
> +	else
> +		sched_update_tick_dependency(rq_of_dl_rq(dl_rq));

For some reason I don't particularly like calling
sched_update_tick_dependency from deadline code, but after all
add/sub_nr_running ends up doing the same, so maybe it's fine.

Thanks,
Juri

