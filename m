Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018983;
	b=hbho/DTHIsxSFwcp2zBwcJV4evebu5spCJP2q09VTWZ8XgGbGcIzYx8aw1eSOnQfIxle
	 UmuZGO8KdMKRJU8twU57Mtjq7P2e09/WYP05mYw3qykhDLoEbYjJSs4jcq6OE2gocQFIn
	 pMd+PYp/6YeHFXQg1E2sPblXSrYG1mMjxwv+wjgTfYgN9OI/UWPRi/DGR4jJTE1M7UlJW
	 QevSi1k/67F4lKrWYAVMrXDTjtqQul7uOAHMnESsBplUKeWAAXCcrF7WG49CRoW+1/n3D
	 dqilbo3WIRboCmReFBr8b4sopK+iKCToAbXHSChUw5Nnyg/soayg6Dr3lrIj0G6l/YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=N1sCnUJZes2nWUPirOY9b0XhMayPBpKTCwjYpoDAMUg=;
	b=dgtlTTQnrTdkzDE9x+vFVRR+oOOVE2ZY5Hcs0Piepl1eO49JiN7EuNgP7KF7lli9yUiZ
	 CGHCSowBcBAmwWvb7qqjdocvMGuN+GnbNdDbcUK9imuwZFjCqJOMD4pO0QkU6TqPAmahw
	 efXUEvObXYmPqrPS9dSPXUhE2bGiuDMJrbKlRkVPh5A9xHbTz2Ckgr3S8oRISeipMUx+K
	 J35v7lEvdQzC1MVBuQoxLB5yER2dcFAMhcQVV1NwKs2239GvUmuAk9H56jwzYU3tTnRzS
	 9MXApr/CIYAQA+QWYF8uiEu5SSjR1oq6hwkU4k3IWETJSLV17P62lK0Uk9MjTVBpZ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=iRdkVIow;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73670606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73670606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=iRdkVIow
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCWRnW3244316;
	Mon, 26 Oct 2026 12:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=N
	1sCnUJZes2nWUPirOY9b0XhMayPBpKTCwjYpoDAMUg=; b=iRdkVIowmD1D4Oo9F
	RqbsJ9C9kiLViclhPQS4Qz5diRdJolAymPgHettUCKMH8e4Px2vW+Y6SdbEO6b0V
	L+uUQvmbOlE0Gts84Tlmy/7Kl0O+zKptlWUi45+FbM1A2SO63eRlIsakPSbwe16S
	qKYjMwO1A7ghTFrBvrw7SxFJbZBswS/uhBPocLzv3ddAW5v7JoAFuFkkwOFUPLrD
	UZk7TWVD0NutAk3kMM12NMvl27qk1A7yIohIPlZBT3E4gGLwrVeylvOrnpDqVtk7
	+j+jpWx2Yo+Xb8DDBDfRBOCywtIkLZPyLMG+JvqeGVF9lFinCQsx7Jk0Wu9CJrtQ
	MxFug==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hgmrthptk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 12:49:22 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 26 Oct
 2026 12:49:20 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Mon, 26 Oct 2026 14:48:35 +0200
Subject: [PATCH v3 3/4] drm/imagination: Improve some logging in error
 paths
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261026-b4-simplify-mips-pte-defs-v3-3-587087d8a284@imgtec.com>
References: <20261026-b4-simplify-mips-pte-defs-v3-0-587087d8a284@imgtec.com>
In-Reply-To: <20261026-b4-simplify-mips-pte-defs-v3-0-587087d8a284@imgtec.com>
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
        <dri-devel@lists.freedesktop.org>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793018955; l=2557;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=RojfA0ofXUa2gTm6g8B+3070zBumv7LmENgITU3pSG8=;
 b=JMuVW581pjTOO6sTwlF6QNu+16FlWeYCFg8+X/DfgaXxcZWgKtmkHQ1pj2h+VlxzdsRUcAIM8
 Y5tgSDZPWccCv1yMrfjSMfO139FHW193Z1NfJBZylUth/XyAvg2M1WG
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-ORIG-GUID: geSwVlnv7jW4Wc95VyO7_ZlG1hdI1zts
X-Authority-Analysis: v=2.4 cv=NZdzRGD4 c=1 sm=1 tr=0 ts=6adf4c52 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=CNbiELROydHnTOGMemMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX9m6BrTfVYFKb
 C+7Elhff1ww/cus4DQ3wGFFcwafcwowKI6K4bZ5FNBg1f0PZYq/+PsT8raNzPfyGTn3wZWAR7E3
 Z58sxwHuZYN3sTKzSxDMVRRfeAPJTJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXyJu5DiAIilMC
 whRR5+LEv91ePadSTnNLd+JR9kLiidmXdbztHm0AvLI7RoHlDeXDOo+1aOvFVbXK9d3lCy7mQ4K
 VJlwVHumZ8onAC/gVSaYtrhRlbPaLcRQREnlegzxlFnTRXNe7NMzaugbDTpkBm/ZwN/t2hQcla9
 sza1t85NkLkep0Gy2m7n38h5LeMYZTr2L1QhuxPK0n2+LbvVgW9Q5maGToa2SGk7F0FPvRlB0P3
 J3E506yvtO+4kESA3RqqbnIYKYTqMMKKFRjsKDe5FZmyYlWvgGa67ahl/D4E/afgdQlaEho9/mC
 D6jIqJgSYxJCCK6PEsDPshrzqXYsllD53LntG7RHjV0gXLFjDPx9IR9qKuCH5IrMNvLRIojPitW
 B3fC0oy+8wqrFX5UpXb/rcsQXksMlWZibDgDfEHHluDaeGRLT7XRsDUlU+F4P1SbfomLrn5Xr4l
 QnnhcWjFUwKSTRvWKGA==
X-Proofpoint-GUID: geSwVlnv7jW4Wc95VyO7_ZlG1hdI1zts

From: Matt Coster <matt.coster@imgtec.com>

Add error messages for attempts to map an already mapped firmware
object, unmap an already unmapped firmware object, and provide too few
DMA address slots for the firmware page table.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
Reviewed-by: Alessio Belle <alessio.belle@imgtec.com>
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
index 726f900d3582..b74386032e6a 100644
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

