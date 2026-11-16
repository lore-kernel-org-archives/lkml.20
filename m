Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871433;
	b=3VDbMXvMZGwUw3GPWzYEfpg55x0zDA/vtAT62F9hp80q4TKu+6eqjklO0D2sQwJX8YEP
	 IK1Rz3J9koq0PixF/AkUfypRcqFLmac4CE08Y7iWWXad1/zi2BG/2qnbND1ZaGszmE1cI
	 xclZkEhB/DroFaNiqp+EjmEV7R/i/rH+WoJHsFm6QI2Xj8ERmL99dK1WFo+Sghid6yjox
	 G99dTm/dFyeJ5FPI5WcvkvMvY6h4/PvLrdqUkdWkFZX58dMFOpcc6QcjrouuEuYwXQRaj
	 O5jrKGo3qD3lVSAu/ESgUWPuHAbf17e/8RjkEHpr+iFzJ/2ol2ijhmo+M0Ndi8XrWVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a0qfedX4Kuy4esVXCLbI84Kj587H6iqaG79bdZhV1ao=;
	b=DZEaAkEO6HzvRGS3CbGO72tsbpNcA+898xVhyZzp8s/ffk+RUqWSdoJeYTlVo4ey/io6
	 ThbsyzGstoe3q27tNwJFtD/37Y6j4rqTWiosCwW03hkaNLERpDILbwmL2qwtbL6vqeAK4
	 I6s1iVaZKWZeJfED/Da3Dgdyc6/tm5BBGzSyE+yT5PuAlLWa53kJokyzXXO2VwKGJoRaS
	 hRa3FNmhMCniL/UzsunbPfXtU2shOmALiLUNW3DwDvURcE5fkAGxAFnTf1YPy7i5+tmok
	 SmOTxjLRq3WoaDAMk/2HEys3+bSGE6wpGpu5vp9FzQigrLnLKmtEyFg5mmFB6aS0MyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQw9PtqV;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD3606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AD3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQw9PtqV
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-844a8bf7e25so3499421a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871432; x=1795476232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0qfedX4Kuy4esVXCLbI84Kj587H6iqaG79bdZhV1ao=;
        b=DQw9PtqVBRhSYTUauE7uhcIYhpw58DNTBw4sgM4/ORArI2FT259K00fY+HTaQoyIie
         pI0tIEC/L/WpalB0uJWvPy/7dl2PrxiHsnpKw0kD3FMzs6WpECBlkXQ4BVPV9JkGgqpX
         7XCgJk+dCqobTASBZPylgyi/LId7mVbCrfPm1ezBYB5kUdfP1ssb9k/VO/DoN9wmY5IX
         Zw8GimGmefDsMbet7vndveGqBFdK2PkgW56fb1emZk5tQpaBR5BHLRNWYDCcNnE4LHvH
         khUBExkOYSR4kUdZubMPlFL+HmdDiBwRx1yrxGh8kB3+OLl0bjx/0GH2A6VOZGRYbkJM
         qOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871432; x=1795476232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0qfedX4Kuy4esVXCLbI84Kj587H6iqaG79bdZhV1ao=;
        b=duGOungzyVb1qSX52Q3Vs6MvfeYAIdjG2sh2tlsSvswSgnOcPxJWevdUwM+8t/gm5H
         rjYWwoT8cJlhgv18ZLuujUCjo6ST8QpM0BaQ6fopZSV8Y6w9JTL74tysveAjhKnKjNiP
         TylQ3HTDClRjjuSCy+u+0yAp42xtb4yEgRo7lMjjLFdwK9lQcYfQrwqJQHGOTBcy8yX4
         QcDQVZLaErPInGa6l2QySeJ8MsDr9C4yTkWL1yBeLVLuMiz1RJy9uN46pFaIrUuD3xGg
         5sIo+Y9GlAvgZUTrvKpPuQ4lazJskKEDyXmmSUkFQJQFqIFBqrM9Y+qpdktUL2tbVk13
         JYzg==
X-Forwarded-Encrypted: i=1; AL+hErEI7WezjwOC2BVTtAl4J9rmjCV80Ij3KKR8n8f29+uO5p1+jPxzT+wzJziaPXbDv+U8OYid81gU6FuGLGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RIZm6e+5TB1PYLUgYGMmUg55VVW4fCBjSVCbX/Rb0yJIIeSTY
	a/2SE8jz9uIoYXtUC11V//w625wMxizN7kwQsdqupkd0AfMWCc+uC/b5
