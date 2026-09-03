Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10494247280
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403605; cv=none; b=GGReK5KDsGaOaO8Hlw9ffhdDQ+dgehyXHeba7FBTEYon+HFNVRAsKLuw5EIZhqsAG6p2ux0bOdom3rArWnRacRD/GMu/3sJd6hhnGsbN6dS0drYwSqdvb5S/W6DruXWCTsqPvLETwFtrAL6lUZrd4Hx80LleR7tSZ8ubys9h4aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403605; c=relaxed/simple;
	bh=9/cCQ89DY4ZjsYq5qL5PmjiRT3dPTdg8k/Chlfmt4mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nIqOTWbna7mOIEKx6lVSCRyPmn53Rzh5fH9PSr27qY+qq6+GFl85zPNaj1zpHZ3s8qkhsHYHhmPKnH6NcAARs3pcrxx5NwWGIyi8Z8GPdGA8UgeyZKX3YVSfMdazkbNLzUirJIMTLyFDS0w/lxQa75AHWYiJshWzBvsp1LOIXns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knSx/mh9; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knSx/mh9"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so250132a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788403603; x=1789008403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XrinlxSyjlgA1CHOv7AAT+CQFAvBKLOzmbqNTrYOST8=;
        b=knSx/mh9GtLrlmGq4ZpDc/MOzzNZz2mux8b/RLeTMy737YjsH3AyRJzuyVaIXhPoem
         FIlM/3cAPqkn2iPlw8jKKBbQQx/zVzKDh0y3uAeJH2c105RDb4UvSsGET+hUfaOAwhrB
         k83jeclR50iBU0n+eTTQWwWU8dThRz7Y0mFu6Kn0IvRxLta//psLMz40MZcc+yJ0Ul2a
         LutdiVngOIQHoJZvMfHUmNjZUnPMR2hrrMbheZqNh5XnSi8x3J7hMiOmwMcHq2iHOEar
         G0/xsX9Cl+9qB6LymWqlfqlsxJ6Okml4BH7f3WTC58+Gb9uJYjMEJT5RP27rGPjXmu4R
         pwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788403603; x=1789008403;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrinlxSyjlgA1CHOv7AAT+CQFAvBKLOzmbqNTrYOST8=;
        b=LQaVAYEW6ZiiOZQTWi/3ZyW3aajzrmAlYoakJCWIX6TCLs3V+xm1KJhPaFCssWDYpS
         04PEWZaCYxXaMbsusRqbielnigylvyYa+QGLqpvTcRnBXNbmE2qGLZnUonasyAukTB4L
         xiFyyDBGBZsrXbpri2AUz0Gfg9l6HctiHi0vfVkdU44rSqNvwe+GBSpMrPiAIPc/56LF
         Yfx977XggP9wuKCtRTEC5awl2P8bYiSt8n8rB10Woj0bTOBYoISHDWA/UCI2FlcSQhA3
         fVCkZ44RPacUjjZRSHigcnlPu3VJCdtUT0sUnMcMV+LKObha2X478ayi1qJH3l06b7V9
         hw2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzvH2dmtkopCFzIEtvzYeCq/JN5DLgRgyAWPb3S5aApAYvaK7rfzXgO8R5qMf2ldGn+pVhWi1NNftDEiY=@vger.kernel.org
X-Gm-Message-State: AFuF++lJVr0+dNqffR2cxOXJsxstjICAhg00l2nqZbatU2eiLKAOXE2m
	jV/v5LqfsrfsvBjpkDfBH6f5MnkDwKBXk3DUpgWbT55O4nNO3RSeQ3Z8
