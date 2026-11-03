Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731896;
	b=FeUwz+C5fj8gR0QtPmvq8VDbAFX/mbqBe0sS7ab/62Ru2P5P52wHn93gfqxFYjDUe9aa
	 +IgAPCc0R/cbnSlkTfTyeS4GJiEODlzweThh0wq7NT29UD8uUh2lKpiaGft6FmJiUDk3s
	 eERbgxPCsy931E2qw7WWkBDDbWh9GgIy2AF0aU+vmXK5wBx7UzlBWwHPpmYq2GK6dkxVe
	 PwHOVHXUhwDD6m38YsqMeGEby6d6oM5il1lsyxGHvPVWu7j6vyCVRRSUtR93vwfgtYrpA
	 Gkg2YU7zYZaZjeJxhX3sZedseziC4dQypSGpAh4bB69tEs4eIwlOGLyqILJrPs1lF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=P2AhNUvRv4r3PiouVXy1pT/bdtHCjE386m1tNBwV0DA=;
	b=zn+G9OjCbLdMc7dLmf557EQmjhugecnIQ4ED5pPe1irPrBU2P+26AqPXq6pHyfPZqLff
	 gHOgjD1/E8+2wP/tPi+dcRl1lr5mL7M3fNDJRJ+J0CRgZTQwGO1v18r4mb1FPkRKyZ6xw
	 tFVtQ8OCjv+cDMSXciJWfaUaCq/pTt+ZdeAKEAHpNq68WXh1j7yPEo08BII42a3Vb4zKd
	 M8LoIwEf+n8nhHzZcMXBBMSUFojrdOBSlHJpy6cnKt8jFpwprMCHa9io51BiH3F0qwtB0
	 vKBiaMpE62IhpGjWuzxKyCAg+q+fgWwhKhWcmErVtxeYyJSjQWeH2SOwI26FXk2uTSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFpv09NA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40525606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40525606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFpv09NA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4aa3a2a5a15so7253655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731895; x=1794336695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P2AhNUvRv4r3PiouVXy1pT/bdtHCjE386m1tNBwV0DA=;
        b=XFpv09NAP/jlWz5vDW2e94jK5uDKSAIgpme2/0Lyxao1lN5UK/MrKY7Ei3hakV6K0e
         8RRnS/8X2vhVfkv/AZd4c8CzGsiL6tGLkKZPHcx42gnh8dHAmNQOgMtoIC74LdkLPOlv
         hpyQmWZ8+2A1tgz+Tejl6VMc9xly/AF1AjSRTQmnT7xB81sTN6Ixm6SEuiCSYZjwFf6C
         aAqP7K37gq6UFDKtpeVnwFKASJFa8IKr4eRvUu7qUlOl07zcFDyn3T3BW13sSDTKmP+z
         /OGBgOxGbjX0V2nJDz0kY2wwtD1Kuh9l38LiywtjP/iyDvHPH8EJFWyAgmJd6TtZf961
         TNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731895; x=1794336695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2AhNUvRv4r3PiouVXy1pT/bdtHCjE386m1tNBwV0DA=;
        b=U0heaX3cawhoOXX3m12LB8SWvdsaO/+yV3MkPcChVJzBcqBXbT2uxUQbTH9fGIVhCF
         oMOWDZ+gVDPlYdGMdJovAO7Uzk0hlLCP+zFUSXRYj7NdcRWjqm2QUZXcLCsu4pneo/5u
         6Aa8IjBxYxjY5JkY64jcxtkJ3GqcoTQ2rkKV3925kqVFn3tBLP4j2iu/S4xr2oxRJwGT
         UI901E4iiZWT/K50aSChS/T8CiFFi6TD3YYn8/aGmXK2DmhMzSdLD2i4Il22VYmfEA8b
         WgBszkjmmz7nT/KelLqDaUG1VQUdGV2ZNkOJysNDxFMQnyaYlPXVD9v+Y3FNQ9cxZOHy
         UkXw==
