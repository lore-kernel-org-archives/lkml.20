Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05D93CB542
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022011; cv=none; b=oROmXhVBfrfy9hbaJlDNdAeU6wFBTMXSKV4Qg9O/1W/hES1q3XZOQs6MpKTV4YF4iF8ev/JQMS7QYHV4vRhI2FRTcqxI/+pqeFRLuVYFig8TPoXpBaVBlrXqgeQCqaYAJHn5PfB3j0SzFOf7Sz0NbLDM+jv6LqLzFqUJQPRNV6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022011; c=relaxed/simple;
	bh=S/aRLy4OXzdfmMXkVg4XDhu6KiAzVdSOJzjWprATbEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ove5MuFaPT02zQ2uj0wcmjA0MKQCYwQImwokTCgO6pPECbo6lAEveOIwBld3O6A1EseWbeM90TUTR02+EmEZV6QQy+GGK14sApkYp0VBUA7sv8KVz6RCtY7nNuEarm6d5krQdGS6jNtXUB5jtaTiFZ7KZ27uRxcVjj0FmRjG4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ji1J6Zov; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ji1J6Zov"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso60148225ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022009; x=1789626809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wagISQ9d+CnFEjK/rivKR4J4aGNpnRPBrTqRitnWimk=;
        b=Ji1J6ZovJ9SRN4ul04hAWdPsW7nmxONlZBjmiCMNhZjJ3BBDaCFsXFh5tvDqF1paa3
         ZrNVP0iqiQT4w5J8/kOhIISBqJ0mCcMGV1V1hSBg1wwA/V7zGkkfP0jM/tXnGzzVjy/0
         /qa+EjQIAQbRt4T/LD6C4nDX275D54uRmFiJOQqIr3RGf+zybIvusgkrQ8aC5PFo5cC+
         1mGjNQ8ot8W6X7oZIbdaiwqVnzFxbkytBWfZEZhSew/womP7uZYke4lhGTIs4ST113xv
         q6NjOee1vmLE6GB0cD4WN1v468ttyouAcKHl3QJVTX4elBt4wmJ3iE5O4GfR47n3vLkD
         8sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022009; x=1789626809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wagISQ9d+CnFEjK/rivKR4J4aGNpnRPBrTqRitnWimk=;
        b=RReeUvVsjhowZI98qE+cfA047T4pDwAOZHUfb9hohyFUM16TlgF8EmPZB3FviSzJmU
         YWW2CezibjvdkGlbSnJ6lk5VhDPnyjWUMw46BFB6vY7yU0ye2mkdlzQnX49wi23MXrJw
         l8nWqvRNu+VWZB29q1J/QGmHJAMCe9pkjy+f77grVXu3fKox7s+MZo2Pib8Pg3GBATm9
         kZrXOWnhnaxIn1asXRQ4wy3irBnMHtl12KuFaIXCvnSwAnUDxFgW50wYKHE0vxjv3KDs
         IiTfDA50EH5T/4622/CaGe4IstQP1T+E/Pq8PHBizZx5J6CT6AWmV4Eda1S1/PNppwJb
         nEvA==
X-Forwarded-Encrypted: i=1; AKwUvBz4RGUM+OYj1i3z5ZiUhBur6tqrtjnZ/TDzkeBb3ST+pD73VAe1jB3FWP8W3UvGRnPna60LILFtnTjZhTA=@vger.kernel.org
X-Gm-Message-State: AFuF++l7p8swOUly4Shn6sPOGtOLex0oL5iHoO1sjougTxquOuhgP1tf
	t3YnNOVHnfU0DTDhIFoYj2yKTCItfiv4C919OWkuMh5DLbC1Nfch0JzIT/3bceussoA=
X-Gm-Gg: AYBFou0Uderax63j8C+MB63AR9t9uIuJAt5AUyG9Ciuq6Ur519ztNdiZcuM94+DyGpA
	ndMWhXpjLpOzv9fdyutZeLcZSuerQnt9wDr3E4yS9v70AGMzTdAeA76uDFcZrXHfh2b0AfVrNpx
	w6pW6DWcNb0qGYiLWqGoHR2/HKalMqU0+P1yanfyWh7MMH3OSBDaKM1V+hKIQU+dX8a7c9vmpwO
	Bonys6p8HBKfHh+Pvp6kXi2o4cXVNLP52TQklbsPdmBSkjCT2TmbAKrElSvGf+Lq3rem8BXA1to
	6X4jMEK5yWu4dKtgkD++Sp1DuP8DIWnldEIK6cG59xm8RGCkknyitX+alMBkU9d9EcsXzXe3ZW0
	OYCt72KGcOEhXo/XyKPKAr6lsJfkkaUU9P8nEQ5WRrb3gIN81cE5JCF1OtpHXI3Dfva4T4X2Jz3
	zn9byATzscFqaijZiU+UFyJ6wrx1BXIXOyNP8Ht+Z5HwN/kooGV8d7KlGjDJ+1nZM1n676/9OMh
	x/6pLXI8agywK5pkxaWHqI7uOX2W1rRAALZ
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr63381387a91.22.1789022008789;
        Wed, 09 Sep 2026 23:33:28 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:28 -0700 (PDT)
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
Subject: [PATCH v6 02/17] mm/sparse-vmemmap: rename HVO order macros
Date: Thu, 10 Sep 2026 14:32:41 +0800
Message-ID: <20260910063256.64386-3-songmuchun@bytedance.com>
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

