Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537713;
	b=UhcdkXIJgrNUV8feVbmsVDkv7v9eZ8gD52aVnZMkGDDV4kikAT0vZX3GN1PZPnJAPZsX
	 oWcMIBo2rPWSuM5ibIsuctw5PkZC/nDd08lQMR6HwZxV5h1lA+GQt7DBsvPY6SnWFTq3+
	 tidcDq3rHeDrzKArJrVaZVocVzKrXaFHBUeKkRMR8C2H+e+B2grlhDhVC+de1xta2Dql0
	 qNqC68hHcgbFOYYn2vwlVWEvbm6RPsfCbQDHBjg90zpMiWDiNPk7quYpM7OWQQvVY+b/D
	 P9q3S8oC2/gkjbX+1XshojAhIFS9pAOMk74qSh6Oeq3ul68gQF+8CXxjF7BkuTHQ/sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qsJFWwkiWeSuou2Dm+m5vriIMBro6wgj20BeOH0bZaY=;
	b=LvyKfGSFkBe/XMvvvqDV7TLbqGD+BSmC8f1QX43iOkr6rZKuOuHU38ec+0oCKQ+jp69+
	 Moa9ulUetPrYd7B0xV5dWDQssnMupi/PnoGNfeAfr1D8RvlMfyVoypz6tvsqIfjTHV509
	 DiNF7f74NjJyHunwIBdtZYAFOGAaXy6Kk7/xVNdiueYvpkyFSal4hl6hSde8xQmAOa1DT
	 NGOINz8vPSHgRnActqhwZRRgFATEYn042oDZF7TOSt2jGiZ5fL0Oh8sYCXSbPGuxYkuQl
	 o0RY9BrAafTdSL9aDPIzMJiI/Ph9OYVBw2xSNXnfIeU+MlajlOJKJOjSJT89+tShRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc83i9xd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94BE606A8A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94BE606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc83i9xd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35159e0092aso57899eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537712; x=1795142512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsJFWwkiWeSuou2Dm+m5vriIMBro6wgj20BeOH0bZaY=;
        b=jc83i9xdJiIcwO0Bu8JPsIg1b+yCo+V/Ib3GjU3TGZ26sOv7vPfap//5dmC8diZKz0
         4r5xIufATZwIrnfqDAA6pBUOHofic5oluIqX3HElbL++lU0PJlyIKqHMVp4nkXnVxm4m
         GB1irmDb8hqvgQp65u/WJnJxZ9HL+lYm0buWolOtjvuLJy6axzPwV5J96yOCWBBDnXmy
         cdGeuSH/xrMbU3f7ylCUMf2A6WDvfsK/RalG1rq8qAmlmPThk3tqzXMN8f3ImSMbMpKR
         /5yv9mBdxmHYailNrVWCUuLlUEkMj96Ha/RLbhx5O8X44HwgYqUUuIcL2jL/Jz40JEzu
         9HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537712; x=1795142512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsJFWwkiWeSuou2Dm+m5vriIMBro6wgj20BeOH0bZaY=;
        b=mWZLOluBL00TdyWLoa03icNFH+7BwG/dLkljyProgThu7sUk2N9Yfd0pX2FV2pYXq4
         uUqSMwEAbR6hIYv112k5xa5ftsp+lwlFubJMAf104BtjmbJLpbaNzdQq1x5e6WbOwyod
         fPni6+ZATFCtiy8jKWozGkwFWnmcHLtWROmfBVYk5nHpYEvkbDEeI3CKrcthv1pAfLQ7
         R7h2I8jfwmeDxqunSqJWRguuyzS4fm4K953SiqZXpxe0mXf+ELD0O7zjaqjEJc7rQ2Wv
         Gm7eRUrKbYwGEp39+MudbrU+Yew2vTnmv62D36y1ac/jz6aXvzngeJu8J/l3BXxxRPBO
         VMQQ==
X-Forwarded-Encrypted: i=1; AL+hErGf9EdvPfIxco1tr7HCOQWqD5rbU++b/F17MBsdSRTialOS3hZhoXi4xwawEXYFYDYwJ0CEJvoRpMBuwmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BOXK31sMxu3Oa19GrcuXJvV0bxkYW+mttYb3PR6uKd4F2oJN7
	T6cUvf1ztf/o0LyHPPkb4PV2ju4jDCI+pRKontqep7hZni27CwKoc+9s
X-Gm-Gg: AYBFou1sl2zKNnrCsINuMQc+/Pf+62kl6mo+wPOPWfxDSsM3z5CPPklYG+NpkA0PBrO
	SQ7VCn2ZkWIGy9WhXnDRbKLzGDdnRfj0+/PFCJ8pQ2QHiJLOtjIcDOJ0uWl9Nos8wZZjNGZc6xG
	DaArD5oXjL4oZ3H7xa7D458cd1n802RkChM6goKILqX7u3h6YDFnFtuH1S7Un368pbzIZSNh18u
	06ypuJcNlBfHlDSZIoD6q29YzAvB9eLY87nk4U5olUsoG7Kd6cZfSAqyfhq57SzkWxTZv1JgGwn
	KiLftqKlVdtfkNcmbbcv4rf4ZX4kC04dMm2L2vtYLaEAPAZkvr/8NzpAE5qjBIdIxd1O9HMwKcF
	mNRafX4aM2ZHL52IhWrQJSM03/rtDtOeKi/uE4Jk8lTzpdO8+Q5moWs5E20Xycx/FwT6JUpRylk
	QRrHwCafPV7hAJfdxneQTAHOEFduOoXNQsipMG4dvpVfR7xoxjd+AnyCwdnN7wQ5R+vkXIhsFjS
	cNQhl/kL7pPe3VeNiuI7cGQHPbYXZHm3+5jl5TYylOJh6Z+CqlzL8zD3kV0px+LBpPCkrPwJ1x0
	n0tecBpAjbbWYfrexajhGJvbf/Wn0vt94fTJCu4bEMuFG0b5zzTqEO/cWsBBMZygzrSNtQnmfbk
	cqOzbZi9dFMS4HYomcAnBz9yCfuVaZIiio/wz9lMNLlRf4v7f6O1gQqKqd048ovLT2NFwM+IW4g
	+7XJS7WymbXts=
X-Received: by 2002:a05:693c:20cd:10b0:36a:13fd:b5c with SMTP id 5a478bee46e88-379652f16f8mr1543196eec.2.1794537711864;
        Thu, 12 Nov 2026 18:41:51 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:51 -0800 (PST)
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
Subject: [PATCH v3 6/9] media: i2c: ov7251: Add orientation and rotation controls
Date: Fri, 13 Nov 2026 11:40:56 +0900
Message-ID: <20261113024059.1087031-7-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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
index c7489c6305aa..834420f2f843 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1513,10 +1513,16 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
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
@@ -1564,6 +1570,9 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
+					&props);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.56.0

