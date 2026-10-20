Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497199;
	b=lU6tGVp9YNdGea8shzaGmS4Vg7Yri9qQwhAri+FWYN3SYaQ1bEma7kcvG0IUTJNG7zni
	 hrTVu98cY6vnyH/TVN5htfgjf70LLYGlPfKKtHdkDGlkIFy3m2a+7bR9lYwtHiNTAPXXq
	 lXHMNwGEoBitlLDH47h/lUb7o1/ZD0L0uUO518lZXmBNuMlQzxlJHTdKBIOlvmzdi14aE
	 enpliuLTsnsiuE8zjqUNrWBt6zi4L6fp3yv5CWNipOySImd7T59S0GQk0f6d2QDDdpqZV
	 6T8kj4MqInFcc06a3WRGHpI4TZMQXXX7CyNt/HVyyPznlrd82X1hO+jKl0lBV6tks4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G2KwJzViUvKuGBjyFaY5+OxoYxM34LxjvjTuxIXNaiI=;
	b=iM2FdQi7o9rUmOX/13MU1RgmdpiR0OHxhwcC029Gi2782jWysthQzZhc5FxNaQtme97X
	 2OeomzYfQ/20W4ZcTnls5rRJoJfk3JdIZourgN0w4BF07fLLluiSXUndW2wsI75gcFH3O
	 JOsYd6PauktBsXGh850tRiiG7IdA3n2vEQDtpbiTK++mVgtpPk7GSttH+sg31WAAa/NR+
	 aa9v36p/qPUpbaU5/eYcrFn6XKdZuo1WFQj+xd+ybXg+FzNDjWnv7tFJQ5FS8yVT3GzVN
	 qi75c/DMHCB3dkfP7Vqzo9R3+ygKxEZ+ybH6KglQoFrh8DTqTX7MO030LDV0ctuTiGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=O9Nqe7Mr;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B8606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=O9Nqe7Mr
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so1459025a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497198; x=1793101998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2KwJzViUvKuGBjyFaY5+OxoYxM34LxjvjTuxIXNaiI=;
        b=O9Nqe7Mri5wxVvkWYkPX0NsFluGvCANDGlIEi5+xWGFN0aH1n7sMghvmY4QWP+60kq
         aOkZfcJR5pWzHGsRPhi9Ft3xcDKc4VTs7aQqblBMRT482cQ9qZ+ps/EgmRQIZk57Vigg
         BQjpB+f24mYqo7+l42cZ7hjrBnBG98xzjcy9J5sG6rmd+wxmj9kZcJ8ztJir2da6XIm/
         lnAHaLiNF8Rn3kAkludb38o9J5m/HemZT6EixpxZ/c7GWltptyAWjdna4vSZXnpdNF/L
         Mkgi8GtMUHTH+aJdrhT9pNi4GKQIxjsCV8HVFQ2ybmQTDbEJvJ62LtoG5TQs5RSn1Jca
         zyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497198; x=1793101998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2KwJzViUvKuGBjyFaY5+OxoYxM34LxjvjTuxIXNaiI=;
        b=f5J/3vB3950VWaqko9J94wnLx70go/oRvab2wrRsS0mX4qW1u4X2XknuyVEJ0OMihu
         bNA7OydjG6xEGMwNjYaK28O9eO63KB0Ihe2R7diE9N+TOL2rg+pfygZLc1A90BGubb3W
         gKbM6aEn0UEp9t/vu2Xr/67qlTAs5B+Q3tmF7OrggLVSbBtUUrE94KCwHyBY+X64UyRM
         e6jJh8+5H91hRJfT+V6WtuD+H/5PuAmDLQ4sz8cpNGaUHTV2gttzRmL9SNximBCM0Jxb
         X1mVK4RpgPWl82yuZJYjEw5dJ0SMjDi9oYINTi5hd1sRlHb9JkoMEleZA0roIp1aJbw7
         onTg==
X-Forwarded-Encrypted: i=1; AKwUvBzYeQTQUhiYugB1ezp5TcyYZostBIgLyG/L8NM3BDgnlRP8AaHS+cXvRPbis0PbmIoVv8k0m8KPGDJ/gMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHP7KMc4OM1wj0hqPyKX+zC/u14ebipP7VPy1/hmkjt3TAL48P
	5VEA6Ml5gxxemIcXFBSg6Tp5GvD0V03PvRDETFVfcwXFUrUPOiJiOYwdVr25Cu6P3kI=
