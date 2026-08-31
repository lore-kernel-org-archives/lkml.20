Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403F3D567F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166609; cv=none; b=DxHWeTYc1YCNMpqRjJPZ5YhKhpBDFGdBAdV3H+aPeiZedEI7pLrU8PmLATqiz4d5C5wUXE8qbdrjfAieRDj3l/XObvel9L7zC4b5wvtfAtQDWcqerbByedP+G30nE1FwzdYIhfZQ8b2h+Y4cwRJ4r0ElM2DKOEYMP9oVxcVHJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166609; c=relaxed/simple;
	bh=D0J2E8qQ/+RJzXbbPOZDgf0gsEj61XnpMERpUX0Vc14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLIZd7v+YdWDg1pcgCMrwUZ04BBnk3VUl5jFeBVT/D/FYfSpSTWYBsP6fmIWyPPy4vsmbtQjee2MMh3az/onUOO6S8sVUezinfmNr0+mV/YXoHshh3TuDN1erOVoWfObzaiAy31UtRZxYnqxpffN2LcLt4PpjGFbsQqzKU6YICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bz6i2Hf6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bz6i2Hf6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e4998d28so2203834f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788166606; x=1788771406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HLgX1bHF///geDnj0BJGtTg8YhTYEnQT5ferZZbVKSA=;
        b=Bz6i2Hf6tI+jdpmgRB8ASd/H73YXAwTL/jSCa1Uhyq/lSnlkxKQ9VSaxq6wSaWtlkd
         Gx1allwepabPS/zligGRZY/o+16iRqX9jl8EBGhU3QDwNE8V8VDkaWTfC7CxRyDO2Jz5
         WvYQuVRWUp3RihFskNbBQie8gVNXaKulKgQThTzLqMgazt9Kxj2hJCEV+Qq1SwzGj0iK
         RxH3X+z+akl0GaNFwyiRRkRE8TTcC1/lJvXUBOZZlEuADKUEAzO0vJQU6Ls5Ow+4Y4y9
         Mtjg+IP5DVSiDZODXPm0U0j8RUZNVYWhyNDZdjU/hxc9wqruLw+OqW4YI5DHjvNxkEzI
         vgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166606; x=1788771406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLgX1bHF///geDnj0BJGtTg8YhTYEnQT5ferZZbVKSA=;
        b=kJQWYrF0TezbTRFN+tKKaPe2EcFbwX3E2ggKrlPqete1BVglgOUjPUFlQSDx7CF9T8
         P3GB45HWrbwa0a3aaKTaTUp1rn9mAw42pFE9hUqU5vjQphqzTLhlO5V6D2ELbnFVEXzl
         IJ8EmBynsOgXBXnfg7FvjUol5t0L1+wo/q3BL01g6mIaYrBfrSglay9xNqnnyI1FfqA5
         oZr7LmEAnqkvblgYk9iDLYYw5z94+NdUzaDOIm6yceOAYMFeLV/K5H2ygJzZAThFiC6h
         mlNvOISRnkTh4PdJG7KJKr5s3fiJHLPcOSomJynbDgEpMd9x+lwT8YhqPyjhmOzsY2KM
         wIEw==
X-Forwarded-Encrypted: i=1; AKwUvBzgof0QLYNI3hkmrq81M8migeFqT6H1C+Ur+fZII5UABO0V4veq37OsZ50tEVqQ4yaAEHYgizncnk3Ynvw=@vger.kernel.org
X-Gm-Message-State: AFuF++nHo/UuY1az17cveWLTu8onqeeHwIKL6Fd7xDBFHwNMg984LejH
	qAUhjVMF3VjAI01a8yYz1Up/7XaBKBELLrJm9rVeA5bs/KnL2YttWnhzReF4/Xs+dE0jU3G0Zcm
	mvq+6SIs=
