Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880420;
	b=gaTyhtKfZud+45vmmTHhoVgoV8agAf6sWJO3CycHDsDtIcSQr8jyDiHjt+f56wyVUsQm
	 v68Wb34mGc4l0CzwXBZAB53Cv8SpIxy65kVusgSbBCK2a0zH6O0Il7prWHGeKh5ejGWaU
	 Ur/C7hZOptyBGLjVPsVv43HIo2//bu2EFGTxAeH/LChusSeOa0iWK+pd6cb9Y+UegfdpB
	 SU9Aag5dt+zt6bENxG0E/087VX7L8W9EwUJhfrBIQB3Cf/Xj8BjE9Hf3htmb24IVhLpyQ
	 zHP7eZF+U6IhQ4XSdR+AeU/N8AzyTiieSF0vxE558wyfmkrpGWN7i45IXo5TonPi9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880420;
	h=DMARC-Filter:DKIM-Signature:From:Date:References:X-Mailer:Cc:Subject:
	 Mime-Version:X-Lms-Return-Path:In-Reply-To:To:Message-Id:
	 Content-Transfer-Encoding:X-Original-From:Content-Type;
	bh=k7v8g50swJ0fV1u98xcgR1RwEaj2esaG3qBT6bQvvME=;
	b=B62PcXQ/b0295k8VCDp2EUVu9PVhJYfOLoCUkFVIf7nSJGAbxBEAzzQS++QvdZLZZ+sL
	 2RNsTKBJwy8Qt6sG+4qZ1pVMAP4G3W6fwe4YWwyPeFAIPpsgpK6RTadp1qA4iGMOCi+IU
	 C1/I5MSDf1rKVFKXRN6U0tFY9HYNAysYzmUv+M4VWnMYGKGmejg6LXSWWYcH3VGqTDBty
	 NWj0UlE8NRRk7ejFdcu91OYpET5c9fw1tMqvB2Ba0SgqSZyhrPwJF4a99nJlOynSBXM4Y
	 3EF3t0wqYHXjU+JiNXzTk6lQjyJJ0JBQtHxmEvYW1yfiV/s7P3C5+CIUqZe3ese/skw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=V9eUbce+;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ABB606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71ABB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=V9eUbce+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793880413; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=k7v8g50swJ0fV1u98xcgR1RwEaj2esaG3qBT6bQvvME=;
 b=V9eUbce+GWGPfi9KzFFqtw7/Rb4BLPXSRNxdHLC8SCpF42DTmLIyW3Zydiys8C7oQ+/XOw
 fUO0kDC4jB4vOSRCMphDamIvC2Eujq1rYZDVrzgCWv6hJ+Ar9zCJpzCZkmwCPVrq0t8RUw
 cHLIinZQSdEKUJW1RSZtRCkpKRbvTyBBCHEdLDqfM50gXPv5ebOaRrdwwKdVvp+NyL8QDI
 Ms4+PUDenNlE2h3LERu3WA5DQSU5GiSxO4ylGVvRtL7PpFgNLargTUuwXHXrjtFSy2VnQW
 rzmLzO6bX3H3P3fgwutyS9hN5XgPT+r0zxWwTsDNGpK3PHRqeIDVMJ7bEl4BmQ==
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Thu,  5 Nov 2026 20:06:14 +0800
References: <20261105120615.16817-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH 1/2] mm/mm_init: factor out memmap_init_page_from_template()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aec715b+8a276a+vger.kernel.org+lizhe.67@bytedance.com>
In-Reply-To: <20261105120615.16817-1-lizhe.67@bytedance.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <apopple@nvidia.com>, 
	<balbirs@nvidia.com>
Message-Id: <20261105120615.16817-2-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

ZONE_DEVICE memmap initialization already uses a reusable struct page
template when initializing compound tail pages.  The template mostly
contains invariant state, but a few fields still depend on the target
PFN and must be refreshed before copying the template into each
destination struct page.

Factor that operation into memmap_init_page_from_template() so other
boot-time memmap initialization paths can reuse the same helper.

No functional change intended.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/mm_init.c | 29 +++++++++++++++--------------
 mm/mm_init.h |  2 ++
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2a0e782a151d..495e20fbdec0 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -625,6 +625,17 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	vmemmap_optimization_verify_zone(page);
 }
 
+void __meminit memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, unsigned long zone, struct page *template)
+{
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
@@ -1073,17 +1084,6 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
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
@@ -1136,8 +1136,8 @@ static void __ref memmap_init_compound(struct page *head,
 
 	/* Initialize the remaining tail pages from template. */
 	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
-		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
-						    &template);
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
+					       ZONE_DEVICE, &template);
 	prep_compound_head(head, order);
 }
 
@@ -1192,7 +1192,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
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
