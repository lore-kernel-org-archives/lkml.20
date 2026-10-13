Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D052B1CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904676; cv=none; b=PRu3jrnHCp1rz+w2qhBCZ3UnWBNbXTFfiE+mlgvp30GvNSN4e3cgIZKCB6G8E8UuMQXyV4qg5/905mx7pH2QzH+ut4ls68OwPrVJbTVDaDTgQLqXkVrWVuYSKRM10m5Sz6vCzAlbWKVZJRw1z8Q7IWLzd5TcX24rN4lhXkOEmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904676; c=relaxed/simple;
	bh=Qgn+jh/s9qvBsS1UGdyDQbwh/jWLtdLYxjOaaETk9L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ri5wghMDzLIEO9TgZd7iZWNox2x73GNh8M8T4EN5CAu+dj/KGzUBJ9csDQMtsWigkDkhZeB9ouKy9hiZ6uYv51fssEYofEupkRHxNHoAcG8dxoskgD32TpYcP8CV89HzwWmqm3e7OpBYmdTJnWhC9iMN3zU/sxsP4AB65iD2tig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JmWuTrRu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JmWuTrRu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso23418645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904672; x=1792509472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOqjr32+9J1vVi124S/7SAvGGyTKbIdu1NVD16e5LxY=;
        b=JmWuTrRuscNdLPUjVM+8ANDzn1TY65sBsiHzMYb7W/yOR9vc+YhZrozSw7bPoYMUpO
         TjvEoxKjcrfzdvyjj9X748nqyRA/kF3UgnF74JM8hkxwDxI6tGoDya3wY+GrAqZWZnCn
         7pheQ8ir1R1mWzpe2S5YsFmQKsl+l3Z8WnB2SCZleIZ7hknwMYJbUllRytO1v8/HCP2Q
         tkDejXRu6TCPahEd8Qkyd+xX4mSa36BqVrrHi5hEiAIAyR0jg+NSEtSywFL9/y/MNtp2
         rxCbckW9M0hrfObsYC03xN1kL4xVpKAmkzKFfk+pWDrOdlhAeQtd+9LTZjrV6PKgvVEP
         3Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904672; x=1792509472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOqjr32+9J1vVi124S/7SAvGGyTKbIdu1NVD16e5LxY=;
        b=GXGAc2XHVOt0hPlNmtTVI1uokq3qXXEpO49L38F9VLrYZ45d3L4UyK560hB4RVvrLw
         IzQePJnUweIS6+PeyRKKGRu9Bb1Sx+5Iiwc/2yVCEGxLqzxEnOrTEVBUivuH1cMqkDup
         027Fl5cvCMxR7F9+HeIKJ9rzYWthr4rtDeEVcBuXflbRcGzWvyy7d8ISRFU4jwJKZCVK
         v2AH9vDflH85e7FSOiWI32EILoUPknrr7cXmdMlr7jOs0kz2q1yjm4+WYoESuVHLZzkd
         kIgbsRzVu8hft8lmN5iVww2R64qiDD3ABvVEIOR+Ea3MSvS7PtOOm1vJb3IDHuVmKhOK
         yIhw==
X-Forwarded-Encrypted: i=1; AKwUvBzTEK5li5Rq4bixzYr2HGp/tgsbWu9whrVu7H8Z06zK4R0tYHIMkaHFY72eIhcegollQDtRMH7CyFIM+7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7CbOi+scGirwSYzF/XNHEl60z/9b5XMQpUdmNDZoO0e4PtI11
	vYSUgN/LGWmSL7v3PAGaONG0lw4CWndQHThoAgFuRsE4cs27W2LoZX9fi6SEz0t8OSU=
