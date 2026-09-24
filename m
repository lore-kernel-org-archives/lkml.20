Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F947D92F;
	Thu, 24 Sep 2026 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251574; cv=pass; b=npgTG/gYtp05qrt/CXgd5Wt/qkTwQCA8IpVtKFnzAI3WbfyzhGqz/zRMvAlnUOMJQ/6CIskrOP8WwhG3OaB8JhuxZrwx5k8IOtwwoqhZt8eCV3yiFe4FkZc1VcF4kggcnz6CfsNR9bD55+UT5AuwVmiTYfG3jBBFflAbBTUmhrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251574; c=relaxed/simple;
	bh=cGN+WU0I3reho3kwl+fCXa0kKZOO9SIk0zhR+yI6nn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vr/UN/kSncck28lZP1cHlk17kdposYwmU52k/sVyo4ivz8r7TEoLBy2w6gXvatr4b1KV7lALprwxqxQme7k4hRmiOPYOL/IKbX9s9578KauLKBvmvYXrw0JoP0W1np6J2xyEqCRF+Kt9nlE/AM3EmQ9y9M3g6zx+C+JBA95RdjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Op9iAaOM; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Op9iAaOM"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9BC902021EE;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUzcFRKj9DJPCYjequouHSPjsyvnJK72nltLRSdS4p0=;
	b=Op9iAaOMVIxpsbjUfnwZwlbwo1NpNMQl7SvMsgEvZVcE7SMQGbR91ZrDnSn4WIOJZBvu3L
	GCPDM5A2vZ3wyHSh3+tWbpokAY/EVMyWGi/Dhlx6G1Q+ob78y1+lH0RHdtofoI0N3gcPMb
	0KPJiA56Cw/EnQR2Vjh7C30c6sGaC0TKyr1nV69/kHTe87Q29gtUO3dw2qbIv7Z2x1GMKp
	Wd1IHRAVHP39lWOJlpJVa79bvBYVDI/1X/TjbavLh3ce+zU51j2ov10z1DqF+ltlR+x258
	HLSjUU8iCPwRHDbDgQdRYPjMa7jz2Zucf2K5G6KRQeteDoFIs+F80akCc3cVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUzcFRKj9DJPCYjequouHSPjsyvnJK72nltLRSdS4p0=;
	b=dIzwn9EOaL5odsqZFY9fztqgMXr1YhiFIR68+islNr+5RyQAfpqYfA4JBOjcqZGxVPzEKx
	0R81sMM1rOi8NAqm7Duwe/KMpAM39nJ1b3dciWB0JSz2LjUG/NbsFYCoWf/O0n0xKtKnWw
	JaEN1m02pRR4OHZnOG8WEX3oWVhlfq8gono4bY/AlwNIfGMkjOmPZUxzLoWOlqowVL02ZU
	P+SEKsazL+fIz41GgotCjYcHPf6hpcwJKw6edfJB321hpWaBHNnT+0xW3MrFWPD6XFwkff
	Lo5sET0z7SFikznVJvWT4lU13FP+9qUjaDlRJoGYVEEttBX/XaDzhvH5c7CUlQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=d59rCVB1hUhinAB1edzsMSVZd+Lv3P7AASXS7D7vPkGbbx4kQYK9wKOghB+XH4CxDtEed4
	LnlQFds91jjleBtilHNQo6GLH/neu799dp8oAW2ucn6mAjazBaCgZqozPX8I41HzeLpnvW
	qkyt+cH/twKYA2Gr9tHxGnqln/pj9XJE+EsssQB90s3dxiEh/y2QrXYLRWJDNKiJ+8AN5T
	o/riD9VxBpTyJUliYvUD1ToIpzEHN/ZyS3+8uaPMmDJPC8IfIP7aL48v079ZEyZ2YybFcH
	8+KWB5TyzgODBXt2C1r5RZu4mGSyCdZ9KZHFh1owgu72cfRqQIc6iEefSfbfXw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:06:03 +0200
Subject: [PATCH v2 9/9] media: synopsys: hdmirx: get the 5V state from the
 upstream subdev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-9-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
