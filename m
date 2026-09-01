Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8F943F4A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279218; cv=none; b=LsDO3R5jdIAyvy3m1AgKQqgOQP5CExU0dpG4EyyHrj51Kou6ks//8SAxwGSQgDSw5aencoMHbqRvvPfwmfUHoEFYvCmq/amBUOK5Bz8wKYa+mf1/Ja0Wae2fDrsw1gnF2aRjqLj3xBpgZmeOzCqVEjGfOB7GIVWVFS9A93cA9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279218; c=relaxed/simple;
	bh=9MgASB8uCsHE65o18G3D5ET7hgSWQGPYuIK69H2yopE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hpw2JRzFsYi7Z4eISicvtx2SOq6N+Vf2jRUKGnTsBeRj5B5d/WHvMsacr6l9F4bRZR/KDXICIAgxQGJn56pxuqU1x/u/ZJoXwfH5UMretaU6b/3cYeaPQcsGObqcD4AIY7IVS/Tqho172jtIANX7sCvTSFtm7H5TnoUuI2SCzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=mVv83Ciq; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="mVv83Ciq"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-864cd11a932so15202437b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788279214; x=1788884014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONke0gJOgNHGc8+HNAj15P6+4xEqz5FFd8jzahTO8SA=;
        b=mVv83CiqfcwVMnvL4UKNoWO3NofUmhSQg1VlDtT7ZYOe+WmUPx6jlZxxP2N4kbKLks
         JNAIohYghB1yxYLUtQ8U3er9GmU1jl0M+RSX/5aI6446I/zHKSm19lXujFQWlVhavrWe
         qtj9xsH0Jy/rfU4rbNhkRkdkEuqUJLx+S1U2KbuCUE3X/1gxY0yKIbrk77Drs0O6ySqP
         vJVJBmQhUoCQWl05oTL1QAryRR9usCyHgSQWIIxp9xZDouuO9tdlnyypN++o/ShGIkYa
         UfzELPmbCvyPvKteF1OrcCjIu/Cciifzb9GVAzNqsljiQHFxaIlHqur/gFiiyaGkfmyp
         QN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279214; x=1788884014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONke0gJOgNHGc8+HNAj15P6+4xEqz5FFd8jzahTO8SA=;
        b=eiRnZ2kRGnX0k2QEiB9PZa0+aEa3TIdaWGmi3pzayRmbE6cFM6DIbGqd/FVlF2pUwE
         5uCKBWXsdbysHKz0zdm4wddjvMU4rO1sEa96nfswRiNjRhDj2tu5luJj0VWXBXX27jUo
         xshr24lGt7/7hYVpIe6/N5vf3IrebykIK3KRMhecV8Hwrr1bfXJ3rdr0ufmNC5fHn3qc
         Bxr0kmf8jSnkv07rL7iys/CAlc9gY0SVbAvJGLJnyRaxjgQOb4u/mxlbvd77OOm0O70X
         i1xHeLO5apFQ8oMfo4ABYuATHs+jge/o0SwSgsgEjf2XakHNNx+IqE9IdqdIqP6+TNM1
         DyXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2A3l8/tIHnptnGUfKCOZxHGt9fZZfHboV6zQB8awiMyeVbQjkt8yWsJONtPxbeyVC+ZXodWz7ksLz2CY=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ20lZZ5hV2Z033CmJ7h9Ammp1u3ZjjYcWU/mDppDpzhy/5PkR
	e+3EIRFzu8ZWxv3Zjtqv6uln3BXRRy5ytIKqJnJISevaSbIPdv1NHIvC0osZiVe0+0I=
X-Gm-Gg: AYBFou2S/j4VFEAnCkNjozDNQt6aDnA5H4ulQ5byCKamNSmTQY2qj9eHtcOH5JiZBDC
	Ag3noOaW8vwkTCRuVXSPUpfZoCIGRetlc22VstAfB7JAj6x8waCDHAO3PqsAzsfWur8Z+SbL8Je
	WgcX7QH5czrg5DdQbmGAO4oM6ykBBQ5MTzk/cxNAIaOOoOxnHiU43//RIBYryiUxL2cmdQ1GTiG
	2Xc9zfTPAxxBLeehwII3g/UMbVgvHZ4qLVT6BRal+18QWXaLj9cOhTF6M2ETZdAHrzSdJsmrX9r
	oOdhvvaB9CW9DnCzahojEce5Gd2Og2GjxWqxveAv1B+4a91HdsLoi6IFwfaWJn2IYCccOq2gqjK
	rMQ/YFFBtDp6CHQGQH8o+HEdKWHIJCKuNVyvE08p6RKJ4qvue2g5HyauPnT66uJ58TerdUALnN4
	Q2OUy0nAUk651GkdSySljgoYzLjlvfXAxiPtWpMSiNar7vqTA1Bi3A/oNyaGu8
X-Received: by 2002:a05:690c:e15c:10b0:861:850e:dd59 with SMTP id 00721157ae682-8694c637510mr20838267b3.9.1788279214223;
        Tue, 01 Sep 2026 09:13:34 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abc938sm76771227b3.37.2026.09.01.09.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:13:33 -0700 (PDT)
Date: Tue, 1 Sep 2026 12:13:29 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
Message-ID: <20260901161329.GI3004@cmpxchg.org>
References: <20260830114731.8322-1-wujianyue000@gmail.com>
 <20260830114731.8322-3-wujianyue000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830114731.8322-3-wujianyue000@gmail.com>

