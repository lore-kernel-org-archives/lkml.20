Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762715;
	b=ZcKxiICukd+OtYZnBgCMcBr2VIKZBjfDOegH66WaG1zqTwTNd1z1clDo+oDIaHtfVT+8
	 CxyHybZmBGuAItvotbtF0sZGmmOvx9SvFSs0zCf3VfghOQ0PRMqAAs6oW49wfFF0VZE1T
	 VHlCdf2sl+qabVUyfdZxRwFWsjaHQSeig200Iz7/tRb5A5ztuMKfPszBxFzpS99LQK34M
	 eDjXJvl6fMOXWBCNXglv2Q5cPM0gxF1W3IkcDicGsMYYhmanATuheytpeBPjrmbiWONxX
	 hjgJvcGnyUxg6xj2pFTc/vAmu+fGhG5/1U5FFpFcTdZ4O3sElvAqeZZtkXvG+dyantg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rGtcXzPNE2ogz2m8NZzwZv9nVBeaOTZK2Ve6/MfUvME=;
	b=4TIVfnnhKdbrWfVlFIpHTf/vqwDYG5VXTKHUpU4+Jgm0+ZPWOCrakHK5F6YZgGVz0VOE
	 PrvyJSrVpVoVK4EafPl4E6mkaPeSR6l74gN+nvxVRxZRXyf8mS8tVBVyHovRfcwz++p33
	 dm3v3oiL9D7vH84DP0y+fhNwW9UaFVgYaEJ5M+GW3H5NbTZilNGai8JPEvJsZjvl+Kr0W
	 ScbD0Fr+6dpH0lDkfEz4C1mToKuwXwoD1ZNCv0OeRK0xbb8U8dPqm83qzFzIvvs5oq+KQ
	 kos1lkSFRvHh1Zia4svbYsaTopt7P0BNuhP9DoNceojLYELyVjEUEHr8f7iNgixRWSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=ipcxFNky;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A049606A890
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A049606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=ipcxFNky
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so3474165e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762714; x=1795367514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGtcXzPNE2ogz2m8NZzwZv9nVBeaOTZK2Ve6/MfUvME=;
        b=ipcxFNkyXnOoetwUM979tYBnV8PnuUp3n5jNl2hzkaFNtBwqnvJ/YQ1dFmXxgkdTEZ
         tJpObHer3hq+CcBEeTCg52Vfv1GTy/Xbinx5WPoXR3uUY1XSctNlnM9ge5bQq3aC8i0e
         ToG3CjNmx8wzcvJ2f36YyOYigwb4keDRWWbD315N22KAwNeakY4EMBFFosaAuxgv77fi
         MgLxCYvwhUevvV/Sk9h0ngcJ4t4s8k+YWi83ncQ4t0piglJIX2YOj9A9Xl9UcRJKvpDo
         BvsGVmVAS3kzRgsNzky509czPxVVyIUIYbkxpqkRg6IXsZrhlePgdPz9jmjQVl7VHeSB
         aSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGtcXzPNE2ogz2m8NZzwZv9nVBeaOTZK2Ve6/MfUvME=;
        b=mTt7jjybQGRbfkVby4tm/JV2/gsAe1Jv/tvEYDrsybpOyXmm2KR+BYV7oYgtPpc9o3
         42a0KMweVn4m/8MPEmNXiNFZ5rqpHXNUjgSHXVGSkopekO1IK+gCbIKoKKWMP7X1oQb8
         TjwP8axu5/WJ/PZ9vJKFc562XBNQIJE6jC5zrhmVjHIzNb2WlSHy1wvWqzj/DFWGA93N
         0Ot+4FqyWYOyoGyBGLRCVL4FzyHIvOh+0mxDWDadkjiDNg49+epDgYnPiRtCqpdN4F94
         Vpl4j7TfvSLd+u/SR2Hj0eyrj09LpoPbeR7DxY2+jbVay41hZ79ZTglBqZsCrq/nWJmR
         XC1A==
X-Forwarded-Encrypted: i=1; AL+hErECxUjHESAKxM9mQ010SLMNtiertkdCFa/3I8N1PpSfFVSx019eSxG5oalRI9vLJSxa2rCrldHxUVHo7l8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T5xaJs6lTXcqny8nDlcxloCI6jsvZiPIg0ZphkxUiACw2yIHL
	D/ZG9YeCIP/YSrAZ4ib22OOA34tchwHE6kwzsCPDQUW0UYe7wzHKwuMFpVa59zTxdD0=
X-Gm-Gg: AYBFou37gfJHDH8aWO6BzcP/JjdAT8h334LAf/ejPrvgczzAyK33PS+aqSJAtEgA3GV
	8yfhn7CQmImFGvSk/EKIHyoOypCVHFtCq3tuM9A1vWncApAYALgmXWSzYHaSVd88Er7l5wkiEGh
	1XKZkb5Ja8jxZ/4nkeiOrF5g0iUE1JscW5IvGK5SXaXU34o3cmVfu0z5zmGw+xRwl/iUvIyavXa
	XFcdXnQFMzG1ERqiTEhBGePfaVjYFUxKYKvGioxx4e01WyqaPMEocADRk9gIugFx68BoE7lWBGy
	Ntgm6ySsVebD2G9aBWIsgQmsx/o8E89mIkkJkC8vWZ7TFiJwNrYroKZygjrmo6sbnAtt4QzIQfP
	vqy5bQxJMmUv/m2Dotp/O+a09pVPOBwjTuUrff2cvSd4PLKXXd/R32/TGdbF0lsRPyn6qtMHVVp
	6nSjGSCi2+vL8XvTdKwKVe0txAagFWsqDHc0WaHG7nUHsnZlp8NnfLwRvUgTWkkSBVW7clLc7+a
	TXPlPgNLhrWZnzYrUTL6faQmupCgPgkAQsin82xb8hoosMWmySY5/a12BhGNQMmSonXGvdKwJCJ
	oneHh8BbhIFEbLzaryRVSGdIS4oiRY4bBK51O+5FNlaqjljfzD/BKJcnjYTdROixGeBUJRNyCku
	qM9gmmdA=
X-Received: by 2002:a05:600c:3b91:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb55a3e29cmr192008915e9.7.1794762713633;
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] regulator: axp20x: Add support for the AXP2101
Date: Sun, 15 Nov 2026 18:11:46 +0100
Message-ID: <20261115171150.64431-4-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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
Acked-by: Mark Brown <broonie@kernel.org>
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

