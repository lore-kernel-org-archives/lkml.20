Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540946;
	b=BJCZIrfbvdEgLZjB/kw1t2gMUHhwru6k48COJH9B2i76qRU52figwi1pTGGV9ljelu5F
	 owyzwkm4hN9MLsT4vCd5NF4zqS+PKM69UhdDeG1JdclgKyQ7//IHWyscZDt+E0v2t2m9T
	 h84G9Bi0yf3bG1Kt/y55w4xJ9WqanXTtwqWf+PpTfRhtthWdcxec4TNlDeFQdtUf9m4Ve
	 TMi260G5+Y+oiEhgdgAZOVHb1/p0/8ZjOkkGob4gjirFAbX1Laooc2VjlmPuSMBbICIfr
	 39uBYH09OhI2o3sqCmyt5XyXqB2jpwR0INLWGSrsKxdDcRK2uiTldQyF+TFAuWLncvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+nn+UByieGItxN9YlkkTIdARwSLiGlm5Ng+zJOajx6E=;
	b=AYrCDIVkZKMYikaW8V7H6AylS9u5hBHeU6Z4Xjts3EIifChQtqPJsm8U8zKYNl245M2S
	 6xZ+j1vtP16Ks17mE5jsugdUVxbdf5KqgK+bCq42xT3rXvoHUHkyJYYVwT0XwldjELmtc
	 Urtf0McCjQy5cbsZoJviUdbODl8cxJBUIRxV4Ibh40JU2Qu+UUgG1cbzWJS9e9PWfEQS/
	 izR1+6weTl/7Ck5qStdBdq084DhC4A2oyJeZcjGNtJtsDk0h56AmGTVkiJmfnDvGFUsRn
	 xgthtWUb69+QsTOp6Aeni4kVlj8M3nWte3IMxd83udUECDDpahvQ/bPeDvTRrnc+vRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lUvmvZPS;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D22C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lUvmvZPS
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3720addb068so814587eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540945; x=1795145745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nn+UByieGItxN9YlkkTIdARwSLiGlm5Ng+zJOajx6E=;
        b=lUvmvZPSZXTXQGIYnhRivC1HCSDFfys+QQDXvN0kfsKgUYaYCf6N3ExsGDuF7WAq+K
         wayTd6PAMsSt9VCGuvT38GDInEjQwyl0SO7PriKfBVEgdUgrnpp02s/sup9DRDDtKDK/
         wVhW1FQwuEiOrqAMrhuA+P5dcOkFohd7hvej2bI74ajAoudVE52TcsoXLUvo7SIcde/l
         UjmUeDnHW5Dxhx5zHsVYIYKwL0hUFFQJdmlbu03wXrdF2A1cKBqUfgneILiEIkHclOeX
         ZTuMNWj/h7k9naZ5WYEpoS1LpY7QD9zhK4KJgSUqfo0a5UvcyohHdTtai+U2xlZj38qb
         L5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540945; x=1795145745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nn+UByieGItxN9YlkkTIdARwSLiGlm5Ng+zJOajx6E=;
        b=EPaoSsLEWbdo4SS9AXpl1bjjdIBPx0GwcXao0x5unKDZkB9rGqIC7OULasgLaNE3J/
         cgj0RKMRhXaOHayvxZbWwy6I1EVHFZgx/zKI6igEF+Pv+1K4qQZO/VCn5mSR+B3n6YrJ
         TWss0m6azOgVdY5OfSg+Q9hhIoNkqe4ILOSIkngKFtjI4hxoE8msgVt2C1FpoLvWEkB+
         CJyMbTaSUWV4SXq5OKnZqGywfQiKaJG1uV8m6skHsTKPhKeka0gCi+K2w/EPhGRZiWg+
         ImyOGWNAv55vzykWIaW7RrjY5PrkZeC/9mrcvJgMhxVqokbSeqt2RFDwXsC0tI+l1Yrv
         kuzw==
X-Forwarded-Encrypted: i=1; AL+hErHaJt88UG1CTj8WsjRP4Dc7/7IzHjLwVOj3Is86z3LfUHPgGbvnfQ8fGgPM70OMAEPwBhtNhCbSYHER6P4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XNaRF3Wgvmj+K7jBhqY2xZS53hphHuUeGArVabysZvWmoJeJ4
	/67MylxBtZ7BE9z2Z1dny2hJN3Yo9Lia9SwA16859PlUCcEuTPppXfjOscdrQlFxwcE=
