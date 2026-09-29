Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E43DB63F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660015; cv=none; b=P23XbXdEiG9ZOk+c6oZJQRXdZiaADUd7K+Atf6Eqy3Sz5OsYXmKddwiNX6hYcK4YXnQJXeHT4V8E3MclJ+k/TLlkjBbPu9sj8f5uxCmeXcMbb+R/D6biJPY47YMCMLXFPHOC8AGK7TdJtFdfX6Oh1qe6W+EXvoWlWciZ14rJqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660015; c=relaxed/simple;
	bh=2srXlKJ8XWfz8OSUmVwriDWpk6BA3ai5a6ADoCD4n9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rE6GIxtVLYObF+2389VeI4xyw4jA/vHRq//fT4YwCCL8be+CftLPgRFn380+E+MQAyQQXFn2LWnNqOOVUxflB5uSRHdejmaDkVKEhkZkPhSnVI1nHFp/1AbDvcQ3Q7unA5r33bmJUrE/gvqphwPSKmTegno7id63Abw54iFi44s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Rdc+u6ox; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Rdc+u6ox"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so16876605ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790660013; x=1791264813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWQii0KU4eCZDNyN5Go6yzEsWjVyPkRiAzmEp1lyEhc=;
        b=Rdc+u6oxALugu38E4BjqTGck1nww1m4A5+jlIBm2BArL3xWUKRKL6b3HzbyXXTRMyk
         bpUg4BGkk5OeYm4XCV9oItrLd1Rnqoid46qCFAywqYvK7i2RCuppjyn6VU5+zXgnkNQ6
         NaxHbFVGyWZXWDbAExOS9kP2MyURww43wZh2KwWxO5+cAM5R4goWlPRytrE1N8EBEL0t
         HTCRElvPGPOVC65NvgiuKjp4rcKYO4F2Q8+PwzHwe3kaFfxn4purhgwiPqqUPynD0dci
         gjyk5LwtRd+PN8kpC1DmVRnRFh23Xh+RwnF2zYGSGdMcdneNbizvLRLtY1c+ECAzvTCK
         CkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660013; x=1791264813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWQii0KU4eCZDNyN5Go6yzEsWjVyPkRiAzmEp1lyEhc=;
        b=IcFfrRgNLUqYAOeDoqcCM9d+zimAc/BfA75FZ1JShBwg+UlgfH56SvzQ0HzWComrp0
         HMsOlyZx/mBrNziIULORS73L2PRCmUeSg3jISakAD6mkaFINaVlex6Y1fvbyT+l6dI1t
         LQSXXCjgrRKx6h2QjX/iO5XW6XQX3b7pv/lN8eLhysEArbhFtOcPAyzT6ipDeDYJz/kU
         zm8Rh/FThjZHpqFu5+dRMQO38idB9RGg0kvoE0lxOS2N889zucwrtKmDOG8FfhRRaZS8
         LNqJPK1Pk0sg5kW91OKeSKdodt2mVuji3lw8g8D9JV2GjBcPWNqGBD/2AOZASTWvTQYE
         N5kw==
X-Forwarded-Encrypted: i=1; AKwUvBzezPb9OI027DHHyL+grU/GJJv3Q/ZujpzgQ2l1P7bT9f9zgRihiuosl1ywjqOqx4/As6j/EHs81OwXGfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRsVDq+NNMBrRg8xcrb2sp+bPw4F1CnOyWH/8k0MIxaDN8pIJb
	kjqvzU9DLZTXTZd6YWuVLZYo8l+Cof3Tu+91P0EFoyvWjMLsMdGNZi33TeCSWXHE0hg=
X-Gm-Gg: AYBFou3+OIfYTt1qIdyvTdC/E5qZp2d6fYuI4MgE77zRqanJuIdyUwTdW2+0bG1nNXv
	Hmb4BwvBIlIe99eYPF19FT35M+NWWvMCWTzNFS9161I+zq6vWAba1o7hGMFB9W9JVZleoNPfKEZ
	gjXRSfnNuSafhT452UTLhLfH7xv1mGybWaOk7EU/Tv5xGsKEFdbsiQvb18moUQ10bC00wBskthk
	+ZV8ekY6vMEE8wLiljjasEhvEPlC9EqDDHMEGckBshDjOeGmI+p5CHax9y3NlNBXBiueUPMvFMR
	EnazDjz25VUlGEl6AO2VUGS1Ww91j0CF8WgKEYOtJ2xaUPZpgifUuXUZDSZdfxOWO1uYo61eCQ+
	2Enj3+FzjdNunJSz7PHBfdILadg0Q5nBQKtgY+PzGPmxpvUPEA6t+MEY0O63mctlVzX+92mvD9T
	Vy6efh+hurULXYCjyahIzdvD2P6HP5+mv6c4S/4cuH9cxmUMMCnjHm/dvGFuMnEC5SNr/m65k8i
	tR4mSdRpJF/9MZDIMs=
