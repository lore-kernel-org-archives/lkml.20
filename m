Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610436;
	b=ruu5I2eHFRrbca3tyVmHdUL6BjSK1I0lUV71rj/9Xkpp4ns4vgiW6oQxJMpcw5l/XMcV
	 gozetR7oy5n6Hfvq+/daoMZsimSmWa7ZCC5t1H7G8hgEstPaLkgAX4fUZLrdi/R3wtIPa
	 8esv7Lle3WmO3DTqRUheIHoNtPQUreyLhAgVulG3OzTT7Z9bAyi0pW84KLEFp2AGxOrMY
	 qYJ5KfjqsaZSVmVSqL4njb7PFlvOm7QeOlwjvd1f0SUPQSrJzbg6WD5j+TByyeeYhZ2Mw
	 jorffbGDimjBr6grqGYvVyw0xkTmN7gkbnWr0mhoP+HXUFB2Sb8pUjfIFwRN/rJQEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610436;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zfkqqiDFD5IvY8N0pAIRMYYO8A2QXCw24tO2W4iaNrw=;
	b=hXJDPZCyrJF/sRuvBxhoFKCzSrhRZZZg2JDK6l7R8fME+juoLobGBHkKVuT/diH8XREc
	 /GtQZlCwkQFx1cT9TtoipSoUatR1wQNE3sc1tC/adtZxGQSu0kZZj0/NsLb4gRxf5okkA
	 u6o0ll3A4JJyELYWLSRBc86smXnraCVMGfZAxEPcU5QoSwvv5QCObaRWrx1ei/vTt2ekr
	 KrsOO6x801Oi5aa04NOO56Q71bQqI8eSmz+EWNVK6UtbBKA74k1fAD2eJ2D6FACMd4oBN
	 WG9GMJdXFH21l9UGp1NPTXPnj8DZeaemKj7YUmBnA7lYsEPJukSErKNQakCA7M5icyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="vFXb9/5h";
	arc=none smtp.remote-ip=43.163.128.44
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D362F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=vFXb9/5h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793610424; bh=zfkqqiDFD5IvY8N0pAIRMYYO8A2QXCw24tO2W4iaNrw=;
	h=From:To:Cc:Subject:Date;
	b=vFXb9/5hHiTX/fb3/iL5Ejf7xwIzBkOlCNvmNJIlhxjlgxDAbmgDulBemUp81zL8j
	 fMeyTmrQXVZnf3YzpLkXfvdwyWS+5IG+Gf+ByUfhS98g7LhtEcua1dRdbgpdP2WPkP
	 Gi8TurbePCZHfPOmk2XEublT9kxr+ai22TUB8ctk=
Received: from XJSH01426.meizu.com ([210.13.72.171])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 1BAA426E; Mon, 02 Nov 2026 17:06:58 +0800
X-QQ-mid: xmsmtpt1793610418taggzhqn8
Message-ID: <tencent_869149E9C4305627F0ED654860AC4DDBC309@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5NjUq5Tx4KGydF6yOXyo5PhibasoGLwdQeEcKbYlTnLK7kLmPvh
	 9btrl9s30aYfWimMR9kRYjWbkag4SQSR4UcM9G872mRsZeKqs5dS62nLn6+GiniIZqWTKeGKf3Kr
	 +DXkcgChp3C4xUszJBQGr3X5+ol41F8gKwbVcxBOidvZEaiqQ36/zBrW0cBPu2tnQGW2m11Fpms8
	 sftN4M0WJN12FoICf1QCDpYKYVAZ0aAPhMjC7h/wWUjKZaAbxSuIcXYxi+M5TcJW4RVJcmxIlwDf
	 w4A0m2tW7GxFgFVBSFpt4phszc78ZRPUx+48WtUVntxzH7qTggLAQfLk0F9Q5QD73RcLAvtqWrsy
	 gOtuMNHHFzbHNu7WAMqb7BX2SOn+HVzdVbNlLarL9NLeFKXgZguvqtnKzChOziuc62tYCwdSbrwu
	 KW5fEkPUEo1J9ur7YKCZ0vCszDtV2n9YDg4BTC6JdCTrbBhfprdwY222ttwTJsOcpA0XuG6gsn+H
	 BE2HF9rjbMczIMlBOsa1t32tU9QTg4JPnPNTO38XxvFhFT28vPJnrkKfohUNKsUnKQNKOsZWXl5g
	 Qm5ImE7Zr0giV2LgZoxS0xnFE8cxKYNCI5HlCb4RXid1KGxDtlg6d5eIaSDLaO2ntCmXlDMPkCma
	 uZycLRr1UiAj4TpNPycILCcj+wMM9bnewHEyIBpPUMHlPETMcRv/2W3eCSryihhtNCPBQGOP7iBz
	 oMueG0vb/IGV2quB2nhV1wMrwawYi3+3ZEFPE3gOKwdVpH/QasHUpoRY6GIOKNhrESRjawaucKP3
	 X0IjREp7Bru+bZ2eIjyEsy3hJzQzW1VDziaIdN1G3LkvXsorX74Pa0EkIKbWg7qcP3JpKiZoO60l
	 cjXh0pJtWc8Avxvg3w7XxXQFj86y039W/VhfyzIPtQWozaU+/xIagRYq61zjk4GQjpSmmyH2UjfJ
	 vwnVk6VaFchFJ1up6cO9E9avoTpLVXaAGssguB1aGMgGKvHUdti5ROn/ho3GiPNFHcHrU6zwelNp
	 ywad7nFUh1k660OpmiNkONaaCipSS+io/MF6/dPnPbOSBPnHzpPd/ZZFxq7JL/eOMTNFQNSQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: akpm@linux-foundation.org
