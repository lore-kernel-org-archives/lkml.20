Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880435;
	b=2Gk3PXXmiIu9soIBg9bJbrIxrqrldKbbhSmqaXkO+8fR9kHE0zwAysN/tmccSkIp4kPA
	 6wQy13wkf0iNibmOTRjW+PZltzUDA2kZEaedKT2aX10k9elpjsqSwdeX/QGcB9vWAMlhF
	 pAC96wEyazrx8347Aiq8pdYlbJrIddaNktncmfnGGVbrVObgWRpyLmD9+durr4kSKMhpn
	 UzFViUsdjaD7UhzszFue9leuqmYJvg+5plpsxadVIF401UobVVgi96u6WNwC6BjiOinT3
	 dmPphYFB+vJb79aFWuj5YzYUpBovpoAiKQGGYUmeatvcxxpXVvo01YcC5KcrukDClgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880435;
	h=DMARC-Filter:DKIM-Signature:Subject:Message-Id:Mime-Version:
	 In-Reply-To:Content-Transfer-Encoding:To:X-Mailer:Content-Type:
	 X-Original-From:X-Lms-Return-Path:References:Cc:From:Date;
	bh=8OcxAA2gqpojmN7yaA8Tg1JRGUaJg5iMD5QS2qC5vIs=;
	b=BiFbjTncSCiTlPgGFI3xPk//XTcfyJUBqZg08Hrw5RQ9LpkvuOxgaMmS/4GdxRo0x59t
	 kdV+bsKshnBeHyQDWQsgIBiUyUz9r+AcQXwt06ysb9EzPzRiKlWyfQ0flzPtYBj+p95Db
	 N5GXrlk4TJo/ShHmfmWef3Ll4N/JmYzogtwNSYllMe7pXKqKluG2uIbR/4bSfvQf451v8
	 dSVuYV2CGCLBNjHDjF6ENfOpGE5F/Pgzqnb8H85JBobZoBf05iHrrn7gKq9kFDcb5nZA1
	 YAv/sKz905inizGCfhtGs++BEH3kc5Ib+QlcXbP4rbbJmXMaO4hhFvxNrmSUCKBVFDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dQVhstQr;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC4606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dQVhstQr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793880429; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=8OcxAA2gqpojmN7yaA8Tg1JRGUaJg5iMD5QS2qC5vIs=;
 b=dQVhstQrH6+R7Hmp0eL3aP3DaXtQuISR9AODPOh0t7ay6bG+q5ypos2RnWkZ++a2ufyx7T
 L/+MLidCEGE2nwGPlxy9SR1F9DkeDLpxRKugDKJ9Q/1WSO3f/8bT5xdqWAty3lGogao+jU
 rhcXhWJsnAeSHBG408noSVXdrhm1Hfmti/Sb9I3djGShNUWkIAJTskg7LijmzZfR+J5xLa
 0IPYY72NOCstBWbooJUZEm/JbMHa1cBGztmG7gZoxYCb3FKU7QFFgErnEjunQ0u/o4C7gt
 wfFxYifZEnWE/Rvr9EsXBoQuKVaLDmNIZ7JC6Vwrwy2SPk7965QwDKiAjcGNtw==
Subject: [PATCH 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
Message-Id: <20261105120615.16817-3-lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261105120615.16817-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <apopple@nvidia.com>, 
	<balbirs@nvidia.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26aec716b+5a7cd9+vger.kernel.org+lizhe.67@bytedance.com>
References: <20261105120615.16817-1-lizhe.67@bytedance.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Thu,  5 Nov 2026 20:06:15 +0800

Boot-time HugeTLB allocation has to initialize tail struct pages itself
when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
gigantic pages, this can cover a large number of tail pages.  Most state
installed by __init_single_page() and prep_compound_tail() is identical
for every tail page in the same huge page; only PFN-dependent fields
need refreshing.

Initialize the first tail page normally, copy it into a local template,
then initialize the remaining tails from that template with
memmap_init_page_from_template().  This avoids repeatedly doing the full
__init_single_page() and prep_compound_tail() sequence for state that is
identical across tail pages in the same huge page.

On an arm64 QEMU/KVM guest using 4K pages and 64 boot-time 1G hugepages
(HVO unavailable on arm64 in v7.4-rc1), the measured fallback tail
initialization time improved by 36.43%, measured with a temporary
jiffies-based printk modeled after the existing timing in
memmap_init_zone_device():

  base:             318.4 ms
  with this patch:  202.4 ms

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/hugetlb.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index da5d04edf7c1..987f16a5ea27 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3219,19 +3219,32 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	enum zone_type zone = folio_zonenum(folio);
 	int nid = folio_nid(folio);
 	struct page *page = folio_page(folio, start_page_number);
+	struct page template;
 	unsigned long head_pfn = folio_pfn(folio);
 	unsigned long pfn, end_pfn = head_pfn + end_page_number;
 	unsigned int order = huge_page_order(h);
 
+	if (start_page_number >= end_page_number)
+		return;
+
 	/*
 	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
 	 * we must initialize them ourselves here.
 	 */
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
-	}
+	pfn = head_pfn + start_page_number;
+
+	/*
+	 * Seed a template from the first real tail page and refresh only
+	 * PFN-dependent fields before copying it.
+	 */
+	__init_single_page(page, pfn, zone, nid);
+	prep_compound_tail(page, &folio->page, order);
+	set_page_count(page, 0);
+	memcpy(&template, page, sizeof(template));
+
+	for (pfn++; pfn < end_pfn; pfn++)
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
+					       &template);
 }
 
 static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
-- 
2.20.1
