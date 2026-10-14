Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB44FB9CD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977373; cv=none; b=slg2Z27srGC6mnDAKymPd/o+6bmjH/pVTQY5XHKaWozN6gGh3Ga37yu16DygYHAS+ehYAMVHdfUF65AO3dI4paS4naotp3UheLdq9YWMVwWQCkTyoSI9jWrylB+sXt2W4HAwyZOEhw8/T71bnKsEqDznFeKh2BjXIYaB2b6umHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977373; c=relaxed/simple;
	bh=YpV3kIY5S6v6UC44zd65beMg+D2qpgiKncmpegZ5KUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr63s/saigXaeY7M/SvnhekNvBDL9SjmCzsndXIwm1OwyYoW2eYQcSYoS2deAy3aWm70hCYNkGlq+oSgK1VCAfDJ8Q+vWmyEeMKsKEo928uMuiTcWdJCILD6jcRHEzgwgY459NBKu2rK2dAhp7Uf4piT1PW2p73y8IJwEZySfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ThkaMFa1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ThkaMFa1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so12767775e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791977369; x=1792582169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0ksxRT6rJjcKFpO4Cy8B4p8cW2Dk868nlYmS4mFCYs=;
        b=ThkaMFa13nf5M+QU0CHRkgM3tNj/i2miJhM3gSe+x+d6KxhHMK6UWXngyhc0KSRjxG
         aRTozIZE8qgLYCziPptp6GARLd/kAo3jHOLj0izmkyhWEDCWWCUP2+uQuhoJBspHf6MC
         6T7Hl26Hi0i7qh8kaTffAV/uSmm7244p6lpxXLgu362xM0WIGJJdcJ+OXtp1EfHZRQak
         obNZhVglaLXi/DnWGsDFVjve46K/bE8IVFKaMVLLG1QxhQLlCi5yKS3c6V/FHEEghKxt
         ZthoXExx0Prv+l48+XTAIG6ZOWEI1j9DJqq/hX/5/puCMyGwoOB8fPwv81D3DR7CHiWL
         Jq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977369; x=1792582169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0ksxRT6rJjcKFpO4Cy8B4p8cW2Dk868nlYmS4mFCYs=;
        b=RuQO90nAVA2vQuPTxJkjF4jbgoWazi6x312ARWgm2JqcCHPspCciZr99ATNzpvLxqQ
         8eVj8u82ScOiNzb2guk8ZwAFOlP00Assd0SgatFUwSkpJxn/oYMs6ZKGbMLAEvk1Lgi4
         MJRVms9uzsSAsoTRhG3Bhl50NOouJUR6V6mQMYJybG2MFm/+qIrEf4/CGsUAdFzXzrdn
         MDehOJfjfjzkRkxBbZjb2VlfCcTaA1UcjNMlNvt4JA0ESOrmGayf04aQ8+Xe0tt/5PuG
         KqlzCwDHwoUk5V03JhJNP92ffJ+rI+4n5HLz0+Jex0VQltOLliMPc1OODBoKPpdgB+h0
         NfNA==
X-Forwarded-Encrypted: i=1; AKwUvBzOyNujLz+ZVEZzA0UnwggpNXn0PdyUbLpbfdAQiMbA5AKN9X6j3xAwTTtwehuhyRbLTiJh04cBhJwuTp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ84A+F0F1O+KHeMhujrs1/34ZGskyrEdBkFoduGUpuLmP6eUTF
	iZ0uE+lF+kRY2P3MrXLJFGPCBHWGpAWqL3tXVxsGhb04Tq0YktGE2kMuiDsul/FQG+Q=
X-Gm-Gg: AYBFou0TX1hteqviddN6CpMpbSlywIQEmW7in2SZKM5rCQpEgOJgAS+b2JGT8Gk+DbF
	AT9GVZBpDuOg6uxdbS/7HV+g/AZCSww3v12RkhW9CIcnvGwJLUrKWPIV878oLWo/l0d05XqmsD8
	rH8sC2umxxWMF634YmprvMH67fc8+GmZ0AiE9rnL88ELjaRejgG/2rHhLZ/xfsbT6C/a94D0mD7
	ew9HCeK4lGDyCwJSHilxqgWzGUp/QtRLAJ1y6PSL/UvdS4B7SzGVy99aKZfe7p38bnNPq5atsmL
	43Tp9gzfxWiO5SWnzEUrCBQ4S+p58N866BNk1Le0E66iNJCygjiPNFjHv1bc72gpVi/zScD6QRK
	0+tFoeTJs1OVt1hgRRIo9cgPrXFBnETR5yS5nG6xaDac8ifhgfwa0dudnHGiTqH5uT+PgmHVc1m
	IbMl7e57u5IkHZUWH0hPOzf43S/nIQKYzUtA5sAx4uXtigbjZ4Ob+91RbmR8/0g1xjoVHFVWzGU
	ybp5QhhzrOZ
X-Received: by 2002:a05:600c:4594:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a18e4d6ac3mr305650505e9.26.1791977369510;
        Wed, 14 Oct 2026 04:29:29 -0700 (PDT)
Received: from localhost (109-81-25-183.rct.o2.cz. [109.81.25.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm499703195e9.7.2026.10.14.04.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:28 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:29:26 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.5 3/5] memcg: use high_work for remote charges
Message-ID: <as9nlkBxzFZSLd5K@tiehlicka>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
 <20261010210957.1350874-4-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010210957.1350874-4-shakeel.butt@linux.dev>

On Sat 10-10-26 14:09:55, Shakeel Butt wrote:
> Some charges go to a cgroup outside the current mm's cgroup and its
> ancestors. The high handler uses current->mm, so it cannot handle these
> overages. Filesystem notifications and remote page faults can take
> this path.

Hmm, you made me look at other places in the charge path where we are
assuming current->memcg == memcg. We have reclaim recursion and oom
checks. The former makes sense, for the latter it is likely not
harmful.

> Use mm_match_cgroup() before checking the high limits. If it does not
> match, use high_work instead of recording task overage or doing
> synchronous reclaim and throttling. Charges to the same cgroup or an
> ancestor keep their current handling. Tasks without an mm also use the
> worker.
> 
> Like kernel threads, remote chargers skip memory.swap.high throttling
> and its high-event reporting, and a fast allocator can outrun the worker.
> The memory.max and memory.swap.max checks stay the same.

Makes sense.

> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  mm/memcontrol.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 8116fce6ab96..3456960cbe68 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2705,7 +2705,8 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  			       gfp_t gfp_mask)
>  {
>  	bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
> -	bool use_worker = !in_task() || (current->flags & PF_KTHREAD);
> +	bool use_worker = !in_task() || (current->flags & PF_KTHREAD) ||
> +		!current->mm || !mm_match_cgroup(current->mm, memcg);
>  
>  	/*
>  	 * If the hierarchy is above the normal consumption range, schedule
> @@ -2728,6 +2729,7 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  		 * Don't make an unrelated interrupted task handle this charge.
>  		 * Kernel threads may be working for other tasks, so let a worker
>  		 * reclaim instead.
> +		 * Remote charges need reclaim from their charged hierarchy.
>  		 */
>  		if (use_worker) {
>  			if (mem_high) {
> @@ -2756,7 +2758,7 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
>  		}
>  	} while ((memcg = parent_mem_cgroup(memcg)));
>  
> -	/* Interrupts and kernel threads stop here. */
> +	/* Interrupts, kernel threads, and remote chargers stop here. */
>  	if (use_worker)
>  		return;
>  
> -- 
> 2.53.0-Meta

-- 
Michal Hocko
SUSE Labs
