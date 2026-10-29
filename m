Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283534;
	b=rWtnf02uHwkyEgagVYFZK+llZk5hcBoVDbuUHh2Qdq4YvIi2goP/vRaZAgsqMr1LPxuR
	 GOvNbpdPedRRWpTnOeBZgKCI8rzMdK2hqIaShtdrPezHMHbgcTKzzXfDNwM3qIs0xqYWI
	 kTTvFwli1luNbfboHh3ajYBeCqEuybMP1cxyl/VLy3pLD8HM/AWSyVsyCEf6cudqpyJgk
	 z3L7BalX/G4iYCyeAAo6dH1lX0ilFCyGuzQgjudpcFZaEwMwc84CVNmFk2Ux/eXvIFnJK
	 QSNmFsN9gPse/RM1wyMaKUJfruO2ZSu2DhVYEECoxGDtUp6OOX1dd3RvcesQJJPF4Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
	b=HAs5whSVrQ7N1hKzfqp7A0cz4qSaycmFPJQzBlmTxNtGPOWXO277vLQrf8OGQCIwZ4Tj
	 EyiJngH1ph02oDs6PMX297dRGKEqIFx3EZqEiM0Khp90xsJ4f8e4opBCiv8HCv0n4eHLD
	 HDVwYmKDaK/QFGZJdQG6TMEYnUup3b3g7a782ywoa/CFtdo35e43navuk3jk8LTCdPGVk
	 IoiDmJEO5emEiHs399x8WZUMkkL1yIEXTvX+H6TD9Gmc8u7mHWbG+xoGMnFlQQZ1YiycH
	 omGbuMaR5xVt3X4Tlvg/BgqultgzsM0+iU/N/aOIozxr5DM0HILApAxE1yEE/S9k5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=qyAenD7U;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67207606A911
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67207606A911
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=qyAenD7U
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso12534395e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283532; x=1793888332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
        b=qyAenD7U1JWfYC6mdM4EqSFF/f1+Y9d//m7euYPHBInTSeSh1DDKUMqOHwYq4tllA2
         67ueDt+/M1gJ4/V9DjwtmrpZ5G4nwhI2hSy8aml3AMKtdNJ4nVNdZjSPPtvzPGG1PUKG
         JlWZhMItvGs27gK6qOocRrFce2QExMqObcDqunqFHa6RQ5yCcuSAGG4srKdE7OXwPI1W
         raF8QrqiB+/wiw61ojEwCnkFTkxxjoBUMG9sMgq0lZ5y5eboTpYE3FYw9MrZRTlnavp9
         w4JEyKTNR5e8G/fncEnUKoW36D16Xb2Be5qHeaGMfX+PHlZ82NAIw++A2ULpHlVd2Z/b
         I05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283532; x=1793888332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
        b=2FHj8skSQePDzBmk12NBfAW8IRMGwzmBKsQYca/rXqXRafFRwYJabvr8gFCkItkdIF
         KOzlW5Y5uw1ST4FjUukGs6hnpNlGhoWJiZdQEWIfZakrECut/+HJxd3J2k05o5whfo3L
         bQcY7NWZuOJZcWLXeno8lZx/Grs4NxBafyBw+c9xgWLH5kdfJTZzwco3p2srVcClh60d
         A73NWmvbUWSlBLP1pLSo/SKbS1eQJN0x1uC5faIHIkhFgGWk51UB6hN5skt6ty/8cfAb
         htst3HFAIdZzH3z3ivaAlkop59AHD+uuYLA4yV8U5VjXb78VQN8z8+g7iuYMZTaW3MtJ
         5EVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9l/ps0J1Hz0hy34PiDFqdaXi5rRnCLx5VmWBcZA2TH2+KJxrPzXjQA9GKR7wDGlapAF9ciRgAnCwJw6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZO0wpPbbUAUZ4090ALSpTJJcQry9v2LAWtvzL8CNuSXDJEy1V
	TFdIYjgAPt/1Fy1tk5X0c2hMWAK3HmT+08mDRO7x1N0u3WUfDZkZ2aonRv3M2ce83vs=
