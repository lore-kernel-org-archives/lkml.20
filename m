Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613963;
	b=hHRm0j/slB+CiacUn3tvieqC0CjiWx3Rg9WXitMDe04j5qhoR2vou054PsTNHn+kNoll
	 M/qB6W7BGkI7z+507wEUTaF5J+k5xK4L96NW6fwrtoLxeVryT3UcLeYb1pikNMXVcJR9U
	 KoQgTpms0tec7KJhd1Co33BC9hrZqqu4Ci5UVH5YBJzZTOECyZlZJylz478FAi0J6gAxa
	 tI8ZqXHL6zpHJ9j/ka7vHYNvThK0QXds9QvbgPnGX/j0nOqNX3GgW/7oe4JQ5+M2VC4WT
	 X+CLzwK28CcPdz4PDx+XxAQ2Wi73i8Qb5HQjA+6911t02v2+eoE6FBPPf7TX4ptGz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jMy9JX/a9KFnIwCq14KsOs+G9vkXTmhpLfQkU1b/xSg=;
	b=m3WaMxZUoHSEpsocP2QeKV3vRYIWCzgcRxjrBDwZEFtKKsyZ4vuH4hBZOVuLVNI7WuYY
	 QNToqFFvQIZMg00fvWm0CnJTJ2M5JR9VcklXZ6Nwm5T2UdBHIo6hKqw+mCHB9xYjICYUr
	 BvUvxusztt0CLU8VFrfc+zaP2dmYAypqS4XiqPvIBerejJwnIE4p1CJ0jhakprRATGIoM
	 zrlEM2M1YNTUHiInQ492sT+I2RPtqQZtTTCXjEjy6jJrNRC3epwJhoNTW5eWnUcr2hTx0
	 wkQqwbd2kgN6AjfPkw5PJ8aVgnfSBNOi/sRqTz33r1Qf+5ME4Kgx9SOBd3+D1TVDlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtOwwRU8;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2CC606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2CC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtOwwRU8
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b32b2e691aso22913547b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794613962; x=1795218762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMy9JX/a9KFnIwCq14KsOs+G9vkXTmhpLfQkU1b/xSg=;
        b=xtOwwRU8cqIsDGnarvCHwovzV21VUvE/+H6vKh1wcL5ervcF0sp4JXItI1csjTaTVz
         gBj/9QdROpTQ9GyWupByfNP9ecZgUA42EGEWF0XrVSepklc8LUIqn5DL8PNcO1tCpY6F
         BTKws6tAMSIyptYquA0c8TQbfoht0lmRq2LIN2Hfz+UFSSAxn9sInd95ADUlMf4klr5q
         mwfr3iZh60ztSNXei4YzalzalPy/hI7ZFqEC5RrB27cFjpYgaAEAlBZ9nDuhHY+7SZtZ
         3RCwtV3vhCg6ZI4C27M/LHRX8BAAST9eN/wtkhV5BbbqCfUO/7MiHzx8jP2XJnORn/Ap
         Y08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613962; x=1795218762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMy9JX/a9KFnIwCq14KsOs+G9vkXTmhpLfQkU1b/xSg=;
        b=JQ/vwdGxQIbEYbJpt8++EBkEMYUTgQ4cIWdsWr+a/3ZysLcBVHThHwQDxVifzqh2FL
         HEqjgZhMFXtUMPJqt2iiA24yvG4DonuItBOPEzuAqiS5hSZd14zzdeoGwasO1xaWYmjg
         ShPTTsmbOx1rE3EKNXzzg5WJZjLOcEOoBLlgS/y47EPBBNdqgARis5PEHHFXEkNjCaL2
         bjpivz8Khllm2IpitmtevW82kRUV7tgMzCDAMSBNi8UxWW1Snib1Z0qLIp805DhSZCHG
         1TtjGTvoqvb4FiXL8+G97YZwIofDf74KO68OjjJso37q68d5c1gy1ec+bogHXxDhUZlz
         09hg==
X-Forwarded-Encrypted: i=1; AL+hErHekVZD16aSErjI9yW8oCWmIU9SKf7BhvXUCVCxx8yC7iYfuJy1/tPV5s4yWjblMT1GLLbz8n61Mcp/k0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PsT/wuKepxH8vPP3aYctLM/+4++8e1fYTCNzO6rsbfUrQjKTO
	U2GoLITZmjuyLSYYZB8bM0NT0VH/ueyibrRH1KXumjpKuQdLjEceHm40
X-Gm-Gg: AYBFou099IAsUsVZ0ez2a5LdDWVvTFELqGYOjVl20la/vS4eFB59Bsn/6HBaY5/A2Ep
	iSWEa1nVYwc9/ttGtrhewK3fJAn1Ju5o0XrA6w1xawDL/12bfLmuYTEwq95MWWj6XQ5QczwxsaC
	Czoe09qwsOViccVoe6EVnra7w9V5Uahdbc3v4wei/JK4bsoCPVxc5C83JhFYsfN4EkKBM3K3IEg
	En0eQvknbloM0Rqt38FkCUlKflpTJc//pOZ5pyOMoeWUdqnOEwS1YVaEjHZYqRVHEzjS8cFdIyY
	cS/AKf6oQEvv4rU+7KEM4z9zQBbzChWCNOV62ny4GLw9CIoNVil+FNN9+f5U/i8sJvJwlg6JHJX
	JwK5lnnmCLE4d4+O+HQ5fKniJob3bSemeo79qfbOSX+h9VzoOmcvwcuzIbxxgVSZtSfL9b95cOj
	gdBbpiTdxZNdatOXoCeZ6sqhYEZgh409RK18zXfhw/pQxzfa6BADSKstyFby9vmCZFlH7KOVXU0
	l9FUR7L/LeFLOH4mEMv/Vr/b/JYFgY6in0Nf8bg+E9dWTfyPIqH5xaYZkNd62SfJKDc+loSdXMj
	ATmgYJcw8wa7pQfjAOflt/r0hqZVSRQbzdoDJTwWqQ0t4kL/X7JD0YsT34xu
X-Received: by 2002:a05:690c:e20b:10b0:8b1:60a0:c311 with SMTP id 00721157ae682-8b4aa2fa74dmr17270837b3.33.1794613962178;
        Fri, 13 Nov 2026 15:52:42 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:53::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm33104697b3.36.2026.11.13.15.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:52:41 -0800 (PST)
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
Subject: [PATCH 3/3] mm/vmscan: consolidate promo vs. high watermark checks
Date: Fri, 13 Nov 2026 15:52:36 -0800
Message-ID: <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
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

Consolidate the patern into a helper function. While at it, remove the
include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
dependency on sysctl_numa_balancing_mode has been abstracted into
vmscan code.

No functional changes intended.

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
index 2fe49f3c0de13..6d6da844f4b76 100644
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
@@ -3801,10 +3800,7 @@ static bool should_skip_kswapd_zone(struct zone *zone, unsigned int order,
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

