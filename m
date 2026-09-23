Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83955383F9;
	Wed, 23 Sep 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171138; cv=pass; b=Fa81cQ73PjTVjdMC0SZxbThJQUlE8veCz22199awWf4jKU3K44kxJXbZjlQ0/3Pf5pd1l4VmkPw5ZjjBIG4LlVcarb95WngvKr5TT1wk7BX8Mf/vfTYrXvGjvn58VdKdhlmSf+B9LCB9BDOwjf8b6eaDzkECwkhBs69y/0u9tvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171138; c=relaxed/simple;
	bh=pRkiTAC2G8aBEOjf8f5ZCU7GlO+mB3s5SEVhscg/uEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHxeM1FFRmrjEeUqwLFV9uz3nl8XSs1M6/gnOqQsUK6hZWF1dA9FTqzNo4MoXirqGzSdwkPn4XciRf4RZSvykDNCmTMo3FyYfSWRDr/ErC4jtMFPyLFqPghtUybiaNX/5EV1Unf1WAHcKn8379WfGfp6Xk0WohBK9aqqjLzYajs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Rh6W0k6z; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Rh6W0k6z"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7EB6D201A8D;
	Wed, 23 Sep 2026 15:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rr9w3URUQ0TGCGXkjnhXsYr1YK45zhyOjaHeo1XL4A=;
	b=Rh6W0k6z5YYwWHyIJnFeR9zs3MVh6KtQEiZYhVnmp/Xwj00hLnVpwsdLQAorsvpV6iCznq
	78nKdqXp7qdAbVVvwb6qy3PCz0nG8x2vgRk1YLOZXk0zxVk6F549LScD5hmj72LD1rEH2H
	ZllXUhrxY2B7J+T8JivAaEBlsDmQQW2FUnniMeXT9Xp8X7AuXZkCStObt4BjcNbcZyjk3p
	GNz54f2lSTHT9Q0tU1yqwmIuz+thHIABukz7e13X3v44NcMI18aUhtGI3lT6KNeoyWpe09
	ImoDPVtfLPjJo0GxhtvckADRSnLeGZXg48YWYJrJmoINok16WQ5GEHJsUKuTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rr9w3URUQ0TGCGXkjnhXsYr1YK45zhyOjaHeo1XL4A=;
	b=XBWKIYCDBcIFU5WTfsSV4vI+1ezibVH+Zay7y9CHGdIDsoqxSFhtzyelJYT26k+MPDpzWS
	cauD3o4SHeePe6+/RSJDdG/aSbKHiHghWikXvaHtKERYANl7lLl9uvcuSYhRN1RqOOAw1i
	x/lwc/ngAJoHYkE6Y1AaJKkdLMWGGWX9VyZLKVGhim1YmdDkBG+/jq9RBB4ns0oV+0zH+l
	25js9qIs8Zc0sjDJyae02Pjosx/Ew5KL6jtA8ANrWyRMuEoWycphQKPm7jfPZbZF3cY7DA
	O6UImxSH882Oi48XlCAvZNcCTd88Kmh1S0BAB1sTalHtvPafqxCudig2uorh/w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171129; a=rsa-sha256;
	cv=none;
	b=ZtJSQLT+HPXqekhCgKmK7dlsOIBzYFUeM6/KCgTslJAhRcxW4smuVuvZG1+IK9XovhJHJ6
	iGnMRFlQXiqXbcLai5/oWjK5xcyoroL1qpNk1takoMGLauIKevpGbvzSWK/WlROSwhlP4r
	NUE3CNOu8LLxsQsNTxSbibxs9pJRBxpd5jiKMEBNB3ihpZdtnASDvh/K68TcXql+K8yZPa
	jv4bX7ZHdbu+mjF2M7CalrCOdVI2bGKe3VEDwFP/nl8Lm4Uiz1k4Ilmf4xhVlUziu9K273
	PtYJCIY4Dlmlc8lkZfS0vRQaua4ftOJTxmRru/TJwD350qC3NZnD9y62MZ1ezA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:48 +0200
Subject: [PATCH 9/9] media: synopsys: hdmirx: get the 5V state from the
 upstream subdev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-9-ea3d77d4a5f3@pengutronix.de>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
In-Reply-To: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=10805;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=WWCYpRiNYOounjsFxLI57fqzPdh5k5Xh1Z5Ea/U8Xck=;
 b=QXrlwe+E0uXhrCBjE+ikCsJ2wAyGoElfHb5xSAuzXpG25JPeeqj0JXmLhbUYF6RblIPCLxb6H
 SImkePSoz9+B5AEv63uvPhXT0WLgdpnlXtQy9K+BiZRggzRfQC0KC7B
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

On a board whose HDMI connector belongs to a device in front of this
receiver, the connector's +5V line goes to that device and hpd-gpios is
absent. tx_5v_power_present() then reads a NULL descriptor, which
gpiod_get_value_cansleep() reports as zero, so the receiver never sees a
source and hdmirx_plugin() never runs.

