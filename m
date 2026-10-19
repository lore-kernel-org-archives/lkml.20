Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB409575089
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420120; cv=none; b=aIly6yMQJdZ72kh2zd52FDQJMFEgzMwJn6OJXjkV8symEHD9AojiAiRDMkQbGZ7sxmaO3boNoFGe81YwBaAqpVB0Jnl/RT1uEoyCKdAShTYitBea6TyVh7Po7hLwCih57Uw+IM1YiPM4ME1vOPpGpL8s6Bo7A9zN2+sB+sfpoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420120; c=relaxed/simple;
	bh=BcDpGQVMByZilEG0le0eZ0BVw/Y2an1ze/uSLJSJ/s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QT4FswRGJDczPyTHMQxOlzyvNqY+bWs/K9OJp/Fr7qvj3EhU0IANflimZpR5mIBcTmkAM2s9KgjRnx/QIXhHugUKu9kkjbk47dpOoGn8JUm6oQS836WEgoXoYQfQQh3Qi7xLoOWf2rcH8GunuWxG1DgxVR2ayPJf16DxAj3NIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=QAR15LlE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QAR15LlE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1335556f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420116; x=1793024916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HG9lDROqHNH5wJp2GqveeO3HxavBp+THLW/hMawYX0=;
        b=QAR15LlE1/xecuVhtwajl+xxecztJKxkTBsxv7cvhhmyat5TQFBfeTJjJCLMobseIN
         yMPLqjoaMd/jsBuyipkuAjSQ0KVEfVwk0I0bsdwLYP9yMSiem+AGGeCN2w7pDGrPb79s
         hLAldDV624t/Lz5jqwU5RKQi6WX5rw58CjMbYn6TzBhmM12uWMwnv1duQwex6Na/NSNT
         G2iZVeQaY+8Wfq0f1Z7Mip7eFvaTWkYzDyV8t+jxF0Wt9MRPby4lQ7rfFB5g5FYTR3fW
         356eBraQpsGqzJEc99z5anvM/f8aQ5Siq4+rF6ql5HZrm5bZhKKpGq9UKC27amf6NZEN
         CLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420116; x=1793024916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HG9lDROqHNH5wJp2GqveeO3HxavBp+THLW/hMawYX0=;
        b=CMQH4m2hLv6OHwtU5rCMwqS8gIJ8I1GkH4QIW9REj/l/N1pGmZtmZKJVLJsLYAbere
         IuYttLRyQht2UX6hp40omeFofHe3nGRgs6NdiLSP1VD/au2q6qrdW2S2hHLW/zKAYePO
         sUSoYqYLQiL+DYYofpVL9SbLTyrWS6CN+YO/b/cZ+u7D4dT/dRnrOXXtTkwCfnHbnPGU
         qGH6WzSTTRPRLdA090AVz3UoQwbqdogWheB4VrwGMFti525GSfLgyGAvtQUppOVvD9Tn
         eNDtVLL4Oun3YQiOy3X7MvI6083oHa4IvaOkjLsvNBlBS35j4wViRXYAGmvc0jDHo7DR
         5CUA==
X-Forwarded-Encrypted: i=1; AKwUvBytLEFcIigEt5o0IY6N7dw6SpecyqTBwEnbjbhd0e7qs9AH9Syv1Ne3F3LL/3mEzFDCeoSGfZPqB7XD2qQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpJpfSEzAi9+3Esw2gqHWLvH4Dj/5g8EnINY/+JN5CnRt2kXB1
	Nn8zud1t9cb0SyAEza12/6Qainpp0D9YnUPdw57BsbTcGG5V98s1gj1KHpAKxRWkHQw=
