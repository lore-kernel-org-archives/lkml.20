Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759782;
	b=QHjC42sdOI2ZguRVBE56MWGqLiYnVvi89Q0BuWaNDU5Ztauy7XdqEwibfC1E6PzUONfN
	 IcwM3FSchMhfmpY0F2tNvB7VDYV7TJkyuYZRWf082hI8LmE16bVo+hQbtXHo/ErSk6F0F
	 Ox7Uax0N98Pipjf4PRGsxSFlV99AxPdfuTzgx29mtJp4XO2279/EsSJwQBw9fPhgNgF/E
	 zHdCdaokz3plm65PxkGRrZo+Iar8K301FuWHDga1ohfpidKs+0ZSvz5ipYCRemITMueXS
	 QouGDhevaZNYLhSB2yBuev/zVt8KNM2vvIcPZv1jPSWp3Gh+K9AOl086b7hVfINB1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2cwCbkV6UpQ9L+91R5Pg3Muqi1NLiS2xKQYMtVtHCvc=;
	b=ajPK2S4NSgloLxlHoFzOLs6KdFS99FpyijW/apfct6wXVn/BwWg8IE2fvPC5Ajepl4w7
	 bxJqUodaAZ4k6VhBazQnCZVDoijLhYrnRs69Be6kD7n/9n97RB/qxZkuHnFjmADThsItT
	 Cjlw1S6X9rMECN6OhwRv9Jf6eHSgPrb8pgENZa1g/he7O5GOqAvnK4kroXqYl1mQl+0Qb
	 MJI42KNNEA+EJz+z312ZAFBkee9tvMkULpy8/xTQxqDuRUS5f2FPSC8bagM3JmYAohVqf
	 VKR8nTQFIvj7086jZy7f11YG4+dLnP9Z/lu0ntdaSgU417CbESXeOlgHqR6BhyfWxDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T6ly38OE;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE24606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE24606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T6ly38OE
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so54073b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759782; x=1794364582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cwCbkV6UpQ9L+91R5Pg3Muqi1NLiS2xKQYMtVtHCvc=;
        b=T6ly38OEOf963Sm01BMPZ77IMo5losseuKdlycBqxmVkVOpo5TTsu2l+HrePjBdEkh
         UA8l7YzFuIbhhelonSiYQxsag6RuG8TWY9rls5IqwEtiNYrskCXJYrxYHRa65K+BpdFF
         R2D7zqSGp2i/dgPn4p6aDUO4ZMaDM3/hMx7hGLUQ1QRfm3fzx/InhDyN/ZNZKkNBeYaz
         SUSPEC79XHvomk38a6YiPUlVoqa18R9nlG13j+08pSnZ1L/XKNnHHR5qMGY1EQvE2lCc
         MarilIVhrTdTs/aijBjT5qglC+cGlok++wCTZG0W7RissgdzE4taGeOHvoLEAM0n3ddg
         RdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759782; x=1794364582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2cwCbkV6UpQ9L+91R5Pg3Muqi1NLiS2xKQYMtVtHCvc=;
        b=pV2IG/3+pfreTE2xvOgTdONsuTPFfVHPJK8MGF7g2UT9kOuqSraOT3d3tf8xNwvkuO
         JMhYZnTi+bmG4CTTvvDI948ya7BHEDOmi99hjThjyxhxZ+kJGjAiuAes9upiL7UdIEds
         6WV3bswmNHIbVkyvZnIiWp/Qhj7YJaniz+xsOYhm5q2mTXYPy1XEoODEg8TOl1T1vp4O
         qnXifDWlwJFJVxzGxr752PwfzsoXJTcowIRl89E+ffO/vrAaMjzpzNmGSrRebpcdZ6gX
         iceYa+Wvbp3Yv8NYtKs7GENW3vNoUOIXEUyniSBpIdaskNoB8S2rQEJ6gUegyyMUo8L0
         EqXA==
X-Forwarded-Encrypted: i=1; AKwUvBxFm3Vzyp+r8meGDQos8a1f4e9TH4tedbUxmEZATmpwEUmjOzpVJyl4LEIbLBtvC9uiz/1L6eHzNTuXuzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F7LqmjcLjdGC7v86dYQQxyjMOAqKGNeNmA9bkfsNVpojZfOcS
	lxKgf6ehZrxR9MsRh2VK5F26gLyHNkGNDoETBVJ3HfKbDNP2Cqg+LlhBIGDPFR4MOJtTy4497Q4
	bnvd9HO4=
X-Gm-Gg: AYBFou09VPi7apjkID6f9I1j+Sc8xENvp4Hsnu8mjipInobkeih6LvOxNwrxDWg0Ip/
	GRLNbKQL40KQ6nmixwvh4oVk+zEGNWUDLLkw6kGTZlO8gFVwfr7MIa9tX9oU9D65oRDjVPgpHfa
	eL81rTPAmCg2+ENVEd1hnTG/iruhbk4NnPm44Kh9YrZ/cT4GWwvzTAtcWBMiYmHLkBzUj5nOUxd
	Qku5vUlv1BohVq++eayQKCz1QOC1xuSArK7qt6wHHCBDMujiIbu0iqTThBjgWiF54wPJPA86D5v
	ceYBNNUQscWb4eFrfTtcm5ZHb76CkzidopXnCI2XXO00+bu52EcFM/2V7iT+TbNKcoKJKDqIlHJ
	Ge4dTOdvde7BJSoqBCQdmbnmvv15+o/PrdAOkzTXXIZsjhgZOplQ4f/UQW61orkoNqIGJAWwLAx
	OgnKE3cYLXCjqT3FL0HLrkIFByqmS6B8yAhE4o5oDvLb5U6bV1Gd7faKoS7hmYT2MTMxTFZgzoL
	PjaM6xm94GvnQY+xhsDk02581xMx+W79lozD/Ul9FPR5aK/pry6dQYqYnWcrz4j1SqXFoDgOdv8
	ZSaP6jlx8A2EvLJdPe98mw08eaNtG2aWDGEsTMHYbwhQscQKMQ==
X-Received: by 2002:a05:6a00:10d1:b0:89f:2b65:2ad with SMTP id d2e1a72fcca58-8a8323afb88mr11419858b3a.27.1793759781592;
        Tue, 03 Nov 2026 18:36:21 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:21 -0800 (PST)
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
Subject: [PATCH v3 10/12] mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
Date: Wed,  4 Nov 2026 10:35:08 +0800
Message-ID: <20261104023510.260766-11-songmuchun@bytedance.com>
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
---
v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 64967f18e3c3..e424cb0b1a78 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -363,28 +363,29 @@ static int vmemmap_optimize_folio(const struct folio *folio,
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
 	LIST_HEAD(vmemmap_pages);
-	int nid = page_to_nid((struct page *)start);
+	int nid = folio_nid(folio);
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_restore_pte,
 		.vmemmap_pages	= &vmemmap_pages,
 		.flags		= flags,
 	};
 
+	start += VMEMMAP_OPTIMIZATION_SIZE;
 	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
 		return -ENOMEM;
 
@@ -402,7 +403,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
 	int ret;
-	unsigned long vmemmap_start, vmemmap_end;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
@@ -410,18 +410,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
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

