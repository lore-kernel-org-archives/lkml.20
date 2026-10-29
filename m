Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283537;
	b=XfGDGe7tlyzAeiDFN4dlBNneRxAI08CsQusKe1Whk/v4ZfQVKJRubzP3Be3kxPytEr5I
	 BdEVqmzdnsFsbUJoO9iS1tjEQ5U7bGCATKQF6mrgOOzaJommszoqYnuBFzkj3SbX2fAjx
	 hEL6y7pGvh690xMhUi1nyLMBGrvBOHPC00KCE5Dsq28KslbzEXJUhveQM3bUol9RGN3ly
	 lmJDLj+KHPJ3TcsApl/aPkAN6gMGyP4nIpYqoTdeaqxvasGA/h99G+5/p17j48kYyQl+8
	 /wv0C/b7wYr+tJmlQsXTi/oR1JzsTmr6hLbar3eMvId21kyGJLWy94zEebHHJ9A7jmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVaQPkVo6/j38OO1bxDSb/ojTMxBSrDABnO3LWwmIA=;
	b=j0wipd/TX3ne4+c0PPUx/EVhL7C1fqkUUhZAYpkye+2W1fqfyiYmjxhF4SI0CRtaFccv
	 vfCKiaOCOZizAJglJzLTKU28Gt/8I5o7F1NNrmi+F+M31e/7HY0aakCivGanms4OX+8+7
	 GF01iMl/fQJHwJAFUYx7EXY2yq1EuuVUHNO5ttUi7M7lHudu/H4GLQejyAwyO0iq+oKQx
	 byWsTxQVXxl3M3wktPZstU/7prwoBlisKRSBteR1OvVZSlprbxKI5UUKwILtCBTpB2odB
	 qDlrj9iHt0SHWxMOhP2hJfZinW5faCBJpqO8QKkiprntn1YLtLKoyWLrdGXu7/81eRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=FWdz0nYu;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79DA606C454
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79DA606C454
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=FWdz0nYu
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so17279825e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283535; x=1793888335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVaQPkVo6/j38OO1bxDSb/ojTMxBSrDABnO3LWwmIA=;
        b=FWdz0nYuSYAlNRclQpi0w9s4vHMcawD/YSU/OOb9SjbPH/hcl6kHd782UUjDtiqpTk
         wZI4hbnj8hEg0WkTXzpwt+zlydSGZe9LV7xPCFMfkhXefygtIJf25wz01iX7h308arxl
         lV2IwPd9mUbTCPnt57XR20/x9f7H3BSb+zUK3Sd3p1E5Ga9pwqqpfRYN7Ljt/eLTV3jn
         0bW7btyFdPQF+9Hfw75z+wQ2SfSIja6zpbe5dMIOQ6oWrONkxqBTHUQttpo3jYjLcWxJ
         AfG+5xmIlgA2wzlPjHPFZ6/NGfMUNWi9AodQDcASZEuVxqMYVA4OjVYnCkgaLgqPcdrX
         dDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283535; x=1793888335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVaQPkVo6/j38OO1bxDSb/ojTMxBSrDABnO3LWwmIA=;
        b=Vn+Lo0zYMthsFDOZ6IRvQmQMbuIRIDd3UBV+XUGPE3Ehxc6Wlu7OqwMtczWfe4CFPO
         utA/M+cC9+LGbQ/FlcWpbx0QPLgY+Pu970JAt81Ukgn6GdjtDz3Ij4H/dGwsOfhe9eGw
         w5T1qOvc6Nrj2yfrkTU5qposxJ6mveviTAdc20IA71G/QVoT+zB4j2AtRc0v13syYEDL
         icOPVydsXJOqkGPulWVcHAZkH6g0wjkKlAy75SdzfVEYRfS09Cjt8PDpWyel5HVpDB0i
         wNjQPfg291Jw07Sm0rz1gs4/EyeVdo6MLlwXUOzvjmKgBXAJMiCXZkZKpD0PjGeX2b/a
         iS3w==
X-Forwarded-Encrypted: i=1; AKwUvBz/TPiNqlF8byNRxphvrVXmai0jeisUIDHDLXDgzYqEQIqfepESHyOVQIzPu0uWwHH3nmO1DaS4PD2foyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF1uXHO6vEzjjQnqkT2JQ9VcA0EvfekzC9Yz5OarlivSzJXDoe
	91tr7eYXtYvFyeTWjZr4ED25TKJYUaWE8YuqtxUi45GLr1exIsGYtDajT70EXu7l7Zo=
