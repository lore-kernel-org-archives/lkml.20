Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A159486E6D;
	Thu, 24 Sep 2026 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256253; cv=none; b=GHQl7T/ByY/eVOeAyX/R7W/OuKXPEHtRpsdB1yFTBr7XgChg7wYV+JE9U5tDincicGAIKOAcatDvOgXE9HLjdavTCd+9TEtQqS3dAk97+M9Wq8L4l9Bl8LLOuTKmIKhFG1k6OHTLhXoTD7uaMgDyE9ekTmacnARKtjECplE0ENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256253; c=relaxed/simple;
	bh=uhEDVn91do1hgKILd0fb8RWwDrqRMdDaXijwCFaPmGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlMrIOkXkd+PXzgrJqPjpbpgw/HpQTShMvZc6doM0vk2yy7TQhvPdqJJYmeE7vQFrCbTq0w4M7sX/VfHuL1Z40AD7MmQIQmi0njCl/N/hqEKNr8buueVG7b95qTh8qUZd1pdPQRjGPyESxIAQVS1uxTzvkhZEZGeMqso14Lu/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSwTVbQI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSwTVbQI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA541C4AF48;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790256251;
	bh=uhEDVn91do1hgKILd0fb8RWwDrqRMdDaXijwCFaPmGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oSwTVbQIDpEYmTpDRVERGZSIRCfsHc2aCwtuOQJ57phdm1OyDt8rkCtU8hH1tn2uz
	 TpXjZyMDigYQtSOzzbUHZpAUI5IReJO96+SjvpiyRqHQfmUKrCjTIz6kWLMGO6R9de
	 eLiIgBySo6VpL2IOcLTHvOmJeloI8CEvEqJnBqfS+43uBqjqazdD3C94qQmgu4IwMX
	 Kd3IuZuOQzRiNF5PL7ff0FKgrw1ijKsd0M9sYMUT7NF0Gt1XU6R5V/FfPc5/3r1yXK
	 mYN0XP3Xm0uRm23vWQwv3UZhCqQg9ykso2Y5dbVMQs5jbgADimEzuDcwVA4pUoCZGW
	 QtfogZDgBBctw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FDAC98321;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 15:24:12 +0200
Subject: [PATCH v4 7/8] slimbus: qcom-ngd-ctrl: Remove data channels on
 stream disable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v4-7-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4926; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gvUkLwOYnZ0Pe5d6qwvy5Djs6Ao1xatrmVvIiYn7vco=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtSR5YJy+Ykuv7fyU0Ce8qvLjbjfY8Wb9wgpUm
 rbNE8vBWCaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUkeQAKCRBgAj/E00kg
 cigQD/9m1wVvsMbIUNMU+DILXG5a7MXtWlYiyGHLurvRqDA3HlShj7aYFD0v9i0CEBzJiFo9SbU
 wwt7LBxyYY2KoNeISKe6ORp39dIfyCv+dC6B3EqoI+O78lLuR43Aaj+XHDAPSDED74eDpyoWiyO
 F1HNR3NGai4WjAwH2O0gWpjJVNhaC/f4Gi0N1Z6CU1D3EpJKLT0XtBrEWrVXvRgjDY0j6nhBNfU
 tdIFCJZBR66pqXczW1N0K4G2eq2yxVnMw6GMBkwwFoUBWPHD6w3UTL85UY/6quMepLVMZ3Z2rnM
 y9ktRsTi8+D6cq3s1D31U1MaqBlrHzgk+B4ZVEJ4mYljZyQKwV3j+c1Ap7ZHGUBB2NYt+QRDDSh
 v+GDA82Ls58usxnlEFPF7GzeW1fEg3IJkyI0QpLG3aVx/vfYUhjsFW1ke1NhBb1viIWW2k1LMIR
 /118Jr1f9J+Pe0/P+0y6rBo4bPKQxoQDGm9f5BzXPBZsKT3W4gnt8i7F2RDlAzAGER5HSLaKMSP
 aC4WWxW1FYyUpmV2GGSKV2KLjD0m26lq4qH+LGiHY/+jNN5gYoGgGGbtV3fUFEwYBXOGoKlhrPU
 gcgucOd/WfoVhvlNhFNfKVMq+cYQwxCArrGCGcBUO4MdQbitf5VNoZCKBtIFFsrrMZ+kdmTIcVV
 U7bHBKzwHSRnEmA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

