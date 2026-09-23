Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB3C531617;
	Wed, 23 Sep 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171108; cv=pass; b=PHVS1g62oB5Q8arIUzh0Jh5khPeck4KVRcDVwgdsoruHdBUod2wJllzPnzmEF50I7QSdzVzr79zkuWSFhRkK8lHyuHwpr6FFsqAkIFnA6BrUoY/qhyR8OHntKso8RdKWcnGvXFO9OJed+ofbAK966SPhpk0lRoHg6bBy4Pc/c28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171108; c=relaxed/simple;
	bh=ycs4ObMprK4flWOLIWr10LTMNjPTG7lkKT5OYTwxHBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+6BciGI3OsFuaF4vKy8+0jGM9XUTFtW9AIgGyffLQt4PdCteUcjDhe49VITrSObmq+adKTGolF12MgVzLib6rRx1CTnUYz2aLO+RWp3oAHf0/nUpDSMsSs5ggxqRf40GO9+WDByXV4eDvkQqGUocQTf412MIKZXx8lrf9lSQyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Y6QbGfZ2; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Y6QbGfZ2"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E236F201FAF;
	Wed, 23 Sep 2026 15:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBEDDu/J1MDr9WOvSIGGAqAjcW5uhUos4+n3DxvZsBo=;
	b=Y6QbGfZ2BYhLG8n0vv9pjRqF7062pwVJWPzXtw5hEWhule3EglM6oTBYfWhbkWL2FmYCCR
	bsgft+rhnxyJyCZCRYu0QtkQfVGZwtq78yn+DVQNII32sAHwuBSPEGZvva1zLAXqMWKAq+
	56rbXqTKcbCX0701VS6MX+/tV5e6D3CIIX0EEKrhIIqj2UVsTqGLEHsZtT9XFeIFRXxwE5
	e3eJbb8Vh4JRyOZprRFvPhpQjTmNpfCoTIqjD/AiQxoK2MdaZFyRoceNznMWfVWTGHVM27
	6A9Nj98cPfXXhn7r8r3Db5WwnAlYEle48Xjvc3KdWwnIsAa1TvRzC+GiUMELHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBEDDu/J1MDr9WOvSIGGAqAjcW5uhUos4+n3DxvZsBo=;
	b=GqvSv4DXNYpzItyz7G/onRbavf7Wc/aOVh2pjAFxGQ+Kjr76oPaYpV1HnyXMqgpYWcPi07
	qw3rr7TnCM7ce1DMxzB0aozvanWtvUn7PgPK10ZSYW9jGOZdx4KprrvPRj0U1ci1tl77lJ
	90Yih3htvijT55MmJBJPyq/b3pLLCZvMEvyFaqQT8jqo3577esLYrAORhJSq5Fy+woeAsC
	H+/7U7O9V23bGuXWcs6KhC/z8SipClKOBGsknvTTvadLK+A2JLxPmo6/cYCv66ujw3gsVA
	QurtCbxefFk6TqjFOd88tuv61wcjhNijsjD1kKPMmsNpnnZa9z38jOPsM/1qLA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171099; a=rsa-sha256;
	cv=none;
	b=I71QDvMZNRpxUiBzze4WXXqI+7VJmHpQcMvijqc+73ecMo/Hw+/sCPcPYoRIsEej2s0aN9
	jrJcElPxOLjxSvOssQtyC4lXbAzw/U78GmdH79AORzz9wH0fPYIJnE3W81lH8a4J7o2ewQ
	7FjQxGd64wNP7wpxy1CQD4wBQJlxlPpQaO8eKpbjXv8hSwrwIil75bvLs+RWVFIT3o9V1K
	iCuP2exZqD+5FpzsC6xKH9aQIGEuvkYEAGWri4Pwb+6t/fjUWlkGO0M9OvpEwn2wDGhaW0
	ZnmFT03I83N/qmBuBFOPfn1MCHRRqadER1Uu4zQx19QmJPWrMB66HZ+cQoYPDg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:41 +0200
Subject: [PATCH 2/9] media: synopsys: hdmirx: add media entity for video
 capture device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-2-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=3301;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=E5oEDquafxhjhoyW8XKX219aNRI+JsAYY0MoDfrT+1M=;
 b=Hq9D9sl+jp1d69FjvGE+J3uwz8pQkRjW3JXjpak7EF8MS8bJlFmI/Ky25IfrlI+bRGZlQ2Evr
 g7diPPtFD5kCG51hRi+DPRMWVZz4P0HEFXEXwJvokAKwaQVOo2VJlwc
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

