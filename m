Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7947CA73;
	Thu, 24 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251568; cv=pass; b=gO0RkFQxbBN4FuSKevZU40GpnA3AFW1XOL4W3WBzbaor/36VolHU33/cZBSDsa3eXduN5DJIiTu56om7evGYgYNAKqtiLuSc4x4tte008NEgOwOhgjGGX8lIwhXk/Nxqn/qPGkZRS43XcP3WshfK92FFizymrSIBioi8Du+9BVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251568; c=relaxed/simple;
	bh=/C7CtqaNr5SoHMXI/KMNxIoLwTQ7gGl2eC5ncNA+6cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfGJhyJGGbMVjlEZKnD1XntB8VqJ9PafmPCs7zgp1uLnB4wZVgLxopyRPjOqIYYC4uEP4VorUREP/8jgTy7XsmfF4CQbK8fXRY9WWGB06/Ix+Q3RsEZH1Gw1/gveYAG+NjCQfRnrcSgs5uYho3TeayF1KvkzDK7UN+T8av0xECE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=MsHD9ARS; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="MsHD9ARS"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E7179200B66;
	Thu, 24 Sep 2026 14:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gzqi4eMOsIxYxypilO5M4GqTbX/Tk4lvEkSYHODftBU=;
	b=MsHD9ARSpos07Ec1zdf7rkPXSu/PlAK4oDQJSoF/aBBQ+AB8tzbOSVUg+DoDjauJP8Pfbw
	GAoF20KyV3SbOgCJ0QEuE6P8AA1IbvLQkd+J8Uo5fZLr2AcO3ZdI0hlfG2FcUinz0SzHlc
	pTqKoxA2jy8AFxEbuEy2p/Z6gvJkqSz6fYgpN2z0IYdHnlPYe1SAX7Ly4BtnrqtIBjASLM
	gBc9FNMdXAy9JaVyiECV3FFUebTnM9Uiq3zWFwfyJr58/ymECGm4gnlAaZn8qMnbiLbw0k
	pXO/iMvp4YbEGM2yQp/NPFVVLbR1lNTg5lWyJG3bukfuYJ/3vNbtkb/9WLsP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gzqi4eMOsIxYxypilO5M4GqTbX/Tk4lvEkSYHODftBU=;
	b=GKhLATccSMMEvIzBE0Szk7OHfSO4fay8DtcDSe0x7SfZdLg4c05+UoCjqxyrArKAHomqpb
	iopMksTFytDQAWFljqt4CDG74GyhuIYOfcN1o7pFxboG/rtnV+y1e8KPNq1s0ZrZQ4g0u0
	HQJVF4bPXPp2Dc7pRbQky+pqT9Gu8ILUCVXTk2LhHDw1xUXlwOSvIoyORGjz8RifyLURHL
	UT4lz/ejK+vPnChv2DPt9UT4wShxPhbU+dIxZcfQwsgAUkzIccRabA7e6oCA42R7nBc7ru
	KzVk0zTeojQwt8w4aPa1yFCZ8hScuvIRDkXCzF96gHB64NTABNU2BoM+QosbwA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251557; a=rsa-sha256;
	cv=none;
	b=E1nbUcOkcAJ1Lhyv+TOw46eVqu33AEIlDRspFQUFKbLTRyKvKHJt4G+Bp9Gf8djFiwS4Hu
	wRgsmMb+ksRX+U5YjaIQWnNM1XrRiX/hfK1txpl6JYcD4c8WR0Q6/EGpsKZLDGJBKLi1lx
	iYZuifT9K9/luxa7rbkTjJJa/Fxj7lBEjzn0qOB555hAzB6+pR30TrqSxyg+1pw0nyzsSS
	IPikajcrvIL7/21wQYG3qnDhvzxKZGwXKFHwtsCdYYbsV/KLNDuPFnxE4og91c6EYa2eLv
	4AG+PWQ22xpEXerWw6LfTTrqqPg/WF6uvaZ3ehM1Ti+OUFWlSP65/FKaZ0ji3A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:05:55 +0200
Subject: [PATCH v2 1/9] media: synopsys: hdmirx: add media device
 infrastructure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-1-c12f641d8b0f@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=2335;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=NuNNgUFsC9RW7kHtNJHPpvTxgDs+TKGIHfD/QjqPBAI=;
 b=h+3MY+jpLjJXmh980n/HklrmVqu7S7CL6SJRgLUWmoO8TeZ6kmtl48zqlhRXzLeP4DDqACUNF
 xOOWEJSgtVOA8OO51syF29rlzPkvRvukaRqJF+u2YspkhQGsQr8cIBT
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

Initialize the media device to enable integration with HDMI bridge
devices in the video capture pipeline. This provides the foundation
for representing the hardware topology through the media controller
framework.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d946..f51a1619b71ec 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -31,6 +31,7 @@
 #include <linux/workqueue.h>
 
 #include <media/cec.h>
+#include <media/media-device.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -123,6 +124,7 @@ struct snps_hdmirx_dev {
 	struct device *dev;
 	struct hdmirx_stream stream;
 	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_range;
@@ -2742,6 +2744,11 @@ static int hdmirx_probe(struct platform_device *pdev)
 		goto err_hdl;
 	}
 
+	hdmirx_dev->mdev.dev = dev;
+	strscpy(hdmirx_dev->mdev.model, "snps-hdmirx", sizeof(hdmirx_dev->mdev.model));
+	media_device_init(&hdmirx_dev->mdev);
+	hdmirx_dev->v4l2_dev.mdev = &hdmirx_dev->mdev;
+
 	stream = &hdmirx_dev->stream;
 	stream->hdmirx_dev = hdmirx_dev;
 	ret = hdmirx_register_stream_vdev(stream);
@@ -2771,6 +2778,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
 err_unreg_v4l2_dev:
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
+	media_device_cleanup(&hdmirx_dev->mdev);
 err_hdl:
 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
 err_pm:
@@ -2794,6 +2802,7 @@ static void hdmirx_remove(struct platform_device *pdev)
 	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
 	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
+	media_device_cleanup(&hdmirx_dev->mdev);
 
 	/* touched by hdmirx_disable()->hdmirx_plugout() */
 	hdmirx_dev->rgb_range = NULL;

-- 
2.47.3

