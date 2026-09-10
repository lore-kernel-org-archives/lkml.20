Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF93CAA2F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022032; cv=none; b=rsI4iryQM6CoPmxM+YJBnQ2tYEag4q25kXJEYFWcoGSqb2MDuaVS1L8KOLMgbwr1JDvuefIGJF0nbULBT3Mml85eL2EzHSdFSU+RQvpDohzJwZKIqkWESs7lWRHmz7LgpaTUsgXVrDGDHsWDl9WaOYWQx/8b9M6gzcHOhhiEUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022032; c=relaxed/simple;
	bh=rdbrKcho81gLv+stcRUCjIzOrzflQStZZrMq5dxtYFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLBeB4tGn6dxgl/GFp2O4Y6EXJcZgUkcQTQ7xmnu2sj2gcF4VHOR2AiDv0umZ3mCoQXsZUXNpjUDtFIkIMBQrVJ+KjHYosRdITkG1h2e9T4IhX7UpAX4jBDiUvO+MjbezPVZhn0fcPjfPMeKfcqzxkGAPN4PghG9GzrkT74HPbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NZGf/nD7; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NZGf/nD7"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4acso1545763a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022025; x=1789626825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EO4Rt3WEu+fPYQITg4bt0hJ4ppm+DADkMZhoEd2TtEM=;
        b=NZGf/nD7l7TNBMOTwkOTztkIys3FxbdVUA8ynP/aOMN78FEG5pK/vW0cAzOW9alKUK
         ea4+RFNnWVGwCtKdh6Jd4iV0lr+5RkeNGQTE+C6MHuh1W+UZ/YCdozgzHnWZPLOMRJsR
         2eaEEJNised+/2+SaH5ImJbeagkUahJKcbuJUffLGAqrDB/BWd4HX/sZfOuHKhaQ9MJN
         d6b7ghNQQiJShLsr9EvmMcLu5D9VBHn+5Mcplsh05VADa7oaErg2riY1wOcm3w/SsM0I
         Zwk7luUDU1y3r+6rAfiw0f4tJcujA9CxHa0Ubn68chYggd/rsJTYePonmvLREGCEeV1q
         6axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022025; x=1789626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EO4Rt3WEu+fPYQITg4bt0hJ4ppm+DADkMZhoEd2TtEM=;
        b=ccth+NMVKltnHXIGLc3+g3W3VGWCHTcUvicTzo17eRU4CiKBb+v9ymy3bbeuTjD2KB
         1Ru2QaDSwszvvz4H2rnLlir6WXkGG9rSpcErZFTbFLL1ZWXnZk5CuOSfPR+0JUAwGZRC
         pUfM8V7AzEwoy/e8dosfmgewsWcf7BTK7fiitBaVVNr3IMa97lWIzqMrhYAUkI6JzQ21
         O7Tg769F/T8ynyCietiEeuan5v2ciTXZ0LEARq6PDJhXYTd9nfOv3a7TLA2iNCIs2oQK
         yy6YBpx73TuI61l1MlW/XTWtdRCqJ9rynW6rti9d3egzbHbD4oA4VyZdTg9g0Km0RSan
         2AVg==
X-Forwarded-Encrypted: i=1; AKwUvBz+BO0zqKKIn/CVW+1/Wsm68Lm9CewhU5WgSR/LjbqXRIOx7NxDJkE2fsB3mijROBjd07kU6IyvD28EQsA=@vger.kernel.org
X-Gm-Message-State: AFuF++maz2Pw4Cth+6AL1ng2w9cqWz8nfQae9wqNHPtduxXB/+4/3TeE
	JJNS96t7tuUFx4jNuZ5dBn7uoLXfqNQt1eoPZ+Isi+wXRF6GaYCwGrbzfV6GOQ2g5NE=
X-Gm-Gg: AYBFou2k615HhH9h1w7qaLxFUr4RqukM7drn6vGEeEr7t4UGEe0gx1WPCdFU+wh/W3W
	CPaMjxinQ7o17LGLBsTk0zc6ATJqeKV2h9fV2n7AQRH3YTJCWRfbvVIiiYCjoMoydettV5QjYGP
	pywSPzJlzcRthG6DWeJHZXSGOD1FOL7HYgFeJfhuVZOFcZjNdky3Yhcp3L1CaMYG4gG7LDh1tc1
	xb97/1konPAOIjl2mxxu6c1pn/fR/TtqVnI9LFEN/TUBek0Sllz2YeLd6glZ4rdzkUfGREnN7yE
	8vU9scm4ip5abfUco2vQX9iW7yDnPnncXNnil9MesZhyhFfE+YCK8y5mVe4MBV3UsTeLB87tN6s
	gh+wfnQLC/QdDYVCRZj3Ax0uQZTnjqJz2OccP+xa5XA/iaNgQ0RIl35DW/ywR1nuklFAyuKvPot
	9sl5cULPDmCIC8cXBjmtiupBSqU4RTLYnD5rLO4smoPITAt7t06yUw2Jq3Xcz5ZVEBB2UYncbyu
	nNaEcPMuvXxj7QIcqTVTXWebcAIM4458nY=
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr17069002a91.2.1789022024575;
        Wed, 09 Sep 2026 23:33:44 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:44 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 06/17] mm/mm_init: factor out pfn_to_zone()
