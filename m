Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587188;
	b=lT/M1jLJPwoqmfgnvzp95i3YO1rzsPGIqRnWi41KfVPIg8AbOhk64ozuRq4EVabwH0JS
	 tOlBWPIj6IDYduSOqV//aqGC9EU0Ibhwe6Xr4pEN1jRAkgzmBdN1ZxwcDTOtl/HZTUvey
	 qBwv3OICHDWVIB6qqrXrEUJnXoGrsFM5FMjaFWfDG6nRE0HxP96680RNIuKUVV9RRkVez
	 TAkUhg8H0FR1DmSooTGw91jPXeLkmtNkR9IhJ3jBiZNAtrYbqBkx/DEy2yJ7YRS0R+rzn
	 0oQ9xBz4B5zYcC2Nvti0Co6q9GsR6o5fya/odGP9VE6SfJ/ENlR0DdfJhENGiRHXHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587188;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PJxCsxLoda1k5+V93PXZRa0ldkZinddq3/bu/rJA/QQ=;
	b=QD7dl4bjJgPTZDOlG1HrTb1l0zEICPmMj8+DsOb41GIKCz3nYV/N0weJCfO+7lstf8Sq
	 Z3gM8HZCBc+lVhbgB0rsUZN/QLiGsBQ4tKxlOGzFG/wqPU3kpp5gNR7E95Wh5gADfKvcU
	 RKmtZn5XWjD5t33dQqpy/89HfjBs81GcOmKxWB95qufSSW4y3fXE2/9DfLMrGC7pR8Eli
	 cenuUw7PmpeSlSQi4TfNiKWzquVikCAMwtLpxnS0Jzpsc1RqWQ3lJhHBgQP7gUXHOXm7c
	 1M16a0rbyAkFHwwZ7IoEttmb+kuqdWlK+wFY4TnpMzsBY1So7gcCn9YeF5bVg/th6bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=eGyaChAT;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=eGyaChAT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=PJxCsxLoda1k5+V93PXZRa0ldkZinddq3/bu/rJA/QQ=; b=eGyaChATJanuex/qC600cTJ6o2
	3djck552UC0g9N00jXVCmahRo6POfhFza5a+S1RXMOwn1jPUXZ2GS2GQ5VMl8DGvxs2yb8kbaTX9W
	8X0q/ll77Tb9hHQBx2PSvJBQi7w0fwy3UzSe4jqdqw8tnmRG1kWVNkKIpY7JYyarIsaRYhl0hyIkI
	P3YoTTVbmImcIYrHyL2U3AWd31IILhsGhxVNkdHToRPj2r2VXJl/NOqM9Oc/mU5SFMcXAbtAAyh5x
	RMMge2pIS4sOdT8GKHmknzBB/E37nB37qYl0SYT2r9Y4jUGeWm5p8ALLqnnhS3vJiDjXWBwCRUwnQ
	ZZPU+bEA==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xJVoU-005dtM-Dj; Wed, 21 Oct 2026 14:53:02 +0200
Message-ID: <bd59f9aa-b0d3-474f-8c95-f3763e320638@igalia.com>
Date: Wed, 21 Oct 2026 13:53:01 +0100
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
 <9bb46cf4-7982-463b-8289-06bbc319bba9@igalia.com>
 <cb60b6a0f8f35957d64c9abf240c2dbd@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <cb60b6a0f8f35957d64c9abf240c2dbd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/10/2026 00:40, Tejun Heo wrote:
> Hello, Tvrtko.
> 
> On Mon, Oct 19, 2026 at 11:02:08AM +0100, Tvrtko Ursulin wrote:
>>> apply_workqueue_attrs() is unrestricted, so a caller can hand a WQ_RT wq the
>>> attrs from alloc_workqueue_attrs() and turn it into a normal non-strict wq
>>> while the flag stays set. Maybe apply_wqattrs_prepare() should force prio
>>> and affinity for WQ_RT instead of restricting only the sysfs side?
>>
>> I am not entirely sure about this one. It could be done in
>> apply_wqattrs_prepare(), but it would end up redundant on the sysfs
>> path. Because currently there are two paths:
> ...
>> Am I missing something?
> 
> The missing one is apply_workqueue_attrs() called directly with attrs from
> alloc_workqueue_attrs(), which is what padata_setup_cpumasks() does for
> its own wq. Forcing prio and affinity in apply_wqattrs_prepare() covers
> all the paths in one place. Being redundant on the sysfs path is fine.

