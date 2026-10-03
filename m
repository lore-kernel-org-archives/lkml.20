Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3947266B72
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986900; cv=none; b=Bi1vi1d4cEcORj5oszNqSAg1Hpr5/dnE7Sm8P2ZOInpAvW8S/nfUzfpk7WgT/CD8vIuWcvmegstXJqU9HxlN6vK8EIRcl3lz0yVxMNAYiEZmv+D1wx5s+4cMVpZrsWpY4KJ4T4rgNEJZmPAwCCOsXyJKq/HKtR4DmBqydlr+yt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986900; c=relaxed/simple;
	bh=1/ewaisXSE4tzMRC5qUH85WxcWpKsis0WsFblBgykWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rYOC7tBqN0vnaTDv+RC+BvW/2rqK+MXtOF8R+UAdOPmRum3CsMRFWXqkvZvKjwksQd31gDHVOLNEPNt3f6E7UDP2ATAM9u37Z+Qj2PikG9fermFAwP2LWuS2EAFggGFunZGmfJc89pOHzUIxrVh3u1JQH+9F+2t/01Qc+zqnEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQmSxHeT; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQmSxHeT"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso161786a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986898; x=1791591698; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SHdCJPwxJseGLQVvNpBndLozFHVWi7DqdUkRWyPzrM=;
        b=kQmSxHeTdYmDJd0MZ+qTWj3TnHhgTEzHE40QDoAxdSqeMEywenWF0JfIClbPuhV09B
         OosjMMTl6OquU5icaeqFE0u7i7jrFMWZdH1xuJesf97XBMmR5eqEDsx1CWDLsz77plze
         n3GtB4A4XwhkSvL/0il8RSSs/IHYp8SZ1WF/ij4xsA0puhQHNBRaPxKL1URwkg80cWrk
         M1uynOz5QQY+6zBGxmci9W+sXYEUoqWqiYQ0PY8rImzwlyQAYyu3lewg7pGqWC52iUP3
         r4ZK7astyBtwn9SV4zFC1zHs5e02dIeLuAiNOqmBvMNwI+dv+Ab6ztPRKtMAJT78AdS9
         It9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986898; x=1791591698;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SHdCJPwxJseGLQVvNpBndLozFHVWi7DqdUkRWyPzrM=;
        b=iK02fzI5ckhGzSezkZ8kwuzHRYRa1uqOhjez0YcEY3uHgYFp0n8Z8p1LLqCteTrmpF
         BGZN5iGmyJ2bS+vZ1iESL7M9zp2bSIBwQYNh0MIKnwykSvYORSBuQKshwuUpFidjMqbq
         wACQdyhZL8ddmiBufmm+ZZQzRT4q/WuR0qNDYkBY0TstojkqtPW2FptA+STQWLigYby0
         EiFUy4pqxKRkFA3rT0bwbPpIr4IapqkxUZGEwGfTbyeKUB0ZnQuwuotegzqtSsR5qkh4
         9rqIYEx73dAthlrs68khClpuH6Ry0XxUW43E96WSkYNcA/jqA0//REFte/yFFpSj/c18
         oM2w==
X-Forwarded-Encrypted: i=1; AKwUvBzDbbU44msU1jVJYcBvD07yw1SiZ8GZUvgSSazJ6HOWEMcdaRSkl3Fam2K+Hv90awnU42OEHX//Dum1XSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoS5IVi97v76dj+NKpj9weT6Q3ht5PhhnXKy195F9DehXYwp61
	77Z2Khj85eDsHQrq7Kb9po+VFMYA6D3fZESKMzBQZtEwzqrcuYTo2TE85tKTTes4XIT4by66bCE
	ZXEhbwX6VGI+dit2S0Sn78g==
