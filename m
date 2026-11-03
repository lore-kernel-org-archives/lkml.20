Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699750;
	b=yFuxRr5JPWeaSDDW1+fr1j2zJZBJUhx7by247IPc8nHOo4uIcp20D4hCYD6u8pgdNOSI
	 Wh+hGZFgmzrP5XfxxFi2ax39ZCXWTBqYqIXAmzE45Af7lGufC3GuNPBmhjeVtLFgESSAF
	 rzQX1yhNIvJcgYX1fzmJZ5MF94yC/3m05RL2P/RDwKk4UCHW2uGWleur3od8r0JKsK3rD
	 THQQxHQosWYIKQYS3APSJfv5C46fTrGFVI6RqpgzJt2aJbtS6vGLx7b4icF2qiEbNBkFc
	 0qwKzZLgZ6vhMl0s9009++CSKqcMPUhw15YfOx8Mc4EN/z7rLpggvXbgNuhLaPa3SZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699750;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3ZS1vOKZyrfxcTezsSkwY8lI1BDbkMl5GmvQVPt0Z0Q=;
	b=fZiEnjgOpH1ReMjU4YLyDO8wPFbrc+bk5F46RZrNBcHNaPA3ZI4Z6CFyg4DLZs2EN6mc
	 J3bisO/MsDaFSuIEYbjXFlbXWXtEGVVQ37HXwrsBgmUBOjiapgOfb2truZVyyr6ywdOmi
	 Z0hjIQarX5F0NgMxeJun2zgy6patwCulZ1butvj8zQdcr369Kfj7bceXJ43vksGCQ0/cE
	 mkMH14TxgLaLz8QTNPcXtatiDgI/hqKvWZKA7sbLc7An8s5W2evGPID8END79M08R9I44
	 qsJ+CiR+HdIRH1P3pHh2PBj0VIT2E/fY8MmMutkEIDlw4zR8T4rXM94txKYPsUq11Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEOGyob5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E976606D827;
	Tue,  3 Nov 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEOGyob5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4B81F000C1;
	Tue,  3 Nov 2026 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699749;
	bh=3ZS1vOKZyrfxcTezsSkwY8lI1BDbkMl5GmvQVPt0Z0Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EEOGyob5aiYt/L2/udwpfLOPFJjYdOEaiDgMsC/nHOLVjYF8wuuDDzyjIpVM2N4du
	 g4G0cYzzuGAPk3UZYAOKTfyeE8NZjQ+FlENIdtdxvekkVqAaG0v3xGtyI0jdUnFEkl
	 Or77K4PvVebrr9Q4OWFpn/LX90phpXH/qbMufZWLuC8V8jlGwF7K9xH/XgbB5qr2cU
	 yi4VlyC8aK+XUM1fRg4NlPLPOfDS2I1cvnoSniPlqRQNiG/Tr/e4ksQo9/ollfhdSW
	 DMxBkOXTumNskGiK4scO8ezKqBrBhUlZe+cTAl/JpNC28dR5ALRnUmMPMJl37qOeQM
	 K1/J59+QRaplA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] soundwire: qcom: Serialise ctrl->intr_mask updates
Date: Tue,  3 Nov 2026 09:53:53 +0000
Message-ID: <20261103095445.81414-10-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

qcom_swrm_irq_handler(), swrm_runtime_suspend(), and
swrm_runtime_resume() concurrently read, modify, and write
ctrl->intr_mask and program the interrupt enable registers without
synchronisation.  Overlapping read-modify-write updates can clobber
interrupt mask bits and leave the hardware interrupt mask out of sync.

Add ctrl->intr_lock to serialise accesses to ctrl->intr_mask and its
associated interrupt mask register updates.

Closes: https://sashiko.dev/#/bug/linux-ea523727-6467-42aa-850f-8f838e4b84a8
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 785096b232f2..cc1b07e2406d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -202,6 +202,8 @@ struct qcom_swrm_ctrl {
 	struct completion enumeration;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
+	/* Interrupt mask and broadcast completion lock */
+	struct mutex intr_lock;
 	struct clk *hclk;
 	int irq;
 	u32 ee;
@@ -784,7 +786,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 
 	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 		       &intr_sts);
+	mutex_lock(&ctrl->intr_lock);
 	intr_sts_masked = intr_sts & ctrl->intr_mask;
+	mutex_unlock(&ctrl->intr_lock);
 
 	do {
 		for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
@@ -820,10 +824,12 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				dev_err_ratelimited(ctrl->dev,
 						"%s: SWR bus clsh detected\n",
 						__func__);
+				mutex_lock(&ctrl->intr_lock);
 				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 				ctrl->reg_write(ctrl,
 						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 						ctrl->intr_mask);
+				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
 				ctrl->reg_read(ctrl,
@@ -863,20 +869,24 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				dev_err_ratelimited(ctrl->dev,
 						"%s: SWR Port collision detected\n",
 						__func__);
+				mutex_lock(&ctrl->intr_lock);
 				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
 				ctrl->reg_write(ctrl,
 						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 						ctrl->intr_mask);
+				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
 				dev_err_ratelimited(ctrl->dev,
 					"%s: SWR read enable valid mismatch\n",
 					__func__);
+				mutex_lock(&ctrl->intr_lock);
 				ctrl->intr_mask &=
 					~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
 				ctrl->reg_write(ctrl,
 						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 						ctrl->intr_mask);
+				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
 				complete(&ctrl->broadcast);
@@ -910,7 +920,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				intr_sts);
 		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 			       &intr_sts);
+		mutex_lock(&ctrl->intr_lock);
 		intr_sts_masked = intr_sts & ctrl->intr_mask;
+		mutex_unlock(&ctrl->intr_lock);
 	} while (intr_sts_masked);
 
 	clk_disable_unprepare(ctrl->hclk);
@@ -952,11 +964,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
+	mutex_lock(&ctrl->intr_lock);
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
 	if (ctrl->version < SWRM_VERSION_2_0_0)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
-				SWRM_INTERRUPT_STATUS_RMSK);
+				ctrl->intr_mask);
+	mutex_unlock(&ctrl->intr_lock);
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
@@ -997,8 +1011,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 			0xFFFFFFFF);
 
 	/* enable CPU IRQs for the selected EE window */
+	mutex_lock(&ctrl->intr_lock);
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-			SWRM_INTERRUPT_STATUS_RMSK);
+			ctrl->intr_mask);
+	mutex_unlock(&ctrl->intr_lock);
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
@@ -1686,6 +1702,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
+	mutex_init(&ctrl->intr_lock);
 	init_completion(&ctrl->broadcast);
 	init_completion(&ctrl->enumeration);
 
@@ -1851,6 +1868,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 		if (ctrl->version < SWRM_VERSION_2_0_0)
 			ctrl->reg_write(ctrl,
@@ -1858,6 +1876,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 					ctrl->intr_mask);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 
 		usleep_range(100, 105);
 		if (!swrm_wait_for_frame_gen_enabled(ctrl))
@@ -1879,6 +1898,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	swrm_wait_for_wr_fifo_done(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 		if (ctrl->version < SWRM_VERSION_2_0_0)
 			ctrl->reg_write(ctrl,
@@ -1886,6 +1906,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 					ctrl->intr_mask);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 		/* Prepare slaves for clock stop */
 		ret = sdw_bus_prep_clk_stop(&ctrl->bus);
 		if (ret < 0 && ret != -ENODATA) {
-- 
2.56.0.385.gac671c819a-goog

