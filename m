Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699756;
	b=pwqM2K143HYtBUPnKQ93JVjHzabHBwa2nDwgcvecct+SAanLCvr0+jw8ywAJkGYXAdeJ
	 wFJVeFh+brIJF7IZGxHaLL00811NzBQ4R/Ktres0m6C/SN8WSCNe/wWIln9srMcaDvlYz
	 z8C/wKSbtjjIprSYsoFaYzq7PsUjHMOLLW3Xxdj6dOPVqxZBt9qqRmbQ+KUZC/R+7dn45
	 I+l6DlsHcSTHH4duMYV5a0I9o6YOO/Qqb5QwVPj2sNIOH6hCVie/rPxo0/bORO9Op8mTY
	 fAJT6puEhAadlgqI3L3+81wQ5j2mAr+g/K0Be3cfAHpwK+XCFd3tmARj29tPf80M83w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699756;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u9C0noDZUuF29X+Eyq1i5/qpXHt3ONsIzFiuxXO4xv8=;
	b=iA9SrJgGgCVDy1F1jhU/xk1RX662iXslUE30kRJxSkqJI34LgJbI3jRAa+sY1mTbMrjk
	 yGFQ5Icw2NQj578fZ6rMfOk9MmJ4ES/2Z26zDmaGnpq+9m/pifqVIYmK/8g7XlFAmU6g0
	 WxlvC7jwDoSayJmglr4skBK4qaFoPeMibrDS0xrSC7oDWMEBEGbuSn8Kn0uDbfD3uHMFQ
	 5M7fZ44bUExJbGvxWH81BNqt+gNYQV3qWWlHm2Pdyx6lfsLMsuvVRID20AuadURZ22GLG
	 79m/YxBLwQAz+UfPg9GHGH9RF9UuorBI2rjyNwZim7iVgF9NhOjsenIO1f/vKgQ775A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B72P88Od;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F18606FAEA;
	Tue,  3 Nov 2026 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B72P88Od
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951BA1F00919;
	Tue,  3 Nov 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699756;
	bh=u9C0noDZUuF29X+Eyq1i5/qpXHt3ONsIzFiuxXO4xv8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=B72P88OdYRcfQGNbKveBjOtEI00kDqmx/CCjxHS0X4Fq0Z3sLy3USfZNCmWyUKzmy
	 76rHlPUlqTb8TONmIJWOWMgmXOcZEBGy1I6cCeDGBrdVelYZRvGTrPB0QKkDxtYs36
	 4D6aU4vUASdkRcT5vhtvc4i5PlMu+lERDEwRFsqtaza/sSIcR9SmyJmAls6RrX5lNN
	 GEExmhmNNR94SFG1O06o9ZWaoP1q9LVAK24khUzUkql1Wh+8owmZPk00oHR56LW8iP
	 fVSowTggwuYeF2TcpCmVOZQod6iZxvbpgo4qA6A2Hj6jeHxtPS9s+lfMlW7bvd37j4
	 JWxxHnvI9prDw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] soundwire: qcom: Prevent stale broadcast IRQ from completing subsequent command
Date: Tue,  3 Nov 2026 09:53:54 +0000
Message-ID: <20261103095445.81414-11-lee@kernel.org>
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

When wait_for_completion_timeout() expires for a broadcast command in
qcom_swrm_cmd_fifo_wr_cmd(), any late
SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED interrupt from the
timed-out command can fire concurrently with a subsequent broadcast
command after reinit_completion(&ctrl->broadcast), prematurely
completing the new command.

Clear any pending special command completion interrupt and reinitialise
ctrl->broadcast before issuing a broadcast command under
ctrl->intr_lock, clear the interrupt on timeout, and verify that the
interrupt status bit is still asserted under ctrl->intr_lock before
signalling ctrl->broadcast.

Closes: https://sashiko.dev/#/bug/linux-fa1aa3a1-f9c7-4e8a-bdfc-49a559353546
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 44 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index cc1b07e2406d..8d1346158ecd 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -554,11 +554,18 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 	if (swrm_wait_for_wr_fifo_avail(ctrl))
 		return SDW_CMD_FAIL_OTHER;
 
-	if (cmd_id == SWR_BROADCAST_CMD_ID)
+	if (cmd_id == SWR_BROADCAST_CMD_ID) {
+		mutex_lock(&ctrl->intr_lock);
+		ctrl->reg_write(ctrl,
+				ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+				SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED);
 		reinit_completion(&ctrl->broadcast);
-
-	/* Its assumed that write is okay as we do not get any status back */
-	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
+		mutex_unlock(&ctrl->intr_lock);
+	} else {
+		/* Its assumed that write is okay as we do not get any status back */
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
+	}
 
 	if (ctrl->version <= SWRM_VERSION_1_3_0)
 		usleep_range(150, 155);
@@ -571,10 +578,16 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 		 */
 		ret = wait_for_completion_timeout(&ctrl->broadcast,
 						  msecs_to_jiffies(TIMEOUT_MS));
-		if (!ret)
+		if (!ret) {
+			mutex_lock(&ctrl->intr_lock);
+			ctrl->reg_write(ctrl,
+					ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+					SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED);
+			mutex_unlock(&ctrl->intr_lock);
 			ret = SDW_CMD_IGNORED;
-		else
+		} else {
 			ret = SDW_CMD_OK;
+		}
 
 	} else {
 		ret = SDW_CMD_OK;
@@ -773,6 +786,22 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void qcom_swrm_complete_broadcast(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 status;
+
+	guard(mutex)(&ctrl->intr_lock);
+
+	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
+		       &status);
+	if (status & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
+		ctrl->reg_write(ctrl,
+				ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+				SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED);
+		complete(&ctrl->broadcast);
+	}
+}
+
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_id;
@@ -889,7 +918,8 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
-				complete(&ctrl->broadcast);
+				qcom_swrm_complete_broadcast(ctrl);
+				intr_sts &= ~SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED;
 				break;
 			case SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2:
 				break;
-- 
2.56.0.385.gac671c819a-goog