X-Received: from pfbf1.prod.google.com ([2002:a05:6a00:ad81:b0:88b:18fd:b97c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3308:b0:886:cae0:fa28 with SMTP id d2e1a72fcca58-88c64645740mr768676b3a.40.1790986897754;
 Fri, 02 Oct 2026 17:21:37 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:07 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-5-jthoughton@google.com>
Subject: [PATCH v2 04/20] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Right now it is assumed that the restore routine in vmemmap_remap_free()
will not fail; that is, if we fail to fully optimize a folio, it is
assumed that restoring the folio to its pre-HVO state is guaranteed to
succeed.

Although vmemmap restoration may never fail in practice, properly handle
such failure cases now. This will leave folios in a partially HVOed
state. In a follow-up patch, failure certainly becomes possible.

In the event we end up with partially-HVOed folios, make sure to:
  1. Leave the HVO page flag in place.
  2. Free any unused vmemmap pages.

Always pass the vmemmap_tail page to the restore routine to avoid
leaking the non-optimized vmemmap pages for a partially HVOed page.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 49 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 1a2645c382ba..90db4d069ff6 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -235,12 +235,15 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 {
 	struct page *src = pte_page(ptep_get(pte)), *dst;
 
+	if (WARN_ON_ONCE(!walk->vmemmap_tail))
+		return;
+
 	/*
-	 * When rolling back vmemmap_remap_free(), keep the copied head page
+	 * When restoring a partially-HVOed page, keep the copied head page
 	 * mapping and restore only PTEs currently pointing at the shared tail
 	 * page.
 	 */
-	if (walk->vmemmap_tail && walk->vmemmap_tail != src)
+	if (walk->vmemmap_tail != src)
 		return;
 
 	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
@@ -276,6 +279,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 	return vmemmap_remap_range(start, end, &walk);
 }
 
+#define VMEMMAP_REMAP_INCOMPLETE 1
 /**
  * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
  *			to use @vmemmap_head/tail, then free vmemmap which
@@ -290,7 +294,8 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
  *		responsibility to free pages.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
- * Return: %0 on success, negative error code otherwise.
+ * Return: %0 on success, VMEMMAP_REMAP_INCOMPLETE if the page is incompletely
+ *         optimized, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
 			      struct page *vmemmap_head,
@@ -325,7 +330,8 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 		.flags		= 0,
 	};
 
-	vmemmap_remap_range(start, end, &walk);
+	if (vmemmap_remap_range(start, end, &walk))
+		return VMEMMAP_REMAP_INCOMPLETE;
 
 	return ret;
 }
@@ -358,6 +364,8 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
  *			 respectively.
+ * @h:		the hstate for the folio whose vmemmap is getting remapped
+ * @folio:	the folio whose vmemmap is getting remapped
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
@@ -366,20 +374,35 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
  *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
+static int vmemmap_remap_alloc(const struct hstate *h, struct folio *folio,
+			       unsigned long start, unsigned long end,
 			       unsigned long flags)
 {
 	LIST_HEAD(vmemmap_pages);
-	struct vmemmap_remap_walk walk = {
+	struct vmemmap_remap_walk walk;
+	struct page *vmemmap_tail;
+	int ret;
+
+	vmemmap_tail = vmemmap_shared_tail_page(h->order, folio_zone(folio));
+	if (WARN_ON_ONCE(!vmemmap_tail))
+		return -ENOMEM;
+
+	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
+		return -ENOMEM;
+
+	walk = (struct vmemmap_remap_walk) {
 		.remap_pte	= vmemmap_restore_pte,
+		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= &vmemmap_pages,
 		.flags		= flags,
 	};
 
-	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
-		return -ENOMEM;
+	ret = vmemmap_remap_range(start, end, &walk);
 
-	return vmemmap_remap_range(start, end, &walk);
+	/* Not all pages may have been consumed */
+	free_vmemmap_page_list(&vmemmap_pages);
+
+	return ret;
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
@@ -412,7 +435,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	 * When a HugeTLB page is freed to the buddy allocator, previously
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
+	ret = vmemmap_remap_alloc(h, folio, vmemmap_start, vmemmap_end, flags);
 	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
@@ -545,7 +568,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 				 vmemmap_head, vmemmap_tail,
 				 vmemmap_pages, flags);
 out:
-	if (ret)
+	/*
+	 * If ret == VMEMMAP_REMAP_INCOMPLETE, the folio might be partially
+	 * HVOed. Leave the HVO page folio flag in place.
+	 */
+	if (ret < 0)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
 	return ret;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