X-Gm-Gg: AYBFou3syIcGny76SLhN7AyWbpT0ZUN4ClYUlaR7F91wWnKw58Lvn7KD0DLdcryJCO3
	jhBFF82LALx/gnz+yNKd3EuS+8ziAFdLwu8VM0xdcxqC0PeoLcYbVzUVjEgUMhrG4nv9V4oSvLs
	Wnc/RkloKawZ4tuM0Ci2j2sJSFdslCkhTufD6jqGbKLy9GJVsFB7JudN+8J7AotHwJKYTRB7x6v
	+4pbgRPJNSXIK1YLrnJzbSkExzDMppuQ/RT56zabe/naOq0fXnbG2RJ5N1tzXj0gKE9cDsBCdN3
	VYPuu61t5hyZAPZmIXT6cyugs2/hM84cRX+S6SEJVCCDantqKLQ3XWBY831kfh70KL1ryFbvFc0
	fTQkJPkaIVhCOkOFuPDDoJ2h0uAca+dd0dpE9Ptxe6Z3534aYHq6ZKJSaDEcyIPN9PN7wjaLcSo
	jVGBnWkFipkSQcjbOWJqyAIgt1/5Ml8cMscwAF4AZR9ExMtXRIfQhbESSjQFeWA5UPKYclC2Ln2
	PtSEtABfur1eefvpIzHloqH3CsATc9xRTlzVYaIw3LM6X9+uznJwjpP1kpZ1vS4PpWaCnGOkZVi
	JMzJ2s7mCoskXioo8iiffje1G/jNcnhkMLaq7jk6QotRkpsEG2a6lLcaoAHe55ZsU6objeveoxI
	T76tq2zOmJ5oIP6nJEfUelZDiqw==
X-Received: by 2002:a05:600c:4687:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a96552db93mr128360465e9.3.1793283532552;
        Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:36 +0000
Subject: [PATCH v7 15/18] media: sony-starvis2: Parameterise exposure min
 and step
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
Message-Id: <20261029-media-starvis2-v7-15-b33a1332fdfc@raspberrypi.com>
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

All the Starvis2 sensors supported to this point have specified
the range for the SHR (exposure) register as being 4 to
(number of line per frame -1).

Newer sensors are deviating from that, so parameterise
these into the sensor variant, replacing STARVIS2_EXPOSURE_MIN,
STARVIS2_EXPOSURE_STEP, and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e64d943369b1..15d5a066a556 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -68,11 +68,8 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		1
-#define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 
 /*
@@ -641,6 +638,9 @@ struct starvis2_variant {
 	unsigned int vmax_default;
 	const u16 *hmax_min_link_freq;
 	u16 hmax_min_pixel_array;
+	unsigned int exposure_min;
+	unsigned int exposure_step;
+	unsigned int shr_min;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -668,6 +668,9 @@ static const struct starvis2_variant imx678_variant_def = {
 	.vmax_default = 2250,
 	.hmax_min_link_freq = imx678_min_hmax_2lane,
 	.hmax_min_pixel_array = 550,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx662_common_regs[] = {
@@ -798,6 +801,9 @@ static const struct starvis2_variant imx662_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx662_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx675_common_regs[] = {
@@ -985,6 +991,9 @@ static const struct starvis2_variant imx675_variant_def = {
 	.vmax_default = 2024,
 	.hmax_min_link_freq = imx675_min_hmax_2lane,
 	.hmax_min_pixel_array = 528,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx832_common_regs[] = {
@@ -1078,6 +1087,9 @@ static const struct starvis2_variant imx832_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx832_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 struct starvis2_model_info {
@@ -1249,12 +1261,15 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		starvis2->vmax = format->height + ctrl->val;
 
 		current_exposure = clamp_t(u32, current_exposure,
-					   STARVIS2_EXPOSURE_MIN,
-					   starvis2->vmax - STARVIS2_SHR_MIN);
+					   starvis2->variant->exposure_min,
+					   starvis2->vmax -
+						starvis2->variant->shr_min);
 		ret = __v4l2_ctrl_modify_range(starvis2->exposure,
-					       STARVIS2_EXPOSURE_MIN,
-					       starvis2->vmax - STARVIS2_SHR_MIN,
-					       1, current_exposure);
+					       starvis2->variant->exposure_min,
+					       starvis2->vmax -
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
+					       current_exposure);
 		if (ret)
 			return ret;
 	}
@@ -1778,10 +1793,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					       V4L2_CID_EXPOSURE,
-					       STARVIS2_EXPOSURE_MIN,
+					       starvis2->variant->exposure_min,
 					       starvis2->variant->vmax_default -
-					       STARVIS2_SHR_MIN,
-					       STARVIS2_EXPOSURE_STEP,
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
 					       STARVIS2_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,

-- 
2.34.1

