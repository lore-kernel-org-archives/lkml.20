Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC50F2EEE91
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836677; cv=none; b=UdQIxuowCU0EKH2fjmArSQ9RkOS0wtOFlpQXLVUdkyuSbdmCivj4WdQwVaNrLw+KSzvWGmOoc0tl6p8soSjh8X4GG2IAvowI4GbugbBvKo9ETWu8GrLO/4BZqoN1o+OcisgRj9jcd8f1vLgqqlX72y5AWqkr32ZOu9560uNHPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836677; c=relaxed/simple;
	bh=Vxc/pXcxmB+iFgkrcwmPIqJ1huzGQ8x23bFD3zc2UMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qY7K5Iu5X9EsfggzbcsFnW2s6RUkEKwVTzIapS8bEd8Ri4V24K/aXiekj4lidMAzazvHx6nENirVrdnaYx1dA8Kh5EBif0dq7jE+p4FOBW2/dKETHFEQ7gbhFH0oBkvBzyxdmPCnN/z8UoSmT8I99g8F9Sa9jkwfXOxa2fvzKj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=euVwC79H; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="euVwC79H"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso3529321b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836675; x=1789441475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5VVmQasiv9FjgFp8hyWKR9WL3WpfimdUt+OCxubG2c=;
        b=euVwC79HPl0mbIU7hKHQtRFJlCDo0y/Zx1XaLx8vVJCgRFep6mQtHhf3Gw/b5gYWs9
         UM9w1Y8Qmjw2aRAbhb9RBXuvQ51FklYUg8G4tgzKFClef9jXCEsvRp+VPplAuqUBFKaw
         g4pkLPIev0DbmB4FplkS0e/lyJ4g4Q6imLBggD/Pzyr4WonaWKgOI1sqJsHhhdCD42Y7
         TWLkASY3j3c1tH+4HAZcCjy3JVsmeP306JZ4KaMY5pKd60Dk9UN7RNNDZWPsrAB8N4eA
         ZqkRUT3HUV3AtBFYRI6haKOfIarLF289O+5mHmnAytVVThYMMlMr96/+42++AKGlY83K
         yqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836675; x=1789441475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5VVmQasiv9FjgFp8hyWKR9WL3WpfimdUt+OCxubG2c=;
        b=pEsBvDe7xfotCaULvzEMMrZ7foCSOCCLmfCQlIGmJnsNGO5fmo68VlL3kMJeq4z+6y
         yCOuf05pUbrtlDnjzESdSpLcKOs4cdJIYn4H15EkvatRPasU8G39cIyUgoXp7mt/YKgp
         308cZqO0IFqhAua8HRbzTGWJtK8lPA3QCHtB9JLZpHOFmoa+yAQAJLxOLqtPPNNQTNyZ
         XrTc5NMGfGgyNw+9ejJWrlyXH/CE7jVXTk3Pjl3GjXqWKLsRmR1Rv4ztu0Rm/oU/WjEI
         4vP+RvqrZijGqHIOwWFZNna2IdE1SWRWuZhDiStETyO0wvqbYkHag5lBS6QvOKfhrqhD
         75vg==
X-Forwarded-Encrypted: i=1; AKwUvBx73Zga4qa32Dtaofh8ejzEfYuQZ2Fz0zBG62b9XmyqIyNSIdV63pOUw8RsSFSb5VtM+LO5bEeqRzDoCHs=@vger.kernel.org
X-Gm-Message-State: AFuF++lmpQxpMZz3M6hGJGWw9GejW4wJtYDZpR9tVLOTNQKoWHsVDl9L
	sdgH1Nt37WH0NtwYkDab8YPRtLxuDWGgVtxrv/0C8kfYB3JsPqSKlMWt81i0PVAtSEY=
X-Gm-Gg: AYBFou3hIaRw1X6FzsoMXGfiZqqp+Q8ygoNucIs/z3qFUSO8ZvdZG6a5iZXrGTQHP1d
	nxxoQawBg9gPKXcJAZ9Ph/amNbj/OU7v/g+GM7Snz5gBzrYEEWbJungcqYjRkEf7zRrYdTsw1eF
	JP+bY+YXhL82Bm9CDjSpZAT0JQLlLNb7UUIA0ws/hDWS0fcOH1QzbybeknO/+G6uNlyV5tUBlMr
	7SmAtrE3gi7stC2Bc3nOFIM3WKa255IdMFMWotILcBfLawThNRfJIBmraSoJ9sbR/vEO52g0e3+
	3me0M6h4+Mzr6PH8YqKf0YER5fSJP4oSOIKc53TvVECneDfA8FTnErgNTwoon/fFvDAcgnfCTtM
	7SEw8/5Uypsz/85/Xf6XL5fmW/WHKpJzePC9n5Soa3KTiUaQEqJ5NnIDlXGUhiHjaf6xWSAl17W
	4llQDXJ4WbEXL4GUtH82UYa2tE/Or00Q0I2u5e4uH6o/d3ycIVVxpe57vVXZkLoG/6rp/3sIsr8
	w6ZVHIEZuKVheWsECTQ5Jsd
