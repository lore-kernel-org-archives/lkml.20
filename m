Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C193EC827
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541072; cv=none; b=XRXJzsK29gGgvdH17bpirXgK/P4fsMu2llG9thS9xqb7W67zINNLM+dyu9sy7oWVlLcGHfXmB6fu6NPcemkQcT4/5FkEx0hu3wL/72AHF3fFzLR7uDaLRvLUgcQfGiSfMklJIO50OSK8JxEPHCLfzna/tQdGMDyhlka/XDGSXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541072; c=relaxed/simple;
	bh=XXJonAu5v5lmenvG0H3fDY0XU6EMxiTGRHxJPTiZN5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWE3QIkfXc5/M8fd99ZUe/lR0joTGGXuMUyr4yvskjEyej666MGDQnWo6YZ7dab1Jf8mysl9iIKt4WQIiQZvidonalc8HEDCMTKI+79osPYbhzEusUfimgftGkSBErL0YAOrGxeynBtQg/RssYC+W8QmY716ptOPYtjuu34aasY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WaoFARB5; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WaoFARB5"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso4663595ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541070; x=1790145870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZbZ6WC7vZbHjIhgnid+8T29mCn5dRvITTk6eMnH6Vk=;
        b=WaoFARB5SK+WFgGhp7/NZvS/mlqRN2nUPm+MimiVkvBANvdftB2/MUn826bOm2txcu
         svkK0QBrBzjUuzPNFkH3B6NcPFJFdEmJQR3dxzsl96VEfrJuUYsFNN1F8Tw9D6xvGSdf
         cPMIut6SCFlhNt58zKxNkwRwEx9/6jgNDeNsE1CtfpDqCu+0z00TLRe2TtQ3Qg/oCmvZ
         eqHc/rCBJjpwvk/aWdfhcbn94IzszTasK+ijMIaKIc2qlqNTFwd74wKhjVUWzZ8+jSA6
         GwjPGFj9TFa1ShuiJfcv05D02LRjwrzml6d8zfj7h+ZQhJYC4GOObQ5xEAfkg4q5ymIv
         JXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541070; x=1790145870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZbZ6WC7vZbHjIhgnid+8T29mCn5dRvITTk6eMnH6Vk=;
        b=X4/tO0Ly82XrfeYo28YO8+n3w4FpS/ZkTwWHQib0Pou/kNevDz8cIiL0GtITy5v+A4
         zqUTdzjt3RV8k06rr31bWK0lcD2xwdRXpSm5T2NZzuhuYnxG7QN+0nJL4QmsNOmBejo8
         X0J05I4RZIShnCAleu3+up3VY4c8KbTeAd73PJPnsh8Wsnn7FezETnq0xRJ8QhvnVd2j
         y8TfK2VPFUy7NIf94Nie4pE1w6eKTPJxoWCYaqElRqsoMgggAt01IMkdVoV5RCmuEPdE
         9RhcG1Syuf5PEjEBU4Jdeevc/VSAP5Hx07y3rMXPVwsYRFlnQf6BwNOdsjk78NoDehv8
         U80w==
X-Forwarded-Encrypted: i=1; AKwUvBxynKpm0i0cN5LCCxxXcpQxiOw5uMY7GUA+iH08pIyiHYLfGAy++VnP1ek4UJAdEeilDIehmTrgNcJjtic=@vger.kernel.org
X-Gm-Message-State: AFuF++mlhgkVK/5tsQLSRoErtzI63Og9p9ogb2zbMX6TKs9fcTdkBxIW
	KckpzPbnCS81ebTa+qrHe0tXexA4UfOnevo4FFO8USx0fPqLGSH/FCMIFvNuKnkHr5k=
X-Gm-Gg: AYBFou0vv/VdDc037tdb1JSiLzjDPWX+ax2u5TM7tY5PsjQXfGKgRjznIIDlerLlelp
	oe/voS14RgOrlUH4EMFYK3RAD/GXLBPXSI7d1Gq17BidCXRiMd05f8bmyGjmraOVAHic6nG4TVK
	bqieE2yKv5q0QbGZKTOdL6f/iBOqDkebGd/GgCqzxvVkrLQHtt7xHBxgH/+iymwhLvbHtw4SJDu
	Pv69kpEUwxJtArKI9YrCSxGrKOBN8bYFkVH328M1cllXRNr5WHPCDePXVSBla3asu3HTB1ZEkDT
	RH9yKG/Gl+PFUXFT1Re5o27lqmDj1WqPH/VNt5sWD0QEo03MBghsGRo8Ty9Ozr/cpTe11T4Qrkf
	AkgZ2PifdA3fPApN1X5uBXXmm5zE02hTSSIrnt9pDynMgaQV5Ga9zPMdH1qkSad/zN2aLaR01aJ
	6mphQDhRVJ0RSbWh/8OPZ+HHMTB7BQ1o4WIUpOI605n9RMDItx1eL/LjLx5Txa7eWV36EPkENUt
	K9ZtaDZew2GHjUVMoc=
X-Received: by 2002:a17:902:ce8f:b0:2da:e967:7953 with SMTP id d9443c01a7336-2dd8e404066mr28394075ad.12.1789541069935;
        Tue, 15 Sep 2026 23:44:29 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:29 -0700 (PDT)
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
Subject: [PATCH v4 08/11] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Wed, 16 Sep 2026 14:43:38 +0800
Message-ID: <20260916064341.1825793-9-songmuchun@bytedance.com>
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
index cf692b2b5f7b..ee068f24a79f 100644
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
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
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

