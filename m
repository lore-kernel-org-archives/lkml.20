Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0775F392811
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936067; cv=none; b=n/bL5qGcAKvMyZXchHrhJwM6n+s8FaQfdrM1mZXZcve+nDMirNjEQSC/MrGtvzXzKIz4lTS8gwkSO1JupAcQDEGr08V0nzKpL2Xu/p4O0NBQrfsHMQR0ocPXej88YTjJylYrFOtWitfWNosXmJL6MfhfZG39TQ3qRtGxjykwpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936067; c=relaxed/simple;
	bh=zBbKiEWIrRKEf95JSPWVy4Bg5lDnRm8l96pA3IWR/lE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AblXGs2Z/M1Bxv7F1aDUaZPJWwMSGeycoI48OZ+UdDMt2gc3Js4tLB6kB5wG0PfAkOadZ+e5AjZvF+Q+WuBVnnfQWzEUk01HkyUymcOaq6f2ZWCdn1ndHnBzRPlWonv0d6Sm6B39UFwWHE25WHUNvOYlzn10fTESnfJOMTNHxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKPkWilp; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKPkWilp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2530cabcf4so201711766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787936061; x=1788540861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZc1WWxRZ8hTjRwH7hstNkGifi5usT3ZTkYTcQBOSfg=;
        b=oKPkWilpbgpH4FjpXCJ3OrCdNLzgf2ly1U6hWMB+x4O4E3tl33t/5rKs1vcWP7N0PZ
         Rdk0Y34WaM251R/2GluCmzn9Sl/B2NuvpEkFcA9TknEfk+XKsWLQme5YcWk9/qAshgzt
         Eh275QpYTTjuNGL1rZAHcbkdDrwhharaR+jLAvzpta9MxH38R8pEX92gSG0rh/W8tgAM
         U/3zpIp0rausVnTXke58OQeGsuyKCS5SXv35kU9oLje/B3eH9KTQPtd0fMMx+3FUuhNF
         UhSYRpf4ildoERFy4yK5X1HLvP177IGP1lQxfsMwEmWK7y3KaTHnJXGPkTc4lhkZ/JDr
         CbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936061; x=1788540861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZc1WWxRZ8hTjRwH7hstNkGifi5usT3ZTkYTcQBOSfg=;
        b=PjF42bftzE4EWZMpgk8PzqKQfFxGgZ3GXXc0kHIxuxZmn/Le08Yt6gsSOyJeufIbGr
         mMA6zrJr8iBLJx7zpp63hWm5N+miZuwn6XJIRRUDgbZZt6vF50UyflPLmYmY+h7Xbz6Z
         TIc9iy+KGfjpXdj21pK57TZ9z81zaOaCgvdBoQLh/Wzob2A8pIqV12m66joKROpJVWbu
         HibkT6UNDYi8c3L6x68mp0ZTXOPWy+lAwfgV3dkN7ALdmcaNPFoRdha/0UCq02KehAiK
         nu1yI4QCZQie+7Hb7YvzYiFk7985s8GkkgU6aJW0JncEyPgveD7D+4uqOb5jbsGahfz9
         3cCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2auUwtupD294FRSK+Qj81WbEw0YME3WtJMXDO6iskpvYvuA0wN2W8sc4tPAl9o8nzddG6cNVkrvdEVco=@vger.kernel.org
X-Gm-Message-State: AFuF++ldQiPHqFk5BkJXGOW0cZoa//fSdshgiXoMrXFtymPIotcqSJIn
	okRyW19oT4i6h135zPj3JlaIIMH2gGK2rURrlTacmjrIvPiJq4YD2Nfg
