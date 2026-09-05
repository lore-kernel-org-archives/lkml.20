Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7233A9CF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577678; cv=none; b=n6Hs4gz531B3u0o22mT16EJtbVX8jHJCvTHLSQyclvOrNxR4nhACewinXHR+/FLa4jFugo46t1xW2i/1uXnu418IySwGuPTryVIbeQD3IveRqG5Rvlt/DWsVIy0MLB/XOvvkVJNTu21lwQgJQLLCy0/QKEt0gaYf9XaL1QIBaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577678; c=relaxed/simple;
	bh=DD+PcFrgh0CLzl1TtJOuYtxQ8O4ql5WaHyAPnUH52AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pT23UqVXB+fWOnOASAhS5lGL5Qe6dV61qhpIGn4paE1seN6MHiwocrJtGDrnhAEBe+g0GY6uqID74Eyxr8asShCv1NqeQH/AwjETaxEPmZEwK1ieToBB+YN04SxHdqIK0fdVKqzsVPC3lhtCAZsUTfJis5vdRhDZpNdGFOt6sFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHkIWP5o; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHkIWP5o"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso1539889a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577676; x=1789182476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Hi2yx5cTlZVvtKcNUSCfKMwRgeHBhkYcO/EEuYGavU=;
        b=fHkIWP5o1dViOySUamIYfB7uvB+O1CQwxBoSVuDgvXaapVve5NOJQwheBbcIBwUw7q
         t/MRGffZBTDnIAVU3zSPDoVEqXMw57ulJtqyPTq5ygl11HouzVAWiI5zZ9Lwz9y5DWVI
         jAm54amxVUiypyRUygMa/3gFNc4oUNZ7S0zrYICducJFT2oV+5YKKX7faGixjU7cb8TB
         rBPH8A2h6EGVI/dk52Si2eguUtB7HoiMv5NCUJIDoLpnGBFdR5vb3/8fiuf0IAHdmJQT
         PlgBaF3kwPHQzN5CK49+wmHyjQGKlVPEgCgW/u7RvovM3SfY1WBH/yTFes2Io2zt8x7D
         9bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577676; x=1789182476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Hi2yx5cTlZVvtKcNUSCfKMwRgeHBhkYcO/EEuYGavU=;
        b=iWjyKp8ZrwbbztQp0v3ghjBF8Iki3Yh6L6yz+TrsmGpd2c7kwJSP7Hf3xoGB0jaR87
         gb/Fpu7Bio15f9WwzhujaaYu6tB1/fsnoAwyaoAMCzqjfX2tBArGvLuSxUVuK6RfpKc8
         RCInDc9FP4nl0M2ZCnoX9nXUlBE4D1lkERQmDASq80+s+5WDYmQie9GOEaG4Fyf0ALdr
         n2gzUrA19juBW4umnXxHd/MziOo5QqzZ5WIwVXiJtYR3bafR1RgTGtQliamdaqwk893j
         ihJCuBdaNRnGtgivDOgmZvOzx8LNfk6QGcTc/H4bhNK3bmDZEKCren4G9rqq0ONkY55q
         TnRg==
X-Forwarded-Encrypted: i=1; AKwUvBwO07SjOCoG0PtGgaTCUfmdeUinGIH8XHz/0Fmjx2xGLLpgnanQlAYBbXj30TuH9YJKZHQJFDTrw2szPlg=@vger.kernel.org
X-Gm-Message-State: AFuF++m/oKvP8as9aXONRtj1dV1zTCneKEyjG+G8vubNQd4k/pxjp7uW
	kW3qs1/jMTwYziFsrRAt0oPyhBlmJPNT1fQvfsRGdW5o3mQj4UXTyyXZ
X-Gm-Gg: AYBFou1k7Khtr81QjI1L6ssD5/4ltoCe+dd4VjO9cnUBoYXIwp+aUYRkn8urDYkMSvn
	ESZM7UTB3W1emtJrre6evln5bSQcaIzvThUe9gm8+22WDymtT6znxhnHROt6+CzuTrEpJgcpBVN
	LSTjNqnmgxBECy6wwCchWwQgof7I4SK0FeTzU4p/qTTriXbpq21+xbALIE/RCeSLwHNT/r/OPj5
	YD5Jryq2vDZ/+pQIwZYmLICBSkN5LnDc9g165eSB8FcUQt9w/Hu8JvKzDnZzn34t7ckuOkco+ai
	0lPhwwWcLg3r6vryWHEyG1viiBVtBx8T5DrwTz7tpMqMWviKWJtTJjbIeauR0xJnSNy1ZchG3v5
	iERhUPRepJ6YROz/jOyrZWTFZNdFCxAniTGoXlgSDOYWAGcVBL62rTF55N9DPKH60DjMGNNuKIe
	YCfCTxJcxrsnPY2Re3STSzpsK+tZsmNTHzuTbkb127xeTgQwCL8pA+1kzopXYI2xbfdYxHH1QBp
	nfJRXJnCkehPAAgWMMv4ssMkQ==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr13266422a91.3.1788577676357;
        Fri, 04 Sep 2026 20:07:56 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm10344142eec.13.2026.09.04.20.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:07:55 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH 2/3] media: ov02c10: Implement get_selection
Date: Sat,  5 Sep 2026 00:07:31 -0300
Message-ID: <20260905030732.39196-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905030732.39196-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not implement .get_selection, so userspace cannot query
the sensor's native size or active crop rectangle. libcamera reports
"Unable to get rectangle N on pad 0/0: Inappropriate ioctl for device"
and "The sensor kernel driver needs to be fixed" (see
Documentation/sensor_driver_requirements.rst).

Implement .get_selection returning the fixed geometry of the sensor:

 - V4L2_SEL_TGT_NATIVE_SIZE / V4L2_SEL_TGT_CROP_BOUNDS: the full
   1928x1092 pixel array.
 - V4L2_SEL_TGT_CROP / V4L2_SEL_TGT_CROP_DEFAULT: the 1920x1080 active
   area, offset by (4, 6), matching the readout window programmed in
   sensor_1928x1092_30fps_setting[] (registers 0x3800-0x3807).

The crop is fixed, so sd_state is not consulted.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 6220461fd..114db38c0 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -10,6 +10,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -18,6 +19,13 @@
 #define OV02C10_MCLK			19200000
 #define OV02C10_RGB_DEPTH		10
 
+#define OV02C10_NATIVE_WIDTH		1928
+#define OV02C10_NATIVE_HEIGHT		1092
+#define OV02C10_ACTIVE_WIDTH		1920
+#define OV02C10_ACTIVE_HEIGHT		1080
+#define OV02C10_ACTIVE_LEFT		4
+#define OV02C10_ACTIVE_TOP		6
+
 #define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
 #define OV02C10_CHIP_ID			0x5602
 
@@ -767,11 +775,36 @@ static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static int ov02c10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV02C10_NATIVE_WIDTH;
+		sel->r.height = OV02C10_NATIVE_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV02C10_ACTIVE_TOP;
+		sel->r.left = OV02C10_ACTIVE_LEFT;
+		sel->r.width = OV02C10_ACTIVE_WIDTH;
+		sel->r.height = OV02C10_ACTIVE_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
 	.set_fmt = ov02c10_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.enum_mbus_code = ov02c10_enum_mbus_code,
 	.enum_frame_size = ov02c10_enum_frame_size,
+	.get_selection = ov02c10_get_selection,
 	.enable_streams = ov02c10_enable_streams,
 	.disable_streams = ov02c10_disable_streams,
 };
-- 
2.55.0

