Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690499;
	b=Uub5YSq7sZM0qmR/S7noki4Gdu21nf5r2ufIrOFOCg0ShG/SBep8S1GZq2R+5rGQPx1n
	 K4WQGj5InGTWjBKCgYpSLWannSMYEu8pu/LAdzWIGw8xGJXoVfQ7wYRclO/jYefQyIW3l
	 Dhl9h+KNyQ1V99FqqTu6DjFxxE2i/X+/66/yfL7GumNGVIVhMsG9MZp7aIX0swOytelYB
	 4BupXa0hlZRqh/EDBQvy1AI9dPzoxDiAO9IBQYB8QwUF+0ZhNjszhxqr7E7X4z8VPfiPl
	 6Vc8w7Cua/YkwLpi1McDwEkP9TXT61geaU79qtM6+uAOwNx2KQ+TGRZVcG5tn0GcJfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
	b=Iz/O3e0r7zR2gQnAWIa+KFLqYqFIIQ4fnu8bJ2kO/+hufEoWzsL/mU21xr+/fVjuWi86
	 9Ffmh+oPiKw/ZVaMeQYqxSSni8QkpZ9MxzzUGY9qOqFWOcgg0QJ/I/c31ZG0filTyrGd4
	 M7TvJXGeUHvuFPFARTxBRwtdoAOLHgwlaaiU0HHhXN2jS+kxWkszLipGaFFcHReAXAF1w
	 u77jEVEZ0KhxI7d2biEQBWrNi0yLNBOYZPY1DjWD3Nv1P7Sre4qNUvJCAbPoMXYKcx307
	 9aoFZWErA6iGGj92WVVnnA5iqxDgq4Np4DejJy0FO1bahPyuhkU3z4fv42immy9ghPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b="p0VOD7/4";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922860A6F63
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9922860A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=p0VOD7/4
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so513915e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690484; x=1793295284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
        b=p0VOD7/47GnJVee5zQGc3RUGE3DwbyRG+LM2cIYcp9MMekKZBr/6mOQNuMJ0IV3zj1
         wXCv8KfJ7zW/VREJzYTJifNZiR9K/pgxcCncQ1BDV+YwUkz4Rj8ThxJf1zc2ZskRt/PK
         4TzOKVMuzKM51YmNd7xVcG4mlu7uD0DCIJOydcBEbQBKXmBxo0yiKzUV9V2ywci/t4G0
         SytXsOnUrWGOoFVySD+ZTkmXWS3SGiBABYnYgJyRimoMCVJwhajl9X4E4+1+7u2j5/as
         gYiq88R2DFu3AqYKEearTjqkB2qimc7wWK69Yp8Z2e1D1gx25X/MWhjvrxRAvfXG7MAt
         aaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690484; x=1793295284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLYCwHkfWndTyUICgstRm5AOeTm77IFTdEwOfyWPNH4=;
        b=VyizTw6CK/XW+Xxt8PBKxlauuuGNcjoo89bNlQcUsPGkqxwIhDo9iCm5eBzbTGTeHM
         uHff7cncjkDSac3QyJEYWDtish/3WsZDRZoOZ6hKaqyRKoobw+3JrgeHYFt4h4JCnm+8
         d6Os71Twcv8v1TgZC9yjPXjW0CGOz3IbPui+c7oMIC8tQm8sYjGpyScaLYXWSGs7dAy2
         GVniJgpUh9LMY6e6G+GidSb5cz8K6aFBw2DB4O0uikYXYQuPwEnhp6nWNbuj7t0fXiwl
         hgvTZUyy+vDfCfKMW/Qdjvv+NMYaRz3xisw9dO/zSk/du+92Dou+R7npxg1CYy3NiNt1
         RV8g==
X-Forwarded-Encrypted: i=1; AKwUvByXIyp33jw1eR9LHofJHZBPfndKG5XytYEJ92cfxesvf2kJwyXfoLJs62+AoJiFi4yyXxVe6mKRuie4Ls4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+iGvvOC4qsfdiyfR4RglGgizxqlNRDOC9LLRvmWQctBnzpGUZ
	MkwLD0U/gcMy86a9P/RxkvBKrRnAZ6vlv6lfqrAINJlsfU9opYI3ijk5h6j+qLxaAhc=
X-Gm-Gg: AYBFou35VMC53Ypuy3GqyACFrhtzDtW0piTD9ReBu57zPFNNCB53KktpwGphRG/HfqT
	2ANWW/tv/37i4xUvjw8CMOJutBbH9ACklsrsJJmGuT2eaT+36R4BhQcCYKdFL9n3OnodR65cTfb
	iqNbYgoAFSJQaEJlJA6V8NMGfVUGMeLpXpL0U+bcw9H8MZ+IOsdf2KFwSX+naACwayk0fxQWMno
	ZmHQemuyeE93cDA63WDbuZRko3R6sv6k3Yw60SGAyXEX07iG5KcYZeVd9/88YD7CpLVFj/bESsW
	AJ/wqcnOKRGQCkcDONJ8PHfJKrYCgaxOg5+v7sMg5SGLuOP4BOdeXeL6Lomcd1MAJlQ1iw1O2Dn
	okg4JZsEENuurl87ju3JrM5uR1G5U9fdn2eUk6D80aiCG66p570/IpDDuS8Udf3BzKk/xcfNNaS
	kz0JbTmfoyMfIj7Dd4+1zTye5UQrOUB+PyvJ/eE5ji8yUqG4drbP6XvSKIij5YFst6xlVkgw69v
	4PciI156vQ/203oDcWHNqYJq5jsk5bflfowuhYl9ruIZZPFkEhDeA5DGJ+7UYbsDT8DdKHbnrGa
	/hGHucNPblFtYHVhmzOWuWjgvXo2OTw=
X-Received: by 2002:a05:600c:6305:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a1fdaf72cdmr116212945e9.5.1792690483983;
        Thu, 22 Oct 2026 10:34:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:43 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:08 +0100
Subject: [PATCH v6 15/18] media: sony-starvis2: Parameterise exposure min
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
Message-Id: <20261022-media-starvis2-v6-15-374343f55fd3@raspberrypi.com>
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

