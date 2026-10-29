Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283532;
	b=KlBFyx9tyiHmrviBucp3qGlk7dKPrdEFfX/LJP5+kAIqA1Gt0QUk7N4P9YPaYnp8AEWM
	 +zSvgyzZOoHLy5NwfMhO8RGB42yyiVoWniZ9j8kptWgfuMemNa/mVPd9oO5tUMgyspKcS
	 6Dh6HuO0RTzu6hJFEWKXoiLGVdPfKJf2qrj93H/SgPWZdQXK8kq/S+E/zGvFgbudVIc6J
	 TSk2dM8JKcEp/kyllqZ1pfGD1Mk13KkwGlEcnjMZFmaq7sAXSzcIDkYQ1wZPPHQu4V+SV
	 7NyiskHs9JMWg/OyDfdDTOKniGfqA8NVdjA+hXqufQXEMv7/jr/gJ5SMp4+K2Ldk1jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
	b=3bu+C9jCOkGDYpT9tIrJdoz8dR5VQQGLrIroEJl0fCP9f/qOVA1cEN8fTyNbJUUqU70r
	 HYadNFrS8BfahlW0fHQ/FR6xDFiMM8HYSDNc+3PiP8yedXSv8qh6Pro6Qb7ecAxpXuKK6
	 pjAbHnsNXX2DCnQuqtwS7GclOsnVfgRV6WuhwUp0hbH2ilDecssRWon1x8UtR+g404xyg
	 dCYPdEYFWLXzs2aVJp+Xb9UJCjhNjbi3pcJGMGIWVW1ov/x97Em4gVN9cwK9eE/5V7cmU
	 GS/gQXVf20avsaSkt/Q2cZ1MRu1ShnAmBbfGz0wZwB7cB6rqDs7wlOWQzLW/0Dl9hCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=U5QvBAkE;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D42606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D42606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=U5QvBAkE
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso15537985e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283531; x=1793888331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=U5QvBAkEHFeQUPa7mIoJ2tnS6H21i5vNQxgO8zYKKVfldO/R91nnx+iWp9JSyyCKyx
         ecTBS9Cv71lLj6+LhcRXRxl9oX0DjbkhKXlHB9F0ub3fHm4gnC6RYPFiKV8iMnDS2C3S
         LW7SV+07GqOFJO3KDDxUYmvq7Uw4COs6QAyoyuBOCJ0McHy2Mq76Lo2NCAeeHOnJOCsz
         J3QPzatJ4AEUlj8Pg4VJVC3jcgI7E2ZQrKpLDYOdhw6Tb7n4wLHsYCXqwyCOaxQjW893
         pews9uL805MVBf2XwXt0cjC0Lx7NBZQVnhoQa2izCmbTsWXOWjuu4V4ifsDr2lpAITn1
         E3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283531; x=1793888331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=oZ9UuWdRAA4Ykh8PF0LB9GWE0Yb6cwp6WE8soGP23kgi6VNeL5KICF2FJDRxJckjpb
         x4+9d+LR6xwd2zAmIAUN1DPTx7A1SQJBdki/MzROdWoDVyGva1sad2PZjYh55hlxv4vF
         q/QxxFX7ciF6dRSHwPqdJ2xj4IVufVKKCwdIxCLkf4XaX1NBB7u/EFFT1HhYR9lmjh8d
         GprqLYze65ZFRsdfeOpgm/0jA0dCKSt8mn9U9ATZWI93Tc+XNUtNmZYbX8DxfaGNwab+
         W+YWGRhOi5wd7zmzQOSrff32U/bdj2ZXbseQm6MAr8UP0T2xfQcp0sDq7bSxsHx4MUPG
         BRYw==
X-Forwarded-Encrypted: i=1; AKwUvByPqx10k0BH7yIL3kpKMB9gIkv3kkccl2XhnJuNSWapJLX6A0PHKuBDQl8sXY2dk2I4cJyU2fsOIBwsKMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJubXAvzvg1TQSPBMEqWUZ6D2vpTyCpreLVIDoqNuaAeIx07Kjm
	FnRuHxLi6YT0I+/bzMg58PPc/7RllYHUIfAAqNvxlsWB7iXyNXlN0tKmE/C+oCqVb4Y=
X-Gm-Gg: AYBFou0R9UiZ5JDYjObTEryUsQsIag5/1v+mBhdfXHn23xG9wE5fsUIVfH9dVoT9Uxe
	ukvr3q48mGpTOQtSXPKN22gwZRETB2hhO4daYw0k+0eEg2V8iAHIILs+lUmD9BQcUzZXE5qvZCK
	S73PcIssu8zqkpf1rWTZUhY7WbMjlTvrhDGktfHXBLBCMNjlJ1AuDjuv2rb4EM10WJtb+z2cHcy
	ghh25LEHWVPQ5ZFiImt3qY7azZGTSij7PiM1WDvQ4fq9CmFVKrr1nOZkTq4BhMnrJ8RL6o6AI8k
	7Q2syi2pHgjzM3qOzjc16ZHz/cIkH4RRmZQLC1lmxsdy3l1PtLLj2DWNtiUMJ2pZ0NY+jxPFWn0
	pC7vOc9vqClY7pQelKC5fB+bNqrsWpDmBYCJgbkVO5B7wOU1CSu77NZUbKSP1QXatbn3+XJCoKq
	/x86pFHMsbv59RQarN9x+i9W/UsUwFpkWWM8FOWQ/TY10qM276ed5I5NN54N7GbTIMuzP8aY1L3
	q+YvCL7MFF60Wq4+ZmKxtifJGVi+NXgxswqgDozfa00C8WiJJ2Funz+cIpwEiyE+xx+9bvo8UUt
	vVCeqoa59ar/3UgSdHwD3HdTlU6uNvWJTrkDFgC8Vig4LydBg1pVJ+e18FOsZSnc2XeZoarcZoy
	chCzU
X-Received: by 2002:a05:600c:8b85:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4a966f220f2mr121003265e9.20.1793283530836;
        Thu, 29 Oct 2026 07:18:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:34 +0000
Subject: [PATCH v7 13/18] media: sony-starvis2: Add support for IMX832
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
Message-Id: <20261029-media-starvis2-v7-13-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

