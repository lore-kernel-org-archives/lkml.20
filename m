Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1157DF38
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420123; cv=none; b=CIcPO5zjqH0z2GO0iNKZMbkHhRJPusRhFV+LGT8gMep3CN5D455vvdVmiBm947n7RmtzsDCmCzBYUq99JFf+4bYFXlsm7sU86wnSBlHSGHxpExMvXyEipTbvETvYdS5q9j2EmV5KuDHgrSIWEpPNFhKgv3HJW7xg/f1W+OYAHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420123; c=relaxed/simple;
	bh=489iBqCgphxkYSDvma9Uok6z/CPQWnVqRf6BFh9NrLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KjgEcLf37iVmH+bZWzVqvDLMWKMgMlc7ddPUiPJ9fgMt+UVnRIupFqOG/S6uNRB6zVlID7j8SUo76PtkJmVceDmWrMVuXtdIqxNgUNBTCQVtn1fPDSx7H12x76+kpohLHGX9yx7YI7E4XrVEJ+2geegqVjSs66zfXBfiYf9hMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Tl3w+VMJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Tl3w+VMJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so15548525e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420117; x=1793024917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcRnBhGNlT292vc5Yhk59rYBh5XNrU2nqnM/tKe/4BQ=;
        b=Tl3w+VMJ61opYgRH153wbjXflGsFXh4xbH9Fd6ISg4EclHxOPtTaOBWrox26hbGboC
         hC3L+kWm7DTsq3XFtvcthj+FXLKuryOY1bXlSDOq1O+UrXlCk4qg/va5qTPaKciXoEPw
         l3q3+Fc98VSkjKz+32yM69AJ9g2deHCIRkCa1fZ5SbruP9eFt4tLILLuvFGNQLUju3p0
         JYukTWs1mBbMARVlYioZC8Uldo8nppDtxHQY9uOZJJvPSFBN4i0Ooqgue/QnlX6yLTyH
         tpL42+6eLm+K+lgDQjDNoI6YH+GDJWPpZt/Rg+yXY26L64bcuR/3smS1XUNCwZy8h/qp
         WPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420117; x=1793024917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcRnBhGNlT292vc5Yhk59rYBh5XNrU2nqnM/tKe/4BQ=;
        b=SJzNffoa9pxrj6r+fLkj9Lnu54EqsYDliycnbNRN1mppPaMyWEeFfMv8L/BRTyS+Ej
         u7HoSz1ClzKHOBqLZIFdqhhvfz6pikoLI5/mOAayEoCn1g0EhTmzwSKOeM/KlrACykjk
         k0rrC57fVrdh9LloLnpZYo+LgfbpsNWKv3GOJjU6efBf3xb/uRGuyjBKqTm0GBxCA52H
         imgphwIE1gNN8pNkufs77qho1KOWCS6TxZZZReUuNqX3QKmENVLuSNoxcF7uqrRp8qIh
         J108attcau2ObJHuCKoInpEa0CKk6t50WSHKWHioJIYIJVw8C79Vs4Hn3BJTwLXx34l2
         v/cw==
X-Forwarded-Encrypted: i=1; AKwUvBzeOL2pURNUITsLppr0dMnOWsYktbZyfCWxuFisjG/EZBWAxlebpMvMvZKQnEZj8hsw2NdNxZY6TncfTpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEOs17J4yxbVSg2xIQ+rCntELrYVLTUyOab3ewy2L9kaIVb/kF
	JpFe1dM68WHg3MErIyVQTYmfvLhTpLrQds6A1dywnZCH6xGyDMbkTLN05LIK7A7urMA=
X-Gm-Gg: AYBFou1/CNHhth3d1p7bu2cNd2fN8WixWYahFZ1FniluVaWeej2bPBZb2g38U4egCxr
	RlPSk+CBjB10oH+v5KQUDVSkQ5Af9WqK1plJNpGQNDKqjrQEyN5yZte1bb2HiSn40/7l+5UCtHS
	YmViSDdOpSFhk9wAseZ3WThFKgmco3APOY32p2iCvbxLvb46/L6UnGnzovpnGI1amHU3/DVn+xo
	BJxg0Wp10pqEsnVg24HjE+3ebOHJfWuk3PoHuek2VFSDd1scCpnP4l8BY0v888WlsJqjnU6NG8+
	SW+Yt/qzCRopHnaaGRh+bVj9YaCZtoMsNQdmgdZknu+5nzSFY7+PMwN7ZC8TDwyfs0V4NwZb+Ab
	qKB7GhL0B/8gEcfoda8Zvym7hV2s699n/pdeCaJ3cmdM2qN2IEHbDb6eg2xEXZ3UZoX4CBTPEDU
	olHTFU7dVY78Zf2f2BZMXsP5G7XaoKtMY6P7KXTYcNUwddv6KNqgg40O0+gD1ZRk52vUf21v38q
	SebQfk6e7yjoVgmy6O8vfJAslpDpaMKhELbQCyf/0ESfZzmEA==
X-Received: by 2002:a05:600c:4e8a:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1d75f8399mr172408115e9.12.1792420117338;
        Mon, 19 Oct 2026 07:28:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:20 +0100
Subject: [PATCH v5 13/16] media: sony-starvis2: Add support for IMX832
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-13-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
index 26869f2eecf2..8c21109b33c1 100644
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
@@ -982,6 +984,99 @@ static const struct starvis2_variant imx675_variant_def = {
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
+static const struct starvis2_variant imx832_variant_def = {
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
@@ -1894,10 +2009,13 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
+	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
+	{ .compatible = "sony,imx832-aqr", .data = &imx832_aqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
+	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

