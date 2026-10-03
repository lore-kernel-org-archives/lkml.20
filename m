Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEAD2E888C;
	Sat,  3 Oct 2026 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014954; cv=none; b=TBykIiR0IxCVF3tqDUEK1zXBhWvJlzORq3vDCTdDZzK9wrKedCBZM4E+KXVUT03VpTnUiONv4JPTF9iN7v+ajci1cSH9VwKSi1oFIzMbLZMVvqAKS3sBDyxw1BkseQwdOYu1WY/HImuC26YCaauW5qWhtDEWJ9fFFmTA+inmcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014954; c=relaxed/simple;
	bh=L2u1ijRftuA+HIUhUtl+HzQOPM6n3OW1cFI3RtiGIPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZIY4rzVpU96heFDGRj28gCrcWfrl7N3H9J9IT3z1SzSEpmJr0SL0jqC841onLLfU3VrU5bstTzmxByBoHtBUMIHPLz5MsvG+rIBf3ylcMv+A1EiXi6DEfIFkOGF+9tEWwyFNFqV8VuTVis521/MuDzVhUJ34jd+j6zEqzuGDhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CMg4k9zQ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CMg4k9zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=I0
	1oUVQ79uhO/z5IJPaOenYRvCSeAkAnIXP/sOH/Q0k=; b=CMg4k9zQ7dNC0onJT7
	rU0072Gdcpi7gEvoEiFSjJgtJMy92WT+Bw8Q6D6PENvvW57UuQrBwN+/5+xHz+ha
	o0022rNkUENIJE/VY44ASmRCWqfKV5qM+FeHb9GhidRpd2TlxOHTls86BYFS4Gqq
	vtu1XWvj862njexi9ck36WYuc=
Received: from pc.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXUUoWuMBqJEyNCg--.37657S3;
	Sat, 03 Oct 2026 16:08:55 +0800 (CST)
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
Subject: [PATCH 1/4] media: wave5: handle decoder runtime resume failures
Date: Sat,  3 Oct 2026 16:08:49 +0800
Message-Id: <20261003080853.430099-2-yaojiale02@163.com>
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
X-CM-TRANSID:PygvCgAXUUoWuMBqJEyNCg--.37657S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4xWw4xCrW8XFW5uFWrGrg_yoW7JF45pr
	WFgFnxKrWxJr48JrWUAr4xuF9093ykXr4xua93GF97ArWrWw40gr1UJF15tF4kGrZ3Za1D
	Gr4qqw4xCr1aqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMUDGUUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xj+OWrAuBhNhgAA3x

Several decoder callbacks continue into firmware commands after
pm_runtime_resume_and_get() fails. The runtime resume callback can fail
while enabling the VPU clocks, so those commands may access registers
while the device is unavailable. The matching runtime PM puts can also
be issued without a reference.

Check each resume result. Propagate errors from callbacks that can
return them, complete buffers or jobs from void callbacks, and avoid
firmware access and unmatched puts on failure.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel panic when closed")
Fixes: a52e6f7923c1 ("media: chips-media: wave5: Resume device before setting EOS flag")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 55 +++++++++++++++++--
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 6564cf3ec739..467c68931e8d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -829,7 +829,10 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
 		 * accesses VPU registers via send_firmware_command(), so the
 		 * device must be resumed first to avoid an asynchronous SError.
 		 */
-		pm_runtime_resume_and_get(inst->dev->dev);
+		ret = pm_runtime_resume_and_get(inst->dev->dev);
+		if (ret < 0)
+			return ret;
+
 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 		pm_runtime_put_autosuspend(inst->dev->dev);
 		if (ret)
@@ -1302,8 +1305,14 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		return;
+	}
 
-	pm_runtime_resume_and_get(inst->dev->dev);
 	vbuf->sequence = inst->queued_dst_buf_num++;
 
 	if (inst->state == VPU_INST_STATE_PIC_RUN) {
@@ -1386,7 +1395,11 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+		return ret;
+	}
 
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
@@ -1550,9 +1563,28 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	unsigned long timeout;
+	int ret;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+			struct vpu_src_buffer *vpu_buf;
+
+			inst->retry = false;
+			inst->queuing_num = 0;
+			while ((vpu_buf = inst_src_buf_remove(inst)) != NULL)
+				;
+			inst->eos = false;
+		}
+
+		v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
+		wave5_return_bufs(q, VB2_BUF_STATE_ERROR);
+		inst->empty_queue = false;
+		inst->sent_eos = false;
+		return;
+	}
+
 	inst->empty_queue = true;
 
 	timeout = jiffies + msecs_to_jiffies(VPU_DEC_STOP_TIMEOUT);
@@ -1669,7 +1701,13 @@ static void wave5_vpu_dec_device_run(void *priv)
 	bool cmd_issued = false;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+		return;
+	}
+
 	if (!inst->retry) {
 		ret = fill_ringbuffer(inst);
 		if (ret < 0) {
@@ -1812,7 +1850,11 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	 * device must be resumed first; otherwise the register access faults
 	 * with an asynchronous SError.
 	 */
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		dev_warn(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
+		goto finish_job;
+	}
 
 	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 	if (ret)
@@ -1821,6 +1863,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
 
 	pm_runtime_put_autosuspend(inst->dev->dev);
 
+finish_job:
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
-- 
2.34.1

