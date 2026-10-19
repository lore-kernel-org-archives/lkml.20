Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17959496D2A;
	Mon, 19 Oct 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398064; cv=none; b=XxyDQ/pW4YbAT9x8wlx0DzHBFsrhJ81/mmXfkSYUWlQHq6ecmNVIdb5GOcLry3qu3mhs47r8seZTBhJgV8sx5EBJZDmzeCyk63HQY+9XmkNpseTkU5H4waC/3G5WzLC3dHLHeBTH+F5SdZmXzBQXO/nG92iO+PgmAaLW79U+oQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398064; c=relaxed/simple;
	bh=grbWc/Xq0UDqEoQdMx3LeLDNwkPyi4KWuwybOVP6X5k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jN9YxL+y763PO16MtaSMwti8oYKx7nlF93YcgYtV6DCZMWDhrZibQF0zoTMV3b42wwawJy17xaIUb2TxzeOz/qWg2Z+MfbaheKDQt+Q6YxfdRNp6YLK3PupfUMcelhIstUQH8QIP2B30UqbXj65k1MTwHp38ob1ea8pb8JxRrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Tz4vKI1k; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Tz4vKI1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yk
	NP8sB9hlsybwqm4giY0mWr2e2OgNPC6r12iM9BcoM=; b=Tz4vKI1kFC+p+BThmo
	etwhsPD1nNKLl2/3BHgu9xoUBsaGW8kO433MeM0kC8WkgQpRX4BAmt4WLrcFNyk9
	gizI+JisFbOiv8lUMQakuRl0Mi5Sd0XlTN8rmz3XbJPw1cOK5qC+2hCp9XKJYGr8
	FAa81JUvHx2AdTAZbtKLdBC9Q=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v2DL0tVqxMGKAw--.34321S6;
	Mon, 19 Oct 2026 16:20:38 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 4/4] media: wave5: handle runtime resume failure when closing
Date: Mon, 19 Oct 2026 16:20:26 +0800
Message-Id: <20261019082026.1798945-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082026.1798945-1-yaojiale02@163.com>
References: <20261019082026.1798945-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v2DL0tVqxMGKAw--.34321S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCryDCFy3Jw4DCF47Zr1rCrg_yoW5ZFWkpr
	yrWF1DCrW8Jw1xKrn7tw4xZasY93yku3yUuas7AFy7A3s5Zr1Fvr4DtFyYyF18JrWvya9x
	XrsFq3y5CF47JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEHUDLUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xf5NGrV0te1bgAA3U

The decoder and encoder close paths ignore runtime resume failures and
proceed to firmware commands. If enabling the VPU clocks failed, those
commands access unavailable registers, and the paths later drop a
runtime PM reference that was not acquired.

Returning the resume error directly also prevents release_device() from
calling wave5_cleanup_instance(). The instance has already been removed
from the device list and its mem2mem context released, so its host-side
resources leak.

On a resume failure, skip the firmware command and hardware lock, free
the close-path resources, and return -EIO. This lets release_device()
continue with its common instance cleanup without issuing an unmatched
runtime PM put.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../platform/chips-media/wave5/wave5-vpuapi.c  | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 4c1842f02c..806901e62d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -220,7 +220,11 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		ret = -EIO;
+		goto free_resources;
+	}
 
 	ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret_mutex) {
@@ -259,6 +263,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
 
+free_resources:
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
 
 	for (i = 0 ; i < MAX_REG_FRAME; i++) {
@@ -272,6 +277,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
 	mutex_destroy(&inst->feed_lock);
+	if (ret == -EIO)
+		return ret;
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
@@ -750,7 +757,11 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		ret = -EIO;
+		goto free_resources;
+	}
 
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret) {
@@ -774,6 +785,7 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 
 	dev_dbg(inst->dev->dev, "%s: enc_finish_seq complete\n", __func__);
 
+free_resources:
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_work);
 
 	if (inst->std == W_HEVC_ENC || inst->std == W_AVC_ENC) {
@@ -784,6 +796,8 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
+	if (ret == -EIO)
+		return ret;
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
-- 
2.34.1

