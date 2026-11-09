Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218316;
	b=tWrI4HzqtSExJKDvpsdKrr7BvWeYeydtV32PjJk1/ask8jGFvKsGkaXQpn3AieWXyMcS
	 tJn2YgJAXstRQOOfyzESjeC43g7UtJnQYrrjpjPjkSx2EaldUblRQCTAAxa3yxRB8y2h3
	 N4UhaRpcLwsC1R+Ef3MW+m1nRvl6eOAkhnsWTiH/DhYkxvRo/zb0uqtMaEfswCS0eHI3Y
	 cOivD4V/zs4/+p0v3w7+b9Pbtmg0qD6dvqonU72POJwSlDkuhTLZgX1mZxfQX664Z3pTl
	 gTKCXF5IFa5xh+yJT7WNBau4KGGLEa9rig6hPKCg3wuxpyxvny/G2hxoAEc/Eu5Y32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NfA30H/txJV+HpefZi3v7n91I++R4neLp2SsCFAx8tg=;
	b=RUcZAEGjMvLUbkXxOz5GZ0UNDg9ze4qdzWi03GyDYs0bNbwgpRlj0w3g0ptcwE24r6Hw
	 OHB12rDZ+mN4oncIPSBFPsnQIwW90Zh6tPY7MmhMIukWY8VyrUhQOlICHPM7SnINpNAWv
	 2yRw1ZQW8RgmqtiTtvQTAluibvgLM+reo+McShVEJ3VpycfgIqnazbaKUfWKHrqYEcfr+
	 gCniZICcMfLY/1Vsr6A+sggSESbVCNCSfiTrBbmhiWdTNP2MvhmfPKNqCFmwR0PtQCWbO
	 WeTlxUaQLD5v1N9WY+sxp9uUjoiW4m3TbDr7m0ZfVlY8IqpM8wGWLeEd/bO4dfC69lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LaUFTBkU;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0485606D820
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0485606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LaUFTBkU
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b2513decc3so741064c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218315; x=1794823115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfA30H/txJV+HpefZi3v7n91I++R4neLp2SsCFAx8tg=;
        b=LaUFTBkUDBcdJ+jNY5xPeiF7IHd7wO5iFXhOhSg297aFdLvkA16GElVwruAM+Lo0RP
         no4XGsG6je6lkQy67W5ZXaS53DYaOOxTCT7l1t3kQWD64vYeuarmD5eB8bv50g5VddEi
         Tc9EcpANriFevQ0MQ+wk6prTZnCOVFc6MZqfcIsNhPZDyugSca8OFIpMX0gQbVtso5+c
         8DZrrMsD95VjNNJHETis0pQDXDCF/nrlciT/SH/ZekQfGE48StKS439cKhpnj80jN8D6
         umiGLtkOWiJvBrXjS6gQyX+HH13PhEWCmCsiP5Ju2P6u53OKTipkmNUJ3kFZQuBIBpVA
         GbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218315; x=1794823115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfA30H/txJV+HpefZi3v7n91I++R4neLp2SsCFAx8tg=;
        b=vgfQX/D5Ocut+anhZKLDIcC9jxYFlvrBuF2w8WUuss/xkI1nYMlkjvtWdBMvghngz8
         V2UPvTjc3EkAlUQ0SNUwlNvYBxm2F99yRjx2CqAQE94TnHs2n2lRPcHRW5mz6vkRrnrO
         dTkmV0C78yTBU6y9EA+SRuoWQRigCxASxPRj11sgzuYqaOvjtcT7u9j2lP1JggOsbxB6
         eRp0C4dueJNp+dh4jriytY5y5XL2I10ZEGrK3mVCSd0quZ3BECUXx4TCwkhwEUxvMIoP
         ekc0A8xn40yC+R78HKOEB86yEUfTqIngV1zX5spXKA6QboDMozCix17QKqSWzpO2VNoP
         x1rw==
X-Forwarded-Encrypted: i=1; AL+hErGu5dz0rYTaiPydXGE15gkdr2x/zb/YU0E35vXS9p7h3kbMRBMBkkRsEyrphfLFwxRkPC6Oee3yQ6qnCUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BL8+aWIefnsXbqxntnPkthDYSVVDq6sOPzp0rjuU/CsdYJEew
	TA2c6L0n1spVNvNHmDH0iNwrDFTeTm3fA/3dlBMTEHHybOg0vW8kGyNKMI7oKnpL1qc=
