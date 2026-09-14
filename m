Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BEF45D935
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388561; cv=none; b=AMGqh66s/9EB0DuxoccMaD4MCeIO5nBWw/6OOveCJypKoFLkXnLz0VF4fWK0KoyqwoGVf+FrEw3gD6jovUsX+Ur81y/2qO0kPphyMZZdEf41cgl0GqKXJPqzDdtpH++8s+mhfZPH2wFYU2srDHgGHzfd9eBKiFxhPs7rIzZdxSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388561; c=relaxed/simple;
	bh=CQqAqNIaZjP4veIFc1cwdHHxw2RFNje+EiTtOWU00aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Vr9QiZiS9jt6KGWirjFbmI06I9N0PQ7h9I5ziQhbiWAJ7fsYRw7ZJqvgNvtIAlO/WoLwZDalAkokYhiSlMJ7uNmsZpO/Nbx6pP+L5RMhOcqngp9iWa+KQVUvfsTqC6LWfNB904Tk/eHaG3CFXxB3EHuaS/t4nr3Cn9+7Aijhf3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Yh0EST8W; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Yh0EST8W"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nSLP3968925;
	Mon, 14 Sep 2026 13:22:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=Lx3zuy+iPKuZEM7t1bg0Q0f
	zhR5rofzlUOKm2HoWC/c=; b=Yh0EST8WJnEL/8KQbR3GzkSBnq2gvREWhfIMDnU
	ZSmK33BorpAfXLINdhA3x+Ph7DFn5tZi2oU/1uj0D6WOOynS5+sgM3L3bgXd7wdy
	HewfInTrkOc3Ros9/IAsCwyJ2j6BxqHpRA1eDRn09sVVek5r+nj1oXy4wlQraBuC
	3BuxX2Gz9zTKp9+WscF821mfUSfsUPx60lsuqS7z/opkJNrrlP+BcJmFG4SyJ7D4
	sjdqRDj+b6aVq/qawoGCHUQ5omLmeb6RU7oj0HB/FWUBo0TbZWP0LXGjhnshm6lS
	ikLO8xbdUDUqcrcQ6svsTx09J47A7lAmoIMBcDzkCdNmATQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4gmxtuhky2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 13:22:03 +0100 (BST)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 13:22:01 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Mon, 14 Sep 2026 15:21:37 +0300
Subject: [PATCH v2] drm/imagination: Explicitly set CACHED flag on META FW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-b4-cached-flag-on-meta-fw-v2-1-160b0e4e160f@imgtec.com>
X-B4-Tracking: v=1; b=H4sIANDmp2oC/42NTQ6CMBBGr2Jm7Zj+oKIr72FYtMMUJhFqWoIaw
 t2tnMDle8n3vgUyJ+EM190CiWfJEscCZr8D6t3YMUpbGIwyJ1WrCn2F5KjnFsPDdRhHHHhyGF7
 oVfDmWF+8Oxso+2fiIO+tfW8K95KnmD7b1ax/9p/qrFGjtdYTBa1a624ydBPTgeIAzbquXzjmd
 WnDAAAA
X-Change-ID: 20260804-b4-cached-flag-on-meta-fw-b0fb2589ba72
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789388521; l=2098;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=pk5CzGMv6wfqQ27YN+s2fZ93xkhlABGu0wmEGpqqng4=;
 b=YCUBszvHoH9rvt5rQxm5yV8fgEnnuftaBr+bE5nMp2UvsJR452loPbjq9kGGRJFGM0uyrudc0
 THlU8uSQF+ABZgRPIVbiBgjIgbgUs+e+tWiCqAtLGN+xIYmTzXJSwW7
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Authority-Analysis: v=2.4 cv=Se9i5fRu c=1 sm=1 tr=0 ts=6aa7e6eb cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=XEBLIeaGfW8ddilKDEYA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: L0lO9eqNwbGKGxgxk4DV_X_cIGVOwybi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX53bLV9r1B00h
 UzP+w79pDcYZxiCDP+yVmtUDT/ede9V7mfwGrICl/jhWDeyOirgOFHGcKZLUqMTZ8fsJi+6fz68
 qL8Be7Vwhn2uBLeZe1fEazkGrPme32QJLmiuqQy+jNTnTxvlyWfhlvGBMVuwGYNdR3TEmjxwDdH
 RbdKI4pwgbX/KFwEh2XX2xYw6C3cOU9J89SFY7UqozYdIuay19hZ7RnnCKpbwYGkHgb7Z7nVsXa
 L01s2b/ruUZiu+E81FHiQLJNNgZzM2yaIHyIL9qT3RTL5721v89LXp8oXHqTRmPQ3w1eFW02MzJ
 AAD6wd/blz1O05HK/hl5NH9kwm4Q41F/iHMMaYGkf0zuGgDpO1EPsVIjE9GxuLJDY+6LtIz7/x/
 3sQ9RBfOReGnyDZpOY7a8am/s3YWGBbtIyBHSn0NPuGHlHlK7R/WpP7mEJlC6WgBSeceZ4tghp2
 W+xK8qEbl6INSv1PbdQ==
X-Proofpoint-GUID: L0lO9eqNwbGKGxgxk4DV_X_cIGVOwybi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfXzXn/rSYNxh5/
 C6o4pmdzsVlbzKTLhYsOvLhBf1iyi8t3AMKeLfEuGAxcm4rrpSYVsRd/kxGzq6DmMF7BDAwAnqA
 DPxZBBXsmcjIfB9lMyZQos+i3O6FbLA=

From: Matt Coster <matt.coster@imgtec.com>

For completeness, OR in the CACHED flags when we're not ORing in the
UNCACHED counterparts. One of these is probably zero, but (a) it isn't
evident just by reading these lines, and (b) the compiler will make it
disappear in that case.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v2:
- Update the author field to the correct value.
- Link to v1: https://lore.kernel.org/r/20260804-b4-cached-flag-on-meta-fw-v1-1-333bccf10d3a@imgtec.com

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
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 9ff03bc60a08..b5837ba56e33 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -509,9 +509,13 @@ pvr_meta_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
 	u32 fw_addr = fw_obj->fw_addr_offset + offset + ROGUE_FW_SEGMMU_DATA_BASE_ADDRESS;
 
 	/* META cacheability is determined by address. */
-	if (fw_obj->gem->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+	if (fw_obj->gem->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED) {
 		fw_addr |= ROGUE_FW_SEGMMU_DATA_META_UNCACHED |
 			   ROGUE_FW_SEGMMU_DATA_VIVT_SLC_UNCACHED;
+	} else {
+		fw_addr |= ROGUE_FW_SEGMMU_DATA_META_CACHED |
+			   ROGUE_FW_SEGMMU_DATA_VIVT_SLC_CACHED;
+	}
 
 	return fw_addr;
 }

---
base-commit: e55fead22ff9ee047ab9f1903860c4b43043514e
change-id: 20260804-b4-cached-flag-on-meta-fw-b0fb2589ba72

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