X-Received: by 2002:a17:902:d98b:b0:2df:8ff9:514d with SMTP id d9443c01a7336-2df8ff97286mr102857185ad.62.1790660013300;
        Mon, 28 Sep 2026 22:33:33 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.33.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:32 -0700 (PDT)
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
Subject: [PATCH v3 3/6] mm/sparse-vmemmap: drop Device DAX-specific population path
Date: Tue, 29 Sep 2026 13:32:28 +0800
Message-ID: <20260929053231.66085-4-songmuchun@bytedance.com>
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

The common vmemmap path selects the shared page for optimized mappings
itself, so Device DAX no longer needs vmemmap_populate_compound_pages()
to find a shared tail page and pass its backing PFN through the generic
population helpers.

Remove the Device DAX-specific population path and let section memmap
population always use vmemmap_populate(). The powerpc retains an
architecture-specific compound-page implementation, so select it directly
from radix__vmemmap_populate() for optimizable sections.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Use the public order-based optimization predicate in the powerpc path

v2:
- Collect Acked-by from Qi Zheng
---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  3 +
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 71 +-----------------------
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9ca28e4a610a..fd13fa91e5c0 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1122,7 +1122,10 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned long pfn = page_to_pfn((struct page *)start);
 
+	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 56bb4567a494..1650d6bc1211 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1046,7 +1046,7 @@ static void zone_device_page_init_from_template(struct page *page,
  * initialize is a lot smaller that the total amount of struct pages being
  * mapped. This is a paired / mild layering violation with explicit knowledge
  * of how the sparse_vmemmap internals handle compound pages in the lack
- * of an altmap. See vmemmap_populate_compound_pages().
+ * of an altmap.
  */
 static inline unsigned long compound_nr_pages(unsigned long pfn,
 					      struct dev_pagemap *pgmap)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index ee4c113ca938..dee95e520376 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -499,71 +499,6 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-#ifndef vmemmap_populate_compound_pages
-/*
- * For compound pages bigger than section size (e.g. x86 1G compound
- * pages with 2M subsection size) fill the rest of sections as tail
- * pages.
- *
- * Note that memremap_pages() resets @nr_range value and will increment
- * it after each range successful onlining. Thus the value or @nr_range
- * at section memmap populate corresponds to the in-progress range
- * being onlined here.
- */
-static bool __meminit reuse_compound_section(unsigned long start_pfn,
-					     struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
-	unsigned long offset = start_pfn -
-		PHYS_PFN(pgmap->ranges[pgmap->nr_range].start);
-
-	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
-}
-
-static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-						     unsigned long start,
-						     unsigned long end, int node,
-						     struct dev_pagemap *pgmap)
-{
-	unsigned long size, addr;
-	pte_t *pte;
-	int rc;
-	struct page *page;
-	unsigned int order = pfn_to_section_compound_order(start_pfn);
-
-	page = vmemmap_shared_tail_page(order, device_zone(node));
-	if (!page)
-		return -ENOMEM;
-
-	if (reuse_compound_section(start_pfn, pgmap))
-		return vmemmap_populate_range(start, end, node, NULL,
-					      page_to_pfn(page));
-
-	size = min(end - start, (1UL << order) * sizeof(struct page));
-	for (addr = start; addr < end; addr += size) {
-		unsigned long next, last = addr + size;
-
-		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1);
-		if (!pte)
-			return -ENOMEM;
-
-		/*
-		 * Reuse the shared page for the rest of tail pages
-		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
-		 */
-		next = addr + PAGE_SIZE;
-		rc = vmemmap_populate_range(next, last, node, NULL,
-					    page_to_pfn(page));
-		if (rc)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-#endif
-
 struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
@@ -576,11 +511,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
-		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
-	else
-		r = vmemmap_populate(start, end, nid, altmap);
-
+	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
 
-- 
2.54.0

