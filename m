Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482961;
	b=Kc7UMxHk2bqs0qAQhuyfo/LLaCaV+rsnK/l56eBnI6T8OK8R74ZKvybheYEInrYEux6R
	 L5IJyrX6w8qD7X8yqJQIxo1lY96jisuwn6iRMkd6QO7gwzmKy77+jOYkMhqCfgTdur3mP
	 pMNANUVcLIiwSJjgOAd6SuqYD5etvIdwwzfNef5RR/GWLg7Z8xTuZXxKXnwyuWieYBEqL
	 PonCHQOg0Fp8yLe7oKGm1B2hdpom9c3fkvioEIlQ6MTGXKfEcWIsYLmYM31QaD/KT+M9s
	 lHwwJvoaXNAJ3+HIz+AmjspD7qfULfft7rNNJDZge0cazOlNc98MbutifP5eYukiSaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482961;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Subject:X-Mailer:Date:
	 In-Reply-To:X-Original-From:Content-Transfer-Encoding:Content-Type:To:
	 Cc:From:Message-Id:X-Lms-Return-Path:References;
	bh=0XQgaEoJJnLvggR7H1uNK8kGybQpdj70HEDcJyuKRAE=;
	b=XWt88YKCdu3UAUl8hK8oSTxEJ4DvB7ufwGVXCPyb/i/cQkNYo1OA5L7V+eVDQ5eb4xh/
	 aijnNQm8I/PsxV6eyNp9G9pmnQCY83vUFGkoDX1ad9vzanGgAzL6c/4u98NiuGQZky9hN
	 lnLoCj2MNDGhTjDzBF9kUIfdQUFi9yuTxRTP46/IZqmyMo/fPT0gyJXjMX4e7j+cvRUEV
	 ZEntpWnU0tOIPri3wc0nxOEotcCzMSPo2/nGP4iByo8GmzjbqNCgnTjtxgghpKzA/6PEJ
	 rZkGxcMDDE+iJ0yNHn7J4yMdPQEIXTYtplKoOuIP4i+QcQDPfIB+R3tyiHAIfjnDLYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=PzZPyzyw;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C41606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=PzZPyzyw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794482956; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=0XQgaEoJJnLvggR7H1uNK8kGybQpdj70HEDcJyuKRAE=;
 b=PzZPyzywL6TOPdgFpkUmqHDy6BqKCQHy7MnJ31ySiB3b9bSvXAeFh2RcgFxT+8XygT6tkU
 skqsxQAh+W7mXPdTGoBIChubX6DnaOIUQFVB4npV0j6UWPzVeKCuYAXChngalmTsRSqnga
 yP2aXS9DHuwc6Sn8q31NPiB5SSwHjweu1qxNTptWSJX3COb6SqC8EQCSl6t7X0SsWqTRHw
 KcRX+c8Nlnj8GCUYjhYDQ7tWpqqnoX2q1zOWzwB7pOJjrzZspp7bAcfdKv4bXsTywJ6qS/
 CcDbEGYF77NJ+sdeCgXq4KrJRSAGmxCjBQAeEpeoa8sRQM2XAYcbFFw3zfmgyg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: [PATCH v3 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
X-Mailer: git-send-email 2.45.2
Date: Thu, 12 Nov 2026 19:28:16 +0800
In-Reply-To: <20261112112816.55095-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<rppt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261112112816.55095-3-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26af5a30a+a47499+vger.kernel.org+lizhe.67@bytedance.com>
References: <20261112112816.55095-1-lizhe.67@bytedance.com>

Boot-time HugeTLB allocation has to initialize tail struct pages itself
when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
gigantic pages, this can cover a large number of tail pages.  Most state
installed by __init_single_page() and prep_compound_tail() is identical
for every tail page in the same huge page; only PFN-dependent fields need
refreshing.

Initialize the first tail page normally, then initialize the remaining
tails with hugetlb_init_tail_page().  This copies the already
initialized first tail page with memcpy() and refreshes only the
PFN-dependent fields in the destination page, while avoiding the full
__init_single_page() and prep_compound_tail() sequence for state that is
identical across tail pages in the same huge page.

The fallback path was measured on a v7.4-rc2 base with a temporary
jiffies-based printk modeled after the existing timing in
memmap_init_zone_device(), using 4K base pages and 64 boot-time 1G
hugepages.  HVO is unavailable on arm64; on x86-64,
hugetlb_free_vmemmap=off was used to exercise the fallback path.

  arch    base      with this patch  reduction
  arm64   360.8 ms  256.0 ms         29.05%
  x86-64  171.0 ms  165.0 ms          3.51%

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/hugetlb.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 630c96cd1e88..13efadf64023 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3214,6 +3214,14 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return true;
 }
 
+static void __init hugetlb_init_tail_page(struct page *page, unsigned long pfn,
+					  enum zone_type zone,
+					  const struct page *source)
+{
+	memcpy(page, source, sizeof(*page));
+	memmap_init_refresh_pfn_fields(page, pfn, zone);
+}
+
 /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
 static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 					struct hstate *h,
@@ -3231,11 +3239,16 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
 	 * we must initialize them ourselves here.
 	 */
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
-	}
+	if (start_page_number >= end_page_number)
+		return;
+
+	pfn = head_pfn + start_page_number;
+	__init_single_page(page, pfn, zone, nid);
+	prep_compound_tail(page, &folio->page, order);
+	set_page_count(page, 0);
+
+	for (pfn++; pfn < end_pfn; pfn++)
+		hugetlb_init_tail_page(pfn_to_page(pfn), pfn, zone, page);
 }
 
 static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
-- 
2.20.1
