Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257996;
	b=KKjxsnEmiunO0EMiylDkbDCQHY7e8bXj/L2yc2gg+jVA3inseaIjVXVEc9jpFMYx0H7/
	 hxQfyjKRRbLxK1iqMmQSBjuQ9I8WCKsgNPh2BhbGsG42P37I1CDpQ6ju6NNKTTPOpJYfl
	 pz94AEfGd+2x6lpX61LJ/OX2viatgJzT2FEg+xT23CXN8EKvgtpv1y0/vddzMlodmyHHZ
	 4mtCQMkjznjGxK5KE2+6pigIo//1EqqQyEv2ndrKjmIIg0RZjZm50+mDjI5sFJwWrdhAk
	 ya0cibK7F8Mrq2NVaWmSEhrsnlEk1u/zkTVjyu5Bnvj3gyeB4IqGulcilFBqj9KHy7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Hb59LP10QcRi2gQtYU4Yq5Tp1KlGeogk3z8PXLHKSoY=;
	b=psmk2VLMh2/KSlRQHJL8vY3a1iTKH3WJEdg4+ZsjrWRpfY1BLNqUMHBYDyI4DjJMOEoF
	 Z6zZ45jdTAh0xgCs8uiL0WYBYONhk3JDArth6gt02BgxbedrEf0UOw/ZHMo1RfyYxNSah
	 mSjZbZDUASLrCrZ6ZvA2+rDk7EVu6fv50Kc0Wiqi7g4vq6f+3jG9ca5K+4n84W2L0Xl8X
	 FnifuzyEEVWTTwK3IJuIE5iPPh3CDlEXsMosdJQZ6qFxKOOlgyHp9Y6/YChgOeNKuu+0y
	 WCskAiKnhLu7+Qn5BOMZNN152c+D37xu8EibPti1LPojMvn8QmhRzEoDvt6OAVZluZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptoU1Ccz;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1684606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1684606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptoU1Ccz
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c499e0e43a9so23427466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257994; x=1793862794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hb59LP10QcRi2gQtYU4Yq5Tp1KlGeogk3z8PXLHKSoY=;
        b=ptoU1CczcGjWkVNE0L6P7V5YYacX1MIenQ8eUTmzh+7VT7RpSN/t1/3CEC5mxmEVVQ
         09cj6zz7T64iCtzPb3SJYBAXALsH0YSvzz9OdFNxtN/sFKBrA8x4RNeBdf2RYeCfx+Yi
         eXSBrPrQTYPpn4YR+Z6xiVCBrY0doZ20fOIhlIUey82CkxnyWXpgvJewahO5ClbvYiQd
         IpjmpuBItwaoJ9E3PCrEXA82dlPk3jWu79xSdOEi6VLM5CjBmBjapWYHIFSKy9CfGgRo
         rkcPdSviPZWu7lJEiGhk6Q2lgsY5XN3npoBWqX9GWbPwVkQlG3xvPfar4WT7XMu4gXrA
         EXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257994; x=1793862794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hb59LP10QcRi2gQtYU4Yq5Tp1KlGeogk3z8PXLHKSoY=;
        b=GS26zbutV66KbpcDk1gk6SwlI21Xxl47XYWv7kG16psETlEld0nmTBCfh7eNiNpPtL
         UDvYODnYEzL57J4QOkKmuO/1xFNqevO3s4+05qUKL7gS52xBWqMxgbDq1OT6YrQnE4Ps
         sSbV3Q35JLO6Z52YW8rJ154PEHYwXvqYH7vAnVRTIF8LGHHO4oq0O8Vu/NHZlqaYYZNB
         ettgWJTwEnRA31IuUCobq7U0qu7Sc2C6wy5hvgVyL1hxF7vSywXXc96aj6s/2q9kssUu
         o8PD43jlo65fpkSqCcaxSak1/s+Pvbs0ptSEyWk70I31hiIgZBPttUpDYfNb9d20kPCr
         0FYg==
X-Forwarded-Encrypted: i=1; AKwUvBwfGXgqqeIIMbabGQRN5hgUK1oDe46m4A4qt2dvHbD+7xZhLcwE+XumuMJjkez4MrUGFXzC1ss0stjWMDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvCXjxsuD+Wp78vjSpTd+cKDChBIsg/j6qSWCDpUNCDB5LiRc6
	VzusizX0b7vAWwTBJ0u7sjwx2rL0k4+XgiMgnqxeSgqy5gR72a5GhzrD
