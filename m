Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867848C408;
	Mon,  5 Oct 2026 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206925; cv=pass; b=SQJXhaAhIgm9DauZHaQA7xYj8+dwidv+A+/spHtMiSEgKv3mVD6qiv5IU9+D0nW6sUByXLg6EXH0alQlko2VmGZsCdbbcJ+ybhskMcj31QEyfavg+OMnz1vQLF58On6Eo8Rpq1IwgfrklenFFbmRSuZ2WSe3e9C4RgOZwAcXKMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206925; c=relaxed/simple;
	bh=QoItqWYB1tPwT8qC/b4UpvujQtUuQZlmHOFl58ac5+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpqEwXvDD+lHARtpFQYtQ/+kNiAJHh46t6O7Mw6Idla+BPErNMQ5AA2onedqghwUX3J7sq2F0EvYSgThSOC9dDwSct7fB548HDZz9FUrfm0cu7/i6xe5tc43+XTmdctZLGLMTY7f8pM70Vpeiz+mmEDdJHoE7qlPcp3Ae1AWy8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=ap25M7OI; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="ap25M7OI"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C6C1720235B;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/8bqlHYqc90Vlexdz/vheutiT4y8bmGDEG090hrK/w=;
	b=ap25M7OIxfccQgRNc2CK758u7ToHVWzXHjArXRlDOGBF6u79QtBqJV62dnbxE85A1JDU08
	NvpSB61NNLs7QKqXpxiAtMutKw9TkSmz5H394sMO9tMCty0Q/kn5DzEygR/fG3xfA7VIRy
	XqpVGqSIUvdS1agoR/oP85kLy0MAHaPz+yR0vZZfGVjR9Wl+/+pT5gMS0bCAB/RzrvHoCs
	jtQbBNG20twwPcglmeRBbcC6iYLUK+RcP+PW1M5+kQM5+FeY4qIHuuRZm1NxgwReVO+fXG
	9jfrC2HwkQJjuIFlKpoQEIIU+uog7/GEXGph6uipgGFm1wgJML1gkPr1+IKSfA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206902; a=rsa-sha256;
	cv=none;
	b=dVFC4GfV49qqMJb8g5wow9jDy1X0yfcxWGR4zDATXXY0cQMi5W9a6greE2kkia6EibMySw
	VrpmXsc6ZdEIhQeZy60R18FM1EFjYLWzDLYgTRkMxcljZXcvaxPa/8wmWFW+CtxldN18OI
	pnAocGecfUqYIiLtKQXopwdx57O8DeCZJ7uYvkd1DWGEvcqZxaAszPW/doJLlSA8KAa7t0
	vdp807scTz488TsXND6WjsgzrF8APh+Ap2IhD36Ve4W5rM1WJoPL9A5mhDO7RiElHm/jQD
	b0Y/8Qmm1JxaeQ+RyN28NmxxsZtor6F9n44eJ3JYndCcqvm7U0WiUi5KceTo9A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/8bqlHYqc90Vlexdz/vheutiT4y8bmGDEG090hrK/w=;
	b=Qfq5kkGRmw3pIT74dWZax7N3aboiMy/lCp5Ppi0eJ/gBPJFLUO+8anbelyVy1h+NIPSiuL
	ZfyEu2dt/eoYRfniwrepTA/3dkkVyo8JO0bt/9lncg7g3nP91HT/UNc6ShyNCWFTLQyCGW
	G/8ePKFVrPV18b7Tzh+S2HQT61nEH609vohTKmwWgiwZ82SUsGw4axdrnrPtjMQbEMNIWM
	qM0TSSAUbBYb8daYfXrt+/7aixATOejefY+i12sDkiSTNvOjCPudRaMfjr7kFIP9MbYMZw
	6TgXl+K7SXQftm5sNmWaaY+TB4VRga0dSPNp7nw10ovTzYMFg3fgmf0o2HK6fw==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:26 +0200
Subject: [PATCH v3 07/10] media: synopsys: hdmirx: skip the 5V detect
 interrupt without a GPIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-7-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=3129;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=Z4cdgkG7/1Ptol34iC+YqqMuGizzO3KgoOhfnNtvV+k=;
 b=MCT+xpUsFWhuhq/5fGkGakgS+uzD0iuD4QMI0MpvDs1RgyzGPTPGob3BuH0z3/5+lmLMTc0Ch
 aPfEYIkLr0YA2Z7yekbEAnTv+vDXI50T0cVSyDhquaiBcdBmFebK4JX
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

Assisted-by: LLM
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 34 ++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index a28eb86e0b83c..a937ee23e230c 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2521,7 +2521,8 @@ static void hdmirx_disable_irq(struct device *dev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
-	disable_irq(hdmirx_dev->det_irq);
+	if (hdmirx_dev->det_irq > 0)
+		disable_irq(hdmirx_dev->det_irq);
 	disable_irq(hdmirx_dev->dma_irq);
 	disable_irq(hdmirx_dev->hdmi_irq);
 
@@ -2535,7 +2536,8 @@ static void hdmirx_enable_irq(struct device *dev)
 
 	enable_irq(hdmirx_dev->hdmi_irq);
 	enable_irq(hdmirx_dev->dma_irq);
-	enable_irq(hdmirx_dev->det_irq);
+	if (hdmirx_dev->det_irq > 0)
+		enable_irq(hdmirx_dev->det_irq);
 
 	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
@@ -2619,21 +2621,23 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
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

