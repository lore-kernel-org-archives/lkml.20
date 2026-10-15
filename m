Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14463C8708
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079894; cv=none; b=M5xCoZ6+2NNRu6q7GJB03UBVP2A9yxtdBxjIojmfeS/KdNg+K9NZ2RBnF2a0DJzVjjiM9ZHgAkYAE9AyZIeHm13FCtfaF+WRD4wyBvTRb56mA5hSB0s85qY8VdDDEfo9TFNg6X1W7iSuY62JIuIEHvrbR92U2BzZuXXcOcsrmKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079894; c=relaxed/simple;
	bh=iyo9x/kmCuk6lc8CL0nMWLIN36voL9AbCvvGVsObDIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8N677CzEI1gqLZlaAwyZ8/AMGcjALDbEhSRVDGc3nZ70s/MvqupT0ogbiB5dsgNiu3hzG7uXlQEGpvK4eL5fiY6w8t5iL0Q0EQofk0VyyCVng5LQgWq43TKyiTzmR6a5euXygZQWF+k9bcEdLIagZHv3FS4uVQIjS3Dx1l3TVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SUnqV+0A; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SUnqV+0A"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso96474f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079870; x=1792684670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1PFJj6q2rtXD6fNbfcI1UBAWa/6XwrxyRgSbFRe+d8=;
        b=SUnqV+0Avl6fEDuI9T48tUFQP0THPq4pomW1cjT3WZMwQQCrc73XNV4x+yiO7I2b/M
         2VCGPficz35DUBrBz6V/9gFbbLEOE2Pgd3amNfTKDf7m6JfYD821PuriXFtLsDwBsuP0
         Ewy+oal6nQi3e50Eb9H0rng+fg9ruxBtRglyOu5tJII6CX2co4N9d7rgwG79Gm/BZ7IX
         9XQd5cwDIgK3kwuPhmIM0RBkcj58dzlJQGbnCkYsEYoPPIs9x9N/xs3/bT8SNq92EZhx
         V/jKsYn5uP4o+Im13MiEEoyYOFOFhzi02DJYWo0z5PuyIo3asIT7ACqOep6yALKaoAWo
         vd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079870; x=1792684670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1PFJj6q2rtXD6fNbfcI1UBAWa/6XwrxyRgSbFRe+d8=;
        b=bmJLHr9w4OB7GtFVkj17w09XyN2eirFzMZTgJQlKFFpC2kO+GPjl16m9qoHDRHpYc3
         IDOYYYBXWGEHRsDFOq7bO0eDKOigLCJuHIcnTd4k9EQeGiC/rtfYFley524J2aLV+CUa
         0gKOrrg1iLfhP/QDVtbyEjoEXZyKdjFYWPyjWJ1wC71acdo8rGZk3Tk3j9JCKM9KiJwK
         gA6LbmAmNwpUSY5aNgkNCp63+XgIxoGkPHJY4bEEVydfb33gUVg8HSGcPboofwB/vsYh
         BY7qdFQOxgJ6M2MvNhDae9/YJMj6E9c2pn7BcMXQ8WjlgYxf4bGFMrkMvNDgP0v65ZHv
         4w8w==
X-Forwarded-Encrypted: i=1; AKwUvBxCmwemjZAt+HC203tuq08lNDJ76b5oFz0AKR00YlDQjUBlu5dWjaLmxHaMK6XCR0h5rDMnSx76LQvqDno=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTvi3Db6mFr7RO99zSNmNN/j8tg5jJqGTQH0bnmPA2LZU/DaC7
	MGjwh1spiNORXjIxTaJMWtSOtxR43BBAGbY5i0gsia5ylfdk0ay4ZpwpoKYnu6X4eZQ=
X-Gm-Gg: AYBFou0nre0C7ow68k3KfJIkrv7Q8m5AomKfbfZWfFz7ndCYTgkrrdS97gGp7dm0bMr
	Y3RiKoFgtYq05vIwhI9mcc++umS9+wyGnTfjuBlhkP3Z5N2u3jsfQ5qOvcWPtfZl1iETwOv5RAJ
	rP/BZAnFzFninMch/cHPncZqcbJt0vCbSz19ifoT9+14l4sdKSWgJ9k4emrH5aLD5EejAjtqwGb
	IAipfZ6leE0TbW3jcBztIlAjNEIEB4dm6vk81KBXkH0KM8atoJJ5XZQNM0O3ZA6FXf9fMkwUSMK
	PfpfdiHkvtKQe7/MNi5uYiWvaxgbaEY2lzxdRj8M1g1ryCM2Jd2hyEdDDuZXv02FVZzhml7MDu9
	rhWzX4SHn4fMRRJAgY5t05L305xMSkrIbW5fqwby4jZE7pn1h1k+TTsu4xHi8dYs+1GMloBxpGm
	gW94eymCH+jKmjK0IKo9WTgz9lKZjn6JeJRGDcxKMosSz5eNLC4qjpJBvOhIJq9F7QCDqso28CP
	1mwvanXwQ4rrQ5AAi5+fZHoAaOCwHW55Bmz98hjcSXGSXzKWQ==
X-Received: by 2002:a05:6000:46c2:b0:48d:ed0e:6bb6 with SMTP id ffacd0b85a97d-48dfadf3364mr814078f8f.1.1792079869978;
        Thu, 15 Oct 2026 08:57:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:39 +0100
Subject: [PATCH v4 13/16] media: sony-starvis2: Add support for IMX832
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-13-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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
index b7d3f65b21b4..1dec5d923077 100644
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

