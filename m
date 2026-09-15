Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDA361668
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459474; cv=none; b=F+WHD6q7VpOFQle/gSimMTtx64lZjNakFToyxTEv/yCwP5VWqoI1KvG2akD8leA4OQC1xO7B9+AualzdkeLWxPVx5+rcw8wkR3gTSmeGaLQQh6Pyi8RLW9WrvH8AHZgbvsxwi1qAPABartEHf5ivet0cEeyBRSG6lEw1w5yZb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459474; c=relaxed/simple;
	bh=2KNLb3L8nOI64aTWf3N3rfDvVRWt44Om7x+/Xjw4poA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YMEeHo5j7dVkmyRE8lg9AdFaX3M3UGlYlQcUA+esrtuHOievyJv1EM44vY2M4PORfiG8PD/pSfehxZembfQk7985eqIbOechBBy7T/6EDNBc+ChgmNpqR7H0v6MUXUvK85umP4yipHQzJ96GVsrFGJb/g0I+NY+PBibI8C27D2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=OCTpOin+; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="OCTpOin+"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6YxCg2004760;
	Tue, 15 Sep 2026 09:04:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=/
	E3INs25mnq+3t02mE1FVSMuWAqgKq0iIGYPKvwjwnY=; b=OCTpOin+Y9F9262Q/
	mzaXAs3AzMYQIrYwsODzjGwezvWHIqJpMgWkSACR1JUgoVkYsN2++jOxFNAykHSD
	3TCJwLnum8YbpZwYIMcsr1vID2mc7RmMqgjhbDDvdA6bgoTQFFJ1RilHOpBT1K9Z
	7A1Q5MgxF6LA5DircNbn/bXA1I/DrZCYniMu+wVd2iN98LMFGnifcfXgPInPwPrK
	kY4xklxBFJvCQB2wCcgwwGlAu1j3gRUZYPV16TSWHLsbRcYFTpys/BgP3/7p51oK
	WJlKteT6ZDG+X/iN6OY6php0ngu6wQxabyNrSiWDsZEIDKoa8WtepWq5thaOTS3Y
	Cd/Qg==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4gmxtujca8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:04:05 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.88) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 09:04:03 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 15 Sep 2026 11:03:45 +0300
Subject: [PATCH 1/2] drm/imagination: Treat FW connection ctl like other
 interface structures
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260915-b4-do-not-map-if-structs-unnecessarily-v1-1-a0e2ccee154a@imgtec.com>
References: <20260915-b4-do-not-map-if-structs-unnecessarily-v1-0-a0e2ccee154a@imgtec.com>
In-Reply-To: <20260915-b4-do-not-map-if-structs-unnecessarily-v1-0-a0e2ccee154a@imgtec.com>
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
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789459442; l=4145;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=zX252s12X54vt5scMMdqunk3ucRRQ/NDB8LG/yVC93I=;
 b=XJ7LQgLW6PVQpHBfoLyt+0ykeBSrRSsLsmYwRqn0YvAUA0RduapxSzp/em0OEA4cVi4EYkpxF
 19XU7xA2HVuAikztd2r/9jgu5HDgY9ERiPez8Yr3iBOueh/n9yf1r7h
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Authority-Analysis: v=2.4 cv=Se9i5fRu c=1 sm=1 tr=0 ts=6aa8fbf5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=YP7Kpn5otooA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=Dj9Jg6a66uChcVUBEUgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: uUoNZT9VaJZwp3YG95ZxSQCkUgWeEpW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNSBTYWx0ZWRfXytzuG3Ihjr6M
 pza+cH7ThtPMZrJTt9DhtiZYL2HFywEXSgQIFA4mmzzRFN87OSctqM8PUEMjWuBIDDylTmxN+Gk
 gIHa3M/qBzRDZZAGgh9DefgbZN5Tv8kAs5xuiyxRhSDWV43LiKMTFKtpDrbSWruv5HsNexadYR5
 /34qkcwBaPmVv7BkD/fTXNa/RXs9DUF9COeTq1G9PSQHSxHYLXVNjcPAIPW7U3RdH8Fp4mkUObg
 WNxlqMDZnxcJW3g5fytJfOiXv8HXHlngMZv0CSpAN4FqlUPb10IoURDtDofmOTXMdkvaNYAkEtP
 Q2nYDztHzF2V1WO+oinmjxkFaS3og48ARZZdg8fezhsRA7D3Hx0jNsLjnMiBwHSXjlDj3LEnnhe
 Z+4djVRMnO0TaNWQL1bSVN36IQLWH4btdAetdjlANkw8ozYBCA+KFm1KIoOwZ7wmxDm1Bncwe7C
 I2ZOxEuHSdynPJl9sXw==
