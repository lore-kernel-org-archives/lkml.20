Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759752;
	b=EfT63oXcOG0GGRvNuZA2wxOSz4x+yzFk2pytehTvIs3Kd1GpPO5ngJvWinZtRQQAh/Zd
	 QV81NaiKXcBx4JWPChtYi028P7as1ofAP4yeVwtX6cZLQJy+v3bqpV7tRVil6ZDuRJDV4
	 tyeqW32k3mUmll+8ihyNEUDQ4GRhdyE+ssX16qxFtQjJcscxULp8lTDaeZbka4zv0YyET
	 awOKhPZklo+3BR04o2nPYZSvpJtsKR1FXMYh5sIcTGfx9HDtyPO62+u3rahYJJgm2dZ11
	 I8V181gmT9k2/PlRrmhr+Xm2xOrBaKkj0G3X//O7UQ2TUKfdk++DFhrdgJbmmGtskCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hOa7vqp2KlJWIdXBbWPx3RR6P0EHXGn9DPhaIIX40Uk=;
	b=konq4kBKc9J/sue/5HrQ/yt5eAGHtqlirZWlP+knxE90COk2+XonBNoEaywOVA1bDNAD
	 mUs9a00aRrAQ1QnZltj9mLDrCX3yOr4YJ/D8yRu4o5Az5Zbb+Ul3PrNxnH+GY2tpLGWd3
	 CZkgqvF+vQeMH8ffpgQcNKgUQyQ+MocoRUMy8cGGLzhLYf56b1NSXHY7zc7bS0m5Vwm7w
	 I+eV+oKJ6xg1A99REMmxd/u1itMTm2luf3kQONhp9BncPNoaxNBOAYf5Pf0oc2q705PmT
	 YbZYNU8GOov3QqyZeYf3vx1LK8VPdGyZ1alwKB67986wMiwtaplEGfGbA5LgWNbIaPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jldxC5rX;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF9606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEF9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jldxC5rX
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso110109b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759750; x=1794364550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOa7vqp2KlJWIdXBbWPx3RR6P0EHXGn9DPhaIIX40Uk=;
        b=jldxC5rXjEGAQxwpiltw48YYw5rhVk7mVdx4Rg9c6/TFwS0/Hsw8JkTSpbrqBM3tht
         ioS/h0tCOR5CNi4DhOL4OAaiL1xRC54UOEkCKYCqaSshFDgmC6h0/EYgYyP/l6NKAnQJ
         HLkQKQ+Umy3055yX5+hx2/cEiPjnTXNskcuTrw7EPovdw3wbHBU0qtLHbPFX3HOQV9gc
         WahaxW0yMILmcRspe+CbxefWAv/0XO+jZm660s3MNu9S3czuo/Dd3vW/EeXJbMLoxCKZ
         RPlNOvo0rXveuotkyGINIV/duhApVVATXT+JCuV3yrkHG1Y/1BgX6uL25VcDCO5HEw+5
         k6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759750; x=1794364550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOa7vqp2KlJWIdXBbWPx3RR6P0EHXGn9DPhaIIX40Uk=;
        b=BuGdLhZFjH+/XYsKoAhAzPlFL8uo46AgqR3s2hzUkr16SI/fK5NL+4ys70OyX+FfUS
         hrrLxAl9YFdMnTgc2Zt3dMybgfz29NHRElkoGsw5riR6D6RJa7s3XGhSnQ4UOs46YXxT
         rxLOnVAu1I512+5OkBv4X/tNEvG22yUe65o8MjFbs2tSAVKruVnwVbWcKBpX+afbnt5k
         uNhMJp0dd2ehbhny2HriArovpvyuCTijuTORISK/wj7+tfVjYLrl7NRqPzq4UEt07I1J
         3YcH28ixFx6tSnOAJviPmqDdVrT0rRdIiPTbM4ncmnC3IGnYmMFsXy2zMOBy+3Ce1JDi
         Nxcg==
X-Forwarded-Encrypted: i=1; AKwUvBz9PgvDIuPiOqYVEJVti41t72MxoY4p0kn0TJj+iHVjz5lIiQlmUvk0j6rJyhdpL+dIv3rIn0XtvtFdwuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cfRJZCCBUB4UttS1JHzyxRm5vRp8EOQA5Lh8cOuNaHPkHK5aJ
	i2su4AvW3wV61PwWeX8oZ1orIveM0ebGBCl4fVtzq4cyESTgc+gPkUA1+WwfD/6iAkg=
