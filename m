Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1573B48C8D2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055612; cv=none; b=H2iyBndPJsEkVstnzWh0C9cX8P9YhiBccYzxtT5cTReE90lnUcgiB4wjeuSwhSRxVNYC8ftO9y/XRlnoI4Cn2sNuu2ulOzDItck4nFP32YrfZTRrJ8K0f2CouzAjCzfD2avkStrtKNEyqv1CJ7WG3X9VWBenK2pmm0fky6CQl30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055612; c=relaxed/simple;
	bh=cRi6x2IoUIDe1cpioh8hUI0Fi9qcSw8xL5YcTT1TuxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=us973/hKvxFCpnjvh3W7jKLXOuJ36R29Gxwl1hLmtprRrUl+Kln4F+JNP3wBAHw0UYqUlpWWyZkSDOXMfj+MrQ2+eoF508Apc9FxhqFniB0dFkJ9McF+hJYWEnQMtqd7hqWh7HsBaEYmYXrtZBaj1/o9VvIEjeIkZG0oGnKQbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=OtFzbtS7; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="OtFzbtS7"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M5HYCj075256;
	Tue, 22 Sep 2026 06:39:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=wbwTC0PEwT+1K8L3X+Yu9Np
	KjK166tvKiyw2LhiQvF4=; b=OtFzbtS7hU5IevPldRmcPFU0AJa8bQeMkgfOyW1
	4PrCBLXO7RG+dLyqaLdNNEUNCXYazAYwkkrH917Dy/UEzL8PdUOiKj+ZAAfBzeR2
	q9ymyBMG+nCMBJH/L3rAMxsR2qqiITUwlR50DIAp1pZC6IEAFRjnZ9cdoLMFmFBS
	Oe8bfmZ094VwzR5KOidWhQ5ihEsgjvsrZJUbhm/2SlUDnhcKFcT3lIcViazHBz/G
	Ch6hNC0f1U6/x3PzvKy8yAAV1lE0M3CQpL8IzRtGFxmzZ3ez/PylckNkOinT7qW+
	HTiGZB8CjgzbYpVqXR/fDRpSAJw92g+cgq+iaR4lzkGu6Bw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gsgnq23p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 06:39:44 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.88) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 22 Sep
 2026 06:39:42 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 22 Sep 2026 08:39:30 +0300
Subject: [PATCH v3] drm/imagination: Fix parameter validation in
 pvr_fw_object_destroy()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260922-fix-null-pointer-dereference-v3-1-f099763ed676@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAJEUsmoC/43NQQ6CMBAF0KuQrq1pByGtK+9hXEiZwhgopAWCI
 dzdggvjShez+Jmf9xcW0BMGdk4W5nGiQJ2LIT0kzNR3VyGnMmYGAnKhJHBLM3dj0/C+Izeg5yV
 6tPGcQQ5GaSlPUGqlWCT6+KJ556+3dw5j8UAzbObWqCkMnX/u+5Pcen9OTZJLbnNdgLWoMxAXa
 qsBzdF0Ldu2JvhoWqQ/NIiaTJW1usitEtmXtq7rC3XV+2kpAQAA
