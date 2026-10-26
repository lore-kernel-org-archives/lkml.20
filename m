Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008480;
	b=M7VzLP7MMKBptJXaAYCcO7exiOnXN/6PXSBFYNvJyyODtkwvGdOxQmPFoLELvXOkUv+L
	 p5E4ezfvlk3gojOpCzZMHJale7+TfcLMTT+SR/st46TMoMxHhSXGIAPQxmpkycR5VhnMu
	 pyjl6kY9Hr/66TWCFnJ6uC8kzsiyDBZHhGoWI5GKeFQuoAWpEtNt+xTOYB5rDDkeBb71/
	 Q4GE/gOPE3whiQRkPHYsYzf4eghx0OLN3c8XgUyVkyqSyoNUa+PB5QTnkLpnRF702oigP
	 Jmx2wWnXQdAUseFD0FGxHn2Vyb5qQZx/XI00IK3E01XIWa9vBsvCpYdvHPtUGwLYqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008480;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=g5F29CYGzpyaMphPr1Ay74PbWfybCTO72tr2DJLko5s=;
	b=EEC5KJsRnu832AsWn1jgSc2vnOg2sf2K6u8A9nSGznsw4yopd2H3/mk0JwBQZkKtUCTU
	 Rj7c9J8uzIdAj0tVoYropTJzq0a7R6oSM729YLArj0w+hQavHeNgd4OdL4Q/BvRSFHByH
	 sTUrqPlfeva2dVuTwxPFm/EeqICToapMyW2Wu5MPc9l1XYBIxT9g55pMIP9nNkAXzXJKg
	 dFWORo47gYSKZ9CqBXxRgYhRPSpe2rM+d54zFSM+qcy0cy1wOS2e5gRtLzGd8E+aW9mor
	 uBnfDT1tV6yDgjS5MReIdEhtuLvyfS2CbotYH4dKTww71GO5KfXl/4ZXnlX/17/zRCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=N5471TYt;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B0C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=N5471TYt
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026095436euoutp0243030a055f9a79925ea06b81cf561a1d~iC7WQ514k1239212392euoutp02E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026095436euoutp0243030a055f9a79925ea06b81cf561a1d~iC7WQ514k1239212392euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793008476;
	bh=g5F29CYGzpyaMphPr1Ay74PbWfybCTO72tr2DJLko5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N5471TYtW/Bvg2rh6h+9Jn+zRI1gbZgVz2KdzEVVHtgYPr0Ezik+/HpzY73JhIkWH
	 ZTRuGlbScG2djCzyme/XfoXYFFytfipvNxXncQ+zHEt+UTirB1XXgE5HbKQ/H9b+mq
	 eFl+m4EXbN5mlJq76bubqdl6mggriZKlpObKrSfY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026095435eucas1p129baa137891d2e9f5408b47afd6c556c~iC7WCHumN1950419504eucas1p1Q;
	Mon, 26 Oct 2026 09:54:35 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026095435eusmtip2bcc574f43d3f9a26c454413514223b14~iC7VuXSvW1096710967eusmtip2Q;
	Mon, 26 Oct 2026 09:54:35 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Petr Tesarik <petr.tesarik.ext@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] dma: swiotlb: Remove default pool from the pools list
 on exit
Date: Mon, 26 Oct 2026 10:54:14 +0100
Message-ID: <20261026095423.966856-4-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261026095435eucas1p129baa137891d2e9f5408b47afd6c556c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026095435eucas1p129baa137891d2e9f5408b47afd6c556c
X-EPHeader: CA
X-CMS-RootMailID: 20261026095435eucas1p129baa137891d2e9f5408b47afd6c556c
References: <20261026095423.966856-1-m.szyprowski@samsung.com>
	<CGME20261026095435eucas1p129baa137891d2e9f5408b47afd6c556c@eucas1p1.samsung.com>

With CONFIG_SWIOTLB_DYNAMIC enabled, the default memory pool is added to
the io_tlb_default_mem.pools RCU list during initialization. When an IOMMU
takes over DMA translation, swiotlb_exit() tears the default pool down and
clears it with memset(), but leaves its node on the pools list. The list
then contains a zeroed entry with a NULL next pointer, and any later walk
of the list, for example mem_used() when reading the io_tlb_used debugfs
file, dereferences an invalid pointer and crashes.

Remove the default pool from the list before freeing it, and wait for an
RCU grace period before clearing it, so that no reader can still see it.

Fixes: 1aaa736815eb ("swiotlb: allocate a new memory pool when existing pools are full")
Closes: https://sashiko.dev/#/bug/linux-f75998aa-65ea-4596-9bb4-fa83773012a3
Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/swiotlb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index db731f7891b7..51fb2d34f6f2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -665,6 +665,12 @@ void __init swiotlb_exit(void)
 		return;
 
 	pr_info("tearing down default memory pool\n");
+#ifdef CONFIG_SWIOTLB_DYNAMIC
+	spin_lock(&io_tlb_default_mem.lock);
+	list_del_rcu(&mem->node);
+	spin_unlock(&io_tlb_default_mem.lock);
+	synchronize_rcu();
+#endif
 	tbl_vaddr = (unsigned long)phys_to_virt(mem->start);
 	tbl_size = PAGE_ALIGN(mem->end - mem->start);
 	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
-- 
2.43.0

