Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B948BD5E;
	Mon, 19 Oct 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398051; cv=none; b=WC2mXVrVuCwnY+AZl6PlKGklCu0hbTMg6BxV61zpea+i/htOzI64/+0Ea8OO1p6LukbpTehnozGHle1KrsurpRsi23Mf9iQ7AqUYpyv0hzg4+sXsofaXCku8qppc5NENKN4biNZkrQeJIhTNjb1BFrSTCQM+hIKoui+m/NYj0sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398051; c=relaxed/simple;
	bh=8y4wVXkK7UkL0FqrpZxOJBG0XM4SlV+hM9UPdhbLWfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bPcpX2ZUYWFqoB6ecB2JBZ1CuxdnuS1KMmHgA9JqZd+VJH+ra5oPJ/1JpAkEWEp/NiZuDV8ennFArz8vslgNJp5qkSxPJMN2sm5MRM0oxrDuwT+5ahA4fCwyQ8m9lenVMcupmWIUTVodl5CJRdAp/OEiUifybGuJZ7mi4rnYXvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ppey52i0; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ppey52i0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eZ
	YyjbdJ7XAzU/GTu3H+03IWBbyXZhtRpRfdPARbtlA=; b=Ppey52i0Oa5YjNuEZE
	NDEDG+U8xsKfuPZBUPoNdcF1/u0WMqslVfrMe5lbrA0SiYLqRo1lnSdB5F0hxaZf
	QXQpwSONVGBFK/GL0PJVh5kVxOWrLesMZpqS2ZLQmg6UfIZZKb8A5hLsXPBwg78W
	A19B2SOqLpUu+h9vYAQ75ftKg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v2DL0tVqxMGKAw--.34321S5;
	Mon, 19 Oct 2026 16:20:36 +0800 (CST)
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
Subject: [PATCH v2 3/4] media: wave5: handle encoder runtime resume failures
Date: Mon, 19 Oct 2026 16:20:25 +0800
Message-Id: <20261019082026.1798945-4-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3v2DL0tVqxMGKAw--.34321S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4UKF4kCryfZF4xtrW3GFg_yoW5tFykpr
	yvg3ZIkrWUGr18Xw4xJr43ZF9akws3ur4xCFZ3G3s7AryfXr1qvr42yF15tF4kCrZ5Ja98
	Cr4DXayxCF42vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRwYFAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xT5NGrV0tS1MwAA3J

The encoder callbacks ignore failures from pm_runtime_resume_and_get()
and continue issuing firmware commands. Runtime resume can fail while
enabling the VPU clocks, leaving the registers inaccessible. The
callbacks can then drop a runtime PM reference that was not acquired.

Runtime PM retains a resume error, so simply finishing the current job
leaves PIC_RUN runnable and causes the mem2mem scheduler to retry the
same failing job. On a resume failure, stop the instance, mark both
queues in error, return their queued buffers as errors, and finish the
job. Propagate the error from start_streaming() and preserve buffer
cleanup in the other callbacks without accessing the hardware or
issuing an unmatched put.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index f9fcdf4c22..7359f86f70 100644
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
@@ -1526,7 +1539,21 @@ static void wave5_vpu_enc_device_run(void *priv)
 	u32 fail_res = 0;
 	int ret = 0;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		struct vb2_queue *src_vq = v4l2_m2m_get_src_vq(m2m_ctx);
+		struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
+
+		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
+		switch_state(inst, VPU_INST_STATE_STOP);
+		vb2_queue_error(src_vq);
+		vb2_queue_error(dst_vq);
+		wave5_return_bufs(src_vq, VB2_BUF_STATE_ERROR);
+		wave5_return_bufs(dst_vq, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+		return;
+	}
+
 	switch (inst->state) {
 	case VPU_INST_STATE_PIC_RUN:
 		ret = start_encode(inst, &fail_res);
-- 
2.34.1

