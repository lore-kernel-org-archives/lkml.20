Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957718;
	b=O2KpTRRUYQAeUebK8ApUdJhFlw9dpGCq7TLRXwEaq63y/cbgbh25CN9A2zqprNmuNoX6
	 FQj1ddawdtQbIZ3fBz32VVJ0RfAiHrDZV1O3+To5j1CfLTeQWDZszIgVYHaMDd0AEjbD3
	 hkiWvWtrXXUPAsVMxGs9tSqmfsxpsNF2z3Si/wBZT5JZD0hWCdILJBzeH44wgFpbu1r3r
	 FidB3oceaUI5Vs8X6/tg75uHn+mpv6+R7E9oTzYsXK4o7HqxmUjopUARnTJYvsVwDxsF3
	 db4KdaC0A9RwCcmiHmJMQ2ZZzvkpI+I+Lhsv41X6wVOACyprli6wGKeqRK+wKU5i+5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e+beHwPVnOrx0jzUBZNVM2/8fCDJRY0y3tTo+TmZt0s=;
	b=qsqhmM4z4ETjzVrlZjluAArLeMnleD+IevC5I6Zqd4YMU56IOjlGvbpOaDjCicO86loV
	 QUS33aSrat9qDZ3tLgtqLM6xfgFBtSX+plmGaiUCR80PAeS+J92fcdQIN2LSstWDIVw/A
	 8Z3YZnHarVJf+DVryEmOYPZbNExGeHloqefVAuHqU3nVVS9qm7Mf6VSCRsb43qh0flIia
	 37vXRgZSNcHznCnFSTCy+2IRygMPJir4/QM19LBs3GuddiV9jhBvc3FZCir4jmDdJoDwc
	 RnT9DHNRHr6D5sxogusZQziPSNbieGnIUaRLsH5OGoN3l3hKtNZH/pQ4KySr7iV9tgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGxrb6hE;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329E606D829
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B329E606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGxrb6hE
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c414e5d282eso57788166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793957716; x=1794562516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e+beHwPVnOrx0jzUBZNVM2/8fCDJRY0y3tTo+TmZt0s=;
        b=eGxrb6hEW88atCdNy0tSfzxZ2DmYRRZnEzfrKDE47vNJ1C8+MVMJHFLz8nyZZFYPc2
         YbkEWrk+st5rKjhADm4H2dF6en2AuSRGEw43DnZ3g/jxxuNxor8FZX8SKpiBeHyAeYlK
         yEjky+hYTOzLxY3ClZRQt3hW/8uP6+jaK8fVbrZYld0qnS4Q2e2ZkFkMvtdRr7KRh1Qp
         Hu3mn3A8WPM+z35IPd2alklUeFgQAoLjbau1IMu9wNXYJ45dVpIAEGfRYqpTh/ZeNaG+
         5ggTcLMo1ZvB2zuxqPhwWl4bHLEfloC8ciV5WQB+znFUOcWWB32Cw7g+71ZjZhUIwWg6
         UN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957716; x=1794562516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+beHwPVnOrx0jzUBZNVM2/8fCDJRY0y3tTo+TmZt0s=;
        b=rNlI4zWhayJZ0t3gh3NGqrKMvujFkB6msvQUjlG9ZM+XtpTz1k+zGf1mFVm8+aCXO6
         xOjEg/aB/xYvSmHEYfrw5jEfAiIEz8N/KgExfvH8jX9P2t7uuyoun/RNF3Skt/PG3ij6
         a42nB9aBlTUDODruCnnpgQxU+RN7KQ6pRfR0VKuHAbtvnUArbw0Jr9ksUn4drPyG+Cqi
         giedxfOBCg8TwUKPtibSYI4XGa+XQB0K1xHbegjeg1e1ZHPSLKMnFin8E+24kDHAqcgp
         n0DS1NWR2aycAxUJI3i/wolXLww0sfflwmnGvOMcf3L4/lx3bcLhwD5YKJgH8+fxhfCA
         RgAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+eeINHKgp7CriWQwHnoz9bhFhe/g9iE1OTb7du6+Lnq8G37dFblCxK7nq7xtJbgkeqYaY9qWzeBEderE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mKRrCsdbjfTVOKrf4euf+5iaUp9I5p8vmEpiWRoCkaMjCISuy
	LwI6dO2b+4KAQkjKbhr0vaciNTCLSW3f3Nu5qKndh3RiAdQx+K7eE8zt