X-Gm-Gg: AYBFou2nnHsHV00uPlpiAcpNEkbMkHQ6CHfXdRInifxEVFwBUey+TzndJcReydobHW0
	ZIO9UCKUuar9YPWAd55aU6heHJ2PBx1MrmrHIy6St6dLd1Z8fUMOCL8z8cTqv6lq7KtB0Y6u+lN
	NXkOnzyT3GxHQG8SBqThILSC5qpafQITwgpIudC4FgO2KRyiORuVNhr8wmt+rXClDwRrJoTLoSR
	g7qPGSGSft1EFXEebBJCCPqtoQyAoUIpNRI78dn+T/Zt5R0/DR4go8Ix+bMMSjrZ2TOj0RqaxWR
	hzpIGOoTjvKlGUqm1sRw0zd6xlRYkmHIZAeoWrcxakXOBqgNvQl3dVbVjB1aIsoKm9GuTlyoRYs
	edUMzEird1HwqMuLlkl6Ri1SY6tvAGVZMxO+dwCBPt5uw84uBH86KWYXN7VvTLFl9PD9GFkN27G
	SW+I9lGoV3noxdJ//Upr7GOEpCbO5ucYx3J3p/fguB5AHwXZVBWrdz1Y3p/YQuka9K6K39y7god
	K5NdMyArDdF2ss125sWHZpHdzwBCkGgZgwf0/Hq1giQ+83nTA==
X-Received: by 2002:a05:600c:6215:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a18e4b72e4mr222323995e9.19.1791904670335;
        Tue, 13 Oct 2026 08:17:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:09 +0100
Subject: [PATCH v2 10/13] media: sony-starvis2: Add support for IMX675
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-10-3670722d250a@raspberrypi.com>
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

The IMX675 is a 5MPix Starvis2 sensor that follows the same
programming pattern as IMX678 and IMX662, so add it into the
driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 214 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 213 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index c2d4b0aab8c8..084c7772abad 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -10,7 +10,9 @@
  *         pixels.
  * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
  *         pixels.
-
+ * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
+ *         pixels.
+ *
  * Copyright (C) 2026 Ideas On Board Oy.
  *
  * Based on Sony IMX678 driver prepared by Will Whang & Soho Enterprise Ltd.
@@ -793,6 +795,193 @@ const struct starvis2_variant imx662_variant_def = {
 	.hmax_min_pixel_array = 990,
 };
 