X-Gm-Gg: AYBFou040Lh5KMi1dVJhQQq7ww8xfFWWsvVR/8b+b/HAPmifq2TxviBGMRt+geQsKPE
	7t2Zud2XabhHCNnNaGzqTckB11BLBMXJkSzPI5mbBEDQCHu+0RX3miE5iG+CUccP3149kHFmMVd
	tIZLezHRJSEQMAZJgfGrKoV3xRXrQfneM6J7OeOz0rAZAZflYIKBkX/TopeCKZQlTBvTfoSVWVo
	80Y2T6bHN+wT/UWmAGskPEJa2PTi8ZaT+fspunr5Fz1UBsICxj1CoWUva0cE/v1+v/zNHMm3Fym
	VC3obkVH5TPR2G8mVvRvq0OAKpaY32LfS7Lzky/lkT4LFAj+x1/Zog1aPsAY8b6yU2rA9CV5pLf
	y2wqogVrEMW2qKw4T+gldpj/K+FxIE0Zr6tmqx2KuKeksDsyp4IT8UmKSAiVyP44DUtL5dNawoQ
	erH5cbH7mdTXytsyV0m+vynxvGjRWXu7pnnO6XlqlvU/z8CDP0NzkvtlkGUv/PS7E6yGzOvQ5q6
	GF0V5o63difkRN6E3Q2
X-Received: by 2002:a17:90b:1d05:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3acee98e7f4mr8335409a91.2.1792497197896;
        Tue, 20 Oct 2026 04:53:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f34bb6sm3742401a91.10.2026.10.20.04.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:53:17 -0700 (PDT)
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
Subject: [PATCH 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization macros
Date: Tue, 20 Oct 2026 19:52:55 +0800
Message-ID: <20261020115306.813483-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115306.813483-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
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
---
 include/linux/vmemmap-optimization.h |  4 ++--
 mm/hugetlb.c                         |  4 ++--
 mm/hugetlb_vmemmap.c                 |  8 ++++----
 mm/hugetlb_vmemmap.h                 | 10 ++--------
 4 files changed, 10 insertions(+), 16 deletions(-)

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
index b37d7d0db7fc..6a011b627986 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3308,7 +3308,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 			 * be no contention.
 			 */
 			hugetlb_folio_init_tail_vmemmap(folio, h,
-					HUGETLB_VMEMMAP_RESERVE_PAGES,
+					VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
 					pages_per_huge_page(h));
 		}
 		hugetlb_bootmem_init_migratetype(folio, h);
@@ -3348,7 +3348,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		WARN_ON(folio_ref_count(folio) != 1);
 
 		hugetlb_folio_init_vmemmap(folio, h,
-					   HUGETLB_VMEMMAP_RESERVE_PAGES);
+					   VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..1105aa925acc 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -406,7 +406,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
-	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
+	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
 
 	/*
 	 * The pages which the vmemmap virtual address range [@vmemmap_start,
@@ -613,7 +613,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			spfn = (unsigned long)&folio->page;
 			epfn = spfn + hugetlb_vmemmap_size(h);
 			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
-					HUGETLB_VMEMMAP_RESERVE_SIZE);
+					VMEMMAP_OPTIMIZATION_SIZE);
 			continue;
 		}
 
@@ -701,8 +701,8 @@ static int __init hugetlb_vmemmap_init(void)
 {
 	const struct hstate *h;
 
-	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
-	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
+	/* VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES should cover all used struct pages */
+	BUILD_BUG_ON(__NR_USED_SUBPAGE > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
 
 	for_each_hstate(h) {
 		if (hugetlb_vmemmap_optimizable(h)) {
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 464192e32dec..749c7371ceec 100644
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
@@ -38,7 +32,7 @@ static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
  */
 static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate *h)
 {
-	int size = hugetlb_vmemmap_size(h) - HUGETLB_VMEMMAP_RESERVE_SIZE;
+	int size = hugetlb_vmemmap_size(h) - VMEMMAP_OPTIMIZATION_SIZE;
 
 	if (!is_power_of_2(sizeof(struct page)))
 		return 0;
-- 
2.54.0

