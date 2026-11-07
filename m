Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018570;
	b=p0PPkowZsAwXkzWmxPmQperrArKXwJNnuxMCGKItAze+oAt+E5tbi8TLPkoB6eEsxIe8
	 frskLhZXdnNfBNeM+RGB58uleCd3Viv85lz1MxzoQ7oV90rgLZaCMTGoWPJcrM01+3E+Z
	 x+QjgJekS1o+7vR/KBgTinl63oWdgz5rqfRQwrZo1uneZj/iJXc7ujUECZqvfREQQTPpk
	 TPZb/+xfoGkBhrbi8B/FwSsGmQmmJTv/QxYIUNIn/4XvmI3UiZ0Ff1JUYdoHDfKtTyn+R
	 b2dfKLya5S9z4gDmJPbDEONd72Q+I8UP7X7MilDuvkj2p3NW/DNFWrHuvG7Ch5oprTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hgfq1TjYmlVgFdPNAKA7e1QHh8SvaKABjVEcbQNBC1Q=;
	b=JHylRPXJWaZgX7scGHOWhN372UzRe4cWKCGqIz9dGWvzhcarEXhG/FFaVK29iN/yiksC
	 ZqtoWAXMKpiqOXi9P2i0MHbm/dTB30COAS6noSvHClyaaEaICAnV/+cHvRV1BYyn8Pcna
	 9t/5bv0fnqMlDedBr1L4rs9lXacIv/zWm1y26QEOvVep/1HLGQPgemZmD3O/l+hui2WTi
	 CZwDxDRTWoXF0vB5ayaVYyj7bF/P/t9aRcPz1sNTYK3OFbsyBesaw7X4JxBIzIHP98eVw
	 iVyILO1K+kkl6VHXnoOpcOgWnGRZozGInkKxfc+kSIUFCa7gRk5wi8kie9vSvK3oCWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=O5BJjq0l;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D743606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D743606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=O5BJjq0l
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f6295304dso1299768eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018568; x=1794623368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgfq1TjYmlVgFdPNAKA7e1QHh8SvaKABjVEcbQNBC1Q=;
        b=O5BJjq0lSssdOi5C17hzNRmWGWFiAStt4B36p4pqrsoS/1ROqInN+NpbD+Ae4IvOJy
         Ck7xU7hnL/T7kJP+Z/z+ZdzUmSzIll5ZDKaHKZopkvWDZOrXKpt19wrAz8p8yw2g3YHq
         TOJOADn7Xp9O9QcsdU8E/zZZsoSX1lR28k2h6JtMWPXf47J6Yz06GZQOQhH8pQjnycOq
         5iOS5hoTp1FLQIChHt6ERCz3QlIxE4A4jMbl+fZtDm3pdbNRgCp0npKtCR7PK+nMEJZ+
         KLq0IFN5lPk9x0R4JdzR5Di3lyV8B0f0G4TuevXTb7FTe5obTuWJRwUiQIJXxkRJaMec
         LS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018568; x=1794623368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgfq1TjYmlVgFdPNAKA7e1QHh8SvaKABjVEcbQNBC1Q=;
        b=l1mMHVSCxtlU6DmaN86PU9LHsvnYk3Wx8rqg5Z3qeXMWCRvBm78tI7ylMnahlyyunz
         P61mKHDN3wI7kjd9/hv74UoSHKAIIcKWHpFhGggHbUzGTC8I0cu41DVpTn3d8Zuzqk1y
         K+bsbSDfC/1Z85vxVTQDYTVhzGmPnF7SCxhcqLNcgd5KC2OPwsCYfHK0nOe46w2PxiEC
         JbTmpdS2IYVttpMmXLmHir8CUBM3ofJNndxTBxqACVzPJ1gvsp6nDIoXZJZYPVphiCxn
         cC5EvFb+EvO+Pxd21jZc5S7KWQ68DE/cPqpiWBS+szJXr0CpBxtaM73JXNP/Xrnv/l6g
         vkYg==
X-Forwarded-Encrypted: i=1; AL+hErG7PkMi3/EkyfN35MzQyQa/PJYo8x9nQ112T3f1IpXqNjZS5I1hYKhnQ32sB7bSzU//kNlPysoPqSw0J2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z95tRhMlffPLcgYUckvs34U+10Ap2wGDDEc3XXruM/vq1zWlmiC
	OHRZcwMj1L/G9Yx+vRFwPLS6nxYDqcPri8rPQWIMazI6NdzTmasgINcWMpeJ4k8qlOj2xa4PxHq
	e3KibPyFGOg==
X-Gm-Gg: AYBFou18B+b5F4lcWFYZyCRNE7GNZP0mJfcAdZVSpV/EhJD/54zpj6DJOQKuPXZa8XF
	mL/BjXvJMlQrsqdxmkhnVulvlOLCYD9a8Q+J71URTmEFGLSAF+vOjW583ua2xxLjqWodBwPjD4L
	FKzJB+/FFotjyN17A0amv/M3mjKgyUZT4mXJposQ0dGG1duGwm9C9JZAsF8/fVeQ8QeF+0tAk2z
	QpSyJI5EebGJXqwqUCKl14+Y6AXrYut9UkFSb4ey4Dwn4sxjLzQfG651rlK/5peu6om7f0bhEsq
	aM+/Lg3gmrQCdRR8vZbh21bvqWvoLNXd8m/r9D/39hgtZ0O2ZugsAiOMCYpRu5Mw1SVwclUEJXo
	HXsYD39/5J7no91J5IJf6rdgufMGb7s5qiU3krU7HbwgfwWPT2VP7K/WoK1CJZdRiagBUOVn0FB
	LR48pAYTQKLTssESukSaqLbOu1fzoxqzWFxSJPSAqasO7lZhEm5K5ai5ZznzhiSv7Sd4fUwQ4LI
	0CrWbpzd+EFCYWQE7uPBxo0KaaiKF9IseFi20Z/E/4BpX1mi7sMTKjX3WflgTrAQkHQhhitdwJN
	nAl18XBEzXyqlClEnM/+tY84KMMWmY6xv3Y5MmQ0QpIiR9plg/bxzwKZpUm8
X-Received: by 2002:a05:693c:2291:b0:36a:3453:a356 with SMTP id 5a478bee46e88-36f770080d8mr5918729eec.36.1794018568140;
        Fri, 06 Nov 2026 18:29:28 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:27 -0800 (PST)
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
Subject: [PATCH v4 03/13] mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
Date: Sat,  7 Nov 2026 10:27:46 +0800
Message-ID: <20261107022756.77731-4-songmuchun@bytedance.com>
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

VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
describe fully independent choices. A split-only walk can defer the
PMD-split flush to a later global flush, and a remap-only walk can
defer the final remap flush. However, when a PMD split is followed
by PTE remapping, the split flush must happen before the PTEs are
changed, because stale large-page translations must not overlap with
new small-page translations that map different physical pages.

Replace the two flags with a single VMEMMAP_DEFER_TLB_FLUSH flag. The
new name reflects that only safely batchable flushes are deferred. Keep
split-only walks able to defer the flush, but force the split flush
whenever a remap_pte callback is present. Callers that batch HVO work
can still defer the final remap flush and issue their own global flush.

Current callers keep the same flushing behavior.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Collect Reviewed-by from Oscar Salvador and Mike Rapoport
- Collect Tested-by from Andrew Morton

v2:
- Rename the unified flag to VMEMMAP_DEFER_TLB_FLUSH and update its
  comment (suggested by Qi Zheng)
- Update the commit message for the new flag name
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index e51f079f43e1..c436db31c6c5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
 	struct list_head	*vmemmap_pages;
 
 
-/* Skip the TLB flush when we split the PMD */
-#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
-/* Skip the TLB flush when we remap the PTE */
-#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
+/* Defer safely batchable TLB flushes to the caller. */
+#define VMEMMAP_DEFER_TLB_FLUSH	BIT(0)
 	unsigned long		flags;
 };
 
@@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
-		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
+		/*
+		 * Modern MMUs allow overlapping TLB entries with different mapping
+		 * granularities only if they map the same physical address. So
+		 * remapping must not proceed without first flushing the TLB.
+		 */
+		if (walk->remap_pte || !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
 	} else {
 		pte_free_kernel(&init_mm, pgtable);
@@ -166,7 +169,7 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 	if (ret)
 		return ret;
 
-	if (walk->remap_pte && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
+	if (walk->remap_pte && !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
 	return 0;
@@ -274,7 +277,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 {
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= NULL,
-		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
+		.flags		= VMEMMAP_DEFER_TLB_FLUSH,
 	};
 
 	return vmemmap_remap_range(start, end, &walk);
@@ -458,7 +461,7 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 	struct folio *folio, *t_folio;
 	long restored = 0;
 	long ret = 0;
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
+	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
 		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
@@ -517,7 +520,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 
 	/*
 	 * Very Subtle
-	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
+	 * If VMEMMAP_DEFER_TLB_FLUSH is set, TLB flushing is not performed
 	 * immediately after remapping.  As a result, subsequent accesses
 	 * and modifications to struct pages associated with the hugetlb
 	 * page could be to the OLD struct pages.  Set the vmemmap optimized
@@ -596,7 +599,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	struct folio *folio;
 	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
+	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
 	if (list_empty(folio_list))
 		return;
-- 
2.54.0