X-Gm-Gg: AYBFou2C28b+CbBprA87ORtHaTL9Hh0PuIg8Efvl8TLjUQQf0jyHovobJ4Y3ZIObyS9
	kYr+BCOIYEdlK9bY5G5IsSKY1cnr+n34z7Z9VqCSvV6ULD0c1UfaCjPo8emMyHdtORfr6+FTPWv
	E28kELYmYiXcdKwUo6Qq0nVqW1g+/ZrUdKAT+obUBSgyLfhRbSrp4kJUSgT1QG8HS2esOJlD91s
	5LCM0YLX76kzIFgStAvzvuYjoSeRpVWibU3w7sQPD6oN6FadvXcYBZbFaA3MbGUSjcxWgPRQbTo
	8Pbd/xBrGuX1SQFBNE7H1pFh1M1lj2Z6vMmy+QL44jGJQXnqViEFpShC33Q2DubQeBjhFph2Q5l
	dmzAuq/DbQoWmC7Lgz2TYcF1FFOdhqWJRaUX33lFaNK6Ck6P7FKxUA762ptENgyQec/0WJY6Snb
	rLCqNlO9ZqpZ+0/krPIfo4ZrZdWkbG8msOxUtMcu5oY2IfKcZuJqzVg7lPwsOQpa6ZlfOLU13LC
	vlGLOM9VZQfu6J/F8YtyDewT3JypZq61cDvgJXEICOu+xeBsA==
X-Received: by 2002:a05:6000:26c8:b0:487:342:d141 with SMTP id ffacd0b85a97d-48e07f98fc4mr15080403f8f.23.1792420115289;
        Mon, 19 Oct 2026 07:28:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:18 +0100
Subject: [PATCH v5 11/16] media: sony-starvis2: Add support for IMX662
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-11-eef935347ce9@raspberrypi.com>
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

IMX662 is a 1080p Starvis 2 sensor that follows the same programming
pattern as IMX678, so add it to the newly parameterised common
driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 155 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index bf14768dbf98..2eda6fe45557 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -8,6 +8,8 @@
  * Currently supported are:
  * IMX678: Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective
  *         pixels.
+ * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  *
@@ -661,6 +663,136 @@ static const struct starvis2_variant imx678_variant_def = {
 	.hmax_min_pixel_array = 550,
 };
 
