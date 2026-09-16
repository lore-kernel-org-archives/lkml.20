Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454D3EC817
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541063; cv=none; b=YI9PT/Li7aZeu4HJ1kMd4eLrbHK+wiy6yH5dMdfSqlYcNBQy8sUdA3YnJyPknyKiwy4atQQ0uMRc7ERD2Zfw49v6VqUnE7PCAefM2fR++GA6oZJgzP/ASPQC0TArHw06nay6+R6P0gzFvmcoW1IMtaszvnT0DbHfsALT34N+KBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541063; c=relaxed/simple;
	bh=QgI9M8JCvMkxfWw24tOIx4mGI9U98UyteMWum8iZNHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0mj9/IiTdnxGNIOKj3x8EppPXMXOmCsD4TAvQUOTpqrOMGfWPwOIAu+r5fLTS0SkXpSu6kFVe/KUu11T6CyfsygSGzgzTCwPPmkJzoNZVFi+NwP/9BSVCcbhB11V3VhKK9VIiGQ27alDTcR4tQz4L0QTMfkhvFMKYaOqf13YyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RlRsxxoH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RlRsxxoH"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso4852335ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541060; x=1790145860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1EqIpH0CyAwdpMqjXcOe7F5BCJx4eubUzqhI5rvq2s=;
        b=RlRsxxoHMYYB4E0v6O/yoE7vr2B87JzmbdtVqkReLV3phahaQyccRhkLLjVttQ6dF9
         QgE6fwyASHHBR2XW+OHoQ6a3Z/Y8QQmVbsr/BxrcgVABCucMIoSbOpDtInU7Fxv/yTHo
         w1h5du32nsnyFLnWQTJmr9COUe8GMxSLcZkHE8vt9VheN+a21IY8QUA7XsXkA3XtP2t8
         gUXs3peKNpGuLqnfXs5k2dxsIRyVGQSJGEFBSCfuS5aOeGMWBQr2LP/mF6Vecx6WgXjX
         eeEvrW9DatCYOGyOkTrGXeQwntRdTKhor/NdyamMfBYcg3MplMiJAQPH8G3T/mEt3vP3
         GeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541060; x=1790145860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1EqIpH0CyAwdpMqjXcOe7F5BCJx4eubUzqhI5rvq2s=;
        b=EXTpp7XNmSw4MtHKhLeexiJ8KwbuImBB36XHJBLn3kJAc2bXgdpIJbviSjsX4YG2t0
         vKmJPWhs/0TuWRpOxNlHZBzqXBC03ZTTpbz66v30ydwkbInvk+b47xihAgz4IE0y1FWf
         cVo9sWrkfPykefqvS8hRd91chrOc9o8i53eOTPVAJAqGacUjCWX6iy0CpkLq84BAU6Gq
         HD5g8UT80KDJwlbfgXq4Kifz4eDQOz2mCzDnQnwp4WqmBY5HgYLSD21Y4l69Fpghf+xq
         EvPyqc4CCr7GNYH9fHjjLy4vdCJKbhwxsoS/zxBgNDtPA2+OZwjFjtfE8ijv7MzlcMyb
         Xs8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtS2fsmd3U2ox55BB0CqXV8V7YtPJU5mZiAmt6ap4Yep/F4oxnR53j+EH5efpWFSFWD5k4z9H+CHYETrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lHVH+qip4tnV0aDFsH6IDbv7Zra/P57Mtmj7oCBRwZWgi8EcJl
	Hj6VodEWGVZ1nnyBAqF1Tdja1NnRD5Gys5kmxMJVLfkvd5dn6U48zQX39rJE663M/+w=
X-Gm-Gg: AYBFou0UEGiWsOezH8zY338RVviSMLaiI3yyWBDZ+QQN0O1ecK0Hn1L0ZZOj3iZERb2
	v061es3noCtbmw8Si+bVLTYAGknq7VMUB55WXS8IgLCXbbdjNmj8S5GfYC8tjnpW8VNTSfm5JyH
	ki80rSsKSKeOpY4FOCEbip7X8+V6JJheTltCzGBi48DM6NIEEzJRToRs4HdFJSl286XuoV0nFkw
	7/i/5mIMqxzYun7WyzZwRKszpHPyUqTVwGbZJYZof20pU1OL3uWu9zk4BGSEe73VqWoI8HF5LVN
	MaQKuQpNkrRo1alSx4EgDod7doyWUh6X3JagdvBbqfD/dzbjHfu+cFb+5rPyIaDvdE5V/+9C6Fc
	Kaj6qk9/TtL6v+rb38ZBf1Ebxppu/RLYKhBW2Hi52nzlvXwxjYJLwL6R1SFHZQ7IQnlietJCMdV
	QgpCfsz9teOMn9s9d1yfUhJhnYuSq+vpH/X/mgmKwG5pflg7DCCQB4024b3PdJQTct2nw5dzJOi
	wjFHqTYBWCQF1sZblnE
X-Received: by 2002:a17:902:c401:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2dd8e76f78dmr28974185ad.22.1789541060351;
        Tue, 15 Sep 2026 23:44:20 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:19 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 06/11] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Wed, 16 Sep 2026 14:43:36 +0800
