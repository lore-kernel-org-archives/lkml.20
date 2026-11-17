Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928832;
	b=WLNQ/UuRVS0JSoPc6UW7QhW0EoKM4KrHaSUyax9zk+ZpV/UuCB5UwqLKWz78u5aYdPCJ
	 iJ95k6ZuOdjb9WK7YPs9WCgJamxSZTs9vS5w3HoYMRuP1lKhZW5qNsCu0/d2N+WsVZvnU
	 TlFRRl7FGF1EQ+YtLEttz71OucA6mjgP6f5wtAvI6LkcktHTdGvOERQ2ac1jDd7beqPRY
	 a2FHUnVzIqZRQFS0QIjUwiSXE+O/iJfP8m0mUYrruFWSXf2TMHDMREeYh8+tItQGI+AoA
	 S7PVfvlw9pn9zsVWr6R84pK4wG0drM+DE7RJAKENTasZrsqN5O32y0x6EGm7euKTYPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928832;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aKjfS/GPTk9x5aOs/ee1i13z9VlzCfPQBOlDaOanOA8=;
	b=1vhyyHChXLr5LEdHNC973Y8l0gEYO8Z0wXtf6TCDymyxXSEyjTZFArJvDJH6LqdShmi0
	 qD8W7jKd/+LuIwhnnc7sUpBKq7vHHHL0AjsstryFzKwRhTg1jh8j7CrBRJ3ZskSbO0IqU
	 zxZjq6xKSJSHXVMcnNyzV9Dt64dd65cyNS1+B/0l+47BM4dD+3wYP80htwLedU5rksM45
	 Ms5Zb+55CXQj7oQL8INzNPBRvSN9lNRuhj+JAqrvBpOraPogZ34hBI2IsmV+Eht2+xIQX
	 I7eTijTFHFZnJ8otZEh9fBY4mzEfjrCI8o+sgvyZqMi39tYwoRlBi86PV+Q2Dzq0DZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BCmtjAvc;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF1606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8FF1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BCmtjAvc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aKjfS/GPTk9x5aOs/ee1i13z9VlzCfPQBOlDaOanOA8=; b=BCmtjAvcVtKEyXygp7lVk5jlff
	aAFYEfBqASr+SswEYcHFeRZsnsFBd4GGcuYguhttGj+yu9AQ+3AYiKaG6u6P5Bw9TaLqI83UkoCVg
	Rej3CPqYd4Uf7kr7ZwUQJNkaRP+uzJHSybyxChJ5RrBnaL40rgvqJ/bj7fsXMRDti5aC7h4l7lBcc
	jMl+zkm+wMK1rm5imb75DLxSalsC55NIfsO/8KdCW7Nh48u8nzp4ey35PiaR51+C7ajApgYciFFCn
	f+v9i5FADrrbfZukhtaHj3PbtHAEDiYYPeEqsly++Mw9d3l/+R41QtqBzFbe+6r6EP5iE3tCDf0eB
	fwdLHtXQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKyx-00000001EDY-2AQS;
	Tue, 17 Nov 2026 15:20:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6AE54300400; Tue, 17 Nov 2026 16:20:26 +0100 (CET)
Date: Tue, 17 Nov 2026 16:20:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113160655.2909479-1-mgorman@techsingularity.net>

On Fri, Nov 13, 2026 at 04:06:55PM +0000, Mel Gorman wrote:

> As above, the runqueue is still marked overloaded by enqueue_task_rt()
> and put_prev_task_rt() even if the task is migrate-disabled. A
> migrate-disabled task reaches the pushable list through enqueue_task_rt()
> or put_prev_task_rt() when it is preempted, or when it wakes while
> still migrate-disabled. Either path calls enqueue_pushable_task() to set
> rq->rt.overloaded and rto_mask if unset. Once set, every pull from another
> CPU that fires an IPI may only find migrate-disabled tasks rendering the IPI
> useless for a condition that was detectable when placed on the pushable list.
> 
> Stop adding migrate-disabled tasks to the pushable list if RT_PUSH_IPI is
> enabled. This is not a heuristic as migrate-disabled tasks cannot move. Even
> when migration is enabled, the rq still has no pushable candidates until the
> task schedules. The !RT_PUSH_IPI behaviour is preserved and migrate-disabled
> tasks are added to the pushable list. Without IPI, the alternative path in
> pull_rt_task() must find runqueues with off-CPU migrate-disabled tasks. It
> can then push the running task away allowing the migrate-disabled task
> to run.

Last time I either didn't notice, or I've gone dumb from staring at perf
issues all day, but I'm not entirely sure I understand how we get here.

Suppose:

  migrate_disable();
  ...
  schedule()
    migrate_disable_switch()
      // switches p->cpus_ptr and p->nr_cpus_allowed
    pick_next_task()
      p = class->pick_task();
      put_prev_set_next_task(rq, rq->donor, p);
      return p;

So any task that ends up in put_prev_task_rt() wlll have passed through
migrate_disable_switch(), which have updated nr_cpus_allowed.

Or so my current thinking goes. You seeing this patch make a difference,
seems to suggest I'm missing something, but I couldn't spot it in that
wall of text.

Anyway, I'm still not sure why we can't just write:

> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 1535046a23ff..bb640278d30e 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -396,6 +396,13 @@ static inline void rt_queue_pull_task(struct rq *rq)
>  
>  static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
>  {
> +	if (p->nr_cpus_allowed <= 1)
> +		return;
> +#ifdef HAVE_RT_PUSH_IPI
> +	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
> +		return;
> +#endif
> + 

	if (p->nr_cpus_allowed <= 1 || is_migration_disabled(p))
		return;

for both RT and DL. Sure, we might get an extra load, but is that really
going to be noticable? Lots of scheduler code already looks at the
migrate disable thing anyway.

I don't see why it should depend on RT_PUSH_IPI, it never is actually
migratable, and so it never makes sense to have on the pushable list.

But perhaps I'm missing something; the above seems to suggest that is a
theme today.
