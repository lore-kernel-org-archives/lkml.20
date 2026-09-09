Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BCF485CFB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947560; cv=none; b=t/VyqtTJHdoV8mUo3T8Oor02MMTKOt2OZdTdYMDIgJolofIG2ahYAzBduY7KKKBmgKope24RVylMj0bRfYVqEe0+lYXE1K0taFoT+PM1292LZTw5SQv/yBjdgXLFKp8pLpVtcVBBJ+4fsVX9E1Sl5HOhfmtDecOaGifQqvuOhfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947560; c=relaxed/simple;
	bh=79ynaHlD2ryUW05tMq9o7KmH45ZnkMpA91fwZbxdotE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSWNkvaR7ryxxcX3mPmVtjeeNk7gtr+ifzIATZh3tLtxms619Z0pIYbVbEjNwTtYilrtMGz8NIizXq/bMeSZd4K2HsOMN+CZkT/zY6Shy4iPDMo3TMuJMU3L+31rue0zAsLCvYx8w2JMiP+KpUalsF2Z7JhUm3XFL01cVdsmHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljbYDde4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljbYDde4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso35784695ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788947558; x=1789552358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39uM4LNN7batCoHFZc/UGv4aRojKefGSgFxZUzAHFw8=;
        b=ljbYDde4L8QNlpOPrMyWJi9L3rPLodvpCD9yGb237bsa4aKOn4CuaQ1f7lENtfNkqk
         ZjsHgF3vqgLkAkRrUx5UPGy/+BOx9n9FyxFs/XhrF3nUNLdYfkBd3PGKgCloVDHb30Ac
         yY6XbE+YKGg7tOVj41GqPWBO2O4BY9QzIiy4Kwi14XjL7P7w9m6Xs75TmFGYvDifj3TB
         SHRwfNDQ51oXuwMGG6yQ7fg3y8gHfI4qGaDzKVAZ8t5QntgojjZcs86OA2ZhgVeirsG2
         Q/TR3kVj0Pz+mlgACf65mWcYTple8DbR0GWCxQKeC2QULC+5fYCrhmLZgbqRdSKmp96y
         U5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947558; x=1789552358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39uM4LNN7batCoHFZc/UGv4aRojKefGSgFxZUzAHFw8=;
        b=Ceb+pYprDwQk3g08wiwmE9Yec0HQzJ5L1ckOyHTVod2HTsTdiXkI2KTNFzRaH0IP37
         C7N8K0y0nVENGDsVeKUZnarMqqHqxw6C7IhmgZtdMTeCY9wOq+zGfxgnPNn9rUhN9TzF
         eM0jVDXJx95nqzeO0iuvp+a9PlZli+nuuWwGT6LrUJK4qgBMPyT02F3SL0AtZqknYaga
         C63/kskZjSRqaaQWd1dnv/u9YQqUnxOBwrXZFvCS6Wa/8P3HQ/nR9R9sU2w2AbgcnsXd
         bZ0mbRlVYHDAVt8+vYsqVbAEHuoFdj0xwcNcxIOVaZOAeMspMmlYvkwua1HkYogSIqbZ
         puOA==
X-Forwarded-Encrypted: i=1; AKwUvBwMhaHa1/8UEyVNLGGEfni0yqIzdUJlCe7hfL7cSggb0/xA3i9mL665XV1xB6wJRSt3tJbyUcPGlMo0cdw=@vger.kernel.org
X-Gm-Message-State: AFuF++n2QIK7N2G5Cuz2Q+Js0tlvTrsKwpzmZCCYL7+HpXETyk9BEt3u
	JCNI7F/sfNhdacunm1lAgb4eFW3v/HKpjDdt3yORfxXjW7yv4zyVZsAI