X-Gm-Gg: AYBFou3ISJj8GAkcnT44rkfcBynT+zsVZgX7aP9cqOozM08p0VX8TZgA7E6gx491bH1
	vXudW5kvhpOfgcRRn6iqCtsPP+FJfui5UkcHMKaMyPIwqH160sfyrpqpofdK4BvNtSfRxazWInN
	KcUiYWApKz+IlD9Zlf53D98+w7v3tKEAHcXv6hdSkW/9XOTmN/EVdGg+tpOkThBGplq7g1mfVke
	mEcC3js9TzjpuGA4NHFF8fX5TEBrzykd6o4SgSqZkbMwlZwuGFJev44x+IaDJ+i3lXVIsCZwGKv
	oxcxlsyK8X2eJfSmhCN+mKkfVi3S154n6cb2H/tD+nTSAM/7uyOklaFn1QrxS7I1HSRbPo4T/JP
	796S9q6KR7DJCUw2MmRCWFhNcW0vS2w2AlFyclpr1N+ebYG6hltxi3O6dY///t8AUXwuHeMk7b3
	ryDLEeZ38kOqyPKGKxrtyaJ7klDWrwUtzmQ5/d91T1CKVphx3CBUY+ehatr4NuAecE/Xy0hjjfk
	K3TQnTlyqnmntv11fSQjO53GNM+tp7IQhIOtY5qtBiNt9lt31QF7Vq1kTxf1eUob7zU7/48G6lT
	WkxQLPfViRCob9FKD4kgRBD36p+tsid+HvjcG69S9f2B8lJzCYg1A5ubua9u6X1bpwjQRUM=
X-Received: by 2002:a05:6a00:600a:b0:8a0:f375:d1c0 with SMTP id d2e1a72fcca58-8a9bf047eb5mr11162027b3a.33.1793759749961;
        Tue, 03 Nov 2026 18:35:49 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:35:49 -0800 (PST)
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
Subject: [PATCH v3 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page handling
Date: Wed,  4 Nov 2026 10:35:01 +0800
Message-ID: <20261104023510.260766-4-songmuchun@bytedance.com>
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

The new head page is already tracked on the vmemmap page list before
remapping starts.  Passing it separately gives the remap walker two
ways to refer to the same page and unnecessarily complicates its
interface.

Use the page list as the single handoff mechanism for the head page,
removing the redundant state from the walker.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Remove outdated head-page wording from vmemmap_remap_free() kernel-doc
  (suggested by Lance Yang)
- Document the vmemmap page list contract (suggested by Qi Zheng)
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 63e899cfaac3..0e5b2b182d1b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -25,10 +25,9 @@
  *
  * @remap_pte:		called for each lowest-level entry (PTE).
  * @nr_walked:		the number of walked pte.
- * @vmemmap_head:	the page to be installed as first in the vmemmap range
  * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
- * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
- *			or is mapped from.
+ * @vmemmap_pages:	list supplying replacement pages for the remap and
+ *			receiving displaced backing pages for the caller to free.
  * @flags:		used to modify behavior in vmemmap page table walking
  *			operations.
  */
@@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
 					     struct vmemmap_remap_walk *walk);
 
 	unsigned long		nr_walked;
-	struct page		*vmemmap_head;
 	struct page		*vmemmap_tail;
 	struct list_head	*vmemmap_pages;
 
@@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 	pte_t entry;
 
 	/* Remapping the head page requires r/w */
-	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
+	if (unlikely(walk->nr_walked == 0)) {
+		struct page *head;
+
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		list_del(&walk->vmemmap_head->lru);
+		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
+		list_del(&head->lru);
 
 		/*
 		 * Makes sure that preceding stores to the page contents from
@@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		 */
 		smp_wmb();
 
-		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
+		entry = mk_pte(head, PAGE_KERNEL);
 	} else {
 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
 
@@ -284,23 +285,20 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 }
 
 /**
- * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
- *			to use @vmemmap_head/tail, then free vmemmap which
- *			the range are mapped to.
+ * vmemmap_remap_free - remap a vmemmap range and collect old backing pages
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @vmemmap_head: the page to be installed as first in the vmemmap range
  * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
- * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
- *		responsibility to free pages.
+ * @vmemmap_pages: input/output list whose first entry supplies the new backing
+ *		page for @start; replaced backing pages are added to the list for
+ *		the caller to free.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      struct page *vmemmap_head,
 			      struct page *vmemmap_tail,
 			      struct list_head *vmemmap_pages,
 			      unsigned long flags)
@@ -308,7 +306,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	int ret;
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_remap_pte,
-		.vmemmap_head	= vmemmap_head,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
@@ -549,8 +546,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * they can be freed by the caller.
 	 */
 	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
-				 vmemmap_head, vmemmap_tail,
-				 vmemmap_pages, flags);
+				 vmemmap_tail, vmemmap_pages, flags);
 out:
 	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-- 
2.54.0

