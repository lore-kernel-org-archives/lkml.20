Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512676;
	b=kfjU7NAmY8TMRKHxK6WxnXJez0pnzvw1oEVvVmVPcq0e1r43t0BfL8k6R5sQCtSbdZ76
	 0pE3VssFj+TtjoYs8yehDwE8RlWGbjhkcPeZo1v/+xAkTqUroTbxIr3FPEYG8bhAGsVC2
	 ljZpbImiXzYVBcPlRmTn+/0HFUZp2imcTogFTV+r61z/Y4dmrRtDP5NAXKd+kx6NY+V2T
	 7umj6JcrKO1eWS2vCYcg91u3kL7OLPZDMkFoMPUwCWCUTiHsZQNM3JzngLbZx4HO0NkZU
	 XSVlp0IyTR89sKBDwqxEIGOFx9oQIvK3VQOuzkTio2Boxu8UF7imqRdWYVRRLZZdDGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512676;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=huqzC5+NT3FshAWG+VCDlCjNdmPkTgAm4Cdkwvrtsao=;
	b=SqgStkulKyLjaJ4BDCiRvlddc2S/dSIwHiiXloO4oSWJ1zqCdFQ3e4sI7xB0yaT93a1X
	 sjOhkpJahFXQ005VC9fHL0w8EqKYG+nWU7ECqjrFAW6yRdwzfffUd6xrEALB0qyMELXJo
	 aCOXwvUF3BopHZFu3pMErcgqpe+qWjynmTQGLnlFpHymS07cRDGjSuDr6nfOH4mmmbILQ
	 ln2VwOAiAkRW3IO6NjfJsyteFC0QwGj7SYguJYcdvseb7H+ODmfc565WqHwqUwrZPQe4X
	 xBHOFYgUC7DtJuuWPKXtxeSNU77qxZ07D1JxQ+MiCfG3OYDE5TS4k8VkN9RUy6Dhtig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KxchpydK;
	arc=none smtp.remote-ip=95.215.58.46
Received: from mta1.migadu.com (out-46.mta1.migadu.com [95.215.58.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E419606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E419606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KxchpydK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5DMNnG7wdUv/ycP5u/+jKq6/Rsp8gxxgXmoGG4r9E2U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792512673; v=1; x=1793117473;
 b=KxchpydK44ePQ0NtdzuBPvgT78NaO8w+F/dELBS8s3G8mCSxvctbmlxBzIpnEUeO5ZDXdksN
 FCgPoXxOdTVjUFnKFHotD9i8vaomQAPUWnz1LSwnrQTXRTenmhf+QmnfULQ0UFLRJP7J61r+3GX
 zdMMssIE7aEDCSHe3dcLINgU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 99dbf0fb378e6f72;
	Tue, 20 Oct 2026 16:11:13 +0000
X-Mizu-Trace-ID: 99dbf0fb378e6f72
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] mm/page_alloc: clear page tag refs when onlining hotplugged memory
Date: Wed, 21 Oct 2026 00:10:53 +0800
Message-ID: <20261020161053.59879-1-zenghui.yu@linux.dev>
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

Onlined pages enter the buddy allocator without ever being allocated, so
their allocation tag references are NULL.  The free path expects a valid
tag or a CODETAG_EMPTY mark and warns otherwise.  Other paths feeding
never-allocated pages into the buddy (memblock_free_pages(),
init_cma_reserved_pageblock(), free_reserved_pages()) mark them with
clear_page_tag_ref() first; the hotplug onlining path was missed.

Mark the pages as not tagged in the MEMINIT_HOTPLUG branch of
__free_pages_core(), where PageOffline and the refcount are already
reset.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 mm/page_alloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e71e514ea18d..9561f2cd873e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1604,6 +1604,7 @@ void __meminit __free_pages_core(struct page *page, unsigned int order,
 			VM_WARN_ON_ONCE(PageReserved(p));
 			__ClearPageOffline(p);
 			set_page_count(p, 0);
+			clear_page_tag_ref(p);
 		}
 
 		adjust_managed_page_count(page, nr_pages);
-- 
2.56.0