The macros VMEMMAP_TAIL_MIN_ORDER and NR_VMEMMAP_TAILS describe the
order range where HVO can be applied, but their names tie that range to
the tail-page cache implementation.

Rename them with a VMEMMAP_OPTIMIZATION prefix and use the new names in
the HVO paths. This makes the code describe the optimization requirements
rather than the tail-page cache implementation detail.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Collect Acked-by from Qi Zheng

v3:
- Collect Acked-by from Mike Rapoport

v2:
- Rename the macros with a VMEMMAP_OPTIMIZATION prefix (suggested by
  Mike Rapoport)
- Drop intermediate optimized-folio size macros (suggested by Mike
  Rapoport)
---
 include/linux/mmzone.h | 17 +++++++++--------
 mm/hugetlb.c           |  4 ++--
 mm/hugetlb_vmemmap.c   |  2 +-
 mm/sparse-vmemmap.c    |  4 ++--
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0a2428714108..5fb9b37819d5 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -107,13 +107,14 @@
 	 is_power_of_2(sizeof(struct page)) ? \
 	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
 
-/*
- * vmemmap optimization (like HVO) is only possible for page orders that fill
- * two or more pages with struct pages.
- */
-#define VMEMMAP_TAIL_MIN_ORDER (ilog2(2 * PAGE_SIZE / sizeof(struct page)))
-#define __NR_VMEMMAP_TAILS (MAX_FOLIO_ORDER - VMEMMAP_TAIL_MIN_ORDER + 1)
-#define NR_VMEMMAP_TAILS (__NR_VMEMMAP_TAILS > 0 ? __NR_VMEMMAP_TAILS : 0)
+/* The number of struct pages covered by the retained vmemmap pages with HVO enabled. */
+#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(PAGE_SIZE / sizeof(struct page))
+#define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
+
+#define __VMEMMAP_OPTIMIZATION_NR_ORDERS	\
+	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
+#define VMEMMAP_OPTIMIZATION_NR_ORDERS		\
+	(__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
 
 enum migratetype {
 	MIGRATE_UNMOVABLE,
@@ -1158,7 +1159,7 @@ struct zone {
 	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
 	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
-	struct page *vmemmap_tails[NR_VMEMMAP_TAILS];
+	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
 #endif
 } ____cacheline_internodealigned_in_smp;
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 46b6703bac4e..003cfac98f14 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3368,7 +3368,7 @@ void __init hugetlb_bootmem_struct_page_init(void)
 	struct zone *zone;
 
 	for_each_zone(zone) {
-		for (int i = 0; i < NR_VMEMMAP_TAILS; i++) {
+		for (int i = 0; i < VMEMMAP_OPTIMIZATION_NR_ORDERS; i++) {
 			struct page *tail, *p;
 			unsigned int order;
 
@@ -3376,7 +3376,7 @@ void __init hugetlb_bootmem_struct_page_init(void)
 			if (!tail)
 				continue;
 
-			order = i + VMEMMAP_TAIL_MIN_ORDER;
+			order = i + VMEMMAP_OPTIMIZATION_MIN_ORDER;
 			p = page_to_virt(tail);
 			/*
 			 * prep_and_add_bootmem_folios() can access pageblock
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 917db0984143..ae8fdaa42118 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -494,7 +494,7 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 
 static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
 {
-	const unsigned int idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	const unsigned int idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
 	struct page *tail, *p;
 	int node = zone_to_nid(zone);
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 5a2469fb1838..aa6a4a2fae98 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -329,12 +329,12 @@ static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *
 	unsigned int idx;
 	int node = zone_to_nid(zone);
 
-	if (WARN_ON_ONCE(order < VMEMMAP_TAIL_MIN_ORDER))
+	if (WARN_ON_ONCE(order < VMEMMAP_OPTIMIZATION_MIN_ORDER))
 		return NULL;
 	if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER))
 		return NULL;
 
-	idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
 	tail = zone->vmemmap_tails[idx];
 	if (tail)
 		return tail;
-- 
2.54.0

