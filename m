Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243063;
	b=AkTNpdofo7zzwiFAruhWHvDRDyqR1r1P3rOxWz+mpomSKiV7OB5qcW/krEhylSf6SgFt
	 yxmuWNGFcCrQ+CgzwG5o0imSkaLsnCv/bEC2GonCWUdaB1Ziv3Pih2LO3YvVLn7Bqoi2R
	 KDrf2pOOT+nqIUiJCKTgbvqtBwaSCYTwRXKmkF51DNa1VZf8/sKPWnaYHrx3mbSyOxuFE
	 E1d1WIt6mk1+Cdt3UZTITv3/g3BPyaD/V67LSMeL7X/wFGKC/evt16GbYufWaFa8CL76o
	 vZArIjmaX5ubvsqTRUsx5AquqXeKToTamgb+1zPPUQM46WLXPzzS2o4Z1QlyyMNTJwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KWdwoMQXiTShR7rGuGU+FCAUlgJV+S6GbsCQM41btuc=;
	b=3b16tDzdgobGE5pX8msB98JQqw6YxG1wVdtVHCf7vCg/1ep1Di5kQ6iHK2NglqU3dqea
	 POm62/ZgUo0o+qJ5IA/dkLsSA/vxSihKaEqv75YShLNMHlHMhaoU548eexYepARfmLpk7
	 lYgACdVw+8Q02afTE0UYFY8thhaVtiVjTLCCqmPFOn4PZiSdIPs3Sx0kAqUQEqa3B+3+h
	 ZylZahvZqwALUesVGHQ2Ctz14gNI1Vk1IFjkrbb5KWtugoMh5f776UwkuyN0JhVpESzut
	 lP9d+3aHYQWr7ETdMUnlPOd+DSCI2Tzdc2i741Cq0crKwqAiyiX4g5vsdpfeNW5/NEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eSUzICYL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8420606EE94;
	Mon,  9 Nov 2026 16:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8420606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eSUzICYL
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 74B0A202929;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWdwoMQXiTShR7rGuGU+FCAUlgJV+S6GbsCQM41btuc=;
	b=eSUzICYL5Pjk5juWywMwcLKqW/avcVWTQSGTuZ6byUyEY7lv6LcI+XvH5HriOPkAbNA7LH
	48IXJYxXNuuXi+5IQQQVzJ4JgXl+gtMl2RQb/a2D1jlN4IWHYTw2i8eTCHfeuTLlyo/dTR
	jxDUgg8I3/u8rxxS9bZ9bSEIZ+H5SzeX0GZbHUbyFlkdHMdPgDwpKKwPPMoDP1KvNjXkiP
	50ZzFzkCuqLQDAbeIkT9hLPlXxTr3wq/T2VsKPk2JC926Xifr/1YItvXHXFdgvpt3csDk0
	T865t82RVb36gp1cl4tHuCTmHClKkq+yvP6uXiwrfDF++Xn7lKWCtttwtvz9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWdwoMQXiTShR7rGuGU+FCAUlgJV+S6GbsCQM41btuc=;
	b=A4Ide3cnG/8S+uWkzS/DuvatL8yERG8LOJCBFypT+psvy5UFAldNjxBz2VlAzCQb2nfAJD
	y3LVhE8LxgxzbkZmo0zj++dwRC2siymLsQlAc7GoNbva9o0izxYL1PUcYcsKwvEhrF2KIJ
	swmmbLu7prAuNsMOuXVXFSz1I44VpL1WhqwFvT+BCdCDAcmnOVvVoJjKEDUBg8tCBZoSlb
	wEJ4f+QNowlRWOvyM91F3Uoap0PL4Id7ZeXhk6xzbyB8NO8+gw2wZgUP8rUZR8xU6icKnp
	THXrthwD1c7MMp1itZc1w4G3MDMgqotCGPU1qbqdDGYz+LhlOXel2w7sWemAFA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=cHobY6+Natq80bFXoWs2lwFO/M67RyxEYB91mL4LqjP2LiY+ayfVXvOUnYPGX0br2buHZH
	jXl/gQxv7kvRA2EWfR7TChYd81m8jEon+LBVN5GErEsLwkNToiUaf3D8YOjFJ0OY8ANWXk
	FRQ9vVcLuuX/K/fs5j6621sBCRygdNCtBTHPhWWyWbur0EBbL/cbRYvb31d1bDIwr0pmuL
	Z+sLUSjMK8I7eEpr1PSTkU5AWM2BOrsqVXUoDzjD7FjKpYLgeNfxYSKs5cabIcmxJK8b5O
	Fek0A7Nm5EE4LkZ+8TNn/Qa5EWJxUwUPZ3tZTXyS8uLgf8vQevPORtFbdplhaA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-1F;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:48 +0100
Subject: [PATCH v2 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in
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
Message-Id: <20261109-reset-regmap-test-bits-v2-6-c886689bb85e@pengutronix.de>
References: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
In-Reply-To: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.15.2

Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
Now propagates errors.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

