Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5493B4EAB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659998; cv=none; b=U9t3zRS4D4pXMPztElhAJX/6zXVIzR5U8RWC/Hxj5EJqPuVVDfsBunMVQ0PCXgUEmKOR4MG8LmPGVbBGyvIx1x4A0sePx31EIhTgZcsuLgid5pnDDkc20r3o/fIUhsIgZrHytoykSskF6aT3a8gQpCRBDYVJNQWPQgIyoBMa0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659998; c=relaxed/simple;
	bh=6zFABRxSdgNtSJo8mzABoDhDsW1KvLO/Y2DWvMfipZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDbI9TcI2uQautgfWYw2tVt3gSX7iJ5ywQyQesuLpXqbMmk57nj+8Ru4V9qOxmdBahcPRSKqunb8Frto6bApmQv98QLZMZU8BD1zkb4cHDBe7OendM4gqHcGM8Vdqni5IZQOF3qI3Jm5yPrBdA7HnzGs27jRPixPJTwBslcTTwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EqRQJh6u; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EqRQJh6u"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so16985675ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790659996; x=1791264796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58VRsumoisic/ifQBSVplSYobqhWBYVn5fC/uIc+7J4=;
        b=EqRQJh6uupv1xfQOkiT3HZLYR2RrEgwvV3mC2D+yDZeK24AOxDKJTqy+lqh1OhuKgW
         D5rVKGmJhhYtZL63PU1srWixg4daD1cHcf7VcBqMUCNIqtEA1h8dh2O8BoCX+pRRHm9A
         +npFbd/BV/d6U3p0WDTqGxsU6v1pKBxVW9yap45q9dcRw+UMpS/JaJbGyhCIG0TgQxD3
         aBWU24g4rESfMz7gOkojBBU/FppxPCnVw/AlM3xXYIzJOaW+BoqDUuojgE+urUkjQT00
         2QPG1kW2wfiFpaT7Os9TAJCc5YC76u8dgc3Hx0BZe4JlgGQnsOlmshpyU4J6Fl3UCQE/
         zEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790659996; x=1791264796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58VRsumoisic/ifQBSVplSYobqhWBYVn5fC/uIc+7J4=;
        b=uj4kyUGNwlpWzZeh6IuAyoRrIdDTVwls4QKlCTgoj/ZKF8ZzDX6odyzBlgMR17b2Kw
         nUgBb+U24CMCAJRKjrIwVV436MIEals/t37dzBMFcUokGLwzANvIVTzx7voSkvTgyG/m
         HzYnpKH9+mpOrVLZk4+IUh3wuCGeYo7Xs2vWt0qSX02PdtBLdGOZrAQkQLnMrJ3/2dxW
         tOP9m4Kr+XrYKRPBuezxOUHfDyG7/ACxo4sqX9S2l6tBIua7KmtYFtvhCjTKpM2wZKfW
         W6GK6jWU4FMFZptGG6PFfPGFdXkuJyNMvvhTdzHtf6BJtEyJM8mNhlcDf/yF/3ngvJiH
         DNIA==
X-Forwarded-Encrypted: i=1; AKwUvBxQYL6mD8V4yXEjK4eAPRWquZ4GXoqwNNBhLBRyp5P0E8bkqxHUMO8r9lXHDdclMjnhFwHtkSYp3wIu/vM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR3K9wqYGHucdnyMmm9+UhQ0BL5RSutH1NQ+mhTHdUCbhbaXHP
	zMBEmOGz3OaAvmkBtcnZFHDfLYPoUdXhDbk6nWGP7UGXD+tBjLyTMIcRlWi9mmUF288=
X-Gm-Gg: AYBFou2FGSEqPIjzdtQXfcnDbWDtssetYlaXeW52UMuAdR0gV2QFvXqChf8Dag095Yd
	mdvPxXc/M5tvn9KCzh7ZpYTAodUXluh8TKUjA3OeKipx8Qc9Jy+J1WXz8MYVfoFkZlkzGkmfOjg
	SI89iGAHgizXdbWBMaZeLjxPb37y3K5wLOySzCQy826p98dem0UZI5Nr2K3nP+56FVkyj3am8C6
	GSHfnDoxmJ+j3dsXfmbI3hRE1vpdwucaOESy4Aygon49/u6vMoLjo9dxvLnOqIz3tQMIU3Q6GB1
	8Hziftlk6iDWv7UqrDDOotWX3S3cQmAvDiSrFPbhISI1OPSOv0yJOL6rB14dS3cn86GZ+YKNByW
	ytXZDO3DsLQZyBmgOB0O6O+FgQjrJZcxzV3IQt1Tllk1EsQyS0GhCC0Av/mNKG61VKN2yzMrq/b
	KL+o9tKo8qoBYSvrmZEjceKjMM0NGnbQI+vYM4Vudcuoe+Ug9aZ90XIJvO4eWv2dHZA8yxairjS
	EVZh07RoIisWxWNJ9A=
