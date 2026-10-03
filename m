Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741D38D40A;
	Sat,  3 Oct 2026 08:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014959; cv=none; b=u4KJ3Tgfz+Do1qkojIRUWxHimcqvSjJihwymCyW0bLFe048VpFp4QJ3KL9cgDBSMXvLJqVMMZiq9sGtXHogoXhPh/MJO2/WB5yoZz8WvEb8DS33/5GddtrJw2oVDs2i9MuI4FL7pRExOIrMZRGTYW6rzsGNMi6Sn8WSjHBndjfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014959; c=relaxed/simple;
	bh=ih2yRTm+3N+2cQbKXi623MwkWrf3f+0A0iZktWfDYiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d00Oi/4ap7Y2lcl17fyalD71SX+jQuywKU2hs8cpHA5QrS+gFhdLSlMXAiuaEU5CdZY6Tn2tk49RDiH0VTnMXCq94Zrz6ldxhcMdujC8rrYBJDxPQmA3B04nf71WTw2w+9u9mk/X1yJvymOXYpqvgWx09uga6w7bBJiQZa33JXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DlA4NQkH; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DlA4NQkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aV
	Pj7RFNNRB+UnFlw5vVQUvk6zYjfOsghaVHO5WQKwo=; b=DlA4NQkH+8yGC2BFbc
	MRRgTbo1M0Qmj0UMfvBVU9WCM/ecELc8MeemUO7KNDs8+hgrPBJ3FykWEnI1iP62
	fPsxN5NpOv/qE8Y0P05Qbs8a+AFgqLaGyL/0h/vhMJJxP91EZcogkozsdC9k5QwW
	nkAmYizIyOSsCRsho0etrgXGU=
Received: from pc.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXUUoWuMBqJEyNCg--.37657S4;
	Sat, 03 Oct 2026 16:08:56 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/4] media: wave5: handle encoder runtime resume failures
Date: Sat,  3 Oct 2026 16:08:50 +0800
Message-Id: <20261003080853.430099-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003080853.430099-1-yaojiale02@163.com>
References: <20261003080853.430099-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAXUUoWuMBqJEyNCg--.37657S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF48uw1xuF1xXF43GF1rWFg_yoW5WFWkpr
	1kX3ZIkrWUGr10qr4xAr42vF90kws3ZrWxuFWfCF97ArWfJr10vr1jyF1UtF1kCrZ5Xa98
	Cr4UX3y7Cr4aqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMNtxUUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xn+OWrAuBlNmgAA3t

The encoder callbacks ignore failures from pm_runtime_resume_and_get()
and continue issuing firmware commands. Runtime resume can fail while
enabling the VPU clocks, leaving the registers inaccessible. The
callbacks then also drop a runtime PM reference that was not acquired.

Check each resume result. Propagate the error from start_streaming(),
and return queued buffers or finish the job from void callbacks without
accessing the hardware or issuing an unmatched put.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index f9fcdf4c224b..5a5ee70cd854 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1351,7 +1351,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret = 0;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+		return ret;
+	}
+
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
 	if (inst->state == VPU_INST_STATE_NONE && q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -1451,6 +1456,7 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	bool check_cmd = true;
+	int ret;
 
 	/*
 	 * Note that we don't need m2m_ctx->next_buf_last for this driver, so we
@@ -1458,7 +1464,14 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 	 */
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			streamoff_output(inst, q);
+		else
+			streamoff_capture(inst, q);
+		return;
+	}
 
 	if (wave5_vpu_both_queues_are_streaming(inst))
 		switch_state(inst, VPU_INST_STATE_STOP);
@@ -1526,7 +1539,13 @@ static void wave5_vpu_enc_device_run(void *priv)
 	u32 fail_res = 0;
 	int ret = 0;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+		return;
+	}
+
 	switch (inst->state) {
 	case VPU_INST_STATE_PIC_RUN:
 		ret = start_encode(inst, &fail_res);
-- 
2.34.1