X-Gm-Gg: AYBFou0KX2kvDwczzYnrfdR2Yr74g7labPSOaD1FTcfJWnHfcOWS8RA0l0OPwp6iRvt
	Q/rdjvA6fZ1Jrd/UxbKgjLFc/ByFEB0shGIeKJLWTZoou5JSnjnTHQDuPIEzdBDPcMeP3bZm1Hd
	kJio5urXKYlwoCBmsav9F1crGR0hUAMNCJ1v7kCFZ9W+ns7+OmdtuuN05vENRXqZsh+imRKXABx
	DEZSR9L03wPjHJgRIMBGoYo7yyx/BtvSU97nCZY8X1BmEA2BXpWPATN+NgP2JxRp+9NTGSEhR/+
	SsFJiQPV6m8zokuCQm9mrJKy8qPH278R/HVa9VHRRKTMUvC1Ooie1y8z6zgSqRf/WG4zVgD7dRo
	QSANurJkmrWKFBqZ4m/QefXFX3g3BRI6QmmmJt/vj0J3NXcu/QD4Sf5xRhFOYNsFtTFUD6kSwMe
	be4TCHazMe0Fm34yxuYF+OtTvlGEOs4FRg7xDSm1NFXzvhpu+WyAsWJ4RRpN3czQhOe1SnX+AUh
	NuF3VMzXKJWFEcFgSoQDPCRUArxID7yAMHV3c3YT2zAPdrpksEu2X3XwiUoWNNS+O7kHsPwzCt1
	jKY95YyEF9DSHhONFH5nXCbkVsO1/aoPM8ST1aNLL/RKee0BaRA2iNSXIBObLQ==
X-Received: by 2002:a05:693c:4019:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-379675fc9ebmr986727eec.30.1794540945090;
        Thu, 12 Nov 2026 19:35:45 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:44 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 06/14] mm/mm_init: factor out frozen compound page initialization
Date: Fri, 13 Nov 2026 11:34:34 +0800
Message-ID: <20261113033442.62970-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
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

ZONE_DEVICE initializes compound struct pages while their refcounts remain
frozen. The setup is open-coded in memmap_init_compound(), including the
per-page initialization and compound tail preparation.

Factor the common setup into memmap_init_compound_page_frozen(). Keep the
pgmap association and MEMORY_DEVICE_GENERIC refcount handling in the
ZONE_DEVICE-specific path.

This provides an MM-internal helper for other early memmap users to
share.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Rebase on memmap_init_page_from_template().
- Rename memmap_init_zone_device_head_page to memmap_init_zone_device_head_fields.
---
 mm/mm_init.c | 114 +++++++++++++++++++++++++--------------------------
 mm/mm_init.h |   2 +
 2 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 69bbaf75f935..ea9ff690d4e0 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -739,6 +739,28 @@ void __meminit memmap_init_page_from_template(struct page *page,
 	vmemmap_optimization_verify_zone(page);
 }
 
+void __meminit memmap_init_compound_page_frozen(struct page *head,
+		unsigned long pfn, const struct zone *zone, unsigned int order)
+{
+	unsigned long nr_pages = 1UL << order;
+	struct page template;
+
+	memmap_init_page_common(&template, zone_idx(zone), zone_to_nid(zone));
+	prep_compound_tail(&template, head, order);
+
+	/* Initialize the head page. */
+	__init_single_page(head, pfn, zone_idx(zone), zone_to_nid(zone));
+	set_page_count(head, 0);
+	__SetPageHead(head);
+
+	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+		nr_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+	/* Initialize the tail pages from PFN-independent template page. */
+	for (unsigned long i = 1; i < nr_pages; i++)
+		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
+	prep_compound_head(head, order);
+}
+
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
@@ -1064,44 +1086,39 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-/*
- * With compound page geometry and when struct pages are stored in ram most
- * tail pages are reused. Consequently, the amount of unique struct pages to
- * initialize is a lot smaller that the total amount of struct pages being
- * mapped. This is a paired / mild layering violation with explicit knowledge
- * of how the sparse_vmemmap internals handle compound pages in the lack
- * of an altmap.
- */
-static inline unsigned long compound_nr_pages(unsigned long pfn,
-					      struct dev_pagemap *pgmap)
+static void memmap_init_zone_device_head_fields(struct page *head,
+		struct dev_pagemap *pgmap)
 {
-	const struct mem_section *ms = __pfn_to_section(pfn);
-
-	if (!section_vmemmap_optimizable(ms))
-		return pgmap_vmemmap_nr(pgmap);
-
-	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
+	/*
+	 * MEMORY_DEVICE_GENERIC pages start with a refcount of one; other
+	 * ZONE_DEVICE pages raise it when handed out. Use atomic_set() because
+	 * @head may be a stack template, while init_page_count() expects a
+	 * memmap-backed page.
+	 */
+	if (pgmap->type == MEMORY_DEVICE_GENERIC)
+		atomic_set(&head->_refcount, 1);
+	/*
+	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer and
+	 * zone_device_data. It is a bug if a ZONE_DEVICE page is ever freed
+	 * or placed on a driver-private list.
+	 */
+	((struct folio *)head)->pgmap = pgmap;
+	head->zone_device_data = NULL;
 }
 
