Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A53C8705
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626534; cv=none; b=uEYGorW7mS+No5WDOplDxGjtwk2GqzjsfMduPRCtisRZT8IipJkPyGMzgZJggjettd2YdYaeACQ3DMxqB0eHKQ0jn8ZtI9uol3dOcApU6D7qAIs7J6iW+5URK1vlWbniRb/jMkTzk/E6wHFiJuqKOGNWUCvHzoR16TjywzQsscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626534; c=relaxed/simple;
	bh=3s4W5qfQy6CMb9ohizIs/u9zD/3jpxPuFpIKP5sC8Zk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=CYQAPCoIgldr4XWxLmb1dC+tlAeg2xOxOOWK/QkYeoydUQIXOrAdk0FbuJ7HQx1ErXZdAkuAWtSbYAwAr3mWwggemkL9Xlb9skW05t2q7vVWlsaoieZX6MnQspaQFBFnixMQvIJQGgXDBIhFQ2Rk4o42TJehTwpAQVSQsvf4gUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBSArLIh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBSArLIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3A11F000FF;
	Mon, 28 Sep 2026 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790626532;
	bh=8SIwobhQBkXYdbMNiuFwJH4UQgRnkzjrLGNrTlccsxQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JBSArLIh6DEjno4KredrTMlKDa0BaerMywl7pBvOvXqFePa3Ru34+TGji9gX4+51g
	 zIJOhPrYseCqCucXRrmfPha3YppPSwb91lKozpg/LBQl8qs7Dcq+ZMsH0XQ13JXUzG
	 RPq8DwiIZVMUTiXKWIzfPKCg98MpTUraKAGnWNaC/pFVUwNYYj9SOm+Fg07UV5CLug
	 jdaAjBxxAOjNRoXcSJO1BAMwKsShpVEf6LDxegmNoo8Blo6JY3Ikc8oscXFvdCBewD
	 DUmgCojp4GrQz+URMyQBVPAUIjjfoljCzl1uLMpRzAlkifLSpsO/YhRq0QTqpNYHWJ
	 uBIEjFI+rimqg==
Date: Mon, 28 Sep 2026 10:15:31 -1000
Message-ID: <79e8fdf844e1aa9358dd4c2c3e5f888b@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v2 2/3] workqueue: Keep the limits of both
 max_active domains current
In-Reply-To: <20260925-wq_final-v2-2-860ee052169e@debian.org>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
 <20260925-wq_final-v2-2-860ee052169e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Breno.

On Fri, Sep 25, 2026 at 06:09:51AM -0700, Breno Leitao wrote:
> Given that we are introducing a WQ_AFFN_CPU which will be able to do CM,
> we want to keep both values set, so, the transition from scopes would be
> able to succeed.

This would be the new PERCPU scope rather than WQ_AFFN_CPU.

> +	int nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);

Workqueues from workqueue_init_early() and early initcalls are created
before smp_init(), when only the boot CPU is online, so nr_cpus is 1 for
them. For example, system_dfl_wq ends up with percpu_max_active 2048 where
32 would be right on a 64 CPU machine, and nothing rederives it once all
CPUs are up. Maybe rederive the other domain in workqueue_init_topology(),
which already walks all workqueues to update node max_active?

> +	} else if (wq->flags & WQ_BH) {	/* BH implies !WQ_UNBOUND */
> +		wq->max_active = effective_max_active;
> +		wq->min_active = effective_max_active;
> +		wq->percpu_max_active = effective_max_active;

Maybe set these in the WQ_BH branch at the top so that BH is handled in one
place?

>  	} else {
>  		wq->percpu_max_active = effective_max_active;
> +		wq->max_active = wq_scale_to_unbound(effective_max_active,
> +						     nr_cpus);
> +		wq->min_active = min(effective_max_active, wq->max_active);

max_active can't be lower than percpu_max_active here, so min_active can
just be percpu_max_active. Same in workqueue_set_max_active().

>  	max_active = wq_clamp_max_active(max_active, wq->flags, wq->name);
> +	nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);

For unbound workqueues, nr_cpus should match what
wq_update_node_max_active() distributes max_active over, the online CPUs in
unbound_effective_cpumask(). With wq_unbound_cpumask, percpu_max_active
comes out too low for a workqueue with a narrowed cpumask, e.g. 8 instead of
64 for max_active 256 on 4 of 64 CPUs. Same in workqueue_set_min_active().
wq_unbound_cpumask is right for percpu workqueues.

Thanks.

--
tejun
