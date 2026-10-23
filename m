Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749850;
	b=ErRdt4sXjU4y/2P9A48g1d+obqkhVja7z1dh/XOliMnAA6NWiIYFiN/wbBVT37G3YODO
	 YSD8ixX2Rziq9b7WZrs7seiy+3Skyzbv4aA8tjL91QzqnlB+m2TfmnniqRhzYv++A/159
	 X8QHfZDsYsjpxwfUpQGUfrzA5DvR2G8/521+Q9cbUaW2vNBHwRCZihrgFxljg6E2GK2/R
	 8IAuwWwcSQ7PpJlSGyduTzdUrgk7YeeK2yG9fDGyEm+FnkBlCAJySldOHCR4zKpxMMfe2
	 xcdI53itnRssBh4Vffg5NGExZTAfS9WH2GHJM5cAv2Y56W9c767eEDNole6XPNLOIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m4XBJPWTu2Tj0/mjHBBACkSUunkNAwa96zuWBczMd4w=;
	b=thSAqKVHdjHIafFOZxcNUOaO/kpdmsKrOy+n/uKtHPrgrw38b5wOP166Hw6m/GQcMOnq
	 bXP1YUJ17i6Te1FyMcqjHl+M1KGBfAAfqsMXToQ+NeorzaE/Ix440Is6quc1q6TylfXYA
	 HCbQ9ENQMjz3hLJO/ReyV7SOlsJ+ODvlTOIbRXYqhcXlt9DBXIJ2I/ld6Y/djoZ7ZqpHd
	 i9PF3jyasGrMM2YTEnk1KEDJEAotFt1dywkjPqIef9C1PqNuRpGFn3JXe3L1ScIMYrjSN
	 9Ve/Y3IMPONiTnLlF9mtPGF1PwkbvE8pb4wCHthmcwNiiL8MMWPvp5bPaprpbOYbp2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=CPtTynEv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD6606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DD6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=CPtTynEv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so7952315e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749848; x=1793354648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4XBJPWTu2Tj0/mjHBBACkSUunkNAwa96zuWBczMd4w=;
        b=CPtTynEvQvM6yCi2Z7a4EcvAQs/AfPXydKn+sSP3326wBcp8znL7p59h3CRD9QPSBG
         Zf0AKxSb76CfPRuPFb1EuVlG0SHuzuG8i+PXTm3kr2hoTIRS2nzTj0mRW6GjY1AcLCew
         vwfVXTLeBNz2BShnQrZ7fkRFdxxgj0KYKjV2JRuKO/tfrifxIuMZk6zM8BNJ9MQUIluq
         wJ9egvLZU5BsH0OCDDwm2BTEwop3oAY0R02yXdgSbAJWiK/HWTpfO3vQpxE0dvkMXAzl
         E2zAL0c65VRHGE+Cs3fCX7T9Shc69aojUPpXWJyHl83UjNqwsnLvEMVSfyOjVMWf000i
         u4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749848; x=1793354648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4XBJPWTu2Tj0/mjHBBACkSUunkNAwa96zuWBczMd4w=;
        b=Zxb9FSq72n9Q2VnbNkNhvzy0AoVkmfoqiL7hOgJiNQ/W7+oWNqSVFwMCLcElgQDNDU
         0/H4t+iaJqLg3GCslkp0gFaqgDdbFRHCkNcKaokZaTzbTx2ukqcHb+pouvd4DOXsTegs
         O05kGypdqLJ51JK4DIRGOe70Pl3ZXPF90HKENLYeRpSZTrj9Zklvyw6oBfWFhCO8P/FI
         NlrhNp0ydl2OpHvy13wtnGz1XLyV1/JZRaTKp92TA39LwC3eWdQigQD98TZObBGoUi0v
         S4KKcjZejFHqLbwWaiNtEobLkd9d9CnrU4P+cgseV30LQt37OMGhb6GZG3dSh2+A2ETb
         y2TA==
X-Forwarded-Encrypted: i=1; AKwUvBxUmxE5cvUb+ROIEMD7Usxz9jAbA98Sp6otm2pwqkBSdlvJJ1MvJ3/452Nr8/Pn8+fHvYHSP0SkLDLP5YQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHT2eMpI4IHyAUSjXFex05uxcohOuXhs7GK8jxx9N2I4F/BYW4
	qOcX+xW98lIObbot1zLmpvSkD43T+tKfPljze/VScH/3woIuIzt3tTDpF9kxkI6fMjI=