X-Forwarded-Encrypted: i=1; AKwUvByIwUvZ2E3SZAuyXsfcZugvFlM+KeLBarc64VkhhS+tjs5a4ImsiCzJYUnv7IVl9drj7Oc5A7BmYbD9R3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ohP3EKY8rkaZIuoI70B1pkE6RUXSzq88C6uGk4Q11kSF85fWD
	4cTo4bxXlR6xiT4FvUNy4tdbzETwTg+8P/sLDgZ0sCdl7qm2t1W+pWkt
X-Gm-Gg: AYBFou15YfjuVmj85c/eYKpKfV8QjmiVhFNaSQZXUj3ZwtH6VVVSe+YVBJIk7e/4S1n
	iQGQNBSQMQwqNQQnjbFHwZMOu6jalz1AxmjrCCDQOtXIllS8Aew02B/yDKeszKwN/gMRfnwC0fn
	c/0y6JejCumCPFXiYyh4Yi2mAiPGXhRuut+EmVvq1BmZxpqHqymkdL5v+A7/FYFK7ufCysIZyVH
	GdpcL6A7XatKJmWi29/iK30FokuUuJOCdkzPUFAd3hJ3IgUQCXhnsOKlN003fWfa3ZSlYlvDcvo
	9H3ONLUbHETnFsSweZTmFIXKww5P6rsImRoi5Ib+/otQGyc3DiVJSuVxxcu3bmmWbP+FMD463zO
	X9invUgdClxAlJdEDNG2k/GBNY1CFmDtQCPOONuhZUCo5tFTQtS1DXamnfMuutQI5EAfL3K0KWQ
	sPZDAVfVQAzz8JgYwWJm66Z2B/ozdWP9U0VffA9rXELr73zcNeF9mmsR/DIDt/F4LZ3q4bw5Owk
	6ARZ3Ni347JuCPdldEcYk9YUwj/pZ5BAZz/d05HJG8BPInUYZhztyIKBKvT9mK0nbho0MbrtdQq
	f6DlybT2kyExh9b1g/BPW+MuyLM8/R3Wn0OCV2xZJ9DS3YG/KozeB94=
X-Received: by 2002:a05:600c:1c06:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ac12194311mr390226285e9.0.1793731894491;
        Tue, 03 Nov 2026 10:51:34 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm148555895e9.14.2026.11.03.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:51:33 -0800 (PST)
Date: Tue, 3 Nov 2026 21:51:30 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 3/4] Revert "sched/rt: Substract number of tasks
 of throttled queues from rq->nr_running"
Message-ID: <auoRQiZbirZCFF1x@scheduler.schedules>
References: <20261103005953.56271-1-qyousef@layalina.io>
 <20261103005953.56271-4-qyousef@layalina.io>
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
In-Reply-To: <20261103005953.56271-4-qyousef@layalina.io>

Hi Qais,


On Tue, Nov 03, 2026 at 12:59:52AM +0000, Qais Yousef wrote:

> This partially reverts commit f4ebcbc0d7e009783256c9daf76bc4b90e645c14.
> 
> While trying to address uclamp static key race condition the throttling
> logic in RT and fair has highlighted that both perform incomplete
> dequeue since they don't go through core. RT logic seemed to diverge
> from fair pattern where rq->nr_running was management oddly.

But AFAICT from here the commit was doing its job, no? It was just 'odd'.