X-Gm-Gg: AYBFou2g17i82ZN39Ik/efH3MgMpSX6wZ+kxWdUrQSBrpPjpyeSVvV/9chgaWJuGIue
	hwlIU9RNqSKK5Unn2vTKzBgea+/a+XI4ShLEsa274NFg6gITEiaTGrpazhIrIf87MnnQdKT4Mr3
	nZrr19VMKirPq7BuQ7i1WdYwzqENQqRvt7HeCPUI2BnE0NWcnlprnwq8K1ckSeeh55m9qm6UBMg
	UiFapvqINBMfGIFkOOOjuRqUqK9WbP3alTw8fq9ZE8NjNGeLoZQmq/9jKwO4ugmju1Ab4i62zd3
	QR37PHL7Tv3DZp4o7A7/0pac1C3747UMVxZEStnDjSfz7LtlQ9HEHz3+FIpRvQwe4qkdg0LSYl1
	D5i65ZDS4wioK7Z8s+WdEWqYNM0Ifyalt+vIdGMyDCZecuNzSN8YcuDQuSEcjiX0AVBedvqQ0+m
	4FqnGwT0hW9+I/LE+Bzzt32XI9jSqqLDU3+q57q+Sw/RAQk6iZZh9ShqaXP+bS7dSSLGeBKUats
	LhgzD/EwgqDRvdwJIJZuMkuOMNYN6S22AqNuIWHSEKNQbJYZQtKic/JcGBfGEIF5tINzPAw+OHQ
	g1aNFZ7PTManGB7EPclyZe8a0onh8EEu631nrjy0Iqj3A87QqfQ8LjhoU5UD2A==
X-Received: by 2002:a05:7022:ea8c:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1b39fec8ff1mr6278580c88.11.1794218314588;
        Mon, 09 Nov 2026 01:58:34 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:33 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: [PATCH 04/11] mm/mm_init: factor out frozen compound page initialization
Date: Mon,  9 Nov 2026 17:57:59 +0800
Message-ID: <20261109095807.41547-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109095807.41547-1-songmuchun@bytedance.com>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
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
 mm/mm_init.c | 137 +++++++++++++++++++++++++--------------------------
 mm/mm_init.h |   2 +
 2 files changed, 70 insertions(+), 69 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 6cf74f6840de..458496271a44 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -719,6 +719,40 @@ static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
 	}
 }
 
+static inline void memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, const struct zone *zone, struct page *template)
+{
+	set_page_section_from_pfn(template, pfn);
+#ifdef WANT_PAGE_VIRTUAL
+	if (!is_highmem_idx(zone_idx(zone)))
+		set_page_address(template, __va(pfn << PAGE_SHIFT));
+#endif
+	memcpy_nontemporal(page, template, sizeof(*page));
+	vmemmap_optimization_verify_zone(page);
+}
+
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
@@ -1044,56 +1078,38 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void zone_device_page_init_from_template(struct page *page,
-		unsigned long pfn, struct page *template)
-{
-	set_page_section_from_pfn(template, pfn);
-#ifdef WANT_PAGE_VIRTUAL
-	if (!is_highmem_idx(ZONE_DEVICE))
-		set_page_address(template, __va(pfn << PAGE_SHIFT));
-#endif
-	memcpy_nontemporal(page, template, sizeof(*page));
-	vmemmap_optimization_verify_zone(page);
-}
-
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
+static void memmap_init_zone_device_head_page(struct page *head, struct dev_pagemap *pgmap)
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
+	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
+	 * and zone_device_data. It is a bug if a ZONE_DEVICE page is
+	 * ever freed or placed on a driver-private list.
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
+	memmap_init_zone_device_head_page(&template, pgmap);
 
-	__SetPageHead(head);
-	/* Initialize the tail pages from template. */
-	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++)
-		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
-						    &template);
-	prep_compound_head(head, order);
+	for (unsigned long pfn = start; pfn < end; pfn++) {
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone, &template);
+		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
+			cond_resched();
+	}
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
@@ -1102,16 +1118,11 @@ void __ref memmap_init_zone_device(struct zone *zone,
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
@@ -1129,32 +1140,20 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
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
-		zone_device_page_init_from_template(page, pfn, &template);
+		struct page *head = pfn_to_page(pfn);
 
+		memmap_init_compound_page_frozen(head, pfn, zone, pgmap->vmemmap_shift);
+		memmap_init_zone_device_head_page(head, pgmap);
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
index 0df0644c703c..1560ac9e9286 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -113,5 +113,7 @@ void __meminit memmap_init_page_common(struct page *page, enum zone_type zone,
 		int nid);
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
+void __meminit memmap_init_compound_page_frozen(struct page *head, unsigned long pfn,
+		const struct zone *zone, unsigned int order);
 
 #endif /* __MM_MM_INIT_H */
-- 
2.54.0