+static const struct cci_reg_sequence imx662_common_regs[] = {
+	{ CCI_REG8(0x3444), 0xac },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3b00), 0x39 },
+	{ CCI_REG8(0x3b23), 0x2d },
+	{ CCI_REG8(0x3b45), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x1f },
+	{ CCI_REG8(0x3c0b), 0x1e },
+	{ CCI_REG8(0x3c38), 0x21 },
+	{ CCI_REG8(0x3c44), 0x00 },
+	{ CCI_REG8(0x3cb6), 0xd8 },
+	{ CCI_REG8(0x3cc4), 0xda },
+	{ CCI_REG8(0x3e24), 0x79 },
+	{ CCI_REG8(0x3e2c), 0x15 },
+	{ CCI_REG8(0x3edc), 0x2d },
+	{ CCI_REG8(0x4498), 0x05 },
+	{ CCI_REG8(0x449c), 0x19 },
+	{ CCI_REG8(0x449d), 0x00 },
+	{ CCI_REG8(0x449e), 0x32 },
+	{ CCI_REG8(0x449f), 0x01 },
+	{ CCI_REG8(0x44a0), 0x92 },
+	{ CCI_REG8(0x44a2), 0x91 },
+	{ CCI_REG8(0x44a4), 0x8c },
+	{ CCI_REG8(0x44a6), 0x87 },
+	{ CCI_REG8(0x44a8), 0x82 },
+	{ CCI_REG8(0x44aa), 0x78 },
+	{ CCI_REG8(0x44ac), 0x6e },
+	{ CCI_REG8(0x44ae), 0x69 },
+	{ CCI_REG8(0x44b0), 0x92 },
+	{ CCI_REG8(0x44b2), 0x91 },
+	{ CCI_REG8(0x44b4), 0x8c },
+	{ CCI_REG8(0x44b6), 0x87 },
+	{ CCI_REG8(0x44b8), 0x82 },
+	{ CCI_REG8(0x44ba), 0x78 },
+	{ CCI_REG8(0x44bc), 0x6e },
+	{ CCI_REG8(0x44be), 0x69 },
+	{ CCI_REG8(0x44c0), 0x7f },
+	{ CCI_REG8(0x44c1), 0x01 },
+	{ CCI_REG8(0x44c2), 0x7f },
+	{ CCI_REG8(0x44c3), 0x01 },
+	{ CCI_REG8(0x44c4), 0x7a },
+	{ CCI_REG8(0x44c5), 0x01 },
+	{ CCI_REG8(0x44c6), 0x7a },
+	{ CCI_REG8(0x44c7), 0x01 },
+	{ CCI_REG8(0x44c8), 0x70 },
+	{ CCI_REG8(0x44c9), 0x01 },
+	{ CCI_REG8(0x44ca), 0x6b },
+	{ CCI_REG8(0x44cb), 0x01 },
+	{ CCI_REG8(0x44cc), 0x6b },
+	{ CCI_REG8(0x44cd), 0x01 },
+	{ CCI_REG8(0x44ce), 0x5c },
+	{ CCI_REG8(0x44cf), 0x01 },
+	{ CCI_REG8(0x44d0), 0x7f },
+	{ CCI_REG8(0x44d1), 0x01 },
+	{ CCI_REG8(0x44d2), 0x7f },
+	{ CCI_REG8(0x44d3), 0x01 },
+	{ CCI_REG8(0x44d4), 0x7a },
+	{ CCI_REG8(0x44d5), 0x01 },
+	{ CCI_REG8(0x44d6), 0x7a },
+	{ CCI_REG8(0x44d7), 0x01 },
+	{ CCI_REG8(0x44d8), 0x70 },
+	{ CCI_REG8(0x44d9), 0x01 },
+	{ CCI_REG8(0x44da), 0x6b },
+	{ CCI_REG8(0x44db), 0x01 },
+	{ CCI_REG8(0x44dc), 0x6b },
+	{ CCI_REG8(0x44dd), 0x01 },
+	{ CCI_REG8(0x44de), 0x5c },
+	{ CCI_REG8(0x44df), 0x01 },
+	{ CCI_REG8(0x4534), 0x1c },
+	{ CCI_REG8(0x4535), 0x03 },
+	{ CCI_REG8(0x4538), 0x1c },
+	{ CCI_REG8(0x4539), 0x1c },
+	{ CCI_REG8(0x453a), 0x1c },
+	{ CCI_REG8(0x453b), 0x1c },
+	{ CCI_REG8(0x453c), 0x1c },
+	{ CCI_REG8(0x453d), 0x1c },
+	{ CCI_REG8(0x453e), 0x1c },
+	{ CCI_REG8(0x453f), 0x1c },
+	{ CCI_REG8(0x4540), 0x1c },
+	{ CCI_REG8(0x4541), 0x03 },
+	{ CCI_REG8(0x4542), 0x03 },
+	{ CCI_REG8(0x4543), 0x03 },
+	{ CCI_REG8(0x4544), 0x03 },
+	{ CCI_REG8(0x4545), 0x03 },
+	{ CCI_REG8(0x4546), 0x03 },
+	{ CCI_REG8(0x4547), 0x03 },
+	{ CCI_REG8(0x4548), 0x03 },
+	{ CCI_REG8(0x4549), 0x03 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx662_min_hmax_2lane[] = {
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
+static const struct starvis2_variant imx662_variant_def = {
+	.name = "imx662",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x296,
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
+	.common_regs = imx662_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx662_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx662_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -691,6 +823,26 @@ static const struct starvis2_model_info imx678_autodetect_info = {
 	.auto_detect_mono = &imx678_aamr_info,
 };
 
+static const struct starvis2_model_info imx662_aaqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx662_variant_def,
+};
+
+static const struct starvis2_model_info imx662_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx662_variant_def,
+};
+
+static const struct starvis2_model_info imx662_autodetect_info = {
+	.variant = &imx662_variant_def,
+	.auto_detect_colour = &imx662_aaqr_info,
+	.auto_detect_mono = &imx662_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1527,9 +1679,12 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 };
 
 static const struct of_device_id starvis2_of_match[] = {
+	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
+	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
+	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };

-- 
2.34.1

