Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553F399351
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288828; cv=none; b=I/jTPRb3MVZ4tJMGhXRcX5n1RO2lLMbVtwCkkz43vZYzTkKG6ra8uEgFisB4T3JTSk8H662mkE38XheihI6R1MCk4KpgRAxXu5AIgO41T9CMCBCN4bZl6jbrCNvxA/KhHMnK3nhDSBrQB4rJgCSS2Jekwz2ComxaTpSqV/PrOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288828; c=relaxed/simple;
	bh=ERvHyzbM58ZbWb1//ykapsIA81TlTuDlx//Ygo4cUVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSAAhpLP/DkZpcp6q0Gsrn7IdJycXrdcmmm7ymIjq45UFLdlynvMyt5JqMhYQroWdTWOXS/az+kxDyZrJFmc0utujA4oO/4qkx5GalRL4nTSpbNA6MxDl3ywcScYf4/LRmnnTQP4hrSaJEEEp+NU4E8WH2y2Zg6mQRy0yD2d3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DR9WV2dZ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DR9WV2dZ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so971476b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288826; x=1789893626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFsIa9cK+8+fehtCpbOiW01jVXax8X3u6/tt3T4Yifc=;
        b=DR9WV2dZp+E2Yrawvbe71qoA9GwgGNaE/lrQfRnH90AeRuKJ9ofeJHXB9NluXHBhVJ
         /W+jPoWz8tkQ058DnZ/d4y09DOVLU7rcw/c+aRmSDTqr6YaXEnQvSEvOeprlPK4PQHSe
         6nkEtUAT9B9r/I4Ybc/K9nWhuFFdMx9g2OLPIlvC+TJLnI5OR+oD7QEh5qu7VoCkj1LL
         QNH1MyAKlsxiP4YTf3eJtIjWvZRnon3brL5IMHSyPK01v2WZQH/V/OvLPwe2BBOKqNCg
         evOIiIpJ8RR99jNSD9CV3NA3dgWzfVFm1XTaCay3VYTBDPaMuEnVW1PCZMu6ZBcnKnVb
         MLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288826; x=1789893626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFsIa9cK+8+fehtCpbOiW01jVXax8X3u6/tt3T4Yifc=;
        b=E/dyT0dvG9TZx85Jk66GLMABTt/xGSmuB3xmQFmzEvaQzt13/BhsrzbTMFRrS1e5BG
         Zr/GCMaMhRh44m7iYWoYpIoR6FzdO5vmIGuypkeEXjNierNBk2VmRoAeYHfa9GSX7G4y
         /j58cqfceSk+W3QnQhdazoC9KY7Gg8WFoSOMND1wrAqetIhYSQr6DNFPGucMJnb1808I
         cSuKy2VFRl/pZ/Hp1sYpY4az2C0Pnqedai29RphyU73X7bt0Uzu/f452BZYKkQ7Nfh9K
         p6zL6Ujx/zZW5ED6hqsH7xgXpfNWLtTUCnIf4UCil/N+x18opSjNtlPyJJ5PCYcBYL4C
         bH1A==
X-Forwarded-Encrypted: i=1; AKwUvBz3/Hw9xSGSP6EzSIrIDw5kd2pb/Sakq/A7knpnY6oCNOru0Leusi1EkcCfvWCqOhsWlFSLI1YguNFbq6k=@vger.kernel.org
X-Gm-Message-State: AFuF++mwlrikDLISyOimGcS6qlOduBep87jcPllZElrlSWg+qsfThJeZ
	UNK/UkVHq+Nw9Xw9xMELJ5o65oIS4Nkzj4vu/mI1Bj6jvkEywXKq8eh4co9Q/a+lylo=
X-Gm-Gg: AYBFou2sO8PiAoYGgSCgRLQTPsdWpU3A3ekJV5sVoMzTCTjIBMh3AYK7l2GjaI4uyfZ
	pzRsPPCUadmpxOMnPITp34WsrLz8yzmxIakQF8bUa67ILFbkhr5iM7kA7qPIxm6L499UYZGavlw
	E9k+v127R90l+pOPRRMeWS1+jnAUaLX+mJAjIoe3wFL+Dzmju/hJTqnuT4ZiNZjydTjMg+jkneL
	FyeGdRl/gMwRXBMHADTankaO3jI4bjquDwzh1Wj04lu5bjmEa2quHKa+I/BHLtYIsLne/6c2tJa
	goDMAYAlcsnC2P+XfQbUKjAQAXYCHpL2V3JuVXDv3JmdWEXjxcgaZ01m0ij1Il+r+cofKia5KSa
	n2a0MESd6rEgmfJ4pu5DveulGtEfYMfZ/Jl0blLx3NYWseVYz3jVJfahToPXbygmK/O05sIcLdf
	6lBv9ACU4IeoXpurnKVmzmFlSqBAhr5tSQRixxcbaECRjbp2GP17C1DAVYteBDqMC3fw2yf+3Uu
	bxe65isiSs6A7YuogA+w+3k7NE=
X-Received: by 2002:a05:6a00:148d:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-86b30413328mr18406280b3a.1.1789288825870;
        Sun, 13 Sep 2026 01:40:25 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.40.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:40:25 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
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
Subject: [PATCH 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
Date: Sun, 13 Sep 2026 16:37:29 +0800
Message-ID: <20260913083734.86802-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913083734.86802-1-songmuchun@bytedance.com>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in two
places: it keeps allocations on the normal path and takes a reference when
a backing page is supplied for reuse.

After Device DAX switched to the common per-zone shared tail page, both
conditions can be determined locally. DAX supplies ptpfn for every shared
tail mapping and requests an allocation only for compound head mappings,
whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
selects the correct allocation path.

When ptpfn is supplied, the caller is reusing an existing backing page.
Once the slab allocator is available, take a reference for each reused
mapping to balance the release performed by vmemmap_free(). Early mappings
are backed by memblock/reserved memory and do not need page reference
accounting.

Remove VMEMMAP_POPULATE_DAX and the flags argument from the vmemmap
population helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 96506f594924..878d29a4e862 100644
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
@@ -208,7 +202,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 }
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-		struct vmem_altmap *altmap, unsigned long flags)
+		struct vmem_altmap *altmap)
 {
 	struct zone *zone;
 	struct page *page;
@@ -218,7 +212,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 	 * Device DAX still relies on vmemmap_populate_compound_pages() for
 	 * head/first-tail allocation and tail-page reuse.
 	 */
-	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
+	if (!vmemmap_optimizable_pfn(pfn))
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -230,8 +224,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-				       struct vmem_altmap *altmap,
-				       unsigned long ptpfn, unsigned long flags)
+		struct vmem_altmap *altmap, unsigned long ptpfn)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -240,7 +233,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap);
 
 			if (!p)
 				return NULL;
@@ -255,7 +248,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_DAX)
+			if (slab_is_available())
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -318,8 +311,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn,
-					      unsigned long flags)
+					      unsigned long ptpfn)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -339,7 +331,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn, flags);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -350,15 +342,14 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
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
@@ -369,7 +360,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
+	return vmemmap_populate_range(start, end, node, altmap, -1);
 }
 
 /*
@@ -498,7 +489,6 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
-	unsigned long flags = VMEMMAP_POPULATE_DAX;
 	struct page *page;
 	unsigned int order = pfn_to_section_compound_order(start_pfn);
 
@@ -508,14 +498,14 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 
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
 
@@ -525,7 +515,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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

