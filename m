Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458B3B7744
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030842; cv=none; b=TaLtScXhLINCfjFp1taGlyQHk8BaJdC8lNxV6+Fw4dvcfsHpbqxO0FVxYm08tbz6935HiXp2kI9Qt+CyQ+RrvLCjT7mplItedrI+BjBOkRfDT1iHQ6pluDd1YD33gQX2ddOYMvwpNDG3OlSSJ09iQ1me5fOPInfJmMF17RESDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030842; c=relaxed/simple;
	bh=5p2AXnO5laIlxi2cNbijooQ6rI/ye0N+Lg69/IJEioY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bzfkA4/+/LBRlHygBK8TJ/QRcJ1hYSq2Nu87kgIyN0E3YqIWS+WG33uwNMU1rE8Lm7ZYIYZMfhpR7a37KnyGzBc1hMkSFVvMilekEHoVng2AUx6+u93JP3OPzuY/Pg5nP0AyH9IXFer/SpYpaf51gcB9vwaPOt3xHu0VITdWMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fd7f38c8c83e11f19a56ed5b684f684d-20261015
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9899024b-92d8-4d91-9c66-4289ed14aa36,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:e8908782ca9b5cc8b382f0c1bd9ebbbd,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd7f38c8c83e11f19a56ed5b684f684d-20261015
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1533390645; Thu, 15 Oct 2026 10:20:29 +0800
From: yaolu@kylinos.cn
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: andrealmeid@igalia.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amdgpu: Fix out-of-bounds write in amdgpu_debugfs_gfxoff_count_read()
Date: Thu, 15 Oct 2026 10:20:24 +0800
Message-Id: <20261015022024.49233-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Yao <yaolu@kylinos.cn>

amdgpu_debugfs_gfxoff_count_read() stores a 64-bit GFXOFF entry count with
put_user(), but advances buf/pos/size by 4 bytes per iteration.

Fixes: 0ad7347a64ac ("drm/amd: Add detailed GFXOFF stats to debugfs")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index ab7ccfaea22a..aa44a3f0cdc4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1451,7 +1451,7 @@ static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
 	ssize_t result = 0;
 	int r;
 
-	if (size & 0x3 || *pos & 0x3)
+	if (size & 0x7 || *pos & 0x7)
 		return -EINVAL;
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
@@ -1471,10 +1471,10 @@ static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
 		if (r)
 			goto out;
 
-		result += 4;
-		buf += 4;
-		*pos += 4;
-		size -= 4;
+		result += 8;
+		buf += 8;
+		*pos += 8;
+		size -= 8;
 	}
 
 	r = result;
-- 
2.25.1

