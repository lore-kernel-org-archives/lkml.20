Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B246247F3BD;
	Thu, 24 Sep 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251573; cv=pass; b=gmpyEpqSgW0rHSPRAqNaPAhxpXDBe035Fr51BPN5IVYzdexHHYT+7mBfD4LD2VIDFK42yfafVtA2mjt9N//zl/Sbqj3113XjONqlcta3dUqeOwbO5qLr4fqDiF78ZqVCtQatG+/pDiG+ICXFzL/0ZaVQZ7KHO4tOpoxNDHoOhAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251573; c=relaxed/simple;
	bh=5n6MC8OCutxNNqzW0IJ1YtGCXB2tAZC79xrRknihPBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfFgZY/arSNHzM8RomXBwajO2HNnmrNex8ceHxjuLgduJp2QblyWgtiATyFmBF0JI3DFTWLFtM8A3K+zLMXoY3guQHNeFHf1jFQ/lc9GauMfu+9eEyjXJj9LFDOcZl4AREJ44bfYCygbe+b3k0eZS+rUwJ+YvMKHoOsql1wHwmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=C5QmBehn; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="C5QmBehn"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5D002202148;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2IJ1FOgva1rI7Yw1jUWrpI2Sl1miEz2GupOamZThWs=;
	b=C5QmBehneQ9t8miIBtfHFq9l2PyzvXq8X0tvgd9woJMS+XX685ET8SgYQwvUzuMpp3m4Vx
	simnHXUPEd9skUTO1u5iIiz//BZjmd7lboHoZ535FM12EawXS4uRs681HOmOUydY4qzSFS
	En4qoWrHX4A6g28KouSPLejytE4tGXB9MIR1JTqoDHcX/lWN+nSo/EzANh3SpW0/wdOVO7
	5T8y3pTf0nK5IAZZQ12B6fpzqHunQwSaue437ScN4cTvTvpL/xjyCNg5Mm8Ha861Ac9H0p
	XOj649zfb/mjldy0tLLLk4huntPOQCoQWKEVKEmT9kPuZ0U60r70EmzmCftDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2IJ1FOgva1rI7Yw1jUWrpI2Sl1miEz2GupOamZThWs=;
	b=caxzu/W2a9eZ1qhCMohtH27eWO99xtEFvSjYka6daNSfdd7C5UITuIlmoCeQbXn4iX07Ha
	GmFLf3liqdE3hTsSKzSbiEUb7sxW1qAkc6fVpnGJnmLQu6YycTyu/giSfXoVkMSbW956ez
	SGkCrVWIm2i9QolCpAEAMbXMTp7DvSQDbNJByA/MuXnb5sA11KOcCiGi5lDo/keQevnHgQ
	AJUfbWNZlViD5+uhQBe2QSNXvEt/i7NNaygZiiCtCof2Lp1Zo0USYiiGBuhvxqZE3Tw8zx
	Va01/oOqhFuSeSvqmdXXe1ykrf6zbTqpdnPnw5GHSmxQhnmsD8nAq54kbDxSSQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=Tnr+ivCFRbr5qt3cA18bb03Z2M5hMjzq/5e6PydxC5K+f/hzVsQlbppfnFdWXI4KImC6jw
	eE95omQ80tr1j8ZcKQ7l9+Nivbl4GlleyCKBDKt5+BbjluAX0bg27zWLgmpBl37HQeEGJi
	v/KnRmbJWmEeZFRH2ZN5+39aD8OKoqUosp4Kp3CmjbknNl3eLrLKgUi5j/V6xkvGQbK3Xv
	OCxhqQ6g/zReWJJadlkGjSsTcHap7IDCjloO2BbkprmMWlWvTtMEFxkeNbdvK8lZaBtmQ+
	46Mn0ilCHOREmSja2wtc9Nwvpz7WHPdIv2WU/w7qXx9Cggjtnj+qRPKVvV38Kw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:06:00 +0200
Subject: [PATCH v2 6/9] media: synopsys: hdmirx: skip the 5V detect
 interrupt without a GPIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-6-c12f641d8b0f@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=3146;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=3NO0zESYj/3ElTwx0ZVhOFTkcHedyRyzVM26Lv3Soks=;
 b=a6QlpgCxbOiX8edP/2OZPqQD2MyYJK2Mt2SMSTYxkycHvc/W79qQrC+Z+dTpOFuzX8u/Wscgy
 hW3vy4b9IDBCZkhMArnphW2Zme9EK8DRHSlNce8AJbQ7XvLcOO2vMUV
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

The hpd GPIO is fetched with devm_gpiod_get_optional(), so a board that
does not wire 5V detect to the receiver leaves detect_5v_gpio NULL.
hdmirx_setup_irq() then calls gpiod_to_irq() on it anyway, which returns
-EINVAL for a NULL descriptor, and probe fails. The GPIO is only
optional as far as the fetch goes.

Set the interrupt up only when the GPIO is there. det_irq then keeps the
zero devm_kzalloc() gave it, so hdmirx_enable_irq() and
hdmirx_disable_irq() skip it as well.

Nothing else has to change for such a board to probe: 5V is then never
reported as present, which is what gpiod_get_value_cansleep() on a NULL
descriptor already returns. Getting the state from somewhere else is a
separate matter.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 34 ++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 9af1e71afb4e5..4b94e35c912c1 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2525,7 +2525,8 @@ static void hdmirx_disable_irq(struct device *dev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
-	disable_irq(hdmirx_dev->det_irq);
+	if (hdmirx_dev->det_irq > 0)
+		disable_irq(hdmirx_dev->det_irq);
 	disable_irq(hdmirx_dev->dma_irq);
 	disable_irq(hdmirx_dev->hdmi_irq);
 
@@ -2539,7 +2540,8 @@ static void hdmirx_enable_irq(struct device *dev)
 
 	enable_irq(hdmirx_dev->hdmi_irq);
 	enable_irq(hdmirx_dev->dma_irq);
-	enable_irq(hdmirx_dev->det_irq);
+	if (hdmirx_dev->det_irq > 0)
+		enable_irq(hdmirx_dev->det_irq);
 
 	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
@@ -2623,21 +2625,23 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
 		return ret;
 	}
 
-	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
-	if (irq < 0) {
-		dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
-		return irq;
-	}
+	if (hdmirx_dev->detect_5v_gpio) {
+		irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
+		if (irq < 0) {
+			dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
+			return irq;
+		}
 
-	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 
-	hdmirx_dev->det_irq = irq;
-	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
-			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
-			       "rk_hdmirx-5v", hdmirx_dev);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
-		return ret;
+		hdmirx_dev->det_irq = irq;
+		ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
+				       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
+				       "rk_hdmirx-5v", hdmirx_dev);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

