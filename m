Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312F531AF6;
	Wed, 23 Sep 2026 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171104; cv=pass; b=gCKNhoyT9yPn7mm8l5+S8fbUU44bWposEdMZLr41LoS+YhqGoMjZ69MdQ/Q4DTjOhbK1I+U6VpGWa1t1vhq7tWZUEkiydVhmBUW0KQJ4dCBoSudoGhf3xiEDXhejmHAJ6OWZ0ec6SGUGHONjh53Usq/REtbG7q0lkIjaD4ewlb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171104; c=relaxed/simple;
	bh=/C7CtqaNr5SoHMXI/KMNxIoLwTQ7gGl2eC5ncNA+6cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfPHT3TcnAb1pLPjcp89hrseMpou9Ba0Ql4DtILmwjsVDh9I8NLD9G1nXe6+/jzlyuL4wOQOA26VoGME0NIlSND7IviRlZLfe0dws78syPKqqUiAKRabrFcJqwF6Nyfowzx+xLgxqI4vx30wpCT3SqFu1bSpVLGEllrKomj8Ot8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=G6A1A9CS; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="G6A1A9CS"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9EB81201A8D;
	Wed, 23 Sep 2026 15:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gzqi4eMOsIxYxypilO5M4GqTbX/Tk4lvEkSYHODftBU=;
	b=G6A1A9CSvqb9gOrICIw3EgCRXVZisfi9OQS2F+alTFwYXC1OwnQ+4+IZKl+WkYWqjvfGfI
	QuO5XymhspjCW3U6gaNm15UWd2Dv/MsgZkF8CxFOn4+mIyCP5zf5fsf2mUQ8Ofz+7JlJ6k
	h2X+PI3aFR2mJuwdKoxXevNT2W7wY0ByYzDsolRm3899h9wFM1jN3oQQ0QYrMWKnE0oMxK
	DmMYwLPIpHYHhHsided9nR/ubBzPL6cYv3D1WMRA3NfrkwrSH+WILRnrrFHW6XxH/5C0gT
	1S4fdWcpIGisConT79oNoSxpnsG0jOuW2s+x7RcPshvOMfDND+AMjq9xCqRmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gzqi4eMOsIxYxypilO5M4GqTbX/Tk4lvEkSYHODftBU=;
	b=CcsRGgmOw+JfHuF8956B/deSJGGKl4vZG3BrIC3pfbFWgKga8Wh4sFN6sAZxT0nk4RqojT
	/xy27JIpPqKSQ9ER6vDg1K5aUuVugVA1dcmal80utsqV74QqksH07nnql9HL7fZLkIe/fp
	PF5HHP4CsJsX+MKeJ/7QvKWXxUlRJfDD8rS80TuzxLdg3eLvWwlVXPJET5MmjykwANnA2V
	3CGWIIbhFBmkdfoiY3oqN6Z3ZuvM/Pzno4/NqV97B2a9EL/kbmGdO97pMdcQLm1wbwCQmp
	32Bjj3pcAVQxRv2l1El3eqJdWBCqkFZ7V6DJUAuSOQCoWkSVJ94gSd1gBtv8BA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171095; a=rsa-sha256;
	cv=none;
	b=bFh0HlIgvfb36rPgUTCTdBniHwwq7oOTIxYGHgCiCCtuayZpCgwFW4F0Sg6PEnQthBuSm1
	Ivv2d0Hc6Ubah6pGzLwP1Zp6S7SmkaB2U5l++NFNCgpqrsdgRFjk+fjtGGuJHRejhC6xoN
	ASPDKP27svRNlyNbdL9sqrNeprCTISqJf6JtjCqU0t00hE651CsoqrmhM++vGUql14z093
	1rrlphx+sLd+uaZuGn0Cn0pYUwgrM8DOXtrfspfjgDjUNANdPj2rnZ7sHXQIqxA5NIxcvo
	qVM70kOLoBuVAgJwrTkrTCRNuSq5LGXP67ZenTm4aqDLzIqOejswSLukiFyGcg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:40 +0200
Subject: [PATCH 1/9] media: synopsys: hdmirx: add media device
 infrastructure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-1-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=2335;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=NuNNgUFsC9RW7kHtNJHPpvTxgDs+TKGIHfD/QjqPBAI=;
 b=ajsNJlG+Oe6pNJYyp8H3gdCpveJD4oPo9+kX+oyzT56d7I1P6UP3LfkuPQCuB6wQvv2esgPYH
 M4q6o3sUIRJDBiZeKYtIV22X/dUWT/O0mLdZcVtcTaLcD5l/SCNqZe3
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

