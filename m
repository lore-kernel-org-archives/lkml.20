Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842394;
	b=lgGCXSyD1+9q57fQvvrYFsiCZozvnOZjV8s2mExF4OD+CPx6xzdxV/8XJANH721ThfHb
	 N2llBpGH7bSOS25GQhseW9cM6v5+tc294NCb5lav2AM0z66wSuQ8o1e9jvPisOkWZGKN7
	 tC6lkdQwj0QWMMzr2U1Pxdr+gEtHF+NXxM03gVXhHQC2GeUlbBAP8t57Z5HGlgtn7pz+E
	 A9+6F0wKfz3MuVHzh3ICKF+9wwzylZCQyZYT7TjOue7JrmN4O5wQXFcfOIBWOEPBi+NNV
	 rfWatB8yQMFZaJkVurctka6w1GwVr2Mxj4QPG+6bLpar5M/9HZm1BRY9IgSbSc5ADEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842394;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mTh3RV6GK3dtIhVKPihXyHivNcWGBoyPlE/enMZRiVM=;
	b=2NFc88kro21Dtpcczpa2rjsQhSTSWtns2PKNh0oxvcOkK4hWmfVlzv56qdxqANGwhUiG
	 93Y0f0+CVMWiEoBCtBWkEx8nd+xqc3WfnG1UWZCeokT0ixxSlDRLoFTUmCN+TpPExOtoY
	 UDH4A3f8QZbILCdtePthfAidFeTwmXtzVbFJnlo2ed/yCUiHSDKzbt3/R5VrmP0ViFZTT
	 FCuz05fYpEagIk7rRUXQ90yGhd70p/1qlGHLbq5XqXyilNKn1hsHFHX0aWbE+4lZ8Qd1L
	 Ju3VZZJSW2H4F5XhrRDVoMYq9ULOv3qB8SpdzF37mese/jwSDK1K5llu+hqDxUhKA3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DOdTaG7H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F2606A32A;
	Mon, 16 Nov 2026 15:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DOdTaG7H
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 32A60205A38;
	Mon, 16 Nov 2026 16:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTh3RV6GK3dtIhVKPihXyHivNcWGBoyPlE/enMZRiVM=;
	b=DOdTaG7H18FzzszOkBzigTjC3OqoJ3NQ4YHmY9jqhO+P0m2HinvV9l9M9TC+hRMKJ6tDT9
	F465EJyvp97fMhN1SwrBqUUU64Cvcsk7tr4NhA100rSXtRcGGOFi3YWf8rXrbvkN4X3mvz
	xGR/OZjqXWRelebJkq8ZlHkCQd1z24tjofs/nMLzxP/U6KmBD5n2EzFLjKkx8H/QR8EjeI
	C+Gd/fVsx5G046zvdPRZQy/FlBzhTWF7TAuF1NXu6F/v6ssR2oN8Du4s+X7W+PVIOZKnmO
	n8KUXE6HxcLXfE9FdYTzDhu6ZCtBeEkNs5y6HSPUucEzuYKoWG56VdccsuLR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTh3RV6GK3dtIhVKPihXyHivNcWGBoyPlE/enMZRiVM=;
	b=S+uIoHsdQIj17IardlycGPyRjhdNN0KcVsb7yUNKsCuMCQmPO3i37TQ+vXWuxHtii/h/IM
	4IZ1p31cXv4AmudI7C6JRJZuGmtIa3h2k6XxgQiB6Y2xgpRwb0pMbSAondtYpF34uoNIJf
	XksMbhmUOceyrcYwBBIKbnlF85JcsySP8ReBjR43x/pk1fVJu4YJksLl617EygVI/lZRLu
	K1CuWSUUy4Wraw+Vy9ObNUDMryGvUHMVT+qz23NS3nqR5cOmPFTjZn3Q3Ei+dhfy3INirr
	hemjsNWFIdO0iXTsEMWxz98w2cRigdr2zKY6BqM/8cNRkSZVt+TMLv4asQTHbg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842388; a=rsa-sha256;
	cv=none;
	b=CcYVNBPHYPUN///RMMyx5a1+lnl2ZIPMwO9yGLxUZsTgXLNhVvonZROtv8QtBp0W3ZIUfC
	lcQz45HswtIdUJVWYKuU/ddkKEiV6cwGYF/oqRz8MjcrFZ1ko7RW/0EAlRUWnlNHpRhdJM
	JQFTqvokHshRKanN+uS7Sn2abPPC60t4tiIcfPBO3YGB30sTWfP60ZdrQEQbQTiVDoQLMD
	7XMcNANerel0A9goslhR03JNQkAp6o1JWLb2+9Pa9SsBUOLPZq+uPTufRxBE2DfYfJ96z6
	Ldz8wuRhRbN2NrB2YhQB9UNbVq8OFKTjmfbf7ENzV3s5qgNt/kyAUsb7TGQ00Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:09 +0100
Subject: [PATCH v4 9/9] media: synopsys: hdmirx: get the 5V state from the
 upstream subdev
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-hdmirx-media-v4-9-7aee4a0a273e@pengutronix.de>
References: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
In-Reply-To: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>, 
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=9563;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=MeQAZDgHbVLftBuCaNUqrutQKvAUUKDbakaG1IMq2tw=;
 b=AhRFyd4vC34k17h8p7U4c/03Ha2k/72wg5pADP6M8hksKpG9IGAY0XNiwCFhbcSVhK1fY3ah7
 eoZy6qGqykjAXwbAkBcWxz+U0/Wrj6WC0pNQhgJPKDA6iSKftaXL2HS
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
error path, just before hdmirx_dev may be freed, and that queue is now
ignored.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 101 +++++++++++++++++++--
 1 file changed, 95 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index b81532f56f6bf..9f878dfcd8dd4 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -151,6 +151,7 @@ struct snps_hdmirx_dev {
 	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
 	struct mutex stream_lock; /* to lock video stream capture */
 	struct mutex work_lock; /* to lock the critical section of hotplug event */
+	struct v4l2_subdev *source_sd; /* under work_lock: 5V without hpd-gpios */
 	/* devres may release these after the driver data is freed */
 	struct reset_control_bulk_data *resets;
 	struct clk_bulk_data *clks;
@@ -246,6 +247,23 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
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
@@ -507,7 +525,13 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
 
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
@@ -2288,13 +2312,22 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
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
@@ -2547,14 +2580,18 @@ static void hdmirx_disable_irq(struct device *dev)
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
@@ -2983,6 +3020,19 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
 	kfree(hdmirx_dev);
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
@@ -3011,6 +3061,21 @@ static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
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
 
@@ -3022,8 +3087,28 @@ static int hdmirx_fwnode_complete(struct v4l2_async_notifier *notifier)
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
 
@@ -3083,6 +3168,9 @@ static int hdmirx_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
 			  hdmirx_delayed_work_res_change);
 	INIT_DELAYED_WORK(&hdmirx_dev->audio_work, hdmirx_audio_work);
+	/* Until hdmirx_enable_irq(), after the EDID is written. */
+	disable_delayed_work(&hdmirx_dev->delayed_work_hotplug);
+	disable_delayed_work(&hdmirx_dev->delayed_work_res_change);
 
 	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
 	hdmirx_dev->timings = cea640x480;
@@ -3122,6 +3210,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 	}
 	hdmirx_dev->v4l2_dev.ctrl_handler = hdl;
 	hdmirx_dev->v4l2_dev.release = hdmirx_v4l2_release;
+	hdmirx_dev->v4l2_dev.notify = hdmirx_notify;
 
 	ret = v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
 	if (ret < 0) {

-- 
2.47.3

