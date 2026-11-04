Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818588;
	b=XmMmvKD/Ak+jzmfMsgzdeNrrYVbfkwK5cyxY80CSDBatIDyHlA42uheQLT/3GJbSPSPI
	 5xiQMjbDJRDlym4tqhanXAj3p/pmTI5ONH1h+nErN3JeQ73aglJbiZGOZVfB8rQpl2kOc
	 9200gxd1aKk937QlHfAJiBga0BE8JDwrYW9kxytH8SM+SzLjjswHlSXjXZzx04uKr9ryp
	 m+cfMpXy6eJ4P6jEOSfFvKiyCTQmZpkGND5UfSvqby5q+AKPAv8X83Rsv8jErK4EfF/Ow
	 /U5KntO2Gn0WBVatFnym8Og02hoUYOHBrfdwMZTDYruRwL5GnHe3g8zSHPidK8B2pOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TTXLEOh52+t3Z29jkjHnAsnETSdAT4Q1PIg8lVq9/7c=;
	b=fzDDNHK9FxxAiRnwQWAQqvTi06PJ3uFK179dI/gR4c0i+c1z2dKcvt9grmCgH/U8nE0E
	 UBEoP/0NIN5hroBIhmdqOfhnGX87Jczf1r2/QBkhiPK7NQ6ul7z6yoc9vxqZq/LFpXot6
	 68Cp2es1OUtUtDLvofgPnGtH6Evr0RJMd/4HoF9zxbpl82caBpKjJBohOBauIJ9PFv9+b
	 sEC6/x2vJgCmhScdxcRxF7ojn+wicx23d9nPjNJXy1Gr8u4XRwL0FemPeQQOqyZL8+tUf
	 fhJSlh7t2LpY/EVBva52Q3zWyps73rFUo+2TtDEYpWXjAsn/CPN/6fzIrhLaL8MakYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIug1IpG;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5001A606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5001A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIug1IpG
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ae34ad9bb6so1224255e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818587; x=1794423387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTXLEOh52+t3Z29jkjHnAsnETSdAT4Q1PIg8lVq9/7c=;
        b=RIug1IpG9hagKHeKOy07bwDTTc2rnw0DHJJK79cxJ+t/LNDc4vqM/DHT1KSa1I7YY5
         QH4bIPtyoJYI/7vEfnyNGoQaYFtMCyKqNTIAv2Cxbbk383rzwFNCIJStDRqtRXlgW7tn
         Kw78HcHOm7aQ0g8159uGEA2gGE38Cx5LFFieG9YnEWEMYFpEOR+uAqkT8xnU61oGdDx0
         Xe93Fsx4rI79sM0lyso6dtC462Bzl1r9O0Kp6sxJ8XEOkhqVVWVgu4Alo7b+77rGEehI
         LcXfaNjB/K8/Rpz54EhcA1LhZ+Kw+vmVLGb65QVAERHnaSkWlfFh7hzMM1GvSb3/W+2i
         6y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818587; x=1794423387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTXLEOh52+t3Z29jkjHnAsnETSdAT4Q1PIg8lVq9/7c=;
        b=nFhPDkNvPuwyEyZRgJngBPMRud3RXJMciL5tUgHT8h2bEcEhSbU1kcRlgzHSLH80Gk
         YahWDE9EvqqyZuvQElelzsk3kXYwN9OlPxwItjcLeNR7xKmD/QFCyu88uh9tS13jspes
         F2WAVZH+xng4JN+AwlIOF1Sub+WvgmpzmLnHYVlGVEUb0oyCfRBoHvUUBvAvBKX9fycf
         UyU9Po0GZCfLOmFudEbzd/2wT9efYkC3GdcO9/v6xVc4nvusA477/yBX/mcwMiQiOaWP
         qJn1YpMj/hZhE+2avDHeVZa1PkJZE8FZPrAQ6E9RoEbGosGVcNzimWQRGNBZ8EKEUuye
         UDoA==
X-Forwarded-Encrypted: i=1; AKwUvBxJnVbs5cSqxC+jz558IyMW+bxYTdvyXWe5CGe+GE8UqUhEOrqfShaCf+3psjbju0MglVQbUA4WHL17/OU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TeelfPptw5sqUONP5SMD5XDZ59WlodHY47Fqcs9bAUzFy2qnw
	bFkHF23GcxWx/pwe0RjSMv92+ukCGXNap0XXQsLelOKbYz8bBDJsOBYs