X-Gm-Gg: AYBFou2xnRDkA+cxtUj1rvCpsf6uJWO1PhtInytcNhrOuYF7oD4xFrQI5+KuBOyZezw
	D3vrr8W4r44GfG2m5tEt0WPiADnSQqZaHFVkQja43jz5KDp+FYDankPatiUTWmxrzNnZDvlKT8g
	PuiiBuc+0ZROLxsHa2uQoaWJ+Fgej2pzCYH9mO8iQC2+nYAIdYElfQqkmf1GRUg5RYrLy/PD4c8
	t5roTZqb3UqPJxnRDMHHGWgudP710HjhWxzxe5DC52XNQagG5plO7kkzucju97NwC6UWI3tCkPG
	RS4XNs2agE9nvUVJBIc382Qgg5octQknC5w1cAdJaWU+fqZ07BCwvRjs5NU89UYXxd3m9Izo0tU
	5ha1kP/pznR/+NM+1uB2SUM+GlsPB/qmHrLqAid+CsAPaaAjTJf/8Bn/2w7vohtdzNDoVp53uUs
	h5MhBnrx6PTowXZ64+pFD4FsY0x14Wa6sXGJQVJVckPAk1g4GlAv4rtP+zmP3nFU1JfdHeXktLy
	OoI4N7KjHgD8Tii5tSaQkDa1/fPj4IDxLBWez9FzAoS8z5bFR+YVrB50JXJF6GAymgfgvznofYk
	wC2uE+oh3OM+
X-Received: by 2002:a05:600c:1c20:b0:4a2:b60:70b5 with SMTP id 5b1f17b1804b1-4a211f023fbmr28939065e9.13.1792749845546;
        Fri, 23 Oct 2026 03:04:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:05 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] regulator: axp20x: Add support for the AXP2101
Date: Fri, 23 Oct 2026 12:03:57 +0200
Message-ID: <20261023100401.67592-4-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DCDC1 (1.5-3.4 V), DCDC2-4 (0.5-1.2 V by 10 mV, then 20 mV steps, DCDC3
up to 3.4 V by 100 mV), DCDC5 (1.4-3.7 V and 1.2 V), ALDO1-4 and BLDO1-2
(0.5-3.5 V), DLDO1 (0.5-3.4 V), and DLDO2 and CPUSLDO (0.5-1.4 V by 50
mV). The DCDC frequency is not known to be configurable.

On a HiBy R1 the selector values read back as the voltages the stock
firmware sets: DCDC1 3.3 V, DCDC2 1.1 V, DCDC3 1.8 V, DCDC4 1.2 V.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/regulator/axp20x-regulator.c | 88 ++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index ec6ec071ffde..42d0aec1173b 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -765,6 +765,81 @@ static const struct regulator_desc axp313a_regulators[] = {
 	AXP_DESC_FIXED(AXP313A, RTC_LDO, "rtc-ldo", "vin1", 1800),
 };
 
