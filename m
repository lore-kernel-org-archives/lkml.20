Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283535;
	b=ZGwoEU0crc74/IZnskYdukNCgj9Ee4Ply6/mBNLg7AkPyseWbOt1w3joOxCWdQoHfX84
	 KXsRJjSttyAwUGZcRdO6KglEGcvb0+a+bYSKhUTJkCVMIWBFaVw+/+vHi9IE/NvyS6Fif
	 HE4nFjhWI2FNe67v/1BsBJ2fk/OKLwSUqVdWoYJl3NdQLjhfZWqQ+txv+nZhnyELfuM7f
	 190NqGOBnKnxuW4XJDW8yjJWZKv3JztUinShMML0+hideGRky7CjUG0fUmle2rcClZfzN
	 Ow0RISoW4R6ysPLStKTSBnynTaCL2BVSk77UsNR4WremAwK0s7eHpRMLuJrCeHegU+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
	b=O6c1epd3SpFizDcL9UdQLWL4HLDrHAk/fnaU4T4asqlU1X+gk/Ds8jtI6KSvDYfgjDaP
	 QZudGTLfnvP3lnJlQrbwzgPlgY1upb1YKv90SXWYOnETzLxJqhGBCdlrChwFITJaUPekK
	 +z3B+qqJaRHcrnp5d6BZNmeYGdaWAkp9qIQJEHsglWeTiklyb91zj98a7dqa0aejwYV6e
	 3Ug4rySnOR09qj0Cbr9cU485nshb5rI2n7XXJEO1CGDcJErKY5lfOK4xWPV5EbtLRXkdL
	 As0MDBfsyWySTtOFQ2QEm/WYxyxIDBTjt0gPOYy4gVtP/q6CWVHUvZJOmyYJJGIHTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PP9Z8JXM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF30606A926
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF30606A926
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PP9Z8JXM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so17279105e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283533; x=1793888333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=PP9Z8JXMRv12NVbJJTOH7JX2pGH4rPkfQJ790zn8qn/xt4NThA5QhaU578TKkngdBd
         d/Mo2u325P7PiYJhXa2q3ypw/NVixIXHOVxF33dqzc37c9kM3hjxyaPEvKPmq80+2BTj
         pJBHDNHDIvZMsEZdWeXNg4etLlw6xxQ9Sgy1NWLHSuHQBXiyzuDhekpcGa0h2U0i35xB
         H95+w/KTWsBaNLYAklqzySMs526DwFBCjfHxV1nYaJwU8r3X9Bo8biui1B+997e8wGZt
         BG92KZ6XG3y7CE5l3C5bJMaBs1OKUzZt6QdQFmzZ2aLxvQJ9YiQ2WADFr0KspjgbyFja
         Fyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283533; x=1793888333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=ixipgpT3Z6dxf2p7a5n9KtYRN3Zg5z5W61vVU6UWt5eI0+5pMmVQzeArfcteRXHYrK
         LrYUiX+Sx8N7gb6VjT4jM9iFKBMSGisWOw1sf0kv1l5Rlsto+1E3g5km5jMNtfEC4qKY
         tUYtWJPn2XglYHUiY3kHU8NxLeaSt6rEjbfK13M2ar2sAG4dESoV8OAchO7WUi4/2tuy
         +BfPoZqnoHIOm3HpXxnwKd0ahoUEN6mQkTPx19DCtgajV5r3AmFJ2rSiS3ipit/PG0DQ
         wi52/ZaOw1RyicaScOHjDCsTdrrzjZuLrZJyRCLQEYFpRB1oBL4fNiLQCXAERwqXNEpm
         LfyA==
X-Forwarded-Encrypted: i=1; AKwUvBwoagBSEm8VgTdDo64j3NCCEarn5Hmujb+EB1JN35lJIhVT2cBzyyKgo72vXblxfYAnYbAzj12ULon9jI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtK+8yxDS4qDZTs3kveunj9aAPERW+W7SzfWwhxU7IwAMAiukV
	Tke7gAwT7Jq8yu48e7sIzYCI8762AK613G7VF5/scFUbrtu2wVp2yz3l0RmstLIZ1lI=
X-Gm-Gg: AYBFou1YKuznjcw9EGP/pc8Po7WTbIlaVlPiYNnp/9O86+yfvf03iCT5FQonivE2AuL
	/Wh/NB1yZ2iBxOQFe8wRkx2z6lxPzNYzpBDnHGYgiNQlwN+FnRS8SeLdJF3gf/rcA5PPWzqHOaJ
	6LwdKuBz/yfkIvo29vN504JabZkbZdvXZqfMGPaWjy3Z8M5ddDG20iE1SD1qJVvfDRlC+jVIQit
	4NfDRwj6a3oQ4LhpDvtzlJRPUglWCgnx1Tg1kSgvRxbdKSie1qJzuj+tt7BoTJBCbuNwjsZBtVi
	tX5wshaTpyAVD5N6al5HCAoQj0dWaFBD4gvJp5/mEnqQBGIPTS0+eMtB0X7UEknqyOuUrWz2bNx
	V2YUjUAk+k1XeGANmSWE7zmbxzOwBGZhp5yy7RD7XNhNFly7CkpxUv/hN+pKLUuU2J8ZBIguyXF
	SEHc4vdGBS42nKhgbt/JfAd46OGwEbW+bsFUTd1tD9vbmXhKEulvbtA5nPe2VVmr1RiX5o1dg8D
	2frW0FofnjEgcY7Dp/XI+vvwUSS1iZVjqTUC3BiwVrp/8duoTSHImWh8XcaFVbdfm42oIe4irWd
	0cCbRZokJ5MtXRPtcabUsMNw469Q2f5t2TM0KsTAH+toR95OpwXdmIDcauk6l9JfTuGs7NKXZZN
	ZK7eu
X-Received: by 2002:a05:600c:474f:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a97452869cmr128475975e9.0.1793283533370;
        Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:37 +0000
Subject: [PATCH v7 16/18] media: sony-starvis2: Parameterise the mono ID
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
Message-Id: <20261029-media-starvis2-v7-16-b33a1332fdfc@raspberrypi.com>
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

