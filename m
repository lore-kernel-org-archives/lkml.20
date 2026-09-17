Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6149D5BF;
	Thu, 17 Sep 2026 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672620; cv=none; b=EKM9KmXf6/iBf2lASepPPrnqvBnQ7h5F3xPi7aCqKiq9cfmYbRSP5Cg55gt2nk6oAwRV4qWOhjeeIzCM8YDfyBjOMa1fbhBNCljmOzXIyID/ieSpJY9LPhjs0aioKybJAMT39UfjsFHPwMBc9aQ2sAJv59LDBIagUQQbGKAawj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672620; c=relaxed/simple;
	bh=+QvQJ+Tkg8ulkGryhPKG37cAssAhiwb20Zm7VBecE7E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZJ2D5iZG6spJZTNejyy+lcs9UTS/sadDbYSeHpHGbzlMLt1goL0wwIXYf2pare8y8fDngO8hFhTzO0tPF5URSVODz0nYGLeHlhdR8DFf+nvb8XkeE6v1J6SFNb3X1d9Qfmb/ds/t3VAVdddJEmXOjBWydZdtKndoQF7pygK7Xds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=ksPzSYvM; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="ksPzSYvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1789672005;
	bh=+QvQJ+Tkg8ulkGryhPKG37cAssAhiwb20Zm7VBecE7E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ksPzSYvM9zDh7MKaIWcd7fHOj5WqLp5uioycxVg/Q3KCyCdvzrjmXYBG2BwBC/fZ4
	 q2P4o+vY5uhic56uclApTMEzbVwwkWViSTzOzUGWQaEEgGQ+oMPbNXJXCj/Nd3beUs
	 X6jiRVWfYLj8F69bspBjJvJnkDeqmyY9HxxKTFvI=
Received: by gentwo.org (Postfix, from userid 1007)
	id D74724027F; Thu, 17 Sep 2026 12:06:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id D271B401E1;
	Thu, 17 Sep 2026 12:06:45 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:06:45 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    Christopher Lameter <clameter@amperecomputing.com>, 
    Shrikanth Hegde <sshegde@linux.ibm.com>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] sched: Document WF_SYNC wakeup placement
 semantics
In-Reply-To: <d52d3775-ded0-4b7a-8315-6e940ba90f4a@linux.ibm.com>
Message-ID: <40b2c45a-edbc-ec7b-1fb3-354200bffe96@gentwo.org>
References: <20260825-sched-wf-sync-doc-v1-0-f899edb44ff5@gentwo.org> <20260825-sched-wf-sync-doc-v1-1-f899edb44ff5@gentwo.org> <d52d3775-ded0-4b7a-8315-6e940ba90f4a@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Vineeth,

Thank you for the review.

My intent was to document the observable WF_SYNC semantics because the
waitqueue API currently states a stronger no-migration guarantee than
the scheduler provides. In particular, I wanted to make clear that
WF_SYNC is an advisory hint i.e. it can affect fair class placement and
preemption, but it doesn't require the wakee to stay on the waker CPU,
avoid migration, or preempt immediately.

I included the call flow to support those conclusions and to distinguish
them from a stronger placement policy. But I agree that reproducing helper
names, predicates and the current ordering makes the document too
implementation specific and likely to become stale.

So I will rework it to retain the detailed placement and preemption
behavior, expressed as scheduler level policy and observable outcomes
rather than the implementation flow.

Thanks,
Shubhang Kaushik

On Thu, 3 Sep 2026, Madadi Vineeth Reddy wrote:

