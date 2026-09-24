Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA847AF5C;
	Thu, 24 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251568; cv=pass; b=CxfSF6/vIKPswEAL4OlMuMurG/w1Yuzyx5x1c9ICZb//3zzpXZXX6C/UTOxawyAcPcqtJeX0ueCayBgCnE4+Jt6r2SENvo3DkZjoMXZwRhikHPs0vNQvzcwSr9SPQ/GzV1JqE5Xew7BRBUENYyKLci0csrDStH1NSRBVueYQouM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251568; c=relaxed/simple;
	bh=ycs4ObMprK4flWOLIWr10LTMNjPTG7lkKT5OYTwxHBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCPWkP5ST1goNCAZDx/+jbtun2RlowXiMtqa08CJj14p3Ns1Yoe+aavMFkHN6Q0PqEdNKO7w2HaeJ7k3pB3TbUUCYRXG+TcnHKSTdLCr+OPOp6keBMlX6oNxi2DikZwAZ6T+791uPRNeX5M4Vhkp4f3xuQkIe5/w8zPdLoY5vzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=QSEq5wZZ; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="QSEq5wZZ"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 07924202108;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBEDDu/J1MDr9WOvSIGGAqAjcW5uhUos4+n3DxvZsBo=;
	b=QSEq5wZZli64wsU5MJTyUrMU/tAozqb9hTjBlB4Wh7LsCI8aNVlsUiU/Q/kZkxJYmMzfcM
	ONibrkKt7lZmilh+desUKi8ngEBypKLDAYpgdpPO2AVU/bzMyJ/OGdyKhhhtqzT++hj1yl
	Tf/4tBSIgBfz6T0tuKdXu+0vr9CpvzI377yJ05Q7M/QbQo7Q98O/tNuNtbX/9CGs4myGSj
	ITguzgPVfnNPl4E6dP2sokLQiqTLktuhGccwWhAVeSoOYUFosnRDdNU8R/ADVG2MKuSTmz
	gysn7qB/9mMiRNq6KkIZWrkcU5hxc2yJUrzb4BFgqth2Z/bbyVGILhabb/Y1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBEDDu/J1MDr9WOvSIGGAqAjcW5uhUos4+n3DxvZsBo=;
	b=DN3KC+490X+GkjKCAIePfYFBgmBnTY2NVoEBjtbpfGae/GXXPAFivAPBxmd3eLGu4f9cv+
	9WZJM83MabxKx5Kk5k10LCxsj3QN9m+qomV+EuDup4lnR0l1ouyov8JnepxInhoPm8IH/l
	fmIl7psmccqLNErBDDERvar6rto5HOCUKypIndIkjScG6Vz6xNs+V8OjJJX3bLYnVOz4zw
	KWZmyRo6Kyh5tLjmxFzIOm36zeT/0GreYQ491VEdz0zvXsTdS7S4YlBFmRPCShBIgpFMxT
	DcrzyrcDHwdrMOJZ2DpedBOBAYcHIZwLknmtERx5qn2serqGSqY/5DqUnLurGA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=J9BdKevW66DrAWxfh3x60RsJXWJVIp6lNEpsqSDS7XqajnUwO81fXnXb7L3l3GWItqOC8d
	/+YN2jo590zBbmqoZkALSC4IOBJ4dLv9a2jhMNh+DzZcpqJte3Njk9+dq7HCKXqCu9z5nl
	29dPXtAhezwIab0YAX19TBmRDOwvgP7G2CkUrJus3oightzWHdaejpVdZGSB30U1zA/p5H
	LX+/Ve5rLndr1sqEW3bXY2NeIgPAlfwcpVi+ku8GBk1LScpkBQs0K+tgSK9LCshV1Cierq
	1cWeHEVT9VYBU8gXyI0gnblnlw2U3HkTNs6z5Cj+b3dI/yRp8SPb4Qx296eE5w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:05:56 +0200
Subject: [PATCH v2 2/9] media: synopsys: hdmirx: add media entity for video
 capture device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-2-c12f641d8b0f@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=3301;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=E5oEDquafxhjhoyW8XKX219aNRI+JsAYY0MoDfrT+1M=;
 b=xoMR6gm2bgiz3yI0FwRL8wkwVA++BSdSk505hNq+Fqie5U9uGtxWBe9ZPEPObsnQAJLxn6qDP
 iOsU14MgErCAdknReVZoBaVktEipJtKaoV5S6KqjBqtd+d4eqEz5Pgi
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

Register the video device as a media entity with a sink pad to integrate
it into the media controller topology. This allows the capture device to
be properly represented in the media graph and enables userspace to
discover the device capabilities through the MC API.

The sink pad indicates that this entity receives data (HDMI video stream)
which is then made available through the V4L2 video capture interface.

Initialize the pad before registering the video device. The previous patch
gave v4l2_dev an mdev, so video_register_device() already registers the
entity, and doing it the other way round would hand
media_device_register_entity() an entity with no pads yet.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index f51a1619b71ec..11a9b16586a57 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -125,6 +125,7 @@ struct snps_hdmirx_dev {
 	struct hdmirx_stream stream;
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
+	struct media_pad pad;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_range;
@@ -2751,15 +2752,29 @@ static int hdmirx_probe(struct platform_device *pdev)
 
 	stream = &hdmirx_dev->stream;
 	stream->hdmirx_dev = hdmirx_dev;
+
+	hdmirx_dev->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&stream->vdev.entity, 1, &hdmirx_dev->pad);
+	if (ret) {
+		dev_err_probe(dev, ret, "media entity pads initialization failed\n");
+		goto err_unreg_v4l2_dev;
+	}
+
 	ret = hdmirx_register_stream_vdev(stream);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "video device registration failed\n");
-		goto err_unreg_v4l2_dev;
+		goto err_cleanup_entity;
+	}
+
+	ret = media_device_register(&hdmirx_dev->mdev);
+	if (ret) {
+		dev_err_probe(dev, ret, "media device registration failed\n");
+		goto err_unreg_video_dev;
 	}
 
 	ret = hdmirx_register_cec(hdmirx_dev, pdev);
 	if (ret)
-		goto err_unreg_video_dev;
+		goto err_unreg_media;
 
 	hdmirx_load_default_edid(hdmirx_dev);
 
@@ -2774,8 +2789,12 @@ static int hdmirx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unreg_media:
+	media_device_unregister(&hdmirx_dev->mdev);
 err_unreg_video_dev:
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
+err_cleanup_entity:
+	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
 err_unreg_v4l2_dev:
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
 	media_device_cleanup(&hdmirx_dev->mdev);
@@ -2799,7 +2818,10 @@ static void hdmirx_remove(struct platform_device *pdev)
 
 	hdmirx_disable_irq(dev);
 
+	media_device_unregister(&hdmirx_dev->mdev);
+
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
+	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
 	media_device_cleanup(&hdmirx_dev->mdev);

-- 
2.47.3