X-Gm-Gg: AYBFou2V7ETin6cnvyitxtZWAnvqVzCDblwnVAn4pbdXf8bDyuvruq1xNrASoqzp4wi
	V8NQ80Hjzbo+Km3NxK7S4FsU8dGgmqfY38o8nh/ScUNtK3pk99pAQQfhyLqRou7BJMTq71sjE7O
	i/XYLjlUmbtvZ3vyW5RED/WmcMnejCdF2aVGWlMHCMAKtC1s10jw6LO/lsAJ/Z+tirng9N+hzEE
	8GM39XsxqpfZtkJVTNaeXKM3OxYDtop/tMBDXE7Le6Wb9W/BnXj02tifvlZZlH2j/csfF9Q6tbG
	+0q+WP7PsPO2/kEQ8qSoHimxpNS5ffZ3f4EleMLm+ZZfhExYUZkJwKxKdNBvl5h3PUFtI3FdCBI
	E5qx44X5fgabteeRaZc8fIup4XS2YT4SNwJNG/TYTTNQm2h04B0SXFm0TU8HVXvn0Ij8g22f0x6
	mxaeuntqgdRh2cPln8lyp0h2khrseY7TlVwcYEDTpZOrgnOgwGbENMleE5NEAWD9C+9NmHGWFzb
	jclcAyP3zMbEJ5XiSfbZa0t8P7mvb3bp+3ZYJsgEDKog3o/pBNfGcra/UPc/bp8GX5c
X-Received: by 2002:a17:907:a892:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c4d34bdd8camr155235166b.23.1793957715953;
        Fri, 06 Nov 2026 01:35:15 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35670169sm65381266b.42.2026.11.06.01.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:35:15 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 6 Nov 2026 10:35:13 +0100
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: vbabka@kernel.org, harry@kernel.org, urezki@gmail.com,
	paulmck@kernel.org, qiang.zhang@linux.dev,
	akpm@linux-foundation.org, hao.li@linux.dev, cl@gentwo.org,
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH 2/2] mm/slab: don't queue the page cache work under
 krcp->lock
Message-ID: <au2fUYzBLv3uvj_2@milan>
References: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
 <20261028134647.3176080-2-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028134647.3176080-2-zhanxusheng1024@gmail.com>

On Wed, Oct 28, 2026 at 09:46:47PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> run_page_cache_worker() runs under krcp->lock, from kvfree_call_rcu()
> callers that may hold more, such as set_cpus_allowed_force() under
> pi_lock, so it kicks the refill work from an hrtimer.  Under memory
> pressure it instead queues the work with a delay of
> rcutree.rcu_delay_page_cache_fill_msec, which may be 0, and a zero delay
> queues it at once, taking pool->lock under krcp->lock.
> 
> With the delay set to 0, calling kvfree_rcu() on vmalloc memory under
> pi_lock after a drop_caches makes lockdep report:
> 
>   Chain exists of:
>     &pool->lock --> &p->pi_lock --> krc.lock
> 
> Use the hrtimer when the delay is 0.
> 
> Fixes: d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory pressure")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  mm/slab_common.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 3729aa7a6156..ef5ff0a20249 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1987,7 +1987,13 @@ run_page_cache_worker(struct kfree_rcu_cpu *krcp)
>  
>  	if (rcu_scheduler_active == RCU_SCHEDULER_RUNNING &&
>  			!atomic_xchg(&krcp->work_in_progress, 1)) {
> -		if (atomic_read(&krcp->backoff_page_cache_fill)) {
> +		/*
> +		 * A zero delay would queue the work right here, under
> +		 * krcp->lock and possibly the caller's pi_lock, so let the
> +		 * hrtimer do it.
> +		 */
> +		if (atomic_read(&krcp->backoff_page_cache_fill) &&
> +		    rcu_delay_page_cache_fill_msec) {
>  			queue_delayed_work(rcu_reclaim_wq,
>  				&krcp->page_cache_work,
>  					msecs_to_jiffies(rcu_delay_page_cache_fill_msec));
> -- 
> 2.43.0
> 
> 
Can we just clamp this to 1 - 100 seconds interval?

<snip>
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 7223a7596dab..2c9236236ac9 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -2249,12 +2249,12 @@ void __init kvfree_rcu_init(void)
 			WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
 	WARN_ON(!rcu_reclaim_wq);
 
-	/* Clamp it to [0:100] seconds interval. */
-	if (rcu_delay_page_cache_fill_msec < 0 ||
+	/* Clamp it to [1:100] seconds interval. */
+	if (rcu_delay_page_cache_fill_msec <= 0 ||
 		rcu_delay_page_cache_fill_msec > 100 * MSEC_PER_SEC) {
 
 		rcu_delay_page_cache_fill_msec =
-			clamp(rcu_delay_page_cache_fill_msec, 0,
+			clamp(rcu_delay_page_cache_fill_msec, 1,
 				(int) (100 * MSEC_PER_SEC));
 
 		pr_info("Adjusting rcutree.rcu_delay_page_cache_fill_msec to %d ms.\n",
<snip>

so we forbid zero as value to use?

--
Uladzislau Rezki
