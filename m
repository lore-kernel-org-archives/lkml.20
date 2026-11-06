Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985983;
	b=EXbPnjceZg/ndCP7Gz2O0XKUYEUJ7O9rIWUkOqBMvt7yXs3q8y0Yl9PcR3+wTnTOun9L
	 mNfCDzgyR5iImzu9g1gK43B+iW7cqF+GEQCu/R4ZFkY9hfwoiABZo4vvNrUbYJlsVSr/u
	 c7IY5dTk1YJV1tQKi3GeNDt/Vt2nHb5792SgXYPnpSLl5aLVmDgW03dy45ctacuYDXWXl
	 TM2Gk3yH1lIvwt66wL1I6JISMG+xfaMru/0E9chu2X+Jvj16Hmimcv7ot4K0eYlzfrRnt
	 BTGruRrVWxRnkcZrwitIf5J2ER/Xt1gzqgPeypWqxs0cjOnTFAeDfRsfvr/cq+mBYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xtFTk05uiNaRRdHOMAXi3GiW3HAfYxRIOaZ0COEoKVE=;
	b=pA8SxC4aWsHdwqpRcteRoDX8WelhSADZPdxuRfg4qMA4SPasXEXGAF69cAjc//CkitfK
	 j/3M4GuiIlST6l4KQSrMKDf+Evck50+pgMN8YHwhmKcOjfyVJB8oSh6bRJhTTRtHoyMGb
	 Hitd9WWdNkcebSvnIWrHOUL72Tel34Z2Gr50siidn7NKV0sh9kTIqzOHRKnMVv5kPhqsx
	 3pA5l3sejyUEL9TNMwpVc+9kvbGiLxnM+oIhVfJl7ctkz6huDBCZtcv3gzWrYc4wdcbg6
	 qPRMXPsF4J3jPXeLSQk45W6VZwnFX0AUyI2ZA9eEJ+1zNtG7P8VDLjo8MXQwKJyKCJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QckL3Ihq;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA42606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QckL3Ihq
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0d63f60bcso10840907b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985982; x=1794590782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtFTk05uiNaRRdHOMAXi3GiW3HAfYxRIOaZ0COEoKVE=;
        b=QckL3Ihqoeo0EQl24uK2QZXxWwc4UuCuE7hHolnb+V+ndYTqGSmVr2LvGZxW3dMBCC
         8dz71WvtdGyeVXTSg+WQdEWtsKrL+vJiya9uOp34S26q+JOaDWmSx35GPJ+BndokrYzD
         usqNTdwQ7L/CTvREaP/3udSNfTi19psr8+El23ndMMija73e64LXzRZFBN9ksOkLL0kX
         JnSn9VPGffKkD5ck9Z55M2YPEJFv15ewRB5bPeSPGwoXZIYDsGpGzTmTAKXnCtRUFo/N
         EcfavfAC2lXnZcqv2kyudsEX583VyrCFbJ4bt48/StLMrSXGHqRAvQ1xXbYPH3bjx2q8
         7zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985982; x=1794590782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtFTk05uiNaRRdHOMAXi3GiW3HAfYxRIOaZ0COEoKVE=;
        b=ZyXBunYlvF2NqTWYY3Mf4x7B10eWGCZZ9Vrahpn3fMp+GnSO+2Cn5RhB3QQZ03oOLR
         fgVLNN301IX6RoWu1WijixIYNl/A2KfT1/KgIM4RLMFEm6hZdr7u+i/bfyKaFozX4QgH
         7j6SgaSYvUQNPqOvjfg6mx8vzoCtbavW8awmDUKSf0f+sJU4zgsZw9NiZ6HSggR2WkZi
         c8/UQZ9Z77lmOJCCWupHn8pImvFxc742g/dD6PYKmMaJ1DBYVsi0xmQkvYi+aFlbMCA8
         IL/ORYL02NmYh55tf8EqoEDXzkbpg4nbVsspnkczXmi6KRDWRXSECj+GcSAwT5ER/lu2
         jtPA==
X-Forwarded-Encrypted: i=1; AL+hErEdyury0tu+DhRfqB8J0Tsbn2eR1bnS/J1Hy0Wg/uawz3y9tPEcxXVg7gFf5M/oxZdWUTc4ZbQ37/SCBIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iYRRm021ptuqY2VtXp6Aen68q1s9hEcCi+B7jOQva0ZfHXQhq
	ft0fKvkLuSOqE4sz7XMPjOmVUK4QsBk+7uddBwU91VlN8wrvJK2maN3d
