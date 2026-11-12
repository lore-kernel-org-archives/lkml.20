Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482939;
	b=Ck8Cc3VVZmvTMpBp8UnXABRT+b5ORe2ZoyfQo32PR3eTvVA3BGWCkCTdkXyM0MLuhLXZ
	 04UW3GHvY6WKbGbe10i2SJPlt0OWhLNLeFfzeSOZ3zjONkoHVqGVN7LcV/gTJp9mqs1fM
	 dEwo1dGswmKQaFx4rVGCi3Us8E9B99h5msbTbrxHxpbtBe+0zLHrWl7c1d9+aOC0/jvDb
	 LCHnob3jE9xWWZVkS6LrR7PS6rGAREMsYDSrDP0/wvYUfcXCq/JXp0oGd2zznGezOCtj1
	 c+w7VW/cbnf75XCCEreVICzX6nM6eXlAbEFDPRTVJLP2KZeU7bjkKoblP5RvSygdEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482939;
	h=DMARC-Filter:DKIM-Signature:To:From:X-Original-From:Date:X-Mailer:
	 X-Lms-Return-Path:In-Reply-To:Content-Type:Cc:Subject:Message-Id:
	 Mime-Version:References:Content-Transfer-Encoding;
	bh=JJExnKGIN+jT3YthQU/HCX+4pNOJnuCWmFy25CjHkh8=;
	b=oS6Y1wZEdw18LZUrmSV0eZBC6KcXjcQWTABQq8KceXq0qY9o2r8YYU8XYb8h4xaG5PNI
	 lHUwHCmUlnXHDGTkdInbBH2kcKlN8vmP1ME46h+uAi5aR5BppH5tp/fckjVSUVYhoOUrj
	 S2d2rsXhK/+x8KuDmcdxQBB0pMWwzoH1k/Vbt0woBUmXWbpwYdW34NtxWG8mECKPpGOyC
	 o87TQ8RakupVT4ybaOYHXEVrJiKu+MLi8rRJRG4hjTXMGkX0Q+KWvMDBypfO/6jUifOda
	 /IfWNBNxG6qvch9QBNSgHydgBPDI3/I7EVDcYdbya1pQdZj0aw9glf9VtHOijKNGdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=P0xR3JBF;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A772606A8B6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A772606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=P0xR3JBF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794482933; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JJExnKGIN+jT3YthQU/HCX+4pNOJnuCWmFy25CjHkh8=;
 b=P0xR3JBFV28agsTSVjIRuAfZhUjKcjzYym31KNjp+YCfY0w5W27/X8qQpci2WRGxOhumLu
 hMwa27TinlSPEazbBnAV8xHgD8chuHwZJfj5guQnN20BROXWdwXweypzrawHAp5YGRCz5b
 Q0rblvU9QVLqj4U47KTmZGeRV/nSs7xN/axyB1I6cajRr8R+RizIfcBUAC1YtqBVPEMRjU
 5v+hVa3ul1u6yUoDyRVpLg2HcLL2+BPS/xqZGx3P1GKCJ/Vss+6G6SUB1nZFPISOt4nMdb
 og9KogJmNcbUtaiFXDQguqs1krxyHhZtuyAm5kFYsAn62GWTjQKsWze/v7DSsA==
To: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<rppt@kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Date: Thu, 12 Nov 2026 19:28:15 +0800
X-Mailer: git-send-email 2.45.2
X-Lms-Return-Path: <lba+26af5a2f4+394b10+vger.kernel.org+lizhe.67@bytedance.com>
In-Reply-To: <20261112112816.55095-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH v3 1/2] mm/mm_init: factor out memmap_init_refresh_pfn_fields()
Message-Id: <20261112112816.55095-2-lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112112816.55095-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit

ZONE_DEVICE memmap initialization already uses a reusable struct page
template when initializing compound tail pages.  The template mostly
contains invariant state, but a few fields still depend on the target PFN
and must be refreshed before copying the template into each destination
struct page.

Factor that refresh into memmap_init_refresh_pfn_fields() so other
boot-time memmap initialization paths can reuse the PFN-dependent part
while keeping their own copy primitive.

Define the helper as static inline in mm/mm_init.h, since it is small
and only shared by mm/ initialization code.

No functional change intended.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/mm_init.c | 11 ++++++-----
 mm/mm_init.h | 11 +++++++++++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index d99af80ec752..33a9d8dd044c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1076,11 +1076,12 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 static void zone_device_page_init_from_template(struct page *page,
 		unsigned long pfn, struct page *template)
 {
-	set_page_section_from_pfn(template, pfn);
-#ifdef WANT_PAGE_VIRTUAL
-	if (!is_highmem_idx(ZONE_DEVICE))
-		set_page_address(template, __va(pfn << PAGE_SHIFT));
-#endif
+	/*
+	 * Refresh PFN-dependent fields in the template before the
+	 * non-temporal copy, so the destination page does not need cached
+	 * stores after memcpy_nontemporal().
+	 */
+	memmap_init_refresh_pfn_fields(template, pfn, ZONE_DEVICE);
 	memcpy_nontemporal(page, template, sizeof(*page));
 }
 
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 0034e37dbabd..7e1d6897b844 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -112,4 +112,15 @@ void memblock_free_all(void);
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
 
+static inline void memmap_init_refresh_pfn_fields(struct page *page,
+						  unsigned long pfn,
+						  unsigned long zone)
+{
+	set_page_section_from_pfn(page, pfn);
+#ifdef WANT_PAGE_VIRTUAL
+	if (!is_highmem_idx(zone))
+		set_page_address(page, __va(pfn << PAGE_SHIFT));
+#endif
+}
+
 #endif /* __MM_MM_INIT_H */
-- 
2.20.1