Have the device in front tell us. Once it is bound through our async
notifier its sd->v4l2_dev is ours, so v4l2_subdev_notify() lands in the
callback installed here, and V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT stands
in for the 5V interrupt this board does not have. Remember what arrives
in source_5v, which tx_5v_power_present() returns when there is no GPIO
of our own, so everything else carries on unchanged and no pointer into
the other device is kept.

A notification is an edge, so it says nothing about a source that was
connected all along. Ask g_input_status() once at bind and take
V4L2_IN_ST_NO_POWER as the answer. A subdev without that op is bound
anyway: a receiver that sees no source beats one that refuses to probe.

Without a det_irq there is nothing to disable_irq() across the cancel in
hdmirx_disable_irq(), so a notification can arm the hotplug work right
afterwards - including from hdmirx_suspend(), on its way to gating the
clocks. Gate both workers on hotplug_on under work_lock instead. It
starts clear, which also keeps them off the hardware during probe, where
hdmirx_fwnode_bound() can arm the work well before the EDID is written.

The flag is not enough on the way out. The worker still has to reach
work_lock to read it, and hdmirx_fwnode_unbind() arms the work once more
from inside v4l2_async_nf_unregister(), after hdmirx_disable_irq() has
already cancelled it. hdmirx_dev is devm allocated, so by the time the
worker runs it can be gone. Cancel the work again once the notifier is
unregistered, in hdmirx_remove() and in the probe error path.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 121 ++++++++++++++++++++-
 1 file changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 23b4dd853be57..43d7857b4458b 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -142,6 +142,7 @@ struct snps_hdmirx_dev {
 	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
 	struct mutex stream_lock; /* to lock video stream capture */
 	struct mutex work_lock; /* to lock the critical section of hotplug event */
+	bool hotplug_on; /* under work_lock: the hardware is up, workers may run */
 	struct reset_control_bulk_data resets[HDMIRX_NUM_RST];
 	struct clk_bulk_data *clks;
 	struct regmap *grf;
@@ -160,6 +161,7 @@ struct snps_hdmirx_dev {
 	bool hpd_trigger_level_high;
 	bool tmds_clk_ratio;
 	bool plugged;
+	bool source_5v; /* 5V as last reported by the subdev in front of us */
 	int num_clks;
 	u32 edid_blocks_written;
 	u32 cur_fmt_fourcc;
@@ -237,6 +239,15 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
 	int val, i, cnt = 0;
 	bool ret;
 
+	/*
+	 * Without a GPIO of our own the connector belongs to the subdev in
+	 * front of us and there is no line here to sample, so sampling is
+	 * reading back what that subdev last told us. Nothing to debounce:
+	 * it did that on its side of the connector.
+	 */
+	if (!hdmirx_dev->detect_5v_gpio)
+		return READ_ONCE(hdmirx_dev->source_5v);
+
 	for (i = 0; i < 10; i++) {
 		usleep_range(1000, 1100);
 		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
@@ -2227,6 +2238,11 @@ static void hdmirx_delayed_work_hotplug(struct work_struct *work)
 				  delayed_work_hotplug.work);
 
 	mutex_lock(&hdmirx_dev->work_lock);
+	if (!hdmirx_dev->hotplug_on) {
+		mutex_unlock(&hdmirx_dev->work_lock);
+		return;
+	}
+
 	plugin = tx_5v_power_present(hdmirx_dev);
 	v4l2_ctrl_s_ctrl(hdmirx_dev->detect_tx_5v_ctrl, plugin);
 	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: plugin:%d\n",
@@ -2249,6 +2265,11 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
 				  delayed_work_res_change.work);
 
 	mutex_lock(&hdmirx_dev->work_lock);
+	if (!hdmirx_dev->hotplug_on) {
+		mutex_unlock(&hdmirx_dev->work_lock);
+		return;
+	}
+
 	plugin = tx_5v_power_present(hdmirx_dev);
 	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: plugin:%d\n",
 		 __func__, plugin);
@@ -2272,17 +2293,39 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
 	mutex_unlock(&hdmirx_dev->work_lock);
 }
 
-static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
+/*
+ * A 5V edge. Neither source of one says more than "look again": the
+ * hotplug worker samples tx_5v_power_present() and acts on what it finds.
+ */
+static void hdmirx_5v_edge(struct snps_hdmirx_dev *hdmirx_dev)
 {
-	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
-
 	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
 			   msecs_to_jiffies(10));
+}
+
+static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
+
+	hdmirx_5v_edge(hdmirx_dev);
 
 	return IRQ_HANDLED;
 }
 
+/*
+ * The same edge from a subdev in front of us, on a board where the
+ * connector is its and not ours. It has no line here to leave asserted for
+ * the worker to sample, so remember what it saw on its side.
+ */
+static void hdmirx_5v_source_edge(struct snps_hdmirx_dev *hdmirx_dev,
+				  bool present)
+{
+	WRITE_ONCE(hdmirx_dev->source_5v, present);
+
+	hdmirx_5v_edge(hdmirx_dev);
+}
+
 static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.write = hdmirx_writel,
 	.read = hdmirx_readl,
