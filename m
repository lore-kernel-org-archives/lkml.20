Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690483;
	b=FIZthjzKF05A5R5+w2qVnoAiIwCg+gP1buMupyRptNwCUBva3hMQKhSmWRJjTCxA7Vn7
	 SaKjJBtVl4gpK9IF+QEiRhQ2RBWBe35DEcHRZjqe0hV1cb1kcJHA0MNrjIJZJ2hYfhZA1
	 xD0RJQpbzqBhE8jt6AtRV9rt0JI9YMOTgbCfW78datKwauIO1G+/AgVtvA6nJyUswQlH4
	 epN3QlM7fr2To/1LosiwTTgYPItq8iTG1Y10xqtMNuwcfiDtLSjFp8wb8Hoki6KLI86Ei
	 W7z4XT85ddXihzgYjP+X2w3t3VKlHs66vy8wbbPoSKcY+Hmgncb+y05JXwIaTVBhIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
	b=xiZq87H/+iEJOJYYC7CCup0FVghlH7iVdNl96sFBBvtUuzuY29t8pNEgMzpzPKHhCOsE
	 WiHxJiTTchVqzBWMTr0ZVN7S8tGi1xNk58F26FxSQMmWTM96iE1kPqDmDTY8UQEaKhdsS
	 sW/XwPIzza+Zuw1PQdRLvzTNJsNHGVG0YQBUc17DBDUMqrmO+cU7y5x8fUvtn3ebP+g0v
	 zDQVTKF8c36qdCmybQTIeDpdbJRLiXCYGDpVfGwRpCPlyfc5KxTc8UFvw7i73ZJLJChtL
	 +FD3WtJswYzxfNKjfsj7ZW9bQxVKfdClGGyXJVQBI3p1U92rZhJ0/h2aM6JHhmvWBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=SXT6bHxo;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F060A383F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2F060A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=SXT6bHxo
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so18850f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690482; x=1793295282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=SXT6bHxogpOGZuiuWTqC6NQPjc06joj+n99rqzbJqp/SAh9mHvNdib63POOcm7/Qlp
         OHvGZXonF7hfeaoW9JGos1XoWTJYLlqgwGoWbEr8ilIgPVJrh13dR13mGtCVXLJ3z3qu
         9HLhr4ZE+aQn2bchTKXDNI7C7Zk9V4MLuJ+p/iXgpUbK11yqPZ4GUTDNvDabtVDatk4R
         E881cXVjbRPy8mSgsA8OfkyO1cJCn/WDBs3t4l6maaCY36dtY7WtlNhZrfXHjMTbZ3+E
         6Xjl624ElMihvvidAHNhydCJZkWcnq38t9jWHvJp8il+o77qPrFnWRBQqEuh7YYwGEqA
         0JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690482; x=1793295282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=JPazDPSRMRSR6yHu8gF1pmw1jX4DOtcXppHQpa57Mqu+vfvdmfF2XnXHzu03YZzfEf
         a02bRA/QqBNF1PZgTJHMHdnPFc+r4eAl9S3ynK77nXomj1TA8IZYCzPSKgwTWRDrgzkK
         vPfGMAAp/qkV86OBwGuKGIoa9yGqrCUnT3uAE9kGHp+5YaKxTY4MzablrNb7VJ0WfJ1e
         q8XiikMY5Pc0o9xI6eDnTjUSbVYnxo0FE5CIKoIPkJpKYPLf8+qpHqXLbXcfjlsr60nj
         0Mn1fv39fA6imu3Lj28ih0/dbCC4s+2RgcHkCgBzGLHyoFbhIEaO3t6Irx7YlPRN7a77
         n3Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzyPwdk4wlKI8v2IhIxzL/akp5dVXSHg7xE90Y6i0FB+eNEu1U5StBxksDnkuH4xkk3GaBN5Quae6Ehhw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRDRXDuaReDHHKnEc24HAMdLb9hK8yft8iFqi3iKCcHvoEytSo
	48rmA2qEVBm4ahix4u7lUnoS1PEA1p1Z3lN6tbXdgPIT8epLF0fmGadZloBKSU8hNMo=
X-Gm-Gg: AYBFou1sBoM1EG8GbfoMcaY2d6WmOKb0iX29O98Mjj/Sl9TXMx7jk6iDWZiLag/B2fZ
	qekyggxivQlJpXF3w4MtPqgJX9skVNek5ci6U3MYWo2jNFYo1/hd12gCU3YKEcBIodxSpTqsjnW
	ze/u+kT/Udn8vQLvb0EUZu6pO2bttYPEM0c5+15ykHlwQUmF2j0PQKR7wx0dQogixvkFD58Mdo1
	dNaAljgUj+z5TQJiFcijaba6HeukYki4hg0lHkWzZ4nMoGg1X/DxLGC6x5wq3mw/9nWy3g86kDj
	Z0Ooje3Mj1Th5yrYVSePy9mtbLtvlVS0tGRHtcefXrjK8E2TGjCeu1kigPmMr0ghMuvqo3LHort
	GzTE3ow62yKon2/yzzdd3siCbpFmYB+zzzYmnWBzO2IZ6d0bYnN7siglwKAw7+9LUbXf2ItoHxj
	+7krj2lHD+AFHPPljONpQxjple9PT2zwERvTEaPlNwUECf+51UTu4Yu7hDYMBDw++ZO/DzU+x/S
	nPdfBTbigXAh99bPAKGRDpRxTBJwf0krIyw7d4LzN4VDrogesrWJLRmnN6RlKYQY3FIuUrWfVW9
	azRVla10NFDs4d/inJrd0vxqKx1CUCU=
X-Received: by 2002:adf:edcd:0:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e264f18f8mr10242795f8f.34.1792690481792;
        Thu, 22 Oct 2026 10:34:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:06 +0100
Subject: [PATCH v6 13/18] media: sony-starvis2: Add support for IMX832
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
Message-Id: <20261022-media-starvis2-v6-13-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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
index a4815a142c9d..645417cc08fb 100644
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
  * Copyright (C) 2026 Raspberry Pi
@@ -984,6 +986,99 @@ static const struct starvis2_variant imx675_variant_def = {
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
@@ -1054,6 +1149,26 @@ static const struct starvis2_model_info imx675_autodetect_info = {
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
@@ -1895,10 +2010,13 @@ static const struct of_device_id starvis2_of_match[] = {
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

