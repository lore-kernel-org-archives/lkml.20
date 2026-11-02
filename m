Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589987;
	b=JB2qji8r8GefdsBY+HzrPHQkfJbZplCfEv+Zr46OLN8yDMDZ45R8Kis6+AxjEFMV4R/j
	 d669Ap6hhcbW6A9Z2mcWSuEMr7SNi9g1/asf6pF2JnVJeykId5ACBjJfmPn/8cE1+Khw6
	 XdiYIVgu2BMGAc1xpw0taRBTgrFfDpJ4Ve3sIDmnVHp7WidnQip0JUKVBlwsZhgNvw0BV
	 0mvS50PSa9xhHEHcBaDnXYvmKnKj/QGfZJZbZviKXZYu2oHZukVPYOc3QhtGJ6ei5zOV/
	 /gkHXfmGgbvz3GwMTebdgxy4OJuRpNbPlErp5kHqrM1U6xLnIFGvcXTf5a/feK6dEbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G5KGtvw7DpJGGNS4rFHN4nrIn7gUZjudz5jjNah3jeg=;
	b=YJ+EM+vWV9NjjRyELAQ5OD4rVOykRTYZ6evhotbR3OmSxhGOXlRlMqTCrjQrxTzevxAl
	 u0zx8oqUWQmeXOkKnt1RU5tacqUsTXRmaXPZjdjHYfwayrK/Dfow0IS2Lk5xCQ/wvYbLH
	 GmdwROYymixQYYRNtN6w7jeLIKFaWmeLWRl4o3Y1nLPcPW4+0fugY+LWdTUAndMQ1q+4r
	 aOquuY6vJArg7NA7Ei9hsMrKBH7ewXyZKKAfcZdy3zGcrhkP9F3CRSyD38SoTnymTMs3Y
	 y0x9zzwfe0y3CYUVNasQ70eUm/HODXllUhBUomtOhdZGuRMUxzdUScTCmij7u/c5RIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K0rms43P;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D61F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K0rms43P
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso768761a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793589986; x=1794194786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5KGtvw7DpJGGNS4rFHN4nrIn7gUZjudz5jjNah3jeg=;
        b=K0rms43P/751bL3sTDE7QdabaeMrXiDFwTt+/m1JzGxJNGI1P4twfvipo5ulxMgCO5
         QhUjErCzsEunK8wrGQyOw+s28GVFN+HSfwuPzWYTO++eISjgDza5LfKsZoK3YdB1zLlI
         ZdzLHrAEyKfxijtOImnnKdpdI/ENQsfNVb2TQ+4CAV6Tl0Y1098XYvajnVzQeyVN+PW3
         FbnXfO8+poW3+GSHr+NlkjJYUi6tZPuiotUWVv/EnPIvAbNvU7jmXG8MJt9uD5UWBXDq
         fho2MU9/4AehhDEs8WAh8ug949zEcQ9FAtwjBRkpxsYu08TqKc9m85wfq8YSreW75qbc
         uIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589986; x=1794194786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5KGtvw7DpJGGNS4rFHN4nrIn7gUZjudz5jjNah3jeg=;
        b=lVS13a1aP+2MSRI2Y4pKDFmDJq7HN6QGVqQ39Rz8BFdk6/ZfByJis6Z8Uqbxq9k40E
         JlisIha9pRhEK0B47oO5GdtVbagXXNHseWoHrMzPZGD4IHQnQdWs+cz4JONlinNLvW1a
         vVuo9t3GyZ2/NN/WiNvBCYu0gnLZth9MV33WwL/PfpPVm3pu8kb5hz8MZiSwVZXw5JHj
         dAXA4iv1ZW25ICs7APLvCwT+xiC94SzkhlFc5cIR/byEAYDsznBVhPLMtLti1MEWYwOd
         ZwAiS8+YoosQKVGKurK5vwpjBiA90QHck8kNrKVK1+14CWvx2KyI7E2UYlJvBtrEydvv
         Bdww==
X-Forwarded-Encrypted: i=1; AKwUvBx7Qjfw1GaJOVuGBQmC81rDBZ/TCg2y5nAIrS293jz8Fn4zlaSe4lqq3Scg9ruNL3grbnc0Xsj9NdS5TOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XPulSaHYqaNZtLRpQCMdcY14FAr5H1wqdtIBZi9WrW5b0NCuo
	+g5yrHZ5hrpNDfTZJ2ZmXGK/oLRwbAOqIc1kJY1ZzPfyKnnRkqFREsPscVgJLTv2zj8=
