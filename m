Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842382;
	b=n01UojbkYjdAPiGYyRvrETyvOGC+oLRzS/9l0qssosGStA/wEwtMpRn6xMIYOq7p3VKF
	 pjrV2EsXL9hKumYcMtd5ZTfNlJmAzWCMz/ezpHQU2EVjw3pMdA9i3ChgTppfFVWvRfVeF
	 PRnp0KD+iaZELH9E1W+It9iLlEA1hDxRAmHdN28INzLLZbHhnWl5nE3Sgei7SQnKNMjEP
	 4PFaEYuHGb+/jcBB9QOQhB571yzcAym7P4uImPLCqExNQAeR0fSqzCvNuzUpJpNi2HpIa
	 qV5/1mpD0bShXFjH40/25jWwZShpnqqpLNHmNQGiX6NIAflK2F/FGHrk80ZFYwIRt2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842382;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7uzxFwgxb2I3D6IR3EdYu9pSe85PlOPOZbgm+JNC1F4=;
	b=dLg4nTstRq5Km7OtM1tDdOI5NUwGdC6qygGNDeVNwLNm1hDFequwD4ICum5Untl2Qamk
	 GOfOqPFs9ZM6ezeo0RkxyPAowwW7poJoSxNzHmP1oSsAFsBZOFuEuFxYo+9tGKBbdiPH9
	 +L83GasUdd/NdbzMDZ8ev9FL6zP3JRaGvleLe2xLucSRox15iBjdT6swMxC5ttvGqAqeW
	 KwHnfbYPM1jxsljay/esQKgbwyOctFyY/fASXJew31qvkHxnFef2tdHdV8OYEf9K+AtSZ
	 Jd7MIhdZrXKWY6uSKNDdMOyLtZfJrJAjNktm9pJndSuC3penyQ9xX4nVnxfnmdl3odQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ru58nyXS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EFE606A31C;
	Mon, 16 Nov 2026 15:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ru58nyXS
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 719AF200668;
	Mon, 16 Nov 2026 16:19:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7uzxFwgxb2I3D6IR3EdYu9pSe85PlOPOZbgm+JNC1F4=;
	b=Ru58nyXSlJAkOZJPfT2ndYJdhmzuVXTmW8ycG6JbcFdugnwSVHO00XerFlk9MobqAcM8Rs
	q8c7nn6XB3hPs69DlYZ/xAp5RjKy4jSxEQtMjHV28t8RK9TD2EeXoo1Mk322riU9h5uQ61
	YVMrlEfweMCl0NzYLOPHsNOrUv4+pZfmBixBgDxRDHuBYaqbMX1sVdlZXz2kwUIJfWr7fj
	W+J+PEiX7VpMEXF1HTxgAuYZXfl6iPAIQXYoxsGwAJCgXg322tv1JItHSQxeZtmP6fBWU0
	Nq5G8e0nVNw/uJr3dC021nGwnmSlIHLzsHpSakHcswkJqZUGU0Ly6pGrl7/GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7uzxFwgxb2I3D6IR3EdYu9pSe85PlOPOZbgm+JNC1F4=;
	b=Cy+zAcQXoW3tpPlu+pheyLomP+YWD60J6ub+8DkH5bBh8IkxUS3oHKS+FLiiM+nAwANrcM
	+/0suP+xbZ16DaJ5VXJGPhC0U9Zas/1584cqbV+ANK5g9gV/8mtPHuWZLkGDHEVgcebqGf
	kqhW9n3LtESy8Nhu+fZdDtPi4GhKveDPjT6PkIqBoJZKKb720s1VyxAusr2mCndu0lnffu
	pJ5+4hWtyP7khvRJwoYblbgrpYuaMeS2fHuzzsfOhy4ajPamOpLemtwEjA6+Hz2w7tsaOB
	TimoE678WfswBo4SiTNviGEi4OvQ2snTH59cpRvTctPJ+nz3Wuvlw4/GmCc/TA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842375; a=rsa-sha256;
	cv=none;
	b=AKDtOQuSg3qV7rvMSkTJ7CNQUUyc2H+IxryL8LGtVJbnD1tttCNq7l90L9fIZc8Y5Oey/q
	wSUJaJgdzVQkIC05oaKfmWG9IsznYIrKqp+zbtkBV7vKsLfc+G5s/PNFgHwx27BqBLYMeD
	Fmp9lFDeOS0taoUuQk8y0aTusR/I5Qf4JXBc4oVmREEHqYIHgvhd9yGGMRuZOsI2Pxmbor
	sb56c+rF7OSDLhkRsqgl7z8rqbqs6TfG8ZIOK+1BhBeB5VRmEzhTEtMNdaR+3IgiDXqoPR
	3qzu2QvHY+LBfaxuCruv8gzjx9q+kJcqnbki5EdwBLWxfTpx6r2b0ekhJaWqnA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:06 +0100
