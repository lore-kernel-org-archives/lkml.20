Received: from mail-ej2-f38.google.com (mail-ej2-f38.google.com [74.125.228.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC78497B79
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332612; cv=none; b=cz+16kMRWyas32kFesY48fktKR/4WPeQA31RnIrKiZ6wCPBfukymGS14MSUl5Xm0KurNFJDjiWgOTmAyFSeQs8+icJzT+qfN0IsvORGiQ1IS3tJsGyLm4eZwF4bROpHAGlOWuPuWcTusRTtmxc1KykKFu0vCKXxpD97hEOuj77U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332612; c=relaxed/simple;
	bh=p8eecZ4y/X0nnQGJnEGiA025hbiv/mId6im2EVDxeRE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+QDpA4KmxuAFf4aTris9iw47v83KVl4M7mAYsx4unOAx5FYx4cy7YgJLokLkkxl8EFbcrgKNEEj0p1+NjwcdIXluA5r56fAgdsi3yA1/etAdYtU1mmWQ4bkpIIxyR1KdwPD+f9O8YCgqw79EC7nZZDX8eH1Qi/60HZ2NjACks8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKeeMMfx; arc=none smtp.client-ip=74.125.228.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKeeMMfx"
Received: by mail-ej2-f38.google.com with SMTP id a640c23a62f3a-c2af9270c53so6902366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790332609; x=1790937409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhWuBlVR+9Exee5MQnVdQb500Y1OJ3oFiUVTaPUsfcQ=;
        b=FKeeMMfxJBPDdmIAiJ1dRvOQy2FheNuHcaYpeMHIdRlwJzpIvNTRAD4fnkpKXQiOqS
         Hzeh6pgjVtqJUUHG2ZrL3JB+TBOEbjA6ImLyaWktSH8FS9M6JF14/hqgDqz/jpMUEgre
         SZ1dkI+qApSyG1tYomC99oLYoBjqTDKXFUCI+taBm87tylt4+JEuosgX1OtMQrtMJDCo
         QfCpbX9bbbJu2fu81nzBIdM6S5AAxSiE8Zgbtqcl6jqZ1XMEY3oU5l36nJO0aFDh1BPW
         5dMdj1i19gs4ID9Hf+T3p14MoiosyMcIVfg2apyfclwpu6aGwXwxGT6W6lMwkmmorblZ
         VrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332609; x=1790937409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhWuBlVR+9Exee5MQnVdQb500Y1OJ3oFiUVTaPUsfcQ=;
        b=qEUxajyFjRz6DE96I0449D4CKYBMFs5ZvBlsG/vOh03hTQOn1Ph1XASr1NjbbFNfZ2
         HJqqbPPKRjsk+Ysiua8vF7afOdlSXgsNUZDIG3JNQP318K4EdoMDPEqirsAorzi+ULqU
         0O0yXdI//aD4jXyF8xPAZKB/BXV2FBO3qRqWbjv7B3OyNM1GIxAIh770F5nXToG17ThC
         fiV301rjvttFnu/5+XlFyj3NeQmPi7ZUAnf5Zl5lGzdEOzxakIKpK9FOBZcOdKw8WklW
         mxSAMEOT2AN+v5fX71d8eyPNzJc9a789ye/rK6YQFyrg5ul26MZDt2JUtne/DtlXKdS6
         pmoA==
X-Forwarded-Encrypted: i=1; AKwUvBztXkmunO3qZH18wUZO8A3SfqhmFQEkmEulWbMBwK/DXila69Mfw37rEYZOGoF9Zg6Okh3lWjVCdNiK73s=@vger.kernel.org
X-Gm-Message-State: AFuF++nQV+xw2xWX+xJs/HM6YVX+eZ9UqBMejedGf5BQ81rvoK4ymi/4
	dcYbXmpXnoYt7LaZyTqed3tmMGiCJbTCJuDXaZluurAa7RJ17bidCKM3
X-Gm-Gg: AYBFou0bts/67C2LZ2BfjqSqn6zTuf820KxV8Poum3PafSFHMQjTlE4k8FoJxo0Bzsc
	f2MczXn5YOetjc9ewu8RmdoFfdaPadZaUwuIQo1fFFTzVgqHdpGBObRvJCkLBhZNHzJ77eGEBmB
	09sKAMLwCHoZ/0Vei06rylmGnp1m1V0sH7BMGxg0iZJt69EUSLrO3W5gxxcN/PxGTO1TWwg4UBR
	1AMk+fVAgVGzI3ljRmBYa7teLZe/ZFx7crwfd38QYk/2HqP3n9VvVhTF011lC2gSQXpxu7Ezly3
	yuyw8hwYqwDialUdVG82jK5KZZK4FUwYgo2YaycICzCvuOISW48kKP5WAjEQitH2hs+n4T52Zu7
	JwbnjCQUNIp3AWYJiBBdx8bvdzXebX8oXhxY9uLqPigbO7fiUajO5xTJZmJ3dMQLT6EyQKK0t3a
	Rs7BpBWPamgdUutVmwTSjT/bKIzPwuWq+BDEE=
X-Received: by 2002:a17:906:7947:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c2ac53c3f15mr404029566b.35.1790332608444;
        Fri, 25 Sep 2026 03:36:48 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae77fd743sm95444766b.47.2026.09.25.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:36:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 25 Sep 2026 12:36:45 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v3 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Message-ID: <arZOvQzkacy826wJ@milan>
References: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
 <20260924-vmalloc_dump_obj-v3-2-5bdee3da37b3@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-vmalloc_dump_obj-v3-2-5bdee3da37b3@linux.dev>

On Thu, Sep 24, 2026 at 04:51:40PM +0800, Ye Liu wrote:
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
>  mm/vmalloc.c | 111 +++++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 69 insertions(+), 42 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index df42d8a6f058..e5b465de1559 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2517,39 +2517,81 @@ static void free_unmap_vmap_area(struct vmap_area *va)
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
> -	if (unlikely(!vmap_initialized))
> +	if (unlikely(!vmap_initialized)) {
> +		*locked_vn = NULL;
>
Just set it to NULL once on entry?

>  		return NULL;
> +	}
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
> +		if (mode == VMAP_LOCK) {
> +			spin_lock(&vn->busy.lock);
> +		} else {
> +			if (!spin_trylock(&vn->busy.lock))
> +				continue;
> +		}
> +
>  		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va) {
> +			*locked_vn = vn;
> +			return va;
> +		}
> +
>  		spin_unlock(&vn->busy.lock);
> +	} while ((i = next_vmap_node_id(i)) != j);
>  
> -		if (va)
> -			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +	*locked_vn = NULL;
> +	return NULL;
> +}
> +
> +struct vmap_area *find_vmap_area(unsigned long addr)
> +{
> +	struct vmap_node *vn;
> +	struct vmap_area *va;
> +
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va) {
> +		spin_unlock(&vn->busy.lock);
> +		return va;
> +	}
>
Can we simplify like?
...
	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
	if (va)
		spin_unlock(&vn->busy.lock);

	return va;
...

Thanks!

--
Uladzislau Rezki
