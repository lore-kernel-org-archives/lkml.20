Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859178;
	b=G834JoQpahEy1Ui+rFkxlTCgrT08aErRQf3f+tMBEvXiT/DhfEiSlW0p1b8GH4GXSvuW
	 CyK1Lg2PWmAIyG4Ma+SwN6gIlx81VDuGPy7nf+IrNdqgYAttQ3ncAanyinLGz8nMcyN8P
	 ddt/Gez1VylsbCuXb0dv0ghHrBTmqcRwgvuZumGoZTkJHYibG/s2EyRWKJdsagwyRSVWz
	 4uaqQxE0G1HrBFtZTk3fQGg7tweRQyPkmvbf1pHjyjh8+AWVuDSQIK+nl7m14YBwUOL5u
	 Qzw4FWPO9C6zN85hFg354xGiUw2iupvFXMLcPqVh22wIDMhZePYbGGzzdAyOWuBxZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
	b=p1qSUke3Imnw+ZgJOgUGc0wrc+j2VQ+PR1MQ1v4RZs1tB3r98p25aGGlkl6LkEVvN3yN
	 44W2mQX/i3OwLkVwCeN3yKp3GtdHoEZ/OY5SWyABdgAeyqWJngh+W+V84ce8ccXdaDMX1
	 T7A1fAWIx5qdNSyReeh3ijeIeEA/LeVJfaYq54tjlkjBLKgb5f1WT5b1I1GJcO9EoNLZc
	 DBKnTNUx7rIAmdEyCP9K3VrWmsF1fy05rYuNeCBAF12Ug09kyjV52lqhNFEyO8x4vNxHL
	 GIaEtvbouoYRjnqATYCIQ47sZpNKPw7BC4j0E+nlEKOYwZxALpEJQo3ShJd81YWgoGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dBbhsXtL;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7D606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE7D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dBbhsXtL
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso662423a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859178; x=1794463978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
        b=dBbhsXtLFdFBkSvwxnyskg9ourqHABJHSQ09odjJUEvYlL9vuRyImYwG4ymSaPqec+
         VJQyqxdg23C7JLAQEFd4ayXmyL3uh8nGtwEvMonkBqKTCgdPs9LxUJxBSRNkMgnX2cce
         8ntm2nt2w9f3WCGmi2SHfSc+fCuvRhMEmjQfyiapCtHnl2aGUzzKuXmYhBiWyWA5kuet
         Gf3MKF9stoCF+QZb2eT6BvHdNUzAxRvVViOk1KZiWCKkyVrJGcrIZT4UBMZ7XFC5/SNq
         dbb9U7JF4y+hrNV4jkAg7NfLYkLWFnctS6Yh8gJ15lLXjoy3Dskeo/x4Jy7y3LsSfJKn
         Wznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859178; x=1794463978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
        b=rIzeNN6pygOwVbj0hr6dftlQk4Gvt5lRFIQJ5GGHRh8MVRMmHWjf8NJXUDJ+7plJSv
         vJ3J7tmVkfSiO3D4NwXAdzNL1JJFaj9Q8XXszUACth07xUhEtFDD+UeIAj4clJ+r53NG
         pWre4jTpQz6GLDEQfOvxA2/JJZcQywjiA7rdPWlAXBGWDNjhYc+QBZj9U6w2kxzafhbk
         RT+A8Wh6zmLclRP2ps43ZISUHLqnO6D2LgrgXlZpY4vgX0M5LjxHajhjTxuWC7fMUPKw
         yDOQ2PMbq1Dw/Q++k1SWD0z62AVn6nWchkCp4nl140BrJ7f+zXJ+qUGGkYXE04+0miPb
         p3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBySeXS4w1mq/Y9WR3HYkW3WRWWuACKHDGwNDGPIJkXbgNZsLTPsBqQ5od9a3csfhL+Xq22dT5BmTPOSchQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d7FYyDtFM8JADHNQtJX+ITGhNpyRpiOexrxF0yEPSoGfzXuVV
	f72Brnp73dntV6UE9V79dMmz2tLHfJDOCgOJQ/BsN/TmlyX+RnFGbZVj5FG4oHNss+o=