X-Gm-Gg: AYBFou1e1ezXNcZmyFjokU5aPbvMSsV1rv2lHOFgtbPKDcpe+HzczJSsLyKYDNlruYt
	seLkOFyNxKNzGxtyGK/QbLGUA07qhbi08uJ9+vQh3qe+Zfk5iCL23I7owogq7jzUEQU8AC0IxvG
	hkkRQ2Ak3kg7YixMCrlFHb7iz8OmSIqDVqN5HyvGPAoXy6SW2YQj9BFCzCw+gvaAGT9xv8Kvd4c
	CQWz/0v/4BwYxyFnvf1eV5QtJO83aMlwIsj+EckLAnfhg6y3K6FKzLtD+ah22j0/FRpDHqIjp7f
	OHqZPLBHY5aWPQDI+zL6BLYIT9An6Nfk4GrT4+NnTfmvlXexAhaFTO4VMve82ldhSa8FOX7g1Cd
	4i3JAYbGNiPU5Lkpo9iKJ2kksJdVToHFWtp/8icEF4qy0oM73D820iMIu6i/6WPX2LQ24VewZKm
	xkvrtJbXs25+kDcrAiQGPi7ZICRDimGYNrDM+Jd1kHtPGepspcBeug0qOXEvjjJVDObMpOuH522
	hssrKuiC5QEQiEQQxkGkj2tGZa/hl3kTEniaXIAqKwzZbyGrKKfdvd2EqaB09ONnw34uFfNxpMH
	00KYjNBlndHyiR+JOH1wPYaoMxNLeRvVb30YZZKf8Vw2TOtFrW91Eb6Y
X-Received: by 2002:a17:906:d932:b0:c43:f1ab:167c with SMTP id a640c23a62f3a-c49bdd9ab19mr398914666b.1.1793257994106;
        Thu, 29 Oct 2026 00:13:14 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm34417791f8f.51.2026.10.29.00.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:13:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:10 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, tim.c.chen@linux.intel.com, 
	yu.c.chen@intel.com, kprateek.nayak@amd.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/cache: Check reduced capacity before
 alb_break_llc()
Message-ID: <auLs7xeL9FsHcf-h@scheduler.schedules>
References: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>

On Thu, Oct 29, 2026 at 10:36:50AM +0800, Zhan Xusheng wrote:

Hi Zhan,

> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> need_active_balance() moves the only CFS task off a CPU whose capacity
> is reduced, for example by IRQ load, to an idle CPU with more.
> alb_break_llc() runs first and refuses to move a lone task off its
> preferred LLC, so if no other CPU in that LLC is idle the task stays on
> the reduced CPU.  Like asym packing, which was moved ahead of
> alb_break_llc() for the same reason, this is a performance case that
> cache locality should not override.
> 
> With two LLCs of two CPUs, the other CPU of the task's LLC busy and 60%
> of the task's CPU spent in a hardirq, a CPU-bound two-thread process
> stayed there for 20 seconds at 38% of its normal throughput.  With this
> change it moves to the idle LLC within a second, as it does with cache
> aware scheduling disabled.

Sweet.

> 
> Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from their preferred LLC")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  kernel/sched/fair.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..e313c6d212c6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13585,12 +13585,6 @@ static int need_active_balance(struct lb_env *env)
>  	if (asym_active_balance(env))
>  		return 1;
>  
> -	if (alb_break_llc(env))
> -		return 0;
> -
> -	if (imbalanced_active_balance(env))
> -		return 1;
> -
>  	/*
>  	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
>  	 * It's worth migrating the task if the src_cpu's capacity is reduced
> @@ -13604,6 +13598,12 @@ static int need_active_balance(struct lb_env *env)
>  			return 1;
>  	}
>  
> +	if (alb_break_llc(env))
> +		return 0;
> +
> +	if (imbalanced_active_balance(env))
> +		return 1;
> +
>  	if (env->migration_type == migrate_misfit ||
>  	    env->migration_type == migrate_llc_task)
>  		return 1;
> 
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> -- 
> 2.43.0
> 

Well yeah. alb_break_llc() just returns true in the nr_running <= 1
case. FWIW, on my tip tree this just creates a conflict. On me
alb_break_llc() is first, then asym_active_balance() and then
imbalanced_active_balance(). I think in that case moving all three
functions would be better? (below this other block that's for this case)



Thanks,

Kayra

