Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222381;
	b=Lek4NGTTu+d4alZ5tThcn+V8WVIeexhP+HTtBt5R64cEEDPqCLZg8zQDsdPdmfNwr5lX
	 6FDEB9MzLaP2oAVrfadgoE4GqV1SplPy339Sd2g+pOqHT3NIxLSWJW0kABY7W2gce2aHd
	 4vbtA8teD7UCNYquvTaMFjNKphG7fw+kJBy/r5SMKGQ32R563YZw7IrCeDdIiSquaYWWf
	 QMsaKCYQugoaKMcvdPpRe62KSvdi4ebvi51fOBsdWYLBs9/JmaeaZ7d4RJgS/31mCoTzF
	 VA5eFV1dvPyio+xDuLUVo+5zK1p/4saeegmdUjjJe/VgsHxzOt7+sGXw9XmO6mHrkqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yLRMYXw2Xkw2pXty7UKH07C280BxIvWbV39DTe58Hq4=;
	b=vrVmGgwbIJ7/uZs81cqNzfenuknJ885lPs7S/BsT8Tvdl5Jnw6DrGIKcEBMmD/tX7ldi
	 lBCB6TnNHG/zEv/gOPd63SUCdg/lmZ9ZGwuPjVikAag8RbWF5fwBdsr1SOS8OETjzApDt
	 e+99euHBeQPxIRsIR+gNQW8YdK/DRYkUdsAs6uc7enrhH8WIuIOaaMXROy1lOc7TEvlob
	 wdxxxz8PeXnRn8UtnHfUxPa3TEHM9MvfEEIFaX8EQm1tvy4JpnLCyl/GNoGMet9dPSBAz
	 E52o8ZwS6hkFbICgtAgKIdaFco6eAL70s4aGLQMAbz7Qn+WplKtVLJPiGaYCEvKN95A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=npgrpJYQ;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6D60A2614
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B6D60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=npgrpJYQ
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b9e758c50so1502076d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222380; x=1793827180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLRMYXw2Xkw2pXty7UKH07C280BxIvWbV39DTe58Hq4=;
        b=npgrpJYQk4a7+IaieZ/tgLN4fusMS1HFm5k59Z46u+Ked18nWkaBSbvAdM4t/ENvQR
         dl7PlFulQSEEIyqyaWluc42gejloH9dCWCfFoSs+NLnKiTRV2IhlPey2JwTdW+OW4Yyj
         /ke5QkM3Ix3zxv1hdTxBSjpsD0/OWL7aJLdBo2yZhAkeqsyameasm0n8BBrD+6smNKu7
         rbrU86qohS7m3DKRI1Pwls74dWe8mJg0bzi9ULc/pUL2Vf3zyVL3tWggiaj0UghYelpJ
         clermy7X2+Y5wSMbKTSUhLFYkrk/Pe13EYf9LmCbBS2MsbkLypWtlEQ0i+RzoYmk8anJ
         cDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222380; x=1793827180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLRMYXw2Xkw2pXty7UKH07C280BxIvWbV39DTe58Hq4=;
        b=QhdBR5P58/L+Tf5Cw5VD5+jnxSiQV2EdolX+yzhW6i4PdkCZD9wAHWMZ4K17L4RjJk
         JPowsUgItNjaGeKbKton9+yScCJ0tfFrE+RBP0IDHABTMj77RRaQo1rPLS70OOItGVaC
         3KYw3Y18kUBFdVhPfBaku+qy/FNBAqsUs/3SMrd/rHCQGyIboX0SUfSWfTS3JHGn4S6m
         6ILTJyWcBvksnXEjlvcswx1ZGe+iK8BwDHWqVPEhYU4m4+xV7WxQp56ErJpa3zkVlWy6
         gd2R87aefPMPmVTxA7pVhRvrukTkngCF4e1axJr9DKD+ZVIikgZWdFdkqqrMY1Loo0VQ
         uRuw==