X-Proofpoint-GUID: uUoNZT9VaJZwp3YG95ZxSQCkUgWeEpW8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNSBTYWx0ZWRfX+LT/T43S9MQR
 ORsDmf/n/l6rotESa6mbdOaNXSozjj+SpocTYBsQmMiWNlM3rfh+HeBLI3GiZS/PVU1e1u1j9V5
 LraUtvTOic9kaheCnQxocx5RJjJlESU=

From: Alessio Belle <alessio.belle@imgtec.com>

There is no particular reason for this structure to be allocated and
freed on its own. Move the related logic to where there other firmware
interface structures are allocated and freed.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw.c | 59 +++++++++++++-----------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 850a3ec8e775..b2a5ea001474 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -278,37 +278,6 @@ pvr_fw_find_mmu_segment(struct pvr_device *pvr_dev, u32 addr, u32 size, void *fw
 	return -EINVAL;
 }
 
-static int
-pvr_fw_create_fwif_connection_ctl(struct pvr_device *pvr_dev)
-{
-	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
-
-	fw_dev->fwif_connection_ctl =
-		pvr_fw_object_create_and_map_offset(pvr_dev,
-						    fw_dev->fw_heap_info.config_offset +
-						    PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET,
-						    sizeof(*fw_dev->fwif_connection_ctl),
-						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
-						    NULL, NULL,
-						    &fw_dev->mem.fwif_connection_ctl_obj);
-	if (IS_ERR(fw_dev->fwif_connection_ctl)) {
-		drm_err(drm_dev,
-			"Unable to allocate FWIF connection control memory\n");
-		return PTR_ERR(fw_dev->fwif_connection_ctl);
-	}
-
-	return 0;
-}
-
-static void
-pvr_fw_fini_fwif_connection_ctl(struct pvr_device *pvr_dev)
-{
-	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
-
-	pvr_fw_object_unmap_and_destroy(fw_dev->mem.fwif_connection_ctl_obj);
-}
-
 static void
 fw_osinit_init(void *cpu_ptr, void *priv)
 {
@@ -459,12 +428,28 @@ pvr_fw_create_structures(struct pvr_device *pvr_dev)
 	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
 	int err;
 
+	fw_dev->fwif_connection_ctl =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET,
+						    sizeof(*fw_dev->fwif_connection_ctl),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						    NULL, NULL,
+						    &fw_mem->fwif_connection_ctl_obj);
+
+	if (IS_ERR(fw_dev->fwif_connection_ctl)) {
+		drm_err(drm_dev,
+			"Unable to allocate FWIF connection control memory\n");
+		return PTR_ERR(fw_dev->fwif_connection_ctl);
+	}
+
 	fw_dev->power_sync = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_dev->power_sync),
 							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
 							  NULL, NULL, &fw_mem->power_sync_obj);
 	if (IS_ERR(fw_dev->power_sync)) {
 		drm_err(drm_dev, "Unable to allocate FW power_sync structure\n");
-		return PTR_ERR(fw_dev->power_sync);
+		err = PTR_ERR(fw_dev->power_sync);
+		goto err_release_connection_ctl;
 	}
 
 	fw_dev->hwrinfobuf = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_dev->hwrinfobuf),
@@ -594,6 +579,9 @@ pvr_fw_create_structures(struct pvr_device *pvr_dev)
 err_release_power_sync:
 	pvr_fw_object_unmap_and_destroy(fw_mem->power_sync_obj);
 
+err_release_connection_ctl:
+	pvr_fw_object_unmap_and_destroy(fw_mem->fwif_connection_ctl_obj);
+
 	return err;
 }
 
@@ -615,6 +603,7 @@ pvr_fw_destroy_structures(struct pvr_device *pvr_dev)
 	pvr_fw_object_unmap_and_destroy(fw_mem->power_sync_obj);
 	pvr_fw_object_unmap_and_destroy(fw_mem->osdata_obj);
 	pvr_fw_object_unmap_and_destroy(fw_mem->osinit_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->fwif_connection_ctl_obj);
 }
 
 /**
@@ -755,10 +744,6 @@ pvr_fw_process(struct pvr_device *pvr_dev)
 	pvr_fw_object_vunmap(fw_mem->code_obj);
 	fw_code_ptr = NULL;
 
-	err = pvr_fw_create_fwif_connection_ctl(pvr_dev);
-	if (err)
-		goto err_free_kdata;
-
 	return 0;
 
 err_free_kdata:
@@ -842,8 +827,6 @@ pvr_fw_cleanup(struct pvr_device *pvr_dev)
 {
 	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
 
-	pvr_fw_fini_fwif_connection_ctl(pvr_dev);
-
 	kfree(fw_mem->core_data);
 	kfree(fw_mem->core_code);
 	kfree(fw_mem->data);

-- 
2.43.0

