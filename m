Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672093;
	b=5WZyD5XeSh3m7L4rvnb+l84Kopb/sc9d0roYp2pRPaCiJA1g/nayChJaeFIzDtKdiREt
	 CjvMf2VcdLGcxaZrhigd4n7t7HToz1sF4EvYUdbOYsuyM5etoa2a44IYr40oSGg4c8EyV
	 mypvkEmKLZfJtvdEtPQ6Wy2o0VJj2FYi2B+4fCYNDei1jhLbwRiz/4rzbgg7iuCsXbOji
	 eHpbhRQVLVyPTF605UVo5rl8tYj6jlC2Prsm8NpO0C5Z42re67f3qSV3XgbtTflTKUB73
	 CJcY3IpoG+1fiRf+Mm4NLwpveYsVEKDnIjXrseZ30rpn73qJgpbyjToqfe0dZeklxXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672093;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CPqnyF5S+r1Kaagrptzy8zg+kN7I2FQmxGKs9M2Lbgo=;
	b=omShaYsRdWN4ddrO5+4L7jLC2EsrgPTN7AKXlylvd7oflsOBCIQ/OqrivVgmP78k7c0x
	 hnZScZ5zXk55lo/xhL9VWoBS7/cM06bpeg/zZO8kWykASrPYKRf9yJNSJCQJshNVsl/I2
	 y+4UZCYwSCCSeQwS+vK/T2Ap2mnKQRoULnFpUtut/8hRtlFui81c4XrI7Rp77xlSA3RMP
	 saTfhYvmUkiA/wU7JB4MSVdMKXcp4N1OW+afLKyCH1pQIzcTHvl/RITb3H8EJ9zCIKWsQ
	 eo0mL98z68M8lzDKci0RNEd3rXOtXlR/l8DNvicpP8jl41ygvX58Cx6Inr/8p3rKWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lL6HT0fV;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F76A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F76A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lL6HT0fV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RaO38nP1XUoYBIOSBrcJ/lr2ZncC6R8OQavI7uqsSh0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792672089; v=1; x=1793276889;
 b=lL6HT0fVMXdH/cfbNz+Bkobw+qtTRWP68b1DxyAqguoMxnsiFz7MgDtWv6bxo/5fr/3ueh78
 wLEF0NaaDqaqxhtWTFUhFHg2040axbMgBx+2VExBgWfDc2kNfeew+aLOWlBbplESAlj8VXJj7K9
 lFhigJO3rnICUqgmfS0075Us=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4fe0cf934d8eb657;
	Thu, 22 Oct 2026 12:28:09 +0000
X-Mizu-Trace-ID: 4fe0cf934d8eb657
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: rppt@kernel.org,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH v2] mm/page_alloc: mark pages freed by __free_pages_core() as not tagged
Date: Thu, 22 Oct 2026 20:27:52 +0800
Message-ID: <20261022122752.74774-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Onlining hotplugged memory (e.g., a dev_dax device bound to kmem) with
CONFIG_MEM_ALLOC_PROFILING_DEBUG triggers:

  alloc_tag was not set
  WARNING: ./include/linux/alloc_tag.h:166 at __pgalloc_tag_sub+0x1fc/0x254
  Call trace:
   __pgalloc_tag_sub+0x1fc/0x254 (P)
   __free_pages_ok+0x14c/0x6ac
   __free_pages_core+0xa8/0x188
   generic_online_page+0x14/0x20
   online_pages+0x220/0x3b0
   memory_subsys_online+0xfc/0x198
   device_online+0x58/0xe0
   state_store+0xf0/0xf8

Pages entering the buddy through __free_pages_core() have never been
allocated, so their allocation tag references are NULL.  The free path,
__free_pages_prepare() -> pgalloc_tag_sub(), expects a valid tag or a
CODETAG_EMPTY mark and warns otherwise.  Paths feeding never-allocated
pages into the buddy are therefore expected to mark them with
clear_page_tag_ref() first, like init_cma_reserved_pageblock() and
free_reserved_pages() do; of __free_pages_core()'s callers only
memblock_free_pages() clears the tag ref itself, and the hotplug
onlining path was missed.

Since all __free_pages_core() callers free never-allocated pages, mark the
head page as not tagged in __free_pages_core() itself instead of relying on
each caller, and drop the now-redundant clearing from
memblock_free_pages().

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---

* From v1 [1]:
  - Clear the tag ref once on the head page in __free_pages_core() for both
    meminit contexts, instead of once per page in the MEMINIT_HOTPLUG loop
    (Sashiko)

[1] https://lore.kernel.org/20261020161053.59879-1-zenghui.yu@linux.dev

 mm/mm_init.c    | 2 --
 mm/page_alloc.c | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 01fb46be3d25..92e4a78207ca 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2475,8 +2475,6 @@ void __init memblock_free_pages(unsigned long pfn, unsigned int order)
 		return;
 	}
 
-	/* pages were reserved and not allocated */
-	clear_page_tag_ref(page);
 	__free_pages_core(page, order, MEMINIT_EARLY);
 }
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e71e514ea18d..0396c50b96f0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1617,6 +1617,9 @@ void __meminit __free_pages_core(struct page *page, unsigned int order,
 		atomic_long_add(nr_pages, &page_zone(page)->managed_pages);
 	}
 
+	/* pages were never allocated */
+	clear_page_tag_ref(page);
+
 	if (page_contains_unaccepted(page, order)) {
 		if (order == MAX_PAGE_ORDER && __free_unaccepted(page))
 			return;
-- 
2.56.0