X-Gm-Gg: AYBFou3KE0P9CIVLE67ONuKHh2O0VaxL8uETJshA2Nkf0FTqao1uKwOJvvr7f7wocSk
	3OTc2ykXMf6Ou3LeCfW/VIhZMV2ykKseHMR9oOwNBpQ/ThptOFHsZaUY7KNEtQaJ9Kne5Hb9zRv
	6zPtiuaCMmrMV5G/RNJVwD7AdwXjBp+gj1rN4VoS6mkZ1hfCE6rC+xE3IBxWZOYqARt5anQhGOd
	UvUmtw1pRu2m7Ylq/bm3iGfDJzw93odKZZZdFNF0nIzH9izsFgjCMpCkfM6AJJDH24fj2yRl0ek
	Uz5MfFXTSEsxwpqBSHQswdwWTMlaLhzc8aOpmFo4dvntHLjGoVWkGDxynFGuuxn6ujK0MXcEmJu
	Dem3Cu5Vsm3EWfd30DfnK8dInojty89+EML1+ltLpnbxgGbEKGZRAM++zzq1BgAcu4UljyCdmUo
	pFq5gowZNSsWQJyXIKgVh/6i/O9vKdiCeCFH22KEceHt/iEI+40ux2cYYRIfrG4A/2rhmLK95ak
	f/JQpWT1jGaOEFYrSf9AFZ/ZXeZOGyMhb4BH0U4F/QdPlZaKPFpet2JvoSkJFifGbqxmt5iYuL6
	nu/qyUihPKpZqYePrXCFPfRj30Z1zWTe+OQis9xwnmoFePzrn44IT3kP0GGa
X-Received: by 2002:a05:690c:2b86:b0:8b0:ab62:c636 with SMTP id 00721157ae682-8b34199dcb8mr13500317b3.45.1793985981518;
        Fri, 06 Nov 2026 09:26:21 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:55::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f77055bsm23291777b3.8.2026.11.06.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:26:20 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Gregory Price <gourry@gourry.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/2] mm/vmscan: consolidate promo vs. high watermark checks
Date: Fri,  6 Nov 2026 09:26:18 -0800
Message-ID: <20261106172620.318113-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
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

should_abort_scan() and pgdat_balanced() both check the watermark that
kswapd reclaims zones up to, which is the promo watermark when NUMA
balancing memory tiering is enabled, and the high watermark otherwise.

Consolidate the pattern into a helper function.

No functional changes intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/internal.h |  1 +
 mm/vmscan.c   | 22 +++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 78a7f17b9934f..66495845ec058 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -68,6 +68,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 				gfp_t gfp_mask, const nodemask_t *mask);
 unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
 			      int zone_idx);
+unsigned long kswapd_wmark_pages(const struct zone *zone);
 
 #define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
 #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 071a6eaef1a1a..97c5843e14f15 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -371,6 +371,17 @@ unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone
 	return size;
 }
 
+/*
+ * The watermark kswapd reclaims zones up to. With NUMA balancing memory
+ * tiering, kswapd keeps room above the high watermark for promotions.
+ */
+unsigned long kswapd_wmark_pages(const struct zone *zone)
+{
+	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
+		return promo_wmark_pages(zone);
+	return high_wmark_pages(zone);
+}
+
 static unsigned long drop_slab_node(int nid)
 {
 	unsigned long freed = 0;
@@ -5049,7 +5060,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 {
 	int i;
-	enum zone_watermarks mark;
 
 	if (unlikely(sc->proactive && signal_pending(current)))
 		return true;
@@ -5061,12 +5071,9 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 	if (!current_is_kswapd() || sc->order)
 		return false;
 
-	mark = sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
-	       WMARK_PROMO : WMARK_HIGH;
-
 	for (i = 0; i <= sc->reclaim_idx; i++) {
 		struct zone *zone = lruvec_pgdat(lruvec)->node_zones + i;
-		unsigned long size = wmark_pages(zone, mark) + MIN_LRU_BATCH;
+		unsigned long size = kswapd_wmark_pages(zone) + MIN_LRU_BATCH;
 
 		if (managed_zone(zone) && !zone_watermark_ok(zone, 0, size, sc->reclaim_idx, 0))
 			return false;
@@ -6966,10 +6973,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 		enum zone_stat_item item;
 		unsigned long free_pages;
 
-		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
-			mark = promo_wmark_pages(zone);
-		else
-			mark = high_wmark_pages(zone);
+		mark = kswapd_wmark_pages(zone);
 
 		/*
 		 * In defrag_mode, watermarks must be met in whole
-- 
2.53.0-Meta

