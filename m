Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29134F255
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788140557; cv=none; b=GEPlkpiw5+kII026GNALNfQP0li24jdJ9rMVe3xQazCjNrAlfQnuu4enT2BHyldCQadZIuioBiuIjErunhvENnTFx5KPQ05nl2EIGdajrR8wMuS81OHLZWaKFoU6+xruPEBquCVi+f6v9HytVug/ppTTGBYKImeMxr8RhsfWcQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788140557; c=relaxed/simple;
	bh=wl14L1ALbeP7eTwc4vtRUtB7TmNqvU+Se3WJIQRzH4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bigAuyelT35GV2mtNMxJsWZfB3hdSrEz9eEpJME5Z85oM+YsjPhW2qWT0boLk5iOlsEZmdO4cqYCLEAZfn7WRSEHW1n3Z7vlk/lF8CS4p2Wi4TglAciKsczHeivyZosc3Kwg85ejgBbuy4svIiCF4Elm2Wou68/DbDBCtfO4RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 35bc3194a4dd11f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:89a851c6-234a-495a-a881-367a6cd507d1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:432c295c6590c67e35717b2ff5972d64,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35bc3194a4dd11f19a56ed5b684f684d-20260831
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 289995905; Mon, 31 Aug 2026 09:42:22 +0800
From: yaolu@kylinos.cn
To: rodrigo.vivi@intel.com
Cc: ashutosh.dixit@intel.com,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	jose.souza@intel.com,
	linux-kernel@vger.kernel.org,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	umesh.nerlige.ramappa@intel.com,
	yaolu@kylinos.cn
Subject: [PATCH v2] drm/xe/oa: Remove sysfs entry on idr_alloc failure in xe_oa_add_config_ioctl()
Date: Mon, 31 Aug 2026 09:42:18 +0800
Message-Id: <20260831014218.28515-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <apGuQY7vZRIUZghZ@intel.com>
References: <apGuQY7vZRIUZghZ@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Yao <yaolu@kylinos.cn>

If idr_alloc() fails after create_dynamic_oa_sysfs_entry() has
succeeded, the error path frees the OA config without removing the
metrics sysfs group.

Remove the sysfs group before releasing the config, and fix up the
misleading error message copied from the sysfs creation failure path.

Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/xe/xe_oa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

---
v1->v2: using a new goto suggested by Rodrigo
  Link: https://lore.kernel.org/all/apGuQY7vZRIUZghZ@intel.com

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9c5384b95c63..ab09dcff5860 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2435,9 +2435,9 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 
 	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 1, 0, GFP_KERNEL);
 	if (oa_config->id < 0) {
-		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
+		drm_dbg(&oa->xe->drm, "Failed to allocate id for OA config\n");
 		err = oa_config->id;
-		goto sysfs_err;
+		goto id_alloc_err;
 	}
 
 	id = oa_config->id;
@@ -2448,6 +2448,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 
 	return id;
 
+id_alloc_err:
+	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
 sysfs_err:
 	mutex_unlock(&oa->metrics_lock);
 reg_err:
-- 
2.25.1

