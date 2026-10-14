Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DCD4F6499
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976868; cv=none; b=M4JiqX8vZ+Sw+DSJyURu50abiX+qW0BTbrkUADB/hrk4heI5fJ3SyUaGtqHHcRFbYdUjCOzPMx1ptDIBtz/9ZTkz3D4U8nz6x0rmQRW6Nd8m8B3D0R8BWsm7VQaJEhagMY4LdO3IaPp7cqAiLWwSp3CwRmHLkJ9Wm7BMRF147Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976868; c=relaxed/simple;
	bh=Ch0k37ZwRXyF+QmHQJEjZjn8meEqwJrUMR+Eu0Lv7aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ff9UWn+kduMal3TXAfDLFB7OnBJyEgwXgYjsc9J0rKTH+DxW0KNBRPblbHC4z/t9X10ir8E4Io9HsI2+q72mrpjYqbLBdPXMHW3kRFueieVC75zijyj2MoHilXuq1+B+Zs4K8qoSiXWofJpnl/DDz6XanKFMvmZhpNBKnaY/BXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UMLG9yr4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UMLG9yr4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ff680331aso9553135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791976865; x=1792581665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDrnC41SrQnoIWB3x7VgCSDF/VPgZxWskPROOodTSN8=;
        b=UMLG9yr4APlXj2SYfzoNLTD4OigNxm43sP9VjcxtEuj4gsw85SSEroiR1qv/1CBHAh
         FfNYygywHcMLgAnEfF0AHSE/YceWgB9/EUchVejwC/xN++SdLcDkm7uAPjZP4eZqXDDN
         5UHCu3ShcLE6hPiozgiGWoeZmQ3gUz1ccpfByWvMn9+4mLETlEZNrCi7athv5jjJ7Oq9
         CZt0rl7dqWIJmcpOADSTjiX5cSKa7gyFBXDDJ0iJu+HjOyOpf+EExSzV0xN/N56rmgWe
         37jVEYQ/I7lQzqmgIPWVDzfGmqoVDT4mM7geP1Yxlc4MqGPwE/XFS2y4hXaLfQ5y6GsO
         PaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976865; x=1792581665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDrnC41SrQnoIWB3x7VgCSDF/VPgZxWskPROOodTSN8=;
        b=U2OCeVpgfBX1v86Cjx2dx9Npr5dREZtrJjtqiJlk7a0ErfJIcXR14NtNL7ZQ7b9WME
         94XfgBMEewUW2UIoMnRQfHLpobeNZtnbLPTlgEP1DulCtD9XzphF7TROMF+2o58z211b
         BkFmEarxoDhh7R7V4ICrbLA1RFe35qhAt/lBgsCJg4y6fd6jtcMUeF8VQ/e6Zq0cZazg
         rX8BYVg6ZnnSuKSzlmrYdzcabGRQa2c4lLKBAFcnXZaBvY9gAib5Mkcb9ufH20B9QUk6
         7rB/LZAE2uut7Q3rvlGqyW431PTEFikyrSGJuzOjzQ9zVf+DauldEn1ThBwCBCF8n+3g
         QD0A==
X-Forwarded-Encrypted: i=1; AKwUvBxTsV5bQgZan9+wBzIq7r5kPelcu04ejtmhX6NBdUF2zIPa3rocJQo70faaHOxbvh49KxcP70hNzzTCGuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe8YIoC/BfckChByndfczA0xwF8bguH/pfwt8GekFzAk0jTZta
	GalgZ03b7yqCjIFuc2rDBjhdZyEp6tUQNU0Bx4pv2mODa2/j2X0My2ZRLWVlCWr/yG0=
