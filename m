Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4E48C405
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405386; cv=none; b=Wty+pAJREC8ozou9VXwieMQXbSo1RWHSFnBs1RUciRx+lS+q9ESAZEUsKt6B9Zvp4oDHO2qeG2t48p+27EhlbXK9gFulk9aeMbglG3uqFwFBs4XEC+aZypwgC+3DhGxvDVbGNHEf5aFLnOmC2q0Do0HIgN9W3HnyWO6qYp1vJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405386; c=relaxed/simple;
	bh=0JqC0GgFX/eed25oF0k16Y4jomDbyjEs5tico8r+tp0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqwz2DcmuvBosst7AHFdAbNNFvW6tzw7xNAUDaTaCAxTyoKzJ/yJH42+svQuXg32524EGPkS30ZOfDnvX1cF0rTBD4To7gaxdAogjDgXKiMqebPfYyZn/1993/XlIcIhbFn/McDZavJrMtVIBsVLteOQMq/pIX3rsQjOUNuTOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjk3o4lw; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjk3o4lw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so3530279a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789405383; x=1790010183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kiXS9rBNSo2wTNrsiYMKi3HRNXfyiTJkObuItuJbkY=;
        b=rjk3o4lwbfEBzcx1Yw8haTITxUMJntVP3S+8o+vCuh3nzXhQlaiXbbhy30Hhpk4bH8
         kS0CIYjVrsNG16K5SOkTBAoQo7athJbLDidXKwv636rhpr2EkZ96pDVvo0g03yRs81BR
         ADTjRdTqVJ4wE/6Bwv+9smDUVSvT5lWSfPtPnvth/zvNQVU5uOM1w6pn7iAMtLMoBeFE
         sJdzA/YhdmoBEJSkstmUZONnHyj5NeTrjwsEZZQdFRZtw7Emi+MZloGzfMDRd88hNcPV
         +SP8+wdhZVT9vy7hEriA4F9n7PalBW2BeQMsz0ZSywTqSH5l7bQY2TJG2HwVME/WXUFp
         v3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405383; x=1790010183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kiXS9rBNSo2wTNrsiYMKi3HRNXfyiTJkObuItuJbkY=;
        b=Ezfy5hyYXGdKdnLG5JgAjvr0qUsC0cN6oX7S1jG65eAk10yibhSuBv8iCsM+p1b8Q+
         jY60JmqmBziEyFpjZWUHRDkpOhqbgYnOxAHaqcsP94RbpOuF4sDVeR8JAOBUnHMiRMqs
         ZcLbxaRsOPOrvUJPv7IQhD1nYtQVn5J5WpfZ/2J9C3VbbT/mYK/PCfD9YL41+ClIezJ8
         iJbiH9BUXq//Bh2WSLOJ7Vc2jZgLNOobG2897vWE9jLPaA6TjMzQHlnrEXFG3KkcX1U1
         hRo1ZyhF4HQuT7jMGEi5MBfRPg0YsWIFHtmMvL0uNTi9uhc2CxFfkmrpnwp3snk1ek5K
         152A==
X-Forwarded-Encrypted: i=1; AKwUvBzxBWGlP9Htq8GgQ6jp8geJyd4agcSA1mU96IpuP1WrWLWskOAI1osAJKj9dnKgOVpe1kUaOEcyrRuHl0c=@vger.kernel.org
X-Gm-Message-State: AFuF++mfUJDxwp6zrMvV1TEBcvchghRccd4aGsigt1BhsN3Ph1SNf3tC
	JGB5UtPmGdGCsZliWDAqo6wEsEcLXBl4VOarDWIyHaC+5pZqCQmpuGLq
