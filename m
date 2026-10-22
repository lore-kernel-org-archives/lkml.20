Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690487;
	b=XKS8mHXM9qJnm9b3gJBo2WiI6MtV2wWlh84rwrqmCEmyTO6XBBjBI47yDc0f6d5dLe1C
	 KsP0VdM1ObcNhYd+56m8Ihsx7t3BcRB/bScIH0KkrhrG5GcJLKZ9bygxWQGu6qYagAdbB
	 1I2pHFQRpXz1N9SKshGnVONBc5hp4u7ve6fPlxjCqoPwTOUBhGGVyWpUbKITl8t92UqFV
	 bSucs+YlBRtcS00EiJSJelH7VtgrR23+1mWwNvn0bP9koyc14kJXXNyzn5LETZooF5L3f
	 FX8ZcU7n/weIIyOGJ7EZwow7kPnysG28xVf9V/QnY/8zR5dGi6fjV6lvdXcrLCMxLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
	b=V7/pERQSj9SZtcSKTxUkOuSLh3KgnamU2kDWMUFeMgQ2h94cPLI9DhhUfQT5YsET3GXS
	 L7T2lMj6sqFeEk0LxJ6m0bVkS5rpjL7O3PkQdas0EaHk0M9qWzHGeTyiUQONrl+gPUJ2T
	 bQ60uKUxQJj6EWQfzu3ljDQvv4AJ1JzV0801aPWNwmG3+tUjqoeyfG6ZDb10nmpOD+2fF
	 4juHkWMcienucWoTaFFL8lEqC6kmcSN8+LPNFNX1yDOtaw8mELt4eUF2pB02TBiU/+8k9
	 AWbF0fWCL/zeP9Y8FBqk1xQqK/YP5tCRxj3SseDBXtdm07CajgGrACrTEdtiBeWHwrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ccXMW09i;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD3606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CCD3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ccXMW09i
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so59933f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690485; x=1793295285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=ccXMW09isYUy4ucoPunTFXnFO/iXlPSy6aXP4EVOxAe+qe0fateYkqiy6N1AUhgjC/
         Ks1/d2sr0e/kjoLoKqnFgKGZsed1bFfxVMFHkGE6mfaXS7uEqQlJqUWvQhkIRxAV0B0h
         +SCyFrIIG+wt5OUh+ROZbCwgRxxFE64TDlaEjXE4UJP8+vHnCR+zoRDw1XqYr2FbeHew
         /4d+BBdixZykwXTHrz8PoUCVgVa7rMit/zHcJYXonnjWFKO0e59cnT2Q2rgchmGGmPvU
         9TnG0BFxQdg5lIwKYEXKiTRCR20UWIvipDKIaHASNfKeu+xX+ae4/J44eYqskzbDOfzL
         j5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690485; x=1793295285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=gFjPHYaft/gNnpKeGlpX0CWAIeif/deV0bNBqdNtUaV5KnyziNJNbm5UwZT2yreQHv
         Po/P9NNiKHuxuLQRgCvfcbkF9de1lt+ctxTzEWIkzLF3w35RoqiHSgX3vWH+Zw4k9/UD
         VmDv1882Ii6rddp3nQdf1s9hqmBqlyeCgIMqv5pCaawOGDDgWRNdNw9EB54yG/lA7nbt
         EYE3lvQZkJRCfwQ870TzD0Nzt6rSRv6Kui5tFolKHEjPA34zF0azyKZjYNE+kGIKpKVz
         eHrBXcLovnhbxzMbOLzrzI1rp/+L7fS1BiUvVlNBflEeUWQJaYOabEGUEw59y8VGvBrp
         BUxw==
X-Forwarded-Encrypted: i=1; AKwUvBzl4gJgk2Hz4he2uHeKPVyD3ty8wjvgIAx+KaMY2Lo9XU0Mg7XEc/01PE2SZqQ84OJLTO1xTUJHtckpP3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLN3O8KT3yCf9fyqFzWE1HEnSlWceeb4/tCKLs6g3o9SmPje/Q
	if10dbwY1xgJGvWahIAGDUIe5vZR4mog0IOKYAszrl7Bud8xARLqiVTBfVbBV/aQhGY=