> On 26/08/26 04:16, Shubhang Kaushik (Ampere) wrote:
>> WF_SYNC is supplied by callers that expect the waker to schedule away
>> soon. The fair-class wakeup path uses it as a heuristic, but its
>> placement and preemption behavior is not documented.
>>
>> Document the current behavior from try_to_wake_up() through
>> select_task_rq_fair(), select_idle_sibling(), and preempt_sync(). In
>> particular, document that WF_SYNC does not bypass wake_wide(), does not
>> make wake_affine()'s target final, and does not require immediate wakee
>> preemption.
>>
>> This documents existing behavior only. It does not establish a new
>> WF_SYNC placement policy.
>>
>> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
>> ---
>>  Documentation/scheduler/index.rst               |   1 +
>>  Documentation/scheduler/sched-wake-affinity.rst | 133 ++++++++++++++++++++++++
>>  2 files changed, 134 insertions(+)
>>
>> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
>> index 17ce8d76befc1bb1dc289e9243bdca98c9ccb172..ac95c79617fd2c03564ea4a9dad362091b9d1b86 100644
>> --- a/Documentation/scheduler/index.rst
>> +++ b/Documentation/scheduler/index.rst
>> @@ -14,6 +14,7 @@ Scheduler
>>      sched-design-CFS
>>      sched-eevdf
>>      sched-domains
>> +    sched-wake-affinity
>>      sched-capacity
>>      sched-energy
>>      schedutil
>> diff --git a/Documentation/scheduler/sched-wake-affinity.rst b/Documentation/scheduler/sched-wake-affinity.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..6b0dc83da537ad576130ef165a2bb1cf5abd814a
>> --- /dev/null
>> +++ b/Documentation/scheduler/sched-wake-affinity.rst
>> @@ -0,0 +1,133 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +==============================
>> +WF_SYNC Wakeup Placement Hints
>> +==============================
>> +
>> +WF_SYNC is a wakeup flag supplied by callers that expect the waking task
>> +to schedule away soon after waking another task. It is a scheduler hint,
>> +not a CPU-placement request.
>> +
>> +The synchronous waitqueue helpers pass WF_SYNC to try_to_wake_up(). The
>> +wakeup path adds WF_TTWU before invoking the scheduler. WF_SYNC itself
>> +does not block, yield, or otherwise change the state of the waker.
>> +
>> +This document describes the current behavior for the fair scheduler.
>> +Other scheduler classes may ignore WF_SYNC or apply their own policy.
>> +
>> +Wakeup paths
>> +============
>> +
>> +A successful wakeup does not always select a CPU. If the wakee is already
>> +queued, try_to_wake_up() can complete the wakeup through ttwu_runnable().
>> +That path retains the wakee's current runqueue, although it can still
>> +invoke wakeup_preempt().
>> +
>> +For a wakee that is not queued, try_to_wake_up() calls
>> +select_task_rq(). If the wakee has one allowed CPU or migration is
>> +disabled, select_task_rq() bypasses the scheduler-class CPU-selection
>> +method and selects an allowed CPU directly.
>> +
>> +Fair-class CPU selection
>> +========================
>> +
>> +For a fair-class wakee, select_task_rq_fair() derives its local sync
>> +state as::
>> +
>> +        sync = (wake_flags & WF_SYNC) &&
>> +               !(current->flags & PF_EXITING);
>> +
>> +Thus, WF_SYNC does not influence wake-affine selection when the current
>> +task is exiting.
>> +
>> +For WF_TTWU wakeups, select_task_rq_fair() first calls record_wakee().
>> +It can then return before wake-affine selection in either of these cases:
>> +
>> +* WF_CURRENT_CPU is set and the waking CPU is allowed; or
>> +* find_energy_efficient_cpu() selects a CPU while the root domain is not
>> +  overutilized.
>> +
>> +Otherwise, the fair scheduler computes::
>> +
>> +        want_affine = !wake_wide(p) &&
>> +                      cpumask_test_cpu(cpu, p->cpus_ptr);
>> +
>> +wake_wide() uses the wakee-flip state maintained by record_wakee() to
>> +identify broad wakeup relationships. WF_SYNC does not override this
>> +classification.
>> +
>> +Wake affinity is considered only when want_affine is true, the domain has
>> +SD_WAKE_AFFINE set, and the wakee's previous CPU belongs to that domain.
>> +wake_affine() considers only two CPUs: the waking CPU and the wakee's
>> +previous CPU.
>> +
>> +With WF_SYNC, wake_affine_idle() can prefer the waking CPU when::
>> +
>> +        rq->nr_running - cfs_h_nr_delayed(rq) == 1
>> +
>> +wake_affine_weight() also adjusts the effective load comparison by
>> +removing the current task's load from the waking CPU and biasing the
>> +previous-CPU effective load.
>> +
>> +The result of wake_affine() is only a candidate. For WF_TTWU wakeups,
>> +select_task_rq_fair() passes that candidate to select_idle_sibling().
>
> This document reproduces the implementation literally like want_affine,
> nr_running, helper names. This could quickly go stale with code changes
> and nothing will tell us then. I think the contract doesn't need the
> call flow.
>
> Thanks,
> Vineeth
>
>> +
>> +Idle CPU selection
>> +==================
>> +
>> +select_idle_sibling() first tests whether the candidate CPU is idle and
>> +can run the wakee. If not, it can select:
>> +
>> +* the previous CPU when it is cache-affine and idle;
>> +* a recently used CPU when it is cache-affine and idle;
>> +* an idle SMT sibling; or
>> +* another idle CPU in the relevant search domain.
>> +
>> +On asymmetric-capacity systems, the search uses sd_asym_cpucapacity when
>> +available. Otherwise, it uses sd_llc for the candidate CPU.
>> +
>> +Consequently, WF_SYNC does not guarantee that the wakee runs on the
>> +waker CPU, remains on its previous CPU, avoids migration, or shares a
>> +core with the waker.
>> +
>> +Fair-class wakeup preemption
>> +============================
>> +
>> +WF_SYNC can also affect wakeup_preempt_fair(). The normal fair-class
>> +preemption checks run first. In particular, a non-idle wakee can preempt
>> +an idle entity, and PREEMPT_SHORT can select the wakee before the
>> +WF_SYNC-specific path is reached.
>> +
>> +If the wakee becomes the next buddy after those checks, preempt_sync()
>> +uses WF_SYNC to decide whether to request rescheduling. The wakee must
>> +be earlier than the current entity, and the current entity must have run
>> +for at least the applicable threshold. The threshold is
>> +sysctl_sched_migration_cost, divided by four when WF_RQ_SELECTED is set.
>> +
>> +If those conditions are not met, preempt_sync() returns
>> +PREEMPT_WAKEUP_NONE. Consequently, WF_SYNC neither guarantees nor
>> +prevents immediate wakee preemption. On UP, it can avoid an unnecessary
>> +preemption when the waker is expected to schedule away.
>> +
>> +Semantics and policy
>> +====================
>> +
>> +WF_SYNC is a non-binding hint. It does not guarantee that the wakee:
>> +
>> +* runs on the waker CPU;
>> +* remains on its previous CPU;
>> +* avoids migration;
>> +* shares a core with the waker; or
>> +* immediately preempts the current task.
>> +
>> +The scheduler does not verify that the waker subsequently blocks.
>> +Callers may therefore use WF_SYNC where the waker continues to execute,
>> +or where several wakeups are issued before it schedules away.
>> +
>> +The current policy leaves the locality, parallelism, topology, load, and
>> +capacity tradeoffs to the scheduler. It does not require the wakee to
>> +remain on the waker CPU when that CPU has no other runnable task.
>> +
>> +Any future policy that strengthens WF_SYNC placement semantics must
>> +consider the different call sites, workload patterns, and hardware
>> +topologies that use the flag.
>>
>