qcom_slim_ngd_xfer_msg() silently returns success for every core
reconfiguration message, so the generic channel removal done by
slim_stream_disable() never reaches the ADSP SLIMbus master. The
master therefore keeps the channels of a closed stream. When the next
stream defines the same channel numbers again, the WCD9340 capture
completes without any error but records only zeros; removing the
channels explicitly when the stream is disabled makes it work again.

Implement the disable_stream controller op with the sequence the
downstream NGD driver sends for channel removal, CHAN_CTRL(REMOVE)
listing the stream's channels followed by RECONFIG_NOW. Like
downstream, treat -EREMOTEIO from the removal as success: it means the
controller is being restarted and the channels are gone anyway.

Based on work done by Casey Tunturi.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 81 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index eb0ccb31e9074..0a4859466c82d 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1081,16 +1081,96 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 		slim_free_txn_tid(ctrl, &txn);
 		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
 				txn.mt);
 	}
 
 	return ret;
 }
 
+/* CHAN_CTRL operation, bits [7:6] of the first payload byte */
+#define SLIM_USR_CHAN_CTRL_REMOVE	2
+
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_val_inf msg =  {0};
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
+	struct slim_msg_txn txn = {0,};
+	int i, ret;
+
+	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
+	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
+	txn.la = SLIM_LA_MGR;
+	txn.ec = 0;
+	txn.msg = &msg;
+	txn.msg->num_bytes = 0;
+	txn.msg->wbuf = wbuf;
+	txn.msg->rbuf = rbuf;
+
+	/*
+	 * The NGD drops the core reconfiguration messages that
+	 * slim_stream_disable() uses to remove channels, so ask the master
+	 * to remove them the way the downstream NGD driver does:
+	 * CHAN_CTRL(REMOVE) listing every channel, then RECONFIG_NOW.
+	 * Without this the master keeps the channels active and a later
+	 * DEF_ACT_CHAN with the same channel numbers is a no-op, so the
+	 * data path is never re-armed and a reopened stream moves no data.
+	 */
+	/* 5-bit client number, operation in bits [7:6] */
+	wbuf[txn.msg->num_bytes++] = (SLIM_USR_CHAN_CTRL_REMOVE << 6) |
+				     (sdev->laddr & 0x1f);
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(&sdev->dev, "Fail to allocate TID\n");
+		return ret;
+	}
+	wbuf[txn.msg->num_bytes++] = txn.tid;
+
+	for (i = 0; i < rt->num_ports; i++)
+		wbuf[txn.msg->num_bytes++] = rt->ports[i].ch.id;
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + 4;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		/* Controller restarting, the channels are gone anyway */
+		if (ret == -EREMOTEIO)
+			return 0;
+		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
+				txn.mt);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + 4;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(ctrl->dev, "Fail to allocate TID\n");
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
+				txn.mt);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
 	struct slim_val_inf msg =  {0};
 	u8 failed_ea[6] = {0, 0, 0, 0, 0, 0};
 	struct slim_msg_txn txn;
 	u8 wbuf[10] = {0};
 	u8 rbuf[10] = {0};
@@ -1620,16 +1700,17 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
 	ctrl->framer.superfreq =
 		ctrl->framer.rootfreq / SLIM_CL_PER_SUPERFRAME_DIV8;
 
 	ctrl->ctrl.a_framer = &ctrl->framer;
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
 
 	mutex_init(&ctrl->tx_lock);
 	mutex_init(&ctrl->ssr_lock);
 	spin_lock_init(&ctrl->tx_buf_lock);
 	init_completion(&ctrl->reconf);

-- 
2.55.0