> 
> Digging into the history highlighted this partially reverted patch has
> added this out-of-line management of rq->nr_running instead in the usual
> place when tasks are actually added or removed from internal
> structures. It also had a confusing call in sched_rt_rq_dequeue() to
> dequeue_top_rt_rq() when it is essentially a dead code - in existing
> code base at least.
> 
> Revert the logic, but don't break the functionality. Instead do {add,
> sub}_nr_running() in {inc, dec}_rt_tasks() where the rest of the
> housekeeping is done.
> 
> Drop rt_queued usage in rt_rq_is_runnable() since it was unnecessary
> check. And make sched_rt_is_runnable() an alias to rt_rq_is_runnable()
> since we no longer have rt_queued and both functions are essentially
> identical.
> 
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> ---
>  kernel/sched/rt.c    | 74 ++++++--------------------------------------
>  kernel/sched/sched.h |  6 ++--
>  2 files changed, 11 insertions(+), 69 deletions(-)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 1535046a23ffa..cefb0a8d37e81 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -82,8 +82,6 @@ void init_rt_rq(struct rt_rq *rt_rq)
>  	rt_rq->highest_prio.next = MAX_RT_PRIO-1;
>  	rt_rq->overloaded = 0;
>  	plist_head_init(&rt_rq->pushable_tasks);
> -	/* We start is dequeued state, because no RT tasks are queued */
> -	rt_rq->rt_queued = 0;
>  
>  #ifdef CONFIG_RT_GROUP_SCHED
>  	rt_rq->rt_time = 0;
> @@ -429,8 +427,6 @@ static void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
>  	}
>  }
>  
> -static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
> -static void dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count);
>  
>  static inline int on_rt_rq(struct sched_rt_entity *rt_se)
>  {
> @@ -535,9 +531,7 @@ static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
>  	rt_se = rt_rq->tg->rt_se[cpu];
>  
>  	if (rt_rq->rt_nr_running) {
> -		if (!rt_se)
> -			enqueue_top_rt_rq(rt_rq);
> -		else if (!on_rt_rq(rt_se))
> +		if (rt_se && !on_rt_rq(rt_se))
>  			enqueue_rt_entity(rt_se, 0);
>  
>  		if (rt_rq->highest_prio.curr < donor->prio)
> @@ -553,7 +547,6 @@ static void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
>  	rt_se = rt_rq->tg->rt_se[cpu];
>  
>  	if (!rt_se) {
> -		dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
>  		/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
>  		cpufreq_update_util(rq_of_rt_rq(rt_rq), 0);
>  	}
> @@ -920,18 +913,12 @@ static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
>  
>  static inline void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
>  {
> -	struct rq *rq = rq_of_rt_rq(rt_rq);
> -
> -	if (!rt_rq->rt_nr_running)
> -		return;
> -
> -	enqueue_top_rt_rq(rt_rq);
> -	resched_curr(rq);
> +	if (rt_rq->rt_nr_running)
> +		resched_curr(rq_of_rt_rq(rt_rq));
>  }
>  
>  static inline void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
>  {
> -	dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
>  }
>  
>  static inline int rt_rq_throttled(struct rt_rq *rt_rq)
> @@ -1007,44 +994,6 @@ static void update_curr_rt(struct rq *rq)
>  #endif /* CONFIG_RT_GROUP_SCHED */
>  }
>  
> -static void
> -dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count)
> -{
> -	struct rq *rq = rq_of_rt_rq(rt_rq);
> -
> -	BUG_ON(&rq->rt != rt_rq);
> -
> -	if (!rt_rq->rt_queued)
> -		return;
> -
> -	BUG_ON(!rq->nr_running);
> -
> -	sub_nr_running(rq, count);
> -	rt_rq->rt_queued = 0;
> -
> -}
> -
> -static void
> -enqueue_top_rt_rq(struct rt_rq *rt_rq)
> -{
> -	struct rq *rq = rq_of_rt_rq(rt_rq);
> -
> -	BUG_ON(&rq->rt != rt_rq);
> -
> -	if (rt_rq->rt_queued)
> -		return;
> -
> -	if (rt_rq_throttled(rt_rq))
> -		return;
> -
> -	if (rt_rq->rt_nr_running) {
> -		add_nr_running(rq, rt_rq->rt_nr_running);
> -		rt_rq->rt_queued = 1;
> -	}
> -
> -	/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
> -	cpufreq_update_util(rq, 0);
> -}
>  
>  static void
>  inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
> @@ -1182,6 +1131,9 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
>  
>  	inc_rt_prio(rt_rq, prio);
>  	inc_rt_group(rt_se, rt_rq);
> +
> +	if (!group_rt_rq(rt_se))
> +		add_nr_running(rq_of_rt_rq(rt_rq), 1);
>  }
>  
>  static inline
> @@ -1194,6 +1146,9 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
>  
>  	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
>  	dec_rt_group(rt_se, rt_rq);
> +
> +	if (!group_rt_rq(rt_se))
> +		sub_nr_running(rq_of_rt_rq(rt_rq), 1);
>  }
>  
>  /*
> @@ -1383,39 +1338,29 @@ static void __dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flag
>  static void dequeue_rt_stack(struct sched_rt_entity *rt_se, unsigned int flags)
>  {
>  	struct sched_rt_entity *back = NULL;
> -	unsigned int rt_nr_running;
>  
>  	for_each_sched_rt_entity(rt_se) {
>  		rt_se->back = back;
>  		back = rt_se;
>  	}
>  
> -	rt_nr_running = rt_rq_of_se(back)->rt_nr_running;
> -
>  	for (rt_se = back; rt_se; rt_se = rt_se->back) {
>  		if (on_rt_rq(rt_se))
>  			__dequeue_rt_entity(rt_se, flags);
>  	}
> -
> -	dequeue_top_rt_rq(rt_rq_of_se(back), rt_nr_running);
>  }
>  
>  static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
>  {
> -	struct rq *rq = rq_of_rt_se(rt_se);
> -
>  	update_stats_enqueue_rt(rt_rq_of_se(rt_se), rt_se, flags);
>  
>  	dequeue_rt_stack(rt_se, flags);
>  	for_each_sched_rt_entity(rt_se)
>  		__enqueue_rt_entity(rt_se, flags);
> -	enqueue_top_rt_rq(&rq->rt);
>  }
>  
>  static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
>  {
> -	struct rq *rq = rq_of_rt_se(rt_se);
> -
>  	update_stats_dequeue_rt(rt_rq_of_se(rt_se), rt_se, flags);
>  
>  	dequeue_rt_stack(rt_se, flags);
> @@ -1426,7 +1371,6 @@ static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
>  		if (rt_rq && rt_rq->rt_nr_running)
>  			__enqueue_rt_entity(rt_se, flags);
>  	}
> -	enqueue_top_rt_rq(&rq->rt);
>  }
>  
>  /*
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 4706f73838a86..0cab55963657c 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -872,8 +872,6 @@ struct rt_rq {
>  	bool			overloaded;
>  	struct plist_head	pushable_tasks;
>  
> -	int			rt_queued;
> -
>  #ifdef CONFIG_RT_GROUP_SCHED
>  	int			rt_throttled;
>  	u64			rt_time; /* consumed RT time, goes up in update_curr_rt */
> @@ -892,7 +890,7 @@ struct rt_rq {
>  
>  static inline bool rt_rq_is_runnable(struct rt_rq *rt_rq)
>  {
> -	return rt_rq->rt_queued && rt_rq->rt_nr_running;
> +	return rt_rq->rt_nr_running;
>  }
>  
>  /* Deadline class' related fields in a runqueue */
> @@ -2918,7 +2916,7 @@ static inline bool sched_dl_runnable(struct rq *rq)
>  
>  static inline bool sched_rt_runnable(struct rq *rq)
>  {
> -	return rq->rt.rt_queued > 0;
> +	return rt_rq_is_runnable(&rq->rt);
>  }
>  
>  static inline bool sched_fair_runnable(struct rq *rq)
> -- 
> 2.53.0
> 

So, as I was saying above I gave this a run. Did some tests:

In my base a RT task can only get a CPU's %95.5, with the series %99.9.
Even when rt_throttled is 1, task doesn't stop running. I opened
CONFIG_RT_GROUP_SCHED and set cpu.rt_runtime_us to 950000. cgroup v1.


And AFAICT from the code and my tests, nr_running is handled
differently/wrong with this patch.

When there is a RT group while throttling is enabled, with 2 tasks when
the group throttles nr_running should be 0. Since, there is nothing to
run. (If the group is alone in the rq tho :>) But with the patch series,
it stays 2. I think it's because dec_rt_tasks() does not call
sub_nr_running() in the group_rt_rq() case of se.


Or am I missing something :-)?


Thanks,

Kayra
