Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593123;
	b=taOjNI0CcdGm+wkPjhCH/KUMYkpnZYFdrAgE/NAmvl4+iTcE9+todj7sPL9F56Lt4VP5
	 i283AVp8rEaBi3kXEVnZr751i6FsHBvwvnRJXYyHQCINChLcjEF4FPj22uekHVtSk3EU3
	 03D3LDqzcipjL+QzqFnkpQJRstmaITs0Q5Ra03ta4Td+CZiZNKl7z6Dqi77UBKeuY4N6l
	 5Bst+5TBaXyqSFpamd2ubd5VUklFyKl+ENpn3mj2B/m24aKLAr2ZkI/lL4jAOXDF+WRf+
	 u6LT3aZKDtLJZl+Ggsqyi1cZCbyDj8AJ1wWhB5XAZs3g5VlVFa948kbvOaLmEkHZN6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=QazYBGvrND8GI8lJcSkyL4fj9MMsXahwbNAM7/zrdo0=;
	b=Gsyz8Q0Qg1GGtaiDtC/mAvC4PT4qg9diB+U7U9RfeWCy1lYgXY0J074nm/ZfNuXHZbYw
	 ew+Ja0nG0spV2QFVtp25lv/qPBzHwWs2Su1CIr5GO7AGtoBf/IbK1VwMZinwVvh4pRLr8
	 Ugy7f9p6IRd3PAalJk1G79Wmx1xqBxu5CRgyadX87JobF2Aqma1w6GFG7UV/WQLtxQRJj
	 6gAK53Q0Y4ArgazbUIiRrdw3XZZoCdholY4XFWbg0S0ZQ0nnbEuXb/+MgLNxyUDmN5g3v
	 lyXE3OZ/woJw/DIqNUwAum9fIWPpjmPr/fwRigwXxIfQk4FvQBrW0ZmxlXGYtpbE74Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CyFxm3Ar;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B987606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B987606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CyFxm3Ar
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1370953f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792593120; x=1793197920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QazYBGvrND8GI8lJcSkyL4fj9MMsXahwbNAM7/zrdo0=;
        b=CyFxm3ArtbKF18zZ2VLSW18alh1KxHR9zOgCLyTRVzpX6nL5nGPAt1hsdIdE65SB8Q
         5w6ANmH3O91Vw9FjwXtJnYGZcTk3lLuRd1Lp5ARHzPQ61FaTwRpqUxFjC69v45msoDVy
         vZ59dq9GgrUpSVWnhnTo01wkDl1DAKZ9Ism1lUQWooxN42Tna8+UhXRXR5bdeQllLRFv
         soZ7ZGpDvNw+5/dFVnSOeY/rJyHcuX/u0yUMh/TO27xOQTTRMRah72zNWL+w97erKq5Z
         xsV5sqSqlW5edEGznmeICv0+r5XLN7seMpa1HnjD/cJP1Q36cscwUw+w7Oyhm3TgiD0l
         UwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593120; x=1793197920;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QazYBGvrND8GI8lJcSkyL4fj9MMsXahwbNAM7/zrdo0=;
        b=q4VsJHvL6mqHgPI679VU6F6EYoNeiTbdE3SAH/W8t3uRrtbYJgBvgCFZwKM4zKMB2K
         iZhNjhNFcDZ/Py8pqA2BnHWgsFzYVFlDr3SKlCV6lRvzT55EvyxD6T9S+Q3i43FFbg31
         WgqiW/eTvudDVGZxpBCUO589iWAcoQxzdpJsrkZ6w0eIA6/YhyUEbq0u1fcMSY2/waQs
         9HHAVEJCZ3MErWBHIi+o1QRri843anYyq3OlEPS8bXJmvKGtnKbJsYJhhTNRg5bWk54n
         1mB+z7KJYEWTHp7B0WUH8x1SHntVEwdPHHVH3sZS7KPDmn3hj01LLmF/C4dR3CytVuLG
         hmAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt4mpcTUimJd61W0M7i5rtGrbZXRd/QsyTtmIrNHVxkuklWrpGq34cS5eZavGeX+Yz7GB4TnLVJ5SI4cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFUmo2oK1HsiOPa383JbHLvQbxW44USHxhCI8VrM039mRcCekL
	r6fU9a3ebrzO3usn0bZXTFi8VQoG+maqJ7GNQjipSf0UeRF+aS8+nArxHlrm7w69E8FZDYuoXFH
	vBvuoAvf9GBEiLqt7aX4k4Q==
