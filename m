Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AE83C3C00
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405040; cv=none; b=mXyN6x1E/wFfqFUZejk5A89zSr61zotfpqpEo4LCMt/mbqHJlfnWeUe4T+Pu1jS/M0DWAmGeBvX5XD5Fau+/SUiG2GRMbC1B82JylOUnuMquSHWH9tLeyvR5ooTf6Th3Q6g4v0SDXSqL2MdFnq0WPaA55HhEIal6OnnRJCdD0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405040; c=relaxed/simple;
	bh=T8CHS58wpAB55b0sN7HVbodxUTD9QQ7f93n3iq9zyFc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKyk7mbOp9bJaWnoKMKwBAlU5CxCE3pF/1YPjsMSOy2Xso5Z3mnlSORad3bAhi7vcG1P1Knjq3ypwsEZSvdQa4Uq/z/hs82oiW4VMjXI2tjDcSs7LzDG0RUA/+/OvCSxAC/uCx3iturBsDm/BDhu/ED05HXM/KJUQ4MKqK5DED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaeuZXpO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaeuZXpO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20ce3c118aso4768966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789405037; x=1790009837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QL8RwUf/cYtMAICbILIWEvYNZJnqZvkmMoFZxOMHTyE=;
        b=jaeuZXpOrL598WLXXdYh2AwvezXvbcKNx8QixOJKQqB3Ugnh2kgg7/7b7M3v/hrwTs
         LfJmq1mZXBXatULsHSNisgTBjN5V0b3pg7JP4i8tNZLPT3u8HlwdtMVtv8cxng6TBg5Y
         22rPIJu0KPOC95VomvnsQbOHlDpc3DjiClGCFQc8tevQED+qGlzAZ7WU7PjN40Ba1hY4
         sCUmDOw5zH2dgovEsGkpapzNSq7XY91KP2v+JJ1iTT5iUP58Ncb2QhO3T+XWcJhAxwPn
         gYor6WyWWVLdm0A/hU7ETCiq7QRwHvyTgDWc4WBUGYBmOZxtwJWEgBIy2yDvlinFAc18
         Y/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405037; x=1790009837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL8RwUf/cYtMAICbILIWEvYNZJnqZvkmMoFZxOMHTyE=;
        b=K8IIDmeZCX9pKPuXwor8ox0Ej1GH8RfGSr/kIHmpYS77L3L9RlCBdf2xp3FVqBSdw8
         6B3+aJ7ECiTUGn7pAvyGeQrVnwVJI1nvFJXpw7YwJcvRal/0RpaXHpqVLzqwMM+WWU1K
         uuziJ3eGU7xXKi7MlGHO8kMODY7naguecc8EVBJLVtaBXltwslBA822wE4Sl83YF+UC7
         j9GqlrjSQRjXsUX8kZlhqcU9Y2JMWDiF4UZy1jSn6btvAAPjIFdco63ZhGmlT8OnRHPT
         OebZNtTMFP0Mm+1m7ce63GsYsQRwJ1G5WK2sMhI3k+VbeO1HpSRxVJdyXKCnyjX9Mo7X
         W/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzaybkAT+1a7RJw8Fu71IN5J6fcNtu1L4e3NY4rTWuDv1p+xI7krK6wMOOt3X5PPeRePvzfxi8v/4hZEZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDoT50ek7MsZh4u1izsO5DMxPC5eXw6Wp3YiL0taInJTI+BU1/
	J8phlNxvEtcrLEamC9UDohEJz4OvzdU94DaAm8x87wR38IEHXHzK3mIT
X-Gm-Gg: AYBFou36vs6ffaPCqX8PUcXpQ3XCDwVYQlom/FhuDeozwLBakYnYFXZWucRcM1xa65Z
	Br1BRHat8ihmWxg0C3b+82VpjY0/01nnkVguxfveX2bWCYlaucfc/vpfZtU+Q+K1zkeQaYJYPfM
	L/UfdQylJvADq+V+vt2QhXNFBjn+J1lJhniTFbS0ICOTq3LISKCk8jI1Qqwos8knkFa8oAwJ5Ks
	n5uPcqru0ochVLoRPrEtv5YgpOPDFJcPv4Jtjzxa3DbArNAHjKKRmISMm7/7PD+Oa3H0EGNmTXt
	+iKD+2FKUTjv2zNgOuvu6x+a+d0vHatxcs8Tv7A2dfttty2YUEsLGcA19YRJF0uRZLxkjJSKd1W
	n47nCK2/okY6RWUCiKLli2waW9hjdJuggpD6RqygicEwWiQYhJnwycOUK3pZnbVYFoURBnpdPrv
	czW5nWyqHzbqvBZFA00d/Amb59LMTgqG0XFxLQAp1Ld70j52E=
X-Received: by 2002:a17:907:3fa3:b0:c29:3d25:15fc with SMTP id a640c23a62f3a-c29c8b91192mr20436766b.18.1789405036895;
        Mon, 14 Sep 2026 09:57:16 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296605c2bbsm452079766b.24.2026.09.14.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:57:16 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 14 Sep 2026 18:57:14 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH 1/3] mm/vmalloc: group xa_init with vbq field
 initializations
Message-ID: <aqgnahEAk7GAGi-g@milan>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-1-526f68559706@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-vmalloc_study-v1-1-526f68559706@linux.dev>

On Mon, Sep 14, 2026 at 11:34:00AM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Move xa_init() next to the other vbq field initializations instead of
> after the unrelated vfree_deferred setup.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 859e6d2d57a3..117483dd048c 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5585,10 +5585,11 @@ void __init vmalloc_init(void)
>  		vbq = &per_cpu(vmap_block_queue, i);
>  		spin_lock_init(&vbq->lock);
>  		INIT_LIST_HEAD(&vbq->free);
> +		xa_init(&vbq->vmap_blocks);
> +
>  		p = &per_cpu(vfree_deferred, i);
>  		init_llist_head(&p->list);
>  		INIT_WORK(&p->wq, delayed_vfree_work);
> -		xa_init(&vbq->vmap_blocks);
>  	}
>  
>  	/*
> 
> -- 
> 2.25.1
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
