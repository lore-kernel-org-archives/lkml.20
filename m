Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489309;
	b=0RgTMaEOA6+deJFCC6QpyU4e4b5L+AC6HcUqxYIBLpZ6d5u/ol0Wpvt8GdtcJPF6Qpz6
	 vJg4uxl4NdLLGz2xGcy/mBzePMFf9qZ77kdtVzlviCNwl9xE7XKDPTest5A1a0dhseWfT
	 K4cRZi2jlIZFIgvBQsYiEFqHq/dpVBTMdsiNjRJt/z3RBAq04bAK/cCUB3488VheUDM6H
	 2gmzKnNSCIXtSePMBwXGAk+gIyMlpObLpmeCGyORg5RMcQzHFuzOk1dP6XuyaUGMbpLdu
	 wcwHNwujIujQrq6/iMQY2CUnrHu5nbXguL9y+PVhtb1D/tCg336AiGSy0GdQc/Ew0KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489309;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m4AFHwfD1n7+MjIFKPn07bPGFTJ0v3hSm0zgGLTdWXM=;
	b=YJE0uv5g2sRj5HT8uy7d5GnZDf5AB64FTW3zbx79jvmPFJoXCisBBrylxF57bOb2HnO4
	 AfOCWfzo3SF1/wGlTF1mXCrYLRxutMdw68l1f1PrqN4PrvxNZ7K2jWO2U1quhKUspNkbY
	 gwzg9ngQ+4Y+MBO0HoN145t4HSfroHx8BGKSIDNajrgV7atdyyb2OD3BOFexVNgD52gFs
	 4DTsHD4vSb6Icv/GCDDuTUh4Xi9DS0j2tsCatvSo7JySEerl0uK4m4mO/oa0+dWVh+0N4
	 3iGP1nczEo0U3AYpZpubF+ngYIvlPqH/0/xjLLICU6/2qKEddFl6+dINlZ6B+ld3C7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cK1kfDhp;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473F60A2628
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A473F60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cK1kfDhp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792489306; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=m4AFHwfD1n7+MjIFKPn07bPGFTJ0v3hSm0zgGLTdWXM=;
	b=cK1kfDhpB4dIyJ7pkjZPAfyYpUMxnAH4O0r10Xv5Zq6yUej0e3a3KLwxiGd/qeDvaPHwbJZPDowr9iaDy9LmaSso6HAVz0arFiayouKi1FgJDBx+gZnj7QD7rDfxGQUHL9nL1QDVFYRA4nFCol93XGQNEN69RcVt/4CPa11m6jQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDCspe8_1792489300;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDCspe8_1792489300 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 17:41:43 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v5 08/10] iommu/riscv: Pre-enable GADE for second-stage domains
Date: Tue, 20 Oct 2026 17:41:04 +0800
Message-Id: <20261020094106.92722-9-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
References: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
attaching a second-stage domain, if the IOMMU supports AMO_HWAD.

Software pre-populates second-stage page tables with D set, so
enabling GADE by default does not change normal behavior. When
dirty tracking is enabled, iommufd clears the pre-set D bits and
GADE becomes necessary for hardware to update the dirty bit on
write access.

This avoids toggling GADE dynamically and keeps device context
setup consistent with second-stage domain attachment.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index debce1b4201c..9310b818c038 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1236,6 +1236,8 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		tc = READ_ONCE(dc->tc);
+		tc &= ~RISCV_IOMMU_DC_TC_GADE;
+		tc |= new_dc->tc & RISCV_IOMMU_DC_TC_GADE;
 		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
 
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
@@ -1352,6 +1354,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+			dc.tc |= RISCV_IOMMU_DC_TC_GADE;
 	} else {
 		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
 			return -ENODEV;
-- 
2.50.1