@@ -2525,6 +2568,17 @@ static void hdmirx_disable_irq(struct device *dev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
+	/*
+	 * Disabling det_irq is what stops the work being armed again, but
+	 * there is no det_irq when the 5V state comes from a subdev: it can
+	 * notify us into hdmirx_5v_source_edge() right after the cancel
+	 * below. Have the workers bail out instead. They take work_lock
+	 * first thing, so anything queued from here on sees this.
+	 */
+	mutex_lock(&hdmirx_dev->work_lock);
+	hdmirx_dev->hotplug_on = false;
+	mutex_unlock(&hdmirx_dev->work_lock);
+
 	if (hdmirx_dev->det_irq > 0)
 		disable_irq(hdmirx_dev->det_irq);
 	disable_irq(hdmirx_dev->dma_irq);
@@ -2538,6 +2592,15 @@ static void hdmirx_enable_irq(struct device *dev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
+	/*
+	 * Also the first time the workers are let in: hdmirx_fwnode_bound()
+	 * can arm the hotplug work from within hdmirx_probe(), well before
+	 * the EDID is written and HDCP is registered.
+	 */
+	mutex_lock(&hdmirx_dev->work_lock);
+	hdmirx_dev->hotplug_on = true;
+	mutex_unlock(&hdmirx_dev->work_lock);
+
 	enable_irq(hdmirx_dev->hdmi_irq);
 	enable_irq(hdmirx_dev->dma_irq);
 	if (hdmirx_dev->det_irq > 0)
@@ -2673,6 +2736,18 @@ static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
 	return 0;
 }
 
+static void hdmirx_notify(struct v4l2_subdev *sd, unsigned int notification,
+			  void *arg)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(sd->v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
+
+	if (notification != V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT || !arg)
+		return;
+
+	hdmirx_5v_source_edge(hdmirx_dev, !!*(unsigned int *)arg);
+}
+
 static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *subdev,
 			       struct v4l2_async_connection *asc)
@@ -2680,6 +2755,7 @@ static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
 	struct snps_hdmirx_dev *hdmirx_dev =
 		container_of(notifier, struct snps_hdmirx_dev, notifier);
 	int source_pad;
+	u32 status;
 	int ret;
 
 	source_pad = media_entity_get_fwnode_pad(&subdev->entity,
@@ -2699,6 +2775,23 @@ static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	if (hdmirx_dev->detect_5v_gpio)
+		return 0;
+
+	/*
+	 * Changes arrive through hdmirx_notify(). Ask once for the state a
+	 * source connected before we bound is already in.
+	 */
+	ret = v4l2_subdev_call(subdev, video, g_input_status, &status);
+	if (ret) {
+		dev_err(hdmirx_dev->dev,
+			"%s did not report the input status and there is no hpd-gpios, no source will be detected: %d\n",
+			subdev->name, ret);
+		return 0;
+	}
+
+	hdmirx_5v_source_edge(hdmirx_dev, !(status & V4L2_IN_ST_NO_POWER));
+
 	return 0;
 }
 
@@ -2710,8 +2803,24 @@ static int hdmirx_fwnode_complete(struct v4l2_async_notifier *notifier)
 	return v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
 }
 
+static void hdmirx_fwnode_unbind(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *subdev,
+				 struct v4l2_async_connection *asc)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(notifier, struct snps_hdmirx_dev, notifier);
+
+	/* With a GPIO of our own the connector is ours and stays put. */
+	if (hdmirx_dev->detect_5v_gpio)
+		return;
+
+	/* The source went with it. */
+	hdmirx_5v_source_edge(hdmirx_dev, false);
+}
+
 static const struct v4l2_async_notifier_operations hdmirx_async_ops = {
 	.bound = hdmirx_fwnode_bound,
+	.unbind = hdmirx_fwnode_unbind,
 	.complete = hdmirx_fwnode_complete,
 };
 
@@ -2806,6 +2915,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 		goto err_pm;
 	}
 	hdmirx_dev->v4l2_dev.ctrl_handler = hdl;
+	hdmirx_dev->v4l2_dev.notify = hdmirx_notify;
 
 	ret = v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
 	if (ret < 0) {
@@ -2890,6 +3000,8 @@ static int hdmirx_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
 err_cleanup_notifier:
 	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
+	/* Binding and unbinding both arm the hotplug work. */
+	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
 err_unreg_media:
 	media_device_unregister(&hdmirx_dev->mdev);
 err_unreg_video_dev:
@@ -2926,6 +3038,9 @@ static void hdmirx_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
 	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
 
+	/* The unbind above arms the hotplug work again. */
+	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
+
 	media_device_unregister(&hdmirx_dev->mdev);
 
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);

-- 
2.47.3

