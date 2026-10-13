Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BCB52B1E3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904677; cv=none; b=P30lfF29u3Msq10lR+Sal6mXUvcSLYrnvXmiLhTP2gAm8p6zs4ucaJT/q+dAFPFACMy5pEi1O+VPoKuINVgeMbk3c/ZEZ8vSfAGh/NfOQIj6obMxaczqtwb1TpHM5ItWoD4jvO3svMWZJjFmM1c1WOWelQLM3tOkKVAQFKlEsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904677; c=relaxed/simple;
	bh=x2nnrbHAKlSMbKaSec612DRhPTy+5z0LSv13ylWsJPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKexEpP7sp5+FPA6RJtJDzRlPfiW+aL7PQjpqnNQ0u7bbBtyr7qn8DERujS2PNIa0WTFDR13EIrHag1SH4arQh3HyImoCJc2NX/y7G+vqSxbWkdzQA2sTrWBPCnGdLXyQiTpd854unb+83DnEBCrjcqgACeZipwmPwkTdxNL4Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TWpw5gEO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TWpw5gEO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2829700f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904672; x=1792509472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrTgb3Jlqkb6p6/4z7FELXVvbkFNa/mlQFifD8TNJDs=;
        b=TWpw5gEO+w6SGu6OQ+BwLvBjfwOtp7c4dinVcnc+Y5sCW5cjTxU3MPr/CXYo9cU00M
         KlJwwfvXbeYkaq2T1dqGzlrsJinSgp0rwCJ58HQ783MmwBDAdt82wXn9IERDAFzEckK9
         LG4WIcuMg0dMi9tz39IcrEYj6g3WcLi/XSbHp9xCJ5zdg6WEPaWffUboumSzofjJpm3J
         yE8DvMbmtIMeBm+uWgnwAo71A6i+i6qxr43z3RSmUn1cDxF2grxUQQ/mGm8G/8tY/3Xa
         /1E5VvSGSBmmaTHLFuvO16YO0uVn/2Dwx7paZKIx6kHZR98ZiiMBNWh2p5cGSJiEYjUa
         zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904672; x=1792509472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrTgb3Jlqkb6p6/4z7FELXVvbkFNa/mlQFifD8TNJDs=;
        b=dn1WK5hkrRNOwRdoe9lDzGLQpO04KiTzHxu3TGh4fBMwP2BpPr/SVY47soVtKbW+m9
         7hnY0fX8sWnewZj8yWJMnpYdjsjkyZIda90us7JLH1KoWe38gjgWPBwxv84qJn8IboJ3
         +E2XU/sRPvOHrvr1R9P2pge0xi3Lq26IJ/PLT37YkSQ/ki9mQPM/wqz1RVYqS60Rm264
         MhYUR2Wv6K8ng5xirQfTaI9jtS0viCVN0nOsYpz7ehsjHKNmX2a/W8AhHY9C+duMxG8W
         gWmtkfgjJnPNEvr10Q8dW3qm5iMbF7aB0Ge/8jJSGBcRKtMc9qAcYTdLgI7IN2c2R6PK
         z/3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwq3C56ihV1U5xDNxUYrrMd+oNvqhh5YPX3vpPcNkGH6wJ4VxWWvFapyYOrykPbbr0bD7MFJe3eVgKyumw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAslzWDu88ggD3guwtY3obARzCmBRv13DsurWmKru1Y60TIYIe
	dkxNLwKdHHCc6X/iMrjvAgXSt65tfGEqCuwEJtGH5ojtdsuE0IIkJP+4ZrX3Dak5zNw=
X-Gm-Gg: AYBFou3Ao+zPebXeO8toL+f1YRI56L81/mBSuloCBoWVW0sE64Z2oW9PA4xTqSxu8BX
	jLWYFIIO6yVsZCiNPVI4D6u5IUGr2Iacy5X9VFTac0rujRYBDk9QFbC7RrP5CyygfaN67e76G8V
	xl8I50j0YsGSerAwCcOcuTU5qE/kDCdHybsd+CUGNL1KIliAMThIaPLyrRsQzOdjkT1SxnDFkxw
	21FaTZLSO/adnbBeBG/RE6a+TkLbSjWQKPV4I22yzL+2QJiUp1I7WkTHbWVLsRT5QzVdiySl8QZ
	2rOS2/I4HP3vVvhTJm3jnGJ0dZ1tVCNMqZl/KvkELZRQVHyxd1NAwwTQln4z+Zb8j/oN0gDUbhR
	H/l1MWHX/0qxTKgMu3Ha0PncudShGBbSgJKICEd0Bz2dE0pCTCMovAkSyInrcTDblyYjVwMckxH
	go5O/Ys8YJXmRKIdXC7+68HORV79ATxByvK/zXLOxfizujix9ti/VQNA3ZOpeEyhlfyIrJ6SlrJ
	kgUw3Y+Vm8/ZWe5A4Hbyjw35pba2DpXjewSJj8JCn0w3+uYW3JsIMOLstmR
