Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A104C7558
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404140; cv=none; b=sfwMhtZkip7kmtNAsZz+rvtSsRaiqZW2265pOKSN1GsjQ5bVi/x67qp4vCNK+Ka4S5Q6WjMXfPp26KZfL5X5XNhXNwumuwl/9FaThVrQ3UJW9e+CIaWXRvrO5ydoldRdm8UPQ+2BoXaxucDEmU4Uwja5plqxRDk5hBk73ik36M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404140; c=relaxed/simple;
	bh=N7PXZUkiTdbMXD4NeB/Yd+o/nzef9+30qjiQJEgOvI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIbyHLB4/60dEzjkSheE8KEA2QSP8jWX8vau5J93YwItGsa+ITGYxhScIqsuP+HGUnyq8maUSlnGBUjchtHXBfL1HSWQU2zzICpgYdCuIydGyUi9YurIl2L9jARpG30rRgI1y741RoJyuLZsW6Ph/dukBNlzRZLX6zpfkodHrBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YQ8X/Zox; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YQ8X/Zox"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=L84qJtfJ9S6/LuO4j3bavxjE6k5iFfNr5ESP2hqWuHs=; b=YQ8X/ZoxNjP+g2MhUZJXRGqEnW
	6mYpopUv/1LB2a7VrhrvkhRsrlXmRQG+fhVOXlgCiAfa5eAQrLHTtdeVL1h+vwTQmn8exP9h6oiDk
	By/6ZPMkZiD2qGRCbRiGVVkELtZOeD3XzmrtIWn0/qXUsEIQa5oCNup1RInAv81BuIUEOxbKvudhh
	cpi4XFErr5THYXT54uHRmudry5idFcp9DrIyrkyO1sUxw3A3pCw1aEIisDe63MXB3KfBe2zu1ELK1
	dqhCuSJdsG+I88kpAW17u0YwrimvWWEBMC1oke0KdJjrse4l1ekfTXLtoh73tJQVff1nTk7cWioIr
	e3O4+qew==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xIkC1-003Lwi-UU; Mon, 19 Oct 2026 12:02:09 +0200
Message-ID: <9bb46cf4-7982-463b-8289-06bbc319bba9@igalia.com>
Date: Mon, 19 Oct 2026 11:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v6.1 2/3] workqueue: Add support for real-time workers
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
References: <20261001160711.59888-3-tvrtko.ursulin@igalia.com>
 <20261001184848.61776-1-tvrtko.ursulin@igalia.com>
 <3a139a32135c149f51bac4f2bd58ad56@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3a139a32135c149f51bac4f2bd58ad56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 02/10/2026 20:30, Tejun Heo wrote:
> Hello,
> 
> The following is a Claude-generated review.
> 
> On Thu, Oct 01, 2026 at 07:48:48PM +0100, Tvrtko Ursulin wrote:
>> For use cases such as the DRM scheduler submitting work to the GPU on
>> behalf of low latency userspace applications, where latter have sufficient
>> privileges to have had successfully obtained realtime Vulkan global
>> priority, competing with random background CPU load can create large
>> latency spikes which gets in the way of a smooth user experience.
> 
> Can you add the compositor / DRM master usage model from the v5 discussion
> here? The cover letter also still says CAP_SYS_NICE is required while
> group_priority_permit() accepts DRM master too.

Yeah forgot about this, will add.

> 
>> +	HIGHPRI_PRIORITY	= NICE_TO_PRIO(MIN_NICE),
>> +	RT_PRIORITY		= MAX_RT_PRIO - 1,
> 
> MAX_RT_PRIO - 1 is what rt_priority 0 would map to, while
> sched_set_fifo_low() gives the workers prio 98. Nothing depends on it today,
> but maybe MAX_RT_PRIO - 2 with a comment tying it to sched_set_fifo_low(),
> or soften the kerneldoc which says the encoding matches task_struct->prio?
> Also, s/analoguous/analogous/ there.

Done.

>> +	if (wq->flags & WQ_RT) {
>> +		attrs->prio = RT_PRIORITY;
>> +		/*
>> +		 * RT workqueues have strict CPU affinity for low
>> +		 * latency execution.
>> +		 */
>> +		attrs->affn_scope = WQ_AFFN_CPU;
>> +		attrs->affn_strict = true;
> 
> apply_workqueue_attrs() is unrestricted, so a caller can hand a WQ_RT wq the
> attrs from alloc_workqueue_attrs() and turn it into a normal non-strict wq
> while the flag stays set. Maybe apply_wqattrs_prepare() should force prio
> and affinity for WQ_RT instead of restricting only the sysfs side?

I am not entirely sure about this one. It could be done in 
apply_wqattrs_prepare(), but it would end up redundant on the sysfs 
path. Because currently there are two paths:

1)
alloc_wq_std_attrs
  -> apply_workqueue_attrs_locked