X-Received: from wmdp11.prod.google.com ([2002:a05:600c:5cb:b0:4a1:fe70:d25d])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f91:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1fdd0c00bmr46588075e9.7.1792593120273;
 Wed, 21 Oct 2026 07:32:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:31:54 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021143154.2638232-1-mclapinski@google.com>
Subject: [PATCH] iommu/dma: Allocate flush queues on first use
From: Michal Clapinski <mclapinski@google.com>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Logan Odell <loganodell@google.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

iommu_dma_init_domain() allocates the per-CPU flush queue of a DMA-FQ
domain upfront. That is 10KiB per possible CPU, so on a 224-CPU machine
it costs 2.2MiB and ~570us per domain. Since every device gets probed at
boot, large servers pay this for hundreds of domains in pci_iommu_init(),
even though many of them (PCIe ports, CPU uncore devices, ...) will
never do streaming DMA.

dma-iommu already copes with a flush queue appearing on a live domain,
as the sysfs DMA -> DMA-FQ transition does just that. So only allocate
it on the domain's first unmap, from a workqueue since unmaps can happen
in atomic context, and use strict invalidation until it is in place. If
the allocation fails, downgrade the domain to IOMMU_DOMAIN_DMA as before.

On a 224-CPU Sapphire Rapids server with 431 IOMMU groups, this cuts the
time spent in pci_iommu_init() from 330ms to 83ms.

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
 drivers/iommu/dma-iommu.c | 78 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1f624f241ac1..e61cd016b424 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -56,6 +56,11 @@ struct iommu_dma_options {
 	unsigned int	fq_timeout;
 };
 
+/* Bits in iommu_dma_cookie::fq_flags */
+enum {
+	IOMMU_DMA_FQ_REQUESTED,		/* fq_work has been queued */
+};
+
 struct iommu_dma_cookie {
 	struct iova_domain iovad;
 	struct list_head msi_page_list;
@@ -74,6 +79,10 @@ struct iommu_dma_cookie {
 	atomic_t fq_timer_on;
 	/* Domain for flush queue callback; NULL if flush queue not in use */
 	struct iommu_domain *fq_domain;
+	/* Domain to allocate a flush queue for on its first unmap, if any */
+	struct iommu_domain *fq_lazy_domain;
+	unsigned long fq_flags;
+	struct work_struct fq_work;
 	/* Options for dma-iommu use */
 	struct iommu_dma_options options;
 };
@@ -330,7 +339,12 @@ static int iommu_dma_init_fq_percpu(struct iommu_dma_cookie *cookie)
 	return 0;
 }
 
-/* sysfs updates are serialised by the mutex of the group owning @domain */
+/*
+ * sysfs updates are serialised by the mutex of the group owning @domain. They
+ * only ever target a domain of type IOMMU_DOMAIN_DMA. iommu_dma_fq_work(), the
+ * only other caller, acts on a domain of type IOMMU_DOMAIN_DMA_FQ and only
+ * changes it to IOMMU_DOMAIN_DMA once it is done, so they can't race.
+ */
 int iommu_dma_init_fq(struct iommu_domain *domain)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -363,6 +377,48 @@ int iommu_dma_init_fq(struct iommu_domain *domain)
 	return 0;
 }
 
