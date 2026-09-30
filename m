Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DA4D7D2B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771002; cv=none; b=qXUvnjuqaLtevNi23UUKmAW3arYCC11zKzW3HCys9IB88jRhaUQPQ31u8Fd4TytZ8umbSvpDFOAAH+yhnUVaCVlEEQh2t5UX1qx9K8KS4iBlhGCcvLV0rPFHbIC1nvCYeRXNiI67ddKLvBgxK1kGefkrOYW2YW9Phfzi1ifYN8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771002; c=relaxed/simple;
	bh=h2pc95njxmsYby06YpERNka41uwl7Jil47IjfwsFRfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahQ9YinSeGDo4Uo8otXPFoCM2KlhLJGz+kwWWzjJJgGBHxtgT9VGoedZCmcjLnAQi6/8Zx5haRKccCrQLAolzBHzFhHI3umeKLfjkTOvjd6GgvI0VZalbYpGLs5p8B0wFN/4uJkZtmFiYhPNz/L4w7jE/Usgk72l6WGd3ZbmS90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Ew7gGX2v; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Ew7gGX2v"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso8374454a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790770998; x=1791375798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xR7yUYPX+7seinAiFgxnQeT3HBczjiKMTueBlqUkDE=;
        b=Ew7gGX2vVJQrvTyv5J+H0O2GYW04FGDpo56KVcjUVe4E/Akj2mkaqubRUD9LxrZnI3
         M8EWNIXQzIFeg/R6h3zBpJY7Ag0WbvCzLybDT5SOVWFyeFMgA76/l4BpeGK+pVEQDB5L
         jKDjQFjHq/h/PNPVIX5Zb4i3IOkffXJF/gMAwJBnxVDNQCLzZ25dzMnT3E2gLGIOReqh
         oLIlu83eC/ZB52Q3J1W5k935qHvszFcHSIyABPaz6MLgoD1vdKl6TXg0jECgwyf2sUPa
         JZXjI6POG12BkpbkTk7dg/uAhZXF0QxaOfuFBap4qoRy6H2nA8WEshOqcik/y2XiHz7t
         X8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770998; x=1791375798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xR7yUYPX+7seinAiFgxnQeT3HBczjiKMTueBlqUkDE=;
        b=Nhyl2RTDPsfZ5knAirhMf3DWGKJri7IDUHK0K9HC9pCL601qdw7Np0F9W0+g4hsKzC
         OY5G98BLkVRu7l9EnKZnb9epVmZMUrJ2wj7m5f8X90PIGJqmsw8Va9IOJ1CGHh+8jr4u
         V5EYzr6ZTGyG3OXSNDH7+jiDU5kScqkZoKhc73Dw4z6rDh8fyVp2dweWUO/daeLSOvlW
         ru/Er0iIhPy2uvNpr+/20DljWPgHPYD/1eTMG+G0L/ozyyivH6INW52fLrW9G8DULrjk
         zGEQzlbfCKoWuVazbQDiacYR/n5YRzvDATOIKSTLtnKTAikpJiXd2eB4BffM96658J+5
         VBKw==
X-Forwarded-Encrypted: i=1; AKwUvBzGM2yhjLzf0YPO10uDSGnOFHC1yHLUqiviVdllm2uZSddu5GQWFXtOMR/9CNUv6DxTvHvNpkgNBCn32hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI9xSUvHMCDDSEBknMXld+/p+3EHl5Mol+cp7RoS+j7UFdW69/
	ixQPSMCarfBlF9UYucDZVT7XeL7BjIoESIXM6OBCELHUBHfLJR15x9+1tSPpvuzHnQY=
