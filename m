Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716051FCCF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174632; cv=none; b=R6tLyuVQGvlZgwf8fZBNrrAifPv99mzo6BPp1LwElMAMe9KYLLwAsprYiMu3Nzr00sB9tjuTyubHjfrJIytPZo8ebmoyyQHzwlPuSivUhbKb0MT5cYyC+/ez7kjUegXUCSLkh70PczqDIbG6vB5QOAITnKyXNeFziOvam9o4d0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174632; c=relaxed/simple;
	bh=wJgO7d+fHuOWvY3n5oV66gnjobfoBM0KIvfHm+HTvh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdX8IvU/nIYZV3tmV4rp16EDoXTYjrX9eexFbnCZmMpomlJqex8bV6SEV27u/m4q37dTxx/9cYRg3QtY2r3nNOQAsvT66YB2HcO/U7YjV+jsBP7vAEW86mEec1JC/V4wngV813ePjXIhXK0fKYPZaUGnzqvbfcds+a+rtD/7hns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYhn0Xp/; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYhn0Xp/"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so636952e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174627; x=1790779427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FX/p4nYY/p7jl8HMo2CeBSLuQT/9YvuBtl2IrPIDj5Q=;
        b=sYhn0Xp/s6YLT0s/r9co8pzwvsIPO4zLamcGyY6wEBrU2zYv4spiT9zkVIMEGs/fd/
         Oxh/Oc0bcTBUM18iI9BuzjEVkthXte+7VRphTndZ3b6HYrPRIEH5fJZ3A3Mxt4zone6w
         73Cfy6uCZMlm0ACTyUDTOO8ZzvdTFjpnWfmnlz9tfjQ5aD7FeNNpb0wdyd+wV6DRRdh0
         8/RmWpYvg0Dl8B4ARW1jTILX/4H7fk6LHT2tKIA1Alj3c7u38r5d0X3jkxk33X9iSbCx
         Cu2Aceu71fLsLnwVuVC61FwBr/aiOHPCFhS4UL7sECc27ns245p4Fa9zCGlLTfdPPaes
         iyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174627; x=1790779427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FX/p4nYY/p7jl8HMo2CeBSLuQT/9YvuBtl2IrPIDj5Q=;
        b=ZSmUWu8dFsWXkxY3kHLdvux5ksK8oCQcJE6R3YGFcmkZeFkPHrTiSeFscUs42HUD9G
         MgbhEhUMtCWPpnAF4WEOTREkQVEt4B4mtgIEGL2mp5C/Ytb/STdgbPJc+B8cJZkT7+lZ
         BXm7wSVTTV2PiJE55JyOppzJgOhoPynZhAsYFv+dB1XAem2t3PJLzywp/NFKJkAnxa8S
         tyxfYyIH1mr5qw7OjEZv7bGg/ooeGgKfzW+9vwCe38ALZ3xxaAr3DiWMF3ZAc16OTWBg
         13jWtGe/0jX3fo83R3jC17sB4cvVZgRPIoTycre5mNhC2qXkqrQZLZfHWUerHeMz67ec
         btog==
X-Forwarded-Encrypted: i=1; AKwUvBycONxzeuIeUEH4npho7VPXHzJYOTSropiiXA50XmjBfGKtjYWUSwr9ymbyWQs9bnJ7ZqrFYuIlNs3CmhY=@vger.kernel.org
X-Gm-Message-State: AFuF++kZGT++1bLnrafgAS3WVTSa1+ucLYX3F0Njy0z7n4MNzXgy1DtD
	R/eGLeKXFJAqThjIMAuK+9Q+0xX+wNks8bvti8FQvhSAVIBsQZQ5vDBt
X-Gm-Gg: AYBFou1I6FlVibwcXlBun78MJc0PHq9t7gk2tIF4XbL8cxth0h4cSCcLmcMX3CidMq3
	QYXTvbWPJv8qIlrBtn/a6+rJ4mkR7WTKZWWek8xUT0F2KS25XFXFr7vUoLxJsinxZaFINQMIIaR
	jSw3nffjUu3XjkzVJPu+hDcFqhwwLzUr6Uo9QVdN3L7ppDOkQ1PBmmLyCtAmP/jBnQW5nHhMv09
	BpH2Xp1pRtqEXwbbvFLc+oeWuyCfH9Bz6TMZoybu5DijemhNsmDnLeuZWDkI9dOnklYeEreTNqF
	bxUC09E/SNeHjLr2H8AI5OYRir1qkb8BRGDThtRL8PxajVJ4KDDV5duNDL+PuIs8mPwj5dn8Pzb
	TRP3TQDs+ZOO7DEpJtUKuhkUmNB/3gRZFY0smV7WiLM2gQ22pw2sElN3MJ4/uwHlQGe9tSkMTWD
	OnwfSZfJ1vIDtgiew+rjQAQxMfydFy9kaLQ4w+7t/CNCFSyT6iPcmrheT4IfnwMkOkSQONnqc=
X-Received: by 2002:a05:6122:2907:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9f159bce9mr3390782e0c.5.1790174626981;
        Wed, 23 Sep 2026 07:43:46 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3566169e0c.9.2026.09.23.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:43:46 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 2/3] media: ov02c10: Implement get_selection
Date: Wed, 23 Sep 2026 11:42:56 -0300
Message-ID: <20260923144257.119076-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144257.119076-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260923144257.119076-1-calliarifelipe@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---

Changes in v2:
- Add the const struct v4l2_subdev_client_info * argument that
  .get_selection now takes in media next.
- Picked up the Reviewed-by and Tested-by tags.

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

