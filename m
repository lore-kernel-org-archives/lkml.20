Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DDA30F92D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836660; cv=none; b=hMg8M6dHqTTLir5EWaIhmdXYlJ0q3jp5X+a6gnGh+eVB5Y+yLuaw5gJSIV8AklDdOo2QTAKRPhH9gsXwtBYgFy3E8+Mdly+iS6ziV9euwBdOoE+JHbuYv0xLMT2TB47bEiVv6tM0n+h4cowjEc+9CsMXqP9YU/kORcDZ3gYsGXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836660; c=relaxed/simple;
	bh=yR8q1n1I8bNxoF0boV+yOULjBVMjjKAcPkyFRNw1MXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF5KF9F8eBGFeGVoivu2hikz1S9zybnvHed4CkltFZfq21uIhuTVhT2owKnDUBIBSn3mAJ31/VwWTogdNOt1jb8+CYvTtMYoJdhNwqbhjfHpkwC6BelcvZPwfKiBwRvcPfrNi3YIyEtae55waK/iz5KSTfjYPcVuYDoFiJcCnfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=b8U0RpLL; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="b8U0RpLL"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2254dso66642b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836658; x=1789441458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUXKrxViB50EGCJ21IU1wh3SHWR1crLUNz3m8pEDEC8=;
        b=b8U0RpLLsH8UO+M+fWxmVl1cyEmSNsJbSmEspC8z4xq/KnTc/lgaeyPx6Elb6IKp8M
         TKPLaXVFXO3MmsLBHLCGf6X/rofDROFIetUZRNcfJk2VQRWSoNmIPnYHzMpNAM3wjho/
         p7A7eV/O41VwZSoHhImRkwuGOGhxEbmGedJBXT41CaaYiq65v/SVK/D6H9E+hchYkoqN
         /UawtfWnZYxL4Pf4RRbEUpCNBYjDQnfdt9dxirkZ49eRyJ4qcDhB5CB/IWOC4sdqVg4V
         Csa8KpfDxbfCa9fz+Z+/O/lbjNiTrYgBJO5kQctis29bzrl3Vf5hCtWqCcm2lDGjwS+g
         HJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836658; x=1789441458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUXKrxViB50EGCJ21IU1wh3SHWR1crLUNz3m8pEDEC8=;
        b=KRq9WZr/iaTM0qBLx5HXgravnPgTdOKTo2j9tVyxFEZ2kMz3vC/Gn3r+WD8fPnUfzI
         7HMk1cPDHKVMwBk633zDhzymTL0uEAOWBKd+mLBhtS950uGJic5teIJ+vKk2bCnUHUy/
         caGbttlplWPLCqJQcOZzDIBEgunrH3PRxgrh0YC8JXB6a0+426kp4KGTnx4o9ssrzMiV
         3qLbqdVRGrJuE0SDiHEuFFhHc4yu4UCiAMDHKiO132caYtPEkCF29VFyPLTuV5MD6rQ7
         ARpRsv8tRTu0+QG3DPvOD0fZUlRBMFMDmEcCNGnTSidhg0z7QKERFtnDJf4ScyBpWV3N
         5Qxg==
X-Forwarded-Encrypted: i=1; AKwUvBwbej1HM7yV/9VwBmsQ1v1JFhP72v7/grmd3F7ZcTj3m9r4zRxWgpMyJyK3ZozjfoNHFFYvsdSoZHA0Sec=@vger.kernel.org
X-Gm-Message-State: AFuF++mIfjpzB3VB5L9kPan/z89pUA+Ebutie5FMthjKUebAPENm+RZc
	/7s295L0AOijslpkycYyTDSc7x9LRNYcIZkb/4Cvlt/mlAFi14mnJ19+gidKe4aSuyI=
X-Gm-Gg: AYBFou24LKzyv3OuknA8ihTou0jXuvI45WdS3kpHKv5JTpXhZGwnPqUgK30mvtVqLtj
	qRUvrDas5HLKBGKLUJOEGIRTIUm+nOBMEN668A0QAws2HssiXNN1JjyFzZ9+6/ldEcjil7Om/q1
	TO/kpBXKAur+dpHhMrk8GHmya/agFVAR33Wa/bprmbvVMQVh1r00G/38t2P0FzExhuMNjuRMBqF
	cOhBzwnWqmVSpg8yvvL0rjRH7GHnSgxpICr3cOio2Nal5MB3bWMFWJoR6IRIIjJptpNeX/d2K8N
	laty7/Y0m+DiawmWjf30FVc8GvS5j8rBR29tlj/CDG9AvM6R8fNEv9r6YCtrOb4/Dw1m5TE0DMT
	0S1YmJ3mGFBU+uSYR35ARDmmGuYWtJP4MAAiRdFURzmBEKazImWDGLuBuriHeWMYVJ3Z8QqIA7n
	oybJsw3ZMs8wpGzj3kV+MS5sT9ZCU0FBXOBd72+Dpo9h0ox0fF5jfLrJR9l0UM/xlevfO9FIaV4
	nNdy5mRYF7NzlC535eS/OA/
X-Received: by 2002:a05:6a00:1807:b0:862:bb07:2ba1 with SMTP id d2e1a72fcca58-866988d9942mr4431251b3a.4.1788836657402;
        Mon, 07 Sep 2026 20:04:17 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:16 -0700 (PDT)
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
Subject: [PATCH v2 04/11] mm/sparse-vmemmap: prepare DAX vmemmap population for section orders
Date: Tue,  8 Sep 2026 11:03:28 +0800
Message-ID: <20260908030335.96549-5-songmuchun@bytedance.com>
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

Device DAX still uses vmemmap_populate_compound_pages() to populate its
compound-page vmemmap mappings. That helper allocates the head and first
tail vmemmap pages explicitly, then reuses the first tail page for the
remaining tail page mappings.

Device DAX is being moved to the section-based vmemmap optimization
infrastructure, but it cannot switch to the generic section-based
population path yet. Once a later patch records the DAX compound-page
geometry in the section order, DAX head and first-tail PFNs can look
optimizable to the generic helpers as well.

Add a DAX-specific population flag for this transition. It keeps DAX
head/first-tail allocations on the normal vmemmap allocation path, while
preserving the existing page reference for reused DAX tail mappings.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e453ce4675a0..54ae8c284324 100644
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
@@ -208,13 +208,17 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 }
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-					 struct vmem_altmap *altmap)
+		struct vmem_altmap *altmap, unsigned long flags)
 {
 	struct zone *zone;
 	struct page *page;
 	const unsigned int order = pfn_to_section_order(pfn);
 
-	if (!vmemmap_optimizable_pfn(pfn))
+	/*
+	 * Device DAX still relies on vmemmap_populate_compound_pages() for
+	 * head/first-tail allocation and tail-page reuse.
+	 */
+	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -236,7 +240,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
 
 			if (!p)
 				return NULL;
@@ -251,7 +255,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_PAGEREF)
+			if (flags & VMEMMAP_POPULATE_DAX)
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -511,6 +515,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
+	unsigned long flags = VMEMMAP_POPULATE_DAX;
 
 	if (reuse_compound_section(start_pfn, pgmap)) {
 		pte = compound_section_tail_page(start);
@@ -522,8 +527,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 * with just tail struct pages.
 		 */
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)),
-					      VMEMMAP_POPULATE_PAGEREF);
+					      pte_pfn(ptep_get(pte)), flags);
 	}
 
 	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
@@ -531,13 +535,13 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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
 
@@ -547,8 +551,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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