Subject: [PATCH v4 6/9] media: synopsys: hdmirx: skip the 5V detect
 interrupt without a GPIO
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
Message-Id: <20261116-hdmirx-media-v4-6-7aee4a0a273e@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=3231;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=yv06QNi0dQOPgICdgz7vOcV5IFDw844bkb7EHWAFdYs=;
 b=EfTOOBCmOo8XX+EwKl6LaqayP49mE5szDj2pd0yrMQltmnQpSgFgxUWEnZ/KYGKb1c3Fuow3j
 nNbuHcGajxMCEgVLvyYhRJPd369GGPkTZIr+bzGHLuoXqXKiuQULbtB
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

The hpd GPIO is fetched with devm_gpiod_get_optional(), so a board that
does not wire 5V detect to the receiver leaves detect_5v_gpio NULL.
hdmirx_setup_irq() then calls gpiod_to_irq() on it anyway, which returns
-EINVAL for a NULL descriptor, and probe fails. The GPIO is only
optional as far as the fetch goes.

Set the interrupt up only when the GPIO is there. det_irq then keeps the
zero kzalloc() gave it, so hdmirx_enable_irq() and
hdmirx_disable_irq() skip it as well.

Nothing else has to change for such a board to probe: 5V is then never
reported as present, which is what gpiod_get_value_cansleep() on a NULL
descriptor already returns. Getting the state from somewhere else is a
separate matter.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 39 ++++++++++++----------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index d8a22700003b0..b81532f56f6bf 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2542,7 +2542,8 @@ static void hdmirx_disable_irq(struct device *dev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
-	disable_irq(hdmirx_dev->det_irq);
+	if (hdmirx_dev->det_irq > 0)
+		disable_irq(hdmirx_dev->det_irq);
 	disable_irq(hdmirx_dev->dma_irq);
 	disable_irq(hdmirx_dev->hdmi_irq);
 
@@ -2556,7 +2557,8 @@ static void hdmirx_enable_irq(struct device *dev)
 
 	enable_irq(hdmirx_dev->hdmi_irq);
 	enable_irq(hdmirx_dev->dma_irq);
-	enable_irq(hdmirx_dev->det_irq);
+	if (hdmirx_dev->det_irq > 0)
+		enable_irq(hdmirx_dev->det_irq);
 
 	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
@@ -2660,22 +2662,25 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
 	if (ret)
 		return ret;
 
-	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
-	if (irq < 0) {
-		dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
-		return irq;
-	}
-
-	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+	if (hdmirx_dev->detect_5v_gpio) {
+		irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
+		if (irq < 0) {
+			dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
+			return irq;
+		}
 
-	hdmirx_dev->det_irq = irq;
-	ret = devm_request_any_context_irq(dev, irq, hdmirx_5v_det_irq_handler,
-					   IRQF_TRIGGER_FALLING |
-					   IRQF_TRIGGER_RISING,
-					   "rk_hdmirx-5v", hdmirx_dev);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
-		return ret;
+		irq_set_status_flags(irq, IRQ_NOAUTOEN);
+
+		hdmirx_dev->det_irq = irq;
+		ret = devm_request_any_context_irq(dev, irq,
+						   hdmirx_5v_det_irq_handler,
+						   IRQF_TRIGGER_FALLING |
+						   IRQF_TRIGGER_RISING,
+						   "rk_hdmirx-5v", hdmirx_dev);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

