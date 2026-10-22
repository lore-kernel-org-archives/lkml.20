Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675105;
	b=4A0XG9DvyRLRo2VLUNQ4UPAHhmoyM0YXq+vnjgYy20maDyGVFjkTfaptsqebVXmvRj34
	 rq+al531YxdmXqh9AakLKbTkwQnalnCO5jwrQwOFLc6YCSWVB1ytkOxcmAT0Ji8UHCoRE
	 ed9f/v9lc5+c1vrH8xiDRIjRlJkjhWqwXkSflhvPStvovOkb4JOXmYxOGVCIAdKKsZ42H
	 e2JZWWtbkHalmicbBbsMU4W6d5EQbclpk3GwTZE3tFci9A5i9PRn7f90MAmwWxIEQwIOZ
	 zl6Tn4oBSLJ1DcruG436woYVGaiMhAb9BrUHtT92kvm9xkx8MWW74nD4Cm1pFfX7yDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675105;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=swlGTpCgKkmT+UOiqt+fzEs9J24+wRnX8k/h3Jo8Uv0=;
	b=JoA2MF8ESUqeD4c1f2iMiesdslkfoMdDSpfWRWO6fytIik/5lleVJ++jmFX5ikud4/xY
	 d+1uR3yP38h53hIuyKi/u2zv/TJystYihRSRk3MbRbdqVvWhwSNotSL17GfzO+SHWhPLo
	 ebpejI7yizTh829A5hCA7le4WOv4jj+Q6TtnFW7+rsYmBHma34Wl0VLC+cunjCtzpx6F6
	 /5c5sSca7oQmmBzgVR9mbZRCTYZDVz6W6wM5IwYOFGumuGkenmGcHsxJbsRWG3RMfyFme
	 LYF8XYG1qNWKop718ykjH29vKecKM8/jMoiMNzLi8k/88LQFkrdAdJEAZZt90Nm2gmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HZ6f8nTD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB111606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB111606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HZ6f8nTD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D55152C34;
	Thu, 22 Oct 2026 06:18:20 -0700 (PDT)
Received: from [10.0.128.106] (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669173F673;
	Thu, 22 Oct 2026 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792675104; bh=GpCrl8HkMsOj04CxC895x0DQrpYsUq4tXrNx7dgaFHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HZ6f8nTD5jEaekXbwrXncz5S7sJZSsbcFK9PeSj1QwxRCAn/YpJPZxiCYb+8NAJEB
	 tuiRofcKa6g2VwEQgDhcUKN0N7fzDlAum15uuYDk1xVqN/qSda5uz05ZuKohvjgmUC
	 VZD0kUL7QsYbPWE6sCrPlbM2aTgLWVe8jWHSCTvY=
Message-ID: <005ed941-2737-413c-8436-a9de227d01ca@arm.com>
Date: Thu, 22 Oct 2026 14:18:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
To: Qais Yousef <qyousef@layalina.io>, Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Qais Yousef <qyousef@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Wei Wang <wvw@google.com>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
 <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
 <20261021132058.kxzyumgxzir4jzi2@airbuntu>
 <20261021132956.GO2823843@noisy.programming.kicks-ass.net>
 <20261021140222.tazz6aw4j5pvqwox@airbuntu>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261021140222.tazz6aw4j5pvqwox@airbuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 15:02, Qais Yousef wrote:
> On 10/21/26 15:29, Peter Zijlstra wrote:
>> On Wed, Oct 21, 2026 at 02:20:58PM +0100, Qais Yousef wrote:
>>
>>>> Also note that a simple global boolean has the exact same problem.
>>>> Adding runtime conditionals isn't going to fix this.
>>>
>>> I have something in my memory that could be complete garbage that tells me all
>>> cpus should see the new update after a grace period, did my brain invent this?
>>
>> This is true; rcu_sync() implies a memory barrier on all CPUs, and
>> therefore all CPUs must observe the prior state upon completion.
>>
>> The thing is that a grace period is of 'arbitrary length' and during
>> that you can still have some CPUs seeing your variable set while others
>> will not and you get into the very same problem.
> 
> Maybe this arbitrary length what contributes to the size of the race window
> otherwise I struggle to see this being a problem practically.
> 
>>
>>> If not invented, can we do synchronize_rcu() once on any cpu seeing the code
>>> enabled for the first time to ensure the rest of the cpus has seen the newly
>>> enabled path?
>>>
>>> eg (not even compile tested):
>>>
>>> 	diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>>> 	index 7d2ec527b8a2..a6093ec88103 100644
>>> 	--- a/kernel/sched/sched.h
>>> 	+++ b/kernel/sched/sched.h
>>> 	@@ -3715,7 +3715,16 @@ unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
>>> 	  */
>>> 	 static inline bool uclamp_is_used(void)
>>> 	 {
>>> 	-       return static_branch_likely(&sched_uclamp_used);
>>> 	+       if (static_branch_likely(&sched_uclamp_used)) {
>>> 	+               static bool do_once = true;
>>> 	+               if (unlikely(do_once)) {
>>> 	+                       do_once = false;
>>> 	+                       synchronize_rcu();
>>> 	+               }
>>> 	+               return true;
>>> 	+       }
>>> 	+
>>> 	+       return false;
>>> 	 }
>>>
>>> 	 /*
>>
>> This cannot work; two immediate problems:
>>
>>  - the do_once needs re-evaluating for every switch
> 
> I think uclamp can only be turned on, but yeah for a generic solution this is
> a problem and the do_once will need to be reset on switch off.
> 
>>  - you cannot do rcu_sync while holding rq->lock ;-)
> 
> Uh-oh, right :-)
> 
>>
>>> The other alternative is to just accept this race can happen and do some sanity
>>> check and reset/cleanup on going to idle - which should be pretty cheap and
>>> straightforward.
>>
>> This seems the sanest option.
> 
> I think the below should do
> 
> -->8--
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158de..c6780358a797 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
>         uclamp_update_util_min_rt_default(p);
>  }
> 
> -static void __init init_uclamp_rq(struct rq *rq)
> +void init_uclamp_rq(struct rq *rq)
>  {
>         enum uclamp_id clamp_id;
>         struct uclamp_rq *uc_rq = rq->uclamp;
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index 76f3c84ca684..64ea91b743bb 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -502,6 +502,14 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>          * lost_idle_time of clock_pelt
>          */
>         update_idle_rq_clock_pelt(rq);
> +       /*
> +        * Due to a race condition when enabling sched_uclamp_used static key,
> +        * we can end up with imbalance where uclamp_rq_inc_id() has happened
> +        * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> +        * the static key flipped. The race condition is unlikely, but ensure
> +        * the uclamp_rq() state is set properly on each entry to idle.
> +        */
> +       init_uclamp_rq(rq);
>  }
> 
>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 7d2ec527b8a2..6d7be3e3b36b 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>  #ifdef CONFIG_UCLAMP_TASK
> 
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> +void init_uclamp_rq(struct rq *rq);
> 
>  /*
>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>         return SCHED_CAPACITY_SCALE;
>  }
> 
> +void init_uclamp_rq(struct rq *rq) {}
> +
>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
> 
>  static inline bool uclamp_is_used(void)

So I guess the clear-when-entering-idle taper is sufficient for UCLAMP_MIN.
UCLAMP_MAX (where on a sufficiently low setting we may just never have that
idle entry to clear) we expect to be fine because it's max-aggregated, i.e.
a second task would let us escape the low stale UCLAMP_MAX on the rq?
I guess we could reevaluate the static branch at every tick too if we really
care?
