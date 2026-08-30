Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F63469FC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075953; cv=none; b=ALTdr+dld8MIHvmTGUCEhG4JslH0t9AvZ91sFF8ZS8rbQKkDJ84CTEhsKQi2nN1PaPh/gPo0z0alDrhlzjUzTvRipa/iu8SHztwjg3K2YntLv9EdBUc8/RicxGe0I5DaFzGE9bOxSlr1SWXeMT9c0Ynkr7+E8VqiQ+/zbRsckOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075953; c=relaxed/simple;
	bh=BIsFN2OMfNgSXZQDDNLxwuWwyGkFz0HipWj/OiqVWBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aE/Z75OBNkFA7UEm+EwYPUQFk8/K92axM08OeIWQfoOj9ScZa58QOJLUrZAxiHRJ/5U2Oz8uCE+iiuDrqPRXEDV2yNLpLgF0PcsFvLuuBMWRPEYp8l/MpL23WvggtpG6srew6dtePGoLlyYxR0CXWKLJgvP5ECLyglnYDIkobl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDGSAgCb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDGSAgCb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d032846c95so25809125ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075949; x=1788680749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kD6ccXy2Hx5CE4BbOgtcR+UVtjcpOs3L5NimT1wEmAU=;
        b=XDGSAgCbEdrWukUWVkdcSw8McPBvJ2uHWHpJg6pp/5pNJX3TCFwycHNKixBAOkRXp4
         xHmHtE8ptcz5Zj9qwxFot0wqAphKxa7SRAQDcDWCk/yq2J8+WcnLnA/o3Q/mJoPq6MLw
         MFA6nEWoE1ieiv2jGsX1fZ6hF+b+4MxrVatG3UnybBQu7e1W4HHo2zkYliWsWXfSSIIf
         gaz4AD0PelWv4JKq8LKiA6+qqNwMS62OoQeqKd3y99s0NZSRjIsUM0WoHGRJuGviTvZp
         ARbTZKOeOYlULawwwgPxwa1XXrqmenZxn7aSf/Jg+Fk998Pi5bgSo2HR0H1/k0HGGqF/
         uShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075949; x=1788680749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kD6ccXy2Hx5CE4BbOgtcR+UVtjcpOs3L5NimT1wEmAU=;
        b=H+TweS7RDAWwijF/wkwoJjm2r7JpUMsSr4AMouXKMfkigbqRsTiYAviXyyzoWBmacP
         ir5Wn0bS23CHK0mXKDeMvvtLP4c8tv39DYjy9NBEVtSfbWzwxkNIfnOts7u8zBOYqmrZ
         +0G7EE/DW8s2vCKUpg09YE7XKYB/PjfAW64aloATQ6xGEPUx4ghCA8oMCLvewh0lY0NW
         fR83Tsxdxdw3k53iRYWs0Pfc5WrZEPUMvGpIPgzcCHVueEKNfz4GfUwaxTUcKzIf0IU1
         +RZaGpat/CciBPEi9eRlwHOFbuoEddD0fAc+Nkhcd2hfCi0UE/s9DzKjJB+spfdf8lml
         5Jcw==
X-Forwarded-Encrypted: i=1; AKwUvBwXYWfXmwoFFUu/oNOGyf/WbKQ/TdphEzdczbGuVJO9tlUijmheX6JaHzsVA9j6UEHT+AaGnOUt3cuR2YM=@vger.kernel.org
X-Gm-Message-State: AFuF++m+KWPu1HE2NHSR+gFC52biCH1c2Zl0IsyXwFvkyFjwqBUN5nNG
	aNbmCYFoCFkacwrQke4stuN2Wh6JGpUTB71yUO4CfKBQ+TNMJb3uT332