In-Reply-To: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=9494;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=7vgYjlZk+zyMuHHoBQ2ouObNEqPLiyaQgI1U5UGXSm0=;
 b=HmJYZL5vvlNpY5jmsqjgDVk+IfhcgKoxI8RdnMADiO1FfkqIVOaZQunXxzEFBoF7HXBO+KZhJ
 UwZoQ8BLGDjATzSQ4rYPDT/wNq7qSiUQ70fBspiRZCffFSPQ9dZxifR
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

On a board whose HDMI connector belongs to a device in front of this
receiver, the connector's +5V line goes to that device and hpd-gpios is
absent. tx_5v_power_present() then reads a NULL descriptor, which
gpiod_get_value_cansleep() reports as zero, so the receiver never sees a
source and hdmirx_plugin() never runs.

Ask the device in front instead. Remember the subdev bound through our
async notifier in source_sd, and without a GPIO of our own have
tx_5v_power_present() call its g_input_status(), taking
V4L2_IN_ST_NO_POWER as "no 5V". There is nothing to debounce here; the
subdev does that on its side of the connector. A subdev without that op
is bound anyway, with a warning: a receiver that sees no source beats
one that refuses to probe.

Changes reach us the way they do on the GPIO path, as an edge that makes
the hotplug worker look again. Once the subdev is bound its
sd->v4l2_dev is ours, so v4l2_subdev_notify() lands in the callback
installed here, and V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT stands in for
the 5V interrupt this board does not have. The value the notification
carries is not used. The worker asks the subdev itself, so nothing is
cached that could go stale against bind, unbind, or a notification that
arrives early or late. Bind and unbind queue the work as well, for a
source that was connected all along and for one that leaves with the
subdev. With a GPIO of our own, notifications are ignored.

source_sd is set and cleared under work_lock. Every caller of
tx_5v_power_present() already holds it except port_no_link(), which
VIDIOC_QUERY_DV_TIMINGS reaches without it; take it there.
hdmirx_notify() reads sd->v4l2_dev, which relies on
v4l2_device_unregister_subdev() waiting for running callbacks before it
clears the pointer, see "media: v4l2-device: wait for notifications
when unregistering a subdev".

Without a det_irq there is nothing to disable_irq() across the cancel in
hdmirx_disable_irq(), so a notification could queue the hotplug work
right afterwards - including from hdmirx_suspend(), on its way to gating
the clocks. Disable the work items instead of cancelling them.
disable_delayed_work_sync() also turns every later attempt to queue them
into a no-op, whoever makes it, and hdmirx_enable_irq() enables them
again. They start out disabled at probe, which keeps the worker queued
by hdmirx_fwnode_bound() off the hardware before the EDID is written.
It also covers the way out: hdmirx_fwnode_unbind() queues the work from
inside v4l2_async_nf_unregister(), in hdmirx_remove() and on the probe
error path, just before the devm allocated hdmirx_dev goes away, and
that queue is now ignored.

