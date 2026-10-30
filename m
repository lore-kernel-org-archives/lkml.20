Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357459;
	b=r6E56VAQTBbqMhOWTC0pSekACgfrsmDP2h8MJpt0PkeXCdXrffyztA4w2tC4iZUi/TWJ
	 TZO0qhnb3dC/vCUWNYPFEeD3UufobmIt6pEQVa2mG3f8bwDzwprmMRH3kW77IjEHyTpG8
	 ZDFAw4nl1rmN2qpSxmbYDoaIgA3zrVFqMWV0OTVUE4BTGxh61eOmssP95tRAE0ZXNwi8H
	 PSqI0aq3lLZt50F3Ae0q3Ke8Kygm5STXUuO2wiYwdT3JwqfOlph8wAA4k6qexMMWaf0VR
	 c8wsGC2A+FUxeI22X8GomgilHAGVPZryuSJ0KGWV7McJFxVGyzmiN0FkTwXNn5b52qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357459;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=m9OIGk7Och9/7W7VBGIbXqrvhsGJ/tw00Ksy3Ru99n0=;
	b=HWnoZsmLaKfdvZq2YvvSx9N+TyYt8lgKJkS41Eq0pHalWlkQE8CZGg0GB0tE2xuKjvh5
	 8dtA8BiqlQkjlVsnnycG+uezWQKk6wsnwfibV//WcSmQvuSe8cwq30CUoo3eFMvr4mzw5
	 7JYTxruxN0wEw8f6IhZFqaDGTdA+DfN8LH34i5v9SWyDFsZLU8sY/9RZO1apT6HU0FGFn
	 /tfVpbwzxiaHoPaZh1sE+c4MCnkpzpWr8+RXL07Pxb7W1wv3Y1zvYkqwVEGJSi0sf3aar
	 9AC8Jp90g1tl5x9WFDsKDAp4wvlRGDP+xx29iYNA/4LLW89CczukIzgFAg9/+jUmIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WBEEk86T;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FA560A2621
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65FA560A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WBEEk86T
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C3531BD0;
	Fri, 30 Oct 2026 03:50:54 -0700 (PDT)
Received: from [10.57.79.231] (unknown [10.57.79.231])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545D73F673;
	Fri, 30 Oct 2026 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793357457; bh=uV5YcTtCLVEXriZ7dyCjSz+UGinUL/gRKTjrpczvAi0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WBEEk86ThlBDyE9YT/FmcB/75IIP+BNg9u267PpFztFaTe8ofgwXfmUI/RvtHbnRl
	 uu0mcaVivYpyvlti8ZpTnxcjMREMJza16ky6Jaz0YDWBCFu4PjQ+IG6IkC6Vg6FAeB
	 uzmQqLX4hye3NjKCneSC9vxoov+DLbRYAguLDgHU=
Message-ID: <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>
Date: Fri, 30 Oct 2026 10:50:53 +0000
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
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
 <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 23:43, Qais Yousef wrote:
> On 10/29/26 15:58, Christian Loehle wrote:
> 
>>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
>>> index 76f3c84ca6846..84301fc49e699 100644
>>> --- a/kernel/sched/idle.c
>>> +++ b/kernel/sched/idle.c
>>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>>>        * lost_idle_time of clock_pelt
>>>        */
>>>       update_idle_rq_clock_pelt(rq);
>>> +
>>> +    /*
>>> +     * Due to a race condition when enabling sched_uclamp_used static key,
>>> +     * we can end up with imbalance where uclamp_rq_inc_id() has happened
>>> +     * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
>>> +     * the static key flipped. The race condition is unlikely, but ensure
>>> +     * the uclamp_rq() state is set properly on each entry to idle.
>>> +     *
>>> +     * The reset will cause the uclamp_max from uclamp_idle_value() to be
>>> +     * lost. Since we are imbalanced, hard to know what is right. So just
>>> +     * cleanup. This should be a transient error state once we recover
>>> +     * everything should work as expected.
>>> +     *
>>> +     * We need to be careful of some paths that can force idle with tasks
>>> +     * are still queued.
>>> +     */
>>> +    if (uclamp_is_used() &&
>>> +        !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
>>
>> just checking nr_running isn't enough as CFS bandwidth throttling (a fun one
>> recently!) will decrement it through dequeue_task_fair() without calling
>> uclamp_rq_dec(), i.e. it's clamps must remain valid AFAICS.
> 
> I think this and the rt group throttling are false positives. Do they actually force idle or just under contention dequeue the task temporarily to allow other queued tasks to run?

