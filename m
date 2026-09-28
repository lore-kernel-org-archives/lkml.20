Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FB748593E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586371; cv=none; b=ddUG63hNgc0ula4DfsPc+Ei6DkSAo2FQ6bpXINYbr62U95ymL7pFWwsR4C+6zNib7E3FuFYVjdcDvxqyiC1cRajY2hHob6tfYfs4cbyoJHU2WsIlWv2eUMoHJWQnjREY3mOQxyPnc5eYNGkY9CL8qZRiDR31/QumVO7ZZHrI440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586371; c=relaxed/simple;
	bh=DFxjlxsY6yNHjf+UrdRoDQuYQQPnai2W6xQO+MX+96E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChA8IGVUMeqL4vLEJ9bRr3yw+MpVB731BrtBiVF+2bAYYulzgT3e//EJTQC3bGdbD5beC1R9Eda68GjzO3/u2cMdux0hkuR1nIBEMuRYBrlilkiiwj4KNmL+nnbzBuaUO/yf3aSPYQHrdE3Tek4HmLsQ34EeqA9UrXnLX6GRtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4SX3KlM; arc=none smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4SX3KlM"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so204969666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586368; x=1791191168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtSlOLaW3Y5DkxUyXc5MQJfomo4EWRSttsNoIPMu1rQ=;
        b=J4SX3KlMGKZGVRHoXt+auA2QYdpjp82wMHplK9ClLz7cILmwjdAvqgMeaYpeVdkPaS
         XkaiJQyh9h0zYlmKpxrraS6oz31jzlS4jS5mN3q/RvrFa1Pb/Q6TjCXJhg8nSZjp0FW2
         ldnTgS1sSWYJafgk6VPsNx4vwihSlVH1gwN23l5iSsZU6VHOFq+RY3/NnhS7E9sx3qWo
         Dcz9vRxJHakA5YCwGxQuxwCJNPKZZxPgUnRhYoSH8bf/Y5vIQ5/2cDL/4QP4yEBo73hb
         Dr7n7Djhvov13vJr9EfitL1lymnfpYq0I0Q/z87ZBpTwokR5FPDX0zlZdsBWtbyWgsnQ
         vSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586368; x=1791191168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtSlOLaW3Y5DkxUyXc5MQJfomo4EWRSttsNoIPMu1rQ=;
        b=vZE7HnbW6ou78T95m53eD+43BAE1JIpF8EM540Xcismixf/j1cHeASF2quhiB19f+1
         z7RsuckmA/Pm8gmZwoHJCl8ptn/dfhu1dG2sBUHb760xgue63W/5tvh1pNdLA7zakYS6
         dU73mD8r2pTcwzZJo0tiO43IPeNUZy8V8TNJNzkizLRLGqfVHzN9o+j6+k8f4K0MGJCW
         9yOTzOUpkLsIwQ91UE6ARFh81BbYyjslqxso0NLKRlrO4UO6SxNaG1umsgJec3LbGEIB
         zBu5ogKmNLNLeG/jU9Po9FUG8R9UGKl6MbYHyrJesLBE4+cwB2Db6l6USXdv8sdpeud8
         qMpQ==
X-Forwarded-Encrypted: i=1; AKwUvByFpjEP0DU1pYKCAo71SNimqhXzGc7EgBsGy8zTEpuLmPjbeSUSiJcNKHZYm4y6x9nSurAhLRLem2YtgSI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjSf8yeCMqNqsP/LLtsA/AlMxLiqCXSWPAeQ++RIcKHyXg3JQ8
	WwCM9zMh7s3eXG4OiPSeBxrXdJGAKML1LxuGr38zv9DUyj9oGha8gLpN
X-Gm-Gg: AYBFou17KyS8nwBpWgy2zWcuwbwzn8aFNZP7H70vwZ0hE5pzLtIylligv2jG1leVJ8v
	q83zhEUkHq/AoUnH13kIQg3+esI3Vm+jMbnwiz+oC3rZwstEZ6btbGqr2kGIrTidHx+qUtRKamQ
	mPZOL7rlPGzRbcjQ6jHGxIoHLJ9QqpfAC7hDIdXUCtBqFvrGMogapYAqcwkzTNXMFUar197NMA9
	v+ZnWMf2QxMNVGNHj4XDfOE5ySSe7W6HYu0MAgXXgBwbPfO6MNorQyT7l2HGBeO+I1VGCVDwHIx
	pUmlq6IYrIx5EfrOMOvP/JlIaaPJym7UotmqgPVcJeudkj1jxs5viNPNWXy0nFhEAgn13ZrM+x0
	pGYM4vDXl2H4lehTzcf3mkhhIFrlbG/3bPqw15Gb3HPPH4fV57z4Zsqt9EDln+dHzhtEAmlzEdb
	Xy9ucyhaF/y8ds3s9xAiqSVMHkMgGDZUzYwEY=
X-Received: by 2002:a17:907:9447:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c2ac250ec3emr1002093866b.35.1790586367856;
        Mon, 28 Sep 2026 02:06:07 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7356d1csm441929866b.18.2026.09.28.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:06:07 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 28 Sep 2026 11:06:04 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v4 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Message-ID: <arot_MLB2tWwR7ue@milan>
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
 <20260928-vmalloc_dump_obj-v4-2-6f288a431edc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-vmalloc_dump_obj-v4-2-6f288a431edc@linux.dev>

