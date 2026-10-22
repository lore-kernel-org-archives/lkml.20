Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657565;
	b=QqC2IdMcpT6rrNfFzev93II105MrBDrh1bDAhQFEekI8jhQMy+tyGtHWAVRW+mBQojwG
	 o6ifnSdCO8LtD2HlXgrh+zzCeKz2a+FAaxfdwmbI5OCriUSWimYxhUYfaXDrtYH+dFuNe
	 k/hQJ6UeSpvIf8/PojnWmxTz2UZ6PiT9Z8/Ik7ilJtBpSFCI/XZoJybBY5+j7LhU7+vyG
	 8yN0ouWU0nbYElldDV1qtmDVFyFAWEm0GH1Et/WsSGhIVMH9tJ23GO93Bi5TJymQ+vj4G
	 um6bsl8mFFLjnfMpbMfeRLwtTQZYYUJJKuXBJF6VlD6fLF22h/2NZXlOc0m99YQD4ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc;
	bh=eZcYzkpyQWEaCYtn0Acvdo4iHyYDOe8CPaTxuGDlPBc=;
	b=k6Jerx2iQqQOIy6bGLCeXdkHEGEsbKwAURpo/eucwkyYnUFY4KE33Yj2N2deljy1pz5u
	 zN+Ll7NScIcvNltdrFOHH+9SVFCeC+pQ/hH+szF7xFJBMngYA781xTgHrZn2JubvIjpZ+
	 DzP8J9NhNG0QmX4Z/laXQ+7KzYXWj10xOTSyVu92JcRgzXhnjCdIlXC6KOEDZBkGfJB61
	 xiGKVCpyM/7/6UJ2iQCNtq/8aAufXe9ewelo3z0kiRvdcNrsx5IykURic6nkodydiyLVx
	 O8ISkAK4fmk3Mg0nCtS1ONlnw8ftHo8Ikf0z425IsmCbdqFve/dAxcs+aIV+01DtjdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=AlgnP31Z;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09569606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09569606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=AlgnP31Z
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M71KEI1904281;
	Thu, 22 Oct 2026 09:25:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=e
	ZcYzkpyQWEaCYtn0Acvdo4iHyYDOe8CPaTxuGDlPBc=; b=AlgnP31ZNx+fdocBn
	jBWAzm3MAe5OCAhPV3vE78r2zzuMD1L7N1eWDu3A57nIktMVXzs7JLsjSVJYh7TG
	NAnabfG1ORfVHoDU5DIuGJYOSvSFY3KwEduEL/nPzKqR/IT7Suj+RDYiUW9I591e
	coTPpR/xmJRXukqVojfnMYIOCL056Dk3Gq6/Vt2HwluSIR4RatRnEO1evYaK4Z3A
	ks+F7NWbrXfBbPWUu6o6hX/Yf4ytzlkoUdsJxZhsTl7S+NkEvlVHslnEJ+yzua5N
	o65J4qPcTntCMYTDYavVjbkXMOB59mOlsic6cs4oHlbAKgbSsd8/DiRMaHfVEHzt
	05QTQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hf88f87nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:25:12 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.18) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 22 Oct
 2026 09:25:10 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Thu, 22 Oct 2026 11:24:53 +0300
Subject: [PATCH v2 3/4] drm/imagination: Improve some logging in error
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
Message-ID: <20261022-b4-simplify-mips-pte-defs-v2-3-ee2402c03a4b@imgtec.com>
References: <20261022-b4-simplify-mips-pte-defs-v2-0-ee2402c03a4b@imgtec.com>
In-Reply-To: <20261022-b4-simplify-mips-pte-defs-v2-0-ee2402c03a4b@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792657504; l=2502;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=e1cRmT+yMrC8uWEwbhuCZhCzCKOigZi3J3Ef7bHnPiQ=;
 b=ZqkR1XtVMLzfjawWjgUE0ht3WHHTooxbc3vtQgm2lwCO9Cgk56qluHKQn8sHOHoIRfhFOB2AB
 IwvUXxS20ZEDEiI0XpLGNu4uc7ljiEn1gIVt1yB1ulIDG3FKE9Z95lO
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-GUID: NDZ2m9rjWwD1ZyjOlQxXxQoHOyePz9oR
X-Proofpoint-ORIG-GUID: NDZ2m9rjWwD1ZyjOlQxXxQoHOyePz9oR
X-Authority-Analysis: v=2.4 cv=e7+T2qp/ c=1 sm=1 tr=0 ts=6ad9c868 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=sVS2Dey4ZWMA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=CNbiELROydHnTOGMemMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX+XMBJVhwKbmT
 v0q5BfE/ph4otPO6ndIIDg7EK5Kjro1c3A/uczNDgxBj60aX6q67GvFtSW/6VquwcfN6ATiVMy6
 RQ2lKX3BCZ01c5i1lGXbfL0INIanUZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX3YzqXQPDA3vn
 9s/w5o5mtTbRoMySNn+yUYi4D1muoFASBa+C4jv7IKxP2vfWX8GE5DKeQmQi+WuvEByFI/l6aec
 b/KZnoJrDiIwMH1Yf5y/mxkNxqIYoH7wQpYzJhPGfx6YLXz6zpVeSjaEGyzPq+1/CRA/5Dnxt2a
 NF+ZEYv1xBph0spCoBQEjvyex64p3TDDadXgLwcxQmCqwmgou359VX+bCeRJyESuX1GyFYy6QWs
 ZVcI26qIe6OJTakOwrXLD2joH6wdvO/1uWqmqOSAFyaPbR5ZQZQSsljLAd+PRComewHRItyu3WI
 NjhvVSKU+9USQWtnlTVPlC1b7BlCP7b5lKzXhY91l2X+BrOouO1BLEqEERLx9v1p5LD44/dGc2I
 na3pmOnB2DnhVUTH9zeUx3gfXVkddFrJSMLZcC9tIgIqSZIktnxlrZGM/AtjPHcKii3Hq4alhaV
 TTj36ZP+QOO52+svlrQ==

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