It forces idle, I can reproduce active=1 and bucket->tasks=0 and the WARN_ON_ONCE triggers:

[  329.665099] WARNING: kernel/sched/core.c:1845 at uclamp_rq_dec_id+0x10c/0x1dc, CPU#5: systemd-journal/281
[  329.679279] Modules linked in:
[  329.682333] CPU: 5 UID: 0 PID: 281 Comm: systemd-journal Tainted: G S                   7.3.0-uclamp-cfs-repro-20261030 #2 PREEMPT_RT 
[  329.694411] Tainted: [S]=CPU_OUT_OF_SPEC
[  329.698323] Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Orion O6, BIOS 1.1.0-1 2025-12-25T02:55:53+00:00
[  329.710222] pstate: 834000c9 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[  329.717174] pc : uclamp_rq_dec_id+0x10c/0x1dc
[  329.721524] lr : uclamp_rq_dec_id+0x98/0x1dc
[  329.725786] sp : ffff800081bb3a80
[  329.729089] x29: ffff800081bb3a90 x28: 0000000000000001 x27: ffffb54253580c40
[  329.736219] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[  329.743348] x23: 0000000000000000 x22: ffff000085462380 x21: ffff0001fb6e2c40
[  329.750478] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000000
[  329.757606] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[  329.764736] x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
[  329.771865] x11: 0000000000000000 x10: 006c616e72756f6a x9 : 0000000000000000
[  329.778993] x8 : 006c616e72756f6a x7 : ffff000085462380 x6 : 0000000000000001
[  329.786122] x5 : 00000000000000e1 x4 : ffff4abfa8162000 x3 : ffff0001fb6e2c40
[  329.793251] x2 : 000000000000000c x1 : 0000000000000000 x0 : 0000000000000000
[  329.800380] Call trace:
[  329.802816]  uclamp_rq_dec_id+0x10c/0x1dc (P)
[  329.807168]  dequeue_task+0x54/0x134
[  329.810737]  __schedule+0x6b0/0x1018
[  329.814307]  schedule+0x34/0xd4
[  329.817440]  schedule_hrtimeout_range_clock+0x108/0x11c
[  329.822657]  schedule_hrtimeout_range+0x14/0x20
[  329.827179]  do_epoll_wait+0x47c/0x594
[  329.830922]  do_compat_epoll_pwait.part.0+0x14/0xb4
[  329.835792]  __arm64_sys_epoll_pwait+0x74/0x114
[  329.840314]  invoke_syscall+0x54/0x108
[  329.844055]  el0_svc_common.constprop.0+0xc0/0xe0
[  329.848750]  do_el0_svc+0x1c/0x28
[  329.852055]  el0_svc+0x38/0x250
[  329.855189]  el0t_64_sync_handler+0xa0/0xe4
[  329.859363]  el0t_64_sync+0x17c/0x180
[  329.863018] ---[ end trace 0000000000000000 ]---