X-Gm-Message-State: AFq9FYJZh0jRtU55/XxSTgEYg4UyacqVGRZaiySJvZEOLIYsLyP7TvuY
	WUtiPnlEYzdnFTg0cjP6EjomXgvqYPNR5LEFwrejqwkwJx8MqVuyvV3nWWh5BGBGr2s=
X-Gm-Gg: AYBFou2JYUtGxmDfJz/3VRnOrRzkmF3Yr1pP0sfXdIGYvVdhMAJBk/gDmx5bFgFM9xU
	nckJhuuq3h4q+nJsyi7tKHEr2pDy1pbf0RUoibTpamzb2I2GhdNiL5OiHvqo/+LfIEc8R/xo5du
	5LAeADWSTZD+TNJxdRH5F/FIBZEngHzR5tsisQLR6a+/dUACCKX1gvQrANk2C4mjS16GlyyF2el
	RhO823K4TxzQQFHyqHFd/32dZ98CiGvxUSEBCwUNiV3W4BI8WOJphzX1dbTePUh6UnVaz4974qe
	Y4RczXZ9I9sel1lAY5DjJ7yHlORwOm+k7JbBvN2QPRsO46w6OEmjW9S74Mdn5rH8sIKBBCHnCAA
	sAgMivO8hjF4PdQ5XNOFH84NOPCh0LhvQNYhzUyEiURt4p4syBQLcJC4EdK/sw6M/sFvoN5ZYlj
	qwTxTXK30X9dH9ptxPO42cmkW8DjV0yMWg6DMQB43rCDHdnJfP4RuwMzozXZVtBlASBdKielJKU
	Qd1rCe5T0JefnUj4P8ky/e5g7RjHmR2Uh3jL8YKqyJj46Y+JP2v/WcD6c+QQg6XdZccWM8sLqJS
	qGGqQIhGWwIzCdZTeYNMKngVkRRlYy8jXFVfil9YHnOvuPGbVGMybHFGQWA+nyLAAo/UDEBNyVY
	+1qylr7XXjNRN6cI=
X-Received: by 2002:a05:6214:d86:b0:91c:7a4b:fb7c with SMTP id 6a1803df08f44-91c903f4427mr14649536d6.11.1793222380129;
        Wed, 28 Oct 2026 14:19:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:39 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 5/8] mm/page_alloc: retry allocations that raced with a zonelist rebuild
Date: Wed, 28 Oct 2026 17:19:27 -0400
Message-ID: <20261028211930.3504634-6-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Onlining the first block of a zone rebuilds every zonelist in place,
shifting the slots after the new zone.  The iterator approves a slot,
then the allocator loads the zone from it, so a GFP_KERNEL request can
land in ZONE_MOVABLE and a nodemask request on a node outside its mask:

  CPU 0                             CPU 1
  prepare_alloc_pages()
    first_zones_zonelist(nodemask {1})
      slot 0 (NORMAL1) approved
                                    online_pages()
                                      build_all_zonelists()
                                        [NORMAL1, NORMAL2, ...]
                                        -> [MOVABLE1, NORMAL1, ...]
  get_page_from_freelist()
    zone = zonelist_zone(slot 0)    /* MOVABLE1 */
    allocates from MOVABLE1

zonelist_update_seq detects the rebuild, but only the slowpath's failure
exits check it.

Check it whenever an allocation succeeds too, and if it changed, free
the page and retry, as the memcg charge failure path does.  Eligible
pages are dropped as well: zonelists only change when memory comes or
goes, and a retry is simpler than rechecking the page.

Freeing the page does not undo a block the allocation claimed.  A
GFP_KERNEL request that lands in a fresh ZONE_MOVABLE converts a free
block to MIGRATE_UNMOVABLE, which stays until the zone's movable free
list runs out and a movable allocation takes it back.

