Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304134;
	b=ggOWzL0/pH5gOoyaHB2GegL5Y9f+W/IeRFc6hfnPA8n3z9jNEBRGiKaWGcL1btBSjzsB
	 PF+hlmfiFHE35aZsPA4kai+h0T0o++a9bdfbGJ6ox+n7c3Ggwdzshuypho+EVTT1ETnvu
	 bU3YJfkDPE/4rExviYwohpK6mg+k0YzeBY/JTD8RLX5JmMkrIEC0f+tWM4EZ2DzBosjAI
	 6yV2uqigIfpuLDXFxv0ssNRenRW4kHlViF1yF+2TAneB5ZUz9ZmxeD3u4a9Bo5c6ah7Xu
	 8nC8YpFolrP3JuXNKqZlp4kYdGrtlW8fmUFs+oygseLl8idZe1aexooAfRn81XwJwQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304134;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=ax4MvHJyHLXrr5GwS+hGV9/dsrsTvA8fGhdsCAVYF24=;
	b=dOIzjuAx0yRYo3wcA7bVviUiYkWhL4CnDGe9wx798msNfl+M1mteZEAVUkyiPskUbe0m
	 0kfdu9Q604A46MK6e5GJKoCaAWCmg9sKFmwF2LR7phffWkbmSEwACDOoj+hR0PEKLTiBW
	 2Xyk4Qfnee7zBKrEnfAYkrVqxnxNwfmzU4+dfqOV82p+EHA/QLgYgKhF72fE50uS1Ibcm
	 QZr3DKTDxDFhk9y7JaIrsEYXRYFG9VifBrPYgH2Q6nJQpT+8Eo8gxTmLR6TFrEd5ZerQo
	 hu2agprOBbb5SJAPze71+r5z+aO7ZXDITsMtr/CCoQodjZ9SI0dALtTWfh7sLRs2SLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=G5DWh+To;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372A606B9CC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8372A606B9CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=G5DWh+To
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261110094852euoutp020b9a3155a5d32325167ea017f2a984c7~mphoAtYiX2947129471euoutp024
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:48:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261110094852euoutp020b9a3155a5d32325167ea017f2a984c7~mphoAtYiX2947129471euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794304132;
	bh=ax4MvHJyHLXrr5GwS+hGV9/dsrsTvA8fGhdsCAVYF24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G5DWh+TodT1wHEmqB2NZ5J8cakFau/XrIhiBecUjljKySHdEYTfI78JDRF6rt3YF+
	 /WZxGvXkpuLd3JVbNIyZsZfC6D7hSDFPgXQGxcxnXdfuyrNGXpq0WJJZ9BdYBkvVdo
	 zKPZs5fx2VmD/9KazTglN/6WkL10DgKGOsZz5kEE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261110094851eucas1p10eccf143e36dcc8933008074dee399c9~mphnM8IAJ2784927849eucas1p11;
	Tue, 10 Nov 2026 09:48:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261110094850eusmtip1ca4aaef9449d1bd8d0a657cb62cfc5af~mphmcNYpF3192331923eusmtip1W;
	Tue, 10 Nov 2026 09:48:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 5/7] dma-mapping: document that arch_dma_prep_coherent()
 must handle highmem
Date: Tue, 10 Nov 2026 10:48:25 +0100
Message-ID: <20261110094830.2081847-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094830.2081847-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261110094851eucas1p10eccf143e36dcc8933008074dee399c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261110094851eucas1p10eccf143e36dcc8933008074dee399c9
X-EPHeader: CA
X-CMS-RootMailID: 20261110094851eucas1p10eccf143e36dcc8933008074dee399c9
References: <20261110094830.2081847-1-m.szyprowski@samsung.com>
	<CGME20261110094851eucas1p10eccf143e36dcc8933008074dee399c9@eucas1p1.samsung.com>

arch_dma_prep_coherent() has no documentation, and several
implementations assumed that the page passed to it always has a kernel
linear mapping and used page_address() on it. That is not the case:
dma_direct_alloc() and atomic_pool_expand() can get a highmem page from
CMA and pass it to arch_dma_prep_coherent() before remapping it, and
dma-iommu allocates the pages for non-contiguous buffers with
__GFP_HIGHMEM.

Add a kernel-doc comment describing what the hook has to do and stating
explicitly that it must accept highmem pages without a permanent kernel
mapping.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/linux/dma-map-ops.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index afaf2c12189b..ee4ac12bf2ad 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -371,6 +371,17 @@ static inline void arch_sync_dma_for_cpu_all(void)
 }
 #endif /* CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL */
 
+/**
+ * arch_dma_prep_coherent - prepare memory for use as a coherent DMA buffer
+ * @page: first page of the physically contiguous buffer
+ * @size: size of the buffer in bytes
+ *
+ * Called before the buffer is accessed through an uncached alias or handed
+ * to a non-coherent device. The implementation must write back any dirty
+ * data cache lines covering the buffer, so no dirty line can be evicted
+ * later on top of data written through the uncached alias or by the device.
+ * Must accept highmem pages without a permanent kernel mapping.
+ */
 #ifdef CONFIG_ARCH_HAS_DMA_PREP_COHERENT
 void arch_dma_prep_coherent(struct page *page, size_t size);
 #else
-- 
2.43.0