I've implemented something, but perhaps to check we are on the same page 
before I send the whole series out, the crux of a solution is a patch 
preceding this one (so new patch in series) with the important bit being 
this:

+static void
+sanitize_workqueue_attrs(struct workqueue_struct *wq,
+                        struct workqueue_attrs *attrs)
+{
+       if (wq->flags & WQ_HIGHPRI)
+               attrs->nice = HIGHPRI_NICE_LEVEL;
+
+       if (wq->flags & __WQ_ORDERED)
+               attrs->ordered = true;
+}
+
  /* allocate the attrs and pwqs for later installation */
  static struct apply_wqattrs_ctx *
  apply_wqattrs_prepare(struct workqueue_struct *wq,
@@ -5735,6 +5746,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,
          * every possible CPU and never falls back, so it has no default.
          */
         copy_workqueue_attrs(new_attrs, attrs);
+       sanitize_workqueue_attrs(wq, new_attrs);
         wqattrs_actualize_cpumask(new_attrs, unbound_cpumask);
         cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
         if (!(wq->flags & WQ_PERCPU)) {
@@ -5757,6 +5769,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,

         /* save the user configured attrs and sanitize it. */
         copy_workqueue_attrs(new_attrs, attrs);
+       sanitize_workqueue_attrs(wq, new_attrs);
         cpumask_and(new_attrs->cpumask, new_attrs->cpumask, 
cpu_possible_mask);
         cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
         ctx->attrs = new_attrs;
@@ -5919,24 +5932,6 @@ static void unbound_wq_update_pwq(struct 
workqueue_struct *wq, int cpu)

alloc_wq_std_attrs() is completely gone and alloc_and_link_pwqs() calls 
standard alloc_workqueue_attrs() instead.

Slight annoyance is I have to call it twice in apply_wqattrs_prepare().

Could you please confirm (or deny :)) this is what you had in mind?

>>> alloc_ordered_workqueue() with WQ_RT passes this and ends up with a single
>>> pool spanning all CPUs because ordered wqs use dfl_pwq everywhere, while the
>>> doc and sysfs say strict per-CPU. Should __WQ_ORDERED be rejected too? The
>>> nested ifs can also be a single condition.
>>
>> Not sure - Tejun what is your guidance here? Is this purely an
>> implementation challenge because conceptually it should work, no?
> 
> Yeah, the priority part would work. It's just that an ordered wq has a
> single pwq for all CPUs, so the per-CPU affinity can't apply. Let's reject
> __WQ_ORDERED for now and allow it when there's a user.

Done.

>> P.S. The nested ifs could be a single condition but I wanted to mimic
>> the existing style so it looks nicer:
> ...
>> I can change if desired.
> 
> Your call. A single condition would read fine too.

I've collapsed into one. I guess fewer WARN_ON_ONCE the better..

>>> The three stores check WQ_RT and return -EINVAL while nice goes read-only
>>> through is_visible below. Can all four go through
>>> wq_sysfs_unbound_group_visible() returning 0444 for WQ_RT? That drops the
>>> three store checks.
> ...
>> Could do that if it would be acceptable for root to be still able to
>> write to them - Tejun?
> 
> Root can't write to them. sysfs sets KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK, so
> kernfs_fop_open() fails a write open of a file without a write bit even
> with CAP_DAC_OVERRIDE. Can you make nice, affinity_scope and
> affinity_strict read-only through is_visible? cpumask can stay writable
> as narrowing where the RT workers run doesn't break anything.

Done.

>>> Can we keep printing nice for non-RT pools? prio=120 is the internal
>>> encoding, sysfs and the pool dumps print nice, and the example output in
>>> workqueue.rst would go stale. prog['RT_PRIORITY'] would match the rest of
>>> the file too.
>>
>> We probably could if we wanted to. Tejun?
>>
>> Complication would be having to hardcode some priority conversion
>> helpers into the script.
> 
> Yeah, let's keep nice. It's just prio - DEFAULT_PRIO and hardcoding 120 in
> the script is fine.

Done as well.

>>> One more thing which isn't in the diff. The rescuer of a WQ_RT |
>>> WQ_MEM_RECLAIM wq, which is what panthor-drm-rt is, still runs at nice -20,
>>> so under memory pressure the RT wq's work items run as CFS. Should
>>> rescuer_thread() use sched_set_fifo_low() for WQ_RT?
>>
>> I did not think we should care much about latency when under severe
>> memory pressure. It should be enough to guarantee forward progress and
>> the latency restores back to normal once memory pressure stabilises.
> 
> Agreed.

Ack, thank you.

Regards,

Tvrtko

