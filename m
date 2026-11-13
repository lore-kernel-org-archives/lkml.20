Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540951;
	b=wMnVFcnBDdgU8a8u29vFe++Ho/XeCfgrQAcxjp6h3AzoGnB865q0UYFUtGuMyTdcujsW
	 KzKi60veX1MjPS/+CJYt+NTWp6lbVwj20vr7w8FKJarHTk7GWkBwCNuAem6Sw/KSGGmaL
	 2bS+W/lpWKREdpaThEFOeBWuYqdwdsN7C+18O8vol0D9EhKKHUM/pwrF2ajLT5XIU7wE9
	 bkaopBxbrpAlEe2W37axwiwe9MFb2zYdyyGoqf9rgY8oCSSy+LRwXJPsgwOUDEa0dud/9
	 lQ9riisRaxGGtOy17bVB+MyWHmoVixW/zfilRFc0oDaxsC4Hevpiq8X0cEXSw1KVfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tH+sQfdDTDGWfh0zDLczcrbop696/ilbCo5M8/1+Vaw=;
	b=GQgNOEj/bmZTI2K/9pmf7nGDM2kW+TiUSkNA7Qhym0uhz2UFxLmTBUC/h2/N0xL0vos2
	 ReguwY6lToCqTGvzTFPYTgpZbSQEzSmo4+B7Jaj2o1GZvjEbak9eJ0JM6Z6WeAJT7ozt/
	 g0o+z95L9tgz3AT3+TeiU75Zo9xAfBAcdJnco8kagtJ7h07RDvUCPvlyJ6+UDchnvrl0v
	 b6mq6OGkQrM+fuxPCh4XJQfhdK5pmraRlwh7ryEtnXmlRQEc4nv3UZ8ScUuQ0L7OVA959
	 RmXjuX/aAvhrbSbq746cmevmyfEc5yOsv4AQfu7+3C8zxL5CmFr8rY5z3T7+3nM6f/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gotU3Dm7;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACDE606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CACDE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gotU3Dm7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so683828eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540950; x=1795145750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH+sQfdDTDGWfh0zDLczcrbop696/ilbCo5M8/1+Vaw=;
        b=gotU3Dm7O2KKxWvzxgw1UQKNbPgm/AyefEe4srm7gg/IN6hicKnLjS3DXXVI7gp5Tm
         GFbRWNheacietTNJvDvBIT7n/Xh1sSkBY3yFe44ejAxU/aLhQ3dhk3Lq6bckTXp7mezj
         Jk9QoAk+Nx76ntRd4OJZP/OHDDIOG0xNtnjOd5r0+5dnmD88SJ0IHErYGCXhNYCYVFvD
         881tbEtpc/RbRykEvuQaazwVnVgDvJwdR03ASwXVgpTjbo5v1XT/eq7PYItim18pXxqq
         I4YPcUcybY3wzMbh/EMEwoA3CzLFHf8jX87L2hY0+K+MCph+0Zw2LTKYZ1t16HpnVHd2
         JhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540950; x=1795145750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tH+sQfdDTDGWfh0zDLczcrbop696/ilbCo5M8/1+Vaw=;
        b=GoySBNnD4I78gW2nOC6v8KUCcOpwPls6mZoWxvCl4beCqP3mA4ehfbCmNbAF/g0oKG
         yU5kdKmEWQxk2ooHHkT1PVP3T9xghOEeLc3Mcv+pF8hdGhY1QIRg3XLAiyWOLOHBs1nb
         l8CKGh9AnjciKTXQWodLLkIdzVGE1j3yOOdu9tD6RbNEvCgI9mitAPMBrUGx2nZ3vyuy
         yrMVpEptCYwJSxJqS1RHYyHkPiJypb5eqJOI1FHEBZMWbD0NmZcQVNR2shrlK8CbT+Ws
         1nQg6oP3AQ4Ea/XcyAE3h8P/9QDL9ftqeJTQ84inQGO6yy9CGTwfwZ+c8a5M8tywlpkC
         VFow==
X-Forwarded-Encrypted: i=1; AL+hErE10/TyidzDhFqaGG1Qf+XDEt/IpJ6D0XLQWY3jD6fGnRPL2E0Z4KdxHRoag6/fTRfBRYBcbi23i/rY0TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/43K3mCrdjB5vkyVbQozEvXQwey0H8QMMfMHnkP7Emx5LKFdtv
	hlTaJqVoADdjbUv6QIj0HK95pETR74wdw+Gl6sMfCyJdUwyJoU5/4la9bnX0lzz/xKc=
