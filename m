Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707394;
	b=kqkByJf6sX9m2evghUNFGxXtMn8dvAD9r1OvBmykZWGGBo3xcgg8R999Gngz+0iJCgoh
	 Gj+zQtscqG48aPOsp1jrIkWA2Mj8t4NZgdBeHoGOfHrEVg2DJ5OA9F2L8nlhhOd3uI85l
	 Li3CxI4u9C26YyXQsaA5Rly7FgfnUavaujyKUkPCdjmHSEhKMvVvwk33QIxCxk5zGW1mk
	 kGyQxFv6xKDArnd5YMPCn+j7zSzsKqtZVJBpYpZeqK3B3Ca3+ZBas2wjQaWQejW3wosFn
	 a8CqRwemSdZ4CcoaFnP4Sn83q2EWj4o8PIJvbYY/RIgDxCFFfUPhGnAL6K29RRN9TYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707394;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xlF7/hGIswlwuTf/3O82iPGkmbuNXFeLHRTd6Q4CK+Q=;
	b=konHYezHqJXlY/TfvsB6TU7p/JKgaNaaYiPW+bEwJJmEl72Gur3uM0E0xS2Xuxgtp0va
	 CbabsDUV7lzerNtg2cCr3GoK7UqCrdGc46VgerMtvg+QrqaAcOQYVi9MHAA12GasjBJRT
	 aJOc44/83SSvnffuQAHqbi5D30PQOVZPwEBhO3bgS1Jit9W9FMrTGWKIbe3hdYMLFPEho
	 uVfB1ZXm9da+h3/p3KZr6ZqYgYcYUVlC9ImFvcoPvX8bz55iJz9238L3DUVl9yubGbkYL
	 I+beRCjpHIeN2RDSZL2UIJxz+uSlreyiR5RfyuVSw1TXtE1AhdaCjeZZMtLT2WHz6Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fIBq5fQi;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D18606D80A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D18606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fIBq5fQi
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793707383; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=xlF7/hGIswlwuTf/3O82iPGkmbuNXFeLHRTd6Q4CK+Q=;
	b=fIBq5fQiZ694HmPvJhSytUPR43+fn38KaMNpTow1+J2hYtjAM8Fu8kshA4oWoiT6VD8gQKOo1FlnFgWPcVPsD1qiVPf56pIU/JNgvmOvbJ/gVy4N8QSD5JSDYLyU+E46fd1gPQuO13j9SbwxT3iK/s7+Ocr51paX7q8F3nID7VI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XE2qGxt_1793707379;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE2qGxt_1793707379 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 20:03:00 +0800
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
Subject: [PATCH v7 01/10] iommu/generic_pt: Fix the RISC-V supported feature mask
Date: Tue,  3 Nov 2026 20:02:27 +0800
Message-Id: <20261103120236.53474-2-fangyu.yu@linux.alibaba.com>
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

The RISC-V format advertises Svpbmt to its users, but omits the feature
from PT_SUPPORTED_FEATURES. Add it there so configurations which enable
Svpbmt pass generic page-table feature validation.

Fixes: f196a8668797 ("iommu/riscv: Advertise Svpbmt support to generic page table")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
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

