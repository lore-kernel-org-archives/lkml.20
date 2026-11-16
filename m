Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842360;
	b=RUNPcIYekhTvM0IElXRwe16zqyivWLAtujRqqkYEl0tSYq95lO8cZZHHSye+TzB21OEZ
	 4gsSg2weD+Gv7DI8R7+RsG1O/ZZpY8sHc+K3Mh0GmcABXmRujhnlooHLdgxRN6MQ4t/4J
	 fYFIaaYnO94AsXou5rAodVTDGEBjWelpQPd7oGDmZ3NLw+ctk+9JD65asL6DEM5EGZ2k8
	 qVC2M7Ou+oP2LYVQ5OaSld3VMvwao8FaF2UEiW+UtGlJEytxJcAPCdkybmc7jin6PcyUf
	 3Pdr4vu/GYCuJXZSABKGABTlo7BL7Ck1RIO3hGc65+KWYvnBXb/Y0TZYhb3PKY9ke7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842360;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DzRKl/1ZYKw+Yd/AXH22c4li1L1iaO6+ioSAJjjMGAQ=;
	b=tpGjyk574IjWknikTEa0Z8AAOj+PeW8SfKizl/iCbs4HUNxTSA7kO/1L6I4D44m7oqoM
	 YFxrRMZJLJ4p7SnJ0SDzmmSVLE3IwpZrk4pOQtMqm1S5npOioSbAIfaSiaLKxg4JI0A9y
	 iIdWM5WjXx1R4FoJX0LqAZEfTh7IMSizp4yyvMiEiUs26OalgSXkr4Pux+eEUQCyWKm8X
	 Y27EX21jypGzqX1U9zzno+x4nhZMQyVs3AuGaGhsDWwTh1AKEzR+D3lblCjGL9gHPHVJ8
	 v//QcNUUAAtB72okQVHk5EekGZfVGQgFv+4JR9IV9KiH7uPFvJDtnO9uZ5HFRjj0tOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="ZX1id/bE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70EC606A339;
	Mon, 16 Nov 2026 15:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70EC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZX1id/bE
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3D2A9205A17;
	Mon, 16 Nov 2026 16:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzRKl/1ZYKw+Yd/AXH22c4li1L1iaO6+ioSAJjjMGAQ=;
	b=ZX1id/bE2c5ndJFWLnvWdSR3FjjWLG6eoqm5rQwb+yKv/RvJ3vqVSM6dAKMznLpP6Rb2z7
	gv8pnDqCC6CX+bgacxnSY6lM52gXUBOixJf9E2WBFOawxQrC7yxZX2AQSFpLx51C62GW4U
	MdEuhBVIsVYZkmtDGghdpJtO1EjueXTRmvxk+MI/1oNdvE4nXsIqftw5qq98PzdX58doi5
	DbUzmY9P9FKZqs2Oig2AXQmyxAhI12NWwqv1zuR3dC95+V7dNkIuazytER4BuORnyc2prY
	fi63XDBSvPT3ldTT9rQXyql3W+vK33aLk5nXy0KvqVP/1KHW3c7b2OFD3MJjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzRKl/1ZYKw+Yd/AXH22c4li1L1iaO6+ioSAJjjMGAQ=;
	b=BNvnyJIQfzGwxKUmhrLZf67mzVEc2rpYGDKRZrR1HKQBks3LxqQ/q7+ytYPXkihp6SYfQ5
	oPUj2DcqjAP/dl8+OtPds8u5lqWgPFpjGa+VoXJ/4psXe3VzAIyBWNOtdFwAxrL7hBg3w9
	FyspXapGmcuLRW02HcD5bw/5D3vuwbgWe+f4MOI/5zhVFYKvblGPIiIdx2zCjVxVDgjWzC
	1GqddalxjJFLxtVE8J9dpgAJwxqIpb15dT0YANrTdfadkM3nDYtkRwasbwHz5074oiKDMD
	38ZL7wmJqOZoxvGasncBSJ3sbkrQddATIwcx0Eij+OMQeejalNyZJ5z03kdIYA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842354; a=rsa-sha256;
	cv=none;
	b=ZlFSwj1u+lL5yCmpiZTpQhm2vt/fznx8rDRpKzndzLafQxrJDMToO9kvrDlwkrlcufbKfl
	UPmI+kVz+AWwHyH+iKfKJrH0+VxtaduGTJImTFqKDHc8kh+xltwmMaCd5arDqo4a2DgeJK
	veyvXB9+1TX5r7ygqFYblQjGix3AU3wJlAziYvkV3RsEANsEGfZ4zmqS+nh0FdytBWjK7B
	AqXZ+lTgt6lh2PIiMjDW7ZdydBxgtBMb9OnxDBiL+nVoPPG33SesmdAz2Xqf15U8ekyLuO
	oOKbQsOFaC5Qes/dESLlWcHXHU8/CAY9GnzYYGDb+rSOgBak4wkPMyHDGZwH6A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:01 +0100
Subject: [PATCH v4 1/9] media: synopsys: hdmirx: add media device
 infrastructure
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
Message-Id: <20261116-hdmirx-media-v4-1-7aee4a0a273e@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=1976;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=+denrOhVi69wu/aeZWXcmP93eHtRDWBl44pAxZ+NKtM=;
 b=+Ylbqqoj4Xkz12iJyB31zZ245kboV5qSesID8I9ey1ZIME99GrRc7l4PbJ87GY+aFy9N+N0gC
 g6C5TV1FDWNDLbBSonVUT5K7R3BxgubMBK8OdhizLz5n8eJzAsJ0Xvt
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

Initialize the media device to enable integration with HDMI bridge
devices in the video capture pipeline. This provides the foundation
for representing the hardware topology through the media controller
framework.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 8a5304603c00d..57e60497e0e30 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -31,6 +31,7 @@
 #include <linux/workqueue.h>
 
 #include <media/cec.h>
+#include <media/media-device.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -125,6 +126,7 @@ struct snps_hdmirx_dev {
 	struct device *dev;
 	struct hdmirx_stream stream;
 	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_range;
@@ -2951,6 +2953,7 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
 		container_of(v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
 
 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+	media_device_cleanup(&hdmirx_dev->mdev);
 	kfree(hdmirx_dev);
 }
 
@@ -3054,6 +3057,11 @@ static int hdmirx_probe(struct platform_device *pdev)
 		goto err_pm;
 	}
 
+	hdmirx_dev->mdev.dev = dev;
+	strscpy(hdmirx_dev->mdev.model, "snps-hdmirx", sizeof(hdmirx_dev->mdev.model));
+	media_device_init(&hdmirx_dev->mdev);
+	hdmirx_dev->v4l2_dev.mdev = &hdmirx_dev->mdev;
+
 	stream = &hdmirx_dev->stream;
 	stream->hdmirx_dev = hdmirx_dev;
 	ret = hdmirx_register_stream_vdev(stream);

-- 
2.47.3

