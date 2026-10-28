Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182808;
	b=f/z1qK8FNoSioBo4WxjVEDJDoqJ+gni7E15Luq19tDWF55lq55+ZlvO/absWiQOQLmdi
	 ICuvUdN+4pX3Fm5k08DuAjCoDbIkSFsVozIOWes3iilEwh7TUsP0kdCLQjaHSBuf+j+HF
	 76UlKk6DDQjj+H+IQ3kw3iR3d1v7R1VuRGwqJ3RW1cFEDOrJ/9mLcKKj1AYenGiSeHUOv
	 ZzdZekt753OKdN/gOC7CIe3A74SQJ+oLGZPQOK4Rz1CNt3vMnZezGtLCaeP76TKyIlLMv
	 LPijf18l9hbMLkdulKZWm7z6OVsTR176eZr+LYCGtjZIh1VU/L0DoAFRhnuwvL8ZSoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dGZCyoP3FE5bGQl/UeXjVk9zpz6msuuXm/vv60rRm4I=;
	b=Y3A4joM8phZ16v3Q3w3eJtWzJoyElnO1VprUuvZ4Xp4TFKGzBRC9K7QX4++3Q7xt0D42
	 cwt/FshfLCHeTd+rTZQMJ+RNXocvSVf6KyAJcf6yQf3AApZeGd5gYjoegiLec2K+iArQ9
	 /D/1WLx9bZrMyu1K2H6D3KDE6nTnQf0JuzSi9qRU7Jh7SDY8MHIF/+B+6IdKL2DU+rSOW
	 tsB9OD2plyQCW6OZcmCo4BtdaB30IH6Xi1PQnmW5YCi6IztRpCM/JJCCNOGAvR2/eC1nc
	 aL7KiiA0m8PWLeKda4PBEx1cdD6+qrY2UvWU4Cp2CxDevOS7/JxMxg7PNuwgValmTdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWcHrvte;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3003A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWcHrvte
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso465740a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793182807; x=1793787607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGZCyoP3FE5bGQl/UeXjVk9zpz6msuuXm/vv60rRm4I=;
        b=dWcHrvteUV6fqSrgLHZGGgWHgv5flB+rwm5mHSPV55q92QuDMbOeetVnwNBDZrJiXz
         Q/TJlnvUtxyUcpneB1ZpJno7rDZCuRphCYnUGsBl5OiyD2hFAumBXV3K6zMly5/vOboq
         Xdq4jXlL0/vkmK3FSWuOSHhrJk6V0asWkaWaaV/3ghFSAzqOIQdzHytGoFfIbIDU7wwk
         Vfhj+8YglSHSZO3uBC9ZC7loDrFuAyJwvc20V32u7W+VOw0x3J0cjyzAAx40KC3KrbAL
         0afdvf6xDeF0jWDS1Ni01N4daYDF/9u4qeSqfBHEz/DwjgMVrUpqt4AvXmNUqSOlmugO
         y+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182807; x=1793787607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGZCyoP3FE5bGQl/UeXjVk9zpz6msuuXm/vv60rRm4I=;
        b=kesu6vfHoPJmTU+t2CZcmHZJuUYP7wAetpJ4uLJrOapV6Y+zNNq9dgrzcBwqwsJBp0
         Vo5Zng3zAlRj4tv7ADzbb2UTWSGVhpVcR9InXUfZjxiYNEvYZslBY1fo7Ul/iu6PC2f6
         Qiwad5s6X03LSWlmf9ASmL9kxfiMwyUJ2Sovcvr2SBA/Mz4vVSzLFmEgThLOCbifS20F
         E+bbLKr3tXcB2EcZxAPBJ0Pge3kQkBpk/zV0lhESW+u1dErAjhpq3W/ZJmCByDyFIUjK
         H4WFdemXnezEIRdTfkl0lbZXuVK03mLL7hnOAOmY5HVJ+aB82Oab5txV1CiEstZeexpt
         tSmA==