+static const struct linear_range axp2101_dcdc2_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 70, 10000),
+	REGULATOR_LINEAR_RANGE(1220000, 71, 87, 20000),
+};
+
+static const struct linear_range axp2101_dcdc3_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 70, 10000),
+	REGULATOR_LINEAR_RANGE(1220000, 71, 87, 20000),
+	REGULATOR_LINEAR_RANGE(1600000, 88, 106, 100000),
+};
+
+static const struct linear_range axp2101_dcdc4_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 70, 10000),
+	REGULATOR_LINEAR_RANGE(1220000, 71, 102, 20000),
+};
+
+/* DCDC5 has 1.4-3.7 V in 100 mV steps, and 1.2 V on selector 25. */
+static const struct linear_range axp2101_dcdc5_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1400000, 0, 23, 100000),
+	REGULATOR_LINEAR_RANGE(1200000, 25, 25, 0),
+};
+
+#define AXP2101_DCDC_V_OUT_MASK		GENMASK(6, 0)
+#define AXP2101_DCDC15_V_OUT_MASK	GENMASK(4, 0)
+#define AXP2101_LDO_V_OUT_MASK		GENMASK(4, 0)
+
+static const struct regulator_desc axp2101_regulators[] = {
+	AXP_DESC(AXP2101, DCDC1, "dcdc1", "vin1", 1500, 3400, 100,
+		 AXP2101_DCDC1_CONTROL, AXP2101_DCDC15_V_OUT_MASK,
+		 AXP2101_DCDC_OUTPUT_CONTROL, BIT(0)),
+	AXP_DESC_RANGES(AXP2101, DCDC2, "dcdc2", "vin2",
+			axp2101_dcdc2_ranges, 88,
+			AXP2101_DCDC2_CONTROL, AXP2101_DCDC_V_OUT_MASK,
+			AXP2101_DCDC_OUTPUT_CONTROL, BIT(1)),
+	AXP_DESC_RANGES(AXP2101, DCDC3, "dcdc3", "vin3",
+			axp2101_dcdc3_ranges, 107,
+			AXP2101_DCDC3_CONTROL, AXP2101_DCDC_V_OUT_MASK,
+			AXP2101_DCDC_OUTPUT_CONTROL, BIT(2)),
+	AXP_DESC_RANGES(AXP2101, DCDC4, "dcdc4", "vin4",
+			axp2101_dcdc4_ranges, 103,
+			AXP2101_DCDC4_CONTROL, AXP2101_DCDC_V_OUT_MASK,
+			AXP2101_DCDC_OUTPUT_CONTROL, BIT(3)),
+	AXP_DESC_RANGES(AXP2101, DCDC5, "dcdc5", "vin5",
+			axp2101_dcdc5_ranges, 26,
+			AXP2101_DCDC5_CONTROL, AXP2101_DCDC15_V_OUT_MASK,
+			AXP2101_DCDC_OUTPUT_CONTROL, BIT(4)),
+	AXP_DESC(AXP2101, ALDO1, "aldo1", "aldoin", 500, 3500, 100,
+		 AXP2101_ALDO1_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(0)),
+	AXP_DESC(AXP2101, ALDO2, "aldo2", "aldoin", 500, 3500, 100,
+		 AXP2101_ALDO2_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(1)),
+	AXP_DESC(AXP2101, ALDO3, "aldo3", "aldoin", 500, 3500, 100,
+		 AXP2101_ALDO3_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(2)),
+	AXP_DESC(AXP2101, ALDO4, "aldo4", "aldoin", 500, 3500, 100,
+		 AXP2101_ALDO4_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(3)),
+	AXP_DESC(AXP2101, BLDO1, "bldo1", "bldoin", 500, 3500, 100,
+		 AXP2101_BLDO1_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(4)),
+	AXP_DESC(AXP2101, BLDO2, "bldo2", "bldoin", 500, 3500, 100,
+		 AXP2101_BLDO2_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(5)),
+	AXP_DESC(AXP2101, DLDO1, "dldo1", "dldoin", 500, 3400, 100,
+		 AXP2101_DLDO1_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(7)),
+	AXP_DESC(AXP2101, DLDO2, "dldo2", "dldoin", 500, 1400, 50,
+		 AXP2101_DLDO2_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO1_OUTPUT_CONTROL, BIT(0)),
+	AXP_DESC(AXP2101, CPUSLDO, "cpusldo", "cpusldoin", 500, 1400, 50,
+		 AXP2101_CPUSLDO_CONTROL, AXP2101_LDO_V_OUT_MASK,
+		 AXP2101_LDO0_OUTPUT_CONTROL, BIT(6)),
+};
+
 static const struct linear_range axp717_dcdc1_ranges[] = {
 	REGULATOR_LINEAR_RANGE(500000,   0, 70, 10000),
 	REGULATOR_LINEAR_RANGE(1220000, 71, 87, 20000),
@@ -1346,6 +1421,15 @@ static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfreq)
 		def = 3000;
 		step = 150;
 		break;
+	case AXP2101_ID:
+		/* Not known to be configurable. */
+		if (dcdcfreq != 0) {
+			dev_err(&pdev->dev,
+				"DCDC frequency on this PMIC is not configurable.\n");
+			return -EINVAL;
+		}
+
+		return 0;
 	case AXP313A_ID:
 	case AXP323_ID:
 	case AXP717_ID:
@@ -1589,6 +1673,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		regulators = axp717_regulators;
 		nregulators = AXP717_REG_ID_MAX;
 		break;
+	case AXP2101_ID:
+		regulators = axp2101_regulators;
+		nregulators = AXP2101_REG_ID_MAX;
+		break;
 	case AXP803_ID:
 		regulators = axp803_regulators;
 		nregulators = AXP803_REG_ID_MAX;
-- 
2.39.5