This is the hunk this review comment is about. Affinity and scope is set 
from wq->flags.

2)
wq_sysfs_prep_attrs
  -> apply_workqueue_attrs_locked

Here the attributes have had the affinity and scope copied from the 
respective workqueue (wq_sysfs_prep_attrs -> copy_workqueue_attrs).

If we moved the scope and affinity setting from alloc_wq_std_attrs to 
apply_wqattrs_prepare it would work, but on this path it would be redundant.

Am I missing something?

>> +	if (flags & WQ_RT) {
>> +		if (WARN_ON_ONCE((flags & (WQ_HIGHPRI | WQ_UNBOUND)) !=
>> +			         WQ_UNBOUND))
>> +			return NULL;
>> +	}
> 
> alloc_ordered_workqueue() with WQ_RT passes this and ends up with a single
> pool spanning all CPUs because ordered wqs use dfl_pwq everywhere, while the
> doc and sysfs say strict per-CPU. Should __WQ_ORDERED be rejected too? The
> nested ifs can also be a single condition.

Not sure - Tejun what is your guidance here? Is this purely an 
implementation challenge because conceptually it should work, no?

P.S. The nested ifs could be a single condition but I wanted to mimic 
the existing style so it looks nicer:

	if (flags & WQ_BH) {
		if (WARN_ON_ONCE(flags & ~__WQ_BH_ALLOWS))
			return NULL;
		if (WARN_ON_ONCE(max_active))
			return NULL;
	}

	if (flags & WQ_RT) {
		if (WARN_ON_ONCE((flags & (WQ_HIGHPRI | WQ_UNBOUND)) !=
			         WQ_UNBOUND))
			return NULL;
	}

I can change if desired.

> 
>> -		pr_cont(" nice=%d", pool->attrs->nice);
>> +		pr_cont(" nice=%d", PRIO_TO_NICE(pool->attrs->prio));
> 
> This prints nice=-21 for RT pools. Can you show "rt" here like nice_show()?

Done.

>> +	/* Do not allow cpumask changes for RT workers. */
>> +	if (wq->flags & WQ_RT)
>> +		return -EINVAL;
> 
> The three stores check WQ_RT and return -EINVAL while nice goes read-only
> through is_visible below. Can all four go through
> wq_sysfs_unbound_group_visible() returning 0444 for WQ_RT? That drops the
> three store checks. Note that the global cpumask still applies to WQ_RT wqs
> through workqueue_apply_unbound_cpumask(), so the comment overstates a bit.
> The interface comment at the top of the sysfs section also still says nice
> is RW int.

Could do that if it would be acceptable for root to be still able to 
write to them - Tejun?

> 
>> +	/* Do not allow priority changes for RT workers. */
>> +	if ((wq->flags & WQ_RT) && !strcmp(attr->name, "nice"))
>> +		return 0444;
> 
> attr == &dev_attr_nice.attr would avoid the strcmp.

Ah.. :)

>> +    prio = pool.attrs.prio.value_()
>> +    if prio == rt_prio:
>> +        prio = 'rt'
>> +    print(f'pool[{pi:0{max_pool_id_len}}] flags=0x{pool.flags.value_():02x} ref={pool.refcnt.value_():{max_ref_len}} prio={prio:3} ', end='')
> 
> Can we keep printing nice for non-RT pools? prio=120 is the internal
> encoding, sysfs and the pool dumps print nice, and the example output in
> workqueue.rst would go stale. prog['RT_PRIORITY'] would match the rest of
> the file too.

We probably could if we wanted to. Tejun?

Complication would be having to hardcode some priority conversion 
helpers into the script.

> One more thing which isn't in the diff. The rescuer of a WQ_RT |
> WQ_MEM_RECLAIM wq, which is what panthor-drm-rt is, still runs at nice -20,
> so under memory pressure the RT wq's work items run as CFS. Should
> rescuer_thread() use sched_set_fifo_low() for WQ_RT?

I did not think we should care much about latency when under severe 
memory pressure. It should be enough to guarantee forward progress and 
the latency restores back to normal once memory pressure stabilises.

Regards,

Tvrtko