-static void __ref memmap_init_compound(struct page *head,
-				       unsigned long head_pfn,
-				       unsigned long zone_idx, int nid,
-				       struct dev_pagemap *pgmap,
-				       unsigned long nr_pages)
+static void memmap_init_zone_device_basepages(unsigned long start, unsigned long end,
+		const struct zone *zone, struct dev_pagemap *pgmap)
 {
-	unsigned long pfn, end_pfn = head_pfn + nr_pages;
-	unsigned int order = pgmap->vmemmap_shift;
 	struct page template;
 
-	memmap_init_page_common(&template, zone_idx, nid);
-	prep_compound_tail(&template, head, order);
+	memmap_init_page_common(&template, zone_idx(zone), zone_to_nid(zone));
+	memmap_init_zone_device_head_fields(&template, pgmap);
 
-	__SetPageHead(head);
-	/* Initialize the tail pages from template. */
-	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++)
-		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
-					       device_zone(nid), &template);
-	prep_compound_head(head, order);
+	for (unsigned long pfn = start; pfn < end; pfn++) {
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone, &template);
+		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
+			cond_resched();
+	}
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
@@ -1110,16 +1127,11 @@ void __ref memmap_init_zone_device(struct zone *zone,
 				   struct dev_pagemap *pgmap)
 {
 	unsigned long pfn, end_pfn = start_pfn + nr_pages;
-	struct pglist_data *pgdat = zone->zone_pgdat;
 	struct vmem_altmap *altmap = pgmap_altmap(pgmap);
 	unsigned int pfns_per_compound = pgmap_vmemmap_nr(pgmap);
-	unsigned long zone_idx = zone_idx(zone);
 	unsigned long start = jiffies;
-	int nid = pgdat->node_id;
-	struct page template;
-	struct page *page;
 
-	if (WARN_ON_ONCE(!pgmap || zone_idx != ZONE_DEVICE))
+	if (WARN_ON_ONCE(!pgmap || !zone_is_zone_device(zone)))
 		return;
 
 	/*
@@ -1134,32 +1146,20 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 	VM_WARN_ON(!IS_ALIGNED(start_pfn | nr_pages, pfns_per_compound));
 
-	memmap_init_page_common(&template, zone_idx, nid);
-	page_folio(&template)->pgmap = pgmap;
-	/*
-	 * MEMORY_DEVICE_GENERIC pages regain a refcount of one in the free
-	 * path. The remaining ZONE_DEVICE types start from zero here and raise
-	 * the count again when the allocator or driver hands the page out.
-	 */
-	if (pgmap->type == MEMORY_DEVICE_GENERIC)
-		atomic_set(&template._refcount, 1);
+	if (pfns_per_compound == 1) {
+		memmap_init_zone_device_basepages(start_pfn, end_pfn, zone, pgmap);
+		goto out;
+	}
 
-	/* Initialize the head pages from template. */
 	for (pfn = start_pfn; pfn < end_pfn; pfn += pfns_per_compound) {
-		page = pfn_to_page(pfn);
-
-		memmap_init_page_from_template(page, pfn, zone, &template);
+		struct page *head = pfn_to_page(pfn);
 
+		memmap_init_compound_page_frozen(head, pfn, zone, pgmap->vmemmap_shift);
+		memmap_init_zone_device_head_fields(head, pgmap);
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
-
-		if (pfns_per_compound == 1)
-			continue;
-
-		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, pgmap));
 	}
-
+out:
 	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
 					 /* isolate */ false, /* atomic */ false);
 
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 9de9db31320d..721221d2e4c0 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -114,5 +114,7 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
 void __meminit memmap_init_page_from_template(struct page *page,
 		unsigned long pfn, const struct zone *zone, struct page *template);
+void __meminit memmap_init_compound_page_frozen(struct page *head,
+		unsigned long pfn, const struct zone *zone, unsigned int order);
 
 #endif /* __MM_MM_INIT_H */
-- 
2.54.0

