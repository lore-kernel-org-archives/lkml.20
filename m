Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB94D513549
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777297; cv=none; b=kVzn2HCRgP6osXL1TnDWmxtmB20uM0CTBycc1svUX9wUU+cwVReanfXn2fP/m4jWwLybCaPoP9tAizwGVjwsshOy0LGMK6nbbWWHesL9QD/Tt34BOPW6Dd0722G7obsBHJ2D65agjLPPpBsfJ0jULi5aJUOMS/b2HOm4ZdP9zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777297; c=relaxed/simple;
	bh=KIbYZIFt/J2ukIvG0ZooIQzOXnVqAUoNzKHjpFuV2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAEQAp3jufL5GFlrQv52d/edZ3ryFrfpyqP7HkTV9XRUHFGDVrZNDoTjI2R4LXnEJW1LyPmxF0pszZwLDuez0u+yL4HqQKJ7JURe5FZ3SObBb183zrHS4CKacZpgksb4JG8HDUENvNvo4H0NGUba7AU1ic4DB8qzzdNUsnpogsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NieONNwk; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NieONNwk"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc4c3304833so2101369a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777279; x=1791382079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfMxtfxa+3COrIjgzxsQNjSW0BqNRs0OC1S2RzR7Pys=;
        b=NieONNwkuR0LF/4PF2jUQnZojT1e5cP1Puep0rGLauPg29kAHqK9QF2kF9mhfhojJ6
         Mqw/bbjuEYxvF+YO1V3vllprCVY+xIkVd2CX/02ZwfsBrjlKKJepQskSe698b6e4gYHc
         vjNqFn1I5FXOTY0bsvg/SINS2eeJun+J+7BqKmKbkb6CqP3oXV3atTM8ofuIQ2/1Yy0a
         +AcZpiT7VE7b/IN0GS1NyUeaiIqP4pDhZD1Wtpj62yi+sOslTBKPOiwqC3WqBygGsEVQ
         lNnIQDqVpK5/EGGUhg52MH3WnUXKBF0SrGOrmBexLwbj7VVJ3Tk5hWxyP6O3inc0kES4
         R66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777279; x=1791382079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfMxtfxa+3COrIjgzxsQNjSW0BqNRs0OC1S2RzR7Pys=;
        b=Q/uYeD7W/r5H/T8En5PHAEJANRWiH7DWKEh6ForQoHQbBr0F+N0bCh5xI7aijuhUUM
         rkHwPD0bLMmHkaeHHJhajfu2TO73ANvPYJMasuC5PozzW04a3h0stqXi6pIcp0UTgfbJ
         Ao4pbKN0SM8RhhRqEe6XpDGvmQHAssKh76TGIoKGetG6iDyhxbz00WY4JRJOwcGZ4HiS
         w0BRFKicFRUP1KAVysGhf5D6lTc3bxuHXAnSdDFIylc5Hn+dyhLqWI917YRiNtjZmMdV
         2tTqAeQIbLdyGUNTf43sACJQsH35ppS7Hi1Ywih2FCShzaOFw8dwGLqbLNCOOjHSkxwj
         8O/A==
X-Forwarded-Encrypted: i=1; AKwUvBwi6/Mzr41YbUb5AYwof+EuEkOJM11IHoBPMj5V0DasT5dRIcYcEmaHoGo/UbAO4uEeYYQRulEH65oxQPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAfr0erRhACwYTqQ3aKCGeFgDB612PcSEsrdh9djospTYOjKx/
	SDlPiYMGZuRhO8Jpv/pgFgL0n2vJIoNSOFyZNsFiHFvPT9dmrvgaZCAqQ4JNEdSra4w=
X-Gm-Gg: AYBFou1j4b1iPFHzPGfnmMe249GUX9FTsrrXPvfTZWLnF/Odx7kiy565REs/LauHTuQ
	2Z1nR/TKu8CF6gUDzZ6m0jt3Kh30fhzHzZKOE6VwuYP47Q6de4Vs2NyYOldARufxJuG8CGPCAE5
	8yN+3chkgTBPPQWf610XV5jZ8CGAv5jKmcwdrgiv6dqDc2Rx7EXNHYJh2LX3WTTBKlQsEu0yA8b
	yU3U0reVSQ1ccRw3jaHesb5vrPfJXXzz9/P0eiag3MOrbpc0yDVqRV6Aiuu4S+txOEz7QhyjH5E
	P3N4QU3Oif9RLvz70YqrtmVPSBrdRAbH6sbZAw0CNbxAydip4eFfKsmokvvpS0/I6PhoLV5ZEnT
	Vt/dt0PfyHTR7BXiUcMC0LS1YlCs+KJYc+Dqw+YSWzWpoat9ia6syFWABddP8XCsU/8OUUbgRtA
	4xjprOy+bYb+BF33Ttk18XxxCxElherXwaxrvqwthcFO+vhRNAGKQQMbVw9nVHybx9FAuFoc6yZ
	LdTW7IJQ9pj2g==
