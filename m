Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439CE3E764F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027066; cv=none; b=CZGhWgyFjuzr6n1/zpQ++gmR9F3uhD2YrnWqCNRhQb7xBDgqeheR5Xiaw3OOo2D2xAc59ZU5b56w7aYQLcDM5nKllV0hfw/zN+Lha3I7BonlvV1hMLjKOuUp0SCDJqxDAFlel9Pe7k+Xrfq7NLjpt5pRwLNJEVE3BBpycIxJx+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027066; c=relaxed/simple;
	bh=StMAaNNs6oTT3icJP4xELy0EM0US5X2YLdpCggVhdTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WWbSmkpIRNvFhAdKGYuzjqRAvCa1+VHLjR/fgVTJmLqX7s9IGEyOvLtItN2ug0aPTtdE9ZCto5IwxN7BtNpJRW/FrAHI09mqmQcrD6ZSg2lMcdLnK4lzK9xVdi/us7+DdTtXk/vTo7YRjSRyMBvgkRcIDyDilIUKTYJwMCw58RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=jULUdq+k; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="jULUdq+k"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5FBNG1603590;
	Thu, 10 Sep 2026 08:57:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=l
	N+OYqM7Kp3SsjoO8cdjpiRhKjZIX2Mvg4/42Y7xj2g=; b=jULUdq+k/j18LWcyz
	IopjYwCB1nuLvQRspIT0Ppp3b4AtWZWAIf9YnbvQ2wS3Zi4hHvhbtn3Jozkywtxw
	0zV2axpGp4MbBGcB0f17zJR+d76mcrLuPx9QIaQAYpub/L3yk3lmCebqIoFh71qv
	QhQ5eYtpAsQOM1895AlxZ4ycUG4DtT3AGQda+b5a1FSQ7QruP7uPsnpaz6cqQarE
	423LgMHAkfJsBB8y9uByODBdi/TYZzXk9GZKZHO9MLJu9/A7k4XDJe77lGcLXReQ
	JWfVaNooo4n2N2UPOnJjeUigbr8GOibAhTJHIkHvsGBYtBgnrs1Qdq+0G7B9kmR6
	5rRIg==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4gkk71r74n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 08:57:09 +0100 (BST)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 08:57:08 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Thu, 10 Sep 2026 10:56:39 +0300
Subject: [PATCH 1/2] drm/imagination: Collect KCCB initialisation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-1-7e10274384c2@imgtec.com>
References: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-0-7e10274384c2@imgtec.com>
In-Reply-To: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-0-7e10274384c2@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789027026; l=4496;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=4Ut+9qdkd5GUAlgvKUvpyrWnlIAOaxxKI+EcP7lQrQE=;
 b=JuWec9ArYloerjoazDE22UgHjWkbzEofWC6jsVkwee587gocKYZHEXDcRIhOy7KvfmxOuk0Iq
 ek2hzlrPYsHCCKCefR/3ib9AH/VGsotc2OsIF24tjrpBxZ4cPVoy62j
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4NyBTYWx0ZWRfX6vyppl21MGl3
 BH80UzdlLlPPmmzLIKgRzY+cxKVjAgXBiAj+YjNDoKdsVrzzXuCW1LzenTMzCht2dl1my2pkCEE
 hOfKfCMRG4ABQRO8+rF3vRdcvzF8bDs=
X-Proofpoint-ORIG-GUID: 1XmZQK3cZDTQQXuUBGZp1iZFzyYypw6T
X-Authority-Analysis: v=2.4 cv=IqGL47/g c=1 sm=1 tr=0 ts=6aa262d5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=OmXOsDClB9tmI1CndawA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 1XmZQK3cZDTQQXuUBGZp1iZFzyYypw6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4NyBTYWx0ZWRfX/32g93y0tMdY
 SnXhmhgBOQ4DYOV2ybaProdQeydFGYtur84uLXNGG4skie9Ybe3/GKsyELT3JN9nEiT25wpTLON
 dQd/gIu7eoamEVXjPoqmJk7ymh14Q8H7VlaZTfRuBoA3/9fUi5gNW/zBsxx/Ibpj0Pu3N8vQ6yP
 kX8s/F2bUfzOBd2n1JXak7PFNA24BqB316BGKPevVb7KufXUZWc73Lz+lcaUcGhbONQnfaPRJec
 oNSptfc1fTTo0cofaxA69dDqyW1bfzuGADL3Oj3k3RrlMLtSmqlzgQeMZNF9xwj8WpB3BeiNxFc
 u1v0ohlr5angl+nguHbV2j4ortGKpncGMEFLFQYtaJq4V4v7SxojiEkVglETJ/gYJ6bhMqrAeT3
 cmQ4pcYU8ADmSdfwIBuPsud+1PMjCJLlTJKSfgUx6G2w/QcM/mLCpAssmmhK2LVZal/Miogy1LC
 YEt1SOFCX01/3Nt3XhQ==

