Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6113F3955D1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161358; cv=none; b=qYDKhtune+aa1lgWEz1tzkBbrr9sXnd+cj2cs/eGtkoETFaFChyLD5Pq9Nnhfh+nbE0qFcOl51FGKQarQCHmm6mol+hQL0Gr4iEEliqkxgbjOnBRz8x/DHl7qiBjSqmAjiay1ODLBucfrYIKvDpTcGb741Gx3hnPUGeMR0mvm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161358; c=relaxed/simple;
	bh=jKunFJbRTXAVT8eYRevg418PMfhaJ+T7AZJAXrgxsuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acDrA4XMJ8/P4NNKI8W003cDWmnvSrV41FjOskM20n/8fuUw38B3hQcCF0b9lDxjVyBXGRAVxsMABmU/ImNK/fbYyf97neGWQYkZhmjZHdZuaD/R5MB9FuNaGw8t0wCRpM/8g8P5rMDF/aUCSv+Y3mSAcmQNFB+H3cQ025FX8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H+m0godM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H+m0godM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so30809305e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788161353; x=1788766153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lObPyH6kdWwL+DlBFF/s5fn9Kq4aH8qpCjM9SPcedhs=;
        b=H+m0godMWIxYAt3S1k75WjJZGl8IGb8sX2SHr/VUhc/qsGMciGRBUb8V2tx0gAxT5o
         dlOijgBoem9SLAdb/8OWsKUN6QnvKn4dtnmoDzK9WmgKESXK11WjAV0E9MCyU4OWtKDf
         Df23jTtLKL0ccw7J7tKuLhZQwSt/igQG1pe3gCiO1MUxKk4mbAG5B7zfylYdt76Y89WN
         fmo0r8UJzVhfZp11zi8lWuu83TbeA2sFN4HDozNsqrZesT5K0Nfxw2hzFTAbSafHF4va
         j82f9uPGAYrGk1sj2sbZn+U4ot5TIsxgTuBqE2y39bMnttgnT+hvKq3slGyiO/7wYvSd
         oR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161353; x=1788766153;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lObPyH6kdWwL+DlBFF/s5fn9Kq4aH8qpCjM9SPcedhs=;
        b=KZgss1gYRx1ztBOXMxPqELQF4FhvxTLvQGiTueNhdHQtPgRm6PTxEwM6WeUo/WXQcs
         yXIbBDySdrJT3tBgUV5WIzhPPQnKM7NeOT4BSy5D2pglJVO2vTAyx8Cc8cQMxOKqkF5Q
         y4Y2EwKk8+k7bsR3KD4Ua6zlqNE2hZ7JZJHfC2YV8T8gjFwHl7XfwR3M3bMAY90oGcT2
         mnIxytxcUNN0I4BfYpGsULzSCXra8M1dnLjzCQRvOVfFipkiOrMG9hU962u7zFK/e9Ru
         eSgywBMtwvA2IK4+cr3hylavJyJTwjT6a0J60DXnR+10VSjthhw6+9Z632ITKWIgGcOx
         RQSQ==
X-Gm-Message-State: AFuF++nFrIn3opedQzCV17/aiaDje154nVqT7f6bgaH1kripHGM+TOJD
	tFdAHkgU05rQD0hDrf/aJTQill/Q/AZly0Yuu5GPSjYQ0Sg/jmw08TWgVycNTG2Mg/A=
X-Gm-Gg: AR+sD12Sf2fFae6HZF0TpeumgxFuOyfYGJ8QWPtZ68LH4O40Q3cCpb0HT9NIrPE37I6
	SzsbdMOkWTXNqb6Kwkv6aLuKsDDEhd72TmhUBymgK5Ndbw4e6VEmrUAXAjpiCOIVr4ivQ6rDXmb
	mujbKGhgamNueQRd4xta4vgHlXbQ367YZbfeZrUqTfVt1fSTkV10u5K1xA5231458b/jO/BM5Ip
	l35YzzmpunXzqllNXOJ8HVAe4PJ1Z7bCihJhSrw/VS+8FZRUxh+R5lI81T01B0j9kHkWVFacx0a
	JUb3sMqcNVZxC9IMRfwHdIpPT643bZSzAq2ZWG76kbF/6arga1A37ns2apkTiQmHFxQHHjM3z8r
	mdXxKduSnHPGfFOq4V2tzWq4qkQv6zPAClpvST0ZmcQ+yK8b09sE0NTQOsIdSs1m2ZA1HpuV9jx
	JSUHNy4nm/V4HMUR8Ww06rXjTEm/9bRfWimNv/VY7ma4Bwo6KcMKXn9InZXI+tv6JwSC3ZbE/Ca
	Q==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr275821535e9.12.1788161353524;
        Mon, 31 Aug 2026 00:29:13 -0700 (PDT)
