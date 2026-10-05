Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98178483BC9;
	Mon,  5 Oct 2026 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206912; cv=pass; b=UOyKQX//w0XMyZcPAhXe0/tSBbzZ8a2sXf4kb1jsf7GJ9cxgI/MujfzEKLLpRm3Ay+NazQaZ9UfjT83jEJQsCCJ1lVaPYFhnl+GqNsL2dbNWtRXjDSua5IjdbBzfdMd447FgFCxz09v8cXVbOE3vWIXiDh6Otu9Nh1upHQThoXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206912; c=relaxed/simple;
	bh=B4OB122NdznTwGjPkhxcZurXGT/jb+AvhEpLNLFhdeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSQquHLuXXaZx3HwcZ2ICrovKgxfYxB/BbG/YIv/oBBMbdP2H7+25V6SzQJ+z8KYiRthSUVr0+5ckjb6OaCr3Ywq8uUJVOlxKF5reebtuDCsK4B7auXJmol8+x+IP4Q79fXqY7m8XNopIhUCF9GOljztsHHetENAtWXrDUwPjDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=IUg89f2j; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="IUg89f2j"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 55206202303;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qFneUXoCx3btWkEycpNUmnbVcvHm4eU4ggPQc6Vkj0=;
	b=IUg89f2jP3n0+EC5/1thJETtjIsJK1J2hemAUQjyOKTnCBDhpgV2LdXod17XuZIpgN8YMc
	pRgH4Pi6vHW0FnGM/ZTnx5jtR6YN5IdNsKcbH9Fgzy2xKBo+uVI8RpBhWlpx/e4tMkWXZO
	SCPlwS0asadt33Fvyb+aFF8G7bG4I+Y+emlqJxQF0SYuZmXEIFeNOs7r07k8lyBmWR8FSA
	7iO0HcZg5caaM11ndr94UxUb5o2Qj/2hgg05GNwli5hXX2EMxO4FuaJbAPb9hwE9eWmk02
	NLzb2je54613DgJL/mz8ucpPs9TxjYLVCtsAPdRBF3IO2J+tHbgxn1SewMT5vg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206902; a=rsa-sha256;
	cv=none;
	b=dkfDPjZP4VYfp6PAiRQtJPAuAoPjlLrmScZU6N6MJG7uqbGkGRlESxJa9CYjv260eaO0h7
	4357j8d3+0qR+T7qn4+Cs0eP9yn6IzjS68b4BTtiF31yW+h5sZfx0CLBgLCQ7vzH0MUQsi
	cg08JKM4eXFTyy2lsFWECsxW6PvDG4jb4ztiOFPe/xBbDMJaAHHRO9R6pzZQgPgin5FCIF
	f3pVS3fV6/kqy3emxVosYTmkP1VO7FVsMgM0jDP+SVqnEUt6HM1FEM+C6NwRTHuxQOD639
	oACW4rXrfmyBsoyKPGqSCeR0Xs0T2Nf2JUQjCmhy2nJusgEmi7H1Wm1CM5uyHw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qFneUXoCx3btWkEycpNUmnbVcvHm4eU4ggPQc6Vkj0=;
	b=PvnM+3mGB2Me85J+qLdbfxS9ZG1/ZbBj+kz/qX5wHAI96xJaFv1Fu7qogCbuJw6a7bbe9A
	pFxuE0uFhGVJoVrP/1vrIQyaZ0OO30uva5TMTYbk2w+uuNki7ObbQtCv3jnmkFaEy0pZBp
	09iYBN4Mw2kyxjen+bb6Hcxq4CRupzAegEsBXATQUJwoVL5HKzgPgNNjC5wl88aytNpynn
	U4KJjrIOOYZgfQohhvtEqPe7+PydDrSIewOT4Ms6pKKstmvxClDjI3ya5/sGLLkRj5GToL
	vqiH1o/d7D84vy/N7dGWFjo9ZTVROtAqd7NoWl6I7Tt+Xbo/nwN6WmGlR0Jn5w==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:21 +0200
Subject: [PATCH v3 02/10] media: synopsys: hdmirx: add media device
 infrastructure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-2-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=1917;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=9Rhmf98k2OXk977wJjDampBXsUhGoJfKUvFgIhc3HCI=;
 b=xHyZ6YgwlTsI3JQPoiTzzCsda2WThFupeb/xZ/UJgJPTXXx0ts71vqY3GSOPfKjlBj3e5r/ml
 vH0aOV2cr6AAYZBH2om8wfWBeYf/HX193EWLyrVqaTUQxdswq6iUcCl
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
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index bc541431638e7..8b04c84be75ec 100644
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
@@ -2649,6 +2651,7 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
 		container_of(v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
 
 	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+	media_device_cleanup(&hdmirx_dev->mdev);
 	kfree(hdmirx_dev);
 }
 
@@ -2751,6 +2754,11 @@ static int hdmirx_probe(struct platform_device *pdev)
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

