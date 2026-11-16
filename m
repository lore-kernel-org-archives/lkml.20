Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842364;
	b=s/kqhaDOftmshnHVAYs9Q1DufOjYIKOKxRj0ZSVKgDwrvWoczJLlGCKkC3dHnrJRodoV
	 dWAQqsb3u6cJ4PObmW309XGqJyzJjvvCLIqZde1wetz5mfkeWEmG7O6rh9NtLeL/mScKm
	 WrlHFrJqrJAMLvKUjcIeNI2xBmjauSk0jcwsD6oU6SqWyRDWwU8IRc3hJk7kAig369RuS
	 l8zcbnECNuL7HKwfy/LsVVHUKBJXzQx/ccIwIGzM0M4cJS2Xw7u+AUhUGliMPlU59jVdy
	 lfS9hQHw8pjejxt4K19x3lpw7yPygGWxVqOgB8qZ8jPM7kQ7eME8hevPlCj6yrD2YOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842364;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hnB17rhmQBWtzUIZ58hVjTYdWcGS0s9j9kgcpzJE8eg=;
	b=qU7AVfl6e+fhu++S0Po+3AvJSdY70KX3IShvCcX2xfRc3Zt/kATIRXQfDslQwp5FTjmH
	 M6G3r6xpAFLNNqnx9Ypp0v4zKNU8rRhTwrTjdTk9ptXm9jdmgv2g9fhowPu43sOkA7Mli
	 GowS+tzpDtESuqeon/zTrymRouQ+jXz+18Dqtjr4IdTWEr8GZlaBMBk59nifyC88oz1Ox
	 HiC547EYfg6P6FykcZEio+Hxb2HW5D8qctxmdqI9LmtR32W11scYjcXaTmcvzGl35NT2/
	 cuxOclTkP8SM6zxoQY1RT1gk3rd4J0ORjtL8enhi+t/LTbpcre+DRBCpiROLfG4kzLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NvEDK4lc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332C5606A33B;
	Mon, 16 Nov 2026 15:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332C5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NvEDK4lc
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7B702200668;
	Mon, 16 Nov 2026 16:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnB17rhmQBWtzUIZ58hVjTYdWcGS0s9j9kgcpzJE8eg=;
	b=NvEDK4lcRSAbcuKSGeN/66IQb6Gzo+3H1uJg4MOOjV9yyFsP01+R80FDlFNaJ13MboxW3h
	e+bPrQS1oubeAIQ76lEOs33Mz0SPCTPbz7i2qZvJkKHh/6Ed7HvgyanehxmywXwGUh4hHB
	gO+KgR5792aGiByybGNO4xR+e1ZrUIp02aeBSzjVPTEuBRLv+BljVWDwiQEbPlluDbNZ4A
	XvEyoTnByBNgcokDZ1P/smoQhJo3yNJjDGHSq0/lfUW4GWO/pk8/7chgqkI0CNEmUelIXT
	F7IoIrpi6mcNhLOMtFSFw9SMb8sf9KT0NX+vJLRmowBJZ36Hpo2SouHjmzmYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnB17rhmQBWtzUIZ58hVjTYdWcGS0s9j9kgcpzJE8eg=;
	b=Dm3urWBJ9WHNg/t3Wvxa8C/nbZY1UZQBxFLdJBAPNX0BcpX5qYsMwMYfIsvVPseSiVz9bF
	NhD+OL6HOQW9I/E8xLSBUd89S+YyzpGIJkrmKGKcOimjaXRHporF4JIrROkPdbCUoOu1c+
	gVnI1xdawVY1+V8muqiNVTH6KSQw3CNvE8ggIAPau9BlDlrCQS2LoFHITOL88xW/ppmMuO
	gPwGD4/Mlj6qE1+Ut//FJEjZvCOFGzlUcKtaMuJNmRBXE2eWVmMinuAD8Zd19hJP//T42l
	sYN8W9T/WhkZFd+pVZX5f1NAQOa+S5gBtBLgrU8z08eFbX4nOUCNe2i53n+J/A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842358; a=rsa-sha256;
	cv=none;
	b=FDFTXQkdMhvWxhNuhRiSFrO8/KAjqOUaIXYjiDIe8LFVMTHTDoRbeLwt4Dp3R32cLAh4XB
	wlwrBiPM3ry4hE1CgNSn2Q2Pgp+adarxyHvvJ7IbVuG4Gsf/hbZbpHh4tPPscQqVfjCTBP
	UG7FRQIWLYYv3qsfFem9YY19I2z6U8EcPWHNjCpJGVxoXdjSEKMgx90UiwsYnau5t5Z/C2
	NdmoGuF2FlfHJRWHtE/C/R2v1BK79ObGwIqwkbqmnJGTLHS4jeLf47lMOgkBed4KNTdsZb
	wmaOj2kYnd5vrnpwLfKr1B4Q5hiitJO0g6zHcQ7R696wdE1770j05oU0BgPHCw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:02 +0100
Subject: [PATCH v4 2/9] media: synopsys: hdmirx: add media entity for video
 capture device
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
Message-Id: <20261116-hdmirx-media-v4-2-7aee4a0a273e@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=3278;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=THA4v8yDAN4XQR46mc9WWssbg3o4qXQhQgbMTHPRF4o=;
 b=E9zWLSzr4qcnTr3jdDSl84nXxZ+zUL6jzQBXt/o3jyPpfuoaJmKgGG9kPMFIam9+THBruOn/O
 Ig1DnHwPjrtAWDHLrqfM5Zn8hlTnLMz3qdcGks16rFESNEF3yyuEzk7
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
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 57e60497e0e30..147ff01c5c843 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -127,6 +127,7 @@ struct snps_hdmirx_dev {
 	struct hdmirx_stream stream;
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
+	struct media_pad pad;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_range;
@@ -3064,15 +3065,29 @@ static int hdmirx_probe(struct platform_device *pdev)
 
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
 
@@ -3091,8 +3106,12 @@ static int hdmirx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unreg_media:
+	media_device_unregister(&hdmirx_dev->mdev);
 err_unreg_video_dev:
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
+err_cleanup_entity:
+	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
 err_unreg_v4l2_dev:
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
 	hdmirx_disable(dev);
@@ -3124,7 +3143,10 @@ static void hdmirx_remove(struct platform_device *pdev)
 
 	hdmirx_disable_irq(dev);
 
+	media_device_unregister(&hdmirx_dev->mdev);
+
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
+	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
 
 	hdmirx_disable(dev);

-- 
2.47.3