X-Gm-Gg: AYBFou2Edu+7z1zCZTl7J05rrKiu2T2WsNXp8/Jscvx6y8oXa7l6HMrpws7eq9xnUfH
	fgOoT444UBxFKhVpX0FuyNlWh7uAgJgIwLoKOV5pzWLebrS1p19CbkBrCzh08GnYvAw5GHhSQpX
	zKCVJvdQu/34uQytbHH0dKkPcNouUTC9l0ABbREOImH+DFz3+o+k3EgmOoFC1V+qGbLVp1xY2Hi
	86NwC1mDdncUkVbNPmJ7ZTK8bPInGLkRNSFCpxuime6ImprhPCXeOri/FKe8duwMJ5c/6d7eZC6
	+vzIvYvzfa8+aIfeC8siRM8SE+JuGVooHLIPZEp1I9vqOBoUqU5olBH0AOkUft3zOsCF18R+edb
	DkIkTQTQRgpzTooZ59Y0TGTqWg3qRUg+KuvBeHbm+JvD2X3Cx1EEgZT62QoafqfTfaa9wXBwTHM
	7Lu25VROLv9l5YwV64p8FVAQ5jzvgHrUaNTzeubYf1sEQuqQIIMlkVliDsd1K3j8oJeROZxntrh
	dHLsDCIz7ZG
X-Received: by 2002:a05:600c:3f0c:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a18e47a844mr324249785e9.9.1791976864761;
        Wed, 14 Oct 2026 04:21:04 -0700 (PDT)
Received: from localhost (109-81-25-183.rct.o2.cz. [109.81.25.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm9561760f8f.32.2026.10.14.04.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:21:03 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:21:01 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.5 2/5] memcg: use high_work for kernel threads
Message-ID: <as9lnTYY0NCAp-c5@tiehlicka>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
 <20261010210957.1350874-3-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010210957.1350874-3-shakeel.butt@linux.dev>

On Sat 10-10-26 14:09:54, Shakeel Butt wrote:
> Kernel threads never return to userspace, so deferred memory.high
> reclaim does not run. Reclaim and throttling during a charge can also
> delay work they do for other tasks.
> 
> Treat kernel threads like interrupts. Queue high_work for the first
> cgroup over memory.high and skip reclaim and throttling in the charging
> thread.
> 
> User workers created by create_io_thread() and vhost_task_create() keep
> their current behavior. Vhost kernel threads use the new path, even when
> they borrow the owner's mm.
> 
> The worker requests a fixed batch of pages each time. A fast allocator
> can keep usage well above memory.high. Kernel threads also skip
> memory.swap.high throttling and its high-event reporting. The memory.max
> and memory.swap.max checks stay the same.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

yes this makes sense as a general improvemnt.

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!
> ---
>  mm/memcontrol.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 20c5dfe1a894..8116fce6ab96 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2705,6 +2705,7 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  			       gfp_t gfp_mask)
>  {
>  	bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
> +	bool use_worker = !in_task() || (current->flags & PF_KTHREAD);
>  
>  	/*
>  	 * If the hierarchy is above the normal consumption range, schedule
> @@ -2723,8 +2724,12 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  		swap_high = page_counter_read(&memcg->swap) >
>  			READ_ONCE(memcg->swap.high);
>  
> -		/* Don't bother a random interrupted task */
> -		if (!in_task()) {
> +		/*
> +		 * Don't make an unrelated interrupted task handle this charge.
> +		 * Kernel threads may be working for other tasks, so let a worker
> +		 * reclaim instead.
> +		 */
> +		if (use_worker) {
>  			if (mem_high) {
>  				if (allow_spinning)
>  					schedule_work(&memcg->high_work);
> @@ -2751,6 +2756,10 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  		}
>  	} while ((memcg = parent_mem_cgroup(memcg)));
>  
> +	/* Interrupts and kernel threads stop here. */
> +	if (use_worker)
> +		return;
> +
>  	/*
>  	 * Reclaim is set up above to be called from the userland
>  	 * return path. But also attempt synchronous reclaim to avoid
> -- 
> 2.53.0-Meta
> 

-- 
Michal Hocko
SUSE Labs
