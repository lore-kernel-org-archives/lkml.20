Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2136B92F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931682; cv=none; b=ichNte8r2WYVDIBvID7ovrL7WkgVZomlK3ADgMCY8bouTwObJbDMZfxA+bN2EUgczeJOApnxRda6W8VIhiFV8cUKhJ+ICYJdIprmWfBP5u7Pd1s+W67Cg9SYusRuNnRSNCg8db0putl+BTqZTKiDd7AgvuYk4V2XmNiqCMwDxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931682; c=relaxed/simple;
	bh=/n/dFd41yw+qx+BtMq6OW0k8OGtbcgNeqCbFA/CFiRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EodEGQDyMV2a2Z9THvvI3s10m9mhQ+7Iu2EuLE90v85Ogn/Gc9dB8Ftf6YkyzF958WeKtuLPwdCNYddRbmo5Uq2p4u3gD2JEbdTx3VkZOX9jxplltbnLpBUmKtgXRzt0qgSC+I7N9CTtS94DgU6Drj/nJU4+Z6sn+At2RsAEdis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K+EPUFFF; arc=none smtp.client-ip=91.218.175.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K+EPUFFF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/n/dFd41yw+qx+BtMq6OW0k8OGtbcgNeqCbFA/CFiRE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787931675; v=1; x=1788536475;
 b=K+EPUFFFrm1CW7eHSHLBbi5lFrKeCgkV8ezkiqSx8k1HsGqXismK1KON68f/dJE/bUPjtfgo
 g/tOalmsf6cI0cgUXycVyCXAIkUdMM1dilLrgeBCSosgSp5FNa6MyIxug4OH72tInOZ/r0wcQs+
 fuD1R3m6UwvpvdZ4PI3+L7tI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 10b1ae10f3c69f4c;
	Fri, 28 Aug 2026 15:41:05 +0000
X-Mizu-Trace-ID: 10b1ae10f3c69f4c
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 08:41:03 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] mm/memcontrol: avoid stuck FLUSHING_CACHED_CHARGE bit on
 isolated cpus
Message-ID: <apGro0MJ-brPJfoa@linux.dev>
References: <cover.1787890328.git.riel@surriel.com>
 <a611f2bc40d30f9c14a6f41b173185975c46a203.1787890328.git.riel@surriel.com>
 <apGaZdxAPH68kkCc@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apGaZdxAPH68kkCc@tiehlicka>

On Fri, Aug 28, 2026 at 04:25:41PM +0200, Michal Hocko wrote:
> On Fri 28-08-26 09:46:21, Rik van Riel wrote:
> > drain_all_stock() can leave FLUSHING_CACHED_CHARGE set after the
> > work is dropped.  It sets the bit before checking isolation and
> > schedule_drain_work() checks isolation and queues in a separate RCU
> > critical section, so housekeeping_update()'s synchronize_rcu() can
> > race the second check.
> > 
> > drain_local_stock() only clears the bit for work that ran, so the bit
> > remains set and the stock is never drained again.
> > 
> > Reorganize the drain_all_stock() loop, reducing nesting, splitting
> > out local vs remote cpu handling, and skipping everything on isolated
> > cpus, which solves the stuck FLUSHING_CACHED_CHARGE flag.
> 
> Is there any reason why we cannot simply clear the flag if the work is
> not scheduled?
> ---
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 69b37f63a307..907ac63e5067 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2261,8 +2261,10 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
>  	return flush;
>  }
>  
> -static void schedule_drain_work(int cpu, struct work_struct *work)
> +static bool schedule_drain_work(int cpu, struct work_struct *work)
>  {
> +	int ret = false;
> +
>  	/*
>  	 * Protect housekeeping cpumask read and work enqueue together
>  	 * in the same RCU critical section so that later cpuset isolated
> @@ -2270,8 +2272,12 @@ static void schedule_drain_work(int cpu, struct work_struct *work)
>  	 * pending work on newly isolated CPUs.
>  	 */
>  	guard(rcu)();
> -	if (!cpu_is_isolated(cpu))
> -		queue_work_on(cpu, memcg_wq, work);
> +	if (!cpu_is_isolated(cpu)) {
> +		queue_work_on(cpu, memcg_wq, &memcg_st->work);
> +		ret = true;
> +	}
> +
> +	return ret;

Let's go with this patch. We can simplify above by inversing the check:

	if (cpu_is_isolated(cpu))
		return false;
	
	queue_work_on(cpu, memcg_wq, &memcg_st->work);
	return true;

>  }
>  
>  /*
> @@ -2303,8 +2309,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
>  				      &memcg_st->flags)) {
>  			if (cpu == curcpu)
>  				drain_local_memcg_stock(&memcg_st->work);
> -			else
> -				schedule_drain_work(cpu, &memcg_st->work);
> +			else if (!schedule_drain_work(cpu, &memcg_st->work))
> +				clear_bit(FLUSHING_CACHED_CHARGE, &memcg_st->flags)
>  		}
>  
>  		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
> @@ -2313,8 +2319,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
>  				      &obj_st->flags)) {
>  			if (cpu == curcpu)
>  				drain_local_obj_stock(&obj_st->work);
> -			else
> -				schedule_drain_work(cpu, &obj_st->work);
> +			else if (!schedule_drain_work(cpu, &obj_st->work))
> +				clear_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags);
>  		}
>  	}
>  	migrate_enable();
> -- 
> Michal Hocko
> SUSE Labs