Assisted-by: Claude:claude-opus-5
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 101 +++++++++++++++++++--
 1 file changed, 95 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4b94e35c912c1..5fa276706a6e6 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -142,6 +142,7 @@ struct snps_hdmirx_dev {
 	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
 	struct mutex stream_lock; /* to lock video stream capture */
 	struct mutex work_lock; /* to lock the critical section of hotplug event */
+	struct v4l2_subdev *source_sd; /* under work_lock: 5V without hpd-gpios */
 	struct reset_control_bulk_data resets[HDMIRX_NUM_RST];
 	struct clk_bulk_data *clks;
 	struct regmap *grf;
@@ -237,6 +238,23 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
 	int val, i, cnt = 0;
 	bool ret;
 
+	/*
+	 * Without a GPIO of our own the connector belongs to the subdev in
+	 * front of us. Ask it; it debounces on its side of the connector.
+	 */
+	if (!hdmirx_dev->detect_5v_gpio) {
+		u32 status;
+
+		lockdep_assert_held(&hdmirx_dev->work_lock);
+
+		if (!hdmirx_dev->source_sd ||
+		    v4l2_subdev_call(hdmirx_dev->source_sd, video,
+				     g_input_status, &status))
+			return false;
+
+		return !(status & V4L2_IN_ST_NO_POWER);
+	}
+
 	for (i = 0; i < 10; i++) {
 		usleep_range(1000, 1100);
 		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
@@ -465,7 +483,13 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
 
 static bool port_no_link(struct snps_hdmirx_dev *hdmirx_dev)
 {
-	return !tx_5v_power_present(hdmirx_dev);
+	bool present;
+
+	mutex_lock(&hdmirx_dev->work_lock);
+	present = tx_5v_power_present(hdmirx_dev);
+	mutex_unlock(&hdmirx_dev->work_lock);
+
+	return !present;
 }
 
 static int hdmirx_query_dv_timings(struct file *file, void *priv,
@@ -2272,13 +2296,22 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
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
@@ -2530,14 +2563,18 @@ static void hdmirx_disable_irq(struct device *dev)
 	disable_irq(hdmirx_dev->dma_irq);
 	disable_irq(hdmirx_dev->hdmi_irq);
 
-	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
-	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_res_change);
+	/* A subdev in front of us can still notify, keep it from queueing. */
+	disable_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
+	disable_delayed_work_sync(&hdmirx_dev->delayed_work_res_change);
 }
 
 static void hdmirx_enable_irq(struct device *dev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
+	enable_delayed_work(&hdmirx_dev->delayed_work_hotplug);
+	enable_delayed_work(&hdmirx_dev->delayed_work_res_change);
+
 	enable_irq(hdmirx_dev->hdmi_irq);
 	enable_irq(hdmirx_dev->dma_irq);
 	if (hdmirx_dev->det_irq > 0)
@@ -2673,6 +2710,19 @@ static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
 	return 0;
 }
 
+static void hdmirx_notify(struct v4l2_subdev *sd, unsigned int notification,
+			  void *arg)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(sd->v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
+
+	if (notification != V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT ||
+	    hdmirx_dev->detect_5v_gpio)
+		return;
+
+	hdmirx_5v_edge(hdmirx_dev);
+}
+
 static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *subdev,
 			       struct v4l2_async_connection *asc)
@@ -2701,6 +2751,21 @@ static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	if (hdmirx_dev->detect_5v_gpio)
+		return 0;
+
+	if (!v4l2_subdev_has_op(subdev, video, g_input_status))
+		dev_warn(hdmirx_dev->dev,
+			 "%s cannot report 5V and there is no hpd-gpios, no source will be detected\n",
+			 subdev->name);
+
+	mutex_lock(&hdmirx_dev->work_lock);
+	hdmirx_dev->source_sd = subdev;
+	mutex_unlock(&hdmirx_dev->work_lock);
+
+	/* The source may have been connected all along. */
+	hdmirx_5v_edge(hdmirx_dev);
+
 	return 0;
 }
 
@@ -2712,8 +2777,28 @@ static int hdmirx_fwnode_complete(struct v4l2_async_notifier *notifier)
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
+	mutex_lock(&hdmirx_dev->work_lock);
+	hdmirx_dev->source_sd = NULL;
+	mutex_unlock(&hdmirx_dev->work_lock);
+
+	/* The source went with it. */
+	hdmirx_5v_edge(hdmirx_dev);
+}
+
 static const struct v4l2_async_notifier_operations hdmirx_async_ops = {
 	.bound = hdmirx_fwnode_bound,
+	.unbind = hdmirx_fwnode_unbind,
 	.complete = hdmirx_fwnode_complete,
 };
 
@@ -2770,6 +2855,9 @@ static int hdmirx_probe(struct platform_device *pdev)
 			  hdmirx_delayed_work_hotplug);
 	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
 			  hdmirx_delayed_work_res_change);
+	/* Until hdmirx_enable_irq(), after the EDID is written. */
+	disable_delayed_work(&hdmirx_dev->delayed_work_hotplug);
+	disable_delayed_work(&hdmirx_dev->delayed_work_res_change);
 
 	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
 	hdmirx_dev->timings = cea640x480;
@@ -2808,6 +2896,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 		goto err_pm;
 	}
 	hdmirx_dev->v4l2_dev.ctrl_handler = hdl;
+	hdmirx_dev->v4l2_dev.notify = hdmirx_notify;
 
 	ret = v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
 	if (ret < 0) {

-- 
2.47.3