X-Forwarded-Encrypted: i=1; AKwUvBw1hsDjfzJeGppBKx5oVhgoYjCzLUbBVT1WpCwKk1BlwWGm5ua1Y2GwMHk84GuBRCUa0DkzM11oNKOp58U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVTzt9hd0Ni+KMk5R4zJoHg3H+Wz3ngXmR1Re134qQfo84mowF
	xSMUzBEKOketikEN8hIaIsKFYN8rgbnq1hEuHQzV5JYoPfOs6CryGnCS
X-Gm-Gg: AYBFou1AxRLS6oehvflinjmskAIQnjaSETJ0t0nhSNyhzA1wxpCEttdqc02Jse1Fv22
	1FWvUtW33wT5Q7nE/m95SUUYeZs0B9Ar0rZE4Ml/OOKLHHIzQxuYUSQ7w9iVHqE6mpR4ItUkhZu
	rVTIn3tjxnJ9+tx+ZH7vYtAo5h+96ju06FaWJG0I82cs5fQpDJsqi2qBMiTAP+dGbFwuwzogvqH
	v4RXaIhO+K8qvBsWbjtSDVXaR+QQRwjPwxu4rCNoXZvpS6w5Qsz7UMLkeUVVSyWvl2V+izHg55F
	a0xayiQDRCKLdBo46dB076hR67miCoDF9PDMROwC592goV8Mg7uVtqdFphLWzu5KQlHaUUBR/MU
	Atcf/j4NCYgaDttmq7Cz8sCBhbGYmcP23yrLUQpibdFab7+IWVXlOu4ueCzLpYVPoIU3dAJpE5+
	UgoHT+eAuVFarVohYInJiAxyZsygn9v9BpPUqYhuxUoXKHrUWZen7nAMVXbUT9tk4054ADyf9Eh
	KKtrIP4ilwA9RiX1YFq8MkRiFPuBjU2hOXHEm/Tyy5j0aUKjdt5OMSWguuCuOHvfjZUa3b8+UYe
	C6BMPbENyOVEntWfSMAN9ELHJH48ae1RPkLMh1R5bvH+Umn9pR2XJN5SMp9PC+oBEI0Dc8Vbj6o
	=
X-Received: by 2002:a17:90a:fd92:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3ae57e357e5mr882344a91.8.1793182807428;
        Wed, 28 Oct 2026 03:20:07 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm2400905a91.10.2026.10.28.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:20:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 18:19:59 +0800
From: Kairui Song <ryncsn@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/vmscan: remove redundant !mem_cgroup_online()
 checks
Message-ID: <auHLzLazLr4iA_Pn@KASONG-MC4>
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-2-tjmercier@google.com>
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
In-Reply-To: <20261028010611.3929937-2-tjmercier@google.com>

On Tue, Oct 27, 2026 at 06:06:05PM +0800, T.J. Mercier wrote:
> Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> dying memory cgroup for LRU folios") and commit 0e0ac326c511 ("memcg:
> move LRU size accounting on reparenting instead of copying it"),
> mem_cgroup_css_offline() reparents all LRU folios to the parent memcg
> and zeroes the child's lrugen->nr_pages and lru_zone_size before the
> memcg is offlined. Nothing can repopulate the offlined memcg's lruvec
> afterwards. A folio that is off the LRU during reparenting looks up its
> lruvec through its objcg, which now points to the parent so it is put
> back on the parent's LRU.
> 
> As a result, lruvec_lru_size() and lruvec_evictable_size() are always 0
> when !mem_cgroup_online(memcg) is true, making the offlined memcg special
> cases in get_scan_count(), lruvec_is_sizable(), and shrink_one() dead
> code. Remove them.
> 
> With the get_nr_to_scan() special case removed, an offlined memcg that
> still has stale effective protection now has
> apply_proportional_protection() applied like get_scan_count() does, so
> the MGLRU and traditional LRU behavior is now the same.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  include/linux/mmzone.h |  8 ++++----
>  mm/vmscan.c            | 28 +++++-----------------------
>  2 files changed, 9 insertions(+), 27 deletions(-)

Nice!

> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 3b96d6c7123b..7f078ff0dd76 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -638,10 +638,10 @@ struct lru_gen_mm_walk {
>   * The events that trigger the above operations are:
>   * 1. The first attempt to reclaim a memcg below low, which triggers
>   *    MEMCG_LRU_TAIL;
> - * 2. The first attempt to reclaim a memcg offlined or below reclaimable size
> - *    threshold, which triggers MEMCG_LRU_TAIL;
> - * 3. The second attempt to reclaim a memcg offlined or below reclaimable size
> - *    threshold, which triggers MEMCG_LRU_YOUNG;
> + * 2. The first attempt to reclaim a memcg below reclaimable size threshold,
> + *    which triggers MEMCG_LRU_TAIL;
> + * 3. The second attempt to reclaim a memcg below reclaimable size threshold,
> + *    which triggers MEMCG_LRU_YOUNG;
>   * 4. Attempting to reclaim a memcg below min, which triggers MEMCG_LRU_YOUNG;
>   * 5. Finishing the aging on the eviction path, which triggers MEMCG_LRU_YOUNG;
>   * 6. Offlining a memcg, which triggers MEMCG_LRU_OLD.
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 9959ca158ce8..636152d8c94d 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2754,13 +2754,6 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
>  		scan = apply_proportional_protection(memcg, sc, lruvec_size);
>  		scan >>= sc->priority;
>  
> -		/*
> -		 * If the cgroup's already been deleted, make sure to
> -		 * scrape out the remaining cache.
> -		 */
> -		if (!scan && !mem_cgroup_online(memcg))
> -			scan = min(lruvec_size, SWAP_CLUSTER_MAX);
> -
>  		switch (scan_balance) {
>  		case SCAN_EQUAL:
>  			/* Scan lists relative to size */
> @@ -2769,14 +2762,8 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
>  			/*
>  			 * Scan types proportional to swappiness and
>  			 * their relative recent reclaim efficiency.
> -			 * Make sure we don't miss the last page on
> -			 * the offlined memory cgroups because of a
> -			 * round-off error.
>  			 */
> -			scan = mem_cgroup_online(memcg) ?
> -			       div64_u64(scan * fraction[file], denominator) :
> -			       DIV64_U64_ROUND_UP(scan * fraction[file],
> -						  denominator);
> +			scan = div64_u64(scan * fraction[file], denominator);
>  			break;
>  		case SCAN_FILE:
>  		case SCAN_ANON:
> @@ -4355,12 +4342,11 @@ static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
>  {
>  	unsigned long total;
>  	int swappiness = get_swappiness(lruvec, sc);
> -	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>  
>  	total = lruvec_evictable_size(lruvec, swappiness);
>  
>  	/* whether the size is big enough to be helpful */
> -	return mem_cgroup_online(memcg) ? (total >> sc->priority) : total;
> +	return total >> sc->priority;
>  }
>  
>  static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_control *sc,
> @@ -5199,10 +5185,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
>  
>  	evictable = lruvec_evictable_size(lruvec, swappiness);
>  
> -	/* try to scrape all its memory if this memcg was deleted */
> -	if (!mem_cgroup_online(memcg))
> -		return evictable;
> -
>  	nr_to_scan = apply_proportional_protection(memcg, sc, evictable);
>  	nr_to_scan >>= sc->priority;
>  
> @@ -5325,13 +5307,13 @@ static int shrink_one(struct lruvec *lruvec, struct scan_control *sc)
>  
>  	flush_reclaim_state(sc);
>  
> -	if (need_rotate && mem_cgroup_online(memcg))
> +	if (need_rotate)
>  		return MEMCG_LRU_YOUNG;
>  
> -	if (!need_rotate && lruvec_is_sizable(lruvec, sc))
> +	if (lruvec_is_sizable(lruvec, sc))
>  		return 0;
>  
> -	/* one retry if offlined or too small */
> +	/* one retry if too small */
>  	return READ_ONCE(lruvec->lrugen.seg) != MEMCG_LRU_TAIL ?
>  	       MEMCG_LRU_TAIL : MEMCG_LRU_YOUNG;
>  }

This part looks much cleaner, thanks!

Reviewed-by: Kairui Song <kasong@tencent.com>
