Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369333;
	b=Utcwc07EBzIKt7ncGssgZhtQYOgGugAH/IrH03s3rwoAn69reQvX1wDEpqcNAblMEOsU
	 yQYIbkWWxUf4fHTXHQVXmKl9JUyHWSnMGA9XFwX4lahnuDeQc0L9LLnMzT1tkz5BS5GIH
	 cKiGV/LtMQqFQHOOUJ1w8spgxy7tk6kYpnzIHdnapXgoiNqwkVa/+Ne7MonD8j2uq93Ew
	 iqjVzbkzYV4/ldOx6JdcgXvdJT4A9UIQd8BJei+v0EETEikJYhLJmTkN+pM/Egs6AeaRh
	 O05dJEwjU+Jk4ipa+vsP5qxvGizjpjyDCWAGyckVhrYD+VfwmQjvdvt4cXyHQiEXw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
	b=KNnfCPnbWKMVjONtcoiXny/UjNgvoUofqz/GgdEPYp16had72IzBNQ6L5JMR/dgFjUt/
	 tVU8/brR8pffcS9gh5U3xzMnnfuqdKjW13SZS65RPlB9Rubvzm6Exq3modg5AACVijAOQ
	 CEYTuYP6Znrm0vjxS9YmPISOI7AsgOp2vFzz1ZhJzw9Vf9cVnmLzZH5UfXDaixwUeoytI
	 76XZ4EfH8ncsIwV3n6odqQIXoCmdRIPhxMkqwVshIh1x42kCTQSPJJMzkSEM609Fv905+
	 c59rc7JOFwyxYgbkJwuoO5YRYgm6VYW2yJV1w7MLFpUF7t0R4nrXO3PV/WT2TJcfYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="gSPpLx/s";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11C8606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B11C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gSPpLx/s
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e985106c0cso7148235ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369332; x=1793974132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
        b=gSPpLx/sl2uTzFuR1TXspjH6kzLCRaz8U2BZyl1YoorPJXwXUyJUSuk4IvscCPQhNL
         L4YKu44Xc9Lb6N5H7CtGGG7BICO7Wiotzi1J3hGobL6tImXseBpYVj/+W7TeVkUlkw11
         AuUR321nHXNErWnNp2zRT2YhLtjS9wfcF/bDAjzOsU1NhBnkClI8cs6inVHEKAOlhrNA
         qMseSSiueG5Et6zil9Ns7ITzsLLeZkg586SttCPrNgyYL2rNReZYGSmmOi7NA9SeRULS
         95zTiogvFuCvOP6bhtWYl3svoHo9ZULKEBpz4mzFLie7eTn3gdymvBOBciqpGbsFojoE
         cS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369332; x=1793974132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
        b=2wtZmoLPVxoR1JEGxukKXcmAUCxnafLo7oKpGIkoK9RI+3s4hfW2SGgSLNDNt0EX1Z
         uMIU0tlWl6XCiVzawhoUtevk2qA9lJ83EIme/GJ8/cZZBsxG/aKjQdrzhDHbtVlX/xSf
         VpfDM1QLDvkl3uSYpMt8XetZ+9Dm5DWWmP8FgdJZWyEslZrO2x5fRIu0phq50mx/wiD2
         qOJQkkGv2Tt/HW5ZI37SYfNOVjgzLibTQoVtZdyMfkAHmTaegdbfIoE0mFyOmqRb+ZVs
         vW2oc8GIj9mGx0W3qm5af8O5P4GT/1OQ0Q4FOWt/aKnBf4LCBdQlmuCRoGywyZR9UJW6
         QI7g==
X-Forwarded-Encrypted: i=1; AKwUvBwmLwRskc0cfhB1TZNZJCz9xCRapGIhK1Z8DN6LJzlVdKXpTGZWuIXJn9wqzN7rRtVaH/VJpvHbYZY6Ae0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgD1fI+OzSRjMV/jsJb5z89JFCBqwdaa4W89rBmQN99WF4ivYm
	H82yi7PQ9/JV4S2VuZYzN1+RgM4bEudNxYW0vl7+tJ+Iu76L1CNYlny1IGqp5IGRyGo=
X-Gm-Gg: AYBFou1hFNDHYS0+rOZc+RfN3KFTFRAz2XXM2VB8pz7T+TgRBtIcfxXe/nSveqxcfyY
	u6YmM2Ac8NhPNYWQDAZqDVaQGcfA0T576QxDdIXrp3V3g77Fv3UrLIRyK8hPmvc8c3Z9yTbnW1m
	y47htyKllNbb7UdV591c8MRnKiF5W9+i7vla3x9bjOj2/lYccaW3bfRj8LroDdsUCDyFG2ZF988
	OKC+DgpFA5uAzE1Hhyyb8sfOJ3LID3G5xVpEqTwDG7lKf1ceUttfNwguoisY8WGCX9GJ0OjhEnH
	rDMXK/5s7rzUrlz0VuFved7YTSVnfsnSbdRbcbvYH1tjRNLU1KHFUEVvqYETIaQdJqSSttBbeHB
	KCVSpyVckbZntOb6Ml2WDF4cju7JG/RsGC7VHcpVn5FvhfIMaWoDVidOORzleCBq4NZR9YsPKel
	su8F/DiOKKEJn5iJGzy79rg5D8x5nxiK9rIzm2tU5p66pWO5assZSWm6blLubgoQDrBMM7FLVoc
	ff6icyk0D9GleRCnyDTinNBX9TvHlwQGp/gMN7dsq5g6Vq1Z0sqTKkr1pl21znOrYObzOZneNYp
	4vvf5xDCCXhd3T+fVbSdMrHOxFa4yGRL0CSgXGX2FMizixjBL7Wi0kTVuRCYfWVVNKtKE/lg
X-Received: by 2002:a17:903:2f03:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2eb36415069mr25082595ad.6.1793369332072;
        Fri, 30 Oct 2026 07:08:52 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:51 -0700 (PDT)
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
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 3/4] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:19 +0800
Message-ID: <20261030140720.1256062-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
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
 include/linux/mm.h  | 37 -------------------------------------
 mm/sparse-vmemmap.c | 11 +++++++++--
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e875f73b0c6f..4fb48fbe712d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5395,42 +5394,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
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
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 3e9d6617c4bb..43559593107c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -466,12 +466,20 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 {
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
+	struct mem_section *ms = __pfn_to_section(pfn);
 	int r;
 
 	if (WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SUBSECTION) ||
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/*
+	 * Vmemmap optimization is not supported when vmemmap pages are backed
+	 * by an altmap.
+	 */
+	if (altmap && section_vmemmap_optimizable(ms))
+		section_set_compound_order(ms, 0);
+
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -699,10 +707,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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

