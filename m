Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955684;
	b=Cq8BE0iQlFC4kVLnWI6sfvsOZ3gM5c7JUdUkn/4ixSdYHbqiYXbVEAIS+35OtNLQe7SO
	 k58pfqDUvt41rb7oyNTjoS0KJzpiKA1fLqrLn4irftAsZ4IY4MmHhoZb1n7Eo8hoZjAeQ
	 t1ANlg2utlKZPFmnn17Bly3AjNRR5N8MAldUN1Il0FkOIMxotbmUJxcHsp6rTr11GVKR4
	 klieIzRNSOnp2MI87M7CuXqBjZRneEsS29lh+G4KcSzL1r1ptq3tGIlrDDBkpEAjIrt4s
	 kIhRY6V4pEnugXv0DMpi0TYZifVlPUNOoynhbJXLej+F2Tpq1E2m1/GFHVIkPx3LrtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J4MVZDIWJcTTvz639+FegxLYC0tlO9xD6qQRowMZ/6I=;
	b=sH7bInXOEDsBnD6vFpK2CdLHM6GZe8V/uyUpKV/dN35MEvCyZISAo+jxdlB6Pi3wPvf9
	 jKE01E6cwc6j21DiXtOOcNgt/DO86XTIgkPA9rh8AVXQn9fbRGz89Lh0ZzGLIHv+mQMy4
	 as8hkGtyHZqgizZlQ4JM1UUfhFhkHCCbmarqEN3rK1z639BDK7C/6ZdUzPxjgKdyiTfaa
	 BlGwYMriwjgZPxVDuRgmHkOBrwmoDNzEiVP/PWglSCA3F5WsTk39ZFRniCbXeqOwqxMev
	 5IAIQDgKBwmdNixJfpekj3fRWM1nTALmQxf7yAyoBSSSAyctgt+oBLjk5YfFRjKAa9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYqpq3Dr;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88077606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88077606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYqpq3Dr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4af520023fdso1005765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793955683; x=1794560483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4MVZDIWJcTTvz639+FegxLYC0tlO9xD6qQRowMZ/6I=;
        b=WYqpq3Dr5uwIWCiYg+xEjYI193BPdIj5oorJpPhMaMpYm4kz40FcJWwYvQx89NYYxu
         StTY8rE6UswzcRBMv1NHmP4EM+2ea30aGHmjZkyhCMPg7idimSVka4XAXJXbJIPkXMp+
         aQGTpVJ9qpEGwBejICU/5HbxLynwSpXWM5Hn5F5wjOoVdYXiFhAai+2KeU1+CM1o0DKJ
         vms6cT/Qj0X3SH8nglwUSiu3d7g4EGC13BpaEvps0uBtjd40iDxdOT44kzYqTwv6t6zi
         GzzYu+UFI0qr0YLqCN0K/S1tvot6YsNfmnpn2GxJMJzjyGbEW0iXtyQZgSex3rXht+P6
         AWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793955683; x=1794560483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4MVZDIWJcTTvz639+FegxLYC0tlO9xD6qQRowMZ/6I=;
        b=LPbmFX5HS99H8b1u+I9OAbK69kZPtVYqSktSZHVjgRih8VekKf3X8PGP6vB258kr13
         av0w+tFv0rVR2I+2OViMESqSSd37+hgx3+lly1Wmp0d12hUtDZVXd9NsL30AoIy9mKnN
         70fNYpQq+A2YQApBMPI1l1W8lS+p2ZDJPOGRE/wN6reZEy9GOqbepjFkCThXGfNORWXS
         wC+HorQxnV4nixVlUuOtlGjKDk4zPaA02zdn04+j7MuEHSooOHMF+61tK7wtMBE0bdJ4
         mMg/B0rgM38+m3ksKgWRo9pM3ZM8u7QHjhOKs3wExBgJrREGo61+1w2mnFpjQYilkiB2
         Po6w==
X-Forwarded-Encrypted: i=1; AKwUvBwfB+3mSIw59H5yXUMyNA8dnDxeWwFOrYlKbNMnOrHWKFBo5/ISVgVGEU5h56amsgulKCJ6uvVWi37oZLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MG7G+dSl49hS2HCoxJRI44gd1eAPrXA0xxS8gUcnm0pY6tW67
	W11NsBb8/V4y8dAkcnHXGUJkbU9COnF/tuUVKfyO3WWURRUZCBgWWBZJ
