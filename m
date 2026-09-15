Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A041A35F5ED
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457536; cv=none; b=T0ouc7WoXMNiIHrS36iN5rNT3/QXGMqg48XlHpj0MDv/5kYBIzC4dUBeBsciENrw7aBZ3FrXFc3gFwaO7eRM5YnjqJCXLpevBZnpUtzJovk38A55lbiHZTzysPj3bW2v22HvL/GtufBV4yXUL73U+UIAGyyPTFladg6Ajuw5AnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457536; c=relaxed/simple;
	bh=w35L/X/yrp6/Nv+rbNSDZHE7P3jG6pNoKNEPEFxbflM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=bt4XHNlGdvH15TrtkDImt26Dt31Qm2YOAuFuaqiHU0eP972JYIAVEei5ZiDYkPVYBN+UQHAvmkc9ycXHq+BWUx20s1jg3yZEJcG3IyHKFD6ay+RetcnmlwJSQ4RYAtuVhe66vGMXMjMRww0kEtIXJ6lg+df9ig80DE+9pGqugB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=M4tlVxKg; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="M4tlVxKg"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F7SBYc3263595;
	Tue, 15 Sep 2026 08:30:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=fRNJt0AS2s0bmHy9+1Wpf3w
	aF0oHCu+6NWprJ5UDI9g=; b=M4tlVxKggabXNxLJEmuozYXD0dS5639D+sh4Qg2
	/M1HnAUm/7qlTNzVL1xfA/1wqFY6wqwO4epmIm76LPhuy4+wCIcTD6WZ+z6Q+uUM
	HXziUvoaPatfffAinh9Q++n84ILd3rUnAG2+ZKvAZ6hnyULHow3o3+qJkUq2nXWx
	6/bLVfRznV/aymwMJjEy1ORqY673XIaTolETmqrqsMXDQlSPjvvszd27UpiipPz8
	EKXuXa30PWXpwNxEQvcsAnbbcXnnnx6EnH5IpUcIspcyJi8HgQXfr59JZQrI1WAd
	ix19OfBL+ODGkShOSymIGCZnV/3DfBAj93e2iGOGkQPLwOw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gmw0q23c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 08:30:52 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.88) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 08:30:50 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 15 Sep 2026 10:30:42 +0300
Subject: [PATCH v2] drm/imagination: Manage FW VM context from its init and
 fini callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260915-b4-upstream-manage-fw-vm-context-from-init-and-fini-v2-1-c9cb43667143@imgtec.com>
X-B4-Tracking: v=1; b=H4sIACH0qGoC/6WOQQ7CIBBFr2JYOwZQibryHsYFnQ46JkADFDVN7
 y7VI7j7L3n5/08iU2LK4rSaRKLKmWNooNcrgXcbbgTcNxZaaiMPSkK3g3HIJZH14G2wzXBPqB4
 whkKvAi5FDxy4gA09uJZAHffY91IhGila85DI8eu7ern+OI/dg7AsU4tx51xien9vVbV4/z2oC
 hRoNFofaWtoT2f2t0K4wejFdZ7nDzb1LVcJAQAA
X-Change-ID: 20260810-b4-upstream-manage-fw-vm-context-from-init-and-fini-195cdd01cc60
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        "Brajesh
 Gupta" <brajesh.gupta@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789457450; l=6458;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=wis1y2leDS3yLg78oRg2pViZyXbUSkczoiYkjBNdENU=;
 b=uKMPHLS0DyWAz5sBn3Ur6J7h/GTqgU/aek84HhzqyGcmoLZhHzpIOmeg22jG2akvZvsl7JTae
 rK5kLJKHAHTAZpP6xAKe3OaJSU/mnDeGGTLip6JxFhzNNAOrX9FJMFt
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNiBTYWx0ZWRfX8smui4uzZAsh
 IXMNLx7ht0XGznm68tTK2Vve5l3My+fvIpGUx4RexBB5QdgeFks5kGD1qUQps/ZPifRDiagbn9d
 8uz/AkUFyBVHVaotlOQduJCV/K2hcaTYLJF/Jnwk1Itxlwpne3eKszKXPwuAP1gkYY4k/DUL7Jo
 CMN3dWmdmG58kGNraKCgYFW9PICk5wmTPQbyJRqohl+JswMWZcheWNtZ3xy3FQIbajgPG3LHG7w
 4udrv8z1fK7Xs2Ww0FHSQ372Hlbqg5GUMs/lpmY+LNooDEwljs1zvJQ1QjkXYAMIslTX/LvQQoF
 eRU8d96gYUCLieK1FzpQY1BlIGSsRf31BbgvcleoHikC/M7EbXiopkxAFvhZj+iNYnRn1XnWpuU
 gfMAZ0Kcend77CDJnwGF91KR/59PeYIBmd3gzswX3PeRlEJT0rXDHbtCyuaN3dsavqaWLVVVWSK
 U3uiLhAXqSpNqZarAxg==
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6aa8f42c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=YP7Kpn5otooA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=_O3DOGVWAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8
 a=pq3Wg1XxJzrTNXcWAXAA:9 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=2TKV-7w1aU1AVAwN0oqT:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: swSY0G-qtMr705ozNuILUNtzDg4aSgHz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNiBTYWx0ZWRfXwSYFnBPF2Vkp
 qcYZXgqQ+DX+129oo4yASB/vnNraG/BjtfIK0utq+bRGwtvfZymWfEQbS4GfHrWJ1oMrAHio8gO
 wqG0Ptyru9CGGJaXT91YXA8iNptsEfg=
