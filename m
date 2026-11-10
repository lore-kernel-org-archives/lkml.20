Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294168;
	b=dM7Q5/ekGjBYrC6BgPB21VRiJBMPBcEzif+ChnN/yLCtchEnZoWuZxy41mQyR4Q68tBb
	 MONF4ltS3BJjHNwlcXqV7eP1at8OyZdKPtdvme1IYYv8QS8Mh/aZsEoJzaWAcyf01jcZR
	 iy3WzMURkY20GT0TRtNxSj8F18KUWxViDS97OHKt8aZzmR+M8HXo0i44oGqrOHqLbA8F6
	 76QF1pBSrLalp+RhYHebnzM5Feyv+BO6bYuTf0nF5yqOR0FnARpSTAuDzM7Pxcg1pXHIr
	 rvkXmXvyyv5BDTMg1O2gSYjPQMUU5uwzQoW9yt+YaFqunAozmI0/kFUUJDVoxWlqJSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294168;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PdalA2lMsvhmzKK5z4/olxydbRPPxHSQukiE+bWcq2A=;
	b=XJ6aOqR/SH05tIzE8CLX11JzC1yBwa6kAUIjEEVuvsIQkUnPH0BmgD+Vom6Q2k2ycLS/
	 Qk0WQp/TprAcYXwyBei5GFG0Ck+QB901bSSmPMDHvJidkTroHRWrikgUWZVZdKI2lRZTR
	 JjVR1UvIbIxcNRbqeWSpHgRaMO8ozu8L2ocAephb8FIZy+8LXjEfnVnzXZ5LP5EipAFhZ
	 2bMVS4YH4IhAT0ELl3GLjmiQitCF5X49UO8AFCLVayek8SA4nOTG5H8oac5qjC2+EHciu
	 mtjQOSXPdvnuLap5fXBiw9g4ebThqEdgmEHSE8gAzprE4VJXwsAm4cXuH6Joa5GY+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b5846462dcd411f19a56ed5b684f684d-20261110
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9be663ea-f5de-4dbf-9979-2add6c209046,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:c5ca694d64765e5f5568255934526006,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b5846462dcd411f19a56ed5b684f684d-20261110
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1689587472; Tue, 10 Nov 2026 15:02:36 +0800
From: yaolu@kylinos.cn
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: siqueira@igalia.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amd/display: Don't free devres-owned i2c adapter on init failure
Date: Tue, 10 Nov 2026 15:02:03 +0800
Message-Id: <20261110070204.307887-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Yao <yaolu@kylinos.cn>

amdgpu_dm_connector_init() registers the i2c adapter with
devm_i2c_add_adapter().It will be released by devres on teardown, so
we don't need to free it when failed.

Fixes: 5b3eca05cfb0 ("drm/amd/display: Use devm_i2c_add_adapter to simplify i2c cleanup logic")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index b498fc5fbb14..ccbda54c3add 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -3514,7 +3514,7 @@ int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
 	if (res) {
 		drm_err(adev_to_drm(dm->adev), "connector_init failed\n");
 		aconnector->connector_id = -1;
-		goto out_free;
+		return res;
 	}
 
 	drm_connector_helper_add(
-- 
2.25.1

