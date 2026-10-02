Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0199F40910F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969454; cv=none; b=q0RX+ojDZdR5c7X4zBSSVQ/dgRxg4TDXna1FYWfaDxzR70eMDRNA23tvGxHF+ezhPodJPhGDFZXhiglp4L/uzQMJuRDZ3DRXkvliUqxAL2S7N6/VzL/as0WxBkLnEDSyJPLWtJPmUK6J0vQyMnw6y9eQZRuXBMcOZoJtGOnW2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969454; c=relaxed/simple;
	bh=0V62S2wBT6s4iFk+iXkht4i+MUVsJD3g+TbqtLmp0L8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=B2vNGXT/22wOunQsvjHcixFw2uGPJ5WluBcVJh9X9llF9ZieH0/cwV+4LfY+3B1dOzTmJo0PFmbxb/RNdFiTDIVLHKXiF7apkGZQFM1ctwPe/o9HlJFfxlmdi5GlPlw0KUzxjv+GaJJcE9ijQ5PXVp/osK4FKoXQiAGwly790PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m83Je5hq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m83Je5hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9224F1F00893;
	Fri,  2 Oct 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969452;
	bh=ZXZkgGAz533Z8jH6/5qDdcZBmIR8T/pOLzRqxMIqK34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m83Je5hqTZXM/SKRtjzNlb2whHUmgtiXISGuGKXdRZLa4p9lTFH9cQOeWySkXH2wa
	 jv3v+a9UpafAi7lKy/Rnz1BDbbvmtKWDiakBqqKbx0WoXanbsdl/JmlnrjBytMKtUq
	 KCJeOocPtwX0Ip9S+mJKfr5j3dg9TtNYhYzWFiyXWHCQLvU5O9gY5dgEengN/YG+zk
	 iiwnZCBLUdlpRTQRHc3o5x7lnJMWJ4rphl/Rzj63jkfWcL5QDtv2f1Di2Mz/gQqS5Y
	 gDcULO4SWgvQXoEg5urnuAqN66KNT4iY79YsiTi7wwrkwGLM2b5KZTS6hs1oXkcHDu
	 iKDQFPz+bFeZA==
Date: Fri, 02 Oct 2026 09:30:51 -1000
Message-ID: <3a139a32135c149f51bac4f2bd58ad56@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
	Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC v6.1 2/3] workqueue: Add support for real-time workers
In-Reply-To: <20261001184848.61776-1-tvrtko.ursulin@igalia.com>
References: <20261001160711.59888-3-tvrtko.ursulin@igalia.com>
	<20261001184848.61776-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

The following is a Claude-generated review.

On Thu, Oct 01, 2026 at 07:48:48PM +0100, Tvrtko Ursulin wrote:
> For use cases such as the DRM scheduler submitting work to the GPU on
> behalf of low latency userspace applications, where latter have sufficient
> privileges to have had successfully obtained realtime Vulkan global
> priority, competing with random background CPU load can create large
> latency spikes which gets in the way of a smooth user experience.

Can you add the compositor / DRM master usage model from the v5 discussion
here? The cover letter also still says CAP_SYS_NICE is required while
group_priority_permit() accepts DRM master too.

> +	HIGHPRI_PRIORITY	= NICE_TO_PRIO(MIN_NICE),
> +	RT_PRIORITY		= MAX_RT_PRIO - 1,

MAX_RT_PRIO - 1 is what rt_priority 0 would map to, while
sched_set_fifo_low() gives the workers prio 98. Nothing depends on it today,
but maybe MAX_RT_PRIO - 2 with a comment tying it to sched_set_fifo_low(),
or soften the kerneldoc which says the encoding matches task_struct->prio?
Also, s/analoguous/analogous/ there.

> +	if (wq->flags & WQ_RT) {
> +		attrs->prio = RT_PRIORITY;
> +		/*
> +		 * RT workqueues have strict CPU affinity for low
> +		 * latency execution.
> +		 */
> +		attrs->affn_scope = WQ_AFFN_CPU;
> +		attrs->affn_strict = true;

apply_workqueue_attrs() is unrestricted, so a caller can hand a WQ_RT wq the
attrs from alloc_workqueue_attrs() and turn it into a normal non-strict wq
while the flag stays set. Maybe apply_wqattrs_prepare() should force prio
and affinity for WQ_RT instead of restricting only the sysfs side?

> +	if (flags & WQ_RT) {
> +		if (WARN_ON_ONCE((flags & (WQ_HIGHPRI | WQ_UNBOUND)) !=
> +			         WQ_UNBOUND))
> +			return NULL;
> +	}

alloc_ordered_workqueue() with WQ_RT passes this and ends up with a single
pool spanning all CPUs because ordered wqs use dfl_pwq everywhere, while the
doc and sysfs say strict per-CPU. Should __WQ_ORDERED be rejected too? The
nested ifs can also be a single condition.

> -		pr_cont(" nice=%d", pool->attrs->nice);
> +		pr_cont(" nice=%d", PRIO_TO_NICE(pool->attrs->prio));

This prints nice=-21 for RT pools. Can you show "rt" here like nice_show()?

> +	/* Do not allow cpumask changes for RT workers. */
> +	if (wq->flags & WQ_RT)
> +		return -EINVAL;

The three stores check WQ_RT and return -EINVAL while nice goes read-only
through is_visible below. Can all four go through
wq_sysfs_unbound_group_visible() returning 0444 for WQ_RT? That drops the
three store checks. Note that the global cpumask still applies to WQ_RT wqs
through workqueue_apply_unbound_cpumask(), so the comment overstates a bit.
The interface comment at the top of the sysfs section also still says nice
is RW int.

> +	/* Do not allow priority changes for RT workers. */
> +	if ((wq->flags & WQ_RT) && !strcmp(attr->name, "nice"))
> +		return 0444;

attr == &dev_attr_nice.attr would avoid the strcmp.

> +    prio = pool.attrs.prio.value_()
> +    if prio == rt_prio:
> +        prio = 'rt'
> +    print(f'pool[{pi:0{max_pool_id_len}}] flags=0x{pool.flags.value_():02x} ref={pool.refcnt.value_():{max_ref_len}} prio={prio:3} ', end='')

Can we keep printing nice for non-RT pools? prio=120 is the internal
encoding, sysfs and the pool dumps print nice, and the example output in
workqueue.rst would go stale. prog['RT_PRIORITY'] would match the rest of
the file too.

One more thing which isn't in the diff. The rescuer of a WQ_RT |
WQ_MEM_RECLAIM wq, which is what panthor-drm-rt is, still runs at nice -20,
so under memory pressure the RT wq's work items run as CFS. Should
rescuer_thread() use sched_set_fifo_low() for WQ_RT?

Thanks.

--
tejun
