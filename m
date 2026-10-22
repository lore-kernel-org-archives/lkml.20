Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690478;
	b=5XO+0M5ofZ2ySu/xpy8GxUp4tHINVYv+I3akPq3+zWPREnNg4k26bo/1Sk/VmFcTIwKc
	 JTeA00xhlC3xCyAGrQ4Fm/9/bbTrOl+WOzjBBA/WXaGh2AoNE70BCEbBETkAIE0OEhAzp
	 W9EFVd4EZQiK6nsg8Bln59PivgxFZi96YvldUg7My1E2RFauFAsXGX/n+pGv5W0NKyv9d
	 4vzd45l+6i2Ow0h7MYY44lpTgYw3lUBp/rHhZzbicv6B8J3tbnRv9RsFFeKYqkg3u9q+r
	 S1Vqy+DwXHA8ecGKD+LEZSutYFlxstLnscPykkpfG6kb6+jZmJ1pd0BOLcNVWRaQcpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
	b=KXwyulSLjjIqn7fxSzr7WVph2WIN7/1nluSE4dZt2nrXyYdnwgWDANOiFCzfl8ZfJjpq
	 GIiKWLyB1CO0rpCheRgI3MrFK/pyZX+63oSMywvpUEcvDBwGsR0vFmu7+/2KMuUm5Xj+4
	 aaJA41vkoXzN4iaeBSatlxiXw38T4cR5UyxaD17qG3j6sivDP+796CeqHnA+pbV6jVRBT
	 KWfmbJU6rt3A7oXGOu/UsCid9yS3VLNDabAr0IF3L31Gab2sbMsJfVXfztFH0thGA3dgJ
	 MojDBv9l1EHH+ymPu49pK9wX/QOcKQ5XyCqcJBHEGeXcK2T4UsEARvm45SRi+T0HL7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=GuSzEIZy;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459360A2617
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D459360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=GuSzEIZy
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20803a757so487525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690476; x=1793295276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=GuSzEIZyN7jOQxTJ65Rk9qi0lbnn8bP/ve+H7SjgcOlVqiBy1i6cOhzLImlATHmmZS
         B1YWxP1QHNsIzv0uYQtYUZ62IeIUtdlKvmCQBVtqH4qKRujPFt860Jemstx0U39zWEWW
         aMPQ10bQpsgLub8+5dtEwNCMljs5IaMW+yB0HXR90DbwqXy+K2z/7ggG+A5wZIPxW9gt
         kFbMqmd1ru8FFYo+lDq1W1+CQZBDSMfC23uGDRCe0t2iNZATbjI+QNj74EsdexkMEeaZ
         kriBCRQxXskyoIGUXnY+/vY0nJ5QrydHSDx4NGDWx/BB7FtoQbDP349bg7ZyHeRtfyt4
         ttUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690476; x=1793295276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=aR3Fr9dPKGEkKki76gvkZeyu+pLXEKJlyLO3si9C+7llFuFZDuRPCY6iTss9HGrKoX
         9DS/Cu1aMQu4WtDo11DDq4U3hZeV75H0nR4zYvZVIcpJ7gPkC7Zr9yc3wNAQkNd8i0vy
         FG4OuRnTQG80HfGs1vuGGM4BxigQ7frOyzvzt71uJi7MD19iUIF8dXy7ekiuVX1GMtlk
         BCOARrr5KQhT0DlZVs8f5PYgCm+HkZVxE0AELoNHLLxeZRwJLgJ4wXOzJwc0LxOiXY1p
         heJ6thpZiGnOVBmpZQrXsBSP+DVA96PuoMlBiuHwjBsMVx1VyUxBmMIQkU3r5cKRnhtm
         JDyA==
X-Forwarded-Encrypted: i=1; AKwUvBxfuRO3wFnMTL5dCmLNn6H5WhZcwxBlYNBbECtmKv0YT39/yKUdxY8TM7vRKZ+OSuHLJyJohNsRSte+hSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeh8HN8oeG0gXjCue+4ViTzBkm9FdfywsgdqRgmFww4GQRBxzi
	Ju1tnmBfVY1ab0CF0dbbZlK56FKrUzlu9tNOjKz4t3bNyZ8Ugq/eAzf8DbBsTVfgl2c=
X-Gm-Gg: AYBFou2m4yuZSpRfTWAJXW0/dyqy5qANvSP7QHKmMSFA/dUM8pVHOjb3A98Z7aHeVH4
	bPKXf/ke21OYrLSKZENZKKkkNnW23rLiKHP1VZMoWjwpJI4kfq8W+zDnGZJrkd/pcxfcSHv6Tpa
	91BIpt7W8iMe+DGxhM9YmJUs2coKCD5LWANzoALpl1oNUB4hAFAMqXdJI+xxdbKX+ZSLqOfKNyV
	RnYhnMoFP1fIfHqQCKZPWyS4s5HfNCOxGL59IitT7LHeHyC6q99CEbc5dtMdViNGpmeYwG+7CMk
	zUKFdc/NgBwkODnHydueG0PtF7v+Xfc207+UCxQPi1geWHJLtOEU1poQk5ujjuWIDV2V/PYpzKf
	EbudinSnSr+YurImttf4c0uiQDtdIF7E7f24MR/iXWQKEQbgY7ieXC6TvO84PsEk+BUGwIbHQGZ
	yoxmywdyeSKfOnNd6AyAR0nuQLNyeuwstokFZH4E9DFYq5kHudDsYrYD3oVobGFgkW2CuYoIXmw
	XclNHlMypVDaUyIrICC4xr1A3O5Y03P0x6EVUTUOdxZq0pCBUzOESq1/ZhqvIIGRu2cPJCcEAUF
	MR4bfSHvSSU6eVq42vTMHKGwIS3KuCs=
X-Received: by 2002:a05:600c:13d6:b0:4a1:d2e5:aa35 with SMTP id 5b1f17b1804b1-4a1fdd2344emr84423855e9.19.1792690476284;
        Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:01 +0100
Subject: [PATCH v6 08/18] media: sony-starvis2: Put module into standby
 after identify
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
Message-Id: <20261022-media-starvis2-v6-8-374343f55fd3@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 84f3978e1eda..95da8a9e671e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1162,7 +1162,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1170,14 +1171,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1185,7 +1187,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1207,7 +1209,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1

