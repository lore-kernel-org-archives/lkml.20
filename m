Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55878446070
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206925; cv=none; b=vD5/WeoMS9e5RFzgSVXdOmZjHYDxrpUjOKX2yiJ0f4l8CSIjXuopYGPbh6kh1Bog/f3yLTHnEAjy0mVXjBj3TvX+oi83ytszTC7KGlbXBg9okuBdPTqv5c+m6ud2HQiqXSOUaAAUeGpYH7KjEYtioWRJrf1ADuQawx17P+1ZxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206925; c=relaxed/simple;
	bh=JRbEo3jDUGdpUHqM8S0YjNO5l1q03hO4AFqJdccpCWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQY4u7ZHrhSYoCPmVrkmZnXue11ZHaEbLoSp7t9k2aXbMTzJ41+vhddqc2FVhiFDrxa/Y/X7CgYlWGRo8aIP7/HQ8mCxksBaOPJ0hy6j/rhTy3XSBX9J8sCZkIDibsqYX5lO82WDk5Lft+j21/EdkpVOpFfb7tEfVowWm+pBZkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3brL0/J; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3brL0/J"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-1438cb9b3a3so1494153c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206922; x=1790811722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7+t2VISKOFozXNbp7BqWZhipJ/lcJUoqiKturNJLsY=;
        b=b3brL0/JaxwzysuSUxAt3Lyr1f5USQ4J64i5URlKx5gmywjUqrbk0nOcyzFMzEELJT
         5XzQ3LGBy6Uj1tBV1Tcz8RQxBlpYPsF13LVHU0S1yRN5litYnXXH9wlSxqGdOAbgkzjH
         0NAg/BjS8eHef9c3Ljr4J+mNpVYxIWIO0OpnGZy/Q/G80kvavMzGjfKXKvxJQUgE7jF6
         ruAQiGhGc+bmAEhQ9EdXeTWqcwkG+QwZdfCUtW4TK04hBhmswdNV1ViNey1A+/DzG3k4
         pALBidpLSNkLvSARcb7nSXEyhlxStPgkgJf3X0aJqiyI4doXsbK4JMz8RrlmyTEGnIeo
         USCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206922; x=1790811722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7+t2VISKOFozXNbp7BqWZhipJ/lcJUoqiKturNJLsY=;
        b=Bv3PfBEkp2UQj7SZq09vs8Xszvvj3PPVyr157gI7zFwlTl4Xgy+ozygENprnvSnUiP
         hBR3TCv8F8o+P+miIqPD59ahVaSJXUdkWQIFJWKgULfMCQIXAOE93+7M80gDWbp/ac20
         8gEVZiVzghdyumUFPIyqAlKtP9CLXGZKOX8KfQpbci3xIn3/ZzRQ4keyt6LWYwG4Dps6
         kdApvdeFY4vIcX8IZmZQ4Psfr4ds5khQ1ojBaa8as4rEUVKNA/Lrvc804tMrDshLM+1R
         ZrniiTVJFWcrQjz4ABtp6l6fRdNa31C6iXSNMgiY4Yq/fYV0J2ijUtOC64rc5lUb/HDf
         9Dqw==
X-Forwarded-Encrypted: i=1; AKwUvBzw0/ehRtFRqvFBItWeoKMtLnF8+QpSlCHyOJYdaMLmkeYz2JBKN3FpefnEdUcXX+W9/T/A7AT9X31WstQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nv2M0ue4JKifV24CSbF/AXVRTlDGMYglX7OsCUbxq7PpFqlzj6
	cetF29pizHNi4SXCX2Ny8YiiYpB0BtUj+94at2pZ4jYDv1MhamIuzfgZ
X-Gm-Gg: AYBFou1MMnkAS45BG9QemaXX74+EDD1U9mXLZfg51uGHKLBgKKTgAGuA+ZQIRVO0eaG
	j5xQNRguRkkjyejQhs/kP8VJXWY9yKvIPhpqsF/vwtRcsIeiT8Pr0qzipZEZVUbIhkun8VW7SDD
	DGvt37V5pb6i3fKJGY5wur/vJ8EvRopFXwgOhvz56NOYDZHMqQqeMXHV0+Q12NCPXKBi6tlRqKa
	aPqGKf8vTrFJUbW2U0PJberYjJ1woXF9QqylQgx4yQtHbIGuPPyqNxJPSkA8WC/DbMXzKddr8BZ
	vSmIXQq7ooMz3FRrm1tZjc8VuwCTkteZgnXWWiDb+GHGrxECzxLVTr1N2pD4NQoEAaiDnZ8NV1/
	25NB0D1HnNo/OASKIScWXu1kVoBN8o3wD5DIUKMn0zoNZNfJMW/1eHSrGuc5H4xUSLOuKR9/9sy
	wReu6rIc5MDbugSgoTK+OxPO+Ey0AOjfP45S8TxNbs823M5DcAKyrFPZDuStEGzfJ2+iL3K8eTd
	KWoPpMSskVrd8lM4pNU0bOB1V1c/1K/LWvA
X-Received: by 2002:a05:7022:b885:b0:144:c11b:6de8 with SMTP id a92af1059eb24-14503fc6fd9mr431913c88.29.1790206922160;
        Wed, 23 Sep 2026 16:42:02 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:01 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 2/5] media: ov02c10: Implement get_selection
Date: Wed, 23 Sep 2026 20:40:57 -0300
Message-ID: <20260923234100.318151-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
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
and "The sensor kernel driver needs to be fixed" (see libcamera's
Documentation/sensor_driver_requirements.rst).

Implement .get_selection returning the fixed geometry of the sensor:

 - V4L2_SEL_TGT_NATIVE_SIZE / V4L2_SEL_TGT_CROP_BOUNDS: the full
   1928x1092 pixel array.
 - V4L2_SEL_TGT_CROP / V4L2_SEL_TGT_CROP_DEFAULT: the 1920x1080 active
   area, centred in the 1928x1092 output size programmed in
   sensor_1928x1092_30fps_setting[] (registers 0x3808-0x380b), i.e.
   offset by (4, 6).

The crop is fixed, so sd_state is not consulted.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---
 drivers/media/i2c/ov02c10.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 730a40e94..cdccbdef3 100644
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
 
@@ -768,11 +776,37 @@ static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static int ov02c10_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
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

