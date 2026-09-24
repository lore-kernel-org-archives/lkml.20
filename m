Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D7C47C11A;
	Thu, 24 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251570; cv=pass; b=h7PjEvFIPF4sdzbBrrgzpwwOU4RjzpMBXmA0ZVXejTyVBWZz64cKbRp/HlJxjAtGvJoTQZooBEuCSguQaEd5AeNNgmOWL4ACcEm48vvTWqlf/DIkBpeMQgzxUmhC0tJGIAHQ4zU20iW/JHiWUsSg+SzdGM6pSqJXwLr0jfY95Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251570; c=relaxed/simple;
	bh=rNaTX5uzB2WDWXh7Qihfo8Z60lZzKBsBUGHdsxOwWFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBHCo5Wa5c6d2Nhl/IPRq3Fro6L0ba4PAo5jc3H+Gh9cP0LRuBuGEQH4Va2fPXigjzwKhuBXLTUxr2COtZZRotWdzlcDTPtYKt9sOkaiXWcRuq8uWcHQ2MD7MEnFLxKNolJE7IdTuXpfcyuHF7+iRsCTM4OwvJcLpN1i2bat0Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Uk+i9/6L; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Uk+i9/6L"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3384F202139;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TllIFOhlTRpCqGgL8bvy1p78Mt4YEowE9+9V36w22Ag=;
	b=Uk+i9/6LgOLl/USfeAKxUaO9j65pLLVyYpDEW3sfcQxg/v6JD9fNmYZg+Dfep6a8AP2U2w
	QjX3k/YCb4W4o42XDVgL6bapvRg1xx0/oXxFPMTSl+SezNA726rOZZ4sANbBrqQpy8NUaF
	d71GNFA4K2NhymgYOmu+TyXxDdmisrZiBBZZCyOJbJbQfoTwxe4qpbY8qPlu0qgr31cp/B
	D0AstJ4CoeOX3yspho48j+64BdcMZWS2VUJ039tc9HjtC5PLKh+PrQ/NdDvEDrHfF8G0Rf
	MN07hwMbe1fvkSpR2UEuEKQa9S7jSrMRAHJq5W1+Z/VMpHjQ5oK3PWlUolABbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TllIFOhlTRpCqGgL8bvy1p78Mt4YEowE9+9V36w22Ag=;
	b=a87NmgQcq1+vc+/ZXr4/ZbzKlM2PumEXF/Or/Mo4/8dZ2wcM7JtJjf7/scFbt44YMiI5Uw
	PTmS+TbmgJ5DrXIzJdbys3X9F2BEkwJTD8fgwvj7rq3CNjdGwQ5dfqfRTaGsYBtXFEknxc
	Nc2erRGbcmElZkxirdwQsZs2zFUbJ6pYtMy1dJBFAonXvKmxCUvMcHeBylLp1fvNDw9rkA
	vq82arzvm2lRRr3/rgxDVztLEPFio3mf2LgmOcj3FWwejgPOWJC7Jloy697JYnnMuW+Zh2
	WoIl2kcUz2tAqmr17EwI2/yax+RiNoy75e9yF6/uvb4/4LcwfDtUN+8wunc8vw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=W8lVOy4N4UU9NdawwNzxy0555dq6CP0KI+x3Y1qP5s89yoIGUmX3vmqHSX2+493lkN5hvi
	+RTM9YNAQfU/6+ujeZ+Gqk9qkVvUWjJi1z0yeh2n8Aaugrqm0ZibZgNxNyCjUUPhgpFyqO
	n9pQKHBnCvsvdiBlJswJeFfaaxx2OYJLBbCLgLy+IVdWWfrDiw8zkme8Kuh8LoSzwBB/U2
	Z28XFNf9xbd6E4mxxhd4qGgbATCyU3PqTLTAEjXW6qWEDBmEHS3bIWVVI9ZfmLuhv2oInY
	88/UrdwCncsD7K7nh/1Il6ubz4T+bFsWaZ5LvVXtYebKWFkJoOaNRnK2D2u5JQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:05:58 +0200
Subject: [PATCH v2 4/9] media: synopsys: hdmirx: add async subdevice
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-4-c12f641d8b0f@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=7607;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=I5rDqCsdIlWcC/BzfHxOFLjRGQS/2NPRXQhUfqv/HLk=;
 b=iHWBkiuZfMK7eyfTMVZKWR8/681G4Hfg2CqMbNucEaNNcvvFIP8sr5Lzc2RXgfI+h1XkZobPf
 1skpcVP5hdNBAvmQ7b+wRBHVYglAk50W08W40wtWDHliDvwYPqQAz57
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

Add V4L2 async notifier support to enable dynamic binding of connected
subdevices in the video pipeline. The driver parses device-tree endpoints
to discover and register video bridge subdevices.

When a subdevice is bound, a media link is created between its output pad
and the HDMI RX sink pad. Subdevice nodes are registered once binding
completes, making them accessible from userspace.

If no endpoint is defined in the device tree, the driver operates in
standalone mode and registers its subdevice nodes directly, maintaining
backward compatibility with simpler configurations.

The notifier itself is unregistered on the way out whether or not a
subdevice ever bound. Only v4l2_async_nf_unregister() takes the notifier
off the global list, so cleaning up without it would leave an entry
pointing into memory devres is about to free. Both calls are no-ops when
there was no endpoint to watch.

