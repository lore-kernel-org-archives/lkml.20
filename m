Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311398;
	b=tM+QAG+WDbUK8Dq6m4tqEFwp5dyBUSjJFAJW1TKXNhOQvmQNLc9ghFTjklDpjddKemHq
	 Tu4ArkGDM1EIrbrHSqjpVJo3mNChbDRCv/NTbW889g9eJV0lll+XBK+OXPH2v6LHz2uTf
	 Oohr1vGFimqtzjeZ8jjXyIMJsKiwv2Dfp9E7tUV35Qnm3tnBmMiORSJr4p3y1L8IcqCpo
	 I2eOYtS55tam/0HOkEqx1WdY4yd9oBgW0N2d78fJNegiZimAJiPYRg5Fj4Iv5Tnej0Bzp
	 dO70wijE9ctEen5J7gRRSUncrWloh0ibkzHqb8jlh8lnVYPuG4dlgos8cX9Oa0KvW6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311398;
	h=DMARC-Filter:DKIM-Signature:To:X-Mailer:Content-Type:From:Subject:
	 Date:In-Reply-To:X-Original-From:Content-Transfer-Encoding:Cc:
	 Message-Id:Mime-Version:References:X-Lms-Return-Path;
	bh=6YFBzfgvcaAI9nXT1PpZ0S3WFs1S5hCkHR2kcZ8iUck=;
	b=ZcM1ycp9PAzz7tiIDCOsAXe+K+BPFE36Jw7YM8HmDcXZzHEC+77X3tg5Wxmm0c0mEw1W
	 TrXuLnwJXLg3bOU0y1uag0cpuxiKqrigT35U2xCjE1tFj5goMfWeBrtsZWlKH3MKuOiKy
	 dx4ZnEWmm+ystKTTAmtCMKHy/OGZMp4d9bvfm8ICkcfXBGFogXSnLA2dcpN6u5nhN6jk2
	 CX5ijtMjS48XSH+ubpapbQFOkPS1hA+KCprJLniVgyX12XvwRptrNLvBM2fTvhD3xc8Km
	 FgBxqttlDcID8nr3Ycn6KDKBZkvWG5QCA/ZSYZuy+AZLZGnoMe8ldkVYruMzsxD3aRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=bsqIqyVz;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EC760A263A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EC760A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=bsqIqyVz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794311392; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=6YFBzfgvcaAI9nXT1PpZ0S3WFs1S5hCkHR2kcZ8iUck=;
 b=bsqIqyVz1AUrOF8aU5CbYX+0FyX7WRjc392zC8KiC9oPXHBYnFazvHxf31bYQALgw3y21P
 rN3ooYdumcekSv93NJZumytc/u6+xQeYHEA4Vghv5nPVGLH0Dk1tYGIWz4iz5sw0RcckEk
 l1YPzSPiSIpElte33m3A0wltHa9ZfrfaFFqXAIOxvzel3QPcsFWpOlGtPoSQd2Eszd4kKL
 dlhj0NDg2YtMoZ1B1npBFfq3GrdFWug3qNXg7Gzjyf7A2OhUFXN8rkVXnsMayQiOu+aovf
 Whi4s5Oi70dusFI54nrIB+9ptprt+dWxeX2IEq9w46764B4kYpGHHRQw+EiV5Q==
To: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH v2 1/2] mm/mm_init: factor out memmap_init_page_from_template()
Date: Tue, 10 Nov 2026 19:48:58 +0800
In-Reply-To: <20261110114859.76343-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261110114859.76343-2-lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26af304de+39313f+vger.kernel.org+lizhe.67@bytedance.com>

ZONE_DEVICE memmap initialization already uses a reusable struct page
template when initializing compound tail pages.  The template mostly
contains invariant state, but a few fields still depend on the target PFN
and must be refreshed before copying the template into each destination
struct page.

Factor that operation into memmap_init_page_from_template() so other
boot-time memmap initialization paths can reuse the same helper.

No functional change intended.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/mm_init.c | 34 ++++++++++++++++++++--------------
 mm/mm_init.h |  2 ++
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index d99af80ec752..905222772548 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -625,6 +625,22 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	vmemmap_optimization_verify_zone(page);
 }
 
+void __meminit memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, unsigned long zone, struct page *template)
+{
+	/*
+	 * Refresh PFN-dependent fields in the template before the
+	 * non-temporal copy, so the destination page does not need cached
+	 * stores after memcpy_nontemporal().
+	 */
+	set_page_section_from_pfn(template, pfn);
+#ifdef WANT_PAGE_VIRTUAL
+	if (!is_highmem_idx(zone))
+		set_page_address(template, __va(pfn << PAGE_SHIFT));
+#endif
+	memcpy_nontemporal(page, template, sizeof(*page));
+}
+
 #ifdef CONFIG_NUMA
 /*
  * During memory init memblocks map pfns to nids. The search is expensive and
@@ -1073,17 +1089,6 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	}
 }
 
-static void zone_device_page_init_from_template(struct page *page,
-		unsigned long pfn, struct page *template)
-{
-	set_page_section_from_pfn(template, pfn);
-#ifdef WANT_PAGE_VIRTUAL
-	if (!is_highmem_idx(ZONE_DEVICE))
-		set_page_address(template, __va(pfn << PAGE_SHIFT));
-#endif
-	memcpy_nontemporal(page, template, sizeof(*page));
-}
-
 /*
  * With compound page geometry and when struct pages are stored in ram most
  * tail pages are reused. Consequently, the amount of unique struct pages to
@@ -1136,8 +1141,8 @@ static void __ref memmap_init_compound(struct page *head,
 
 	/* Initialize the remaining tail pages from template. */
 	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
-		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
-						    &template);
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
+					       ZONE_DEVICE, &template);
 	prep_compound_head(head, order);
 }
 
@@ -1192,7 +1197,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
 	for (; pfn < end_pfn; pfn += pfns_per_compound) {
 		page = pfn_to_page(pfn);
 
-		zone_device_page_init_from_template(page, pfn, &template);
+		memmap_init_page_from_template(page, pfn, ZONE_DEVICE,
+					       &template);
 
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 0034e37dbabd..22c465122b47 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -111,5 +111,7 @@ void memblock_free_all(void);
 
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
+void __meminit memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, unsigned long zone, struct page *template);
 
 #endif /* __MM_MM_INIT_H */
-- 
2.20.1