> 
> If this is the last running task and throttling can force it off the queue partially then enter idle, I don't think the bug is here. It should do a full dequeue then. But I am not awfully familiar with this code, so could be missing something.
> 
> For context, below is Sashiko's full report. Proxy and core scheduling seems to cause temporarily context switch to idle. No idea about sched_ext. 3 and 4 seem false positive to me.
> 
> --->8---
> 
> Can calling init_uclamp_rq(rq) in set_next_task_idle() corrupt rq->uclamp
> when the runqueue schedules the idle task while uclamp-active tasks are still
> queued on rq?
> In kernel/sched/core.c, init_uclamp_rq() zeroes all bucket->tasks counters
> and resets rq->uclamp[clamp_id].value without clearing
> p->uclamp[clamp_id].active on tasks that remain on rq:
> kernel/sched/core.c:init_uclamp_rq() {
>     for_each_clamp_id(clamp_id) {
>         uc_rq[clamp_id] = (struct uclamp_rq) {
>             .value = uclamp_none(clamp_id)
>         };
>     }
>     rq->uclamp_flags = UCLAMP_FLAG_IDLE;
> }
> When those still-queued tasks are later dequeued, uclamp_rq_dec_id() in
> kernel/sched/core.c sees uc_se->active is still true while bucket->tasks was
> zeroed (or decrements another task's bucket reference count):
> kernel/sched/core.c:uclamp_rq_dec_id() {
>     if (unlikely(!uc_se->active))
>         return;
>     bucket = &uc_rq->bucket[uc_se->bucket_id];
>     WARN_ON_ONCE(!bucket->tasks);
>     if (likely(bucket->tasks))
>         bucket->tasks--;
> }
> There appear to be several normal scheduling paths that reach
> set_next_task_idle() while tasks remain queued on rq with
> p->uclamp[clamp_id].active set and UCLAMP_FLAG_IDLE cleared:
> 1. With proxy execution enabled, proxy_deactivate() and proxy_migrate_task()
> in kernel/sched/core.c call proxy_resched_idle(rq) ->
> put_prev_set_next_task(rq, rq->donor, rq->idle) -> set_next_task_idle()
> immediately before calling block_task() or deactivate_task():
> kernel/sched/core.c:proxy_deactivate() {
>     proxy_resched_idle(rq);
>     block_task(rq, donor, state);
> }
> Here set_next_task_idle() zeroes bucket->tasks via init_uclamp_rq(rq), and on
> the very next line block_task() -> dequeue_task() -> uclamp_rq_dec() ->
> uclamp_rq_dec_id() triggers WARN_ON_ONCE(!bucket->tasks). Similarly,
> find_proxy_task() calls proxy_resched_idle(rq) when a mutex-blocked donor and
> other runnable tasks remain queued on rq.
> 2. With core scheduling enabled, pick_next_task() in kernel/sched/core.c can
> force-idle an SMT sibling rq_i that still has runnable tasks queued when no
> task matches the core cookie:
> kernel/sched/core.c:pick_next_task() {
>         if (!cookie_equals(p, cookie)) {
>             p = NULL;
>             if (cookie)
>                 p = sched_core_find(rq_i, cookie);
>             if (!p)
>                 p = idle_sched_class.pick_task(rq_i, rf);
>         }
> }
> 3. With CFS bandwidth throttling enabled, throttle_cfs_rq_work() in
> kernel/sched/fair.c dequeues tasks via dequeue_task_fair() directly without
> going through dequeue_task() and uclamp_rq_dec():
> kernel/sched/fair.c:throttle_cfs_rq_work() {
>         dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_THROTTLE);
>         list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> }
> 4. With RT group bandwidth throttling enabled, sched_rt_runtime_exceeded() in
> kernel/sched/rt.c dequeues the throttled rt_rq via sched_rt_rq_dequeue() ->
> dequeue_top_rt_rq() without calling dequeue_task() and uclamp_rq_dec() on the
> queued RT tasks:
> kernel/sched/rt.c:sched_rt_runtime_exceeded() {
>         if (rt_rq_throttled(rt_rq)) {
>             sched_rt_rq_dequeue(rt_rq);
>             return 1;
>         }
> }
> 5. With sched_ext enabled (where ext_sched_class sets uclamp_enabled),
> do_pick_task_scx() in kernel/sched/ext/ext.c returns NULL when the local DSQ
> is empty even if tasks enqueued on rq reside in a non-local DSQ or BPF
> custody:
> kernel/sched/ext/ext.c:do_pick_task_scx() {
>         p = first_local_task(rq);
>         if (!p)
>             return NULL;
> }
> When any of these paths causes rq to schedule rq->idle while tasks with
> p->uclamp[clamp_id].active remain on rq, wouldn't init_uclamp_rq(rq) wipe
> active frequency clamps and corrupt the bucket task counts?