X-Gm-Gg: AYBFou3wU4RNTotO70UrD1pltm9ClvEuiTxj3vHkiwpdgXqzYXwXjQwtFglmEAZa+T2
	+etIQuoSPxfpYgGCWv7llMhAtqjK2jpTG95wU7T4CW8kT3syC25qZMUCVWbUFC4TbOzCwgk5qS/
	hQuvOD2XvnFbDnjQLZj51RpORKy2f1qFQbYNiWDBkV7iOKU94FEOW4x8IVNclqwAtfvS32FcGbK
	1bnD6t3jmgYr0IiouUBSSo0otwMuXE77X8sBV4WY+WPtdvZv8Vfzk/1dwyFUX5ZO/A7+JI9aWjC
	sSeru3r4TT/VG05BXRtgkuvHTWKmWwu06eyQEhB6dZR7wmJ7v53yJx+sN+sHot7QqoeRIBnUAOf
	dEag/mOTYkOeVlMZ9e5aLwgtsNd/DDgWe5Q2MuJv0y7tf7FYCcsNbS8HgeerFptlnnyV4FvcNnG
	zH+YCRTMOmqTpMqtLGHN2Xokw9jK3Lk+bkWyoWY/J1oGTGxohLkDHVcP50BzIH8zUmQ0Ygb0KgE
	Q==
X-Received: by 2002:a05:6000:4911:b0:483:9f9d:59dd with SMTP id ffacd0b85a97d-4839f9d6235mr29857682f8f.19.1788166606171;
        Mon, 31 Aug 2026 01:56:46 -0700 (PDT)
Received: from localhost (109-81-17-247.rct.o2.cz. [109.81.17.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fdbsm18886146f8f.6.2026.08.31.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:56:45 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:56:45 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Rik van Riel <riel@surriel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] memcg: clear FLUSHING_CACHED_CHARGE on cpu offline
Message-ID: <apVBzfx9PX7fbxdR@tiehlicka>
References: <20260828192419.3057939-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828192419.3057939-1-shakeel.butt@linux.dev>

On Fri 28-08-26 12:24:19, Shakeel Butt wrote:
> Sashiko [1] reported that memcg_hotplug_cpu_dead() drains the stocks
> of the CPU which went away but leaves FLUSHING_CACHED_CHARGE alone.
> 
> The flag can be set at that point: drain_all_stock() may have claimed
> the stock and queued the drain work shortly before the CPU went down.
> workqueue_offline_cpu() unbinds the per-cpu workers, so such a pending
> work item is executed by an unbound worker on some other CPU, where
> drain_local_memcg_stock() operates on this_cpu_ptr() and thus drains
> and clears the flag of that other CPU instead.  Nothing clears the flag
> of the dead CPU, so drain_all_stock() would skip its stock forever once
> the CPU comes back online.
> 
> Clear the flag of both stocks after draining them.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260828135036.7d44361f%40fangorn [1]

I suspect this goes all the way down to
Fixes: 26fe61684449 ("memcg: fix percpu cached charge draining frequency")

Acked-by: Michal Hocko <mhocko@suse.com>

Btw. is there any good reason why we are not clearing the bit directly
in drain_obj_stock resp. drain_stock_fully. Doing so would simplify the
code flow and prevent from bugs like this one.

> ---
>  mm/memcontrol.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index e082aa68fa5c..872115c6b0f2 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2378,9 +2378,21 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
>  
>  static int memcg_hotplug_cpu_dead(unsigned int cpu)
>  {
> +	struct memcg_stock_pcp *memcg_st = &per_cpu(memcg_stock, cpu);
> +	struct obj_stock_pcp *obj_st = &per_cpu(obj_stock, cpu);
> +
>  	/* no need for the local lock */
> -	drain_obj_stock(&per_cpu(obj_stock, cpu));
> -	drain_stock_fully(&per_cpu(memcg_stock, cpu));
> +	drain_obj_stock(obj_st);
> +	drain_stock_fully(memcg_st);
> +
> +	/*
> +	 * A drain work queued before the CPU went away is executed by an
> +	 * unbound worker on some other CPU and clears that CPU's flag, so
> +	 * clear the flags here to make these stocks drainable again once
> +	 * the CPU comes back online.
> +	 */
> +	clear_bit(FLUSHING_CACHED_CHARGE, &memcg_st->flags);
> +	clear_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags);
>  
>  	return 0;
>  }
> -- 
> 2.53.0-Meta

-- 
Michal Hocko
SUSE Labs
