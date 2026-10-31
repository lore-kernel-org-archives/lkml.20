Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435434;
	b=bJIl9se6njrJEEn9NQ1ip3d3yQg3W7FEKx028WwqxWi6y0QePXTXrGZN7BCmWiSQ5r5h
	 J8fjP+ehcDUKM/Fw1R6QH4XzJoDXBgdRdGpu+gEj/xhS52dW6JHbCLg5G7TdmxVOnl0gM
	 U9fjpHtTvucZcxfqB8vCsjKOglZoXyE1ht0bD3aWGX6vdKU+fH5LlYtrF745Mn5LTKhS4
	 NfyVCDoo3TRG7jzCPMu2IDfHeL3mp7YwoQ2C/Heo/PZldhAWsS5zzEL958yoQJ5NFyr9f
	 3Ng3+ySBMCs/v/rt1QqEE9WY3oSzGieWcwOcJYXgvWW7AL7YKKFDVYDolPaT8DuwQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435434;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JvLg4S5shvS7IVAuk/ea4lw7Xa2XcuYDCBZ9VnAd86s=;
	b=EZATE0UUv+O7qpHx80Yh6lOeEeUpUuYoiIrGRCFmqz3wO6VdMcrX42dM4oBXi157Z3mZ
	 YNExp594ruAaK7ZoFvT0o1qxGjL0k1ugtIfLNLRhhxeI8GPvmzkH1VVlUEhp6LheGkHcE
	 WeXxQGZin8Dpo5VVVJ4IOUvRw28TWlKa9PVKMCOs6OoaS9G4QG6OVY6sOFiLmL9JFZ6um
	 CIrktBenDqFYNEgeNsbrwIarygfmaSQzkwbH1oPQp7NsMJ4e/XQF4IzWUETSaupGx5HiH
	 58hxxvUPwjHbgaohjU0y8SH8QdFL3i5+w0b6M68cDnzKASAhnZLnt2A05Aq+SilB2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ASkfGAkC;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4203F606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4203F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ASkfGAkC
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435424; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=JvLg4S5shvS7IVAuk/ea4lw7Xa2XcuYDCBZ9VnAd86s=;
	b=ASkfGAkC6YBnQu5VwhVqZudG4dfsUdRCk72DVXcyVmdcmKqAjG+y16eyMZkzNKjZ1Mk+u9hTu1+qDW6iOTa700tnRiFPWoRt34xnIpxd/1wieC/OPAqK1RkLd3xll5fCM9NoagN0eN/lgzF07rHuZVAn8q4/zdHRX5P8o3+j84w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XDo-2im_1793435420;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2im_1793435420 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:21 +0800
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
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 01/10] iommu/generic_pt: Fix the RISC-V supported feature mask
Date: Sat, 31 Oct 2026 16:30:05 +0800
Message-Id: <20261031083014.15040-2-fangyu.yu@linux.alibaba.com>
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

The RISC-V format advertises Svpbmt to its users, but omits the feature
from PT_SUPPORTED_FEATURES. Add it there so configurations which enable
Svpbmt pass generic page-table feature validation.

Fixes: f196a8668797 ("iommu/riscv: Advertise Svpbmt support to generic page table")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/generic_pt/fmt/iommu_riscv64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
index b18fc4d109f5..1bb74114fb02 100644
--- a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
+++ b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
@@ -7,7 +7,8 @@
 #define PT_SUPPORTED_FEATURES                                  \
 	(BIT(PT_FEAT_SIGN_EXTEND) | BIT(PT_FEAT_FLUSH_RANGE) | \
 	 BIT(PT_FEAT_RISCV_SVNAPOT_64K) |                      \
-	 BIT(PT_FEAT_DETAILED_GATHER))
+	 BIT(PT_FEAT_DETAILED_GATHER) |                        \
+	 BIT(PT_FEAT_RISCV_SVPBMT))
 #define PT_FORCE_ENABLED_FEATURES BIT(PT_FEAT_DETAILED_GATHER)
 
 #include "iommu_template.h"
-- 
2.50.1