X-Gm-Gg: AYBFou1qjtASU6kYuHksxF0Fcsac/KbU5meeQEB3OM+BnopOcmS834t9ARamg3oRaRF
	e2PBwq/Gy80kyKSs2Sk4k8zCqb5O4HPeFGsUEd7bn3dRqEyrwsLkWIORmElF8yxFB47xqTfYOLe
	VUHq0g2Gdr2kmkhpiKV92FHEzS0Oy0map0irfUIMkptRtzDreYdsCY9ktmihm6+ITznamaK/Y4d
	tzU1Q+eogSzmOVc9TIuEgEHQQBOaiUCIGv+xJfWF+cSeeIRC8X+9ySrjlFp7DlEdpsKp+UgfyTU
	vXTa/UOBytAaQ62llr2dOPweZ/Ha+4i/MjLkQOvCixWxT5d7q+eppsasPsY34rx1hX6qRFB6YIr
	xVxgYwIWz4urZAj5GY+MGmAnM1nuv09zjE36Aj7K13up1LGSsqdKSM8Y9Bxe90kHZNSqoxmZTIZ
	UPwLnOmIhoLNTB0GCwpkaz7us2ze0YPjQ6aR3ZOk4CtLgPduACYtuBwq+GfXOEoYqZKnekWxv9q
	Y7RrSooTm81sst0cmN9yfb/EAelLwGgLDelsCAyZYwrOte4k/bwvgVAn0p3qWPqGvv0tI9c8tZz
	EsFLaA==
X-Received: by 2002:a17:90b:4cc4:b0:398:bada:838b with SMTP id 98e67ed59e1d1-39aee277bc5mr8953822a91.6.1788403603107;
        Wed, 02 Sep 2026 19:46:43 -0700 (PDT)
