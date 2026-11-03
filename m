Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717493;
	b=iLRGItkT/dVEP7yf/v4W023bDTVquI+2bX1DrwiPUuDehBpgR3RHn+Xl5G6z8ydfzCNe
	 7HXs0EUNc3nuRbcmaenHy59vLiIfKl5XcJJyGvKTRN3PlH+Xid4Ow7y3wps7vS0F6Lu/s
	 cRlrzt/p/z817YiWjy1AfxIZCDMrH92be1vpRIHJyvsfk08AuRxO8q12ow7Vb15jMc91B
	 mvJ7eGQfmv5bHRIjxV7F+56wsNLov0tCkrEE6jA70gtry3wyqKC+r8xSsy7AKfzSkiVtf
	 7RZBn+fwNH6yF04lrHBVY29IccFqq7+FRufVt8leLvaNQVSI4bNhF6HxGhxhnbHOQ4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=x+rKpDcUVvGPJr3bkDQyTK7gGqYh9JNlycfqo4e6K1c=;
	b=I7iNZXu/F8SHN4Ja8jBaIcfY2c391HPe2+sYFphxr4gBFoaOrzh38IyrcwjZWLBpgVBX
	 FThVSTOoNxWjwIRvVr/1Y2zh1OsKNhwwtoAycbrJeD534TQ2yfBzLTz/GPFH2D7q2i/yh
	 FAfQ4pCPmLTmi6QHP8ifqHITt0mFY+DkDV9rLKxDJIrPM3RJ74XREmkhMaURMz+hVOSIt
	 WoVJGE4/ZuWHaUf3arnKoPoRmRcMqibsCJ2EbfX+G40HbY91CrIeA7aD1SXVWUVTb5UX4
	 bWUYcB0WlcaBhCbM2a4hjL51wDW2TNGBOBAf1TiAIWUrJzziQhD3RZvZoyUcVTJjEiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Id1lym5F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C7606EE8E;
	Tue,  3 Nov 2026 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4C7606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Id1lym5F
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F14CA202BA6;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+rKpDcUVvGPJr3bkDQyTK7gGqYh9JNlycfqo4e6K1c=;
	b=Id1lym5Fz7t+eMxpTMaZN+7TiHwPNmmcA6qeEbzBAkMVEeaHVZ3JpImn/a2ROI/47mmpvp
	/msZzxLCs6ndeABFb7Xrt7zQKHs/9I9hZRSaAJTsLZZFpwLmLRpSWd31Em8ES+xAgnH3I4
	Kczi2G3bBc6FZ0vBlVjFnm1/dqe7Am0PtW+ylRIPRsH1KjgitOuyoSwQuaPcor7B/ZDq13
	3oELqH3TzEbUPtEfkDLcEWCLqmWtmL+uKnxNJI9UqzqkluSZ7WcmZIyecl/kccWjy+2Vqs
	AbXxhx34cRD6fAkoS/wkynfubyvInx4VIMiddsE8aewOHKArK7Tkwh7qJqHrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+rKpDcUVvGPJr3bkDQyTK7gGqYh9JNlycfqo4e6K1c=;
	b=Az8RUpguMPpLhsGgRfw7RuOBgom3SCeAvy3SX6ktwYbDNVQCG+OHvE0/stwIdy0e5cSa80
	cggOlzAS01OZx5wBdOUScAFVIv98t9Z4lEINBBxuWhnA4+LpdinmgYcn2SO74z9OqtB2BE
	KSS9XWCcBkF618vDrRA7/wAy0Z26DX5kkXLdCIIGk/uDq+o1fGurtjl4E76jNBZ/B/g9cp
	gF8vXd7TiDKPvxW29DIZdx622XUumdr9N64BwozYgWSWcpUYARdeOYzwX7w7hf9GUnpMCq
	9+Vp4BBHE4vps5R3BbwALup6GMUPZBXgFukcHKRMNlqPxjF42+/5ktloEjeiXg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=Yj9e63n9Y+J42c/b32g509Z5AT2fUfSGYlMuTCi/FhHQf2d1AokcLvKFTAT62Jpg5NolWE
	k+pa/JoLiCRk+M/KNqvztHOgSKk3JKaI2+vfRYeACQ6txXYJyqTeJnKvlBQkmKCn+UYi/+
	jYNI/xxZMludtFA6y6Qh6BzV2R5rmdQ2FqMMVseibDD9n6SRskdWXOucFxVKD37QBEq9Pg
	wuUFN6fcm79j2s2pSsSoogznKozh30Ed0LI/5ecSCX8/7SRAlhZmrxiGWbOPMftvm/YJBd
	5CNSYOHcYy3j3O8frpHwmmWznaqArR3dqUaAoxKMOJlQFjkvMQaKrFitXGSTBg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2p;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:26 +0100
Subject: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in
 rzv2h_usbphy_reset_status
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
Message-Id: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index d96042e28cd5..e644092cc2f7 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -68,11 +68,9 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	u32 reg;
 
-	regmap_read(priv->regmap, priv->data->reset_reg, &reg);
-
-	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
+	return regmap_test_bits(priv->regmap, priv->data->reset_reg,
+				priv->data->reset_status_bits);
 }
 
 static const struct reset_control_ops rzv2h_usbphy_reset_ops = {

-- 
2.47.3