X-Gm-Gg: AYBFou06USZ++G/sD0hVTOrO+4dooQFJbarqLdS4vkWRFTtqWopDVnCbYDLTtcvJ3fk
	cvc8G3M/HDUACDkC/pdpak+sJdrKc7M/WF9kPXNiuS64UHK+zS0aZKksoRlvNSVlPHdV68zsgwQ
	of/7YsN+qmV47Dc7kzVUfvAciWaQT27+iZe/XtQGDxR0qrXdMyWXL/9tp8/aS1gqCwWRK+K63li
	DHZPL+1aNanzSWOF6JxjazOSinhaTTEYR/vjdTJOhaFV90F0k0AFpfRC38V3JLCsu52yaNMvakE
	dlTNXZzyTg83HAu1NeUjvjMM2jr9UtMpxEjbEwcfOB/maK0vhJCD9T8HU9BwBbKbV49M6bnXQSj
	AFAtto/YPt4IcqG0mARzbOjEViRgMoESYBZ81o9lCJPFdu4fabYGsd5mTwGPvMAbgmj+azSPCVO
	lAfyOVQmdcTrNXZATfZsl+7VQIRY5usNW/+DbFl0plG4B4vt1PdMWAFjEGViVlyukfYFsf73qD0
	k7e9QdsdY2jM4k4UA+WY1dP7Cptho9dmpzyk6xPqpAOqquzpX9PqBegam9itQlYj6yBYPF2iBiy
	IZgJMGwYsGI6Bd+7AZqHS4G+X3OvQLqfqEmZpCeXRfJHbrZcq29cMXOBNabs3JSDRQ==
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr16195357a91.11.1793859177566;
        Wed, 04 Nov 2026 22:12:57 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:57 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Thu,  5 Nov 2026 14:12:16 +0800
Message-ID: <20261105061217.13302-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
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

section_vmemmap_optimizable() can already decide whether a section uses
vmemmap optimization based on the section compound order. The DAX-specific
vmemmap_can_optimize() helper duplicates that policy, so remove it to
simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Ignore non-optimizable nonzero section orders while retaining zero
  as the reset value (reported by Sashiko)
- Use section_vmemmap_optimization_disable() for the altmap fallback
- Move vmemmap_optimizable_order() before its first caller
---
 include/linux/mm.h                   | 37 ----------------------------
 include/linux/vmemmap-optimization.h | 25 ++++++++++---------
 mm/sparse-vmemmap.c                  |  6 +++--
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a060a7150401..2fa5ce73b382 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5366,42 +5365,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
-					  struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages;
-	unsigned long nr_vmemmap_pages;
-
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!pgmap || !is_power_of_2(sizeof(struct page)))
-		return false;
-
-	nr_pages = pgmap_vmemmap_nr(pgmap);
-	nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
-	/*
-	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
-	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
-	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
-}
-/*
- * If we don't have an architecture override, use the generic rule
- */
-#ifndef vmemmap_can_optimize
-#define vmemmap_can_optimize __vmemmap_can_optimize
-#endif
-
-#else
-static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
-					   struct dev_pagemap *pgmap)
-{
-	return false;
-}
-#endif
-
 enum mf_flags {
 	MF_COUNT_INCREASED = 1 << 0,
 	MF_ACTION_REQUIRED = 1 << 1,
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 5c09da4df4d8..9d9f7a67d195 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -31,6 +31,17 @@
 #define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(VMEMMAP_OPTIMIZATION_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
 #ifdef CONFIG_VMEMMAP_OPTIMIZATION
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
@@ -40,6 +51,9 @@ static inline unsigned int section_compound_order(const struct mem_section *sect
 static inline void section_set_compound_order(struct mem_section *section,
 					      unsigned int order)
 {
+	if (order && !vmemmap_optimizable_order(order))
+		return;
+
 	VM_WARN_ON(section_compound_order(section) && order &&
 		   section_compound_order(section) != order);
 	section->compound_page_order = order;
@@ -134,15 +148,4 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order
 
 	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
 }
-
-static inline bool vmemmap_optimizable_order(unsigned int order)
-{
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
-}
 #endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b8b55e12f5ba..71a927d67a9f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -473,6 +473,9 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/* Altmap-backed vmemmap pages cannot be optimized. */
+	if (altmap)
+		section_vmemmap_optimization_disable(start, end);
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -700,10 +703,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	struct mem_section *ms = __pfn_to_section(pfn);
 	struct mem_section_usage *usage = NULL;
 	struct page *memmap;
-	unsigned int order;
+	unsigned int order = pgmap ? pgmap->vmemmap_shift : 0;
 	int rc;
 
-	order = vmemmap_can_optimize(altmap, pgmap) ? pgmap->vmemmap_shift : 0;
 	if (nr_pages < PAGES_PER_SECTION && section_compound_order(ms))
 		return ERR_PTR(-EOPNOTSUPP);
 
-- 
2.54.0