X-Gm-Gg: AYBFou1IsRnM/pTMFH0fSpy1yNEyijsrWIT6DXbjP+jwJIx8AXO7wfOYZF+yBqFllMG
	ZCM/YpAt72OOS1cn+tdNXrYV0VHiXNffBYsVlpkn61E8txqAQ3QLniFpyMsX8IFSQoMtYf1X+Sk
	LOhKCSkyZ3uzX4SxbWhuW0bwH2Ebtp8xGRBvZxnVGhwcy7uJ+OZEBPE+vloEQNP8BZBLfL0fQbW
	Wg7t3AvWQTxP+zztSoRwOPRqhcgojUZr5srTA9U0sL/4hjzPDMpW2GC9MSpQwqyUr1DhSEq1/Ag
	m4arI2R9g7+RxyxXV4oLvUwe5LS7JNpOMLy83ln9PdoWuAAv1uUZCbkKTtFmHzJNyPRab2LcAzK
	p/N4+uy+qixvOd/IyNFUL4JTA+mHonxhtl9yzb5pdi1+ltkPTqrA1qXKbvtJlQZg2mDWHdwd180
	boAJnj5pNl6Iifl5GNFZg3igmLixu0ZYsf6wJmq3t0YRJJNZMSxdgyNF140ltLZ/j5fP+7Hek5w
	8/gL2Yrmd60luc3jUCB6xBOPjdKqv0yPINY2CxsdpuyAc/PvlD7GDhNNk26aKYYGusgUfvJUV7F
	2uTTlCxWZ9cOzFlgUvquNoVdPPb1rWYtRY2HM0dyApPVlp//YD5e
X-Received: by 2002:adf:d00e:0:b0:48c:7083:be67 with SMTP id ffacd0b85a97d-48e264cf195mr9675789f8f.42.1792690484990;
        Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:09 +0100
Subject: [PATCH v6 16/18] media: sony-starvis2: Parameterise the mono ID
 register
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
Message-Id: <20261022-media-starvis2-v6-16-374343f55fd3@raspberrypi.com>
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

All sensors to this point have used register 0x4d18[0]
to signal whether it is a mono or colour module.
IMX585 uses a different register (0x5a18[0]), so parameterise
which register to use.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 15d5a066a556..b526ea3ce2e4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -97,7 +97,6 @@
 #define STARVIS2_REG_WINMODEV		CCI_REG8(0x3021)
 
 /* Sensor Identification */
-#define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
 #define STARVIS2_TYPE			BIT(0)
 #define STARVIS2_MODULE_ID_DELAY	80000
 
@@ -629,6 +628,7 @@ struct starvis2_variant {
 	u32 id_mask;
 	u32 id_value;
 	u32 interface_sel_reg;
+	u32 mono_id_reg;
 	struct v4l2_rect native_area;
 	struct v4l2_rect active_area;
 	u64 pixel_rate;
@@ -649,6 +649,7 @@ static const struct starvis2_variant imx678_variant_def = {
 	.id_mask = 0x3ff,
 	.id_value = 0x2a6,
 	.interface_sel_reg = CCI_REG8(0x4e3c),
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -782,6 +783,7 @@ static const struct starvis2_variant imx662_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d1c),
 	.id_mask = 0x3ff,
 	.id_value = 0x296,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -972,6 +974,7 @@ static const struct starvis2_variant imx675_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d12),
 	.id_mask = 0xfff,
 	.id_value = 0x576,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -1068,6 +1071,7 @@ static const struct starvis2_variant imx832_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d1c),
 	.id_mask = 0x3ff,
 	.id_value = 0x340,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -1675,7 +1679,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 		goto err_standby;
 	}
 
-	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
+	cci_read(starvis2->cci, variant->mono_id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,

-- 
2.34.1