X-Gm-Gg: AYBFou1xCrVa1RaOyfZwZd+F1lq+wUrhCSZXkoUDwBGI6ciblJZ/Sa1fcAWnltMBjJ1
	wD8JxExCPhVDwhQhzp68hTjJtCGmAaWvdMaBzBZCl07If189H6P226NF6Izz8V54Jei8+IqAXuA
	jHZVLZuazA8BL/xUsqT/cX+LYPZynGsIc4aJ/K7PMBNzYClOY61bDLgodKCPOZQpOJxLHiN4630
	9Go7L/vJ8/sPMR2sSTfeGfGcTZR0TrjlfUsP8Lei3WJ+nL18s3jqzj+PSHUk0LvswQEdGXo+nU0
	kXkriZF0mWt7DVXyQlzJFJhAC68dKBH0TLJjVXcOWInamyqe2x0Gpo91TvIW5y0xUePFnSFzZag
	ShS3kz3BvZV35Eix/dr25CmNjSFgMjEJAq7BNfVdOg+84jznqXAID0vrLhNU5acx5wv8hXYf5Cu
	YQS6pfQ1qOGGsqWFH/D2WMAMLHl1NjDRPGgsYa3gbnliBzrj3cqFNOzr/y9W3eYTVAENfIbLRvx
	cshtFN8Di4Xtp6q7/xmrIDwV+5dz3/IhyzXnh1AxULyR/M/qRcOCU+o+Hh9qYg34bi2JGouYN89
	fh6wL/YM9UUEy1lKMtzzVEJHWNGseOZEtd4JuvoJRO9GOhe7/ai9z9f/VGP/JlUJaX5CPjhviOa
	oHlSE
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr88082325e9.16.1793283535103;
        Thu, 29 Oct 2026 07:18:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:39 +0000
Subject: [PATCH v7 18/18] media: sony-starvis2: Add support for IMX676
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
Message-Id: <20261029-media-starvis2-v7-18-b33a1332fdfc@raspberrypi.com>
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

From: Jai Luthra <jai.luthra@ideasonboard.com>

The IMX676 is a 12.63MPix Starvis 2 sensor, so add support for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 198 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 5c407211edc8..ec74b00b0f4e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -16,6 +16,8 @@
  *         pixels.
  * IMX585: Diagonal 12.84 mm (Type 1/1.2) CMOS image sensor with 8.40 M effective
  *         pixels.
+ * IMX676: Diagonal 10.04 mm (Type 1/1.6) CMOS image sensor with 12.63 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -1380,6 +1382,179 @@ static const struct starvis2_variant imx585_variant_def = {
 	.shr_min = 8,
 };
 
