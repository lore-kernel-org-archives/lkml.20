Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842373;
	b=jH8E9u+nDbPJ7fbv/e2JnbQQVbGuF0grUGxOqrU1PwyzEadqkhFDaPDdZWJ5zqRYFY/C
	 iK62RVVhRf8wortkrXUBwvJdzipX4xomLZA1SI0ZKSzVPPZgtrOVJYEDprhelnn4Wx+ED
	 /vlyx1sVKFUrprxHiOVoNzN2AK9hyUOoE5c7TfLHap/Q+/vqqUDJm5L+2R3u/nQnelyM1
	 smOpqUTO4xN+rAr7A77Io5XeffddIsN3jTjSkrq84B/oIMT49Zh0L16+mAttB4/yYn66l
	 r5yXeRe4D8Jiub9sb3IEVyFxRQPjdLM/0MsB92Gz0Y2/O++64Z5+LX7MLpP1tR9ENTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842373;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aFcJCLLms3a+B7tMHFRPVnKsyw36Txwer2GkAjyJLCw=;
	b=sgUsBsRpNAOY1OZok9IuQgX0m0rpoU2aTpcnFXBdPLHScNHIL0d3Rz2HtQ3WjDzq8Tvy
	 NVkD4B4ElAoSf5c6NoaEz1ceKZQUGTEIyG9h9DEC+RcBRGnKFxVs3DlBWKld5+IqcqVyw
	 CfDJOljILXavRa0x1JsmeDDlTBPdSje66qsP4cyYjhWAvp+qQatIyHgosg5rMhlxu7d9p
	 /ce1ienDNhM/DMRLaCvH8DY68tI9M2jB0pRjDPboqwKMvBe/4fe0NfTdH/A0biL6YLonj
	 4Be2bIKzPzK8AqRVfxHY+yML8U8ZbUeasrjxsi87qY9jnj0ZdubfSupCvgCFZ3hggaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=LWLUmppy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE2606A322;
	Mon, 16 Nov 2026 15:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFBE2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=LWLUmppy
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F054D205A2F;
	Mon, 16 Nov 2026 16:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFcJCLLms3a+B7tMHFRPVnKsyw36Txwer2GkAjyJLCw=;
	b=LWLUmppyiOmINsKE8IL5w4mutiag9y0AICpYWRnfP05LQ0Gn5fM3mhHdTg59/3MKTNuq2V
	SJm2alUc9JqY5r+9C+lsVqq+sHmPzXF1QmToYXZZCHMYSxLo0cealguOPsG3YJPY/pbfXA
	Rts+WWjvuo/XUa8ncsbu3VQ1ovvUk4o0AoVNZtEmV7CHMQ8rOIIJerzXDqUU3O1d9Wq0GN
	QviF6fcj7p0W8zDWX0U6v7Zu8lZJUmmFfNUwmSwW/3kdAAKrsCNPZf5ZxETGg8nbjtgqpH
	rvAH6rTFy6JXktuxcW0Ox1pKvDxsGh9hPNsE49yx0Td7AtOHBs5CbeX/ZH/4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFcJCLLms3a+B7tMHFRPVnKsyw36Txwer2GkAjyJLCw=;
	b=CtRpUjh8a6oCAJ+pHD0aRb15aiJoHDyeSxIVg71KDKCqqNckY9Vt7JxFnQiTQ04niC3/pw
	TJDxp5lCQe5Ozhlsq9MvY3ilW9fqGUx1kbRBgTr92S30lxRxZgg0aTMo+Zrm7+jVLcGIKq
	/tf6Tkzsg2HKfWxFt7FaWkftkp0YyyMFuJn4xRDgPf+ZYZLkyyhgBNoe8b5QqThkTOexUD
	pNllum9BrNiBzYD9Gfoy1tLjDnyOPFqb5DV1VA3M3TKZ+tNeXtkBi0dlr1Yl3dRpBvLauO
	rosYiqkKlhO91+HbyBHagc0uaPnOPpo3CY3A/49M9+I3kpeqYt7fZgpIzPEQzg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842367; a=rsa-sha256;
	cv=none;
	b=a0XKPPSnmOIZeWNTM9nhkm9ujizyc8JzV1HiUbWxWe/5hWGUNA+ryOAU/PRYg6eZMgYo8g
	r+7n2CW+HFT3POCmgUL3VjDXZ3nQLFuUv7dKAkqXMcmZogNmRbuewKf5xs+dtmqOSQSJlH
	P4DCQ5Im/RMoWiU6ZK7x2aVVhUBCgvb9X8dscnnvc6cKiAwYgE40wPTjsQfGhMj6Glhqlf
	laKfpyhikFTqWTq66l1NZXvXj+i0g8tzkQwN03RZGcY6rSjdfW8gX4XRDlkzRGIjEdWQ7L
	+l9MMyruWjBWyBbOwF83lIhDJMLeRHSY+r5f77rrzqmB9pYZi3GamJh+0+uqmw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:04 +0100
Subject: [PATCH v4 4/9] media: synopsys: hdmirx: add async subdevice
 support
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
Message-Id: <20261116-hdmirx-media-v4-4-7aee4a0a273e@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=7609;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=tJObSKhzo87YJJfk+9IuP3QAEskahrHPeBHhJiyEP0A=;
 b=nsXwGk+AaUCHFH2U5loJiS8vDJ64ZVoRIZrqT1hIIgL2w8dKSBkgRlcedBj6Bi+TstHxpAqEu
 b6aZETtzCdwBwqnOe6jNCTFZ27mOG2JWKKQscJ3/og51amXaY53EK/A
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
pointing into memory that is about to be freed. Both calls are no-ops when
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
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
index 147ff01c5c843..11efa08c48290 100644
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
@@ -128,6 +131,7 @@ struct snps_hdmirx_dev {
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
 	struct media_pad pad;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_range;
@@ -2958,6 +2962,50 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
 	kfree(hdmirx_dev);
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
@@ -2965,6 +3013,8 @@ static int hdmirx_probe(struct platform_device *pdev)
 	struct v4l2_ctrl_handler *hdl;
 	struct hdmirx_stream *stream;
 	struct v4l2_device *v4l2_dev;
+	struct device_node *ep_node;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	hdmirx_dev = kzalloc_obj(*hdmirx_dev);
@@ -3085,9 +3135,38 @@ static int hdmirx_probe(struct platform_device *pdev)
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
 
@@ -3106,6 +3185,10 @@ static int hdmirx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unreg_notifier:
+	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
+err_cleanup_notifier:
+	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
 err_unreg_media:
 	media_device_unregister(&hdmirx_dev->mdev);
 err_unreg_video_dev:
@@ -3143,6 +3226,13 @@ static void hdmirx_remove(struct platform_device *pdev)
 
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

