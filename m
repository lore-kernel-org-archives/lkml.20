Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707404;
	b=2BGFYzoLbqd135okgBD/3X1jWbIEJc6L+C3b9mDq25y264+/igDO6mlSvJyYySi+j1Yc
	 +EUxsJRjU3c604BG62rj0FgyjEeAwyIe8YB2F9XofcS5t9aqyVsv4QjvYTiN1r8nO+9C9
	 gx+bbjBwKsAf7FWRkJ7aLWOfDzQHk3bCAgHjwK/wR/Wk8ozHngxckpHCyyVGsjtKRDwFy
	 FRSLHk0HjDUtRMYixH4nb3TJsBp1Xqajp4Cb5/GEd5gPjiMIQBGSWvJ9xjeq8wM2D9mXj
	 mqxh45qRbFWoCAObiKVndIsCDB2KETy/WWpXcV6HfXvakL6f1G0mmU0n+wI4N9oFDIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707404;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t9ZdttmxTTzyTA02OlIetAwu+qNEnsR0wZystUGmJGM=;
	b=3KKERsvbQ3FWC3VegxL8tpnZHJZAUMHxi+HamTYLEVKGYKeS/21h6zBRLBT3xdmLiZBd
	 RqDh7+G+cgYcZ34+gCQLwnc7q2hfgNYl3N49W330c5cpRj8h2w76kOKnf7quOjTX4ByDH
	 9gcWwm6dEuh28x3eDueJoa5OOBcnbgL/xuThFZvjhWRHJEYP+0zDYEAMykjVdLuuVRcrh
	 woYhUorsTZktZUy3Y+yO9uU4ZFWZX5gi49iCW3kwELWg9SrYHVekVMwiBRY/Kim1O2M54
	 Z9kmqGKIYwh4dOjRzwYBEjzcq0DXGmhwOpQKHbNtl7Kt6jAzF33BhkDQt6ohchY+eog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rCeFspBs;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB8606EEA6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDB8606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rCeFspBs
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793707400; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=t9ZdttmxTTzyTA02OlIetAwu+qNEnsR0wZystUGmJGM=;
	b=rCeFspBsM45tfyRsq93eIs+YHgLVf3425q8EfvYUVDxJQVAXqWesaqeVgbB4yQZNPmm4KDgiuPQpx4ixOWm/zwF9HCYao/SvFCnE5odRxsUiLnoFpiBPG0UYFmWbsubaw2a1yylGt5dWf1CbnwKVjeGjAHSOwEGgrhKbHAnGECs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XE2qH05_1793707396;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE2qH05_1793707396 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 20:03:17 +0800
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
	kvm-riscv@lists.infradead.org,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v7 09/10] iommu/riscv: Add dirty tracking support for second-stage domains
Date: Tue,  3 Nov 2026 20:02:35 +0800
Message-Id: <20261103120236.53474-10-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
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

Add hardware dirty tracking support for second-stage (iohgatp) domains
used in KVM VFIO device pass-through.

The RISC-V IOMMU can automatically set the dirty bit in PTEs on write
access when DC.tc.GADE is set and the hardware has AMO_HWAD capability.
Wire this up to the iommufd dirty tracking interface:

  - riscv_iommu_set_dirty_tracking(): Return success without toggling GADE.

  - riscv_iommu_dirty_ops: Exposes set_dirty_tracking and the generic
    page-table read_and_clear_dirty via IOMMU_PT_DIRTY_OPS(riscv_64).

  - domain_alloc_paging_flags: Assigns dirty_ops to second-stage domains
    when IOMMU_HWPT_ALLOC_DIRTY_TRACKING is requested.

  - riscv_iommu_capable: Reports IOMMU_CAP_DIRTY_TRACKING when
    AMO_HWAD is present.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/riscv/iommu.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index b3f05dfdf278..ff1043afe973 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1350,6 +1350,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	if (domain->gscid) {
 		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
 			return -EINVAL;
+		/* Dirty tracking requires AMO_HWAD on every attached IOMMU */
+		if (iommu_domain->dirty_ops &&
+		    !(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD))
+			return -EINVAL;
 
 		dc.iohgatp =
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
@@ -1377,6 +1381,21 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	return 0;
 }
 
+static int riscv_iommu_set_dirty_tracking(struct iommu_domain *iommu_domain,
+					  bool enable)
+{
+	/*
+	 * Always enabled and the dirty bitmap is cleared prior to
+	 * set_dirty_tracking().
+	 */
+	return 0;
+}
+
+static const struct iommu_dirty_ops riscv_iommu_dirty_ops = {
+	IOMMU_PT_DIRTY_OPS(riscv_64),
+	.set_dirty_tracking = riscv_iommu_set_dirty_tracking,
+};
+
 static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
 	IOMMU_PT_DOMAIN_OPS(riscv_64),
 	.attach_dev = riscv_iommu_attach_paging_domain,
@@ -1418,7 +1437,8 @@ static int riscv_iommu_init_domain_s1(struct device *dev,
  */
 static int riscv_iommu_init_domain_s2(struct device *dev,
 				      struct riscv_iommu_domain *domain,
-				      struct pt_iommu_riscv_64_cfg *cfg)
+				      struct pt_iommu_riscv_64_cfg *cfg,
+				      u32 flags)
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 
@@ -1439,6 +1459,10 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
 	if (domain->gscid < 0)
 		return -ENOMEM;
 
+	/* AMO_HWAD is checked by iommufd via IOMMU_CAP_DIRTY_TRACKING */
+	if (flags & IOMMU_HWPT_ALLOC_DIRTY_TRACKING)
+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
+
 	return 0;
 }
 
@@ -1481,7 +1505,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	case IOMMU_HWPT_ALLOC_NEST_PARENT:
 	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING:
 	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING | IOMMU_HWPT_ALLOC_NEST_PARENT:
-		ret = riscv_iommu_init_domain_s2(dev, domain, &cfg);
+		ret = riscv_iommu_init_domain_s2(dev, domain, &cfg, flags);
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -1559,9 +1583,13 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 
 static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
 {
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
 	switch (cap) {
 	case IOMMU_CAP_CACHE_COHERENCY:
 		return dev_is_dma_coherent(dev);
+	case IOMMU_CAP_DIRTY_TRACKING:
+		return !!(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD);
 	default:
 		return false;
 	}
-- 
2.50.1

