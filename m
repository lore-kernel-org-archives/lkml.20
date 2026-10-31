Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435450;
	b=mmF7JNR7dkrCWvIxzHtgT6/gOrRSnHgbOAfTN96vFP1UcjlEC/Yole/pexYL5Zj97Q+3
	 H+S3QFrnituGhDmqSOGldmmJI7trLn5r2EFUPFtYfUqB92maRCYSNdpGAemrfV9Dzdqro
	 jz+ZbV85IA0TaVK1lffdKLGA6IyNpayhvuOIvDiw01uSk/bi3q5jUC5cMWSdQBWs/PLXz
	 WzZA+P2/+vmhU2kluUHdenEZYNMvHSCD+FNgafryk7RRh/Tq39sIoyXmh7CHfvO8Q3aDO
	 d9FL/sfl+mn00Jb8HjiIUbPnK78rWt/NjV5YkMvnEu/u2Fz74u515/ebORA7Ootd3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435450;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=57eOqBZzxslFG3511fl8N/Q8eICKpPDwxcb18ps4Eg4=;
	b=s17V79SPqgeOPKlQPBu+3NVktIAL7AEu9X/TOMrg9HeeNq9uQH7tcOMqWJETR54BhzEG
	 sbXkFB5nDM9djoXsrBGASJtVuqLEn/dPR6h+zIlvTYGB2P5aTZWCGZ7oKv2iVeNuKX3xl
	 bjrnOt0AHi43nUlOvhc7w8+I+DJYYC7qCMwoWdKq6XFwr21T/tRtnr++vPpO72/ZL/zbv
	 4mGl6cXTPfbA8vdkWCKJaRs0HJVcOmmO/JdiU9c5K9ikUpmtZf88JuRZoODQ3T1Ly9qPA
	 Q64cKT0X/ORVlhaXkGo+nQuLk58SKYuQLpVrRKdXjEjbrgWzIPIiv3u3uxMJM+qF09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NrluZY4o;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F260A2612
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009F260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NrluZY4o
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435441; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=57eOqBZzxslFG3511fl8N/Q8eICKpPDwxcb18ps4Eg4=;
	b=NrluZY4ojGVfL8C6N1qWbuBwbjgfKY7k4Pgk2SDpZ0Qs730Ypgjwlc7zZ+kFE2tZupEGXgkdYIKxURbunNcnuweYK1SeqmnRcF/izSoxen7amkvfLFD9/YTrc4/sp+1C4FiKE2adf/mWYF0XtlvDOtVCui/U01J1CVrBcOLwtTg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XDo-2pB_1793435436;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2pB_1793435436 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:38 +0800
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
Subject: [PATCH v6 10/10] iommu/riscv: Add IOTINVAL.GVMA invalidations
Date: Sat, 31 Oct 2026 16:30:14 +0800
Message-Id: <20261031083014.15040-11-fangyu.yu@linux.alibaba.com>
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

Previously, only IOTINVAL.VMA was issued, which is insufficient for
second-stage address translation consistency.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/riscv/iommu.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 9f572baeca74..899b9872ca56 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -831,6 +831,15 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
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
 
@@ -1176,12 +1185,15 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
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