X-Gm-Gg: AYBFou0I9+GkbrureSgBhHhat86LKAqFFY7PvqfGibaHykeub6IjUJkq6hnQbXJnbyN
	5R2652qSF/4OXPYVmMibVk3mhf6iCHMP4UQ+VjtaTq5hmivRpQPuBppPk2bsGJMuTLfgoEzxh6B
	5Oareq1tnP45gKArrbtPevM1kR15hje4Y67T2CD2Dv5ntqwOIj+qbn820EbV47VtYWcoF8sTh69
	diKDGjWvt7XJNLs6lBfLUWEmfr+6udG8lvGOGFwx4+MZ1CTd6YzDMLHB2UE9YTbGDfxQMyLv/d/
	GBQIkxfOS1WSPncdmasKZC2lavCAiDKBMAYfG7lH4SrHsDhHNnsYx/pU465dGkfOowtvu+1VzsI
	qVScJFTQmjwjG7SGHlnLJQddSy8hofV7u3t89FFlOzNdRQ+nkRFw0E50A3XGxJP0niJYoI+nFL1
	zTxrvZZi2SAgsM3vOdU7vWxAoKfEyxohOR5xiIYvo74az7H9K0EJdlXTCABUmslwy+Tkqi1+INW
	K6fY1a/tMaa4BdTYBeOOIzG1tJd18MpVka/GfL5+PhQreKzYSQOsjCMvaQvl0VTdzG2b9/XWv1Y
	NGR1sAi2L8qP6lVyfxWRhXZ3RpxktzENiYVVnb5qfIc+vxCQGPgNOIF61Fh5Oli588vHwcVUNxm
	3
X-Received: by 2002:a05:600c:4897:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ad5ec2d3e4mr198521645e9.1.1793818586595;
        Wed, 04 Nov 2026 10:56:26 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm96749275e9.3.2026.11.04.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:56:26 -0800 (PST)
Date: Wed, 4 Nov 2026 21:56:23 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: peterz@infradead.org, mingo@kernel.org, tim.c.chen@linux.intel.com, 
	qyousef@layalina.io, yu.c.chen@intel.com, vincent.guittot@linaro.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v2] sched/cache: Don't use fits_capacity() to compare
 thread and CPU counts
Message-ID: <aut98iS5gqInpZ2-@scheduler.schedules>
References: <20261104020954.2388172-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104020954.2388172-1-zhanxusheng1024@gmail.com>


Hi Zhan!

On Wed, Nov 04, 2026 at 10:09:54AM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>

I said myself that I'll review this someday. But forgot when to :/.

Hope I'm not too late.

> 
> invalid_llc_nr() checks that a process's running threads stay below 80%
> of the LLC's cores, scaled by llc_aggr_tolerance, with fits_capacity().
> fits_capacity() is meant for capacity values; here it only supplies the
> 20% margin.
> 
> Give the check its own helper. x * 5 < y * 4 is the same comparison as
> x * 1280 < y * 1024, so there is no functional change.

Magic of 256.

> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reviewed-by: Qais Yousef <qyousef@layalina.io>
> ---
> Qais's series changes fits_capacity() to take a CPU number as its
> second argument [1]; this call would then pass the CPU count as a CPU
> number without a warning.
> 
> v2: reword the comment (Tim); move the reason above out of the
>     changelog; add the Reviewed-by tags.
> v1: https://lore.kernel.org/all/20261102021536.1026143-1-zhanxusheng1024@gmail.com/
> 
> [1] https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/
> 
>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..a7467fe425e6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  	return false;
>  }
>  
> +/* Number of running threads below 80% of LLC's cores for default setting */
> +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> +{
> +	return nr_threads * 5 < (u64)nr_cpus * 4;
> +}
> +
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  			   int cpu)
>  {
> @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  	if (scale == INT_MAX)
>  		return false;
>  
> -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
> -			(scale * per_cpu(sd_llc_size, cpu)));
> +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
> +			    scale * per_cpu(sd_llc_size, cpu));
>  }
>  
>  /*
> -- 
> 2.43.0
> 

Yeah well they behave the same.


Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

I'll normally say Thanks, but I'll try 'cheers' for today.


Cheers,

Kayra

