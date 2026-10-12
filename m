Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F82745D5FC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817187; cv=none; b=nM1+TmOONgOT14b8ZvOsodxiArlWk5BL4NurTdWRpjn8XpLx8Rilw1kN9mCIoH6mJkRXqpYk54cg3KYVsyuy2J8VxXPkfEypgng1r6wssBIadqxqsXpA4i5nH6CFhleStrvC9QzBNcx7UJhJvUFKoUg33R+4ZzsDM1PzA8pcEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817187; c=relaxed/simple;
	bh=HympZk9lXfCqiqXJkVEprGiedosNp4ACVALkYZmD1rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHv81rG/c/pulEpnJ9IOgpgAdadhQqUVud4cMfcfL9KMCD1cUQKi3hMnk9Ou4bigDyylD/w2Ds9Cuu1UckCLMXnASs0I/aPr2HqKGkmcMIm6mJqul9F8Gcxm8KPVb6m/9uIvsgQfIZRidmdmlrrHA17TlWuPg3qXyRXkmOv7fAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GedY4aGx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GedY4aGx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA0FF1AC1;
	Mon, 12 Oct 2026 07:59:40 -0700 (PDT)
Received: from [10.0.128.106] (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 604653F673;
	Mon, 12 Oct 2026 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791817184; bh=HympZk9lXfCqiqXJkVEprGiedosNp4ACVALkYZmD1rM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GedY4aGxeaQLT6G+c5xOJoabOBH+r/YMTOdjpAbaqatx+OskmmdqF7QxrFzQUqGev
	 mfiwCfHWq258uEL3ZkTYsFw3ejXEvB6Ge4M6FVDm3kL8lABCyBRF7jEhmXPvWqPvGk
	 1oU+PkZl3wLAv7jOn2Li6RkIuogP4e9SnbExn7ko=
Message-ID: <5661a8d7-1a83-4336-b238-589f598075cf@arm.com>
Date: Mon, 12 Oct 2026 15:59:40 +0100
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
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261012140225.GU2009045@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/26 15:02, Peter Zijlstra wrote:
> On Mon, Oct 12, 2026 at 01:58:36PM +0100, Christian Loehle wrote:
>> On 9/11/26 17:02, Kayra Cizmeci wrote:
>>> cfs_rq->curr == se path on enqueue_task_fair() seems to be unachievable.
>>
>> Sashiko disagrees so I had a look and indeed cfs_rq unthrottling reaches this:
>> https://sashiko.dev/#/patchset/179033365207.2819794.11851486661940182495.tip-bot2%40tip-bot2
>> See the splat below.
>>
>> I'm afraid we need to revert
>> 819224e506bc ("sched/fair: Remove dead code on enqueue_task_fair()")
>> on tip/sched/core.
>>
>> I guess it's non-obvious enough to deserve a comment...
>>
>> [   95.833742] ------------[ cut here ]------------
>> [   95.833749] WARNING: kernel/sched/fair.c:8028 at enqueue_task_fair+0x7a8/0xa40, CPU#10: python3/6699
>> [   95.847486] Modules linked in: qrtr 8021q garp mrp stp llc cppc_cpufreq cdns3_pci_wrap binfmt_misc nf_tables fuse dm_mod r8169
>> [   95.858876] CPU: 10 UID: 0 PID: 6699 Comm: python3 Tainted: G S                  7.3.0-rc1-mpam-rt-orion-20261008+ #2 PREEMPT_RT 
>> [   95.870517] Tainted: [S]=CPU_OUT_OF_SPEC
>> [   95.874428] Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Orion O6, BIOS 1.1.0-1 2025-12-25T02:55:53+00:00
>> [   95.886324] pstate: 634000c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>> [   95.893275] pc : enqueue_task_fair+0x7a8/0xa40
>> [   95.897705] lr : enqueue_task_fair+0x324/0xa40
>> [   95.902136] sp : ffff800090323a50
>> [   95.905438] x29: ffff800090323a50 x28: 0000000000000009 x27: ffffd8536a9cc5c0
>> [   95.912565] x26: fffffdffbf43e1c0 x25: ffff0001fb7729c0 x24: fffffdffbf43e390
>> [   95.919692] x23: 0000000000000001 x22: ffff000085d52400 x21: 0000000000000000
>> [   95.926817] x20: ffff000085d52380 x19: ffff0001fb7727c0 x18: 0000000000000000
>> [   95.933943] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000037d54fe0
>> [   95.941069] x14: 0000000000000000 x13: ffffffffffffffff x12: ffffd8536a9cbdf8
>> [   95.948195] x11: 00000000000000c0 x10: 02ae55ef2a914684 x9 : ffff00008d3511c0
>> [   95.955321] x8 : 0000000000000001 x7 : 0000004100000000 x6 : ffffd8536a9cc5c0
>> [   95.962442] x5 : ffff800090323ad8 x4 : ffff800090323ad8 x3 : ffff000085d527b8
>> [   95.969563] x2 : 0000000000000001 x1 : ffff000085d52400 x0 : ffff000085d52400
>> [   95.976689] Call trace:
>> [   95.979124]  enqueue_task_fair+0x7a8/0xa40 (P)
>> [   95.983559]  tg_unthrottle_up+0x14c/0x318
>> [   95.987561]  walk_tg_tree_from+0x60/0xb8
>> [   95.991481]  unthrottle_cfs_rq+0xa8/0x204
>> [   95.995484]  tg_set_bandwidth+0x36c/0x4c4
>> [   95.999485]  cpu_max_write+0xc8/0x130
>> [   96.003138]  cgroup_file_write+0xa4/0x194
>> [   96.007150]  kernfs_fop_write_iter+0x130/0x1fc
>> [   96.011598]  vfs_write+0x228/0x358
>> [   96.015001]  ksys_write+0x6c/0x104
>> [   96.018395]  __arm64_sys_write+0x18/0x24
>> [   96.022309]  invoke_syscall+0x54/0x110
>> [   96.026051]  el0_svc_common.constprop.0+0x40/0xe0
>> [   96.030744]  do_el0_svc+0x1c/0x28
>> [   96.034048]  el0_svc+0x38/0x260
>> [   96.037183]  el0t_64_sync_handler+0xa0/0xe4
>> [   96.041357]  el0t_64_sync+0x17c/0x180
>> [   96.045011] ---[ end trace 0000000000000000 ]---
> 
> Argh, so this is bandwidth. Task gets throttled, but before it gets back
> to userspace to actually dequeue, it gets hit by a wakeup again while it
> is still current?
> 
> Hmm, no, in that case it can't actually be on throttled_tasks. So it did
> get dequeued, but it never quite scheduled out.
> 
> I hate this bandwidth stuff :-)
> 
> Anyway, this is different from the initial use-case, where a
> sched_entity would get dequeue and re-enqueued while walking the cgroup
> hierarchy, and thus had to appear like nothing happened in between.
> 
> In this case we're fine to advance time.
> 
> Anyway... the normal block/wakeup paths are >< close to also hitting
> this in the case where balancing drops the rq->lock after dequeue. The
> only reason ttwu can't tickle this is because it has that ->on_cpu
> stuff. However, we cannot use that on the unthrottle path :/
> 
> Bah.
> 
> Does this work?
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 5c98d8dfce5d..0edd8bfb6363 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8250,7 +8250,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	weight = enqueue_hierarchy(p, flags);
>  	reweight_eevdf(cfs_rq, se, weight, false);
>  	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> -	__enqueue_entity(cfs_rq, se);
> +
> +	/*
> +	 * This can actually happen with CFS_BANDWIDTH, in that case a task
> +	 * can get throttled, dequeued and then unthrottled, woken *before* it
> +	 * schedules out and does put_prev_task().
> +	 */
> +	if (cfs_rq->curr != se)
> +		__enqueue_entity(cfs_rq, se);
>  
>  	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
>  		dl_server_start(&rq->fair_server);

Tested-by: Christian Loehle <christian.loehle@arm.com>
for my reproducer, that being said, and indeed the failure is:
throttle -> dequeue (not put_prev_task()'d yet) -> (from remote CPU) unthrottle -> enqueue()

The dequeue()->enqueue() also lets place_entity()
'double-account' the entity's (on dequeue() saved) lag, right?
After dequeue:       curr == se, on_rq == 0 -> excl from average
enqueue_hierarchy(): curr == se, on_rq == 1 -> incl again
place_entity():      calculate placement assuming se is excl
