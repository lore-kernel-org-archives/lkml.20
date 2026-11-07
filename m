Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018614;
	b=bXRHPo9oXFIERdjZ+pTAqRqf8Og2BewXiH6GnFDwDDBQd1DQaU57xuQIa+mKxG7BbthD
	 VPENtTK/RZO/WNP2L1IcsxCgKGGbuyk5T8uwUpdoSRJ+HDhRuUlSgFeJnXhf4di7N6hPo
	 RGRT/WpS7n3v5ANPOcWu8sQqib5ai2sXvIo8m8/g/vrdewVmtuSusIhtQOP2GWLHlNxiv
	 oybDM8fXvmfiT/SPwI5M4EWotyiDRFpuFrArI5peoLjbvT1tVHg+4EQlMz3f4TwLkmaR/
	 9I475yueAzheP6wl81a+TuOn9YOtaZOkMCH5/XUIGVtdLHxNpN22v5onZBCW+PkLHCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ubKwRSTsTIlPsoKjK1De4SkgUdRisqKqmOzxufJfKKg=;
	b=G9YqVrXurcMgNSLlEsd/N3zotAEmKPUtAmYO4m/JTLcgNKRArE+tQTHsyYy7uONsnJfK
	 5wV1+l8oE20rKOEIFdUZvoEKxLm0V5tDbKnoFBnoE8u3Gp2bpPj1A5tsBoDgGs8zceBO9
	 kh8jRORFaA2diFjjpRaAmRVqIuasP4trhgJz1/b+rsjwR4REW41FMhAaMfr+wk3SmkkeN
	 ajP8CYhH3HKt8Ohu75bZF/pJZCa8fkkgGG1K8wyEmW+GUNQ6aas9KpU6EFP+3seuoChgf
	 mInA5iSFTGRU0wDDhQ7M8PS/1pEXmlHPorUgJeycHwTW+tktmEK0taZTAhIPVosKxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=crr9uvXN;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5F606A33E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F5F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=crr9uvXN
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2036318eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018613; x=1794623413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubKwRSTsTIlPsoKjK1De4SkgUdRisqKqmOzxufJfKKg=;
        b=crr9uvXNefNWZcDrTEJsK+Vw/AjngJQHnhH1V6kE1b1EhrNzQ+pI4t8dy5tWL7upkW
         ZWBMaLbqrWtneYgctlNIpLszf/EO4CMr4Uc2yoAAq7PyFpr+V+fwzyUTHt8FVzl8rube
         DkrGRV/naW3M47gdsLDWuzi6V5zNTxIMWPxH4zKb4GIqF3REEIHuJPcngIFaN+EZDhFl
         IAJlWRBSrVt4ARjgzmM/6P3uvuwLIeYZQXhhLzoNaxNwoKzo61HKtbg8zheqmPeDJpCL
         2utwDi/OorKppSIqN1TmilTcSKU1o363zEc2bUiAX1KVKh6paYD08sxrC2rpjmUjRmdu
         38iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018613; x=1794623413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubKwRSTsTIlPsoKjK1De4SkgUdRisqKqmOzxufJfKKg=;
        b=um7pVJnWDTy71kkLu3UMWeDFa5xEhI71Kw7MNm5/yyeAPqlcz1IS+NlwpC+wPFs6Pb
         2q+8sWhDOOieQJv+tqOTBI0ydFmMIueDSojj/Xq9vXnz5rdX2geksJGGTIaDoSfBcatv
         4Co/1mBgFJpMW0+1C0Y6NLX7AJZHJJ89Dnfd5Z2U3PVgZkXE0K2fnH6KcZ21b5SrfaQ4
         cU0PfQtvceewxy5OD8iLlzsKRVru09cyJebleZyfU1DZDsY8Mi6MQCzaoqCujM1dt+XB
         oF+9KdAF8T2+7kesne7qoK2o3PxBtfu0in8ZsYgwEKZnCpy1UtVgfdWzWP9Mlg5kmbEC
         FC3w==
X-Forwarded-Encrypted: i=1; AL+hErG6YsqEQmBmk3ABh2Nyrs1eZN+6S2J7UDSQ7dt7SgaAUozbjpibGOp5R8rjfvQQHM/nkK2WREpBZIvoJUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RHvUN4nKqupFQ1KG8UHsY9tQgnSH2sAvS1P1tKAyftApyjprx
	GgIaCbPGwbk67k4rMkbFoptKoSgRtrOACfVgEz/zhaK41/qjvlELmni3Va4Rv93NvVk=
