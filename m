Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186537;
	b=XBXZU2bv1KVfMSy5OCclcS6ZYrvST8O35xmad9oVUyly3ND4noMWj9/1Uxfo0U3R3Ti4
	 ciT8bfgrEJle6AzsU3T57TiAjECgHXCXslELLD5z3hq/bFmuIG3OfbZrLuyGu+lWG+oKP
	 gMTGrZbIoxl6ogiodr96Y/1aFUxmmJOR6UnLjQka7ltMvTpuKvkBrSyYtTucIKaXZMFjq
	 6Y2zbf1yI2aaAPi4KBIjnSgElxi9qCEU8Eieu4gKPRik6QqbREkKVUlOabnpshVAWYUb1
	 W4TP3HRnqIJPiqAeLhYtpErhzAdiMOGl9QwPxDHGohErVeE6sitxpVjJgQ4CUkXKXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7HveEJ2C4RUbIkJr1+d3vrT5XPh0GNrPluA7ej7bKw8=;
	b=fBIBf2tNeFN5x0Y0d/Zq2bJndHmGlMRnlj3YUbKqqylqA1ObEF8FzExxvP/mXZWFNyVo
	 zYKlkR3CBAX4S8DEwqM9gxBco8wW8zxrUkkFM5hQI2XPufx3J/4WqNW1K7MgJfoPLu5P9
	 HZBFLBpB0avG3pw10CkCtgOEF+KmaUIYD4b5m2Wc0HlnZ4yok+6b6rq/IfcuEJZcwQ4BO
	 6D6sCNi9QyBKp24C7OGPmTv399mGTUhTtLkjUneQvqMzrrZrgfIajNuLnJl0dPFtwMflE
	 2fX3qDEP2wpkICBL8NZ1WXj33mqUpYdqwHduVboEvgTUY20c+KeHwMfouLrwrKGl9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXvvWg7c;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6792606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6792606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXvvWg7c
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so2022195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186536; x=1793791336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HveEJ2C4RUbIkJr1+d3vrT5XPh0GNrPluA7ej7bKw8=;
        b=FXvvWg7cyjsZ8/5TSFJLJVrKqw08jFQAqnklg6/EMUazs5Pl39g8Z3FPE/2sTUKN/J
         koJXODjeq1hl5OSG72+c/9U/Lh2kT/sfZA96qoS8wNYbdQ6RRgE7jLo+QEQ2mub6uNC+
         CPOhXXghOaAWR2a51WbOMTt1xTPkMU2HZT1qq3Fx+KufhekdnkjVuPVO0zpTNZmcJtN7
         cR6lkVSRh3HB11k5dGbA3+L/cVqwy9sCSV95B2dAETsaM8xTgAdOmAQRGwinsicikthR
         brctEmKmQw3RcqZvqGjiUozXVZqh6PsiN6CyXhUSCsv4UhULHJMYX71x5e3jVvzpzh0n
         wnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186536; x=1793791336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HveEJ2C4RUbIkJr1+d3vrT5XPh0GNrPluA7ej7bKw8=;
        b=IOy0VwCv/SdMGf/d5zBo+Jl+lAdP6s2JsHJz5/V4rDCyhMwywdh9iH+nFfnw85Ki4s
         4YQaKNunVKEAv4McUCn5oHAKMQDcGZpkb2/G3XuxrUleSn5NvDfdVOytU21kNOG6K3i4
         r6wtiqIfBrRt0h8xGQKlHhyBMwTQCyY6B6TytxY8eiXTLKHOeV1IOrFCpS5yaFqgR45F
         rSi9vRNtvzq1ipVtXWi7FJz1SlraNrsOBhgtrrM/q+mHsZzyueBhlt88CxN3QwlNsk95
         DVk2U/k6dXcU7/Gi8iO1+KbKqsAqGYj72ZkLIU5sswo+jBlawVpghXxaDiVvMhwFiRbR
         i73A==
X-Forwarded-Encrypted: i=1; AKwUvBw/sgvjjKdIBpfqiEjIwO4hXkCR6kvnS5LFwAMpuHxeVOcHOIQ8zuZCj9QIL0KJrmjAMn8UNlbdcNabjz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu8F1Ls/dd5qru/npCHDo2x+50TqlCsLKRd2wVCk6HzZkVXkkj
	vRe7Qw3zVm8dfenaxkesn6p4r/0yVN7Tn9Iu9mucAIxVA6Ln2v2GQpqk
X-Gm-Gg: AYBFou0jU1XXhKJCKklSQN5sCehJjxDN9Rohh79O2lVz+6ZXcg4r7LD3ANXXQgkQfgb
	W11cK1Mb741JjKTSmscP4b4SBBwKxydwnh/WZr99+gDYlz/uVBckdNGpI3R5k6xkP25zN2avDba
	ekkd9J3HUvaP/Oxu86TFdicLyLsMO+JFQaNZQXTibT2UPqgAZjyhnCdDeqpj1N9PH3B3LV2rodW
	NvKuGFVPT7Sm0tEyf5TON/rpVMC1LrY/IerzqkA18BS9NiVegd+31aPwtc8aMbcrJaR+vVza9SD
	aUWLmRoZqYbUrYKmQPxxdjiL4C60cq8bT8iSL4VzaT8p4RbaS0cGEotznFoan0iDuYpNqR3fftU
	jf5pehEg3IdqzCa4rdr6hJvNKD2iLW8S36AUHTThvxT8y7wMSCEn4PkmGjplmCdOHnOcrFyw0OX
	YRMntWZOs15f7TopdlA66cS6Mgq54BYUXRalxD5WmjfEY2c2iQynU9y23j52uXbscFGhgu4avWY
	VrN4+oitXWU6PbLxe9ybThs3TuPLKpoQh/uuaQ+b3O3SAABsJK5dU+ljNjEeSIniCDUYCInN7ZO
	mQBFDTlzVHSAVrwt4IlUPYCAj3PUpYCvSiuUZo6+VDDAyTBPRSj5dLSUKDW9k6nZf76riE+Wo1i
	QafEP0ZhmHpF+gSjQHp7IGyTFS3GV1QHbpsNPos7f8Hfcm0tOjxx+aBCkeKH5qTCe4Rl9Gz/IWS
	2fShwE0haxV3DnF3N4Qcw=
X-Received: by 2002:a17:902:f607:b0:2e9:5714:607a with SMTP id d9443c01a7336-2eb002be8a8mr33330655ad.2.1793186536102;
        Wed, 28 Oct 2026 04:22:16 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:15 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] media: i2c: ov7251: Add orientation and rotation controls
Date: Wed, 28 Oct 2026 20:21:51 +0900
Message-ID: <20261028112154.855185-7-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse the firmware device properties and register the
V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls, as documented in
Documentation/driver-api/media/camera-sensor.rst. libcamera uses them to
place the camera and to correct the image orientation.

While at it, bump the control handler size hint to the number of
controls the driver now creates.

On the Microsoft Surface Book 2 the ACPI _PLD (via ipu-bridge) reports
the IR sensor as front facing with no rotation.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)
---
 drivers/media/i2c/ov7251.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 8277e28ac645..d591b9169de8 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1512,10 +1512,16 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	const struct ov7251_mode_info *mode = ov7251->current_mode;
+	struct v4l2_fwnode_device_properties props;
 	int vblank_max, vblank_def;
 	int hblank;
+	int ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
+	ret = v4l2_fwnode_device_parse(ov7251->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1563,6 +1569,9 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
+					&props);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.56.0

