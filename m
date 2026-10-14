Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED447CC9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965677; cv=none; b=WR5WclZXrdjUuKxub6Pk6xRDaaKrOJL7+ZRqtxHsHZae7ZWs0Nj4/ao/NAr51wm5TgQJ9ziD3YWZKMdSE/V1eyoWdqrCIOOGDemj9lJXgbSpw2QV/mPP3P7UBawMf9uyElzYREAn7rzMK8VMm8iAnY2ihtEjbxGds10jABHsn1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965677; c=relaxed/simple;
	bh=8EDIVxEL6b3vWMZDy2caFL6luIwiJpSYeSryTi5/z9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Q8bU3zZJOjm7a17ZoUUAY8eeB77issn1Z1Kf+3yUyBzzZRLYU61sMEBzgb91rfGLwOYJVOKKA5mS88+e900Skba4pAg4GOkz2Osl12bSFe0a5PqwCFDFAQGFpqoAIv8DlTWeugK6ge5MGOUleOpUTN1NX+haIKRCqGg65l8MJ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=W71szxSx; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="W71szxSx"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E646GY2182309;
	Wed, 14 Oct 2026 09:13:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=e
	ZcYzkpyQWEaCYtn0Acvdo4iHyYDOe8CPaTxuGDlPBc=; b=W71szxSxbKZB4ZTqt
	geGYgQI58coaEIozHo3MFBGPaBlPAOxQC1RoooS14smv+3PzQIFKbhV5Fk8oRjAm
	UWvbTB+2p7IsB4yJUpuMc6dFmNN1iuveuXAWSY7YxLyrUDFZjMJKx3t7QCiMmUm7
	eqO9aWxHEJ8668FeltL+gCafcNdR20ArXPPhO5x/kyxlqfFET/w5Jul4oZD5jTJd
	NbKjpOucbHFpC28LS0l7XchGbExF8S5qI3KHcUbMJOAeKpZ00mgwltf6ihkxB7Pk
	PuK0LXOfJjh+kqMYNml5mWF9sDmP3acx+kOb37oVLSJ5dOqr5907XEqlUIaHK0Ny
	h4i6Q==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4h7bmpapbd-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 09:13:52 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.23) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 14 Oct
 2026 09:13:49 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Wed, 14 Oct 2026 11:13:09 +0300
Subject: [PATCH 3/4] drm/imagination: Improve some logging in error paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261014-b4-simplify-mips-pte-defs-v1-3-b4ad7bb68e22@imgtec.com>
References: <20261014-b4-simplify-mips-pte-defs-v1-0-b4ad7bb68e22@imgtec.com>
In-Reply-To: <20261014-b4-simplify-mips-pte-defs-v1-0-b4ad7bb68e22@imgtec.com>
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
CC: <linux-kernel@vger.kernel.org>, <imagination@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Matt Coster
	<opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791965625; l=2502;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=e1cRmT+yMrC8uWEwbhuCZhCzCKOigZi3J3Ef7bHnPiQ=;
 b=Lj6oO2kJxqCWsYkYXwE0jbuaXK8KnCSQWcXyhgUIHPeqCpKO1VqnQHQxmh+7oEbrvhM9EysB3
 Cco5CNaZZwoDjzxfLwbAWICfHeYMpZ03pNu5sz82jAiyTRt16XRxDpt
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfX63mpXnd6phWB
 sDQQngvMWf5S75pyrLj0vkNm4UOX49fggLOKH4YTvpy/xGfBQ2UKPLfq80c8BPsUktWBIzLD5Mk
 +I6CZmHcnnfi/+WS13oe4Nmt3YEc5XwBgbLkBfniJ8bt0xI6Ka6nfX5SwJL4KEA7qaiCBD+p6bK
 qL1CYpILN8Hdb0rByApFMIJ2FggOu9V93NqSijPaScljoSDZfhyiM77QhJhOWeC5UpzktWWscwq
 ynuq1mN1qpj7oj3I2TnHG7intBorRKuWUUYspbyS5wraNLExdOE4x1F0gVsoCBS4+L9giXxVKzh
 PTOsRuJ3iYyBaOhDjWpT9kVopmrsHyTxVXMeOQD9LQp/TUHCzfDqJtbXpfxut/eRo7m+lwzYO0n
 9WIhqYDRVeMgOMeuYMZDFOjdEQQAMcqTgsJi5z6VOVzCpmLn+4jVxDSTpgZ8qqPKSvvyzYfwrq5
 ayhPWAQp2mHAtsj8rCQ==
X-Proofpoint-GUID: Y_IDOohcotRbmiV9dYOn_sqy8xTklZhs
X-Authority-Analysis: v=2.4 cv=QpDLTlyd c=1 sm=1 tr=0 ts=6acf39c0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Vfs-8JXWiL0A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=CNbiELROydHnTOGMemMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: Y_IDOohcotRbmiV9dYOn_sqy8xTklZhs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfXziMDGCPs6Qen
 Rn7gG6eyc2RKKZzHP37bsy6Kr93UGCG3+ajS0nCh7FS1I/ctZuVXLvP9w2Hj4CbfCsZbvSFgTjt
 g43HwYHycplfpABfapaH47AkVN3tM+I=

From: Matt Coster <matt.coster@imgtec.com>

Add error messages for attempts to map an already mapped firmware
object, unmap an already unmapped firmware object, and provide too few
DMA address slots for the firmware page table.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw.c      | 6 ++++--
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 7 ++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index c6c77b152342..4f2b5c4df600 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -1165,8 +1165,9 @@ pvr_fw_object_fw_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj, u
 	spin_lock(&fw_dev->fw_mm_lock);
 
 	if (drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
-		err = -EINVAL;
-		goto err_unlock;
+		spin_unlock(&fw_dev->fw_mm_lock);
+		drm_err(from_pvr_device(pvr_dev), "FW object is already mapped!\n");
+		return -EINVAL;
 	}
 
 	if (!dev_addr) {
@@ -1232,6 +1233,7 @@ pvr_fw_object_fw_unmap(struct pvr_fw_object *fw_obj)
 
 	if (!drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
 		spin_unlock(&fw_dev->fw_mm_lock);
+		drm_err(from_pvr_device(pvr_dev), "FW object is already unmapped!\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index 84e023fffe5a..40495b1486a2 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -11,6 +11,7 @@
 #include "pvr_vm_mips.h"
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -278,8 +279,12 @@ pvr_vm_get_pt_phys_addrs(struct pvr_device *pvr_dev, u64 *phys_addrs, int max_nu
 	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
 	struct pvr_vm_mips_data *vm_data = fw_dev->processor_data.mips_data.vm_data;
 
-	if (ARRAY_SIZE(vm_data->pt_pages) > max_num_addrs)
+	if (ARRAY_SIZE(vm_data->pt_pages) > max_num_addrs) {
+		drm_err(from_pvr_device(pvr_dev),
+			"Minimum %zu pages required for FW PT, but only %d DMA address slots were provided\n",
+			ARRAY_SIZE(vm_data->pt_pages), max_num_addrs);
 		return -EINVAL;
+	}
 
 	for (u32 page_nr = 0; page_nr < max_num_addrs; page_nr++) {
 		/* Firmware expects 4k pages, but host page size might be different. */

-- 
2.43.0

