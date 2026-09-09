Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0176471429
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946746; cv=none; b=IaGr9wPj0FwzFOgcc9joQRBQpPHimy/FnyxpjrfwSPf4cgDMiDI95WQyZhBvBccGdRQdqp2Qkx1oK86dUGYGCoKzlWDxhom6sp8qMpRWgyJlBft18F/ivk0PN+KG8GBNjX6aiFwSryXOoWGJ3geNcbRMlMpA1Bgt1Ael67aeq3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946746; c=relaxed/simple;
	bh=K2ByZ1eO/zYJRy0jLEGVZwl73TyJ6lHMu0Nm7od0/kE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UjSlj4q3iDR5tdZNXLlEF/TbU1LYZXx4Y657atcYX8T3q3XQOIEE3MWabSrzJb4Gs+qnhfqwfPiFbsbAS5maxc0zIhppnMFuo86Z+A2lFEKEZ8ED9DNzNm580sXQcMZrFQpiRG9oBQPqjzTi2+hJB5eyv2x/igmeYz6XN6f70qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4292cb60ac3211f19a56ed5b684f684d-20260909
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c14c31ab-8c0c-44b8-98fe-b4ed70361378,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.19,REQID:c14c31ab-8c0c-44b8-98fe-b4ed70361378,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:7db8b62,CLOUDID:ecd0124f8c1ecf4945b9c1e0fac8627b,BulkI
	D:260909173851GI9TNYRZ,BulkQuantity:0,SF:10|38|66|78|102|127|850|865|898,T
	C:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4292cb60ac3211f19a56ed5b684f684d-20260909
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1446183854; Wed, 09 Sep 2026 17:38:49 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: tvrtko.ursulin@igalia.com,
	sunil.khatri@amd.com,
	vitaly.prosyak@amd.com,
	pierre-eric.pelloux-prayer@amd.com,
	moonafterrain@outlook.com,
	candice.li@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] drm/amdgpu: remove redundant NULL check in amdgpu_cs_vm_handling
Date: Wed,  9 Sep 2026 17:37:28 +0800
Message-Id: <20260909093728.642473-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bo_va is assigned from fpriv->csa_va, which is already verified to be
non-NULL by the surrounding if statement. The inner NULL check can
therefore never trigger and is dead code, so remove it.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 03b41f803520..c978f042ae1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1146,8 +1146,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 
 	if (fpriv->csa_va) {
 		bo_va = fpriv->csa_va;
-		if (!bo_va)
-			return -ENOMEM;
 		r = amdgpu_vm_bo_update(adev, bo_va, false);
 		if (r)
 			return r;
-- 
2.25.1