Date: Thu, 10 Sep 2026 14:32:45 +0800
Message-ID: <20260910063256.64386-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pfn_to_zone() in hugetlb_vmemmap.c duplicates the zone lookup logic in
__init_deferred_page().

Move it to mm_init.c, declare it in mm/mm_init.h, and reuse it from
__init_deferred_page() and HugeTLB early vmemmap initialization instead
of open-coding the zone walk there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Collect Acked-by from Qi Zheng

v3:
- Fix the commit message to name mm/mm_init.h instead of mm/internal.h
- Collect Acked-by from Mike Rapoport

v2:
- Move this preparatory patch before the sparse-vmemmap optimization
  changes (suggested by Mike Rapoport)
---
 mm/hugetlb_vmemmap.c | 17 ++---------------
 mm/mm_init.c         | 28 ++++++++++++++++++----------
 mm/mm_init.h         |  1 +
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ae8fdaa42118..c48fcea076a5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -19,6 +19,7 @@
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
 #include "internal.h"
+#include "mm_init.h"
 
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
@@ -744,20 +745,6 @@ static bool vmemmap_should_optimize_bootmem_page(struct huge_bootmem_page *m)
 	return true;
 }
 
-static struct zone *pfn_to_zone(unsigned nid, unsigned long pfn)
-{
-	struct zone *zone;
-	enum zone_type zone_type;
-
-	for (zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++) {
-		zone = &NODE_DATA(nid)->node_zones[zone_type];
-		if (zone_spans_pfn(zone, pfn))
-			return zone;
-	}
-
-	return NULL;
-}
-
 /*
  * Initialize memmap section for a gigantic page, HVO-style.
  */
@@ -787,7 +774,7 @@ void __init hugetlb_vmemmap_init_early(int nid)
 		map = pfn_to_page(pfn);
 		start = (unsigned long)map;
 		end = start + hugetlb_vmemmap_size(m->hstate);
-		zone = pfn_to_zone(nid, pfn);
+		zone = pfn_to_zone(pfn, nid);
 
 		if (vmemmap_populate_hvo(start, end, huge_page_order(m->hstate),
 					 zone, HUGETLB_VMEMMAP_RESERVE_SIZE))
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 6655fe696e0f..ee3bd7921768 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -692,6 +692,20 @@ static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
 	}
 }
 
+struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
+{
+	pg_data_t *pgdat = NODE_DATA(nid);
+
+	for (enum zone_type zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++) {
+		struct zone *zone = &pgdat->node_zones[zone_type];
+
+		if (zone_spans_pfn(zone, pfn))
+			return zone;
+	}
+
+	return NULL;
+}
+
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
 {
@@ -750,20 +764,14 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 
 static void __meminit __init_deferred_page(unsigned long pfn, int nid)
 {
-	pg_data_t *pgdat = NODE_DATA(nid);
-	int zid;
+	struct zone *zone;
 
 	if (early_page_initialised(pfn, nid))
 		return;
 
-	for (zid = 0; zid < MAX_NR_ZONES; zid++) {
-		struct zone *zone = &pgdat->node_zones[zid];
-
-		if (zone_spans_pfn(zone, pfn))
-			break;
-	}
-	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
-
+	zone = pfn_to_zone(pfn, nid);
+	__init_single_page(pfn_to_page(pfn), pfn,
+			   zone ? zone_idx(zone) : MAX_NR_ZONES, nid);
 	if (pageblock_aligned(pfn)) {
 		enum migratetype mt =
 			kho_scratch_migratetype(pfn, MIGRATE_MOVABLE);
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 39f75df9be1c..c9fc35e7e9f1 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -39,6 +39,7 @@ void memmap_init_range(unsigned long size, int nid, unsigned long zone,
 		enum meminit_context context,
 		struct vmem_altmap *altmap, int migratetype,
 		bool isolate_pageblock);
+struct zone *pfn_to_zone(unsigned long pfn, int nid);
 
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 /* Free whole pageblock and set its migration type to MIGRATE_CMA. */
-- 
2.54.0

