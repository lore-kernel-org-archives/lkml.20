Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489314;
	b=b+ZZ+5ThSlaxG5Sm2MtSNvd18QPJoy0cfSCBWQva55HIY9+6zqGIjYRmQq+CzYU5rRQa
	 O4Cy/IIeCD2HWo0tvfPsQpLJtLtONMFER/wLmIlnV0BbN2wWOXsPlbRZO59rL/Ic1HFdw
	 7tnOHzuTirz3Y72Qd3Y+pajACEYMNKJfPcoV7ku22l5/pXzX/JoyB/V2Jcz2lOo99tAI+
	 6ZuuN5WnEY0Vq+nyIg2o/JBjG6XNmuEB5GSWH+MPPaYI09+ilKzpLcaYZkpA6Z6pfFQhw
	 hFko0k6jRtG0E9A5bOri5qQpBquhqIOakIFX1nFWSuVwZECTW1/p7JFCDuWBWgj1xYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489314;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sApxe0kej5AMvFjUhFTHU6ozNHX+GiLdwcc2SeFwNCU=;
	b=Jl/CnF+GJfffShzP7RhD3CIlHlbm6X8Yy3dT+BM/9Th3I6goYeOmR+HAOjfG/bGB6hMe
	 Pl8WsEnE7eSoUvgrDpVe82qyqBVvU3ucn5bcZr7Xj5h9Zu72l94Lw7tmm+ZzOmDp3AKZb
	 LQMUAPFBSlJ1nSeYT/c4wLBvVBVsQ62Yd+8rDgoSMjiu1AfAwYSjVhfLeXTGz7iToSnQg
	 W46nyo8uAUKYdAm5qU818ziW6UAEOGObNrWqt5JKVdQIqzPGrMbMPzNTSWGEU01LAc4cA
	 JtNyMFI3FlOsz9lAR0gjxtcz+qml/yjavxq5MScWfqWx531krIt+L5HcgTLMosLteVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=T76tI2SY;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157C60A6F57
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D157C60A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=T76tI2SY
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792489312; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=sApxe0kej5AMvFjUhFTHU6ozNHX+GiLdwcc2SeFwNCU=;
	b=T76tI2SYspGBZVeAa3nZOaYhRm3kFv1y1EZDN64dyL7xjqnHU7SVKR2wepHLMwjZChLVJNlCj2ad+3/0l7yqUYrjifhsT8NbeJHQIsIse7DxWDks0ZV7KloaBq/jn8pacFQIcxP2xrSfdGPFzDWnDGShF29K/kebXy4FuGHoFbI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDCspg5_1792489306;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDCspg5_1792489306 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 17:41:49 +0800
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
Subject: [RFC PATCH v5 10/10] iommu/riscv: Add IOTINVAL.GVMA invalidations
Date: Tue, 20 Oct 2026 17:41:06 +0800
Message-Id: <20261020094106.92722-11-fangyu.yu@linux.alibaba.com>
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

Previously, only IOTINVAL.VMA was issued, which is insufficient for
second-stage address translation consistency.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e3791e912af3..a764a172c588 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -830,6 +830,15 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	riscv_iommu_cmd_inval_vma(&cmd);
 	riscv_iommu_cmd_send(iommu, &cmd);
 
+	/*
+	 * Per the RISC-V IOMMU spec (sec. 5.5), the IOMMU may retain
+	 * cached translations across mode switches. IOTINVAL.VMA only
+	 * covers first-stage leaf PTEs, so use a global IOTINVAL.GVMA
+	 * to flush stale second-stage translations.
+	 */
+	riscv_iommu_cmd_inval_gvma(&cmd);
+	riscv_iommu_cmd_send(iommu, &cmd);
+
 	/* IOFENCE.C */
 	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 
@@ -1175,12 +1184,15 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
 		/*
 		 * else: IOTINVAL.VMA with GV=1,AV=PSCV=0,and
 		 * GSCID=DC.iohgatp.GSCID
-		 *
+		 */
+		riscv_iommu_cmd_send(iommu, &cmd);
+		/*
 		 * IOTINVAL.GVMA with GV=1,AV=0,and
 		 * GSCID=DC.iohgatp.GSCID
-		 * TODO: For now, the Second-Stage feature have not yet been merged,
-		 * also issue IOTINVAL.GVMA once second-stage support is merged.
 		 */
+		riscv_iommu_cmd_inval_gvma(&cmd);
+		riscv_iommu_cmd_inval_set_gscid(&cmd,
+			FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
 	}
 	riscv_iommu_cmd_send(iommu, &cmd);
 }
-- 
2.50.1

