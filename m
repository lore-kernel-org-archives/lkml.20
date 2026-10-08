Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB33845D3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468029; cv=none; b=ReQqbyar3g2DDf9zlqXwfPaJ9VyoHZ8UK2WXkPLJpv0wfNGGG2dq+rKRErIy70DHQiRl1tKxxbH7ww//1O0q9bn4PKMn9Ybsyr6yg+ZXpPSjf5bdtMRMk80zfpksj783EJjF4LwPMZ9p7JtE6TEOgpMm7vORZ5QY+pa3vfasjeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468029; c=relaxed/simple;
	bh=YcTFBMF5405zHvXZs5rcQ1hld8VHNg7yd1/qBE+KnuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m/qJDYAkrdfR3rFnmtEhBr0gwF76VVsB03I/Rv+YpwTsfmk4agBIEqNPYzGcaeo1XZBIqQWbjIjqBhEJUlH5Rc8Zd4FwFgxmKMP9okClcYML/euCzF0S+Bg9tZB6iYm0ShfMZw8AUVxNr4OkMAaNLXtyHY6LCUsGgMHlr04dQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cKL3abdE; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cKL3abdE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791468025; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=FBuc6cEA3FSukWGLiG7pSKsJM1xn0XaUlxaBeMxT7xM=;
	b=cKL3abdEywlfKp/0+w5R/4UZhB+wxxPn9EA3RgufStzZtv4iN5uMrmrX/VSI2m7obxbGp5RLJwbxRH8uTqq4uCOLWWD1Y4rHeEE6XhqL9wxG++/8HuGdCyGBx+9U4rXGaXF8YmL1fB2SPZTgBuLHSEA+hBg/TKy5Vzv+fbGJhfw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCQTvmE_1791468022;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCQTvmE_1791468022 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 22:00:23 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	jgg@nvidia.com,
	jgg@ziepe.ca
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH 2/3] iommu/riscv: Extract IRQ forwarding payload validation
Date: Thu,  8 Oct 2026 22:00:00 +0800
Message-Id: <20261008140001.94508-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
References: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Move the owner and MSI address mask/pattern checks from
riscv_iommu_ir_activate() into a separate helper so a second forwarding
backend can validate the same fields. No functional change.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-ir.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index b3f0a56475ed..b96baff9986d 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -104,15 +104,10 @@ static void riscv_iommu_ir_set_target(struct riscv_iommu_msipte *msipte,
 	}
 }
 
-static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
-				   struct riscv_iommu_device *iommu,
-				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+static int riscv_iommu_ir_validate_vcpu_info(const struct riscv_iommu_ir_vcpu_info *vcpu_info)
 {
 	u64 pattern = vcpu_info->msi_addr_pattern;
 	u64 mask = vcpu_info->msi_addr_mask;
-	u64 required_caps = 0;
-	size_t nr_ptes;
-	int ret;
 
 	if (!vcpu_info->owner || (pattern & mask) ||
 	    ((pattern | mask) & ~RISCV_IOMMU_DC_MSI_ADDR_MASK))
@@ -129,6 +124,21 @@ static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
 			return -EINVAL;
 	}
 
+	return 0;
+}
+
+static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
+				   struct riscv_iommu_device *iommu,
+				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	u64 required_caps = 0;
+	size_t nr_ptes;
+	int ret;
+
+	ret = riscv_iommu_ir_validate_vcpu_info(vcpu_info);
+	if (ret)
+		return ret;
+
 	nr_ptes = riscv_iommu_ir_nr_ptes(vcpu_info);
 
 	ret = riscv_iommu_ir_validate_targets(vcpu_info, nr_ptes, &required_caps);
-- 
2.50.1