+static const struct cci_reg_sequence imx675_common_regs[] = {
+	{ STARVIS2_REG_THIN_V_EN, 0x00 },
+	{ STARVIS2_REG_VCMODE, 0x01 },
+
+	{ CCI_REG8(0x3081), 0x00 },
+	{ STARVIS2_REG_XXS_OUTSEL, 0xaa },
+	{ STARVIS2_REG_XXS_DRV, 0x0f },
+	{ CCI_REG8(0x30cc), 0x00 },
+	{ CCI_REG8(0x30cd), 0x00 },
+	{ CCI_REG8(0x30ce), 0x02 },
+	{ CCI_REG8(0x3400), 0x01 },
+
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x347b), 0x02 },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3b1d), 0x17 },
+	{ CCI_REG8(0x3b44), 0x3f },
+	{ CCI_REG8(0x3b60), 0x03 },
+	{ CCI_REG8(0x3c03), 0x04 },
+	{ CCI_REG8(0x3c04), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x1f },
+	{ CCI_REG8(0x3c0b), 0x1f },
+	{ CCI_REG8(0x3c0c), 0x1f },
+	{ CCI_REG8(0x3c0d), 0x1f },
+	{ CCI_REG8(0x3c0e), 0x1f },
+	{ CCI_REG8(0x3c0f), 0x1f },
+	{ CCI_REG8(0x3c30), 0x73 },
+	{ CCI_REG8(0x3c3c), 0x20 },
+	{ CCI_REG8(0x3c44), 0x06 },
+	{ CCI_REG8(0x3c7c), 0xb9 },
+	{ CCI_REG8(0x3c7d), 0x01 },
+	{ CCI_REG8(0x3c7e), 0xb7 },
+	{ CCI_REG8(0x3c7f), 0x01 },
+	{ CCI_REG8(0x3cb0), 0x00 },
+	{ CCI_REG8(0x3cb2), 0xff },
+	{ CCI_REG8(0x3cb3), 0x03 },
+	{ CCI_REG8(0x3cb4), 0xff },
+	{ CCI_REG8(0x3cb5), 0x03 },
+	{ CCI_REG8(0x3cba), 0xff },
+	{ CCI_REG8(0x3cbb), 0x03 },
+	{ CCI_REG8(0x3cc0), 0xff },
+	{ CCI_REG8(0x3cc1), 0x03 },
+	{ CCI_REG8(0x3cc2), 0x00 },
+	{ CCI_REG8(0x3cc6), 0xff },
+	{ CCI_REG8(0x3cc7), 0x03 },
+	{ CCI_REG8(0x3cc8), 0xff },
+	{ CCI_REG8(0x3cc9), 0x03 },
+	{ CCI_REG8(0x3e00), 0x1e },
+	{ CCI_REG8(0x3e02), 0x04 },
+	{ CCI_REG8(0x3e03), 0x00 },
+	{ CCI_REG8(0x3e20), 0x04 },
+	{ CCI_REG8(0x3e21), 0x00 },
+	{ CCI_REG8(0x3e22), 0x1e },
+	{ CCI_REG8(0x3e24), 0xba },
+	{ CCI_REG8(0x3e72), 0x85 },
+	{ CCI_REG8(0x3e76), 0x0c },
+	{ CCI_REG8(0x3e77), 0x01 },
+	{ CCI_REG8(0x3e7a), 0x85 },
+	{ CCI_REG8(0x3e7e), 0x1f },
+	{ CCI_REG8(0x3e82), 0xa6 },
+	{ CCI_REG8(0x3e86), 0x2d },
+	{ CCI_REG8(0x3ee2), 0x33 },
+	{ CCI_REG8(0x3ee3), 0x03 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x19 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xbb },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x55 },
+	{ CCI_REG8(0x449a), 0x50 },
+	{ CCI_REG8(0x449c), 0x50 },
+	{ CCI_REG8(0x449e), 0x50 },
+	{ CCI_REG8(0x44a0), 0x3c },
+	{ CCI_REG8(0x44a2), 0x19 },
+	{ CCI_REG8(0x44a4), 0x19 },
+	{ CCI_REG8(0x44a6), 0x19 },
+	{ CCI_REG8(0x44a8), 0x4b },
+	{ CCI_REG8(0x44aa), 0x4b },
+	{ CCI_REG8(0x44ac), 0x4b },
+	{ CCI_REG8(0x44ae), 0x4b },
+	{ CCI_REG8(0x44b0), 0x3c },
+	{ CCI_REG8(0x44b2), 0x19 },
+	{ CCI_REG8(0x44b4), 0x19 },
+	{ CCI_REG8(0x44b6), 0x19 },
+	{ CCI_REG8(0x44b8), 0x4b },
+	{ CCI_REG8(0x44ba), 0x4b },
+	{ CCI_REG8(0x44bc), 0x4b },
+	{ CCI_REG8(0x44be), 0x4b },
+	{ CCI_REG8(0x44c0), 0x3c },
+	{ CCI_REG8(0x44c2), 0x19 },
+	{ CCI_REG8(0x44c4), 0x19 },
+	{ CCI_REG8(0x44c6), 0x19 },
+	{ CCI_REG8(0x44c8), 0xf0 },
+	{ CCI_REG8(0x44ca), 0xeb },
+	{ CCI_REG8(0x44cc), 0xeb },
+	{ CCI_REG8(0x44ce), 0xe6 },
+	{ CCI_REG8(0x44d0), 0xe6 },
+	{ CCI_REG8(0x44d2), 0xbb },
+	{ CCI_REG8(0x44d4), 0xbb },
+	{ CCI_REG8(0x44d6), 0xbb },
+	{ CCI_REG8(0x44d8), 0xe6 },
+	{ CCI_REG8(0x44da), 0xe6 },
+	{ CCI_REG8(0x44dc), 0xe6 },
+	{ CCI_REG8(0x44de), 0xe6 },
+	{ CCI_REG8(0x44e0), 0xe6 },
+	{ CCI_REG8(0x44e2), 0xbb },
+	{ CCI_REG8(0x44e4), 0xbb },
+	{ CCI_REG8(0x44e6), 0xbb },
+	{ CCI_REG8(0x44e8), 0xe6 },
+	{ CCI_REG8(0x44ea), 0xe6 },
+	{ CCI_REG8(0x44ec), 0xe6 },
+	{ CCI_REG8(0x44ee), 0xe6 },
+	{ CCI_REG8(0x44f0), 0xe6 },
+	{ CCI_REG8(0x44f2), 0xbb },
+	{ CCI_REG8(0x44f4), 0xbb },
+	{ CCI_REG8(0x44f6), 0xbb },
+	{ CCI_REG8(0x4538), 0x15 },
+	{ CCI_REG8(0x4539), 0x15 },
+	{ CCI_REG8(0x453a), 0x15 },
+	{ CCI_REG8(0x4544), 0x15 },
+	{ CCI_REG8(0x4545), 0x15 },
+	{ CCI_REG8(0x4546), 0x15 },
+	{ CCI_REG8(0x4550), 0x10 },
+	{ CCI_REG8(0x4551), 0x10 },
+	{ CCI_REG8(0x4552), 0x10 },
+	{ CCI_REG8(0x4553), 0x10 },
+	{ CCI_REG8(0x4554), 0x10 },
+	{ CCI_REG8(0x4555), 0x10 },
+	{ CCI_REG8(0x4556), 0x10 },
+	{ CCI_REG8(0x4557), 0x10 },
+	{ CCI_REG8(0x4558), 0x10 },
+	{ CCI_REG8(0x455c), 0x10 },
+	{ CCI_REG8(0x455d), 0x10 },
+	{ CCI_REG8(0x455e), 0x10 },
+	{ CCI_REG8(0x455f), 0x10 },
+	{ CCI_REG8(0x4560), 0x10 },
+	{ CCI_REG8(0x4561), 0x10 },
+	{ CCI_REG8(0x4562), 0x10 },
+	{ CCI_REG8(0x4563), 0x10 },
+	{ CCI_REG8(0x4564), 0x10 },
+	{ CCI_REG8(0x4569), 0x01 },
+	{ CCI_REG8(0x456a), 0x01 },
+	{ CCI_REG8(0x456b), 0x06 },
+	{ CCI_REG8(0x456c), 0x06 },
+	{ CCI_REG8(0x456d), 0x06 },
+	{ CCI_REG8(0x456e), 0x06 },
+	{ CCI_REG8(0x456f), 0x06 },
+	{ CCI_REG8(0x4570), 0x06 },
+};
+
+static const u16 imx675_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2044,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1692,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1376,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1064,
+	[STARVIS2_LINK_FREQ_720MHZ] = 840,
+	[STARVIS2_LINK_FREQ_891MHZ] = 684,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 592,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 528,
+};
+
+const struct starvis2_variant imx675_variant_def = {
+	.name = "imx675",
+	.id_reg = CCI_REG16_LE(0x4d12),
+	.id_mask = 0xfff,
+	.id_value = 0x576,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2609,
+		.height = 1984,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2608,
+		.height = 1984,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx675_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx675_common_regs),
+	.vmax_default = 2024,
+	.hmax_min_link_freq = imx675_min_hmax_2lane,
+	.hmax_min_pixel_array = 528,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -843,6 +1032,26 @@ static const struct starvis2_model_info imx662_autodetect_info = {
 	.auto_detect_mono = &imx662_aamr_info,
 };
 
+static const struct starvis2_model_info imx675_aaqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx675_variant_def,
+};
+
+static const struct starvis2_model_info imx675_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx675_variant_def,
+};
+
+static const struct starvis2_model_info imx675_autodetect_info = {
+	.variant = &imx675_variant_def,
+	.auto_detect_colour = &imx675_aaqr_info,
+	.auto_detect_mono = &imx675_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1651,10 +1860,13 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
+	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
+	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
+	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ /* sentinel */ }
 };

-- 
2.34.1