X-Gm-Gg: AYBFou1LPoU8cBoTkJuW4wFHnvRPEWlkURTbHaUSyPNuSTsmVhzY5ukOhH5jETaIp3a
	AOrCBKtsT4wMROd9LrjQZZUNvtIFoJfENBm8dUxa0bMGPS9M8nFEoCC1LmslX6YDnMJWzmbOyQ3
	JG9kwv2YsaeuEevifPGL90+T34cZ0qaHEs/l14VfNCLgnmfnztELq1cxhQ9nSwL92qhZ2LLdvDh
	W2Z/d5JIPKE3RyN3iIiu44RWLxELAZigNJ3/cnsBldeSTnr9wAeeMKfc8kB2AQeE5tc5ng84LM1
	ZMBH643krkxjG5awamddtM+323V0eUtAU51N/0PAoa/9o66oL9b2hNOkQvyLaFnBxhwno1rzm+z
	mnPKjqhiEj5mh0hbpFTYaxU/IKOkKqM09efzvrYnWGGk+aCQo1lOp2Dc3o3A9nFzWRkeGcgtIKj
	oOT3G4usQbDgje3dEJ4Tx22mi1hwizdqvpBv9RgxPLFkCNxzNKsN1E193YuWlO4xGHRNYXRW9uC
	8q/DnXfErqtjAdW1HSIPyuvzGfFPJPTt1MmhFQ=
X-Received: by 2002:a17:903:390f:b0:2d8:d4d1:313b with SMTP id d9443c01a7336-2d8d4d14bcdmr164252015ad.18.1788075948700;
        Sun, 30 Aug 2026 00:45:48 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988cabasm20525495ad.65.2026.08.30.00.45.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:45:48 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 7/7] mm/mglru: batch move folios to the second-oldest gen's LRU
Date: Sun, 30 Aug 2026 15:45:17 +0800
Message-ID: <20260830074531.79967-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-8-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-8-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 07:47:04 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> Detect folios that need to move from the oldest generation to
> the second-oldest generation, and batch-move them together.
> This can significantly reduce the sys time of inc_min_seq(),
> especially when the other type is significantly behind the
> preferred type.
>
> Assisted-by: gemini:gemini-3.6-flash
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmscan.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 17524e96fe64..2b6f3f05ce60 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3931,6 +3931,19 @@ static void clear_mm_walk(void)
>  		kfree(walk);
>  }
>
> +static inline void flush_lru_batch(struct list_head *head, struct list_head **batch_end,
> +				   struct list_head *dst)
> +{
> +	LIST_HEAD(movable);
> +
> +	if (!*batch_end)
> +		return;
> +
> +	list_cut_position(&movable, head, *batch_end);
> +	list_splice_tail_init(&movable, dst);
> +	*batch_end = NULL;
> +}

This is safe because `batch_end` always marks a contiguous prefix of `head`:
the loop walks from head to tail and flushes the prefix before moving any folio
that was already promoted by aging.

> +
>  static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  {
>  	int zone;
> @@ -3953,8 +3966,10 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  			lru_gen_is_active(lruvec, target_gen));
>  	/* prevent cold/hot inversion if the type is evictable */
>  	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
> +		struct list_head *target_list = &lrugen->folios[target_gen][type][zone];
>  		struct list_head *head = &lrugen->folios[old_gen][type][zone];
>  		struct list_head *pos = head->next;
> +		struct list_head *batch_end = NULL;
>  		long delta = 0;
>
>  		while (pos != head) {
> @@ -3974,7 +3989,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
>  			if (gen_increased) {
>  				delta += nr_pages;
> -				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
> +				batch_end = &folio->lru;
>
>  				/* don't count the workingset being lazily promoted */
>  				if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
> @@ -3984,11 +3999,14 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  						   lrugen->protected[hist][type][tier] + nr_pages);
>  				}
>  			} else {
> +				flush_lru_batch(head, &batch_end, target_list);
>  				list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
>  			}
>  			if (!--remaining)
>  				break;
>  		}
> +		flush_lru_batch(head, &batch_end, target_list);

The flush in the `else` keeps every already-promoted folio ahead of the
normal old-to-target batch. This final flush also covers the batch-limit exit
before the counters are updated and the lock can be dropped.

> +
>  		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
>  			   lrugen->nr_pages[old_gen][type][zone] - delta);
>  		WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> --
> 2.34.1

The moved list entries and `delta` therefore cover the same folios, while the
relative order of each normal-folio run is preserved. Looks good to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
