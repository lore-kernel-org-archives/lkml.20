Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018564;
	b=nGGFw0QQIFbHwFxrCyHyGScM8iZx5cvS3DaAFo7WmFkzpl6lDDa82Rhs/TIrMbtebSYr
	 FxJipw2yvntvxABEdfmq+n9GjlauKz51JwirEHIeuC1HCifTEFNayWHDaEkHeH23qa/+8
	 EwpVFsYdWUgXM9RBRvVshIAdt/M/PfBxhV+4YjnDTxH8+ZZyGDIFMHM8kaDftfZvBMftj
	 jVHvYEJDDUU+EdaMvsUciIfj7QaYFj0O8KKjRGYIhxrDUO+uNIrECr3Gk0nPBVKeJVUX+
	 aWwOn8ZGV4jBW3T5Wnbfm0zAs94RBavmAb4OKFXMlp8FVZq9thPljd6TgqT/++H+HKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zC+O0MAETpzKUpVryru1gwlXYZ84tyqVBeTZILJyTdo=;
	b=xpT7ho55t+f6tdbQdHSwAcqj9BvJ+VU5hxvzJ8kPgIPkGwNTb83C1NAnL7A6ePwADXC3
	 R9v+oDmIpPoerttow14AGWn8eqck+3cIYP3Spp32Dm8p2bbt0yIwQNVgDS4QOQy46lmA2
	 4N3txGXqFC9kvAGDpsTs7S2AaFjAjQOm3oikwhrQRYtRe2mW1vLM4HzEWYDs8oAdKu7NS
	 E1cKf6/8mhemAUG2qMyPhi8a7ParzXlXppGLxHVmjpT1jv9W74G7koJKirrX3p3X0/gaA
	 UL9vWIIbRsa0lK4RwWWNnvGutrg9kB6Flb46AasPdsMqSwJXNvOaeXw7H1utjtN1Xvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=glhl5SVb;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AFF606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=glhl5SVb
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so1720721eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018563; x=1794623363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC+O0MAETpzKUpVryru1gwlXYZ84tyqVBeTZILJyTdo=;
        b=glhl5SVbgXdFT6bRfeaVaN8StuiCjnwT8Xukuq4VgbcvyU9TmjUfYt6I9GlMFVV2f7
         tAPF70FhIjqx1auroTNCcrjMJj1xq9OD4MU4dawjbmhR48gB+XG4Q2HdxeivV3O1GwRB
         58grwMLE7njtS3c82SzGwHWqzoOM5ow75ugFNiwAjBrezRdCGKMQmV3Ev/uwNw21RyhK
         x1z7oCGaRWyq7FwwmpfcOjIeynCGzgyYvdU4UqldF8NyfMDnhnP08DDh5ux2W/5fYTCb
         Ayj9cPY82J39DxTk/VFbdtK7dCdk1x+iMU6wERwA6vlAkKTyrXqmGRNf/Y6XYxCbf0ze
         IJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018563; x=1794623363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC+O0MAETpzKUpVryru1gwlXYZ84tyqVBeTZILJyTdo=;
        b=PXu2xkh1ZmKDIsqMy6+tn35rHnGQuAXlXfbvcIeVvWrkX5CCTvVE7jNPH+U96w1sFd
         4P4LVV596bpq4xZheNNCuwmAxEOfjK/gm9+YLQGx7PEaU9yz6Lw01O+MGmx4JTOEZUrF
         scLGvaJ+H6bNlUaKKLmVDDhnbmKtceTbCRvy+YfFNheeMPKLJj4RM1VtvbYvVR6b1X9j
         9aKNi0bgvn9k4FlNH3VE2y1sM99ycgqCDlU069XQZT3zHnHMQKgV/qNOsTq+/uosXkRi
         29ZuUEmvrFDNp/72704xgUfl0+I/3SrWXnVaNW/kSFy3172ydc/pYtrrmhQKrw6eByLO
         c2Sw==
X-Forwarded-Encrypted: i=1; AL+hErHl6/Oc43quMxhuKZl6ZI/8anaiz1pHrTjSK9LUVvaBWJakeMIQego0lcFXcDLq0guo0ss7wbaqESPpNJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9778nk4aEerBivRAHMO9xroiNlQ27c1TGIqT3Hi1drGIR/T5/r
	sI/+DXZtKPe/Hn8Lz7ZzEUy6sypti+B0cRAd9Ks9fFfUrJEZ9e2CtsVlFNBDuya8i+E=
X-Gm-Gg: AYBFou3aK+q0VtzJbPkPJgZmgOCo25L1DyRMJFcJdHFjUQv1um47a3EH0CBojC7ssQP
	oYWYysiCvaUdTvquayRk37kE4Xoj4Y79/0T5lLeohsj2yB7uEkjpc5If2JNxkMwVkTD5RIQKnWn
	uKuNji+v3Ghduj8D1D1CkAHfGLbItX2DX/Ea5MIsjpoUE1ggplvrJW23h+CwJwp2S7IX1GG2cnR
	I4gibaQeocClKCpKKEoIEcEQS8xUVuoROghY94dvFlFA5c7U4cVcdEDHXKAiNsWLaH6piv6qcJN
	jOYOiACgYxAXOa3+lmN2DcM4wfFsPU5jWDNc7fSrLUHxFaSN3CMgHKBEvbjW050fWB7GBH48o/j
	N0g1twXnQb/XKkH5SpCNl1zXaA2nCqGLxOkKoqAgSl4uPMRICrzY3fX21DOm/d0eOBWgepYQhtQ
	ddbfnyLz9UeaDWVPdLHbhMllov1fAkxwSMRMxhwwIfwkQ07IW1VPh/7241Uc7C2f8PzRn3TfN3s
	8KczoOy6M2uHxTxvPnYV6oo2nX72bRO14XDnSZYQgR38e45siO/Y2BIT3egdqDXSGWXVQRva9q7
	yH4RhFnirZzobHW1ABSGRcbs1gVlkda7CaKpuVZC+RsXu/sg05RVAQirHPCK
X-Received: by 2002:a05:7301:460f:b0:36a:1846:5c75 with SMTP id 5a478bee46e88-36f723ebb86mr5806216eec.3.1794018562611;
        Fri, 06 Nov 2026 18:29:22 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:21 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 02/13] mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization macros
Date: Sat,  7 Nov 2026 10:27:45 +0800
Message-ID: <20261107022756.77731-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
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
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

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
index 7fcc97b12773..e51f079f43e1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -408,7 +408,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
-	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
+	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
 
 	/*
 	 * The pages which the vmemmap virtual address range [@vmemmap_start,
@@ -677,8 +677,8 @@ static int __init hugetlb_vmemmap_init(void)
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

