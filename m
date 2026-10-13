Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD8D52BE3E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921432; cv=none; b=K1G1wn3s43LcFHgabsguZd1P77BGfukzouUNscP5yDHX0DMXxkipoFBlWz3Jg2LOQ6JA3Lhbh7ZnGFz7fsLDF/bAZC/QaWBp6Mxx6maQORFt7OQtCETdWQ5WntK9GXMpFOT0n+DMA31E3M2DQo89g/KMvCRW8RY4N89p27cUF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921432; c=relaxed/simple;
	bh=xOWRYaecabydE56IiJ3aqz+lv7B6CkKM6hJIn21k13k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l93uSKejZeCnqPWkcNdvQSgrZx0ZvnD+PLEm0ujrN3h60YrPLKhVmNNa9yQ27oEuP8ctbx0gMaR1VFKeYCWpP17/+P4pOse7UvxO96rKKO5XZNwbLzT+MtFY186n2pxcafi4h/6Mj7nZJbA3POCj2zwziV2MWgcu8yXAS5+4f04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B+7uNhj2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B+7uNhj2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 048492972;
	Tue, 13 Oct 2026 12:56:55 -0700 (PDT)
Received: from [10.57.79.26] (unknown [10.57.79.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321233F673;
	Tue, 13 Oct 2026 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791921418; bh=xOWRYaecabydE56IiJ3aqz+lv7B6CkKM6hJIn21k13k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B+7uNhj2ARuuqV6AYKFq49jgPegAtKACBUSaKD9eg717ql/vNUn+ee2cmPAF51PbN
	 dnBzkp8XRvzC36JSJ1gZoRtzSJ0Y7gd/z1uH5MPg5sq33FZFzMq4Y6Bj8wZvsVfXcm
	 2muzGb0suK9OZG+1uba4NIXLoT4epBFjqI8vm+tA=
Message-ID: <6f7ec108-603a-45c3-a5c2-6f9aebb50f54@arm.com>
Date: Tue, 13 Oct 2026 20:56:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
 <20260911160253.1249960-1-kayracizmeci@gmail.com>
 <fd3f9d83-cb5b-496b-b7c1-b40f31cf795e@arm.com>
 <20261012140225.GU2009045@noisy.programming.kicks-ass.net>
 <5661a8d7-1a83-4336-b238-589f598075cf@arm.com>
 <20261013115835.GI2009045@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261013115835.GI2009045@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 12:58, Peter Zijlstra wrote:
> On Mon, Oct 12, 2026 at 03:59:40PM +0100, Christian Loehle wrote:
>> On 10/12/26 15:02, Peter Zijlstra wrote:
> 
>>> Anyway, this is different from the initial use-case, where a
>>> sched_entity would get dequeue and re-enqueued while walking the cgroup
>>> hierarchy, and thus had to appear like nothing happened in between.
>>>
>>> In this case we're fine to advance time.
>>>
>>> Anyway... the normal block/wakeup paths are >< close to also hitting
>>> this in the case where balancing drops the rq->lock after dequeue. The
>>> only reason ttwu can't tickle this is because it has that ->on_cpu
>>> stuff. However, we cannot use that on the unthrottle path :/
>>>
>>> Bah.
>>>
>>> Does this work?
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 5c98d8dfce5d..0edd8bfb6363 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -8250,7 +8250,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>>>  	weight = enqueue_hierarchy(p, flags);
>>>  	reweight_eevdf(cfs_rq, se, weight, false);
>>>  	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
>>> -	__enqueue_entity(cfs_rq, se);
>>> +
>>> +	/*
>>> +	 * This can actually happen with CFS_BANDWIDTH, in that case a task
>>> +	 * can get throttled, dequeued and then unthrottled, woken *before* it
>>> +	 * schedules out and does put_prev_task().
>>> +	 */
>>> +	if (cfs_rq->curr != se)
>>> +		__enqueue_entity(cfs_rq, se);
>>>  
>>>  	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
>>>  		dl_server_start(&rq->fair_server);
>>
>> Tested-by: Christian Loehle <christian.loehle@arm.com>
>> for my reproducer, that being said, and indeed the failure is:
>> throttle -> dequeue (not put_prev_task()'d yet) -> (from remote CPU) unthrottle -> enqueue()
>>
>> The dequeue()->enqueue() also lets place_entity()
>> 'double-account' the entity's (on dequeue() saved) lag, right?
>> After dequeue:       curr == se, on_rq == 0 -> excl from average
>> enqueue_hierarchy(): curr == se, on_rq == 1 -> incl again
>> place_entity():      calculate placement assuming se is excl
> 
> I'm not entirely sure I follow. With the above fix there is still only
> one place_entity(), which is after enqueue_hierarchy() and has
> ENQUEUE_QUEUED on.

Exactly.

> 
> Here enqueue_hierarchy() adds the entity to h_nr_queued, and
> ENQUEUE_QUEUED tells place_entity() exactly this, so it can adjust.

... but place_entity(ENQUEUE_QUEUED) still does:

    load = cfs_rq->sum_weight;
    if (curr && curr->on_rq) // <-- this is true after enqueue_hierarchy()
       load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
         
    weight = avg_vruntime_weight(cfs_rq, se->h_load.weight); // <- this assumes se isn't already part of cfs_rq weight, but it is (still)
    lag *= load + weight; 
    ...

(in this concrete enqueue()->dequeue() due to unthrottling case)