X-Received: by 2002:a17:902:db06:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2e2c84b48d6mr11044645ad.1.1790659995651;
        Mon, 28 Sep 2026 22:33:15 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.33.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:15 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
Date: Tue, 29 Sep 2026 13:32:26 +0800
Message-ID: <20260929053231.66085-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929053231.66085-1-songmuchun@bytedance.com>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in
two places: it keeps allocations on the normal path and takes a reference
when a backing page is supplied for reuse.

After Device DAX switched to the common per-zone shared tail page, both
conditions can be determined locally. DAX supplies ptpfn for every shared
tail mapping and requests an allocation only for compound head mappings,
whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
selects the correct allocation path.

When ptpfn is supplied, the caller is reusing an existing backing page.
Once the slab allocator is available, take a reference for each reused
mapping to balance the release performed by vmemmap_free(). Although the
buddy allocator is available before slab, no vmemmap population occurs in
that interval. Earlier mappings are backed by memblock/reserved memory and
do not need page reference accounting.

Remove VMEMMAP_POPULATE_DAX and the flags argument from the vmemmap
population helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Explain why the buddy-to-slab initialization gap is safe (suggested by
  Qi Zheng)
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 111efc802465..8219abc6c3e5 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -32,12 +32,6 @@
 #include <asm/dma.h>
 #include <asm/tlbflush.h>
 
-/*
- * Flags for vmemmap_populate_range and friends.
- */
-/* Vmemmap population for ZONE_DEVICE compound pages */
-#define VMEMMAP_POPULATE_DAX		0x0001
-
 #include "internal.h"
 #include "mm_init.h"
 #include "sparse.h"
@@ -237,7 +231,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-		struct vmem_altmap *altmap, unsigned long flags)
+		struct vmem_altmap *altmap)
 {
 	struct zone *zone;
 	struct page *page;
@@ -247,7 +241,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 	 * Device DAX still relies on vmemmap_populate_compound_pages() for
 	 * head/first-tail allocation and tail-page reuse.
 	 */
-	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
+	if (!vmemmap_optimizable_pfn(pfn))
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -259,8 +253,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-				       struct vmem_altmap *altmap,
-				       unsigned long ptpfn, unsigned long flags)
+		struct vmem_altmap *altmap, unsigned long ptpfn)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -269,7 +262,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap);
 
 			if (!p)
 				return NULL;
@@ -287,7 +280,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * Use try_get_page() to prevent the shared page refcount
 			 * from overflowing.
 			 */
-			if ((flags & VMEMMAP_POPULATE_DAX) &&
+			if (slab_is_available() &&
 			    !try_get_page(pfn_to_page(ptpfn)))
 				return NULL;
 		}
@@ -351,8 +344,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn,
-					      unsigned long flags)
+					      unsigned long ptpfn)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -372,7 +364,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn, flags);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -383,15 +375,14 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 static int __meminit vmemmap_populate_range(unsigned long start,
 					    unsigned long end, int node,
 					    struct vmem_altmap *altmap,
-					    unsigned long ptpfn,
-					    unsigned long flags)
+					    unsigned long ptpfn)
 {
 	unsigned long addr = start;
 	pte_t *pte;
 
 	for (; addr < end; addr += PAGE_SIZE) {
 		pte = vmemmap_populate_address(addr, node, altmap,
-					       ptpfn, flags);
+					       ptpfn);
 		if (!pte)
 			return -ENOMEM;
 	}
@@ -402,7 +393,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
+	return vmemmap_populate_range(start, end, node, altmap, -1);
 }
 
 /*
@@ -531,7 +522,6 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
-	unsigned long flags = VMEMMAP_POPULATE_DAX;
 	struct page *page;
 	unsigned int order = pfn_to_section_compound_order(start_pfn);
 
@@ -541,14 +531,14 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 
 	if (reuse_compound_section(start_pfn, pgmap))
 		return vmemmap_populate_range(start, end, node, NULL,
-					      page_to_pfn(page), flags);
+					      page_to_pfn(page));
 
 	size = min(end - start, (1UL << order) * sizeof(struct page));
 	for (addr = start; addr < end; addr += size) {
 		unsigned long next, last = addr + size;
 
 		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1, flags);
+		pte = vmemmap_populate_address(addr, node, NULL, -1);
 		if (!pte)
 			return -ENOMEM;
 
@@ -558,7 +548,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 */
 		next = addr + PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    page_to_pfn(page), flags);
+					    page_to_pfn(page));
 		if (rc)
 			return -ENOMEM;
 	}
-- 
2.54.0

