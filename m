Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590021;
	b=PFX1l5BUGFmvu9J/krOijcDOT6poTI9af3AHkCoek83P7r+0O2SV9TUptTwAn1TgxU2c
	 n8XhowH4N+CUa8lRmYPWIGWX0Ul377BRy8zNTrgcTNgjT95SvUEY7Z3523mWBEiSsekce
	 ZsOi+0nFuiuYpabTbDM3/q0chO/eK66sKW9Z+IZuk+WbO28KPkImr2Z1FM0OsqO+d7R4q
	 jCBi4gzreEUbu9yS++g5o8sH5enV8FfKFqbzloSKGvysY+wIxSsuoHQm/RJxBVI+EtvEm
	 KD9y11TTgboMiNY9jlh214zm3YjkeezBCAAdjxnM4elK2RyTt2CsyutsUKaGN53GUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rw0T/ADsdVtpjl5tZ0BGEEeHVd+MgRGP6vlaxN1BW00=;
	b=kamuCC0s2qV5JF//1SvZF/TuDzsCLLj6ht+vTFDpRkkKV2edFCTJ7mbHtvUnwbu2ppvK
	 2cMw2oaxbtUfM+3Qqp/4TFLUSpsN+uXtLjWIBCtxb5J2WJTxE7MvRMxuDvvAW92tPFwRb
	 GcFQtfDa/hASIQ7TiPhCmzvR4mwZQIpApk2+lVBWsEF8uMvIpJZsoge1rZ8/z7KWlG+eW
	 lbQYRemyl1jszTcNA2PwQHVoiX7D4lMO4Ua+vcxAhoB7Zj3birvKCYQJ6758Fwz26NumY
	 XMo+XBF/1F6QBKC4vdbr0+Z6blvTKHu3Gm+MOSE+r1kMbdmlE2sOzwLfc4307sVNJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WyPlWwE7;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1ED606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WyPlWwE7
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1498835a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590020; x=1794194820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rw0T/ADsdVtpjl5tZ0BGEEeHVd+MgRGP6vlaxN1BW00=;
        b=WyPlWwE7yNvH9Bcv+lSmdwZtcQe6kskRzf3dMswHrx91Qy+IUNSyXqUzNsdI7I37V3
         UVFaq2YeNdZ4msbpIMlh+/GBJgyfR+A9tJQfL8uy89roYsQLBBOLt1soyHxs+QtfO+zK
         hsJqZapHr+UrWJGFYp+kDygv7bdI8IQoSyN2VmA+bKjGweN2KDvWcOD5ex8UBnjk/bwr
         lEeFqs16CtaaRCq1xXN01kGQ55KV66cbw/sXbTdmHY4MqPecoaPF5GJZP8yquGc6DRQK
         kq4qctqHjStqt32PnNUZa4FLCCLenqi35TxMUQ9naagi2AU+uBKdP7BnVbiJpjgXPoju
         I4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590020; x=1794194820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rw0T/ADsdVtpjl5tZ0BGEEeHVd+MgRGP6vlaxN1BW00=;
        b=q7Weh3pu8e83df4waBRzD5lRrP7uXrwKNWpPnPlQzb1eFO9oy5dggQ8vQAmQDDqcYK
         XMxgQKW/xLm1fvVjGJpQwmTOqmXYloPSU0W3mr51Ny/559+IDC6qtPKFpo8k2uGukNze
         rXtGwiv/D930Cgow0QofwBjcIHBD11xDttQeWl8WPxSfvR1rMwh248By1J4LZB1V457c
         3FGueaz1raF3T013HqVXce8ZT4Wl+rcO5aXIiB+ZYm3+MChVCcILDND+d3iOtPSI2qtL
         X4S4q/Ru2B9JPms/0uFymvrKJjBz6xjl3BLP+YKMLWMpciD0jOhGnsEeB8R0TY4/7+wC
         l9zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTr6PU9SumejIi+H75+ZMhcyS1kd1FAx1BPk4609TzZc+8oD0YJ4QlsMCXwb+zbQoZCYszoxH7KMGGhyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7qth0yeTnrJCpvSgUOPs5GEBkvv1Wc7x13zGb8x9PmQfJOr0B
	sUOHTL0161lwYV0mnq7htyTyfZC2v5bl2oNPsSxdP98ukHEvHwqWSn6XdEinfhpqnb0=
X-Gm-Gg: AYBFou3Swsw7+qhFMSj+oWG3xuRXdgIfyqmE64ZU2b5cdNcwTcz9q77QBU4ukQ9HswL
	gUVRDHbeNovDpJbTsk7awtfFqNzZqRhiCa+6duhy0hGfLfnHj8+S1QjppGoP8joDJQURnEygoyc
	1sTvX1roG1l30/DKIUcBNWd/lBXFYsI2Ty4cdZ6UgULgubEKDNvNSad3ybs/blaw615q7bPxNf/
	Z0/+JVrsoHmt/PAPs9uaRX5Y7w5xTzjQMD8IyYU2HCFg+/+8Nr4sTCfKv3viuMZzeeMnJ1sopHm
	aQ9Ft8Vx0zlK7XCwthvTUJQOcdlgw0JgAvG+ONAD/Ku1gqUOOQaXp4sPjtRWHQrNdMKq49RUNqk
	MgpLNmK7VwG+abT69j0l/DEYEMVQqHC/xTfucPwBF9gkpU3ToT6ahn4d+zKdWKxakvS9ok6ZScU
	MmFGKNNxiQuVM5gmufMYRfrgS9LgCMLhmlxPrExXacjuAJQWHFQMHZ8gDcekQgpidjVWeEgWNlA
	+1U9jTORYJ7QZ4T05o2uDBPBpBRy4si1zqjZ0t4VvhM8/lrSstT0qleMdFU4SvmJDa4KNYgCezZ
	C1mV0wN1Bpr+qFWxp0WpQ/B2lMLamvxhevJmgIenqa6omT7ZlX0=
X-Received: by 2002:a17:90b:33ce:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3ae897e230bmr6793857a91.39.1793590020343;
        Sun, 01 Nov 2026 19:27:00 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:59 -0800 (PST)
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
Subject: [PATCH v2 10/12] mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
Date: Mon,  2 Nov 2026 11:25:23 +0800
Message-ID: <20261102032525.3597743-11-songmuchun@bytedance.com>
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
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 14390ee59ba2..465a907620ab 100644
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

