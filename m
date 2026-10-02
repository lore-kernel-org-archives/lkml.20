Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19FF488223
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936125; cv=none; b=HrmehKKhG4CCGK3r+MlmSZm9QA1xjjFZAmiiGpYf+ordTngEuQl53dEHBFpZQEHAEboab67CwzPHubyr3ufj/p/okDXsUOY72s9BH6gYOh7u9U2n5j3BCD8qVqBwP3/3P2+UO1pqLP5PS7Z043K3fKVGLZeGV2A0ll9vQeOKMVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936125; c=relaxed/simple;
	bh=BpuEBNYvroeWgXPcBuqLbSzeDqLETx8qDseAg4h/D9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMM7+w60LtKlpgFP8x8Z5CBZYYE0zYUEs3Dl82yKmJg36yL142+a/VJgQKHaSOvihC/6pN44/L8OPG/DxSQYsR0rVUrNBbSN6t2K6tpSctw1FqZ/jTOkVEtmrwjSQQ/xN9l8cSRVdMuoW6Ft3PYQbIwlZlWHJrXDwSWUde0MNlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJzNCa7S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJzNCa7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA201F000FF;
	Fri,  2 Oct 2026 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936123;
	bh=VbDHkiAwjzlLkLBflCoJf1UQF8Su8AYDyh9iPxPNaEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VJzNCa7SUHEkHwJWvByXWn/YHFBPeXDy+Wtunwlcu+yO4JKil90xZhgdE8WAlSIm/
	 MhjWAlqqh+/0Nh3K4RjSyQeZ4uMzDnBSgUCwxsfp/tkzWoZlSvWUU0ojR0StNc8zDW
	 uPbNU2P4kVOVRZ8XGKMvN5QGEbzG4otSsRouZsoW3LJoejlvf+KRZLfWGCaUo8uHd+
	 1KmKd9k/g+SuV/BJjd2mclI0ypgq/lf1SOfeHh4CE+o4oAENvJc8yiY9j10PIROBGu
	 EyHz0S25EupiQDyIMjhi2KAzMnmQ9DlzpZuVondCsYqinsCritmpMPJtTBRuV2V0VT
	 C76Nj3WkTvIZw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 4/4] slimbus: qcom-ngd-ctrl: Implement disable_stream callback
Date: Fri,  2 Oct 2026 11:15:06 +0100
Message-ID: <20261002101506.1084743-5-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101506.1084743-1-srini@kernel.org>
References: <20261002101506.1084743-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Switching a channel to a new frequency without first disabling the stream
causes the channel to be re-enabled without a clean shutdown, leading to a
crash on the DSP subsystem.

Implement qcom_slim_ngd_disable_stream() so clients can properly close a
channel before switching to a new frequency.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 78 +++++++++++++++++++++++++++++++++
 drivers/slimbus/slimbus.h       | 12 +++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 4124a848676d..eb983b6d1815 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
 // Copyright (c) 2018, Linaro Limited
 
+#include <linux/bitfield.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -87,6 +88,10 @@
 #define SLIM_ROOT_FREQ	24576000
 #define LADDR_RETRY	5
 
+#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
+#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
+#define SLIM_MSG_HDR_LEN		4
+
 /* Per spec.max 40 bytes per received message */
 #define SLIM_MSGQ_BUF_LEN	40
 #define QCOM_SLIM_NGD_DESC_NUM	32
@@ -1086,6 +1091,78 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 	return ret;
 }
 
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_msg_txn txn = { 0 };
+	struct slim_val_inf msg = { 0 };
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
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
+	for (i = 0; i < rt->num_ports; i++) {
+		struct slim_port *port = &rt->ports[i];
+
+		if (txn.msg->num_bytes == 0) {
+			wbuf[txn.msg->num_bytes++] =
+				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
+				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
+
+			ret = slim_alloc_txn_tid(ctrl, &txn);
+			if (ret) {
+				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+				return ret;
+			}
+			wbuf[txn.msg->num_bytes++] = txn.tid;
+		}
+		wbuf[txn.msg->num_bytes++] = port->ch.id;
+	}
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		/* Controller restarting, the channels are gone anyway */
+		if (ret == -EREMOTEIO)
+			return 0;
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
@@ -1625,6 +1702,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 3a03993c3ac8..8e34f30601d3 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -316,6 +316,18 @@ enum slim_transport_protocol {
 	SLIM_PROTO_EXT_HALF_DUP,
 };
 
+/**
+ * enum slim_ch_control: Channel control.
+ * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
+ * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
+ * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
+ */
+enum slim_ch_control {
+	SLIM_CH_ACTIVATE,
+	SLIM_CH_SUSPEND,
+	SLIM_CH_REMOVE,
+};
+
 /**
  * struct slim_stream_runtime  - SLIMbus stream runtime instance
  *
-- 
2.53.0

