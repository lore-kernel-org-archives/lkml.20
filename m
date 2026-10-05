Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC7472F83;
	Mon,  5 Oct 2026 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206914; cv=pass; b=S708fdy2wbJsJngU1yv5SWOWhtedcerVpBf/J3Uo6cUEvG2cnb2d2u1FNuJu/e8FvprW4rxjUpvBKPL1ER+zNBnnvfl/0dKwwVCJrN06WkepQ+Q4RfmvfTWxRhUtFUJLygudyQPPBM8UWLMue3bd7uWUy71lk9UfaTdJ+0iRT9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206914; c=relaxed/simple;
	bh=Z2S/707LKFckJmfAswAd7qQ8vAtBZ0QJL1JI1uDHYvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJqJm6Ju/BuuVoJDfsvEgNBBP6f0M+6xFHJ37Z/G6kYIZ0kXKMy0Xou4G8BIkPvscsgL98vvEXVS2dRGuuFjygGUJs+/B64jPFk2J3SjgcrkwZIz3dcIw53k/GE0UxflP/b0Muvp4kDB6ou6b7i8LyzTJIyF1nucK14hLJt2Nlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=FWkjvsb8; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="FWkjvsb8"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6BD29202304;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZwAvuXi+CUfemiDNWbnWzuAR8UoquFnbKhPgwJoCHw=;
	b=FWkjvsb82uJaiNPOpWcO/koTdH2XAvyKTpOZGLa0wiBbh6BwSx/rdLE9P+vDR5g8TkZIBx
	89l1YTMCS3Iu6cSxAu8VGFKPxyDNSaq4xdPP1l6sMDwsF1279CjgRFOpH8Fb9TFMRFGx5D
	CRlrMk8XnupriEASKv02qJPyet/auBPN6zaqkF7XtNAaWsiI5aE/ZjfK89wXOcLwcUH9C3
	V+IRqwYt5Eih2AWpAImzD+t9nOsjiFRq9XiS8QwPzXPPJckiFdeeW4mofscw965waktKBx
	/9BSoq4xUjEabSTX40GNHJFvamRAc4/59cLl9Pd/eTqxxL03WNmvkpAEXOcyfw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206902; a=rsa-sha256;
	cv=none;
	b=bs5ccyq9cBGZuBHqNDygM7klsxUhMXENOCbAuYuyeNA0wyD807ocHCYJjmwIjiAuyAQ+qR
	MexxeSU5eaAzYTzQbIf6aNbqtCIt4iuCNU2D7UPRjL+k29OzxTz4qfRUY/tePPX8UbW/Sj
	j+Jo/+HJnGjASasPHhOh4MYxIoyMdqgoUg5BcfLTQHB/ElcbauJS6Doi4NatIA+FYeerWF
	EYctG9uzKz4Q+ThwyRROp8pvvr+SJFFJT2mjTwiI0RcOJrWV2kTNowVfTasf52yqrKt6Ls
	in46jBypD/PDPmpHOX1iI6d+6FXSj6glfuYo9jt44JGeAwEkmbM+mSzUwqnjyQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZwAvuXi+CUfemiDNWbnWzuAR8UoquFnbKhPgwJoCHw=;
	b=aXdcmN7owngPjdvrQpBjdKtqyz1OwlwtTJyLANq8Za6ibV1tgPYsRiDiujqf7qgGYZLKCM
	2FDkZ20HcwX0+nv6PFpBrcXyFdipCBooWnjzDQ1aJfo9vRyxowKaHSyZ7pfDSVpVMTX1RF
	wZoHvnP37MsOBwqMPKueRpNY1ItdgsplSsQVwZc15oQjrlLOlaLxe8FFrgwgg55foCI6Hw
	htErSVc8uySU0EoxtzUIqeZI9X4IS3zpS7KVuGnDY0cEpBkwv7mEgmCcD44z3G1f1VIsYj
	PcsT0a3HevlVnJM4y7YLLUVcxlHxKHn2/Ge2CWHglo73PWRp+crD3MLQmHta1w==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:22 +0200
Subject: [PATCH v3 03/10] media: synopsys: hdmirx: add media entity for
 video capture device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-3-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=3219;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=/SDIcj7QQUvwNhSkFdTM7tLwweCH5u8yn3H2njMRnn8=;
 b=AqXKQQ8oNiBTBZblSC/dwVrY9sXHDz8Y3coKvOpV6Wnkr6AIq1oW3qb+YIfuofHFAppG0ATJH
 q/ACYxZnjyNCzOReLNsT7rfNGWLW6/MxK/N3AQzqBvylsRU7wVh0vBi
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
index 8b04c84be75ec..9891e0f3874ea 100644
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
@@ -2761,15 +2762,29 @@ static int hdmirx_probe(struct platform_device *pdev)
 
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
 
@@ -2784,8 +2799,12 @@ static int hdmirx_probe(struct platform_device *pdev)
 
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
@@ -2814,7 +2833,10 @@ static void hdmirx_remove(struct platform_device *pdev)
 
 	hdmirx_disable_irq(dev);
 
+	media_device_unregister(&hdmirx_dev->mdev);
+
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
+	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
 
 	hdmirx_disable(dev);

-- 
2.47.3

