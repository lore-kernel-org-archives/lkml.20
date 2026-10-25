Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956142;
	b=xwodXiJGlPfjK4w+0HKI3sKn6WdnnA7aPC3GF2/OfMmFjpqV9xwa4Rs7kU+AfKfArRdj
	 q7QN+VrntbNBTXcM5M3qT7NjEZ9Q584/oqAISfYahPMXGDOLx5zExVybcHCJLwfIm4awG
	 3hjMNjqKFpeGdGFNjFuj3tVUoyWjIK6o00cHYeazypHnVUoy4a8qjB+ptm2JIWe3bQLoM
	 YL4tZ78tXZmfv0RdCBeXEcHVuTZ8gGLrU+JJtD8h96f6HqMjMmqLKeAjUTQjRrnFvWXjk
	 80ebDtFla90gtKugzD7LqhoYEKKaN3CV8mv/gW6vHct1HclPgaDYv9F9HLPbZNxj01w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956142;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=ZTVr2mIS4HSA2/kepG1g/wU2cXkBdxzWnNpIBuQNFP8=;
	b=Fo2sAGzHJclydGTaE4DghQyjcdZ2mCx928khupMd32NfoL7gYsmjVundooFZWRpQCTWK
	 w8Tdv3lgd1pbUbO7e70noYaxtszshTua6mLDvnxrbiVrGlwVqRemlJ6AAqWxMiQOs1h6K
	 NOl3FtNFIEfznkIypjmyCRZ6LdwjFmAsIaAw7KAtuvvRqPw1iEFC/iYHCGQ55QBRHF0gn
	 c00iTTel4KxpsYqQcQ4nuSPmBSkBsFFqNeOiZuHh3rGxtSJybL/sIZ5+vh3cBumNj49zr
	 Va5+u5Bz85xY1/Lr0AweRV/70ytmWesZ82Dq1z1agafSoMyltzCgDPiQ37GG7oskBKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=VPiao86v;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133AB60A2622;
	Sun, 25 Oct 2026 19:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133AB60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=VPiao86v
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W7516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W7516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956131;
	bh=ZTVr2mIS4HSA2/kepG1g/wU2cXkBdxzWnNpIBuQNFP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VPiao86vCFjxt56jbGEgsEgwU3Tvbi8seYJUJaQPDMk+NiGlEDzCzcjj6s5k2OczA
	 rqOdUWZkX7E8TRJKfbony3FKmNIzdA1FBkxf3mhUhbDgddAP2IHffcL8KlefaKQ+Nb
	 foflPTMVX+y86hQI7Lhss4h9xK1mT9W8Dj82R92U=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] phy: amlogic: meson-g12a-usb2: add S4 support
Date: Sun, 25 Oct 2026 20:22:02 +0100
Message-ID: <20261025192202.209045-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The S4 USB2 PHY follows the A1 programming (MPLL DCO clock select, R21
calibration, R13 analog settings) with a few differences taken from the
vendor driver:

 - edge drive trim 2 instead of 3,
 - HS disconnect reference 3 instead of 1,
 - a disconnect threshold in R14, and the R13 PMA signal update bit
   set to latch the analog settings.

Without the PMA update the host controller sees no root ports and
nothing enumerates.

Tested on an S905W2 board: devices enumerate and work behind a hub on
the host ports.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 65 +++++++++++++++++------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 66bf0b7ef8ed..18d40f7e48fb 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -72,6 +72,7 @@
 	#define PHY_CTRL_R14_I_C2L_ASSERT_SINGLE_EN_ZERO	BIT(6)
 	#define PHY_CTRL_R14_BYPASS_CTRL_7_0			GENMASK(15, 8)
 	#define PHY_CTRL_R14_BYPASS_CTRL_15_8			GENMASK(23, 16)
+	#define PHY_CTRL_R14_DISCONNECT_THRESHOLD_S4		GENMASK(27, 26)
 
 #define PHY_CTRL_R15						0x3c
 #define PHY_CTRL_R16						0x40