X-Received: by 2002:a05:6a00:991:b0:848:4c3a:a359 with SMTP id d2e1a72fcca58-85ffeadd0famr28321527b3a.19.1788836675326;
        Mon, 07 Sep 2026 20:04:35 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:34 -0700 (PDT)
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
Subject: [PATCH v2 08/11] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Tue,  8 Sep 2026 11:03:32 +0800
Message-ID: <20260908030335.96549-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The powerpc radix compound vmemmap population path still finds a reusable
tail page by walking the vmemmap page tables.

Switch it to the common vmemmap_shared_tail_page() helper instead, so it
can use the shared vmemmap page directly to simplify the code.

This removes the powerpc-specific tail-page lookup and its fallback path
and aligns the device DAX vmemmap optimization path with HugeTLB.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 80 +++---------------------
 1 file changed, 9 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cf692b2b5f7b..831c231a4a18 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -19,6 +19,7 @@
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
 #include <linux/kfence.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -1250,59 +1251,6 @@ static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int
 	return pte;
 }
 
-static pte_t * __meminit vmemmap_compound_tail_page(unsigned long addr,
-						    unsigned long pfn_offset, int node)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-	unsigned long map_addr;
-
-	/* the second vmemmap page which we use for duplication */
-	map_addr = addr - pfn_offset * sizeof(struct page) + PAGE_SIZE;
-	pgd = pgd_offset_k(map_addr);
-	p4d = p4d_offset(pgd, map_addr);
-	pud = vmemmap_pud_alloc(p4d, node, map_addr);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_alloc(pud, node, map_addr);
-	if (!pmd)
-		return NULL;
-	if (pmd_leaf(*pmd))
-		/*
-		 * The second page is mapped as a hugepage due to a nearby request.
-		 * Force our mapping to page size without deduplication
-		 */
-		return NULL;
-	pte = vmemmap_pte_alloc(pmd, node, map_addr);
-	if (!pte)
-		return NULL;
-	/*
-	 * Check if there exist a mapping to the left
-	 */
-	if (pte_none(*pte)) {
-		/*
-		 * Populate the head page vmemmap page.
-		 * It can fall in different pmd, hence
-		 * vmemmap_populate_address()
-		 */
-		pte = radix__vmemmap_populate_address(map_addr - PAGE_SIZE, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		/*
-		 * Populate the tail pages vmemmap page
-		 */
-		pte = radix__vmemmap_pte_populate(pmd, map_addr, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		vmemmap_verify(pte, node, map_addr, map_addr + PAGE_SIZE);
-		return pte;
-	}
-	return pte;
-}
-
 int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					      unsigned long start,
 					      unsigned long end, int node,
@@ -1320,6 +1268,12 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	struct page *tail_page;
+	unsigned int order = pfn_to_section_order(start_pfn);
+
+	tail_page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!tail_page)
+		return -ENOMEM;
 
 	for (addr = start; addr < end; addr = next) {
 
@@ -1349,10 +1303,9 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			next = addr + PAGE_SIZE;
 			continue;
 		} else {
-			unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
+			unsigned long nr_pages = 1UL << order;
 			unsigned long addr_pfn = page_to_pfn((struct page *)addr);
 			unsigned long pfn_offset = addr_pfn - ALIGN_DOWN(addr_pfn, nr_pages);
-			pte_t *tail_page_pte;
 
 			/*
 			 * if the address is aligned to huge page size it is the
@@ -1377,23 +1330,8 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 				next = addr + 2 * PAGE_SIZE;
 				continue;
 			}
-			/*
-			 * get the 2nd mapping details
-			 * Also create it if that doesn't exist
-			 */
-			tail_page_pte = vmemmap_compound_tail_page(addr, pfn_offset, node);
-			if (!tail_page_pte) {
-
-				pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
-				if (!pte)
-					return -ENOMEM;
-				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-				next = addr + PAGE_SIZE;
-				continue;
-			}
 
-			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, pte_page(*tail_page_pte));
+			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, tail_page);
 			if (!pte)
 				return -ENOMEM;
 			vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-- 
2.54.0