X-Gm-Gg: AYBFou1VY5f/mjWifOPtbcezJIrqsXAGxq7UGh3bF6rZOhdkdyLva/yByLgCNqR/pwX
	miY6Eyz8FRRzJDv9PV7yfSMWozUMgfe6HRbC9G9hVheDkgPXHjRpfxSTB7tp2eUCfmUgs6hkNfI
	cgakJH8Rc8Zod4xxUD32XA+H+nr+6S2vVWDlOFlhuCtDYFr/g4MO2gLbmq/8NtChYZ+jwnRS9Lt
	NOz8VtCsmtpYrF5DpvfGCW0Cpm4tQstUjGtSgqduIWmlyei6fPUBZdg/zeSryYFaryyckf2pfhy
	g4NeOCXQ/RT46P0amsTLkyn2Zl6ADO/V99XBhg94Ku1EigBpA1MCePZdye/OD5tmc8G0HqU/PWc
	rRe/UGSY7gCyPX5eYT4LnVbxKy+vyb5Bm0s0Erh/eLc3hsAcjUfmY1HZckqpOnNj5BNeySed3Li
	UZC3roeybNc/qLSiXDgm/eH6MP72fiwvar7Oi9
X-Received: by 2002:a05:6402:400b:b0:6a3:e813:8457 with SMTP id 4fb4d7f45d1cf-6a9f6256adfmr5299859a12.12.1789405382771;
        Mon, 14 Sep 2026 10:03:02 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9d0ef7228sm2946016a12.9.2026.09.14.10.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:03:01 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 14 Sep 2026 19:02:59 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH 2/3] mm/vmalloc: extract vmap_insert_free_area helper
Message-ID: <aqgow3u0GSlj0P1Y@milan>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-2-526f68559706@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-vmalloc_study-v1-2-526f68559706@linux.dev>

On Mon, Sep 14, 2026 at 11:34:01AM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> The allocation and insertion of a free vmap_area is duplicated
> between the loop body and the tail of vmap_init_free_space.  Factor
> it into a small helper so the main function only deals with computing
> the free gaps between busy regions.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 41 ++++++++++++++++++-----------------------
>  1 file changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 117483dd048c..797933ba9451 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5433,11 +5433,23 @@ module_init(proc_vmalloc_init);
>  
>  #endif
>  
> +static void __init vmap_insert_free_area(unsigned long start, unsigned long end)
> +{
> +	struct vmap_area *free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
> +
> +	if (!WARN_ON_ONCE(!free)) {
> +		free->va_start = start;
> +		free->va_end = end;
> +		insert_vmap_area_augment(free, NULL,
> +					 &free_vmap_area_root,
> +					 &free_vmap_area_list);
> +	}
> +}
> +
>  static void __init vmap_init_free_space(void)
>  {
>  	unsigned long vmap_start = 1;
>  	const unsigned long vmap_end = ULONG_MAX;
> -	struct vmap_area *free;
>  	struct vm_struct *busy;
>  
>  	/*
> @@ -5447,32 +5459,15 @@ static void __init vmap_init_free_space(void)
>  	 *  |<--------------------------------->|
>  	 */
>  	for (busy = vmlist; busy; busy = busy->next) {
> -		if ((unsigned long) busy->addr - vmap_start > 0) {
>
This line gets removed and then re-added below because of removing space
after (unsigned long). Maybe it is better to keep that space.

> -			free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
> -			if (!WARN_ON_ONCE(!free)) {
> -				free->va_start = vmap_start;
> -				free->va_end = (unsigned long) busy->addr;
> -
> -				insert_vmap_area_augment(free, NULL,
> -					&free_vmap_area_root,
> -						&free_vmap_area_list);
> -			}
> -		}
> +		if ((unsigned long)busy->addr - vmap_start > 0)
> +			vmap_insert_free_area(vmap_start,
> +					      (unsigned long)busy->addr);
>  
>  		vmap_start = (unsigned long) busy->addr + busy->size;
>  	}
>  
> -	if (vmap_end - vmap_start > 0) {
> -		free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
> -		if (!WARN_ON_ONCE(!free)) {
> -			free->va_start = vmap_start;
> -			free->va_end = vmap_end;
> -
> -			insert_vmap_area_augment(free, NULL,
> -				&free_vmap_area_root,
> -					&free_vmap_area_list);
> -		}
> -	}
> +	if (vmap_end - vmap_start > 0)
> +		vmap_insert_free_area(vmap_start, vmap_end);
>  }
>  
>  static void vmap_init_nodes(void)
> 
> -- 
> 2.25.1
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