The fast and bulk paths read the seqlock's raw seqcount without waiting:
an ALLOC_NOLOCK caller can be an NMI that interrupted the writer, and on
PREEMPT_RT the seqlock accessor takes the spinlock.  A sample taken
mid-write costs a retry, or NULL under ALLOC_NOLOCK.
check_retry_zonelist() returns 0 when compiled out, so a backport
without the hot-add change stays harmless.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 24106c881ec2..33aab9deaaa1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4419,12 +4419,25 @@ static unsigned int zonelist_iter_begin(void)
 	return 0;
 }
 
+/*
+ * Never wait for the writer, which an ALLOC_NOLOCK caller in NMI may have
+ * interrupted. Read the raw seqcount: on PREEMPT_RT the seqlock accessor takes
+ * the spinlock while a write is in progress.
+ */
+static unsigned int zonelist_iter_sample(void)
+{
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		return raw_seqcount_begin(&zonelist_update_seq.seqcount.seqcount);
+
+	return 0;
+}
+
 static unsigned int check_retry_zonelist(unsigned int seq)
 {
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqretry(&zonelist_update_seq, seq);
 
-	return seq;
+	return 0;
 }
 
 /* Perform direct synchronous page reclaim */
@@ -5115,6 +5128,12 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	warn_alloc(gfp_mask, ac->nodemask,
 			"page allocation failure: order:%u", order);
 got_pg:
+	/* A rebuild during the walk may have handed out an ineligible zone. */
+	if (page && check_retry_zonelist(zonelist_iter_cookie)) {
+		__free_frozen_pages(page, order, FPI_NONE);
+		page = NULL;
+		goto restart;
+	}
 	return page;
 }
 
@@ -5199,6 +5218,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	struct list_head *pcp_list;
 	struct alloc_context ac;
 	unsigned int alloc_flags = ALLOC_WMARK_LOW;
+	unsigned int zonelist_iter_cookie;
 	int nr_populated = 0, nr_account = 0;
 
 	/*
@@ -5239,6 +5259,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
 	gfp &= gfp_allowed_mask;
 	gfp = current_gfp_context(gfp);
+	zonelist_iter_cookie = zonelist_iter_sample();
 	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp, &alloc_flags))
 		goto out;
 
@@ -5288,6 +5309,10 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	if (unlikely(!zone))
 		goto failed;
 
+	/* The zone was chosen from a zonelist that a rebuild may have changed. */
+	if (unlikely(check_retry_zonelist(zonelist_iter_cookie)))
+		goto failed;
+
 	/* spin_trylock may fail due to a parallel drain or IRQ reentrancy. */
 	pcp = pcp_spin_trylock(zone->per_cpu_pageset);
 	if (!pcp)
@@ -5428,6 +5453,7 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 		.alloc_flags = alloc_flags,
 	};
 	unsigned int fastpath_alloc_flags = alloc_flags;
+	unsigned int zonelist_iter_cookie;
 
 	/* Other flags could be supported later if needed. */
 	if (WARN_ON(alloc_flags & ~(ALLOC_NOLOCK | ALLOC_NO_CODETAG)))
@@ -5457,6 +5483,7 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 	 */
 	gfp = current_gfp_context(gfp);
 	alloc_gfp = gfp;
+	zonelist_iter_cookie = zonelist_iter_sample();
 	if (!prepare_alloc_pages(gfp, order, preferred_nid, nodemask, &ac,
 			&alloc_gfp, &fastpath_alloc_flags))
 		return NULL;
@@ -5473,6 +5500,11 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 
 	/* First allocation attempt (or, for nolock, only attempt) */
 	page = get_page_from_freelist(alloc_gfp, order, fastpath_alloc_flags, &ac);
+	if (likely(page) && unlikely(check_retry_zonelist(zonelist_iter_cookie))) {
+		__free_frozen_pages(page, order,
+				    alloc_flags & ALLOC_NOLOCK ? FPI_NOLOCK : 0);
+		page = NULL;
+	}
 	if (likely(page) || (alloc_flags & ALLOC_NOLOCK))
 		goto out;
 
-- 
2.56.0

