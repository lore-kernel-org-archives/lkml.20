Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008479;
	b=zxkATFknzszf8UadM+e9OQ6R6QU8E6JeV810trg2R3bsZSBDh/uJ41QTlfd4Y6HD96eM
	 ZxqkCIkMSoiQhm6JtZhT39dLI8aRn0U3XDZLm0pkbbXpF8o+42uWbD9sA7wgLxC15n3LY
	 Qk+JnhYPj7fZNWL+MK/bb4ujrtCbC48cxUEy2DxpFwS922DQKlT/EabSW+2wyy1GVS4Yu
	 TFy7rkEh3wpmGfZa5FfE6frQIzGnol3UJRx2xKan93RRWfk9EiYl4ra5fbB7d7XJ3H9rB
	 aSXPazQSMPX4Y89Z4CRydIb7SLgvOT+XvzDp6xTXVGTUwKxnQug5+5u+8S/YWCSdUFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008479;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=oFSOqqmv4ObDkCg4ConnZ6gyRo7BgJ30zlOlybbBi8Q=;
	b=VdZzJXxCFJEYnxCh/zm7NOw1UDlZAtSu2747xIoVH1pVM7H6wtFCKHyWbJJvyp/XKQYB
	 VnIXc1En5JpHvm2JbjRETCJ49N0ZcRVfndomvMP1GoSeq13rm7Ys6I/QgkuTtKC9BrBov
	 6J8mN17YvbgcJ5Y4ufvnsGD2XhgsdELvfq1Mb9VnfBRze2vQ0Y3yLfpfwMqCckbcRZyfq
	 rEQspB8JSrOoL/ugr4impfLNtpAWxHAdX3eigmdgOdcsrSuCR50p2f1MyOkKrah0N5dtc
	 s4Y5O1/JlcV4wbwXZZ3QftyOM9Zda+G+sQGv9qm1FbHO9TGZIzMS1rRj1yQcF7KEVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=q+UuW+m7;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD660A2604
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BD660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=q+UuW+m7
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026095435euoutp0205773c6d6de2b74d94ae7870a52be75d~iC7V21NZq1240012400euoutp02C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026095435euoutp0205773c6d6de2b74d94ae7870a52be75d~iC7V21NZq1240012400euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793008475;
	bh=oFSOqqmv4ObDkCg4ConnZ6gyRo7BgJ30zlOlybbBi8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q+UuW+m7e+nYHj0spnYWoVX7TMef27suU6MuNu5kgzitBrE9g2xrP0qEloNVI1wWx
	 NgmhtVfcJUnQ8NXVdlVzP7esxhEZOrP3Fq/Rs4iXhutIvwEVtpWnoaIcV89wRT2oJl
	 DorwYArboUaIP+EkRw7DcFBHFv79cnk8Sh5wWppc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026095435eucas1p1f2245a6982ef110340685dc66be53590~iC7Vo6vbO1648416484eucas1p1s;
	Mon, 26 Oct 2026 09:54:35 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026095435eusmtip2e956c1473294e45f88e7231e70c47818~iC7VSL1Na1301813018eusmtip22;
	Mon, 26 Oct 2026 09:54:34 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Claire Chang <tientzu@chromium.org>, stable@vger.kernel.org
Subject: [PATCH 2/5] dma: swiotlb: Serialize restricted DMA pool
 initialization
Date: Mon, 26 Oct 2026 10:54:13 +0100
Message-ID: <20261026095423.966856-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026095423.966856-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261026095435eucas1p1f2245a6982ef110340685dc66be53590
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026095435eucas1p1f2245a6982ef110340685dc66be53590
X-EPHeader: CA
X-CMS-RootMailID: 20261026095435eucas1p1f2245a6982ef110340685dc66be53590
References: <20261026095423.966856-1-m.szyprowski@samsung.com>
	<CGME20261026095435eucas1p1f2245a6982ef110340685dc66be53590@eucas1p1.samsung.com>

Multiple devices can share the same restricted DMA pool, in which case
the io_tlb_mem structure is allocated and initialized by the first
device attached to it and stored in rmem->priv. To avoid the potential
race, serialize the check and initialization of rmem->priv with a mutex.

Fixes: 0b84e4f8b793 ("swiotlb: Add restricted DMA pool initialization")
Closes: https://sashiko.dev/#/bug/linux-6fda7589-591d-4a68-b6e1-b1561f867319
Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/swiotlb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 2c57b49ac7c0..db731f7891b7 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -35,6 +35,7 @@
 #include <linux/init.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
+#include <linux/mutex.h>
 #include <linux/pfn.h>
 #include <linux/rculist.h>
 #include <linux/scatterlist.h>
@@ -1986,10 +1987,12 @@ void swiotlb_free_from_pool(struct device *dev,
 	swiotlb_release_slots(dev, tlb_addr, pool);
 }
 
+static DEFINE_MUTEX(rmem_swiotlb_mutex);
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-	struct io_tlb_mem *mem = rmem->priv;
+	struct io_tlb_mem *mem;
 	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
 
 	/* Set Per-device io tlb area to one */
@@ -2003,8 +2006,10 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 	/*
 	 * Since multiple devices can share the same pool, the private data,
 	 * io_tlb_mem struct, will be initialized by the first device attached
-	 * to it.
+	 * to it. Serialize this, as devices may be probed concurrently.
 	 */
+	guard(mutex)(&rmem_swiotlb_mutex);
+	mem = rmem->priv;
 	if (!mem) {
 		struct io_tlb_pool *pool;
 
-- 
2.43.0

