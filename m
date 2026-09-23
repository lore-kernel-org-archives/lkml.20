Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D539891F;
	Wed, 23 Sep 2026 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171129; cv=pass; b=CR8IEgmuAEgz6BE0Yd6UqiCWSKGuyJzc4wdbCnbJCN1BlBO2TnNGkO6z5AszFum0vYPFKOmDCH4TmEx7w7nOydktvv/DMEGE5OdTiGsF+zw7UmX5Nrd9wWBlWUXgoZ725AjzIRmy5U9DOJdqmqXNJY3iRn2i8Q1OdZpTIe4tkFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171129; c=relaxed/simple;
	bh=0NXDT/PVThS1RfhVU8RQ1/XF/TYPByJaVhZBJCoVd94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLNSlI3uweIHP776Qj6o1e4e/NZIuqCJbTTevLFhlBQzdZqNhsK9JvOJA4YWRYCd7IDuXmGKuR8ihYBjjwzmXZzHuIV1b69/WDvZ+8EtwaInN1aIW7wrM2OyEAKRPrmtkOcOi+uviKL0477mh1gyDA+ScfQDNDzrJ2/B6Ze4kpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Lpjcj5+y; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Lpjcj5+y"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 06D9E201A8D;
	Wed, 23 Sep 2026 15:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fkrae6X1EJJUdBjAuftMl+vPu91AOGhn0TgUhRhTHoE=;
	b=Lpjcj5+ycewpw6vbOqBqDdcHvQdxgJ+QEBMtMuBUumgj3zet/kSlXz/VIycXv/8dtv2bTW
	KCR3iXqy2/b/aTjEGPOwbFmQNX3A1KrD7ufpAw0kwuHYFBQnAfpe0HqSBPP1LQivRgV/Bv
	d2jRkUHsvnOOjjwS2d69fqs6UgiT+qar2wB0W5AAtoexV9niUOUjQfucT1GgvWg4KrIrCa
	HOvWZt9cj9//8Qd+VyEWg2dluGOOKcx/cMnFde+4o02NK4t3mWeYUMGQLXkTo2R6W48t3I
	Px7IJwfoe+3sEDZM00+HCP6/cU8RtJWoqGWYQkhDJkkUGzzl6T1jbqa5/a4fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fkrae6X1EJJUdBjAuftMl+vPu91AOGhn0TgUhRhTHoE=;
	b=WEoRe/X+D+DPE5rKUnpiMpfdiGA2RjdB5vSs+1fNfknrv4M+s+bMKSa51jkVytZI/pOO0Y
	+JLoN8zs1XNr68gwsEpSa5MPzAlh0/fn+tmBY9qH293KR2SJJfJtR1zwDSpcZJkn+yKX6S
	0NP6Bu+OFGHwDrWNQK2/UvyufYIgFTvBrHdIa4ZQN3cEWKrA8Ynblei4gsLO4YJaPX5xiS
	+rYojQclSKTTk0QG6xLIAnhGm3y/IqNAosF85blCU6LHF6CYGg7ThP/drwpkQkoTgiRDiN
	ceE7Ljy6/u7Kzzhw9zwSs0ur7L+PAaq/eqrRpmZTIA+jUR7ImqdtHaViYcG+/w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171121; a=rsa-sha256;
	cv=none;
	b=aCjs3ZvZF9ziIVRKlMd3I5yPUBcXXBCKDvCvUhUyp4syOK7jO6KuF0LyAqxqzFMbyIX4xw
	wi8uGUX1tTIC/vHe2CV+jUhfXPamPHKXsse20LmPmcA1seOZvIxn84PmSECyqO6lxTAwCv
	aOqAKmieHYzW04gByfjUmklXOv8YqnmxLqF0WGRlyzqurCuMu+aWfwGWSosl7CPRhXILx6
	ry0WqVNt5Ja/imYtHW1KU58+R6dip5F2SkQs4yyQFJ3x+f/kfRcfYjn4jn+qBNYPjavLGw
	/zVLgDqQhpsfIqAfYQOUa/XMRdLqDutBaiOThXuPJNEQeHJr6rIs7RnGIaHNUg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:46 +0200
Subject: [PATCH 7/9] media: synopsys: hdmirx: skip the 5V detect interrupt
 without a GPIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-7-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=3146;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=Ejsm2jAZdcyeIkAuOWtEAswQewgyA5wFh0wTnHPHsrI=;
 b=2KU8CgO46kMXRebT0ui03bBM3jICUHc+rQOR7ZSCG0osLA/Mz4Duni3EyxPszdYb3BHtqQpG5
 k3D6i3oUD77Df2cYzi36DoPxaQKodRzyprpzQ+P/Vj6hy4/BwSN10VP
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
index 8c6b04425c8a9..23b4dd853be57 100644
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