X-Proofpoint-GUID: swSY0G-qtMr705ozNuILUNtzDg4aSgHz

From: Alessio Belle <alessio.belle@imgtec.com>

While the MIPS firmware virtual memory context is created and destroyed
from within the MIPS firmware init and fini callbacks, the META and
RISC-V firmware contexts are created and destroyed from within blocks
right before or after those callbacks.

Match the logic for all firmware processors by moving those blocks to
the META and RISC-V init and fini callbacks.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Reviewed-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v2:
- Added Signed-off-by and Reviewed-by lines in the commit message.
- Link to v1: https://patch.msgid.link/20260810-b4-upstream-manage-fw-vm-context-from-init-and-fini-v1-1-2c6229e36e5e@imgtec.com

To: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
---
 drivers/gpu/drm/imagination/pvr_device.c   | 25 +------------------------
 drivers/gpu/drm/imagination/pvr_fw.c       |  6 ++----
 drivers/gpu/drm/imagination/pvr_fw.h       |  2 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c  | 12 ++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_riscv.c | 12 ++++++++++++
 5 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 54fe4180c73c..35eaa54f75ed 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -697,25 +697,7 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
-	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
-		pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
-		if (IS_ERR(pvr_dev->kernel_vm_ctx))
-			return PTR_ERR(pvr_dev->kernel_vm_ctx);
-	}
-
-	err = pvr_fw_init(pvr_dev);
-	if (err)
-		goto err_vm_ctx_put;
-
-	return 0;
-
-err_vm_ctx_put:
-	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
-		pvr_vm_context_put(pvr_dev->kernel_vm_ctx);
-		pvr_dev->kernel_vm_ctx = NULL;
-	}
-
-	return err;
+	return pvr_fw_init(pvr_dev);
 }
 
 /**
@@ -726,11 +708,6 @@ static void
 pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 {
 	pvr_fw_fini(pvr_dev);
-
-	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
-		WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
-		pvr_dev->kernel_vm_ctx = NULL;
-	}
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 850a3ec8e775..58ee51cd65df 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -1029,8 +1029,7 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 err_mm_takedown:
 	drm_mm_takedown(&fw_dev->fw_mm);
 
-	if (fw_dev->defs->fini)
-		fw_dev->defs->fini(pvr_dev);
+	fw_dev->defs->fini(pvr_dev);
 
 	return err;
 }
@@ -1063,8 +1062,7 @@ pvr_fw_fini(struct pvr_device *pvr_dev)
 
 	drm_mm_takedown(&fw_dev->fw_mm);
 
-	if (fw_dev->defs->fini)
-		fw_dev->defs->fini(pvr_dev);
+	fw_dev->defs->fini(pvr_dev);
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index 3390c84e4fd3..4b25291135b6 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -86,7 +86,7 @@ struct pvr_fw_defs {
 	 * FW processor specific finalisation.
 	 * @pvr_dev: Target PowerVR device.
 	 *
-	 * This function is optional.
+	 * This function is mandatory.
 	 */
 	void (*fini)(struct pvr_device *pvr_dev);
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 9ff03bc60a08..6c5dc711e81e 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -500,9 +500,20 @@ pvr_meta_init(struct pvr_device *pvr_dev)
 {
 	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_META_SHIFT, 0);
 
+	pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
+	if (IS_ERR(pvr_dev->kernel_vm_ctx))
+		return PTR_ERR(pvr_dev->kernel_vm_ctx);
+
 	return 0;
 }
 
+static void
+pvr_meta_fini(struct pvr_device *pvr_dev)
+{
+	WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
+	pvr_dev->kernel_vm_ctx = NULL;
+}
+
 static u32
 pvr_meta_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
 {
@@ -550,6 +561,7 @@ pvr_meta_irq_clear(struct pvr_device *pvr_dev)
 
 const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.init = pvr_meta_init,
+	.fini = pvr_meta_fini,
 	.fw_process = pvr_meta_fw_process,
 	.vm_map = pvr_meta_vm_map,
 	.vm_unmap = pvr_meta_vm_unmap,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
index fc13d483be9a..58bacc522e72 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
@@ -103,9 +103,20 @@ pvr_riscv_init(struct pvr_device *pvr_dev)
 {
 	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_RISCV_SHIFT, 0);
 
+	pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
+	if (IS_ERR(pvr_dev->kernel_vm_ctx))
+		return PTR_ERR(pvr_dev->kernel_vm_ctx);
+
 	return 0;
 }
 
+static void
+pvr_riscv_fini(struct pvr_device *pvr_dev)
+{
+	WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
+	pvr_dev->kernel_vm_ctx = NULL;
+}
+
 static u32
 pvr_riscv_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
 {
@@ -154,6 +165,7 @@ pvr_riscv_irq_clear(struct pvr_device *pvr_dev)
 
 const struct pvr_fw_defs pvr_fw_defs_riscv = {
 	.init = pvr_riscv_init,
+	.fini = pvr_riscv_fini,
 	.fw_process = pvr_riscv_fw_process,
 	.vm_map = pvr_riscv_vm_map,
 	.vm_unmap = pvr_riscv_vm_unmap,

---
base-commit: e55fead22ff9ee047ab9f1903860c4b43043514e
change-id: 20260810-b4-upstream-manage-fw-vm-context-from-init-and-fini-195cdd01cc60

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

