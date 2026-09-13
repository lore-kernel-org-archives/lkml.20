Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6726D3ED128
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303958; cv=none; b=VIUloM5Fpx5fck1TmeiIl4KGND9Qwf3IsJlU2lZk4S+LrVAO33zzQpMuxBBhPDIdhibV17pV8QTlik6UWN5oK9e77scmE24x3efbhzVSfzluY3MHhK1HD/owGDZ/JCHYfyNHojMOavRbaAkdlsTHh36u2HDulPFqRBPqFvDOcHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303958; c=relaxed/simple;
	bh=zgRLC5uW+WkaVACFtWicTtaSsNcd1Mp5hJZmm7Yes8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nFYI93gW9EYlGJgQ6vDqmsvQBkFlh805BV5lr9l1jiZsweF2QRgAq9ZV83MxYD5PZrtRQT08mxecEZJ8/z2pE2UecryCWmGFWVsSS0GB4OlWuCvpdvdRoi1/Jze8q+V1pEebT6a57s3g5MDFDrjzGqwM114KCyp0tcgIeJhwgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=aej3VOP8; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="aej3VOP8"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3fa;
	Sun, 13 Sep 2026 20:52:30 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] drm/nouveau: validate required NET_img regions
Date: Sun, 13 Sep 2026 20:52:28 +0800
Message-Id: <20260913125228.110071-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad38ab103a1kunmc644730d251211
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkxMVh1PS0lITx4fQ0gYHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=aej3VOP82w76HOV1Pkn2hex74ttZ+/C75EM87dAw9JSzuK7yPnMNrcX5VcxDN2q1zCo19dyjbUHZjZbix53PIEdra2lyw8zUu4V1a72Gd229VX6AKlxgVZj/d+hgc1tuN9+MuBXJ/bhAi8Pj1gPdY+3ZonT4hVM3rRrfothnK4A=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=QNpEoAYO5tPIJrxr6Q1S8k9pTa9ZIFsxZipyEXigaYY=;
	h=date:mime-version:subject:message-id:from;

The NET_img parser can finish without all FECS and GPCCS regions.
Reject missing required regions before computing their data addresses,
and release the firmware on both validation and ACR loading failures.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: c4bdac754ca0 ("drm/nouveau/gr/ga102: initial support")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
index 2b51f1d0c281..bfd1e00537b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
@@ -317,6 +317,11 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 		}
 	}
 
+	if (!fecs_inst || !fecs_data || !gpccs_inst || !gpccs_data) {
+		ret = -EINVAL;
+		goto out_firmware;
+	}
+
 	ret = nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr->fecs.falcon, NVKM_ACR_LSF_FECS,
 					    "gr/fecs_", ver, fwif->fecs,
 					    fw->data + fecs_inst->data_offset,
@@ -324,7 +329,7 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 					    fw->data + fecs_data->data_offset,
 						       fecs_data->data_size);
 	if (ret)
-		return ret;
+		goto out_firmware;
 
 	ret = nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr->gpccs.falcon, NVKM_ACR_LSF_GPCCS,
 					    "gr/gpccs_", ver, fwif->gpccs,
@@ -333,12 +338,13 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 					    fw->data + gpccs_data->data_offset,
 						       gpccs_data->data_size);
 	if (ret)
-		return ret;
+		goto out_firmware;
 
 	gr->firmware = true;
 
+ out_firmware:
 	nvkm_firmware_put(fw);
-	return 0;
+	return ret;
 }
 
 static const struct gf100_gr_fwif
