Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DCF2DC79B;
	Mon, 19 Oct 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398051; cv=none; b=jq7o7PtHPRjeQJUZ82403dkft/ttZ2g+WOo0ru7eD3Qi3iTMnpZp7pi/grszetAajiC8HwzpkKpmO8SUG3ZJG/shHWtNH1XWcwOqv50K0Y/fe350GmCfPpGpqNAeqq+m6Jlth4/YkzAsFkxhh93k8kOn8jPhQYgTOkvlvf5XYMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398051; c=relaxed/simple;
	bh=GlyHVzsEqf94smsOW3Odq1Zhrgm6Rsjqa5Hku21MerQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PuwAaTiYqb/XG3orUsWAaV6TmtFQm6myVvxLtETmn6GQhjp6iJaWTSL1z1Rd4dn0YWMUyh+9TP06Kpjh4KoprCdatHlownTEuXzEBtg50VU3TqAPxH1Pr4OZ/G4IkKN6SLsQLSrjU7QIud96NAwEHK2E9gXfG4NcOWiyCTpcwCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=k1JLE5Je; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="k1JLE5Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qg
	/BpZuLFAnUzT5F530YK/M6gRPSKi63r7i6V/HC958=; b=k1JLE5JeeKI9S2TkY6
	B7yMzdp1uEsgveuFPSP6+mAy6Dr+4dI848ECD35eFnZOq9n+aB+yhb3oh1+7SEAI
	qq/9LsJu9+8uherEmlb9qv7lU+tTDmPGuBCjq5vEQXlyn8fQtb2fq11mhnO/wiJ/
	SNqnRGyfpjDHWaFvzK8i/HdZU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v2DL0tVqxMGKAw--.34321S3;
	Mon, 19 Oct 2026 16:20:29 +0800 (CST)
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
Subject: [PATCH v2 1/4] media: wave5: handle remaining decoder runtime resume failures
Date: Mon, 19 Oct 2026 16:20:23 +0800
Message-Id: <20261019082026.1798945-2-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3v2DL0tVqxMGKAw--.34321S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4xJr4fJw13JF4DWF4xXrb_yoWrCFWDpr
	y0gFnIkrWxJr48Jr4UAr4xuF98u3ykXrWxuas3GF97ArWrWw4Fqr1UJF15tF4kGrZ3Zanr
	Jr4qq3y7Cr1aqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMv38UUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w73MmrV0s60hwAA30

Several decoder callbacks continue into firmware commands after
pm_runtime_resume_and_get() fails. The runtime resume callback can fail
while enabling the VPU clocks, so those commands may access registers
while the device is unavailable. The matching runtime PM puts can also
be issued without a reference.

Check the remaining resume results. Propagate errors from callbacks that
can return them, complete buffers or jobs from void callbacks, and avoid
firmware access and unmatched puts on failure.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel panic when closed")
Fixes: a52e6f7923c1 ("media: chips-media: wave5: Resume device before setting EOS flag")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 47 +++++++++++++++++--
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 86bc36ee17..320b40581b 100644
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
@@ -1392,7 +1395,11 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+		return ret;
+	}
 
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
@@ -1556,9 +1563,28 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
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
@@ -1675,7 +1701,13 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1818,7 +1850,11 @@ static void wave5_vpu_dec_job_abort(void *priv)
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
@@ -1827,6 +1863,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
 
 	pm_runtime_put_autosuspend(inst->dev->dev);
 
+finish_job:
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
-- 
2.34.1