X-Gm-Gg: AR+sD12izpmoUWLsRdUn1f7gH6NPn8j+B9h+uhwITO85VhFlmMs5tksacNBrpdWScFn
	rJLbftR1Zq9PpgueKwuSXvq/EYTVVD0LJixl8D2yKBuXcZv5lLBGmd/oTujMKdhsGA0D7e5BvKh
	/BdNiXGRTckKyiC5FQU83n/pxc2aOrt/s+p/pIo0gic6p5cI93E5VwXCHmQDJtAi4RrJKF3fm+J
	6HRuov4k4mZsORbMDcyK10IbdjetOv6ygBWRaGQOJ6O9AZWZDSItKp+tSUG9s7AHJdHDZRGGWIi
	+8MgaTu1Fugh+UNw7DCzBv1Lrxjgxc9k9OzU0+mABTln0tWGEMZ78kDnB26lhi1Bt0TVD0BxKtR
	9q5qeRS4P4pI1GL7ZX1p74YRLfuQ5ksD4jfkC7Apcdn8Hu7z3ObvKmnkFU4nO9IT5liPW7lqk1a
	IYGEwMQ9S5Q0u7JTwAvwC/QO6b2w==
X-Received: by 2002:a17:907:1c90:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c2557012418mr630435366b.12.1787936061168;
        Fri, 28 Aug 2026 09:54:21 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b23esm102793266b.2.2026.08.28.09.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:54:20 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 28 Aug 2026 18:54:18 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Ye Liu <liuye@kylinos.cn>,
	Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apG9OjDrFygvb4Yo@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828091753.299295-1-ye.liu@linux.dev>

On Fri, Aug 28, 2026 at 05:17:53PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> The vmap_purge_lock mutex can be held for an extended period by
> __purge_vmap_area_lazy() which calls flush_work() to wait for
> purge_vmap_node workers while holding the lock.  Under memory
> pressure, those workers may themselves be blocked in direct
> reclaim trying to acquire the same lock via the
> vmap_node_shrink_scan() shrinker callback, creating a circular
> dependency that deadlocks the entire system.
> 
> Two places acquire vmap_purge_lock from paths that can be reached
> during direct reclaim:
> 
> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
>    mutex_trylock().  This is a shrinker that only decays the vmap
>    pool and returns SHRINK_STOP without freeing memory; skipping a
>    decay cycle when the lock is contended is harmless and prevents
>    tasks from piling up on the mutex in the direct reclaim path.
> 
> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
>    mutex_trylock().  This is called from the vmalloc allocation
>    overflow path; if trylock fails, another thread is already
>    purging and the allocator's retry will find freed space.  The
>    notifier chain provides a fallback if the retry still fails.
> 
> Both trylock failures break the circular dependency: the lock
> holder's flush_work() can complete because workers are no longer
> blocked on vmap_purge_lock in the direct reclaim path.
> 
> Fixes: 7679ba6b36db ("mm: vmalloc: add a shrinker to drain vmap pools")
> Suggested-by: Uladzislau Rezki <urezki@gmail.com>
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
> v2:
>  - Use mutex_trylock instead of mutex_lock to acquire vmap_purge_lock,
>    as suggested by Uladzislau Rezki and Dev Jain.
>  - Link: https://lore.kernel.org/all/20260824095020.1225189-1-ye.liu@linux.dev/
>  mm/vmalloc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e7..e5c68b795a3e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2440,7 +2440,8 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
>  static void reclaim_and_purge_vmap_areas(void)
>  
>  {
> -	mutex_lock(&vmap_purge_lock);
> +	if (!mutex_trylock(&vmap_purge_lock))
> +		return;
>  	purge_fragmented_blocks_allcpus();
>  	__purge_vmap_area_lazy(ULONG_MAX, 0, true);
>  	mutex_unlock(&vmap_purge_lock);
> @@ -5519,10 +5520,20 @@ vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>  {
>  	struct vmap_node *vn;
>  
> -	guard(mutex)(&vmap_purge_lock);
> +	/*
> +	 * This shrinker is invoked from direct reclaim where memory
> +	 * pressure is already high.  Blocking on vmap_purge_lock here
> +	 * can deadlock the system: the lock holder may be blocked in
> +	 * flush_work() waiting for a worker that is stuck in this same
> +	 * reclaim path trying to acquire the same lock.  Use trylock
> +	 * to avoid this; skipping a pool decay cycle is harmless.
> +	 */
> +	if (!mutex_trylock(&vmap_purge_lock))
> +		return SHRINK_STOP;
>  	for_each_vmap_node(vn)
>  		decay_va_pool_node(vn, true);
>  
> +	mutex_unlock(&vmap_purge_lock);
>  	return SHRINK_STOP;
>  }
>  
> -- 
> 2.25.1
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