@@ -149,6 +150,7 @@
 enum meson_soc_id {
 	MESON_SOC_G12A  = 0,
 	MESON_SOC_A1,
+	MESON_SOC_S4,
 };
 
 struct phy_meson_g12a_usb2_priv {
@@ -217,7 +219,12 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
 		PHY_CTRL_R18_MPLL_ACG_RANGE;
 
-	if (priv->soc_id == MESON_SOC_A1)
+	/*
+	 * The S4 shares the A1's MPLL programming: its stock "pll-setting-3"
+	 * (0xac5f69e5) is the G12A R18 value with MPLL_DCO_CLK_SEL (bit 13)
+	 * set, which is exactly what the A1 path adds here.
+	 */
+	if (priv->soc_id == MESON_SOC_A1 || priv->soc_id == MESON_SOC_S4)
 		value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
 
 	regmap_write(priv->regmap, PHY_CTRL_R18, value);
@@ -234,15 +241,19 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		     PHY_CTRL_R16_MPLL_EN);
 
 	/* PHY Tuning */
-	regmap_write(priv->regmap, PHY_CTRL_R20,
-		     FIELD_PREP(PHY_CTRL_R20_USB2_OTG_VBUS_TRIM_2_0, 4) |
-		     PHY_CTRL_R20_USB2_OTG_VBUSDET_EN |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_DMON_SEL_3_0, 15) |
-		     PHY_CTRL_R20_USB2_EDGE_DRV_EN |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_EDGE_DRV_TRIM_1_0, 3) |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_ADJ_4_0, 0) |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
+	value = FIELD_PREP(PHY_CTRL_R20_USB2_OTG_VBUS_TRIM_2_0, 4) |
+		PHY_CTRL_R20_USB2_OTG_VBUSDET_EN |
+		FIELD_PREP(PHY_CTRL_R20_USB2_DMON_SEL_3_0, 15) |
+		PHY_CTRL_R20_USB2_EDGE_DRV_EN |
+		FIELD_PREP(PHY_CTRL_R20_USB2_BGR_ADJ_4_0, 0) |
+		FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
+		FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0);
+	/* S4 uses edge-drive trim 2; other SoCs use 3 */
+	if (priv->soc_id == MESON_SOC_S4)
+		value |= FIELD_PREP(PHY_CTRL_R20_USB2_EDGE_DRV_TRIM_1_0, 2);
+	else
+		value |= FIELD_PREP(PHY_CTRL_R20_USB2_EDGE_DRV_TRIM_1_0, 3);
+	regmap_write(priv->regmap, PHY_CTRL_R20, value);
 
 	if (priv->soc_id == MESON_SOC_G12A)
 		regmap_write(priv->regmap, PHY_CTRL_R4,
@@ -252,22 +263,38 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
 			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
 			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
-	else if (priv->soc_id == MESON_SOC_A1) {
+	else if (priv->soc_id == MESON_SOC_A1 ||
+		 priv->soc_id == MESON_SOC_S4) {
 		regmap_write(priv->regmap, PHY_CTRL_R21,
 			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
 			     PHY_CTRL_R21_USB2_TX_STRG_PD |
 			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
 
 		/* Analog Settings */
-		regmap_write(priv->regmap, PHY_CTRL_R13,
-			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
+		value = FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7);
+		if (priv->soc_id == MESON_SOC_S4) {
+			/*
+			 * S4: set the disconnect threshold and latch the PMA
+			 * signals so the host controller detects its root ports.
+			 */
+			regmap_update_bits(priv->regmap, PHY_CTRL_R14,
+					   PHY_CTRL_R14_DISCONNECT_THRESHOLD_S4,
+					   FIELD_PREP(PHY_CTRL_R14_DISCONNECT_THRESHOLD_S4,
+						      2));
+			value |= PHY_CTRL_R13_UPDATE_PMA_SIGNALS;
+		}
+		regmap_write(priv->regmap, PHY_CTRL_R13, value);
 	}
 
 	/* Tuning Disconnect Threshold */
-	regmap_write(priv->regmap, PHY_CTRL_R3,
-		     FIELD_PREP(PHY_CTRL_R3_SQUELCH_REF, 0) |
-		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
-		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
+	value = FIELD_PREP(PHY_CTRL_R3_SQUELCH_REF, 0) |
+		FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3);
+	/* S4 wants a higher HS disconnect reference than the other SoCs */
+	if (priv->soc_id == MESON_SOC_S4)
+		value |= FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 3);
+	else
+		value |= FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1);
+	regmap_write(priv->regmap, PHY_CTRL_R3, value);
 
 	if (priv->soc_id == MESON_SOC_G12A) {
 		/* Analog Settings */
@@ -360,6 +387,10 @@ static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
 		.compatible = "amlogic,a1-usb2-phy",
 		.data = (void *)MESON_SOC_A1,
 	},
+	{
+		.compatible = "amlogic,s4-usb2-phy",
+		.data = (void *)MESON_SOC_S4,
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
-- 
2.56.0

