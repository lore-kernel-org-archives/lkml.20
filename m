Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603378;
	b=LXBnoW5cWRMxzHpFtAV0wg2CWWCJxW7gtSJ/yHawCI0/a+gIYyK0IFKsXLfxqWAIdIu7
	 PSnLQntwGvuqTeWuQON0JSQzYEAkK0rUXwXPPy74BVsXm8PE5etIsIA8Z6wmTaRuHq+sd
	 sDro9RasKEuWf0xiKwrrvrgniqT8clEO/r4PNoH0DEkbbkuYbMcmjLEEtZkh5Rswokdwc
	 ZLjNqrq6CdDxET+Sy8ufV4ydWk7Cd2mRYmvZ2vVkp00DNKXfG/zC/Dl2NMZDSs96spgqu
	 1U8FIxj2/96wq3NU9xaANPp4HRzWKo9TkwDzG4oW2I7h87N8bhY0YNHoXGHq7Jo4w9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info;
	bh=N1sCnUJZes2nWUPirOY9b0XhMayPBpKTCwjYpoDAMUg=;
	b=HP3ySN3j6BmHdp5o0t3YzMAfdEK6AZB72InO5C4zJAxHv6RmMyakNVefZXzDRvkNcwFr
	 /srMysi5LEPcQ4G9AtQ3viItMFz0W7hG4jd/g6CK2ltXEO5CTMzlNy2iI5DXaUyPNf0kF
	 e09TSS4C8ojcCC8Vs+FH8wlwAFav1MhMrdbk4wgmMhbKWZ+gFfz1qVrVR+9ToBVHpYyWO
	 g0ZYL4hRR86HknikW+DdMdZDx2b6tt4RUCW30GwxEb95g28dpAqfBbYpz4X7HMinRoptA
	 aHHvckn72OdXmW9y1059h5qG/cc0P6T72k9evbMhe/jHgZng1m/vq+FXPTWyzkjXxrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=ChTSqXoO;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D84606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D84606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=ChTSqXoO
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26GB1s3838432;
	Mon, 2 Nov 2026 07:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=N
	1sCnUJZes2nWUPirOY9b0XhMayPBpKTCwjYpoDAMUg=; b=ChTSqXoO9Osj2KF3r
	K049uasMDAfFj29UCq5guzQKid19UK0xhFxVD3BOf5h12Nvm3N4AbCKZwRpJdoBC
	oKEs/NAnGRHoeUsnpV09T0LaSrAJDzAl6RwVANDZZ8YvRxOvVcbPTqk4zelZfAwC
	/y5rqIU3U5MVm77TBtQQxATaUbgaqMqS4MGwARMk8CxBmxu1jwtdWFYz35VwUO8x
	O/n4sVaumA3mBVFKhRiadl/uYz63+c47xKnRFl7PJ40ZIzWkSunHohgl2dNw569l
	KWl5hJBzEmDJi8eo30XISM8BZ+j/RPmkjkXV3bm/fH6xgO11hlRIf4lsrDEhgXVZ
	Oirvw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99whb6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 07:09:06 +0000 (GMT)
Received: from [127.0.1.1] (172.25.5.26) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 07:09:05 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Mon, 2 Nov 2026 09:08:35 +0200
Subject: [PATCH v5 3/4] drm/imagination: Improve some logging in error
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
Message-ID: <20261102-b4-simplify-mips-pte-defs-v5-3-d5bcf7d95a1a@imgtec.com>
References: <20261102-b4-simplify-mips-pte-defs-v5-0-d5bcf7d95a1a@imgtec.com>
In-Reply-To: <20261102-b4-simplify-mips-pte-defs-v5-0-d5bcf7d95a1a@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793603340; l=2557;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=RojfA0ofXUa2gTm6g8B+3070zBumv7LmENgITU3pSG8=;
 b=auf0G4jjl9wdAjB5pAGTdP/WQasdY8Ri/ZdxdC6LWPX7A6s86n7HBn5kCK5YDIZIrUSJ7T/U3
 +nYcIRAHMkiCdOaauMMp8WwajmuwVxAtfx4QFy7/55x7QxQBnf6mGe3
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfXwolAwhoJcWKQ
 yfXgR5czRZOLQs4pDHwcpZmAUWGD9YhZ90QheVr2XJQwYtUFD2XLB5xII62xSZgfWEJDa7BZyEJ
 evObZr2vsXDXNwuaw1NaMoYisqGag1PEiRwEpsKv7mRBDUeOIm4C28DDJ9olyXjVta1tIMZg6Jg
 MzCkjLDmvlK/h1tsSsV2mXmZlB6jvhX3+2tUXG1hw0KZaG7ohgSn/Nz+4t1Vo4KaZz7ccJk5vJ3
 WiGmiukhVckxEsXSc0VucFbCyJoYd1GDvEX/qOHE8pc6XOAip7Dm56vnCkJFtv04Xe07syfTHq1
 3BgE7Rj6X+hZCkXybEqZVj9GaDwi3GUG10tL4UvgyTxxeMxpPsH7bVFKPUmN3KyGoZIErANus3K
 0OtwhfrpgsEir6iOu2T05uPdvO3Um+yRoyr95jUMI5d9ObACnHgk6jTSc2FIsf/2IWmBBioexqh
 ADuLWzc7zIbXncUI12w==
X-Proofpoint-ORIG-GUID: jCKCnIvSDJMRo4gdCkMVIKkA0oEvdPKx
X-Proofpoint-GUID: jCKCnIvSDJMRo4gdCkMVIKkA0oEvdPKx
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6ae83712 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=h_3jC4m0AyQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=CNbiELROydHnTOGMemMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfX9lK8q/hTrAff
 pgdEV0U5aaI5og8pYeAfOlJIiwUOhi2Qfz8EgAnZrcqZAzsHY8LLM/a2hLhLyvTY+Boo4RTERZe
 /jox52LzZ5zi52+87R/zjSqLIPGCALA=

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