Ask the bound subdevice which of its pads faces us rather than assuming
the second one. media_create_pad_link() warns and fails on an index the
entity does not have, which a bridge with a single pad would hit.

V4L2_ASYNC has to be selected now that the driver calls the notifier
helpers. v4l2-async.h has no stubs for them, and nothing else the driver
already selects pulls the symbol in.

The media device is already registered when the subdevice binds, so
userspace can be walking the graph under graph_mutex while the link is
added. media_create_pad_link() does not take the lock itself; take it
around the call.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/synopsys/hdmirx/Kconfig     |  1 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 92 +++++++++++++++++++++-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drivers/media/platform/synopsys/hdmirx/Kconfig
index 4321f985f6320..598c303eba8d0 100644
--- a/drivers/media/platform/synopsys/hdmirx/Kconfig
+++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_SYNOPSYS_HDMIRX
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
+	select V4L2_ASYNC
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select CEC_CORE
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 11a9b16586a57..d80143347fe0c 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -20,6 +20,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/pinctrl/consumer.h>
@@ -32,12 +33,14 @@
 
 #include <media/cec.h>
 #include <media/media-device.h>
+#include <media/v4l2-async.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
@@ -126,6 +129,7 @@ struct snps_hdmirx_dev {
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
 	struct media_pad pad;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_range;
@@ -2649,6 +2653,50 @@ static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
 	return 0;
 }
 
+static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *subdev,
+			       struct v4l2_async_connection *asc)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(notifier, struct snps_hdmirx_dev, notifier);
+	int source_pad;
+	int ret;
+
+	source_pad = media_entity_get_fwnode_pad(&subdev->entity,
+						 asc->match.fwnode,
+						 MEDIA_PAD_FL_SOURCE);
+	if (source_pad < 0) {
+		dev_err(hdmirx_dev->dev, "%s has no source pad for %pfw: %d\n",
+			subdev->name, asc->match.fwnode, source_pad);
+		return source_pad;
+	}
+
+	mutex_lock(&hdmirx_dev->mdev.graph_mutex);
+	ret = media_create_pad_link(&subdev->entity, source_pad,
+				    &hdmirx_dev->stream.vdev.entity, 0,
+				    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+	mutex_unlock(&hdmirx_dev->mdev.graph_mutex);
+	if (ret) {
+		dev_err(hdmirx_dev->dev, "Failed to create media link: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hdmirx_fwnode_complete(struct v4l2_async_notifier *notifier)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(notifier, struct snps_hdmirx_dev, notifier);
+
+	return v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations hdmirx_async_ops = {
+	.bound = hdmirx_fwnode_bound,
+	.complete = hdmirx_fwnode_complete,
+};
+
 static int hdmirx_probe(struct platform_device *pdev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev;
@@ -2656,6 +2704,8 @@ static int hdmirx_probe(struct platform_device *pdev)
 	struct v4l2_ctrl_handler *hdl;
 	struct hdmirx_stream *stream;
 	struct v4l2_device *v4l2_dev;
+	struct device_node *ep_node;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	hdmirx_dev = devm_kzalloc(dev, sizeof(*hdmirx_dev), GFP_KERNEL);
@@ -2772,9 +2822,38 @@ static int hdmirx_probe(struct platform_device *pdev)
 		goto err_unreg_video_dev;
 	}
 
+	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (ep_node) {
+		v4l2_async_nf_init(&hdmirx_dev->notifier, &hdmirx_dev->v4l2_dev);
+		hdmirx_dev->notifier.ops = &hdmirx_async_ops;
+
+		asc = v4l2_async_nf_add_fwnode_remote(&hdmirx_dev->notifier,
+						      of_fwnode_handle(ep_node),
+						      struct v4l2_async_connection);
+		of_node_put(ep_node);
+
+		if (IS_ERR(asc)) {
+			ret = PTR_ERR(asc);
+			dev_err_probe(dev, ret, "Failed to add remote fwnode\n");
+			goto err_unreg_media;
+		}
+
+		ret = v4l2_async_nf_register(&hdmirx_dev->notifier);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to register async notifier\n");
+			goto err_cleanup_notifier;
+		}
+	} else {
+		ret = v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to register subdev nodes\n");
+			goto err_unreg_media;
+		}
+	}
+
 	ret = hdmirx_register_cec(hdmirx_dev, pdev);
 	if (ret)
-		goto err_unreg_media;
+		goto err_unreg_notifier;
 
 	hdmirx_load_default_edid(hdmirx_dev);
 
@@ -2789,6 +2868,10 @@ static int hdmirx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unreg_notifier:
+	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
+err_cleanup_notifier:
+	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
 err_unreg_media:
 	media_device_unregister(&hdmirx_dev->mdev);
 err_unreg_video_dev:
@@ -2818,6 +2901,13 @@ static void hdmirx_remove(struct platform_device *pdev)
 
 	hdmirx_disable_irq(dev);
 
+	/*
+	 * Both are no-ops when there was no endpoint to watch: the notifier is
+	 * zeroed and neither v4l2_dev nor waiting_list is set.
+	 */
+	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
+	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
+
 	media_device_unregister(&hdmirx_dev->mdev);
 
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);

-- 
2.47.3

