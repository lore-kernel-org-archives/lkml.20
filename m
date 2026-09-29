Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FD34388E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640047; cv=none; b=T89TgFxkUmhCTcKTwkUwKz6blFLL/iz1wg+2HpElJBgMI9GLI9zVbqJIQiYJnCLi7H8hgKEOg/uDDDzCqfTfzur7HNw9aUVQfScdUkf2i1Ur3yfsqZ9riBXu+EsCkw4lWN63CqpmFt2QtZ2CuysSIm9wRjruAzByQB4SV4NJ+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640047; c=relaxed/simple;
	bh=xs1wjxrsTUNxCsUBVogBQ0Dmaq8ECG6ZXlguKJGl0Og=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgjscGcsw676ZCaapTkiKlM2rfqtn0tMMpNVVdDMjUZ0a6yZGPaiTH90b9efxRwtlIeX+V+EvyrfcEw96CA2GBxleKcb/QYlBgeGluoyDFVYniWG6xaAghZVAnUMEY1IGE62ohaz+LMNwXFaB8A42ACLfcgxjaVbQpSmFfBWgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5RBNl8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5RBNl8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D62A1F000FF;
	Tue, 29 Sep 2026 00:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790640044;
	bh=5ciXBmNzMw1rOwmbGcny8jZrQPt6zu0pPu4bcqSgV90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=k5RBNl8PB8OGoynwm1uKQAMklBTFpJZYsdSZuoIPNw7W/JCVttZhhV+sZph6XOmnP
	 hZ0JrZ/ChgCXA7+NuYWrjJjM4ywvwmJPQThJrCbm92do703ChvTscT8Hci7wR59UdE
	 uPTajEomKbC0THWRaM2YY7ysdCRlcit38zgOpM56vEDON1WeUMtXSAVEo69lYZz+FI
	 AvXu6iGmJ7cSZWJswqEn0glQLxNUasLzoagFkVwFpVr6M5AVzQ+96wa5uoHt39/fsP
	 0UNrb+yz+rmwrcish6+GmnJ/AjVnIrl6KN3Xpkxy7s0+B/B3m4ueEEOqXtUa70xQoD
	 P6oRFG0uP6NXg==
Date: Mon, 28 Sep 2026 14:00:43 -1000
Message-ID: <3ff40909da4f1510419ac0e2f9f4e6a1@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC v5 2/3] workqueue: Add support for real-time workers
In-Reply-To: <20260923161251.45428-3-tvrtko.ursulin@igalia.com>
References: <20260923161251.45428-1-tvrtko.ursulin@igalia.com>
 <20260923161251.45428-3-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

On Wed, Sep 23, 2026 at 05:12:50PM +0100, Tvrtko Ursulin wrote:
> For use cases such as the DRM scheduler submitting work to the GPU on
> behalf of low latency userspace applications, where latter have sufficient
> privileges to have had successfully obtained realtime Vulkan global
> priority, competing with random background CPU load can create large
> latency spikes which gets in the way of a smooth user experience.

panthor's group_priority_permit() also allows realtime groups for DRM
master without CAP_SYS_NICE. What's the usage model there? Should DRM
master be enough to get RT workers?

> @@ -374,8 +374,9 @@ enum wq_flags {
>  	WQ_FREEZABLE		= 1 << 2, /* freeze during suspend */
>  	WQ_MEM_RECLAIM		= 1 << 3, /* may be used for memory reclaim */
>  	WQ_HIGHPRI		= 1 << 4, /* high priority */
> -	WQ_CPU_INTENSIVE	= 1 << 5, /* cpu intensive workqueue */
> -	WQ_SYSFS		= 1 << 6, /* visible in sysfs, see workqueue_sysfs_register() */
> +	WQ_RTPRI		= 1 << 5, /* real-time priority, valid only with WQ_UNBOUND */
> +	WQ_CPU_INTENSIVE	= 1 << 6, /* cpu intensive workqueue */
> +	WQ_SYSFS		= 1 << 7, /* visible in sysfs, see workqueue_sysfs_register() */

Can we name it just WQ_RT? Also, I think WQ_RT is closer to WQ_BH. We can
reorder the flags later if that helps but for now can you just put it in an
empty slot?

> @@ -127,6 +127,7 @@ enum wq_internal_consts {
>  	 */
>  	RESCUER_NICE_LEVEL	= MIN_NICE,
>  	HIGHPRI_NICE_LEVEL	= MIN_NICE,
> +	RTPRI_NICE_LEVEL	= MIN_NICE - 1,

Can we match the scheduler's representation instead by replacing
attrs->nice with attrs->prio which uses the same encoding as p->prio?
Normal pools would be NICE_TO_PRIO(nice) and WQ_RT pools would be in the RT
range. create_worker() would then do:

	if (rt_prio(pool->attrs->prio))
		sched_set_fifo_low(worker->task);
	else
		set_user_nice(worker->task, PRIO_TO_NICE(pool->attrs->prio));

> @@ -7606,7 +7626,10 @@ static ssize_t nice_show(struct device *dev, struct device_attribute *attr,
>  	int written;
>
>  	mutex_lock(&wq->mutex);
> -	written = scnprintf(buf, PAGE_SIZE, "%d\n", wq->attrs->nice);
> +	if (wq->attrs->nice == RTPRI_NICE_LEVEL)
> +		written = scnprintf(buf, PAGE_SIZE, "rt\n");
> +	else
> +		written = scnprintf(buf, PAGE_SIZE, "%d\n", wq->attrs->nice);

Can you also show rt in pr_cont_pool_info() and tools/workqueue/wq_dump.py?

Thanks.

-- 
tejun
