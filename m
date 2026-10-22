Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683980;
	b=G3pvoaDF4FCrcMc1AKpKMkezQoxc9tMWiR/4lh7MM6Jjn+k089MCJDYh2vp2QdBSbHuz
	 By0OnOfgPguWnBxzKnGVIQk012etKzgoKeddzvo10wDSFTox14+lBfdPy/0z+nErJTsOR
	 lOtMfdmMtGicbC+LKttqhxi+ujnxRfSppojt3bfR+2/dDQl7FsEX8FbL8UtCEUOLGnrPn
	 7jbEVYYfVTbuinvwKgdn1uvqGWw+B5ALF9BEeQ/kxOYGBH+gCS1bAR/olx7QmrESneW3A
	 Ytc2qoMq8Vd2Vs3hx9zCpUhIADKM3ITrT2kQxd8ejpaTb4vwMDr+bDijkGvmkrMo/aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683980;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xxTPejnJdS/vYzb8yPb8KkE7+Hf7lZNZOOc1KdjszKc=;
	b=yQL+g6DbF3/volZE9so/DKY2JQDBdiY8Hd3yI3s7MU2CGfCK1KN3Hlw9wKT5IXrg5cdt
	 Yc8d0NenYEyU7Kc7h4kaKdDOXccPHsMSvIVwxi90Rs00GBaUdtlmCio9Dlm4rcIEgtt8W
	 /au3yURSObY8t4p2My/OgS59A3nNxeNJcYQNtcSt3sZQuP2nblj5eyogEECsS7dZIOZ6G
	 bLh4K94ROASYa+WcQQEHcDIXP/PQRfYKvYkitgMUzteZDCDTBYAO2G+YWt3SOQg6Tvggk
	 eI0xCYDLBdbVTq0YshO8+9of2k7XDD/ddIg8q4XvbCzGIEjHuEzNoOiC7a8WkZlGySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lxBBVpbF;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4864606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4864606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lxBBVpbF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b9aN3UoXeOF4eAVozHhQBDfnYXVjdCGwCFhe2u2yLGQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683978; v=1; x=1793288778;
 b=lxBBVpbFUM6j/QvZQMW4notzewuwIabFr7/AIsutSlYHjabP5CYz0TWA6XIjUuQ3oysIgolr
 X2cZKFyYVLH38E7ORtYPCPFzQVvS6Cw/aLP4/Ii90PQmLyfLOhdJ2jFItjCZTPAedR1PQ3dkB9o
 26ct4ypGSoIIyVPv/wv/QXe4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b707346131377bb7;
	Thu, 22 Oct 2026 15:46:18 +0000
X-Mizu-Trace-ID: b707346131377bb7
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	tomasz.jeznach@linux.dev,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	tglx@kernel.org,
	kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com,
	nutty.liu@hotmail.com
Subject: [PATCH v7 2/5] iommu/dma: Introduce iommu_dma_prepare_msi_list()
Date: Thu, 22 Oct 2026 17:46:00 +0200
Message-ID: <20261022154603.1374754-3-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
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

IMSIC needs an interface to prepare all MSI targets before an IRQ
affinity change can select one in atomic context.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 drivers/iommu/iommu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/iommu.h |  9 +++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..b8d4d601efd4 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -4266,4 +4266,47 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 	mutex_unlock(&group->mutex);
 	return ret;
 }
+
+/**
+ * iommu_dma_prepare_msi_list() - Map the complete list of MSI targets
+ * @desc: MSI descriptor to receive the base IOVA and granule shift
+ * @phys_addrs: Ordered array of target physical addresses
+ * @nr_addrs: Number of targets in the array
+ * @granule: Size and alignment of each target mapping
+ *
+ * Every call for a DMA domain must supply the same complete list, order and
+ * granule. The first call maps the targets into one contiguous IOVA range;
+ * subsequent calls use the cached base. The array is consumed synchronously
+ * and is not retained.
+ *
+ * Each target must be aligned to @granule, which must match the DMA domain's
+ * granule and be at least PAGE_SIZE.
+ *
+ * Without a translated domain, @desc is left unchanged. Only DMA-IOMMU
+ * domains currently support translated MSI target lists.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+			       unsigned int nr_addrs, size_t granule)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct iommu_group *group = dev->iommu_group;
+	struct iommu_domain *domain;
+	int ret;
+
+	if (!group)
+		return 0;
+
+	ret = iommu_deferred_attach(dev, iommu_get_domain_for_dev(dev));
+	if (ret)
+		return ret;
+
+	guard(mutex)(&group->mutex);
+	domain = group->domain;
+	if (!domain || domain->type == IOMMU_DOMAIN_IDENTITY)
+		return 0;
+
+	return iommu_dma_sw_msi_list(domain, desc, phys_addrs, nr_addrs, granule);
+}
 #endif /* CONFIG_IRQ_MSI_IOMMU */
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 95e32c78dcb7..cf33169ec3e3 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1560,12 +1560,21 @@ static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 #ifdef CONFIG_IRQ_MSI_IOMMU
 #ifdef CONFIG_IOMMU_API
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
+int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+			       unsigned int nr_addrs, size_t granule);
 #else
 static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
 					phys_addr_t msi_addr)
 {
 	return 0;
 }
+
+static inline int iommu_dma_prepare_msi_list(struct msi_desc *desc,
+					     const phys_addr_t *phys_addrs,
+					     unsigned int nr_addrs, size_t granule)
+{
+	return 0;
+}
 #endif /* CONFIG_IOMMU_API */
 #endif /* CONFIG_IRQ_MSI_IOMMU */
 
-- 
2.56.0

