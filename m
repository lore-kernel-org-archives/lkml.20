Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587271;
	b=jthQpQK0LLK7Jz9jIbGS1QFlyr5vdS3oqmWyqnHrmpcWAvNvbtw90NK/3tVNbd9mmRoG
	 uGeMPHY9LHDVOX8oELtPQduhYc8qyPrBk3o1zBwLrw3VEdeXdC44SJiC7SLNNW9vy0jW5
	 WjJmwkwkle6qs4LPCkBR1ahGMyCEQseBWG2be71xAqZ3gIT0PF4KiuIiBvdgBDFYFEq5e
	 Ea7jvzGDALq522nhbDiqKoWVlcSeLVKRJS26CDFthETMLLP5D9dqNqjLnHEAI7Hap/pay
	 B8vI9F9Xq6wpZM3KMPRLUgG46sv/p69ryqOh920IFFM8qJlRBE+D6KsXN6bAl8D2Auw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587271;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=77UqAje4PajMbNA3msWDiEyVOFYunEdp//A67jJHb3I=;
	b=FfaeUp3jR5hRBqp63O49GIy6NHhd6nqMi02KwZ8ZZRoGBCFSuxces8TJBubkODqLgpkS
	 yMeRNaip+nDn8mkLv3IIntK6lFGUy/xNk5RXUvKmBYoN8L94XNYcM+vGpB0tpB/dE43fp
	 tiBR7T6tXf1WQiaAPhaj/8bLq/H7nKtaAzFxMs0qcnkIrD93aH4KGJrbRBPtpfkRGo7pn
	 8FXfPqqkSi5317zC0bBJZzGnZrF7rGys3wD90ZhdoXNq7R9gJHTqGJC8HlmnFZxnVwskZ
	 q2x5MmnaEn9nj/WOq6nDaomppIE3EyDm5J7CMrkBIcDl7ni+iY8ea/+P6y2NR/l0ZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Fk2YW2Dp;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA40606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Fk2YW2Dp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=77UqAje4PajMbNA3msWDiEyVOFYunEdp//A67jJHb3I=; b=Fk2YW2Dpp3OS3c+uNvYn/54iBF
	z7jgH0DzA81IyBJBGsjVGvkfnEkL/fFDTbRCcdr2Iyqqkm0qnH40j1U9AjWmP02PgnSLXVHCSbh+c
	rHrDYqrzJXyWt3KWO6DdhizvNR1pVLjALJJ310lT44PYHFMNuOA0NmZangSlaJEE3S/z8NMNNMNeT
	Obft0MMdu5fDgPznJlOoBys2zzeC/3YYVyubmbHtN52j/nbI7Aka5PdviBUI6V5EL5alrqLB9iiwT
	csIHolcabmbIs0nC55kNJX9XTdVFreYFfZESzwt8C0dxcGP8RE1JvP3HCBfJQkWVVpAEErYffrX7W
	Oai3dHvw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVpj-00000009I37-3jJD;
	Wed, 21 Oct 2026 12:54:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 753C0300720; Wed, 21 Oct 2026 14:54:19 +0200 (CEST)
Date: Wed, 21 Oct 2026 14:54:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
Subject: Re: [RFC PATCH 5/6] sched/fair: Add task burst threshold for
 large-scale bursts
Message-ID: <20261021125419.GK2823843@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-6-likunyu@open-hieco.net>
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
Content-Disposition: inline
In-Reply-To: <20261020083746.37068-6-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:45PM +0800, Li kunyu wrote:

> +#ifdef CONFIG_NO_HZ_COMMON
> +	/*
> +	 * In practice, bursty tasks can lead to uneven task distribution.
> +	 * For example, some CPUs may have kernel-mode utilization above 50%,
> +	 * while more than 10% of CPUs in the system remain idle.
> +	 * Therefore, we define a task burst threshold:
> +	 *
> +	 * 1. For a task to be woken up, the scheduler first follows the
> +	 * original wake-up logic (such as wake-up on the current CPU or
> +	 * affinity wake-up) to return a CPU. If no CPU is returned, it
> +	 * then checks the task burst threshold of new_cpu.
> +	 * 2. Newly created child processes or threads have fewer
> +	 * considerations; only the task burst threshold needs to be checked.
> +	 */
> +	if (sched_feat(SMT_BUDDY_ASSIST) && cpu_rq(new_cpu)->nr_running >=
> +			sysctl_smt_buddy_balance_task)
> +		for_each_cpu_wrap(nohz_idle_cpu,  nohz.idle_cpus_mask, new_cpu + 1) {
> +			if (!idle_cpu(nohz_idle_cpu))
> +				continue;
> +
> +			/*
> +			 * In general-purpose scenarios, the CPU can
> +			 * typically meet task requirements.
> +			 */
> +			if (!cpumask_test_cpu(nohz_idle_cpu, p->cpus_ptr))
> +				continue;
> +
> +		/*
> +		 * Simply returning nohz_idle_cpu is sufficient, since the
> +		 * subsequent NOHZ kick will clear the corresponding bit in
> +		 * nohz.idle_cpus_mask.
> +		 */
> +		return nohz_idle_cpu;
> +	}
> +#endif

I don't understand why this depends on NO_HZ. I also don't understand
why this only considers idle CPUs.

Also, static thresholds are horrible.


Someone that burst wakes a ton of tasks, even on a non-idle system, will
cause an uneven task distribution. Irrespective of there being idle CPUs
in the system or NOHZ whatever.

So how about we track an average rq-depth in the periodic load-balance
pass, in say the root domain or so. And then, when the the local
rq-depth reaches some multiple (3 sounds like a good number?) of that,
we'll fall back and do something utterly dumb like:

	cpu = cpumask_any_distribute(p->cpus_ptr);

Eg, simply start rotating new tasks around the system *and* reset the
periodic load balance period.