X-Gm-Gg: AYBFou3dMUrpk98i5sfMsuVlaQXtSzIER6CQ6HeD4zQxuqpFICAS3O2CLEsovw0F4i+
	lxMJOGYSzG6U3mkLBykZDgR2ffYpIzAKpCLsXTnawxA20ZxEiBb0N0wLqUH/uDFEDZxWU+oSw/u
	2pEFqDU0M5cIX2iNyStUJUqxx2iUnwQBpmsQD18MtWyz/CSz0r6JJuO9qONp8m7og30A8Txhk6h
	XteDob+aCERriUIvbP/gWzXLPYL0yoxfkHY+OfIk6ZfQn2JYoH/atgfnMnJoBSDXUYQrzYk+usY
	npkFKA4SGDHDoOsRx8x6y7YNZb/33BgYCtXDvYoMDtN9X1/seoW2xaCKCos96X/wT/FsIW918ZE
	iI06jyWrI9w/YMWP0EssA5u3WpU5s9E4Swj7HVwqKqXxAMvETnrASl3SkStw+uKjaCtzU4bud5m
	P90qrxdKlag3rrDVWLaGC/t/ItS5rj48LsUPZBkjGST2zi4AXyecmzSf/+suw64eKY1AmNW0dDH
	ZA/Fab5CuK9vYs46O7x/PV4BzAeeF3gLOf06P6wzGliUId1O0EJRu38l2ct6QpC0OPVIgUvqI53
	QAH/wQjDeM7QjOlT5CSqWjVT2L7dqn1wkyvQ64Y=
X-Received: by 2002:a05:6402:401e:b0:6ac:86e8:315c with SMTP id 4fb4d7f45d1cf-6ae1992a14dmr1016775a12.7.1790770998038;
        Wed, 30 Sep 2026 05:23:18 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-187.xnet.hr. [88.207.15.187])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e5a3sm744042a12.20.2026.09.30.05.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:23:17 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	lxu@maxlinear.com,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
Date: Wed, 30 Sep 2026 14:22:17 +0200
Message-ID: <20260930122305.293686-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930122305.293686-1-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure the MxL86211C physical TPI lane to ASP mapping when it is
described in DTS.

MxL86211C supports per lane configuration.

Leave the hardware reset configuration untouched when the optional
property is absent.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/phy/mxl-gpy.c | 53 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 790075632fc3f..f716da0ffe890 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -117,6 +117,13 @@
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
 #define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
+/* TPI lane to ASP map */
+#define VSPEC1_LANE_ASP_MAP	0x14
+#define VSPEC1_LANE_ASP_MAP_A	GENMASK(1, 0)
+#define VSPEC1_LANE_ASP_MAP_B	GENMASK(3, 2)
+#define VSPEC1_LANE_ASP_MAP_C	GENMASK(5, 4)
+#define VSPEC1_LANE_ASP_MAP_D	GENMASK(7, 6)
+
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
 #define VSPEC1_TEMP_STA_DATA	GENMASK(9, 0)
@@ -440,6 +447,50 @@ static const struct regulator_desc mxl86211c_mdio_desc = {
 	.owner = THIS_MODULE,
 };
 
+static int mxl86211c_configure_lane_asp_map(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	u32 lane_asp_map[4];
+	u16 val;
+	unsigned int seen = 0;
+	int i, ret;
+
+	if (!device_property_present(dev, "maxlinear,lane-asp-map"))
+		return 0;
+
+	ret = device_property_read_u32_array(dev, "maxlinear,lane-asp-map",
+					     lane_asp_map,
+					     ARRAY_SIZE(lane_asp_map));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(lane_asp_map); i++) {
+		if (lane_asp_map[i] > 3 || seen & BIT(lane_asp_map[i]))
+			return -EINVAL;
+
+		seen |= BIT(lane_asp_map[i]);
+	}
+
+	val = FIELD_PREP(VSPEC1_LANE_ASP_MAP_A, lane_asp_map[0]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_B, lane_asp_map[1]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_C, lane_asp_map[2]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_D, lane_asp_map[3]);
+
+	return phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_LANE_ASP_MAP,
+			     val);
+}
+
+static int mxl86211c_config_init(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = mxl86211c_configure_lane_asp_map(phydev);
+	if (ret)
+		return ret;
+
+	return gpy21x_config_init(phydev);
+}
+
 static int mxl86211c_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -1482,7 +1533,7 @@ static struct phy_driver gpy_drivers[] = {
 		PHY_ID_MATCH_MODEL(PHY_ID_MXL86211C),
 		.name		= "Maxlinear Ethernet MxL86211C",
 		.get_features	= genphy_c45_pma_read_abilities,
-		.config_init	= gpy21x_config_init,
+		.config_init	= mxl86211c_config_init,
 		.probe		= mxl86211c_probe,
 		.inband_caps	= gpy_inband_caps,
 		.config_inband	= gpy_config_inband,
-- 
2.55.0