From: Matt Coster <matt.coster@imgtec.com>

There's one FW object attached to KCCB usage (the return buffer) that is
separately initialised in pvr_fw_init(). Move this initialisation to
pvr_kccb_init() alongside the initialisation of rest of the members of
struct pvr_device->kccb.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 38 +++++++++++++++++++++++++++++++----
 drivers/gpu/drm/imagination/pvr_fw.c  | 17 +---------------
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index b702d122d791..3b5942b674be 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -17,6 +17,7 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -527,6 +528,7 @@ void pvr_kccb_wake_up_waiters(struct pvr_device *pvr_dev)
  */
 void pvr_kccb_fini(struct pvr_device *pvr_dev)
 {
+	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
 	pvr_ccb_fini(&pvr_dev->kccb.ccb);
 	WARN_ON(!list_empty(&pvr_dev->kccb.waiters));
 	WARN_ON(pvr_dev->kccb.reserved_count);
@@ -543,14 +545,42 @@ void pvr_kccb_fini(struct pvr_device *pvr_dev)
 int
 pvr_kccb_init(struct pvr_device *pvr_dev)
 {
-	pvr_dev->kccb.slot_count = 1 << ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
+	const u32 num_slots_log2 = ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
+	const u32 num_slots = 1 << num_slots_log2;
+	u32 rtn_size;
+	int err;
+
+	/*
+	 * The inputs here are compile-time constants; there's no reason to try
+	 * to gracefully handle overflow at runtime.
+	 */
+	BUILD_BUG_ON(check_mul_overflow(num_slots, sizeof(*pvr_dev->kccb.rtn), &rtn_size));
+
+	pvr_dev->kccb.slot_count = num_slots;
 	INIT_LIST_HEAD(&pvr_dev->kccb.waiters);
 	pvr_dev->kccb.fence_ctx.id = dma_fence_context_alloc(1);
 	spin_lock_init(&pvr_dev->kccb.fence_ctx.lock);
 
-	return pvr_ccb_init(pvr_dev, &pvr_dev->kccb.ccb,
-			    ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT,
-			    sizeof(struct rogue_fwif_kccb_cmd));
+	err = pvr_ccb_init(pvr_dev, &pvr_dev->kccb.ccb, num_slots_log2,
+			   sizeof(struct rogue_fwif_kccb_cmd));
+	if (err)
+		return err;
+
+	/* Allocate memory for KCCB return slots. */
+	pvr_dev->kccb.rtn = pvr_fw_object_create_and_map(pvr_dev, rtn_size,
+							 PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							 NULL, NULL, &pvr_dev->kccb.rtn_obj);
+	if (IS_ERR(pvr_dev->kccb.rtn)) {
+		err = PTR_ERR(pvr_dev->kccb.rtn);
+		goto err_ccb_fini;
+	}
+
+	return 0;
+
+err_ccb_fini:
+	pvr_ccb_fini(&pvr_dev->kccb.ccb);
+
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 850a3ec8e775..cec17352cf90 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -945,8 +945,6 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 		[PVR_FW_PROCESSOR_TYPE_RISCV] = &pvr_fw_defs_riscv,
 	};
 
-	u32 kccb_size_log2 = ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
-	u32 kccb_rtn_size = (1 << kccb_size_log2) * sizeof(*pvr_dev->kccb.rtn);
 	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
 	int err;
 
@@ -981,18 +979,9 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 	if (err)
 		goto err_kccb_fini;
 
-	/* Allocate memory for KCCB return slots. */
-	pvr_dev->kccb.rtn = pvr_fw_object_create_and_map(pvr_dev, kccb_rtn_size,
-							 PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
-							 NULL, NULL, &pvr_dev->kccb.rtn_obj);
-	if (IS_ERR(pvr_dev->kccb.rtn)) {
-		err = PTR_ERR(pvr_dev->kccb.rtn);
-		goto err_fwccb_fini;
-	}
-
 	err = pvr_fw_create_structures(pvr_dev);
 	if (err)
-		goto err_kccb_rtn_release;
+		goto err_fwccb_fini;
 
 	err = pvr_fw_start(pvr_dev);
 	if (err)
@@ -1014,9 +1003,6 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 err_destroy_structures:
 	pvr_fw_destroy_structures(pvr_dev);
 
-err_kccb_rtn_release:
-	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
-
 err_fwccb_fini:
 	pvr_ccb_fini(&pvr_dev->fwccb);
 
@@ -1047,7 +1033,6 @@ pvr_fw_fini(struct pvr_device *pvr_dev)
 	WRITE_ONCE(fw_dev->initialised, false);
 
 	pvr_fw_destroy_structures(pvr_dev);
-	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
 
 	/*
 	 * Ensure FWCCB worker has finished executing before destroying FWCCB. The IRQ handler has

-- 
2.43.0

