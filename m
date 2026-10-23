Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790898;
	b=2msqkJRtIKoCiuP8Z5c5vxukHW8aGOat0gBVZ9YznDP09rgQScv8n82zJ6zcSI+5DBJZ
	 GOi5JqCh0rSBTBIHh6ngfVvi/vFbHUxSIluCUX4GtwVb12GML4sEtZek4+ZZVnRUSRQic
	 v6/lcEECSIViUalN2PahQ3A0Y38HghBFMt6TQIsH2UhkStvpcarH3fBBDCqYaDLNUVbJv
	 LodrvXn5IbkqXl46EMIAGPG7JZHXkKauok05LcE2dlUA1ace2cfbcsQJDnr3MwzzJTyYJ
	 AvFo0jL/B3jni4TL80Wl+BH6YUyrdjn18RF+AD0lzbC8IgtJsFzNBa8hCHsEltCiiqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790898;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6UN1W0eT+Inio+UzVeQE/6qRYM+8bQWI7zoN0SuRn50=;
	b=UOJp9BdRGp1nnqFQcZJwnSjWofCngX6xdVsN/47Nfsca4/WhmikU0kTBEg+oNHbMmbwn
	 48wGm9eE9lXCDijj9WYQZ4dsELQZVVpUMf6ja6a0SsIVF66ZD5J/HDgVHPWDumw+KSxDZ
	 qfBbt8xhkS9+OfN2fXil+GVaRg0jMe3q54vwjVo7+/ws8v5l0rg/IXF+NZkIkGbIFp2gS
	 MbA3xA3d/N+EG8tHDs9N2Lh1mNRGxwkUgjw6nEHd2baNTQUWyCKAR1AqcXtNK0IUboeYB
	 7uSCvfjaLwyYFHDwPeZhJ9FDZ04/I74xs8OCnf8cgXJZinqtbLOX2Snalyx+MhRULeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SSEZuOCv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC39606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SSEZuOCv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1B51F01828;
	Fri, 23 Oct 2026 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792790897;
	bh=6UN1W0eT+Inio+UzVeQE/6qRYM+8bQWI7zoN0SuRn50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SSEZuOCvrR3mGxUTIawZWx+T5B77FggTpptCoXYcFd1IToEQUBHEJ7SnKnl3fSTmq
	 H9yLnUMKBXw4CSAzikYFdrIKvdXOQQXO8Y4qAPkS6bX0O1bKfoPpgAwGeXBFtHxZi8
	 sXTL4sZR8PzIsou3mT/fWod3E2EYELKE1VfluutoZl0XIaZGPTpQ1SEVwaXAUapQSH
	 HC4zqh7quPUmuqEMdRqzr7X7HZU0EGgd0c6HWjC/q6Vl7Lfxg98ReQuwziNPzmhjf9
	 sxS9mZ2MJGbZuDksB4pZdE8phunEtjSoCyEacXgKUNc9RYouAeHQgj12Y8tHjJpp/Q
	 fYthYuZIZpK1A==
Date: Fri, 23 Oct 2026 11:28:17 -1000
Message-ID: <a3ae9a0f13e3972d0645f555bcc26f4f@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v7 3/4] workqueue: Add support for real-time workers
In-Reply-To: <20261022093848.5727-4-tvrtko.ursulin@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-4-tvrtko.ursulin@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Tvrtko.

On Thu, Oct 22, 2026 at 10:38:47AM +0100, Tvrtko Ursulin wrote:
>  struct workqueue_attrs {
>  	/**
> -	 * @nice: nice level
> +	 * @prio: priority encoded analogous to task_struct->prio.
>  	 */
> -	int nice;
> +	int prio;

Can the nice to prio conversion be split into a preparation patch with
no functional change, so that this patch only adds WQ_RT on top?

>  sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
>  				   struct workqueue_attrs *attrs)
>  {
> +	if (wq->flags & WQ_RT) {
> +		attrs->prio = RT_PRIORITY;
> +		/* Strict CPU affinity for low latency execution. */
> +		attrs->affn_scope = WQ_AFFN_CPU;
> +		attrs->affn_strict = true;
> +	}

Can WQ_RT set only the priority and leave the affinity at the defaults?
If the pinning is needed for the latency, can you share numbers with
and without it?

>  	mutex_lock(&wq->mutex);
> -	written = scnprintf(buf, PAGE_SIZE, "%d\n", wq->attrs->nice);
> +	if (wq->attrs->prio == RT_PRIORITY)
> +		written = scnprintf(buf, PAGE_SIZE, "rt\n");
> +	else
> +		written = scnprintf(buf, PAGE_SIZE, "%d\n",
> +				    PRIO_TO_NICE(wq->attrs->prio));

Can the sysfs interface comment above struct wq_device be updated too?
It still lists nice as RW int, while nice reads "rt" and is read-only
for WQ_RT.

> +rt_prio = prog.constant('RT_PRIORITY', filename='kernel/workqueue.c')
> ...
> +    nice = pool.attrs.prio.value_()
> +    if nice == rt_prio:
> +        nice = 'rt'
> +    else:
> +        nice = nice - 120 # PRIO_TO_NICE

These fail on a kernel without this patch, where neither RT_PRIORITY
nor attrs.prio exists. Can they fall back to nice, the way wq_attrs()
falls back to unbound_attrs for the earlier rename?

Thanks.

--
tejun