X-Gm-Gg: AYBFou3XU0W7BgWtffRvrJ91sXu1ZrzGFZ/TBDC5qh8uF0qeQS6wIeSqxyH5fkLe273
	lTAcT8b77yCKHOxirgela0owYvd735q7wsIRbMUXeEI8rMTACczt1ehfz1JMAKDX64rkcFGzmkT
	ggXTu4cjtoANstqrXfcvRkyeSwfabvvzxmiPF7Hqy7aO9z79QidBBadiqobaDzCWY2f2BQ13FBn
	otDEeMctKv6kUXzJYPY3ZvO6UGc9MEcF520BT03jWRrFUtUiUFEslG94MLLyb5gk5DHJ02d6e8v
	zam+zcuNQ8MAjbhEaJ5gCi1E0gLtSYq1jgJU+k48kgqeBmO6JSqoeaAmWvz42O42GQoMXrIJufR
	TBU7bNdIh+Dp+T/MIAz1UXpTB3Y1HT2RJV+n3rVwZQQFL02nnLBhIcg25vO88zjS1IMDvrh4V4h
	qwKa/QW54opgkRez7kS2ycwHkgmbbwaE/+KamC72JPgSLC2eVi4WUE4HPNQBFIhrwa9EGN5hKvr
	7M5c54bMe9m7PMoawxG3Ujflf1tGJCqNVumJGlL4LA4wQlHjSfEKKcWTviLsLumcaaH+YKzo4gr
	P8nPOO9/NKWxw6PIgjPRl30NMcCqZeOBcO03+qRQCPj/oy13tQ==
X-Received: by 2002:a17:90b:3807:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3ae897994cfmr7194939a91.37.1793589986178;
        Sun, 01 Nov 2026 19:26:26 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:25 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization macros
Date: Mon,  2 Nov 2026 11:25:14 +0800
Message-ID: <20261102032525.3597743-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

Vmemmap optimization is no longer HugeTLB-specific, so the remaining
HugeTLB-local reserve macros are redundant.

Replace them with the generic definitions to remove duplication and keep
the HugeTLB vmemmap code aligned with the common optimization macros.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 include/linux/vmemmap-optimization.h |  4 ++--
 mm/hugetlb.c                         |  4 ++--
 mm/hugetlb_vmemmap.c                 |  6 +++---
 mm/hugetlb_vmemmap.h                 | 10 ++--------
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index fa9e9abd6656..065840f3c241 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -27,8 +27,8 @@
 
 /* The number of retained vmemmap pages with HVO enabled. */
 #define VMEMMAP_OPTIMIZATION_PAGES		1
-#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	\
-	(VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE / sizeof(struct page))
+#define VMEMMAP_OPTIMIZATION_SIZE		(VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE)
+#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(VMEMMAP_OPTIMIZATION_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
 #ifdef CONFIG_VMEMMAP_OPTIMIZATION
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ff9dbfbc7a96..7c26be15a741 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3301,7 +3301,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 			 * be no contention.
 			 */
 			hugetlb_folio_init_tail_vmemmap(folio, h,
-					HUGETLB_VMEMMAP_RESERVE_PAGES,
+					VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
 					pages_per_huge_page(h));
 		}
 		hugetlb_bootmem_init_migratetype(folio, h);
@@ -3341,7 +3341,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		WARN_ON(folio_ref_count(folio) != 1);
 
 		hugetlb_folio_init_vmemmap(folio, h,
-					   HUGETLB_VMEMMAP_RESERVE_PAGES);
+					   VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b8ce014ba6e6..4b73d6ec8dce 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -408,7 +408,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
-	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
+	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
 
 	/*
 	 * The pages which the vmemmap virtual address range [@vmemmap_start,
@@ -676,8 +676,8 @@ static int __init hugetlb_vmemmap_init(void)
 {
 	const struct hstate *h;
 
-	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
-	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
+	/* VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES should cover all used struct pages */
+	BUILD_BUG_ON(__NR_USED_SUBPAGE > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
 
 	for_each_hstate(h) {
 		if (hugetlb_vmemmap_optimizable(h)) {
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index d717d0d10960..d057e8b12bf1 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -9,13 +9,7 @@
 #ifndef _LINUX_HUGETLB_VMEMMAP_H
 #define _LINUX_HUGETLB_VMEMMAP_H
 #include <linux/hugetlb.h>
-
-/*
- * Reserve one vmemmap page, all vmemmap addresses are mapped to it. See
- * Documentation/mm/vmemmap_dedup.rst.
- */
-#define HUGETLB_VMEMMAP_RESERVE_SIZE	PAGE_SIZE
-#define HUGETLB_VMEMMAP_RESERVE_PAGES	(HUGETLB_VMEMMAP_RESERVE_SIZE / sizeof(struct page))
+#include <linux/vmemmap-optimization.h>
 
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio);
@@ -37,7 +31,7 @@ static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
  */
 static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate *h)
 {
-	int size = hugetlb_vmemmap_size(h) - HUGETLB_VMEMMAP_RESERVE_SIZE;
+	int size = hugetlb_vmemmap_size(h) - VMEMMAP_OPTIMIZATION_SIZE;
 
 	if (!is_power_of_2(sizeof(struct page)))
 		return 0;
-- 
2.54.0

