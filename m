Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586354;
	b=v3IMhIg6gvq88BAxv7Jre6JkyOTBVrsEHYJL02Juz03kP+E3XprNMn9fI191ZZYYmJYh
	 Jle1pSMzi+ugt829LkgMrMNJz0d5+Mva5bv4948wUyA5eOnKmH+F53eMpCnkUM0QOpFwM
	 FY0TL7fnSrjEapQ1SGkcOO+TbMzbKYjhVo2UUwp1iXe9AJ//YE6RkBOL+TU5XnhrsgT+H
	 DUbu/LSpgjGL4uGw8VXwfMrF9GCXj1Lc0SoSseEpiMCD31gJMNUjKwtXPdbI+6fPA0Xuw
	 x3xqsOZhTneLIq3cTUYllhBjnjcGVBUILWBGKVeuQPpXSiZeh2V7mRsf63gA5GoFcJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586354;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+Mgdy3xU7pRapxjphwKWj/l/TTWdzgFiOjvXPVd3wso=;
	b=PaygQ20XH+RPR+363KTJ86BOfYsbdCUGM/lUR86QlxDRkAEVhhRNO9g1kLJT3urDRrlC
	 mvN2yV8WyoHaZljnauMXAhQGrAO1TJF5IoZ9q1Gk0EXzefZNUwKbAz9yJnMBEujPSduFj
	 UI7N+zu007Ggh9C4oIfFzumtxKb+cZt4ECJavNPlHpGH4eO5eRji5EatnFQ6HkOvgoomX
	 6Ed2lPxjsF6RXrk/nRxykGYgqCl+kZemuQUa/Ws6dCeuKyylHLMmYMSUIwmEm6Uq6BkIu
	 Gqh3N3LpuTCjo32t7p34m80AMRMbP4h7NJX2OSa/NvvX1gxyiL7zmXwNkZ/HlTJtGtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=of1WxAb+;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF72606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF72606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=of1WxAb+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Mgdy3xU7pRapxjphwKWj/l/TTWdzgFiOjvXPVd3wso=; b=of1WxAb+Hd9yQI0YshLp8NLcFI
	CEY+1AW/NtbBABeZrQsrdn0+gZ1pizEdh56AYP/e/Qpjqp9Lvzwe/OM3ZkmbRDyZOWFg4oFrfGWCu
	HPd9U8L1lZeA/47A/9izZ7dW3f7f2r/2mKpXDu8BreYrbidf/NUzNIGI3FXQA590YMSdteIJk+NAF
	+osbR+khHe1+luYL0vHsoKO65OuBaVpMwYqmxaS7IDoVBoIs9BBPLQW8EXEIdwB8fEbURQaWtyPto
	6eRLzuRPMBgwkIM+KMz+HbXL6r1BoaGs7V3EYD+bSQzHilp4xNE69ZkMdo0c2Jtj9eJ2zpID/Ucr1
	xmE7OU1w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVaz-00000009CqM-0lD9;
	Wed, 21 Oct 2026 12:39:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9E091300720; Wed, 21 Oct 2026 14:39:04 +0200 (CEST)
Date: Wed, 21 Oct 2026 14:39:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
Subject: Re: [RFC PATCH 3/6] sched/fair: SMT sibling exclusion after
 successful push
Message-ID: <20261021123904.GI2823843@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-4-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-4-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:43PM +0800, Li kunyu wrote:

> @@ -13377,7 +13379,20 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
>  	struct sched_domain __maybe_unused *sd_tmp;
>  	unsigned int busiest_nr = 0;
>  	int __maybe_unused dst_llc;
> -	int i;
> +	int i, smt_cpu, dst_cpu = env->dst_cpu;
> +
> +	if (sched_feat(SMT_BUDDY_ASSIST) && env->is_smt_move_task) {
> +		/*
> +		 * Remove the SMT sibling CPU from the mask to avoid the
> +		 * extremely rare case of pulling tasks from it.

Your comment seems to think the SMT mask is only ever 2 cpus, we have a
ton of architectures where this is not true.

> +		 */
> +		for_each_cpu(smt_cpu, cpu_smt_mask(dst_cpu)) {
> +			if (smt_cpu == dst_cpu)
> +				continue;
> +
> +			cpumask_clear_cpu(smt_cpu, env->cpus);
> +		}

This is terrifyingly horrible. You're using a loop and atomic bit clear
to clear bits in a local cpumask.

		cpumask_andnot(env->cpus, env->cpus, cpu_smt_mask(dst_cpu));
		__cpumask_set_cpu(dst_cpu, env->cpus);


