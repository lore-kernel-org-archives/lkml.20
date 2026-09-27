Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708912F3614
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477718; cv=none; b=tCdCfZDLSL48d8noy2rbLjBkeYjpIVSIF++iB77DMAnJofoRVfweOz+nFX635jM9HxWyXSA0sc7rgtJ1Tn2+5+AEt7Z/v2ZLgkJKqi7wi4Q3726cVa1M6HsNdgvXWd9e7PwnDs9P4t8vFAE7FSQWGPLiNYIjWCMkkPh6EpKmlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477718; c=relaxed/simple;
	bh=bryz2dDq9Nby52aDcGSGfsebpkbeGdieGmASuE5PPXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwioLmEaPGzrJju3fvotf8Wj7ZIMQbBDxhW/pvhv7UT4tePkzWzNbfpn8JKvfkl3e+xvWSSL6pLE3+FFmPF9zuTPE8R/hMaRIIACtjZsXFrJrxS29lSxu7q81JSDSarDBLxbaqc83TWkoBfSWZgK7ZNDIT3caZQVh4n9+ev+uLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ccS54Uhg; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ccS54Uhg"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0dc47fee0so392224a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477716; x=1791082516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUj4I6qYRPvWCdYjNQvAZHgpJ85hBpDlWBdY9AxEym4=;
        b=ccS54Uhg9rUsl5dgjHxtZkmUisaF1ESmBlb0tHwtNdxCrpVerARCRKVRlC2UJ6eU3G
         k6DUF24Nc4kEdysHIbtnjbSGQOpHWclqtdJNSj9AL/UV6dbAS8VVy6aUop2qTAb3zYsb
         Po6vg5pUNjbmL0MRz4Ft5r8MUasGMoC06FTSofax6WulyqMCmv4gWBu4Nm5fPYqP6kPo
         NC/ncZpRCUlzizCcTRv6c8lnUlZeX+nN/V1/PcduJue45AM+sZCLJNDPmggkh8Sd+/Aa
         ZD1ChEVaruuocT/gN3h8MF9y+Jen1TXMuQRjDP3O8ZRnT6UxDpsgl+phrKzUmvuEHRgM
         XnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477716; x=1791082516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUj4I6qYRPvWCdYjNQvAZHgpJ85hBpDlWBdY9AxEym4=;
        b=BXQtMC7gYgRG4Bp1zyZbLDzIcDG9HlMKORj2Dl4qgTcSgFONAiWhfIqW0fgb5Kbfx+
         OTA1IokZfIA4FYizYAeSSSdROZa6SZ0Hs/6dAdZ3+SLkCxdc1rhKcAKJqhspx7GYxK3H
         9Cz8r+qzyblEinC+qqZLW5kjI4YGzHLSbv2XZrpLE8J7kYQ28GMwfTqj29nbSS4Z4l81
         nOIFDieB/YpIj2k1Qh4a/JDrTtTjYnnVvk+PzOfW8i5sp4UZHaMiRBpVcm2NM/DhNWWO
         mg5ImJ2O9qeXJIHPjsoKK9qPmYM+N1UzZQ620rodw2pg0QyTdqrgj+leZwVtBY3vplkA
         FTWA==
X-Forwarded-Encrypted: i=1; AKwUvBzwPfy9mowX8KRRmBVElEI1+Hc9gfSy1mLRXMLV01axlXi2suU0GEsGZa/KmIB9/sRJ7Uf00egwopivAv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyrQAyQu25izGNHmZA7yFR5gaC4hvsgGl06+S9fkC47vxWnHFa
	+4q4XVE1YP4HToWsiUWxZIX1SVo8gyKiMKmYhsTa7VaHtuXqkYLuUDUEvJ6Vxlhkz+Q=
X-Gm-Gg: AYBFou3mHB6sm1l2Z4X4GDDrYF/NCRHX499yjlcmOYYNv9ABTno6DazIhNJkRaC+t/1
	hfzu6y+tPy/15kjtEXHBTXh+GuGWrKqMBWEo61onahcc8M1OWUiG5EpO2qQ8Nr0pkukp75+kTlM
	kZakj9C/jEfcKmQqL9HUxg8p5zr17OUcXMdc0IqEa0Jz/2ERrEoyM6K9Q88KeI4t9vMklp0wlWX
	LMt7aWgmdDIGwtgqwUAzblRdV4VHsASNApfqHZX6WMoNQHxNS/IvBlzI3ZlEHUG8jvQLv7LwW2B
	K57xyXSvKM53qVnmoSqMdFaDtxQyJmekWzCgDY33RQILPK8i0/NfXwMj0Lv8KO8+MML4cza+pdj
	kVp0DHXHJ/sBfZ0Hw0LW1mpzmw1mkL5GzY1TyGSPQMGe4MPhbvXk+OmvCgY4Gx+fPXpePiHGpbY
	EXrlFGRVQZ3aDDpR9DQP2JB/ojypEq1rNQtvwSAse1ZPGIj9ahdPUF6bIaQPDHKqQjlSg/6SUlq
	O/qsSR3TtXvnSsLSHdoJw==
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr4179593a91.6.1790477715477;
        Sat, 26 Sep 2026 19:55:15 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:15 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 05/12] mm/sparse-vmemmap: prepare DAX vmemmap population for compound page orders
Date: Sun, 27 Sep 2026 10:54:34 +0800
Message-ID: <20260927025441.741633-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
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

Add a DAX-specific population flag for this transition. It keeps DAX
head/first-tail allocations on the normal vmemmap allocation path, while
preserving the existing page reference for reused DAX tail mappings.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Update the subject and commit message to use compound page order
  terminology

v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e4dae98ba7f8..2457ea2c6dca 100644
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
@@ -243,13 +243,17 @@ static inline struct page *vmemmap_shared_tail_page(unsigned int order,
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
@@ -271,7 +275,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
 
 			if (!p)
 				return NULL;
@@ -286,7 +290,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_PAGEREF)
+			if (flags & VMEMMAP_POPULATE_DAX)
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -546,6 +550,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
+	unsigned long flags = VMEMMAP_POPULATE_DAX;
 
 	if (reuse_compound_section(start_pfn, pgmap)) {
 		pte = compound_section_tail_page(start);
@@ -557,8 +562,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 * with just tail struct pages.
 		 */
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)),
-					      VMEMMAP_POPULATE_PAGEREF);
+					      pte_pfn(ptep_get(pte)), flags);
 	}
 
 	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
@@ -566,13 +570,13 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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
 
@@ -582,8 +586,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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

