Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629843C1D7B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977952; cv=none; b=I35Qz4QASeb7y2fAwS7YX3QWvZTEQ4myMEJ0e/awJGmv6qWBnmPvlLBwSBNc7p1I0HBF9LY6iHQ2+/fzqVBPGfNVJg6Y5ko66NEtMcNpX9u+Lmx/OZCAFdDW25opW5xqtcBUP+dmtNd+9mXuf+sfsd8eQgKAz7DdaAdFvycFK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977952; c=relaxed/simple;
	bh=v66k7iNvhOgZZTT++OurcOdJPuTUGSAEJGHO2y8M3rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOMk/dT3nMTUKuebPftisUAKJmk/haMgYfB5JuM2ssjaQq2fWgu8Wp5RqWwSCGDwWR/71PQkSqv0EjLWgtn8Lh7nhB+HbNu7LZUHuFtWOxx49OK4Fk/go8M/mBCtLGo8D2h68Dpy7rYDnNDmiJSQUq3Q96QDzdchV+s0+DcqBzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EuCo9xyg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EuCo9xyg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso3819089f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791977949; x=1792582749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUzFoE445IVWsVK4aBCZAsC064TGifdEV4i8h8KnmvQ=;
        b=EuCo9xygfEBiTcBxlMk7UufNECEPjXsRzRhIlkFlcyZW9nkdHGyJLqxYbYQcUPll6+
         PIE5avx7EslMoXsk3EPH8vGOSiFUu4UAZIAr+iHJIReUxVYOgRusEWjcmq8YeWWdAZDe
         CxpUCpNa8Qv1c4eIt7fnimZQTVGANCcD8r28VTZGH0+i617TF0lxbFt3Q9wqp+cC6Gs3
         3b8OKuvwKeNIJz4aCssSnbY1DYpJpGPheNdmlbHE4XwUDdPi9Uje2gT4VZVrwrZrhead
         paJD6bdsOTeh3hUbJeisyLekBFUoZnNsR/oeHaWc7ttqrFIZTENWpADEQkBbcj7UM3JV
         YukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977949; x=1792582749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUzFoE445IVWsVK4aBCZAsC064TGifdEV4i8h8KnmvQ=;
        b=UNAyNFm+fxxlt9mTYvY0RucIQbOibP9bwo1y6CyZZuUcM82y6cqw2hOJr9iODvJTix
         /0fTaJuROq+o/z5H+TcjbElllV4Je2vdvH3YfK3tHPAz7t/j/nCyCygB9uI6FSVXvTmS
         pHjcMync8+/XL8/9SGT/TDgU3ZVxhoO2K1Bg6GnG1e2pYhuVVjdonu1s85oNkXUQr0Q6
         F0vnOh1euZROw/VV09CgU0Qk3PjvmvzS+ddJdLA8hyI8uAF+zhdNNQKsNopVo8UZlTCk
         f8aKcxlzPJG7EZVu+6ZHG2K5LEGaj/9MnKGqTQ3eyLlzF+5UUsEiBVRXXh2fzNzCOUKS
         nImw==
X-Forwarded-Encrypted: i=1; AKwUvBzzeZQWax4LFy4UoD6YzLFdPu4fJba4D72FZVdaPymBDDMQ+/evzg1tLEZKr7bfKhO1ekMFicyJVD/OWGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEvSkxy7/JArB3U5LWM1ipTA7Z5QGzUZNwDYYDwYh0hSvCXAk7
	Ljy48zB389goq4jb3kulNBycmKkOPDx2byT1D1o/BQE1+tVvWJaYR3OlR0tDhNuHk3A=
X-Gm-Gg: AYBFou3iVtxgqq7BGfKVTMqsIJzF5r++1kwdhfbK8p9sGyZ/gGkDi1P5WIJnudbVfQq
	0NTk56njvknaP8998tCtiDVjjIVhFnosi+a3D13JQrBfjQ3A4ZA4toAE2HjsqoMB/A0CKlyIJpB
	i8cR6GjINZMpe1XLabAWIg1Ply0SuSSAZErLzoC+Ug3AdZ6cESKwg9gpNofj7E/DrLqOrfLEajr
	IE/ZHb/dRoHF9p5TUB7PsQf7ZExIpR/VLtwSxPAChQ0p9qryHYlm9QzmRP9jLo6u8UnuOBQnouz
	+IB2riZBMmzGhUHEBGp7i/TVaX52QJvAaCkLY4sntwJlq9OAXkl6o+xiCcBiFi8aSshv4O2dKjQ
	MZg9xrJi9HMhcATrHNI53gcoQW25l0SxqOjOx8bAPzUzrfQh8nIws6dBGrDIrpJgC/K5rMzp59V
	TYvyIwX7L3+ACjFDUUbAxWepy624Wz36u+HaSGOVG8Aav7BhieDBowIR0s3RXAjUXLhY+9Za3a9
	/5aPdJ+ujLe
X-Received: by 2002:a05:600c:46ca:b0:4a1:7a1e:6910 with SMTP id 5b1f17b1804b1-4a18e48363amr313361525e9.4.1791977949379;
        Wed, 14 Oct 2026 04:39:09 -0700 (PDT)
Received: from localhost (109-81-25-183.rct.o2.cz. [109.81.25.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm688508455e9.8.2026.10.14.04.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:39:07 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:39:06 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.5 4/5] memcg: avoid queuing high_work from reclaim
Message-ID: <as9p2uFqCQprwdnI@tiehlicka>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
 <20261010210957.1350874-5-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010210957.1350874-5-shakeel.butt@linux.dev>

On Sat 10-10-26 14:09:56, Shakeel Butt wrote:
> Kernel threads and remote chargers use high_work when memory.high is
> exceeded. Their allocations during reclaim can also charge memory,
> for example when zswap stores a page.
> 
> Without a check, the high_work worker can queue itself from its own
> reclaim. The pending bit is cleared before high_work runs, so each run
> can queue another run.

What does that mean really? Does this delays the actual run?
 
> Skip memory.high enforcement for charges from task context with
> PF_MEMALLOC set when they would use high_work. This covers kernel
> threads and remote charges. The memory is still charged. Interrupt
> charges keep their current path.
> 
> In a VM with incompressible zswap data, the worker queued itself 163 times
> without this check.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

The patch itself looks OK. I am wondering whether we can unify the check
with the existing one which forces the allocation through in main
charging path.

> ---
>  mm/memcontrol.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 3456960cbe68..d1e022e6572f 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2708,6 +2708,14 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  	bool use_worker = !in_task() || (current->flags & PF_KTHREAD) ||
>  		!current->mm || !mm_match_cgroup(current->mm, memcg);
>  
> +	/*
> +	 * Reclaim can charge memory, for example when zswap stores a page.
> +	 * Don't queue high_work from a reclaiming task, or the
> +	 * high_work worker could keep queuing itself.
> +	 */
> +	if (in_task() && use_worker && (current->flags & PF_MEMALLOC))
> +		return;
> +
>  	/*
>  	 * If the hierarchy is above the normal consumption range, schedule
>  	 * reclaim on returning to userland.  We can perform reclaim here
> -- 
> 2.53.0-Meta

-- 
Michal Hocko
SUSE Labs
