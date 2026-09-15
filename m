Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD945FFA7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457283; cv=none; b=dgeZ09bjmv6SayLFmkUbusYRsNAGhWUZt4UG4H3gv9mKDs/ex04ZCAJutt59Mbz/ogFEryYPB9PU0ui1o8BoezuyOUrc9qsA3BAIVzO+Y/UlmnUgTHMNa6b9RBSoKsrHDznEaA+Wnc8Q5NxRgDLmy/Uz8kpUMgs4kFws8AKyhRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457283; c=relaxed/simple;
	bh=Y3OX0jd/Z83OA+gPEH2LKOvtVR+61d5HQabj+SUA730=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=m6dLy+gqYOB4x4QNu2T6sQr3REA+Ku436kwUCNH7mISx2dJVa9QpDjf/LsFMPDkskUHM/SVC9S3TlWEo8jOYQj/iMPGPu6XuDaWjs2yy5JFFs7EUOhlUxW8XF+ucmBfFhDWtPwKaRkAqCOGlyGdkqNmUwKdx+XsyJQeZeT551Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=o5tSx8eg; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="o5tSx8eg"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6YxAu2004760;
	Tue, 15 Sep 2026 08:27:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=4ocDuE+LZHoT9EkkvNvxuhG
	2y8fYFZ0tjDljbOBLmu0=; b=o5tSx8eg1A7o7V4ZHWux2U29BWTDv59n2DSjLUI
	OniGJqNHHpxWYCT/PkZfW+D99uCdSXtY9YmycNP9T5ZfKleFKH2vKoZVdUh6rCjd
	7VEqx26eS+0P8Speww66D14km6jdxiLpwe+i18W17xr2EfdHKkqeW/gvT/5YUo3M
	utFMMSyGIFR7iGMqQL7VeVZye6qhUFAkzhz8l6N4yLVr+kjuGonBibE2YxKhPo/g
	lE2XJb6+qPzA1esgdmbGRO+jLVAcrGK8O4CSb5czyHnl4zDgU4ffOnr1MrwKcaYG
	8AgfDga2LIwrNIkQHvAZkDJjWrR6L08JuQ6vAsLEiNHchNA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4gmxtujb9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 08:27:40 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.88) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 08:27:38 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 15 Sep 2026 10:27:26 +0300
Subject: [PATCH v2] drm/imagination: Remove duplicated CCB control
 initialisation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260915-b4-upstream-remove-duplicate-ccb-control-init-v2-1-ba0a6ae63a20@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAF3zqGoC/52OQQ6CMBBFr0K6dkyHEERX3sOwoNMRxgAlbWk0h
 LsLeAOXL3n57y8qsBcO6pYtynOSIG7cID9lirpmbBnEbqxynZe6Qg2mgHkK0XMzgOfBJQY7T71
 QExmIDJAbo3c9yCgR2KLmskBboVHb5uT5Ke+j96h/HGbzYop7ZDc6CdH5z3Eo4e79204ICAU3l
 6tBLE2h7zK0kelMblD1uq5fvGUV1f0AAAA=
X-Change-ID: 20260810-b4-upstream-remove-duplicate-ccb-control-init-ed10e641d81b
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
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789457258; l=1863;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=oS5YYP451s1JsaYCpn+B5vhA8YL8bYNleKtdB1FETXM=;
 b=zjUyzqzmn0gYBL3105ppEfdNvIYoAT8Th9YX+mnhkrNPczRDMYTnSlJTF+zwgMUrQ63Ceoa45
 3KpKxpH3pmVCupLGL5mN13dCzhpmgZ5ltJhHprES0OEWOjDAJDBBPhy
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Authority-Analysis: v=2.4 cv=Se9i5fRu c=1 sm=1 tr=0 ts=6aa8f36c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=YP7Kpn5otooA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=ZgQMqL77xtEQzMyY3PEA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: N4o_DY5tTz_SBCkts_UhiztKP-3WVgA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNSBTYWx0ZWRfX79Sj3xK4SzDh
 oO5CLsgbuq0YSPVyMTgsXjkPubvhirgHtng660Df8ZQOO1SWZuFdH46KjTxp4TYq9JGTz7GWxwq
 /Wk6oNISwJWIkGFCOCqXoScE8WaCYNJ4rT0b3Dt9asne+bhPpvDSzE+dERtrNxVrmRQwVfDK5K2
 /TarTv0vUcnPTdUE7xhhnvAyaUOzI6eySDrdHYoBJuPcczIwahNL5qQONmkpWT9TwaLy9RFWuGo
 O3Z3wSK5kBewB8aBko7UE+PpYt0Qx2xPdHA0OXAu5R76jnuHbPb61GRIcpeWzbL4M8w6/PMC2LG
 BF+vMlSliDT+dJJZy74Jjh+qyCh9vxt2E+FyfbKF7G7nR9WG+O3PSsWQO8RbTtvO6NQngjhmnHE
 54q5um5F76J98cuBLYko5SrcXg7p2yvRxkTbWRUMfbori5vLBD0EYlaCd3s3Y7zE+xhOpDAVjsc
 SnEqSttnW/0jJCaYZrA==
X-Proofpoint-GUID: N4o_DY5tTz_SBCkts_UhiztKP-3WVgA0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNSBTYWx0ZWRfXx9Pk4hin+hJu
 pwsweSIEv+oSKL4lolYlbgo52WUNwKVBpSu3wEzbvxtTOH1zxRGannHYGbbbCinHwZUEbqZvxHa
 zIpETOE8hSOaVBHwqSa4bCr7eudWHbE=

From: Alessio Belle <alessio.belle@imgtec.com>

The same is already done by the ccb_ctrl_init() callback.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Reviewed-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v2:
- Added Signed-off-by and Reviewed-by lines in the commit message.
- Link to v1: https://patch.msgid.link/20260810-b4-upstream-remove-duplicate-ccb-control-init-v1-1-4ea79b116b40@imgtec.com

To: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 4accf18e2341..48672a86ca2f 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -82,11 +82,6 @@ pvr_ccb_init(struct pvr_device *pvr_dev, struct pvr_ccb *pvr_ccb,
 	pvr_fw_object_get_fw_addr(pvr_ccb->ctrl_obj, &pvr_ccb->ctrl_fw_addr);
 	pvr_fw_object_get_fw_addr(pvr_ccb->ccb_obj, &pvr_ccb->ccb_fw_addr);
 
-	WRITE_ONCE(pvr_ccb->ctrl->write_offset, 0);
-	WRITE_ONCE(pvr_ccb->ctrl->read_offset, 0);
-	WRITE_ONCE(pvr_ccb->ctrl->wrap_mask, num_cmds - 1);
-	WRITE_ONCE(pvr_ccb->ctrl->cmd_size, cmd_size);
-
 	return 0;
 
 err_free_ctrl:

---
base-commit: e55fead22ff9ee047ab9f1903860c4b43043514e
change-id: 20260810-b4-upstream-remove-duplicate-ccb-control-init-ed10e641d81b

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