X-Gm-Gg: AYBFou0D67PCdMbuJhW5KI/j9fUC8mGD3kH3roPdC4k7AfHRMA7Bt3y/YANfXAVJpZ1
	qR8c5RMvamdK0c+b7f6yUvmc/wWV+Rua3mUFq1Mb3sojU3uxM75r4FoR+Cq7uM4lQay0fBEBK/X
	SgfF+Fv/3zRmp3NkVonwKvy9xwp22o3JOsEz2UdDLISmgYSe8bR1dLzktxjwGjQaYtVkEzou1L1
	w6lXBlRjEqTx62TN5gHtEAJEYklrYe5sob1gCk6t0oCslX6wdCk/IguK9+D8fUr1K29RyDqf7Zf
	Ctr+xrTgNChM8CeSDnPaW5CDFaD06H/wdDF69D/B6a5wpw6yXwEBXEAoQxohWhQ0Yuh69qS3EMH
	VDOKpTSjUJDhQXUG5nO7DCU36JSenZOwjmAr1qZN2DLExH0TVe3Xeaex6Li6RUDNvTj3sKkg8Qa
	NNTPN7Zoq8fQB1tA3wj746jLumVLK55hnBFJJyPZ6FysNg/rpET/5QfS1oO+aEedBp/8VaQMSj/
	64xkd8sUlSTZ22nK/StHR22TRIAU3uT2GrJ+8ezjfSZ8ZA7JMwpjx+Gy29QK9PAC074I9mjcRi1
	zOwC5um7nQPsAcSvULGXzbjrnhgQCEO+QUx2dv1lIocXFvDuLXG9CmI=
X-Received: by 2002:a05:600c:c0c8:b0:4a1:e774:370d with SMTP id 5b1f17b1804b1-4b6dcca4aacmr19592335e9.1.1793955682750;
        Fri, 06 Nov 2026 01:01:22 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm85297285e9.9.2026.11.06.01.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:01:22 -0800 (PST)
Date: Fri, 6 Nov 2026 12:01:18 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <au2WhI-GE4CPVcGg@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules>
 <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
 <20261106085320.GB1922751@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261106085320.GB1922751@noisy.programming.kicks-ass.net>

On Fri, Nov 06, 2026 at 09:53:20AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 06, 2026 at 09:31:06AM +0100, Peter Zijlstra wrote:
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -15594,8 +15594,10 @@ static void set_next_task_fair(struct rq
> > > >  		hrtick_start_fair(rq, p);
> > > >  }
> > > >  
> > > > -void init_cfs_rq(struct cfs_rq *cfs_rq)
> > > > +void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
> > > >  {
> > > > +	if (parent)
> > > > +		cfs_rq->idle = parent->idle;
> > > 
> > > AFAICT this creates a race:
> > 
> > > Or am I missing something?
> > 
> > Nah, you're right, this needs rq->lock.
> 
> Something like so..
> 
> ---
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8970,7 +8970,7 @@ void __init sched_init(void)
>  		rq->nr_running = 0;
>  		rq->calc_load_active = 0;
>  		rq->calc_load_update = jiffies + LOAD_FREQ;
> -		init_cfs_rq(&rq->cfs, NULL);
> +		init_cfs_rq(&rq->cfs);
>  		init_rt_rq(&rq->rt);
>  		init_dl_rq(&rq->dl);
>  #ifdef CONFIG_FAIR_GROUP_SCHED
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15594,10 +15594,8 @@ static void set_next_task_fair(struct rq
>  		hrtick_start_fair(rq, p);
>  }
>  
> -void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
> +void init_cfs_rq(struct cfs_rq *cfs_rq)
>  {
> -	if (parent)
> -		cfs_rq->idle = parent->idle;
>  	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
>  	cfs_rq->zero_vruntime = (u64)(-(1LL << 20));
>  	raw_spin_lock_init(&cfs_rq->removed.lock);
> @@ -15648,7 +15646,7 @@ int alloc_fair_sched_group(struct task_g
>  			goto err;
>  
>  		se = tg_se(tg, i);
> -		init_cfs_rq(cfs_rq, tg_cfs_rq(parent, i));
> +		init_cfs_rq(cfs_rq);
>  		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
>  		init_entity_runnable_average(se);
>  	}
> @@ -15661,19 +15659,20 @@ int alloc_fair_sched_group(struct task_g
>  
>  void online_fair_sched_group(struct task_group *tg)
>  {
> -	struct sched_entity *se;
> -	struct rq_flags rf;
> -	struct rq *rq;
>  	int i;
>  
>  	for_each_possible_cpu(i) {
> -		rq = cpu_rq(i);
> -		se = tg_se(tg, i);
> -		rq_lock_irq(rq, &rf);
> +		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
> +		struct sched_entity *se = tg_se(tg, i);
> +		struct rq *rq = cpu_rq(i);
> +
> +		guard(rq_lock_irq)(rq);
> +
>  		update_rq_clock(rq);
>  		attach_entity_cfs_rq(se);
>  		sync_throttle(tg, i);
> -		rq_unlock_irq(rq, &rf);
> +
> +		cfs_rq->idle = tg_cfs_rq(tg->parent, i)->idle;
>  	}
>  }
>  


Yeah this should do the job.


Thanks!

Kayra