On Mon, Sep 28, 2026 at 04:15:55PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
> but a vmalloc allocation may span multiple vmap zones.  The VA is
> stored in only one node's rb-tree (addr_to_node(va_start)), so an
> object pointer in a different zone than va_start maps to a different
> node and the search misses.  This affects any allocation larger than
> vmap_zone_size (64 KiB) on multi-CPU systems.
> 
> Extract find_vmap_area_lock() from find_vmap_area() to share the
> cross-node iteration logic.  The helper supports both spin_lock and
> spin_trylock, the latter for atomic dump contexts (OOM, KASAN, RCU).
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 108 ++++++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 66 insertions(+), 42 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index df42d8a6f058..4f4d7453962f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2517,67 +2517,94 @@ static void free_unmap_vmap_area(struct vmap_area *va)
>  	free_vmap_area_noflush(va);
>  }
>  
> -struct vmap_area *find_vmap_area(unsigned long addr)
> +static inline int next_vmap_node_id(int i)
> +{
> +	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
> +}
> +
> +enum vmap_lock_mode {
> +	VMAP_LOCK,
> +	VMAP_TRYLOCK,
> +};
> +
> +/*
> + * Search for a vmap_area at @addr across all vmap nodes.  An
> + * addr_to_node_id(addr) converts an address to a node index where
> + * a VA is located. If VA spans several zones and passed addr is not
> + * the same as va->va_start, what is not common, we may need to scan
> + * extra nodes. See an example:
> + *
> + *      <----va---->
> + * -|-----|-----|-----|-----|-
> + *     1     2     0     1
> + *
> + * VA resides in node 1 whereas it spans 1, 2 an 0. If passed addr
> + * is within 2 or 0 nodes we should do extra work.
> + *
> + * Returns the VA with @locked_vn->busy.lock held; the caller must
> + * release it. If @mode is VMAP_TRYLOCK, nodes that cannot be locked
> + * are skipped.
> + */
> +static struct vmap_area *
> +find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
> +		enum vmap_lock_mode mode)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
>  	int i, j;
>  
> +	*locked_vn = NULL;
> +
>  	if (unlikely(!vmap_initialized))
>  		return NULL;
>  
> -	/*
> -	 * An addr_to_node_id(addr) converts an address to a node index
> -	 * where a VA is located. If VA spans several zones and passed
> -	 * addr is not the same as va->va_start, what is not common, we
> -	 * may need to scan extra nodes. See an example:
> -	 *
> -	 *      <----va---->
> -	 * -|-----|-----|-----|-----|-
> -	 *     1     2     0     1
> -	 *
> -	 * VA resides in node 1 whereas it spans 1, 2 an 0. If passed
> -	 * addr is within 2 or 0 nodes we should do extra work.
> -	 */
>  	i = j = addr_to_node_id(addr);
>  	do {
>  		vn = &vmap_nodes[i];
>  
> -		spin_lock(&vn->busy.lock);
> -		va = __find_vmap_area(addr, &vn->busy.root);
> -		spin_unlock(&vn->busy.lock);
> +		if (mode == VMAP_LOCK) {
> +			spin_lock(&vn->busy.lock);
> +		} else {
> +			if (!spin_trylock(&vn->busy.lock))
> +				continue;
> +		}
>  
> -		if (va)
> +		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va) {
> +			*locked_vn = vn;
>  			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +		}
> +
> +		spin_unlock(&vn->busy.lock);
> +	} while ((i = next_vmap_node_id(i)) != j);
>  
>  	return NULL;
>  }
>  
> -static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
> +struct vmap_area *find_vmap_area(unsigned long addr)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
> -	int i, j;
> -
> -	/*
> -	 * Check the comment in the find_vmap_area() about the loop.
> -	 */
> -	i = j = addr_to_node_id(addr);
> -	do {
> -		vn = &vmap_nodes[i];
>  
> -		spin_lock(&vn->busy.lock);
> -		va = __find_vmap_area(addr, &vn->busy.root);
> -		if (va)
> -			unlink_va(va, &vn->busy.root);
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va)
>  		spin_unlock(&vn->busy.lock);
>  
> -		if (va)
> -			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +	return va;
> +}
>  
> -	return NULL;
> +static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
> +{
> +	struct vmap_node *vn;
> +	struct vmap_area *va;
> +
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va) {
> +		unlink_va(va, &vn->busy.root);
> +		spin_unlock(&vn->busy.lock);
> +	}
> +
> +	return va;
>  }
>  
>  /*** Per cpu kva allocator ***/
> @@ -5278,14 +5305,11 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long nr_pages;
>  
>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
> -	vn = addr_to_node(addr);
> -
> -	if (!spin_trylock(&vn->busy.lock))
> -		return false;
>  
> -	va = __find_vmap_area(addr, &vn->busy.root);
> +	va = find_vmap_area_lock(addr, &vn, VMAP_TRYLOCK);
>  	if (!va || !va->vm) {
> -		spin_unlock(&vn->busy.lock);
> +		if (va)
> +			spin_unlock(&vn->busy.lock);
>  		return false;
>  	}
>  
> 
> -- 
> 2.25.1
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