X-Change-ID: 20260812-fix-null-pointer-dereference-2c891142d988
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>,
        "Alexandru
 Dadu" <alexandru.dadu@imgtec.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Sarah Walker <sarah.walker@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790055582; l=2725;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=cRi6x2IoUIDe1cpioh8hUI0Fi9qcSw8xL5YcTT1TuxA=;
 b=78LKVvnMQ2NavNqEJG0qeFKFliMjO6DQnyU0f6yrfR2E87J6tOTE/HJXwclDS2fiOwEDFLpr9
 m/sLbM5xRnTCXMwR/+W0h63ZO/ZIwHVo12w0AKVBlMzh6zol1neNWyF
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA3OSBTYWx0ZWRfX/+clD6IzyaUT
 iRJScjxPE0iAP5HfRIJlh7zV1JAeR2gBoTBygNK3kQ959elu7m0NnDBjaqIukbSjv13paYj0egV
 uQMeYJORQ236eaNmsEk7Weo1LZOjicCgeFkTL13YGHYeM4cFBC5mJ6lSZTRZ9wCoNMhJ2hjxLf9
 f+09LBUYZYcwZJ+0I47MeOJRm5HnvUKdfND0TSmKcwsmE1aT8Ru9V9vLewQr18kJWlZouYQtpsZ
 cwR1X+yR0N8LB4L2SNyEr7Pn2sBz7IMz2oTRPNxl1yC+CBKBOlLMsPVC//IoR/K0ml/BVNpgK0b
 qMyzKFoEu2Q1I3zUGkzy53ryJyemrV44I4qulVlitJ6yJZJuRe1JpjxcEs77uHn/kI+OyqyekPX
 i0Jc1byzB+f4M8BP9zk32cynBb0whBIfjNFHu8KfDF1mpvBQP9Zi+Tk9XVD5RrDzn74hSnTXzSI
 mCYokacPlo8OJLWhttw==
X-Proofpoint-ORIG-GUID: x-ww0CcH-HSXD9YkWZYOfUDhhUwtHQsC
X-Authority-Analysis: v=2.4 cv=fYs4WEQF c=1 sm=1 tr=0 ts=6ab214a0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=YP7Kpn5otooA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=craggXHLatwVVKPEDpEA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: x-ww0CcH-HSXD9YkWZYOfUDhhUwtHQsC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA3OSBTYWx0ZWRfX85ZrQ4XFSudJ
 n443KM7nGahBI6UCNXCddeBwV5h1Ro9o9rDxAoK7hO3B9FKnX1i2k+XpXJrGSCEHEqM/46saNSn
 lK1gvNb0qfZkg4hx4rUAx8cab0Jdoys=

Fix parameter validation to avoid possible NULL pointer dereference from
pvr_fw_object_destroy() when handling allocation failures.

Sashiko report:
If pvr_gem_object_create() fails in
pvr_fw_object_create_and_map_common(), fw_obj->gem is explicitly set to
NULL before jumping to the error cleanup path.
The cleanup path then calls pvr_fw_object_destroy().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dri-devel/20260810132202.3C16D1F000E9@smtp.kernel.org/
Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v3:
- Skimed the commit message removing redundant information.
- Refactored the parameter validation to return early.
- Link to v2: https://patch.msgid.link/20260903-fix-null-pointer-dereference-v2-1-138ff9b6f805@imgtec.com

Changes in v2:
- Commit message and cover letter updates.
- Link to v1: https://patch.msgid.link/20260812-fix-null-pointer-dereference-v1-1-f69b2ffe9520@imgtec.com

To: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Donald Robson <donald.robson@imgtec.com>
To: Sarah Walker <sarah.walker@imgtec.com>
Cc: imagination@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/imagination/pvr_fw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 850a3ec8e775..9977f4da3d8d 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -1429,6 +1429,12 @@ void pvr_fw_object_destroy(struct pvr_fw_object *fw_obj)
 	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
 	struct pvr_device *pvr_dev = to_pvr_device(gem_obj->dev);
 
+	if (!fw_obj)
+		return;
+
+	if (!fw_obj->gem)
+		return;
+
 	mutex_lock(&pvr_dev->fw_dev.fw_objs.lock);
 	list_del(&fw_obj->node);
 	mutex_unlock(&pvr_dev->fw_dev.fw_objs.lock);
@@ -1439,8 +1445,7 @@ void pvr_fw_object_destroy(struct pvr_fw_object *fw_obj)
 			return;
 	}
 
-	if (fw_obj->gem)
-		pvr_gem_object_put(fw_obj->gem);
+	pvr_gem_object_put(fw_obj->gem);
 
 	kfree(fw_obj);
 }

---
base-commit: bd4f284df04d76fd65e57141cb1e6e7a49e4c3cb
change-id: 20260812-fix-null-pointer-dereference-2c891142d988

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