X-Gm-Gg: AYBFou0BKNk61qmmvwppiWqc4y5rp/mD8ocO9iJRS/nTvhr2E9uLzBrP6HvGKp5Zyhk
	ig80v7Lta+lgpCh+uxcpgcUOPMnH2lJ0oAo2hyWCPI0SdLfxFaJ7pwh/5LfwdFdc7zum1On2wEg
	E81gAKl4JpPzoVd3ygyFzt+ugHIxhMJdM9miekbFe+81OL12eSngkop/nqo1hN3e19U2SPMj4BU
	uue7g9ACu5odE6Ujf3Y8c63z2Vo7vxyq7INRi8fZTAyLoHUocNWoOA18ZOnouffh4t3hrmM4VgU
	LFf/mUf3SF8GSnKrku4oCendLLS26RrcpRWSVpxVIHzAfG+1QGHH21Xjx7zivnxkFXJlOaFW1u9
	NvY0ovqIgYT4Z0JtdKEnVK2doZtDcNR13ZmvklFqfe33wc5bvBf56VYV0BZpqwVZhF1++k2SRkD
	zLSg0xRbmfC58xHSnJ3w3R6XBQxdlDC4ThJoIA+KaWMZoVGIvYvy7p6nA+YqtQx37Ag03uJ7z1E
	YA2/dAKEZ8HhqhT0e7za6X648oDcRp4uPHjOPSgEvDL4GmiqZYVsl0d055S8sT2c1ySaEuCH/VH
	7+wiKDfZ2VQZ9Bnvn535HtrjwVc5qPZvDd3wjkE631cklVbmtDzy3N/1kHCLUw==
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr990948eec.28.1794540949810;
        Thu, 12 Nov 2026 19:35:49 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:49 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 07/14] mm/hugetlb: drop boot-time HVO handling for gigantic folios
Date: Fri, 13 Nov 2026 11:34:35 +0800
Message-ID: <20261113033442.62970-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
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

HugeTLB HVO is currently supported on x86-64, riscv64, and LoongArch.
On x86-64 and riscv64, gigantic HugeTLB pages are larger than the
section size, so the existing section-based vmemmap optimization
infrastructure is already sufficient to cover the whole folio.  On
LoongArch, HugeTLB HVO is supported without gigantic HugeTLB pages.

Therefore, boot-time HugeTLB HVO folios can rely on the section-based
vmemmap optimization infrastructure directly, without the extra bulk
optimization and fallback handling.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         | 25 +++++++------------------
 mm/hugetlb_vmemmap.c | 17 +----------------
 2 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ed3af959f615..3a307bc6db17 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3345,21 +3345,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	unsigned long flags;
 	struct folio *folio, *tmp_f;
 
-	/* Send list for bulk vmemmap optimization processing */
-	hugetlb_vmemmap_optimize_folios(h, folio_list);
-
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * If HVO fails, initialize all tail struct pages
-			 * We do not worry about potential long lock hold
-			 * time as this is early in boot and there should
-			 * be no contention.
-			 */
-			hugetlb_folio_init_tail_vmemmap(folio, h,
-					VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
-					pages_per_huge_page(h));
-		}
 		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
@@ -3383,6 +3369,8 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = folio_pfn(folio);
+		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
+		unsigned long nr_struct_pages = nr_pages;
 
 		h = m->hstate;
 		/*
@@ -3396,13 +3384,14 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		VM_BUG_ON(!hstate_is_gigantic(h));
 		WARN_ON(folio_ref_count(folio) != 1);
 
-		hugetlb_folio_init_vmemmap(folio, h,
-					   VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
+		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+		hugetlb_folio_init_vmemmap(folio, h, nr_struct_pages);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
 			folio_set_hugetlb_vmemmap_optimized(folio);
-		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
+		section_set_compound_order_range(pfn, nr_pages, 0);
 
 		list_add(&folio->lru, &folio_list);
 
@@ -3417,7 +3406,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		if (hugetlb_early_cma(h))
 			folio_set_hugetlb_cma(folio);
 		else
-			adjust_managed_page_count(page, pages_per_huge_page(h));
+			adjust_managed_page_count(page, nr_pages);
 		cond_resched();
 	}
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ba8e11e399b2..d73ceeef392e 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -552,7 +552,6 @@ static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *fo
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
 {
 	struct folio *folio;
-	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
@@ -560,18 +559,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 		return;
 
 	list_for_each_entry(folio, folio_list, lru) {
-		int ret;
-
-		/*
-		 * Bootmem gigantic folios may already be marked optimized when
-		 * their vmemmap layout was prepared earlier, so skip them here.
-		 */
-		if (folio_test_hugetlb_vmemmap_optimized(folio))
-			continue;
-
-		nr_to_optimize++;
-
-		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
+		int ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
@@ -583,9 +571,6 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
-	if (!nr_to_optimize)
-		return;
-
 	flush_tlb_all();
 
 	list_for_each_entry(folio, folio_list, lru) {
-- 
2.54.0