Message-ID: <20260916064341.1825793-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
Device DAX has not been switched to that mechanism yet.

Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
with HugeTLB by using the common per-zone shared tail vmemmap page.

The optimization is enabled only for DEV-DAX through pgmap->vmemmap_shift,
which supplies the compound page order recorded in section metadata before
vmemmap population. Unlike FS-DAX, DEV-DAX does not modify tail struct
pages, so sharing them is safe.

Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
initialize its entries with PG_reserved for device zones. Also skip
poisoning vmemmap-optimizable sections while their struct pages may be
shared.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Move device_zone() after the definition of NODE_DATA() to fix
  non-NUMA builds.
- Update the commit message to describe the compound page order stored
  in section metadata
- Collect Acked-by from Qi Zheng

v2:
- Explain why sharing tail vmemmap pages is safe for DEV-DAX
  (suggested by Qi Zheng)
---
 include/linux/mmzone.h | 10 +++++++++
 mm/memory_hotplug.c    |  6 ++++--
 mm/sparse-vmemmap.c    | 47 ++++++++++++++----------------------------
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 97147c764658..ebbda6f31139 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2149,11 +2149,21 @@ static inline int online_device_section(const struct mem_section *section)
 
 	return section && ((section->section_mem_map & flags) == flags);
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
+}
 #else
 static inline int online_device_section(const struct mem_section *section)
 {
 	return 0;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return NULL;
+}
 #endif
 
 static inline int online_section_nr(unsigned long nr)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b428da66d279..d7a59167bec4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -43,6 +43,7 @@
 #include "mm_init.h"
 #include "page_alloc.h"
 #include "shuffle.h"
+#include "sparse.h"
 
 enum {
 	MEMMAP_ON_MEMORY_DISABLE = 0,
@@ -554,8 +555,9 @@ void remove_pfn_range_from_zone(struct zone *zone,
 		/* Select all remaining pages up to the next section boundary */
 		cur_nr_pages =
 			min(end_pfn - pfn, SECTION_ALIGN_UP(pfn + 1) - pfn);
-		page_init_poison(pfn_to_page(pfn),
-				 sizeof(struct page) * cur_nr_pages);
+		if (!section_vmemmap_optimizable(__pfn_to_section(pfn)))
+			page_init_poison(pfn_to_page(pfn),
+					 sizeof(struct page) * cur_nr_pages);
 	}
 
 	/*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 02da1321197d..7b5b9ceec697 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -193,6 +193,8 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
 		prep_compound_tail(page, NULL, order);
+		if (zone_is_zone_device(zone))
+			__SetPageReserved(page);
 	}
 
 	page = virt_to_page(addr);
@@ -490,23 +492,6 @@ static bool __meminit reuse_compound_section(unsigned long start_pfn,
 	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
 }
 
-static pte_t * __meminit compound_section_tail_page(unsigned long addr)
-{
-	pte_t *pte;
-
-	addr -= PAGE_SIZE;
-
-	/*
-	 * Assuming sections are populated sequentially, the previous section's
-	 * page data can be reused.
-	 */
-	pte = pte_offset_kernel(pmd_off_k(addr), addr);
-	if (!pte)
-		return NULL;
-
-	return pte;
-}
-
 static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 						     unsigned long start,
 						     unsigned long end, int node,
@@ -516,21 +501,18 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pte_t *pte;
 	int rc;
 	unsigned long flags = VMEMMAP_POPULATE_DAX;
+	struct page *page;
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
 
-	if (reuse_compound_section(start_pfn, pgmap)) {
-		pte = compound_section_tail_page(start);
-		if (!pte)
-			return -ENOMEM;
+	page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!page)
+		return -ENOMEM;
 
-		/*
-		 * Reuse the page that was populated in the prior iteration
-		 * with just tail struct pages.
-		 */
+	if (reuse_compound_section(start_pfn, pgmap))
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)), flags);
-	}
+					      page_to_pfn(page), flags);
 
-	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
+	size = min(end - start, (1UL << order) * sizeof(struct page));
 	for (addr = start; addr < end; addr += size) {
 		unsigned long next, last = addr + size;
 
@@ -546,12 +528,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			return -ENOMEM;
 
 		/*
-		 * Reuse the previous page for the rest of tail pages
+		 * Reuse the shared page for the rest of tail pages
 		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)), flags);
+					    page_to_pfn(page), flags);
 		if (rc)
 			return -ENOMEM;
 	}
@@ -883,13 +865,14 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 	if (IS_ERR(memmap))
 		return PTR_ERR(memmap);
 
+	ms = __nr_to_section(section_nr);
 	/*
 	 * Poison uninitialized struct pages in order to catch invalid flags
 	 * combinations.
 	 */
-	page_init_poison(memmap, sizeof(struct page) * nr_pages);
+	if (!section_vmemmap_optimizable(ms))
+		page_init_poison(memmap, sizeof(struct page) * nr_pages);
 
-	ms = __nr_to_section(section_nr);
 	__section_mark_present(ms, section_nr);
 
 	/* Align memmap to section boundary in the subsection case */
-- 
2.54.0