X-Gm-Gg: AYBFou3kALMJYh6gE1gCpEWIg4Mn1jxdCJm4CZhn+xG3+afDHq/pjZ9XpJ6/hiMsIQe
	ZoCJCPx10C5fTDeKMmwqdH4OUUfUDSxiuoka7wvkVHLj6e+HvYdyZ60DO3f2u/1XBSY47tvVa5k
	16Ss498+tAgq8Fav2vIQcuq1vzFdCKRW16PzLV9eq0uSx6NTWi19sxIN1wezm6KPxaVEoMzQc67
	rbkTWb25SeT8WhBoNhjcQqEgblmZ9McT/eg+UTEweZ5B4GXE9hPF4L+GkhBWD/hrdAVurY8hXdF
	BmFAWZSzWrM5mVXJOzQtlTdcTqLa8bdFW7Qk+hrxYNYj50kXeGC6kJRvIAEcMgwWe9GV2VxvOKC
	W9n7ncclNo9vlcQFPKJaLst0VjF2Lb0e76yZDTep9nTdjY4rWRtpKQlG68vBZLqwyXUrmmIqE8X
	v5N7dXQzc59ZxyGQOsOjM9bSIhnf/AxBcXeIg+VkaZALmJhFeSBJiiCJcBGtOvXFwRgVacSB9b/
	UMyg5Vu9HEfB7kij8FJJ6SMocm218t5CgmGayL0Y5WXUQM9RrN46vVumK4NxO/Ki7vkAJqCBP03
	uFxcuLxaJYZebeayc8H7EvYTqal1QBAi7Wg2VnghYbvAkzZZRTpnDQI/2IdB
X-Received: by 2002:a05:6830:854b:10b0:862:b9dc:183b with SMTP id 46e09a7af769-862b9dc1e62mr3704643a34.27.1794871431735;
        Mon, 16 Nov 2026 15:23:51 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e779dsm11204093a34.11.2026.11.16.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:23:51 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 3/3] mm/vmscan: consolidate promo vs. high watermark checks
Date: Mon, 16 Nov 2026 15:23:45 -0800
Message-ID: <20261116232346.788145-4-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
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

There are three sites which all check the watermark that kswapd reclaims
zones up to, which is the promo watermark when NUMA balancing memory
tiering is enabled, and the high watermark otherwise.

Consolidate the pattern into a helper function. While at it, remove the
include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
dependency on sysctl_numa_balancing_mode has been abstracted into
vmscan code.

No functional changes intended.

Reviewed-by: SJ Park <sj@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/internal.h   |  1 +
 mm/page_alloc.c |  6 +-----
 mm/vmscan.c     | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 566cbd2dce485..8beb5b263ca1f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -68,6 +68,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 				gfp_t gfp_mask, const nodemask_t *mask);
 unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
 			      int zone_idx);
+unsigned long kswapd_wmark_pages(const struct zone *zone);
 
 #define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
 #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 43929faffb989..d7320566a9509 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -45,7 +45,6 @@
 #include <linux/mmu_notifier.h>
 #include <linux/migrate.h>
 #include <linux/sched/mm.h>
-#include <linux/sched/sysctl.h>
 #include <linux/page_owner.h>
 #include <linux/page_table_check.h>
 #include <linux/memcontrol.h>
@@ -3804,10 +3803,7 @@ static bool should_skip_kswapd_zone(struct zone *zone, unsigned int order,
 	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
 		return false;
 
-	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
-		mark = promo_wmark_pages(zone);
-	else
-		mark = high_wmark_pages(zone);
+	mark = kswapd_wmark_pages(zone);
 	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx, 0);
 }
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce83..9af50783fc824 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -478,6 +478,17 @@ unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone
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
@@ -5212,7 +5223,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 {
 	int i;
-	enum zone_watermarks mark;
 
 	if (unlikely(sc->proactive && signal_pending(current)))
 		return true;
@@ -5224,12 +5234,9 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
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
@@ -7131,10 +7138,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
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
2.53.1-Meta