+static void iommu_dma_fq_work(struct work_struct *work)
+{
+	struct iommu_dma_cookie *cookie = container_of(work,
+						       struct iommu_dma_cookie,
+						       fq_work);
+	struct iommu_domain *domain = cookie->fq_lazy_domain;
+
+	/*
+	 * On failure, fall back to strict invalidation as iommu_dma_init_domain()
+	 * would, and say so in the domain type, so that it is reported correctly
+	 * and writing DMA-FQ to the group's sysfs type can retry. That only acts
+	 * on IOMMU_DOMAIN_DMA domains, so it can't run concurrently with us.
+	 * Don't take the group mutex here: the group may be waiting for us in
+	 * iommu_put_dma_cookie() with it held.
+	 */
+	if (iommu_dma_init_fq(domain))
+		WRITE_ONCE(domain->type, IOMMU_DOMAIN_DMA);
+}
+
+/*
+ * A flush queue is a sizeable per-CPU allocation, but it is only of any use
+ * once a driver unmaps DMA through the domain. Many domains never get there,
+ * e.g. those of bridges and other devices that are probed by the IOMMU core
+ * but never do DMA, so set the flush queue up on the first unmap rather than
+ * when the domain is initialised. Unmaps keep using strict invalidation until
+ * the flush queue is in place. This may be called from atomic context, so do
+ * the allocation from a workqueue.
+ *
+ * The work is queued at most once per domain. Check the flag before trying to
+ * set it, so that concurrent unmaps don't all have to take its cache line
+ * exclusively until the flush queue is in place.
+ */
+static void iommu_dma_request_fq(struct iommu_dma_cookie *cookie)
+{
+	if (likely(!cookie->fq_lazy_domain) ||
+	    test_bit(IOMMU_DMA_FQ_REQUESTED, &cookie->fq_flags) ||
+	    test_and_set_bit(IOMMU_DMA_FQ_REQUESTED, &cookie->fq_flags))
+		return;
+
+	queue_work(system_dfl_wq, &cookie->fq_work);
+}
+
 /**
  * iommu_get_dma_cookie - Acquire DMA-API resources for a domain
  * @domain: IOMMU domain to prepare for DMA-API usage
@@ -379,6 +435,7 @@ int iommu_get_dma_cookie(struct iommu_domain *domain)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&cookie->msi_page_list);
+	INIT_WORK(&cookie->fq_work, iommu_dma_fq_work);
 	domain->cookie_type = IOMMU_COOKIE_DMA_IOVA;
 	domain->iova_cookie = cookie;
 	return 0;
@@ -428,6 +485,7 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 	struct iommu_dma_msi_page *msi, *tmp;
 
 	if (cookie->iovad.granule) {
+		cancel_work_sync(&cookie->fq_work);
 		iommu_dma_free_fq(cookie);
 		put_iova_domain(&cookie->iovad);
 	}
@@ -715,11 +773,17 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, struct device *dev
 
 	iommu_dma_init_options(&cookie->options, dev);
 
-	/* If the FQ fails we can simply fall back to strict mode */
-	if (domain->type == IOMMU_DOMAIN_DMA_FQ &&
-	    (!iommu_domain_supports_fq(dev, domain) ||
-	     iommu_dma_init_fq(domain)))
-		domain->type = IOMMU_DOMAIN_DMA;
+	/*
+	 * The flush queue is allocated on first use, see iommu_dma_request_fq().
+	 * If it can't be used, or its allocation fails, we simply stay in
+	 * strict mode.
+	 */
+	if (domain->type == IOMMU_DOMAIN_DMA_FQ) {
+		if (iommu_domain_supports_fq(dev, domain))
+			cookie->fq_lazy_domain = domain;
+		else
+			domain->type = IOMMU_DOMAIN_DMA;
+	}
 
 	return iova_reserve_iommu_regions(dev, domain);
 }
@@ -835,6 +899,8 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 	size = iova_align(iovad, size + iova_off);
 	iommu_iotlb_gather_init(&iotlb_gather);
 	iotlb_gather.queued = READ_ONCE(cookie->fq_domain);
+	if (!iotlb_gather.queued)
+		iommu_dma_request_fq(cookie);
 
 	unmapped = iommu_unmap_fast(domain, dma_addr, size, &iotlb_gather);
 	WARN_ON(unmapped != size);
-- 
2.56.0.212.g129ede20d9-goog