X-Received: by 2002:a05:6000:2601:b0:48a:f571:7b50 with SMTP id ffacd0b85a97d-48dbaae7245mr26113935f8f.27.1791904671416;
        Tue, 13 Oct 2026 08:17:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:10 +0100
Subject: [PATCH v2 11/13] media: sony-starvis2: Add support for IMX832
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-11-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX832 is replacing IMX662, and it follows the same pattern as all the
Starvis2 sensors.

Add the sensor specific configuration for it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 118 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 084c7772abad..1a2a5d45bcc5 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -12,6 +12,8 @@
  *         pixels.
  * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
  *         pixels.
+ * IMX832: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  *
@@ -982,6 +984,99 @@ const struct starvis2_variant imx675_variant_def = {
 	.hmax_min_pixel_array = 528,
 };
 
+static const struct cci_reg_sequence imx832_common_regs[] = {
+	{ CCI_REG8(0x3460), 0x21 },
+	{ CCI_REG8(0x3a94), 0x75 },
+	{ CCI_REG8(0x3a96), 0x69 },
+	{ CCI_REG8(0x3a98), 0x1e },
+	{ CCI_REG8(0x3a9a), 0x1e },
+	{ CCI_REG8(0x3b58), 0xeb },
+	{ CCI_REG8(0x3b5c), 0xeb },
+	{ CCI_REG8(0x3b88), 0xeb },
+	{ CCI_REG8(0x3b8c), 0xeb },
+	{ CCI_REG8(0x3c40), 0x06 },
+	{ CCI_REG8(0x3cae), 0x79 },
+	{ CCI_REG8(0x3cbc), 0x7b },
+	{ CCI_REG8(0x4508), 0x00 },
+	{ CCI_REG8(0x4509), 0x02 },
+	{ CCI_REG8(0x450a), 0x41 },
+	{ CCI_REG8(0x450b), 0x03 },
+	{ CCI_REG8(0x4660), 0x12 },
+	{ CCI_REG8(0x4661), 0x00 },
+	{ CCI_REG8(0x4662), 0x29 },
+	{ CCI_REG8(0x4664), 0x12 },
+	{ CCI_REG8(0x4665), 0x00 },
+	{ CCI_REG8(0x4666), 0x25 },
+	{ CCI_REG8(0x4667), 0x03 },
+	{ CCI_REG8(0x46c0), 0x13 },
+	{ CCI_REG8(0x46c1), 0x00 },
+	{ CCI_REG8(0x46c2), 0x28 },
+	{ CCI_REG8(0x46c4), 0x13 },
+	{ CCI_REG8(0x46c5), 0x00 },
+	{ CCI_REG8(0x46c6), 0x24 },
+	{ CCI_REG8(0x46c7), 0x03 },
+	{ CCI_REG8(0x4720), 0x07 },
+	{ CCI_REG8(0x4721), 0x00 },
+	{ CCI_REG8(0x4722), 0x23 },
+	{ CCI_REG8(0x4723), 0x03 },
+	{ CCI_REG8(0x4724), 0x14 },
+	{ CCI_REG8(0x4725), 0x00 },
+	{ CCI_REG8(0x4726), 0x2a },
+	{ CCI_REG8(0x4750), 0x1e },
+	{ CCI_REG8(0x4752), 0x22 },
+	{ CCI_REG8(0x4753), 0x03 },
+	{ CCI_REG8(0x4754), 0x25 },
+	{ CCI_REG8(0x4755), 0x00 },
+	{ CCI_REG8(0x4756), 0x29 },
+	{ CCI_REG8(0x4780), 0x08 },
+	{ CCI_REG8(0x4781), 0x00 },
+	{ CCI_REG8(0x4782), 0x1d },
+	{ CCI_REG8(0x4783), 0x03 },
+	{ CCI_REG8(0x4784), 0x15 },
+	{ CCI_REG8(0x4785), 0x00 },
+	{ CCI_REG8(0x4786), 0x24 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx832_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1188,
+	[STARVIS2_LINK_FREQ_594MHZ] = 990,
+	[STARVIS2_LINK_FREQ_720MHZ] = 990,
+	[STARVIS2_LINK_FREQ_891MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 990,
+};
+
+const struct starvis2_variant imx832_variant_def = {
+	.name = "imx832",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x340,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1937,
+		.height = 1101,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1936,
+		.height = 1096,
+	},
+	.pixel_rate = 222750000,
+	.pix_per_clk = 3,
+	.common_regs = imx832_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx832_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx832_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1052,6 +1147,26 @@ static const struct starvis2_model_info imx675_autodetect_info = {
 	.auto_detect_mono = &imx675_aamr_info,
 };
 
+static const struct starvis2_model_info imx832_aqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_amr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_autodetect_info = {
+	.variant = &imx832_variant_def,
+	.auto_detect_colour = &imx832_aqr_info,
+	.auto_detect_mono = &imx832_amr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1864,10 +1979,13 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
+	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
+	{ .compatible = "sony,imx832-aqr", .data = &imx832_aqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
+	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

