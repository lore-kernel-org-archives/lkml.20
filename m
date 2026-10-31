Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435448;
	b=KZHXgSTbmmcrhkkp1MAO+izM2NmZfiBOstiYQWkPlD/jumlkm4EFt+Hc8tzvvTZKVB1B
	 gry6QQFe39WtaCkQDkVw6Zu9sXc3s/Mt6bDwr1xHfKU1w6DEfy9SlIMimMrXjaP4aVzKR
	 PPJoP4hF3vJff/WymGUiQMyVsBepsl1kKphrQm6uq4dhNINHDho74bQpeK9fy2Ka5tzaE
	 WIxHMNTaWwCKN0rywdBHrfZtyoiSk8VJQ/V4owJKeiqLIj0qGEPg1uh/Q0UHpvLRrlngA
	 TJoqTD3RwjDwiRHAWPOuFgiU4JNMiDwolCIq9ZxZYrpgkSXb7zllKSL/uGF6nEvJoGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435448;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1K/Vowlo+xLPaio3Jk6Q9KwLaBs+LCOL/xShoIQRuLE=;
	b=kesJD/1yUnmJ0ol8bFqKuoqeItQRBYjGSoQREdAvvDT+TgIDWoM/h98nSc826301xPlh
	 wTzla939Bu5ms41K87Z23XACSQHsmclsE6/N6Ly8Fg3GMUEv3vwGxpS4m4EWP8e1ZKTvJ
	 tK94XO0Qgh5KcpAgSYKZGCnm9g685twUZXHgR+Kz222DDdmcGPLLKToHBf8rRxFKD90lE
	 qgETrj55A74wLQ+j7YRM8iEOzmzy7SxnXpyDGCYAiQubwniK9BkUD4yEPMIG0twsraT4G
	 EnOvJ4EqeysL7k9bqMbw5F6aPer/PzLvmG8HBZ1OiF3WsCGiQbjpQQM2gQrxvRVybIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ezils7yp;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C39606A333
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C39606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ezils7yp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435439; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1K/Vowlo+xLPaio3Jk6Q9KwLaBs+LCOL/xShoIQRuLE=;
	b=ezils7yprr96FZokuFUNgAMiuI+NVr71ahsE/pXG0BmfraMuVtQmqkU2yCvbqc1KyJIaukwJicwM5uxOwKFMy+mHeO/dojDmOIvDeCXiIHGF7ngrfAQkzyskY4CtXNllpPACzUCVZA1TG8luxPCsdKyyOHsioXp/3mX/eIScNzs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XDo-2oZ_1793435435;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2oZ_1793435435 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:36 +0800
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
Subject: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for second-stage domains
Date: Sat, 31 Oct 2026 16:30:13 +0800
Message-Id: <20261031083014.15040-10-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
References: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
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

  - riscv_iommu_set_dirty_tracking(): Always enabled dirty tracking for
    second-stage domain.

  - riscv_iommu_dirty_ops: Exposes set_dirty_tracking and the generic
    page-table read_and_clear_dirty via IOMMU_PT_DIRTY_OPS(riscv_64).

  - domain_alloc_paging_flags: Assigns dirty_ops to second-stage domains
    when AMO_HWAD is advertised in hardware capabilities.

  - riscv_iommu_capable: Reports IOMMU_CAP_DIRTY_TRACKING when
    AMO_HWAD is present.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/riscv/iommu.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index fc7a80393833..9f572baeca74 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1377,6 +1377,21 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
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
@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
 	if (domain->gscid < 0)
 		return -ENOMEM;
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
+
 	return 0;
 }
 
@@ -1559,9 +1577,13 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 
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

