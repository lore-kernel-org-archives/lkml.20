Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E011FC0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897313; cv=none; b=kxVDNRBe2r6C2jpswUm9lLVKL5rbPCvFAdkmAmunle2zY9Wzgr/dKBNbY8RtvXeceUiNwQw0g80qOtlVTX0jVo7rHwVpCRU6z3bjoAis0jDdXz35mwUJgqzD5Vt9OYeUEZi7p9LGMgCprrhRP0eYjLMzM/yVoi1S1htbb5v/jwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897313; c=relaxed/simple;
	bh=kRF8W4tt6ouPHr9iMld1ctj5gU77eZmAGbniQOc/n3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=abRgU6f6TfIL9mU19wrDeG7Kc7518EHW7JGa3dWsOPHr1AB88PHCF4CTpRJymeyfmNA+Qzl1vyDKsZcZYbqni77yQF9usCLxH959HkTgms7/klaB2vNm8vBqeZ3CJJ2nSks8JmftvzBO2S4cDyezc0+HytnBMXrLym2xxmy7UpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: dd237908a2a611f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0dc33ee2-f55d-4ff0-bcd9-4249761a6d53,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:cf1f5691a1d2daf4f2f77cd3eff4e906,BulkI
	D:nil,BulkQuantity:0,SF:102|123|136|850|865|898,TC:nil,Content:0|15|50,EDM
	:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd237908a2a611f19a56ed5b684f684d-20260828
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1210124518; Fri, 28 Aug 2026 14:08:18 +0800
From: yaolu@kylinos.cn
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: umesh.nerlige.ramappa@intel.com,
	jose.souza@intel.com,
	ashutosh.dixit@intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/xe/oa: Remove sysfs entry on idr_alloc failure in xe_oa_add_config_ioctl()
Date: Fri, 28 Aug 2026 14:08:12 +0800
Message-Id: <20260828060812.163548-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
 drivers/gpu/drm/xe/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9c5384b95c63..73e51db13f56 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2435,8 +2435,9 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 
 	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 1, 0, GFP_KERNEL);
 	if (oa_config->id < 0) {
-		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
+		drm_dbg(&oa->xe->drm, "Failed to allocate id for OA config\n");
 		err = oa_config->id;
+		sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
 		goto sysfs_err;
 	}
 
-- 
2.25.1