Received: from hz-11197422 ([132.147.97.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm2177685a91.1.2026.09.02.19.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:46:42 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: zhangbo0325@gmail.com
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make __zone_watermark_ok() mTHP-aware
Date: Thu,  3 Sep 2026 10:46:03 +0800
Message-ID: <20260903024629.574484-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825043833.2659350-5-zhangbo56@xiaomi.com>
References: <20260825043833.2659350-5-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 25, 2026 at 12:38:33PM +0800, Bo Zhang wrote:
>To improve the mTHP allocation success rate and reduce
>fragmentation over time, introduce
>zone_effective_free_pages() for mTHP-aware free page accounting.
>
>Refactor the free page counting logic used by pgdat_balanced() and
>compaction_suit_allocation_order() into a shared helper function
>zone_effective_free_pages().
>
>The function selects the appropriate free page metric based on context:
>- defrag_mode: use NR_FREE_PAGES_BLOCKS (whole pageblock accounting)
>- mTHP always-enabled: count only free pages in buddy blocks >= the
>  minimum always-enabled mTHP order, since smaller fragments cannot
>  satisfy mTHP allocations
>- otherwise: use NR_FREE_PAGES
>
>Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
>---
> mm/compaction.c | 38 ++++++++++++++++++++++++++++++++++----
> mm/internal.h   |  3 +++
> mm/vmscan.c     | 23 +++++------------------
> 3 files changed, 42 insertions(+), 22 deletions(-)
>
>diff --git a/mm/compaction.c b/mm/compaction.c
>index 15b92475562a..29be72597415 100644
>--- a/mm/compaction.c
>+++ b/mm/compaction.c
>@@ -2528,6 +2528,38 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
> 	return false;
> }
> 
>+/**
>+ * zone_effective_free_pages - get free pages relevant to allocation order
>+ * @zone:       target zone
>+ * @order:      allocation order
>+ * @use_blocks: if true, use NR_FREE_PAGES_BLOCKS
>+ *
>+ * In defrag_mode, watermarks must be met in whole blocks to avoid
>+ * polluting allocator fallbacks. kswapd usually cannot accomplish
>+ * this on its own and needs kcompactd support.
>+ *
>+ * When mTHP always-enabled orders are configured, count only free pages
>+ * in blocks >= min mTHP order, as smaller fragments cannot satisfy mTHP
>+ * allocations.
>+ */
>+unsigned long zone_effective_free_pages(struct zone *zone,
>+					unsigned int order,
>+					bool use_blocks)
>+{
>+	if (use_blocks)
>+		return zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
>+
>+	if (READ_ONCE(huge_anon_orders_always) && order == compact_hpage_order()) {
>+		unsigned long free_pages = 0;
>+
>+		for (int o = order; o < NR_PAGE_ORDERS; o++)
>+			free_pages += zone->free_area[o].nr_free << o;
>+		return free_pages;
>+	}
>+
>+	return zone_page_state(zone, NR_FREE_PAGES);
>+}
>+
> /*
>  * Should we do compaction for target allocation order.
>  * Return COMPACT_SUCCESS if allocation for target order can be already
>@@ -2543,10 +2575,8 @@ compaction_suit_allocation_order(struct zone *zone, unsigned int order,
> 	unsigned long free_pages;
> 	unsigned long watermark;
> 
>-	if (kcompactd && defrag_mode)
>-		free_pages = zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
>-	else
>-		free_pages = zone_page_state(zone, NR_FREE_PAGES);
>+	free_pages = zone_effective_free_pages(zone, order,
>+					       kcompactd && defrag_mode);
> 
> 	watermark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
> 	if (__zone_watermark_ok(zone, order, watermark, highest_zoneidx,
>diff --git a/mm/internal.h b/mm/internal.h
>index 38b1165212c9..14bb9543879b 100644
>--- a/mm/internal.h
>+++ b/mm/internal.h
>@@ -1654,4 +1654,7 @@ static inline bool can_spin_trylock(void)
> 	return true;
> }
> 
>+unsigned long zone_effective_free_pages(struct zone *zone,
>+					unsigned int order,
>+					bool use_blocks);
> #endif	/* __MM_INTERNAL_H */
>diff --git a/mm/vmscan.c b/mm/vmscan.c
>index c1404a59523d..a419a2c2fca4 100644
>--- a/mm/vmscan.c
>+++ b/mm/vmscan.c
>@@ -6966,7 +6966,6 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
> 	 * meet watermarks.
> 	 */
> 	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
>-		enum zone_stat_item item;
> 		unsigned long free_pages;
> 
> 		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
>@@ -6974,21 +6973,6 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
> 		else
> 			mark = high_wmark_pages(zone);
> 
>-		/*
>-		 * In defrag_mode, watermarks must be met in whole
>-		 * blocks to avoid polluting allocator fallbacks.
>-		 *
>-		 * However, kswapd usually cannot accomplish this on
>-		 * its own and needs kcompactd support. Once it's
>-		 * reclaimed a compaction gap, and kswapd_shrink_node
>-		 * has dropped order, simply ensure there are enough
>-		 * base pages for compaction, wake kcompactd & sleep.
>-		 */
>-		if (defrag_mode && order)
>-			item = NR_FREE_PAGES_BLOCKS;
>-		else
>-			item = NR_FREE_PAGES;
>-
> 		/*
> 		 * When there is a high number of CPUs in the system,
> 		 * the cumulative error from the vmstat per-cpu cache
>@@ -7001,9 +6985,12 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
> 		 * counter won't actually be per-cpu cached. But keep
> 		 * things simple for now; revisit when somebody cares.
> 		 */
>-		free_pages = zone_page_state(zone, item);
>+		free_pages = zone_effective_free_pages(zone, order,
>+						       defrag_mode & order);

Hi Bo,

  zone_effective_free_pages(zone, order, defrag_mode & order);

"&" should be "&&". defrag_mode is 0 or 1, so this is just order & 1:
works for order-3 by accident, always 0 for order-2.

Same for the zone_page_state_snapshot() call below.

Thanks,
Xueyuan

> 		if (zone->percpu_drift_mark && free_pages < zone->percpu_drift_mark)
>-			free_pages = zone_page_state_snapshot(zone, item);
>+			free_pages = zone_page_state_snapshot(zone,
>+					defrag_mode & order ?
>+					NR_FREE_PAGES_BLOCKS : NR_FREE_PAGES);
> 
> 		if (__zone_watermark_ok(zone, order, mark, highest_zoneidx,
> 					0, free_pages))
>-- 
>2.34.1
>
>

