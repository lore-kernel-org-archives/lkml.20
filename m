Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044348EBC0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933552; cv=none; b=qIOwWFE5WcS7+kxqgsWm1g2b2fRpmJN/5+eB21FRC/AQTDxfMkfratwJG50KEkVDk9BKOhN/T0kKGvxtoj/GnrxdAseYWQudKqHWraenJiMxPqwsBjIyo4Vpk+kQkhKyRvVm37twc6BA94b2xJHgtm0Zayxre6SIK19Dx7m1YMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933552; c=relaxed/simple;
	bh=e9hk5Tsdquyr+5avHPEA7bcfLf2nOdnHsiLzbvu4On4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1AxpbyfLvLR6ZgetGOHZ8ptubasoZedaN2HhXWrqXHSWlu5JwxjRO8+u/+Nn8nkhdbuLSv+53TneMRfYC5Q+akvci1c1yZY12ge4OQf9mr4E2JrgqwCZX3/gZKV5ackw/JzWxg5i+yy7R6lrEpAaGMEh7N2GEns+4vY7f4DitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcKnG7Xp; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcKnG7Xp"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so2834494fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933550; x=1790538350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=bcKnG7Xp8QQRLPhF9GYfR1QMAIxkw3ofYeozH9zujO9ULcoQ24yZKfn2HuFF5YTSd9
         kP2MzqGquxqZCDR38JDRjeBDJLnTthWjjaEW1pYJieNjG66q7T9QiFU1iaT7/eA3jwH4
         ddS7M972oJ4enoIQlJUoHxFMWjJWy0ycpdApYqiBWG9KE2PBoYtmZJcsQc5gOZ7U6LAG
         Go0+Pm6nYecfOQeyiDb6wH5efFeTuis/h4M9B30EGCiOYAgimXHNyS5PAdZT0m7C1EhI
         MJoR4wtUmeYl/vddJEd/eE/9ysm2oo80pj+Ire3OCGYsBhOhgvKw269Y2X0ACPWIQYff
         yagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933550; x=1790538350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=XyVAOq/Kt2NQwEmZtsRGUIafBgoZJjgOq9NV2ARqMCtbyxajvANa894gmkuOBfCYXz
         p2spH3SyKHkdbvROmlu1entXevSjRe/mQCiztHFYGiGFx7OImqUX4arfKZi9Y6ISs4Sh
         kAfizFtw2rjqMAoNEODFsBInj8grcu/gcAlin8RguwTZIfgEXNz0hm++P4msD4Ei6/qN
         m/ZVcSygZA4BJ5u4tQVsC96rAH6YenAS+/8CYJ1gqaUymsUijX4sjMaPCOz0dO+anvJg
         1HSNoy/chm7JGcrsWbbRww7n9QS2y76ZswGDXZi1ZWYdekDsoKw8r1xmCCbS5WaEJINW
         OgDA==
X-Forwarded-Encrypted: i=1; AKwUvBwF+JaVab3kGmRFbaL5ZR6+gocrfviovUiEKC90ViYh/hYEGWeAHOe9OWqKjfABcpRJPpzE6Wo8bMQU3xk=@vger.kernel.org
X-Gm-Message-State: AFuF++lsZrcyw3P4rnSVq78Syhv5aOTyb7/xTL27yeR8BDVk85HDCpdz
	K1VJ4lpF32kcJILn5MENUWAvrE7iMRF+4c7K+1DsyT6d5TvuGd5vP8sI
X-Gm-Gg: AYBFou0X0Ga6eq7u+bglpUTwyoLM/HJwUnwo0QourezxjXUnuJ/78JEnmTF+YINHqU2
	fuOyio8Q4hphGIlJ24WmtWTixuJ2HJ7vxOMNUktEZ9+UYYrpkAeGs8v9nZuN6tIOefPzX5nyEDJ
	qd46KWWuq/gT2r/72ki+HSZ11TA2w9gWz6bEMiYOzi2BVsUgo8PBfVjLm0otRdDnC4iM9h1u4yd
	mMO6izIFk1QMpoHbanWv5hqQWmK/L75I90qD5aQ8j3QSHJfJZMQ1tqFvmJukmsVKpHqkiWgyor+
	ytL9245P/oEWs/CWWNI++wQAP8ZBWQS15mJ/wRK/qVxiaUbnwzzYuP/EXHy32jKLbC3XoA+zuXZ
	6tVlrUL+ifY6G7SE2SHwa13c5zb5+lKXdtsLmAxm+lK2/vKf/sQfm0755yId2wRQBNp9kn3euFT
	QlBpLacSjWWxdiIutxGaptNq2KWfqYFX/RPVo52Mbyt9YJInFcYSd5GmKbd/KXnPZEYSgzG34rQ
	rQtYgQZ7y4LcULYdBshx8JoSkEIrPHfdbPT8+EpqwVV0XmW53cFsi+hgGT9UfolEEFkJq5MvEpm
	NwpKP0OY7Burkiw0kVv/nDsCK0tKnRvzf9cPmFgcZtGWiGwMNudNGbZ438/48UGcSMjZSWEQ4P3
	jEWt48v5is/bv8Dez5X7N
X-Received: by 2002:a05:6820:16a6:b0:6bd:af9e:a7f8 with SMTP id 006d021491bc7-6ca9a130336mr7595370eaf.10.1789933550220;
        Sun, 20 Sep 2026 12:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:32 -0600
Subject: [PATCH net-next v4 6/6] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-6-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 9598c386bb21..0ea1860cf203 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1277,6 +1291,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