On Sun, Aug 30, 2026 at 07:47:30PM +0800, Jianyue Wu wrote:
> Originally zswap holds its pools on an RCU list whose head also serves
> as the "current pool". Only a handful of pools are ever live at once,
> since a new pool is only created when the compressor is (re)set and
> pools are reused across compressor switches.
> 
> Hold the pools in a fixed ZSWAP_MAX_POOLS-element array so each pool
> has a stable slot number, and track the current pool with a separate
> rcu-protected pointer.
> 
> Slot 0 is intentionally left unused (always NULL): a zeroed or
> incorrectly initialized pool index then resolves to NULL and trips a
> WARN rather than silently aliasing a live pool in another slot.
> 
> The array keeps the same RCU publish/retire discipline the list had,
> so lookup and teardown stay equivalent. A fully-constructed pool is
> stored into its slot as the last step of zswap_pool_create(), so array
> walkers only ever observe a NULL slot or a ready pool. Pool creation
> is serialized by the module-wide kernel param mutex (all built-in
> params share one lock) and otherwise only happens during
> single-threaded init, so no two creators race for a slot.
> zswap_pools_lock still serializes the store against a retiring pool
> clearing its slot in __zswap_pool_empty().
> 
> Behavior change: the fixed array bounds the number of simultaneously
> live pools at ZSWAP_MAX_POOLS - 1 (15, since slot 0 is reserved),
> whereas the old list was unbounded. A pool is only live while it is
> the current pool or still has stored pages referencing it, and pools
> are reused across compressor switches, so 15 is far more than any real
> configuration needs. Once all slots are occupied, creating a pool for
> a 16th distinct compressor fails: zswap_pool_create() errors and
> returns NULL, and the compressor switch is rejected with -EINVAL
> rather than silently succeeding. The cap can be raised by increasing
> ZSWAP_MAX_POOLS (bounded by the u8 slot index, so up to 256).
> 
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---
>  mm/zswap.c | 97 ++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 72 insertions(+), 25 deletions(-)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 0bb30e58950a..b3b5e2887c00 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -13,6 +13,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cleanup.h>
>  #include <linux/module.h>
>  #include <linux/cpu.h>
>  #include <linux/highmem.h>
> @@ -154,12 +155,27 @@ struct zswap_pool {
>  	struct zs_pool *zs_pool;
>  	struct crypto_acomp_ctx __percpu *acomp_ctx;
>  	struct percpu_ref ref;
> -	struct list_head list;
>  	struct rcu_work release_work;
>  	struct hlist_node node;
> +	u8 idx;
>  	char tfm_name[CRYPTO_MAX_ALG_NAME];
>  };
>  
> +#define ZSWAP_MAX_POOLS 16

It's unlikely to happen, but this is a super annoying failure
mode. User would have to kill something, delete shmem/tmpfs, or
swapoff. And it's not obvious which entries are in which pool.

Wouldn't an idr make more sense?

> @@ -270,6 +283,31 @@ static void acomp_ctx_free(struct crypto_acomp_ctx *acomp_ctx)
>  	acomp_ctx->buffer = NULL;
>  }
>  
> +/*
> + * Publish a fully-constructed pool into a free array slot.  Pool creation is
> + * serialized by the module-wide kernel param mutex (all built-in params share
> + * one lock) and only otherwise happens during single-threaded init, so no two
> + * creators race for a slot.  The pool is complete before it is stored, and
> + * zswap_pools_lock still serializes this store against a concurrent retiring
> + * pool clearing its slot in __zswap_pool_empty(), so array walkers only ever
> + * observe a NULL slot or a ready pool.
> + */
> +static int zswap_pool_assign_slot(struct zswap_pool *pool)
> +{
> +	int i;
> +
> +	guard(spinlock_bh)(&zswap_pools_lock);
> +	for (i = ZSWAP_FIRST_POOL_SLOT; i < ZSWAP_MAX_POOLS; i++) {
> +		if (!rcu_access_pointer(zswap_pools[i])) {
> +			pool->idx = i;
> +			rcu_assign_pointer(zswap_pools[i], pool);
> +			return i;
> +		}
> +	}
> +
> +	return -ENOSPC;
> +}

It was kind of overdue, but with this now requiring a pool walk as
well, it would be better to factor out a find_or_create function?

Something like:

static struct zswap_pool *zswap_pool_find_or_create(char *compressor)
{
	struct zswap_pool *pool, *new_pool = NULL;
	u8 id, new_id = 0;

insert_new:
	spin_lock_bh(&zswap_pools_lock);
	idr_for_each_entry(&zswap_pools, pool, id) {
		if (pool && !strcmp(pool->tfm_name, compressor) && zswap_pool_tryget(pool)) {
			if (new_pool) {
				pool_put(new_pool);
				idr_free(&zswap_pools, new_id);
			}
			spin_unlock_bh(&zswap_pools_lock);
			return pool;
		}
	}
	if (new_pool) {
		idr_replace(&zswap_pools, new_pool, new_id);
		spin_unlock_bh(&zswap_pools_lock);
		return new_pool;
	}
	spin_unlock_bh(&zswap_pools_lock);

	new_pool = pool_alloc();
	if (!new_pool)
		...
	new_id = idr_alloc(&zswap_pools, NULL, 1, 256, GFP_KERNEL);
	if (new_id < 0)
		...
	goto insert_new;
}	