Cc: vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhenghui Hao <zhenghui.hao@qq.com>
Subject: [PATCH] mm/page_alloc: release isolated freepages on compound range mismatch
Date: Mon,  2 Nov 2026 17:06:44 +0800
X-OQ-MSGID: <20261102090644.1135255-1-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
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

alloc_contig_frozen_range_noprof() isolates [outer_start, outer_end)
before checking whether a __GFP_COMP request exactly matches the
allocated range.  If it does not, the function returns -EINVAL without
releasing cc.freepages, leaking the isolated pages.

Call release_free_list() before returning -EINVAL, while the pageblock
is still isolated, matching the cleanup already used when
isolate_freepages_range() fails.

Use WARN_ONCE() as well: the condition is reachable through the exported
API, and repeated invalid calls should not flood dmesg.

Tested with an order-9 free pageblock and a one-page __GFP_COMP
subrange:
  before: free_buddy=0, leaked=512/512
  after:  free_buddy=1, leaked=0/512

Fixes: e98337d11bbdf ("mm/contig_alloc: support __GFP_COMP")
Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>
---
 mm/compaction.c | 2 +-
 mm/internal.h   | 2 ++
 mm/page_alloc.c | 9 +++++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb201..11ec991206bb 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -89,7 +89,7 @@ static struct page *mark_allocated_noprof(struct page *page, unsigned int order,
 }
 #define mark_allocated(...)	alloc_hooks(mark_allocated_noprof(__VA_ARGS__))
 
-static unsigned long release_free_list(struct list_head *freepages)
+unsigned long release_free_list(struct list_head *freepages)
 {
 	int order;
 	unsigned long high_pfn = 0;
diff --git a/mm/internal.h b/mm/internal.h
index 566cbd2dce48..364b288a0e2c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -880,6 +880,8 @@ int
 isolate_migratepages_range(struct compact_control *cc,
 			   unsigned long low_pfn, unsigned long end_pfn);
 
+unsigned long release_free_list(struct list_head *freepages);
+
 #endif /* CONFIG_COMPACTION || CONFIG_CMA */
 
 struct cma;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a8cac5e01066..6913e0f94540 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7400,9 +7400,14 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
 		check_new_pages(head, order);
 		prep_new_page(head, order, gfp_mask, ALLOC_DEFAULT);
 	} else {
+		/*
+		 * isolate_freepages_range() has removed the pages from the buddy
+		 * allocator.  Put them back before undoing pageblock isolation.
+		 */
+		release_free_list(cc.freepages);
 		ret = -EINVAL;
-		WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
-		     start, end, outer_start, outer_end);
+		WARN_ONCE(1, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
+			  start, end, outer_start, outer_end);
 	}
 done:
 	undo_isolate_page_range(start, end);
-- 
2.53.0