Received: from localhost (109-81-17-247.rct.o2.cz. [109.81.17.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm269889955e9.7.2026.08.31.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:29:13 -0700 (PDT)
Date: Mon, 31 Aug 2026 09:29:11 +0200
From: Michal Hocko <mhocko@suse.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH v2] mm/memcontrol: fix stuck FLUSHING_CACHED_CHARGE bit
 on isolated cpus
Message-ID: <apUtRwonTCUF07u5@tiehlicka>
References: <20260828135036.7d44361f@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828135036.7d44361f@fangorn>

On Fri 28-08-26 13:50:36, Rik van Riel wrote:
> When drain_all_stock() sets FLUSHING_CACHED_CHARGE before checking
> isolation, schedule_drain_work() can drop the work in a separate RCU
> critical section, and housekeeping_update()'s synchronize_rcu() can race
> that second check, leaving the flag set.
> 
> drain_local_stock() only clears the bit for work that ran, so the flag
> remains set and the stock is never drained again.
> 
> Have schedule_drain_work() return whether the work was queued, and clear
> FLUSHING_CACHED_CHARGE in drain_all_stock() when the remote CPU is
> isolated, so future drains can retry.
> 
> Fixes: 6a792697a53a ("memcg: do not drain charge pcp caches on remote isolated cpus")
> Cc: stable@vger.kernel.org
> Suggested-by: Michal Hocko <mhocko@suse.com>
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: Rik van Riel <riel@surriel.com>

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks

> ---
> v2: use the approach suggested by Michal and Shakeel
> 
> Link: https://lore.kernel.org/all/cover.1787890328.git.riel@surriel.com/
> 
>  mm/memcontrol.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 1271d390b617..309398e943ca 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2306,7 +2306,7 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
>  	return flush;
>  }
>  
> -static void schedule_drain_work(int cpu, struct work_struct *work)
> +static bool schedule_drain_work(int cpu, struct work_struct *work)
>  {
>  	/*
>  	 * Protect housekeeping cpumask read and work enqueue together
> @@ -2315,8 +2315,11 @@ static void schedule_drain_work(int cpu, struct work_struct *work)
>  	 * pending work on newly isolated CPUs.
>  	 */
>  	guard(rcu)();
> -	if (!cpu_is_isolated(cpu))
> -		queue_work_on(cpu, memcg_wq, work);
> +	if (cpu_is_isolated(cpu))
> +		return false;
> +
> +	queue_work_on(cpu, memcg_wq, work);
> +	return true;
>  }
>  
>  /*
> @@ -2348,8 +2351,9 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
>  				      &memcg_st->flags)) {
>  			if (cpu == curcpu)
>  				drain_local_memcg_stock(&memcg_st->work);
> -			else
> -				schedule_drain_work(cpu, &memcg_st->work);
> +			else if (!schedule_drain_work(cpu, &memcg_st->work))
> +				clear_bit(FLUSHING_CACHED_CHARGE,
> +					  &memcg_st->flags);
>  		}
>  
>  		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
> @@ -2358,8 +2362,9 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
>  				      &obj_st->flags)) {
>  			if (cpu == curcpu)
>  				drain_local_obj_stock(&obj_st->work);
> -			else
> -				schedule_drain_work(cpu, &obj_st->work);
> +			else if (!schedule_drain_work(cpu, &obj_st->work))
> +				clear_bit(FLUSHING_CACHED_CHARGE,
> +					  &obj_st->flags);
>  		}
>  	}
>  	migrate_enable();
> -- 
> 2.55.0
> 
> 

-- 
Michal Hocko
SUSE Labs