X-Gm-Gg: AYBFou167Ph0hf+Lm+N93+cgnErzRJg94YRIAyeGbwBbJAaoERUNF9CChkeaGYibU1A
	psGGgPaCCT6aBhwAGnVJfcpiqADjF4Bu3eIjm7/ANLBn+mAObrf6ma6Dg5b0z9dU3T6CWPJIVep
	DcwwDXb5Ypx1r62tLUHw2SRmAz42W+sc4/uaiRmg6buCqfcR7MLrzZ7vBGq2NEiLqtoyi6pl08A
	w8Pi+7XtiCVs/9I9PDC4oBT+cwjabwlfdnSXxiztL184uN+NtL2IiJQ9uaKGrJQdvSKT8AvCnbn
	nxwNpwzq33sU3t053eBnHv2e2GphhtH3GyLxBtlv7RSbwENmUJ+h/MP2++l3QnQwa+Ce41I+yKJ
	9wRGK5Qk29YqDhw9mraxbWnNArQ5Y2YEzUkUTFKvQB5+MUy7nvCLowYfRTrZdxsjl8cCSv6kgpS
	lp26bH3PGngaQuSt5XcCGhVQcWUJJrEhwAi7ELhbf51osn8P0/lAJzjqbsNG+HVmV4znzDXA==
X-Received: by 2002:a17:903:1a28:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2db31d514ebmr362436915ad.22.1788947557277;
        Wed, 09 Sep 2026 02:52:37 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959954sm70023065ad.27.2026.09.09.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:52:36 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: john <love_goo@163.com>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	akpm@linux-foundation.org,
	liuye@kylinos.cn,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	mgorman@techsingularity.net,
	yang@os.amperecomputing.com,
	zhangqiuhao@huawei.com,
	wangkefeng.wang@huawei.com,
	mawupeng1@huwei.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wupeng Ma <mawupeng1@huawei.com>
Subject: Re: [PATCH resend 1/2] mm: vmscan: charge isolate overshoot against scan quota
Date: Wed,  9 Sep 2026 17:52:22 +0800
Message-ID: <20260909095227.2522994-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901084706.3784449-2-love_goo@163.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 16:47:05 +0800 john <love_goo@163.com> wrote:

> From: Wupeng Ma <mawupeng1@huawei.com>
> 
> shrink_lruvec() charges the per-LRU budget nr[lru] in SWAP_CLUSTER_MAX
> (32) chunks, but isolate_lru_folios() may scan far more per call: a
> large folio can jump scan by many pages at once (a PMD-sized folio
> counts 512), and a zone-ineligible LRU walks the whole list without
> feeding scan back.  The overshoot is never refunded, so shrink_lruvec()
> keeps charging only 32 per round and rescans the same folios.
> 
> Have isolate_lru_folios() record its scanned count in sc->nr_isolate_scanned
> and let shrink_lruvec() subtract the overshoot from the remaining quota so
> the next round skips already-scanned folios.  The field is reset to 0

I'm not sure this is true across shrink_lruvec() invocations.

isolate_lru_folios() splices folios_skipped back to the head of the LRU, 
while get_scan_count() provides a fresh nr[lru] each time shrink_lruvec() 
is entered. Thus, charging sc->nr_isolate_scanned against nr[lru] appears 
to prevent repeated 32-page scans within the same shrink_lruvec() 
invocation, but the same ineligible folios can still be encountered 
again by a subsequent invocation.

Is the intended fix specifically to avoid repeated scanning within one 
shrink_lruvec() invocation, or is there another mechanism that prevents 
these skipped folios from being rescanned by a subsequent shrink_lruvec() 
invocation?

Thanks,
KunWu