X-Received: by 2002:a17:90b:4acf:b0:39e:4c7f:8b1b with SMTP id 98e67ed59e1d1-3a4d19d23e4mr1306484a91.32.1790777279220;
        Wed, 30 Sep 2026 07:07:59 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:07:58 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 05/12] mm/sparse-vmemmap: prepare DAX vmemmap population for compound page orders
Date: Wed, 30 Sep 2026 22:06:20 +0800
Message-ID: <20260930140627.57431-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX still uses vmemmap_populate_compound_pages() to populate its
compound-page vmemmap mappings. That helper allocates the head and first
tail vmemmap pages explicitly, then reuses the first tail page for the
remaining tail page mappings.

Device DAX is being moved to the section-based vmemmap optimization
infrastructure, but it cannot switch to the generic section-based
population path yet. Once a later patch records the DAX compound page
order in section metadata, DAX head and first-tail PFNs can look
optimizable to the generic helpers as well.

Rename the existing VMEMMAP_POPULATE_PAGEREF flag to
VMEMMAP_POPULATE_DAX and pass it through all paths in
vmemmap_populate_compound_pages() during this transition. This keeps DAX
head/first-tail allocations on the normal vmemmap allocation path, while
preserving the existing page reference for reused DAX tail mappings.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Clarify that the DAX flag is renamed and used on additional paths
  (suggested by David Hildenbrand)
- Make flags const and move it to the top of the function (suggested by
  David Hildenbrand)

v3:
- Update the subject and commit message to use compound page order
  terminology

v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index f77e6e1e5a8b..b4b72f233bf6 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -35,8 +35,8 @@
 /*
  * Flags for vmemmap_populate_range and friends.
  */
-/* Get a ref on the head page struct page, for ZONE_DEVICE compound pages */
-#define VMEMMAP_POPULATE_PAGEREF	0x0001
+/* Vmemmap population for ZONE_DEVICE compound pages */
+#define VMEMMAP_POPULATE_DAX		0x0001
 
 #include "internal.h"
 #include "mm_init.h"
@@ -247,13 +247,17 @@ static inline struct page *vmemmap_shared_tail_page(unsigned int order,
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-					 struct vmem_altmap *altmap)
+		struct vmem_altmap *altmap, unsigned long flags)
 {
 	struct zone *zone;
 	struct page *page;
 	const unsigned int order = pfn_to_section_compound_order(pfn);
 
-	if (!vmemmap_optimizable_pfn(pfn))
+	/*
+	 * Device DAX still relies on vmemmap_populate_compound_pages() for
+	 * head/first-tail allocation and tail-page reuse.
+	 */
+	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -275,7 +279,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
 
 			if (!p)
 				return NULL;
@@ -290,7 +294,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_PAGEREF)
+			if (flags & VMEMMAP_POPULATE_DAX)
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -547,6 +551,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 						     unsigned long end, int node,
 						     struct dev_pagemap *pgmap)
 {
+	const unsigned long flags = VMEMMAP_POPULATE_DAX;
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
@@ -561,8 +566,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 * with just tail struct pages.
 		 */
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)),
-					      VMEMMAP_POPULATE_PAGEREF);
+					      pte_pfn(ptep_get(pte)), flags);
 	}
 
 	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
@@ -570,13 +574,13 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		unsigned long next, last = addr + size;
 
 		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1, 0);
+		pte = vmemmap_populate_address(addr, node, NULL, -1, flags);
 		if (!pte)
 			return -ENOMEM;
 
 		/* Populate the tail pages vmemmap page */
 		next = addr + PAGE_SIZE;
-		pte = vmemmap_populate_address(next, node, NULL, -1, 0);
+		pte = vmemmap_populate_address(next, node, NULL, -1, flags);
 		if (!pte)
 			return -ENOMEM;
 
@@ -586,8 +590,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)),
-					    VMEMMAP_POPULATE_PAGEREF);
+					    pte_pfn(ptep_get(pte)), flags);
 		if (rc)
 			return -ENOMEM;
 	}
-- 
2.54.0

