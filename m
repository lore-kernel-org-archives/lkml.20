Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310203F7AB7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752301; cv=none; b=JvBT/gVQOFOv0ujo8ruCsPHbADVh/SdPOSQ+31OpipgQk2qfbAgm2mYeb5qHFo1cR9EFtjpeAe870YLjR8AZHTfqcRBIm/lvWas2Yz69+J8O+yXSOgLuTfX9c9Scmg0AAe7F+OOumvykufGmaVWphoX/QzYR23P621lwhsYr7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752301; c=relaxed/simple;
	bh=6cJLbxmwrbnOZzvacudiX7h+5irz8rWOFyxkz+s+TBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRnhzpzBCRIZGnYPk5yOz6a350V24scsBqVdhh7vzAH4XFm/ZII8dJ3oCBM4m+wBNIpqmE6JvFNQeO59tds1w3iXhT/Fo759gDyUvG6KtK/smtHMSzdPD0OHJ+H9fGX0NOInHPHCzkEYGSeBv1rirJG+9lYvIBS+wxtkE3MO9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F2LVoGrw; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F2LVoGrw"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1644390a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787752297; x=1788357097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AbPejUodpTpH54o/OlTk5uSnDzYs9pRHjviJEkIAHGI=;
        b=F2LVoGrwdrNuskXbD00mAsi4boQFqiZZ296Q/X1gk/GVXL2kVWas/e0f+lLvMPUJxG
         7kSaTve9wN5lxuhcgzt63c1wd5RCFMJYwjI7FYI1CbJyjzNDKFkbZScdHaRwmMtxAy1O
         SAgI9i7wWZZc9s2W9mxJP/21OnRcUBlv3az1vaSvXqQNqVHypoSRk7to7lyoXI5hdxHS
         tmFYAG7VdYM4iqWOaR2QtbQukyaIbo4ozFZxoyym5b2PfJexyqxoTbG2IeFGZ+cVGy6H
         ld3shcmGzQeKrmg6lsYE9G6R8mFPpUYJfTXfJtgEPhNlknmU9sEp1kFXc6GwXJN3KmM1
         //Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752297; x=1788357097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbPejUodpTpH54o/OlTk5uSnDzYs9pRHjviJEkIAHGI=;
        b=Jc8ZLFaWvAmpMqtA5gtUQgVQ2l/JbJzATqyueh8KJm6K0t7wJZGb3WNGs+ZarwXgzf
         h0TLJilt6dpPm6y+qo2tBhI8YdWqLD5o7lKESN2HyPXft1yHrTiztVA3Cg8NbvmBJ/tI
         /odzt96vcBtR5B2QU1hEPXIwv57XvChNWVswhZNDGx3T3yDxZT+z2EY9d3gA5/ICirSC
         HguLs7GAxX6Hx1HN3ZLKHbNWBofs7XeFUo2TVxMG4hmBDX0LQDcDC0rj0vRjuzi3Y/fy
         i1uOLNS8g1+UiGse8EizOo8DXlzf03Mv0XAnXz+SYsLjUM0Dr7DbkXfHXLMWssbst9S8
         bvgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdjhD3PVCjal/6K8XByiW0rD7dGxHCADZMmahfQxMjoGo/EqmfJWwvjbcsILW4J23xyRV53R2sIEhF7R8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2bQGKOf/YTAWANypxQbLBls1eDthPJo+giXT/rqqh/NTLGR/l
	MsHeV0g7NExWQD4yA/8nwsyM1+kLQ2p6dEZ68YETzHjrRF3DSzJV8arg04YL/eQZqnc=
X-Gm-Gg: AR+sD10RjwmpxE4KSETTHq6vk7WxW8UDnERegNp5Jfx8T7tnUbsNfIs4KsOyiRkIQj+
	aeR/+igyo3YT696hdr4JNS355DkY2Yky5jArQUxqTogZ6vv57lhmFWCqNcT7Ze2erNW/sijlyB4
	jmCd8jeduT1LS5brXqiVEzNQ4qxYJQy+DwXZENcfa6evj7EnzF5ixeyJX/0L4Z4VxnG+bu8k/4t
	XzNunh4pgsVfiLCoqW7yBLjrgwYBrCerUF79rtWHjKOvWl4+M9NQpJO6nrEdfgKsq/vUxrT0Aki
	BWNNW+SWlyrYd2QkVz213HMcPtRXNj+9F8v6o0jiNbpmeq6hqkkGaI0M1GNypHML0jkmo9zntH6
	/kJKNGT5xS5ycF7DRA4TyEdHXPIfLIySQRaxpBJRlYekNBnKdontwSZAM/EX/6t0sJVJJ2uTOzn
	N+RMwXH+EwFwkR4cfPdyTBirh5UmNcyyxbeJR8ukMe9FdHBwqYuyQtjlqd2f94Sp/qShNGAZTQ
X-Received: by 2002:a05:6402:2108:b0:6a1:fd14:8832 with SMTP id 4fb4d7f45d1cf-6a5df64107fmr9294664a12.12.1787752297409;
        Wed, 26 Aug 2026 06:51:37 -0700 (PDT)
Received: from localhost (109-81-80-32.rct.o2.cz. [109.81.80.32])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1c80sm3494104a12.10.2026.08.26.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:51:36 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:51:35 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH] mm/vmscan: drop the combined limit gate in
 __node_reclaim()
Message-ID: <ao7vZ8EBHgU_CRpQ@tiehlicka>
References: <20260826124409.35569-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826124409.35569-1-ridong.chen@linux.dev>

On Wed 26-08-26 20:44:09, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> __node_reclaim() is called from two paths: node_reclaim() and
> user_proactive_reclaim().
> 
> node_reclaim() already bails out early unless node_pagecache_reclaimable()
> is over pgdat->min_unmapped_pages or the reclaimable slab is over
> pgdat->min_slab_pages.  The identical check inside __node_reclaim() that
> guards the shrink_node() loop is therefore redundant for this path.
> 
> user_proactive_reclaim() is proactive reclaim driven by userspace and
> should not be gated by the per-node min_unmapped_pages / min_slab_pages
> limits at all [1].  With the gate in place, a proactive request is silently
> turned into a no-op whenever the node happens to sit below both
> thresholds.
> 
> Drop the gate in __node_reclaim() and always run the shrink_node() loop.
> The node_reclaim() path is unchanged, since its caller has already applied
> the same test; the proactive path is no longer wrongly gated.
> 
> [1] https://sashiko.dev/#/patchset/20260723045718.2052070-1-ridong.chen@linux.dev
> Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  mm/vmscan.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f11491ee9ed5..6dff207ad8c6 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7851,16 +7851,9 @@ static unsigned long __node_reclaim(struct pglist_data *pgdat,
>  	noreclaim_flag = memalloc_noreclaim_save();
>  	set_task_reclaim_state(p, &sc->reclaim_state);
>  
> -	if (node_pagecache_reclaimable(pgdat) > pgdat->min_unmapped_pages ||
> -	    node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B) > pgdat->min_slab_pages) {
> -		/*
> -		 * Free memory by calling shrink node with increasing
> -		 * priorities until we have enough memory freed.
> -		 */
> -		do {
> -			shrink_node(pgdat, sc);
> -		} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
> -	}
> +	do {
> +		shrink_node(pgdat, sc);
> +	} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
>  
>  	set_task_reclaim_state(p, NULL);
>  	memalloc_noreclaim_restore(noreclaim_flag);
> -- 
> 2.34.1

-- 
Michal Hocko
SUSE Labs
