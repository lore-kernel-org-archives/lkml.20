Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D3388382
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991935; cv=none; b=nSxO6exgO0EWOTNPDGiGjCa1U2s2vS75q2AWpqsfWsBd5TZE82bbTWK+cikYfKN6umWzJg+NfZIsgpCfJL3R/MqfboOMIomcaSsHDTxZIin4NlB5man7cXebzMe1WXKEqS5daeiUQfe+jW0b959IDyWdxw79yULOho2xNSvGm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991935; c=relaxed/simple;
	bh=782cDa4h2OPBkUy9HCwVxQQ5mCQOLUL4RYdIdOu3mlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAXCZQ/tq6SxIc4r0SzG+ZszYuD++x8avYyrrMPgJsGeJaTiP7O+4jemvnFBJ0rKnpuPYYQG+zMZB4UwEvLTCP4A/xTV2i0PM4R7+WJl7QPWuJFn+1PqzRBBs+TTrq8p7VRW0jIuTg97BuM1StoJDbLXZmOt011ii3tZbIP8LoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kW9XSFoY; arc=none smtp.client-ip=91.218.175.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kW9XSFoY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=782cDa4h2OPBkUy9HCwVxQQ5mCQOLUL4RYdIdOu3mlY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791991928; v=1; x=1792596728;
 b=kW9XSFoYsd25zTemq7GDQ0GigitKVGch+6thV0ZP3ZAbfxdarPCgd5XZSILLhH3hoS3u+kRz
 5W36C4RYZD6UB+zHkvSScMYp5ne+zKjhH8HJ/bKVlwO28eURhnDI4NblNBtUuRywZ1Mm5mW3vsj
 bdvQg5PfhFP60sck2f9dINMw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b928b597100acd65;
	Wed, 14 Oct 2026 15:32:08 +0000
X-Mizu-Trace-ID: b928b597100acd65
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 23:32:48 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, tim.c.chen@linux.intel.com,
	kprateek.nayak@amd.com, yu.c.chen@intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
Message-ID: <as-goGTww9QghS-R@three-body>
References: <20261013084338.55100-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013084338.55100-1-jemmywong512@gmail.com>

On Tue, Oct 13, 2026 at 04:43:38PM +0800, Jemmy Wong wrote:
> Date: Tue, 13 Oct 2026 16:43:38 +0800
> From: Jemmy Wong <jemmywong512@gmail.com>
> To: mingo@redhat.com, peterz@infradead.org, tim.c.chen@linux.intel.com,
>  kprateek.nayak@amd.com, yu.c.chen@intel.com
> Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
>  dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
>  mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org, Jemmy
>  Wong <jemmywong512@gmail.com>
> Subject: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
> X-Mailer: git-send-email 2.54.0
> 
> Skip publication on affinity retries using LBF_ALL_PINNED, retaining
> the first-pass snapshots and avoiding repeated cpumask checks. On the

[ ... ]

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..dc01fdc0526d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12111,6 +12111,14 @@ static void record_sg_llc_stats(struct lb_env *env,
>  	if (env->sd->child != rcu_dereference_all(per_cpu(sd_llc, env->dst_cpu)))
>  		return;
> 
> +	/*
> +	 * A redo repeats stats published on the first pass. Hotplug can

It took me a while to understand the check of LBF_ALL_PINNED, to make it clear
how about adding comment below for future reference:

Once we enter record_sg_llc_stats(), LBF_ALL_PINNED being set is a
necessary and sufficient condition for being in a redo. Since
env->cpus may be incomplete when LBF_ALL_PINNED is set, and to avoid
recomputing the statistics of the same group during a redo, we skip
this update. The impact of skipping is small, because the interval
between the first pass and the subsequent redo is short.

Otherwise it looks good to me and

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu
