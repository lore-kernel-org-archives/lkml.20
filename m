Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759747;
	b=MOiv6HOegui77CwgS3fZ18xzgJIh98ku4ljVU2jpD4410PuAFVFHCPdv2UJ58qzpXaI4
	 KI5Ws3S1IbJ6OmhNnBQ3hTCuBwV9GeL7xkWrQ6kuzVkTtF3yTDWmIXVKWs99Jv02R9HBb
	 mVlN15uSedetdDl8rvjWqzcXm644CX8s8dmIdWs3a54LCTGYH2W0I0jf2kHW6QbeyPncR
	 Ng4UVB0PmS6xMvvIAT5RpjC2CCjbA+SspoS9eku3npuRE6ZjB/dk6uOaN4JrdFSPnJWTR
	 rooTRsdV6iBQGHshgLbRKNG/DyWNoS5V8m1bJMMi4dHfFzSImZWNRz4/v3i0Ie+pgTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lTMXZFe5gyQw5mYi0ReIkJiMtVGiDJG8MERdlHxMBwM=;
	b=oBdcXqGWhiZ9saA1uIsxCcZn+Rx0g9adkywS5Fm6lrN8iVLbDKXOdUOEJW0LfhjWxu2d
	 yt4NopnQbtMMT8oxEQB50/rH26rgaa5L00FGDds+1YRHFxuKeT2UiAafleN4QKMgmtLBH
	 PAL8E4E+yq+iPScYKkCv1WkHQ6WaczcdwcxNi4g5C7bj1s9o9zd5UbyNEjBLjmUzULwkw
	 B+pyxth3x/L2bliewv2GxTFhPqS5Sy/Ib2vaKbg/duj34wLPwuGpZpDN/uNeAcAkgA6to
	 qm78vMfwT5nrU8L5NFeY0s/LmBHTHrFWDrEcEs/79uawd7kCxi0JDV+DdPfnIn2/nGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jsVZiccM;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6072606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6072606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jsVZiccM
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso110098b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759746; x=1794364546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTMXZFe5gyQw5mYi0ReIkJiMtVGiDJG8MERdlHxMBwM=;
        b=jsVZiccMgOs6FWtPHFmIuce24xnnysDXo0V6CsFJE/tc9xoTHujnJJWGEqMkbeoGk1
         Gq+lKBTmLK+HFEaVRrZqbgoGfmZIfNRTyeiqaafjlqmElRjAUmu9IAQ4ZtYCgK4EFeLL
         YolGaO3l8V8L6+MpYgFGH6Kn8B4RuCcUxex87/d7bcoImulgwvSVdurBf4+/G8IhJlX+
         HL3vl9Q4pCxUCzl2Iey1NeGTeG8jijLlHpqLxJC7ovam8oCDSETggmqxw5pjDA33HoCb
         MrcQ9WQtJiDDpZoVkZdEPVtsVwd2w3vf0Ca/r9RUIzd4WvMTsS3OzbZtNhNQ+6bkF1bY
         u2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759746; x=1794364546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTMXZFe5gyQw5mYi0ReIkJiMtVGiDJG8MERdlHxMBwM=;
        b=2KYfo6VABTIVSjdI4mIqZKZ+VEiSJFQcYrk2fvLRBcpqvF34yHmL8SQYndNztddaqK
         lK+e05elSwaVMJp1N4i7d7RqrLFQKIW2EBfNvXqCEHA3mkyu49HWE9c/k8twgdwhD3NC
         PvawoTWoVa+T89WHS4rjgPrISZWQWdPJlF0aB8VM6UUGi/Y5s5JAWKZdHxv1cirC5+y7
         /oT78hxWyqI9Q9c1KM+a9Xqy2hWS76UAXaC5+hpzqTXrl2diCa2hY/Z56W+EHWshEmeK
         2YJv1sz+33rJ/qhbG+a8bf1b+xJZc5hA8t+0o9YYphqjj3DnJNC0x+HQwbSeg0ovlWJ6
         2Jgw==
X-Forwarded-Encrypted: i=1; AKwUvBwi4d3ZNC5NEl7hFszxxsQmgrToeiFm4jWrKXwhHsT97qwupkDN4yn3fqcg/kaqq5BMSdzwp7Hf/trLOho=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o/O5DtwhD1bE7ueh1ah3zYHu2Z2i4qIHdiKm1d7wnoFK3bBbP
	RZQDaQLpW0+RyhQU2eA5UQuCm1NMRDjnq0fQKfAmUEMnku4Ncpsf8r0nbPlQ6AZgZA1ebf3Mygt
	b/yXgvOA=
X-Gm-Gg: AYBFou0MCgqHGs8WGG8bdFmUj/PMcW784cGjoXG+nr5SlpQJwLhQ4DHiIjaZ3F3QkSD
	8JdwEhUj2Afwq8L1E2Vh3sGDGeRW/XHP4rAMpz07xCGiKROXPM4OZ8pQZXyZmOzGR7jnHaJl8nX
	Lr+CfVUvHHI3md5ZDvlfdKnlhIgxAI7zKc6WBs1Uzbs6uGCZHI1/2SvOwMzQt+hVeFFsc5NJ/tv
	IzuE1ZGTcId1oMrdHhtowcrmyxrDcd69b6HTO84iTdUJju+6NtggXnaHVKdk5oCenm5UnAGYqyR
	5KGq+VmkoF8DG9PDslZXk+JV3nFhGyM+yahgVejBExCuqQY23VzwASxxGyQ3diOTqG1r8iW/RAC
	2hld9qyVjfXNSX8+esAq3hJZ8Ro5qf8DhQ2c0uBHdjZ3+OuRVtYwPzVR03GNl+hZD/i/rsv5jCO
	rp9gMrS7yt26P8fPfiip+uAHzydE0x96FXzgwlvGGQlFiOhaEUDtHVUoo2UrG8LMcDJw9uUvy6C
	5ZhR+gkRR+rYIKviHV5LMQFOHjqusIgqVESlMyVg2LK95c9Az38ZGMihMgHHPWwL46KRNotZR5G
	YnpmfmIkiW9A8uP2R7edxJf05oyKVMBegfVriubZHbS6u8nvFw==
X-Received: by 2002:a05:6a00:c24a:20b0:8a0:3ed7:93a2 with SMTP id d2e1a72fcca58-8aeaf9be0fcmr3360573b3a.52.1793759745870;
        Tue, 03 Nov 2026 18:35:45 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:35:44 -0800 (PST)
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
Subject: [PATCH v3 02/12] mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
Date: Wed,  4 Nov 2026 10:35:00 +0800
Message-ID: <20261104023510.260766-3-songmuchun@bytedance.com>
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
---
v2:
- Rename the unified flag to VMEMMAP_DEFER_TLB_FLUSH and update its
  comment (suggested by Qi Zheng)
- Update the commit message for the new flag name
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4b73d6ec8dce..63e899cfaac3 100644
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
@@ -516,7 +519,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 
 	/*
 	 * Very Subtle
-	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
+	 * If VMEMMAP_DEFER_TLB_FLUSH is set, TLB flushing is not performed
 	 * immediately after remapping.  As a result, subsequent accesses
 	 * and modifications to struct pages associated with the hugetlb
 	 * page could be to the OLD struct pages.  Set the vmemmap optimized
@@ -595,7 +598,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	struct folio *folio;
 	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
+	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
 	if (list_empty(folio_list))
 		return;
-- 
2.54.0

