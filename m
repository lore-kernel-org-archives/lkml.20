Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986647;
	b=NdZwtzzkhJFQ0P9Cx1Pud8uyqN10/hKtS+JhuNQwEfHRUNhLfIrvdCi26aYVbtBMAhyW
	 G32YWztvueZXUeSDRRm6miR6ey+Lc1me/oVl3DAPj739SBzjjZITCxui/Ejt+AvLmMAq3
	 9/9nfSMBqX6Xg7t0t+Fp+yquZTngWva2DxFWZ/ddPODeQK09l5MK/9qh9hgn4izXIc7p1
	 ZfIXdzyamHxR50B16FxEN2zEMQycLDrB4C1hOTP3TRxQwZesDFj92sWQjatqn18/hIICM
	 PdyCXFK8+ocPOksYovK/0pJ39WNocMpiTMEam+sDEH27w0QJoZQ/c3dEzjLfVEfr/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LyunzqwHw2ujd9p9tjO94L4AIVA1AivXZoC8iBdB2fw=;
	b=nREsGQkqRjckwqeMA3MM3sItQTl/5Vlg/HXemhVQZ6SFkg7RhgGMA0y3WxcyCegfbYOy
	 F/OWXR2+n1fHzizB2/9ZQxalQDthr0ut7lvH0uauhpkIHMCvva7PACUrUz8V4p+5Wacmq
	 jyyLMShShE54xebwNco/cwwkpD4PQj20b30YmNwPQcvsRe+eLk0jwtpgH5immbZSmab/l
	 LYxGJelQzHilwgy72KiMwlVvjiexmBCQKPLBqntzA3Bxa7vNNTpRTAXn5oOzbKvu/FDKR
	 KkgGja8n2AMOBwUAxvNWWdZqXyCu6sKYW1yJEuuEduU1bLl3lXTvn0KXaw/Rg8E7tEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mYIvmp5w;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF0606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EF0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mYIvmp5w
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso487457137.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986646; x=1793591446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyunzqwHw2ujd9p9tjO94L4AIVA1AivXZoC8iBdB2fw=;
        b=mYIvmp5wECYYvMDZf41j2R2/KfUaGiHZ0cJTaJ4SLSUJmeqMe0GZDgYXe2Ur0oJNT9
         nOypD0wdgTfp5sFviC635S18S6MIP5w1gljJcgMZbZdCbMVdL5T9fVn59DmqqRC2Z3Jm
         LYshMTCF2xqTM1H1gjEnm8AywpeaEKQwP/YBlZ+OgqU8+R2K8XlVcZFFo1g5tJCeAt2f
         sVWIl3a53rXf2ELQmM3Ma3nXr7EZDF6PlwCX3AawAcO1SWH9HCoRu1QkWXOFAabaqpof
         1RhV1BbRKTA1JLHNLzJSvs/DmV8CaW6Zl/JzfTbrW3Z8FXyVr3eh/gOaeJ6sQHoi4jTQ
         6D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986646; x=1793591446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyunzqwHw2ujd9p9tjO94L4AIVA1AivXZoC8iBdB2fw=;
        b=KBwEHzXpRi0LbTnUCGK6r2CyYkt38Oph2KEYSIvbQzGGCj2hy7srIYzpRdeDMTjOVO
         A1CwNGjVzbSVZ2hE//oYTB7UToA42Julr20+4GoI/IbrZK4XP8NDkFkuApITst/4EpRQ
         kjDaSBfMPEFvd2Z1rIp82chbd+z/AaNeuLqS4Oowcg6XD94I82e9YHwBwKeAjpAvyprI
         4atH/bCG3a9J35xMSUSnUIQuipxpSnkRrmsNTt6VItV2J0hkAKcsjz75Oo+wGz4fe4NH
         Hik6fZdym08WZvGtGQaxAiWxxx+nfUWDX7flLoXXJp8AIZc4dUYviGmwJK+Dsemy1Jkw
         DnXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1FPIIcnYjo2RlewRo8XexPscoj9VoyUe1tIQbx1DlAmo1vrj7ZhaYSaniZtfFf1pdq/lTwsi19gAeuN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWMdl/rYoKzV93hxUjBInnbqe2pZ4rmfsS3l7cUy/SooXL5Z5L
	+72AnK+yJ+YBZSfEnE6Q+9fhRPNLyb/7/75RmPWbaiFwXG6AaLR8VwhK
X-Gm-Gg: AYBFou3GwMqS/snnE93xRaiUzpbN/wmYZXLPmR7kQ/mYM/PXAe/pWPf/HHIR40+o7Rm
	u0bTu4SES7yQUiYy4jyXaQWG1HGJrLBQRerDpo2u3OZNsbs5Xsaay9W8Q0wUNns/0c7McWmYmGP
	R2JTSWT5FiT4M+X2JD+2bwwCTYgTCv3fxwDWx6zMQdKFICWLAN8IEScdLPUYLZqBj75PfiwEUwJ
	VDJJwVyE38/ywSz6JLqp+SKl4Bn1IW5Mogj73G8v2hGoUrUTK1QWrpuWpAsQ/6PJc83G1JwWEzs
	dL65Qj6l/lJnULj9F5XNsGgmfJff+CgP8/+gw8iiDPpDtr0vxufqzdBGq0tCDO5lob/g/9a2Cpd
	4qVZ1b3lm8xLJknl9V4b7RzqCYJFY6nTTBNc9oV2NDJmNpMPSe0IsuxM48qY0fjm5/9XKh+oRUM
	utWcDpBD0cGCgolMTvSuTAnbhj3WVWz1jDDsOmYew5hHJg0XkmrB9FZzVSTb57CLfI086mTtJsP
	ch26a8Jrvfbgt9cZb/HxMDwT8kQwPzjw37YlDpUyd3YNafJGIvVzmblOEORHHbCI+AJdUuPp5+2
	G2/J0CFFFhGWVwZoJhad
X-Received: by 2002:a05:6102:41a7:b0:7c3:874d:60bb with SMTP id ada2fe7eead31-7ce5d232f57mr1075228137.5.1792986645785;
        Sun, 25 Oct 2026 20:50:45 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:44 -0700 (PDT)
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
Subject: [PATCH v4 2/5] media: ov02c10: Implement get_selection
Date: Mon, 26 Oct 2026 00:50:12 -0300
Message-ID: <20261026035015.110903-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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
index 80edd025c..e24cd8705 100644
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
 #define OV02C10_REG_CHIP_ID		CCI_REG24(0x300a)
 #define OV02C10_CHIP_ID			0x560243
 
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
2.56.0

