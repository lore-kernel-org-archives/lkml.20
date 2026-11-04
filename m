Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759743;
	b=xNWLGnEdnshMTjtCabASGgIV4rpa/x3XSYikh69CGdCPOekXq4ppBGNEOLy6VMjkOfXd
	 IUkRQ17eWM7gxfkACUUrJMnt9EU5MqSjIHFXgOzT09YYPy43bW8cNaIAqjHaexjsYOvaC
	 nFZ+uQY8IPcxLS3jemKanNxvXd0n6nW19hrRzr+Fn9xM+4WRyqrFUf6VsX6OKB1+ZrL2w
	 WciAjRTW7gA6rCH73Rg9R4TGdclZ3OWSGYtqqOhWeqgO4m/gd0trxroafnJwoh0FWfUA2
	 cGCfsCs0kt3CzcrUdbQywtq7OYTZlgwIr9kYpVIr4XU2cr8QmK4o41qokwaTVzmc6aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P9sYomC2CtW1Vmqgl7O90RyRwoR5j8Lupuz/vx9ZYAY=;
	b=CVLWZUedoiOcwqpNhS+ScDbPJYidWGmI6YOplXdk/eQhBYdJOvz6bs+h1XUUt1jOZsre
	 G36g+ebxUkWvhUtQmLZO66Wol6mpPBVW1W5VtYWZI8oIgh7G+Pf3OYdGWK9gQ0hDQRIz6
	 vLjyKNFxWEx/QdIcoxhl550okDM1iOxSZnLwVYwZa+jSiD42aR/rzVLcsHolYi2nIADDe
	 jiIWgDkUhMfjaoWGIHAX0Yp7Ub7BF8XoRaIxYN5GWMPZDKdwYSENv5K1xUKmz/IrquuVL
	 NsND8a8dfA3kpQ/B02MAurj5ZBkbRCrl+AaHdHpOc1DRq+2tG5BUyGxVe8k3q2K3sQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=M9Wdm4wL;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C7606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738C7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=M9Wdm4wL
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so177695b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759742; x=1794364542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9sYomC2CtW1Vmqgl7O90RyRwoR5j8Lupuz/vx9ZYAY=;
        b=M9Wdm4wLNCxscxwtrMvQvnZqa6do9ZsP6RyRKUIq0kj8vz+mLcthhOtDRhZUKPTNBS
         TY3KQrsLULDY8Bv9IFehQQwZ8MHKzz5WZb35xz3g14VsN2hzjAgkav1pazJHtGaAGLHn
         CCeC0AH9PqInjjlUkbwAV2lQk8oEiYZdnBxpbUm9l/Wrd7jf9w2BW/eGTBjP7eo4tp6q
         E1TvKnP1B47B5jlUMzd1I7o6mzIsgaMSp77ADMA0sIz8Ak30wRACKxHz9q55naR2P6VZ
         UyhO9bXvTHuSEFPhrsI26/UsHqon/aV8XXg6eUd9vwQz5b33w1EuG8Pf2Yl5C89npZTl
         r9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759742; x=1794364542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9sYomC2CtW1Vmqgl7O90RyRwoR5j8Lupuz/vx9ZYAY=;
        b=lRi2nHpCiUihvom/2Jhmb0W43ey3QSdvg9jDR69qWxoMKEMJCvy6qNr4HZwWYZ/VdP
         S1eiLCCJ1Hz8rlIBMu3WKKKi01WQYby+BVy6yvEExzLhQ4pVFrX1JGtdWD7k564X5q8n
         lWuycnVJjDqB+pOV4SnXvYXalfB1lqXhxl/j8sRYLa07bhZ/RV2faKkglQpjRJ2wCs9z
         9X/d3wWLvLlsOn2P91WTlFTZ+IVmPPW8c56+hcSyTCp8htn3wP0lr4n72AsiWuyDZseA
         f5u/wO5QFMQ9CUd7rQEOQt7OR1NsbY8mj1qV/et9tRHvKCnlgYbhLr6FLNk0V8yuAs5P
         FywA==
X-Forwarded-Encrypted: i=1; AKwUvBwf58W5epem7+LWKc4GPj9mu8il0+WLyxOwm4g2LXSx2HUScK4t1NNL0vxURiWo0Q3uZnmIJV0dIUVt/g4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z34xNQpd77bczkIrwWUBe/n9mL97giV0H8GQO2eqPx9soenGi
	ybwUHevOJZi8yfu/bpksMJT1V25qs2EIfZRjx1GHsd/npZKmI1Bme7we5mH6v/2FCKc=
X-Gm-Gg: AYBFou3+9PDjd5GBqBrbFiNkyIF1tey+VZhMOrjwYrDMO2v6GfwHCj6pi8uvwcTJO0J
	IF73RNTJU/fsbmOdKXBEva2zu/MykbIE58P5rAAzx0dUllFUFfEIyHmK3SfiUkPJgFyNWiV1E1J
	tmrfEmPVTzQn5G6mQOM752aduHRKBTkI+3AP2Db7YobVrRssj4GEJn5C/kyHMo/PkPht6iKrBl6
	Emadtu20dKP+QgD8S7Pi3z6YNptNZ9eT8itPG4uUfcPzn3ok8KuQBfpIS9P3Z3E0fAAVgOABpVa
	OKjAAhFnYtdRnZ+9UiDth8NNjsr75A0IG/ePN4BGtG1l5yuN+d76kIxjxA7B8DjQhQ+knXZTHsL
	DoMRDrOXhu1IiZvN0IZwUY9xZ18zW3di8TqWv1YxXxhqr1JY+8hljV34oFLvjKlNIO5lbtRxXlG
	y2sZFe+ZdZWlNQGgon5RjueM6rd7YEoT+WhyOHefsrwD1kXJqOWtZnikfm0jTenW3Sv+CWLvYR4
	cYK2XMvv1EU1N4zanpNtmsFXN33IJkXeWHbm2tT4deaED0dF15iProa03MAT2fBDa4YPaHdXPKD
	IcLZXHdF6XzS96mSTfd/c29b2yBt0J0wQrktT2mqLpx0f6Dwbg==
X-Received: by 2002:a05:6a00:7490:b0:8b1:1410:ac5a with SMTP id d2e1a72fcca58-8b11410ad8amr2336b3a.13.1793759741578;
        Tue, 03 Nov 2026 18:35:41 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:35:40 -0800 (PST)
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
Subject: [PATCH v3 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization macros
Date: Wed,  4 Nov 2026 10:34:59 +0800
Message-ID: <20261104023510.260766-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Collect Reviewed-by from Mike Rapoport

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
index 779b1de33c78..c8c5a996e20a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3317,7 +3317,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 			 * be no contention.
 			 */
 			hugetlb_folio_init_tail_vmemmap(folio, h,
-					HUGETLB_VMEMMAP_RESERVE_PAGES,
+					VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
 					pages_per_huge_page(h));
 		}
 		hugetlb_bootmem_init_migratetype(folio, h);
@@ -3357,7 +3357,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
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