X-Gm-Gg: AYBFou1pLapn3eArzrdwz8CY+moDP4xLrljRI8nrcqMONQjomSgzle8cBGMaiz8owcw
	gqJ9GNjGRvpu/qILpHLLh+jHdydTcfnyM839zRcuWBmVyk69mYm4SG3HFqOqW8qr56CY4syc/wc
	bVQ3X61s5VkAOlqU/uJrwfE8xIwJXxdl7rrZfWVqzonywEx74QrosqVBJh9YJsXj82BqpMmnlsX
	8bWlbPCWrwPLzYmsQ9ehekY1eV6vlBDUc/pkmH1eFC570GxXMGyeBB7mQl4DZPipjzh2hlLlkfH
	SyfbkCW+t9OAafvSq2jgsP9a6eW1z5AHDv7409AtkCYui4lV2itNLj8aDIHPsUwfPWC9F91nmfG
	QqWQorqvht2RjlN5lUJWbB3Vpsy38BuREzUIQFRd9ZQINasXQAxfMYNrc/kGzrpAvAnDQtAvoko
	bbTTZ4X22YK4YByZzqh1CUAGnWJkLWUCRlVbptyFmkVp28yOST98ZFXEXZcECCP4UZIM+tDkQen
	QxW/UqraQpyCTGhxW1usTrcWL7vG4huZCvaS6XtBjIExjgL+niRUFzCN7CM96S6MXapua+jzY+B
	R2DvoKqRGXPTtxleAIQhDvTpytSlCL43dqoaYKhsJpbmlTSEaepGCQTp/pDU
X-Received: by 2002:a05:7301:6190:20b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36f771ffe67mr6158095eec.28.1794018612849;
        Fri, 06 Nov 2026 18:30:12 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.30.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:30:12 -0800 (PST)
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
Subject: [PATCH v4 11/13] mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
Date: Sat,  7 Nov 2026 10:27:54 +0800
Message-ID: <20261107022756.77731-12-songmuchun@bytedance.com>
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

Like optimization, vmemmap restoration operates on one folio at a time,
but the current interface exposes a raw address range and requires the
HugeTLB caller to prepare part of the operation.  This splits the common
mechanism across layers and obscures its natural unit of work.

Make the folio the unit of vmemmap restoration and move the common
mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
eligibility and state in the caller and gives both directions of HVO
consistent folio-level interfaces.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Pass the caller-selected allocation mask through
  vmemmap_restore_folio()
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 148bd27bb327..359e53302a67 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -366,21 +366,21 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 }
 
 /**
- * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
- *			 to the page which is from the @vmemmap_pages
- *			 respectively.
- * @start:	start address of the vmemmap virtual address range that we want
- *		to remap.
- * @end:	end address of the vmemmap virtual address range that we want to
- *		remap.
- * @flags:	modifications to vmemmap_remap_walk flags
+ * vmemmap_restore_folio - restore the vmemmap backing of a folio
+ * @folio:	folio whose vmemmap pages should be restored.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Remap @folio's vmemmap so optimizable entries are restored from the shared
+ * tail page back to distinct backing pages allocated for @folio, while
+ * non-optimizable entries remain unchanged.
  *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
-			       unsigned long flags)
+static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 {
-	int ret, nid = page_to_nid((struct page *)start);
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
+	int ret, nid = folio_nid(folio);
 	LIST_HEAD(vmemmap_pages);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_restore_pte,
@@ -388,6 +388,7 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 		.flags		= flags,
 	};
 
+	start += VMEMMAP_OPTIMIZATION_SIZE;
 	ret = alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE,
 				      nid, GFP_KERNEL);
 	if (ret)
@@ -407,7 +408,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
 	int ret;
-	unsigned long vmemmap_start, vmemmap_end;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
@@ -415,18 +415,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
-
-	/*
-	 * The pages which the vmemmap virtual address range [@vmemmap_start,
-	 * @vmemmap_end) are mapped to are freed to the buddy allocator.
-	 * When a HugeTLB page is freed to the buddy allocator, previously
-	 * discarded vmemmap pages must be allocated and remapping.
-	 */
-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
+	ret = vmemmap_restore_folio(folio, flags);
 	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
-- 
2.54.0