> before each shrink_list() call, as shrink_list() only reaches
> isolate_lru_folios() on some paths (active + skipped_deactivate,
> too_many_isolated stall bail out early); a stale value would otherwise
> be charged.  The budget floor stays nr_to_scan via max() so an empty
> LRU (sc->nr_isolate_scanned = 0) still advances and cannot deadlock.
> 
> Co-developed-by: Qiuhao Zhang <zhangqiuhao@huawei.com>
> Signed-off-by: Qiuhao Zhang <zhangqiuhao@huawei.com>
> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
> ---
>  mm/vmscan.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f11491ee9ed5c..823af9e86efd3 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -166,6 +166,9 @@ struct scan_control {
>  	/* Incremented by the number of inactive pages that were scanned */
>  	unsigned long nr_scanned;
>  
> +	/* Number of pages that were scanned from isolate_lru_folios() */
> +	unsigned long nr_isolate_scanned;
> +
>  	/* Number of pages freed so far during a call to shrink_zones() */
>  	unsigned long nr_reclaimed;
>  
> @@ -1670,7 +1673,6 @@ static __always_inline void update_lru_sizes(struct lruvec *lruvec,
>   * @nr_to_scan:	The number of eligible pages to look through on the list.
>   * @lruvec:	The LRU vector to pull pages from.
>   * @dst:	The temp list to put pages on to.
> - * @nr_scanned:	The number of pages that were scanned.
>   * @sc:		The scan_control struct for this reclaim session
>   * @lru:	LRU list id for isolating
>   *
> @@ -1678,8 +1680,7 @@ static __always_inline void update_lru_sizes(struct lruvec *lruvec,
>   */
>  static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
>  		struct lruvec *lruvec, struct list_head *dst,
> -		unsigned long *nr_scanned, struct scan_control *sc,
> -		enum lru_list lru)
> +		struct scan_control *sc, enum lru_list lru)
>  {
>  	struct list_head *src = &lruvec->lists[lru];
>  	unsigned long nr_taken = 0;
> @@ -1763,7 +1764,7 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
>  			skipped += nr_skipped[zid];
>  		}
>  	}
> -	*nr_scanned = total_scan;
> +	sc->nr_isolate_scanned = total_scan;
>  	trace_mm_vmscan_lru_isolate(sc->reclaim_idx, sc->order, nr_to_scan,
>  				    total_scan, skipped, nr_taken, lru);
>  	update_lru_sizes(lruvec, lru, nr_zone_taken);
> @@ -2011,8 +2012,8 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
>  
>  	lruvec_lock_irq(lruvec);
>  
> -	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &folio_list,
> -				     &nr_scanned, sc, lru);
> +	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &folio_list, sc, lru);
> +	nr_scanned = sc->nr_isolate_scanned;
>  
>  	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, nr_taken);
>  	item = PGSCAN_KSWAPD + reclaimer_offset(sc);
> @@ -2068,7 +2069,6 @@ static void shrink_active_list(unsigned long nr_to_scan,
>  			       enum lru_list lru)
>  {
>  	unsigned long nr_taken;
> -	unsigned long nr_scanned;
>  	vma_flags_t vma_flags;
>  	LIST_HEAD(l_hold);	/* The folios which were snipped off */
>  	LIST_HEAD(l_active);
> @@ -2082,12 +2082,11 @@ static void shrink_active_list(unsigned long nr_to_scan,
>  
>  	lruvec_lock_irq(lruvec);
>  
> -	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &l_hold,
> -				     &nr_scanned, sc, lru);
> +	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &l_hold, sc, lru);
>  
>  	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, nr_taken);
>  
> -	mod_lruvec_state(lruvec, PGREFILL, nr_scanned);
> +	mod_lruvec_state(lruvec, PGREFILL, sc->nr_isolate_scanned);
>  
>  	lruvec_unlock_irq(lruvec);
>  
> @@ -6013,10 +6012,21 @@ static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>  		for_each_evictable_lru(lru) {
>  			if (nr[lru]) {
>  				nr_to_scan = min(nr[lru], SWAP_CLUSTER_MAX);
> -				nr[lru] -= nr_to_scan;
>  
> +				sc->nr_isolate_scanned = 0;
>  				nr_reclaimed += shrink_list(lru, nr_to_scan,
>  							    lruvec, sc);
> +				/*
> +				 * isolate_lru_folios() may scan far more
> +				 * than nr_to_scan when the LRU holds
> +				 * ineligible folios (zone-skip) or large
> +				 * folios. Charge that overshoot against the
> +				 * remaining quota (clamped by min() so it
> +				 * cannot go negative) so the next iteration
> +				 * does not rescan the same skipped folios.
> +				 */
> +				nr[lru] -= min(nr[lru],
> +					       max(nr_to_scan, sc->nr_isolate_scanned));
>  			}
>  		}
>  
> -- 
> 2.53.0
> 
> 

