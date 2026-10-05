Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB24854E6;
	Mon,  5 Oct 2026 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206921; cv=pass; b=OK5H9iP8AextOxvcZZt56CBr3A+SpnN2OuXXWVJX89PqGw99LWTTy5PDy7QxLxQQ0nCyNsayVU21KjF6lgeVwIKuFvX1oavrEfCQ+JlkEf24PKe+xew3seaTe9eYbvUTinCnl6hcp8G1tegiJl3TgOj9oSRWSZWlznXMJ8NgDfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206921; c=relaxed/simple;
	bh=YSz90HoRViZEeLV/yS0DoWEndr75ZjxfH5hHFvoGEaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3PMY4VmSgT9grSSZvPMG0ChhhkJl0PUyd8XLvNhzrJkb7znyWahZXZxz/BgCmY57AuAKbE+u64d6Ip0NMTtL3BxAhlqq8Tbc4C5Ccbtv+nTYXFZ9kljAp7vfmgoXQBashUDdi0DfIrCCeDlrTaXTreJVUxGTRYM3oQyMQJYyyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Ibk8SnGZ; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Ibk8SnGZ"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 99132202341;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7uHCgX4KnOIqHwCWqx/B67TJUZShK5Min7WFzl0m+Y=;
	b=Ibk8SnGZceInQx2gLTo7f1AGxyKOT2mfoe8MTlLEyVWveAP/riolRwzO5FgLNuWaZe1x55
	OfxbHpisIRwqy6ejkgDeIaj5eju1WICDMogbsRf8kWhuSsotLNHzsS1wHSb8Mj9GCM/MLs
	1+IP9MkcpvE8k7w8vVGXKWhwvbMNoJRVQoobzlo8cYY+k1datjr+aKAuk6XfnHmDyeYFw7
	Ap66ow+mcbltj6eUUNDAbBd7ee0oIyythdYT1+eL2O+5Fb9NZOARnVSaoH54TFqQU9HxRk
	OEgYbKxNTMMX3SuGm7VBkhxPlVhaOdQA/gS4wXqIYBGX2qJ4SggaR51Lx+vHXQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206902; a=rsa-sha256;
	cv=none;
	b=N6q8Yh2+Zygy/NJi0cbIlFpRPOP/oPirqtA8RipGS7UAFSVrlAJK8cHlzEe110JYsVwoBd
	yf8bH62Pc9eq9mZ7SU6FsKu+Ia+yChdXRWQzdqz3NsENK/Io/VVoTExgg8zJ+CmEGjfup3
	SMJs+rlZ7Jvm2it1BRV9gLmKtY6HopYJ3W3bu1HDHLIlPpF85TDnjnpbrHiEFN9bGQ05nl
	yBc9CcMxXpx1u5/x/SzpudpnPChAdKGIrdMmFl96ipDdzOb4tRU7bK7SY+wKWjovrWoJX7
	VBAzXJc+pyn32ihBiz24KtVZZjcSILdzSXXZPXZEZUY6BykRjvh7W0rYHhbpwA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7uHCgX4KnOIqHwCWqx/B67TJUZShK5Min7WFzl0m+Y=;
	b=DCwsILdO6gVC8t/gaSFTCDureqTBcVmTjhshffegPiWO5RrfauqJxzqLo0YsdvyzyfIC11
	/Rpb4MigmUyCjr9aQ+ta7jKT6sK34qSqz4uQ2XohEVXybcvWppltvF6q2OMki0FqTbH8nu
	IZkM37EE+lxdEayYAdYmvxiFMTh3/30hFtmiQJVwwBwMkiaumUNUeGcVI9vrlqgGURb5Pn
	wSKpRj9VQ1XHbcJZVAiiFD5o6Zd11ZTLeRYWadha/sYw4ji7tZWzu+mzhWqlEe0YyTFJEQ
	cJvay2htoJd6j6qyYMWY7oUfCgzoYC0dapAqK7jv9YPzZ2GEJABM5i59IDKkzw==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:24 +0200
Subject: [PATCH v3 05/10] media: synopsys: hdmirx: add async subdevice
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-5-71a11a2e3e76@pengutronix.de>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
In-Reply-To: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=7566;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ATqUgXT4lmD6TG2UokP2+MGkvCeh8uT3Dm1GSYdZZEY=;
 b=4fpeX2Jl22OzDzH8gukGY0wxxF/eFLVJyk8hRWCrG5BsOMoyb0Zhrim0ZVdbTsIt6ag7/yeK4
 HLp6ORBiR8CCvSrKUPepcF7wXfOxr19QIEvSWhmBCLdGOigU6bx4NzC
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
Assisted-by: LLM
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
index 9891e0f3874ea..6231bb28616c1 100644
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
@@ -2656,6 +2660,50 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
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
@@ -2663,6 +2711,8 @@ static int hdmirx_probe(struct platform_device *pdev)
 	struct v4l2_ctrl_handler *hdl;
 	struct hdmirx_stream *stream;
 	struct v4l2_device *v4l2_dev;
+	struct device_node *ep_node;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	hdmirx_dev = kzalloc_obj(*hdmirx_dev);
@@ -2782,9 +2832,38 @@ static int hdmirx_probe(struct platform_device *pdev)
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
 
@@ -2799,6 +2878,10 @@ static int hdmirx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unreg_notifier:
+	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
+err_cleanup_notifier:
+	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
 err_unreg_media:
 	media_device_unregister(&hdmirx_dev->mdev);
 err_unreg_video_dev:
@@ -2833,6 +2916,13 @@ static void hdmirx_remove(struct platform_device *pdev)
 
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