+static const struct cci_reg_sequence imx676_common_regs[] = {
+	{ CCI_REG8(0x304e), 0x04 },
+	{ CCI_REG8(0x3148), 0x00 },
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x347b), 0x02 },
+	{ CCI_REG8(0x355a), 0x1c },
+	{ CCI_REG8(0x3a3c), 0x0f },
+	{ CCI_REG8(0x3a44), 0x0b },
+	{ CCI_REG8(0x3a76), 0xb5 },
+	{ CCI_REG8(0x3a77), 0x00 },
+	{ CCI_REG8(0x3a78), 0x03 },
+	{ CCI_REG8(0x3b22), 0x04 },
+	{ CCI_REG8(0x3b23), 0x44 },
+	{ CCI_REG8(0x3c03), 0x04 },
+	{ CCI_REG8(0x3c04), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x03 },
+	{ CCI_REG8(0x3c0b), 0x03 },
+	{ CCI_REG8(0x3c0c), 0x03 },
+	{ CCI_REG8(0x3c0d), 0x03 },
+	{ CCI_REG8(0x3c0e), 0x03 },
+	{ CCI_REG8(0x3c0f), 0x03 },
+	{ CCI_REG8(0x3c30), 0x73 },
+	{ CCI_REG8(0x3c34), 0x6c },
+	{ CCI_REG8(0x3c3c), 0x20 },
+	{ CCI_REG8(0x3cb8), 0x00 },
+	{ CCI_REG8(0x3cba), 0xff },
+	{ CCI_REG8(0x3cbb), 0x03 },
+	{ CCI_REG8(0x3cbc), 0xff },
+	{ CCI_REG8(0x3cbd), 0x03 },
+	{ CCI_REG8(0x3cc2), 0xff },
+	{ CCI_REG8(0x3cc3), 0x03 },
+	{ CCI_REG8(0x3cc8), 0xff },
+	{ CCI_REG8(0x3cc9), 0x03 },
+	{ CCI_REG8(0x3cca), 0x00 },
+	{ CCI_REG8(0x3cce), 0xff },
+	{ CCI_REG8(0x3ccf), 0x03 },
+	{ CCI_REG8(0x3cd0), 0xff },
+	{ CCI_REG8(0x3cd1), 0x03 },
+	{ CCI_REG8(0x3e00), 0x1e },
+	{ CCI_REG8(0x3e02), 0x04 },
+	{ CCI_REG8(0x3e03), 0x00 },
+	{ CCI_REG8(0x3e20), 0x04 },
+	{ CCI_REG8(0x3e21), 0x00 },
+	{ CCI_REG8(0x3e22), 0x1e },
+	{ CCI_REG8(0x3e24), 0xb6 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x10 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xb2 },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x4c },
+	{ CCI_REG8(0x449a), 0x4b },
+	{ CCI_REG8(0x449c), 0x4b },
+	{ CCI_REG8(0x449e), 0x49 },
+	{ CCI_REG8(0x44a0), 0x33 },
+	{ CCI_REG8(0x44a2), 0x10 },
+	{ CCI_REG8(0x44a4), 0x10 },
+	{ CCI_REG8(0x44a6), 0x10 },
+	{ CCI_REG8(0x44a8), 0x4b },
+	{ CCI_REG8(0x44aa), 0x4b },
+	{ CCI_REG8(0x44ac), 0x4b },
+	{ CCI_REG8(0x44ae), 0x46 },
+	{ CCI_REG8(0x44b0), 0x33 },
+	{ CCI_REG8(0x44b2), 0x10 },
+	{ CCI_REG8(0x44b4), 0x10 },
+	{ CCI_REG8(0x44b6), 0x10 },
+	{ CCI_REG8(0x44b8), 0x42 },
+	{ CCI_REG8(0x44ba), 0x42 },
+	{ CCI_REG8(0x44bc), 0x42 },
+	{ CCI_REG8(0x44be), 0x42 },
+	{ CCI_REG8(0x44c0), 0x33 },
+	{ CCI_REG8(0x44c2), 0x10 },
+	{ CCI_REG8(0x44c4), 0x10 },
+	{ CCI_REG8(0x44c6), 0x10 },
+	{ CCI_REG8(0x44c8), 0xe7 },
+	{ CCI_REG8(0x44ca), 0xe2 },
+	{ CCI_REG8(0x44cc), 0xe2 },
+	{ CCI_REG8(0x44ce), 0xdd },
+	{ CCI_REG8(0x44d0), 0xdd },
+	{ CCI_REG8(0x44d2), 0xb2 },
+	{ CCI_REG8(0x44d4), 0xb2 },
+	{ CCI_REG8(0x44d6), 0xb2 },
+	{ CCI_REG8(0x44d8), 0xe1 },
+	{ CCI_REG8(0x44da), 0xe1 },
+	{ CCI_REG8(0x44dc), 0xe1 },
+	{ CCI_REG8(0x44de), 0xdd },
+	{ CCI_REG8(0x44e0), 0xdd },
+	{ CCI_REG8(0x44e2), 0xb2 },
+	{ CCI_REG8(0x44e4), 0xb2 },
+	{ CCI_REG8(0x44e6), 0xb2 },
+	{ CCI_REG8(0x44e8), 0xdd },
+	{ CCI_REG8(0x44ea), 0xdd },
+	{ CCI_REG8(0x44ec), 0xdd },
+	{ CCI_REG8(0x44ee), 0xdd },
+	{ CCI_REG8(0x44f0), 0xdd },
+	{ CCI_REG8(0x44f2), 0xb2 },
+	{ CCI_REG8(0x44f4), 0xb2 },
+	{ CCI_REG8(0x44f6), 0xb2 },
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
+	{ CCI_REG8(0x4604), 0x04 },
+	{ CCI_REG8(0x4608), 0x22 },
+	{ CCI_REG8(0x479c), 0x04 },
+	{ CCI_REG8(0x47a0), 0x22 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx676_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2744,
+	[STARVIS2_LINK_FREQ_360MHZ] = 2277,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1854,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1410,
+	[STARVIS2_LINK_FREQ_720MHZ] = 1176,
+	[STARVIS2_LINK_FREQ_891MHZ] = 965,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 838,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 743,
+};
+
+static const struct starvis2_variant imx676_variant_def = {
+	.name = "imx676",
+	.id_reg = CCI_REG16_LE(0x4d12),
+	.id_mask = 0xfff,
+	.id_value = 0x676,
+	.interface_sel_reg = CCI_REG8(0x4e3c),
+	.mono_id_reg = CCI_REG8(0x4d18),
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 3553,
+		.height = 3577,
+	},
+	.active_area = {
+		.top = 24,
+		.left = 0,
+		.width = 3552,
+		.height = 3552,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx676_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx676_common_regs),
+	.vmax_default = 3940,
+	.hmax_min_link_freq = imx676_min_hmax_2lane,
+	.hmax_min_pixel_array = 454,
+	.exposure_min = 2,
+	.exposure_step = 2,
+	.shr_min = 8,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1490,6 +1665,26 @@ static const struct starvis2_model_info imx585_autodetect_info = {
 	.auto_detect_mono = &imx585_aamj_info,
 };
 
+static const struct starvis2_model_info imx676_aacr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx676_variant_def,
+};
+
+static const struct starvis2_model_info imx676_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx676_variant_def,
+};
+
+static const struct starvis2_model_info imx676_autodetect_info = {
+	.variant = &imx676_variant_def,
+	.auto_detect_colour = &imx676_aacr_info,
+	.auto_detect_mono = &imx676_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -2335,6 +2530,8 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
+	{ .compatible = "sony,imx676-aamr", .data = &imx676_aamr_info },
+	{ .compatible = "sony,imx676-aacr", .data = &imx676_aacr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
@@ -2343,6 +2540,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx585", .data = &imx585_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
+	{ .compatible = "sony,imx676", .data = &imx676_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }

-- 
2.34.1

