Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7624A205D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289513; cv=none; b=M5vbQ4N6FjZ4T/DbxHGwMtJ0RLtPdxSu21GXE+FY+qsr5oYw3vufh0X3mFyWUkZ6lCX6YtW4VSj5MeUGuBa+Z0LDXaGG0iuq8gkoBx8/7G1c2QJZX8BG/ipBQfOHKt1Q/D+Arsl03HjXviZO+P56dm70aVxfzck/a90e8cClk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289513; c=relaxed/simple;
	bh=yy7NqzFTCZj46zAWpwdiPyZCalfwq4poxZvjcHNMIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VbnuXZ8sOZy6JuD5kFKZ7J415NESS4xQXaWrYPIijL2QMsJ6x89JYnbIP2m/b6CAtptBiy7Ju8Wd1/t1JIMiStVOVcnLES6tiPd/jdizfaetNdPt0oFKjwtno8+TOvmyau7LTD7b0pADjQjXov8pAQzWMjm2LNEKUOtIkGpZ0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEr97gUD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEr97gUD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe89fb333so152396f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289507; x=1788894307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=JEr97gUDqQhXhh0nhoNt5HVitgZfqLVNxKHOvKRci2AudMnH9wW7whed8fAIWzXeAJ
         8GfqLdjQNsuHVFOvh+LsP4i4JIjUU16Yab+MgbI1OOvcogRcE99k5MSb3Stnzc1Xt4i6
         +7bXnyWV4XkEK4Rdi5qmxz4MUzsHY3lFZf5seTcj9BkJ3s7PIlgxKlqDuKCRogotglZL
         tKbYJVR1nGVPWKIopIGEdh+swGBCkiyCjpFpkYV2pFrtWNY15xM0QWo61Vjn256mfUXJ
         S7lj2TUc35aoiTNMaT6bGR0QCVM9HBtvYpXKw1NLwhiUfzgmgvaQEBc6E05YJfsgnUWI
         RdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289507; x=1788894307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=FZWU41/uyd5BmZ3NCRt0HNa7epY2Fivnf22nuutQ6bMQE+21d1MTVWt3bSESFryEYD
         j8JlCCUX7XCfzEKyi7wb2N1JNCdgrrxVfvGth/tk7TMtbp14LHHyB7+Jxuhz7JAz//93
         kvJ8K93b0dpOLrhmEMm4T3ko3iCkulhz53KVZrqQi6RXAYqV4zwQEISOq+FgfPdFwu9f
         tpSfetejbWE/gKWWRIwFuaXDezAWjB9Y5jK7aCtYF6N/qhgUCK/+4Amk5IPa+cBkLaU0
         qniBl7nlxwFt2Q+S2H+iQfE3J4j/qekTRR//3ZB/U6eGqcc085fO4h5tt5IVDZQhYnKZ
         k7Xg==
X-Forwarded-Encrypted: i=1; AHgh+RrsheM8HwxX7zCUG/DIbfM6opwxutqRNjkEYwYaKf9aybZrmb4JGjlw9svKt1UOjr91Dv6GB2c1i5iIvBI=@vger.kernel.org
X-Gm-Message-State: AFuF++nN/bXiUjtg8iIhN442xT33sXiTQoZdU41ylUzGGqHFFybIjmTj
	vcSRS5tUKdxyWhPej9Q6MIcEe+jzxecVXKaX2yYX5+zV/8okitDTDvnG
X-Gm-Gg: AR+sD10sciCrKAw6Qsi/0ty+9yLN0ejYZlc3aLUGIiyBoGn+TxXFv+hqdqDDExfGIc1
	xqfok4N8ZcRP5tsBzOpn33C3ZuYVojQWxPXWPa2lqa8h5LYc3KcDlONxBL7V2yVRJqFa8gCwjtZ
	CaQXY5Ggvmqg5OAjLCaKouFmscYpUvH5Q6GK+M5J9vxBXhGRcInIAGNasYQ34cA9r+q4U59evFn
	KN9N+3iV68md1p1Str66rUU506+0vfaAWUTDjSohsImTW26bq2NN0/M4hlDyy4NDs2QHfcqVmvA
	QqNKcxD/owTwaR9MmpqnyxICTdzJ8BJzBTdAUkOfSullgHj6IBGTqPZpJ+oMB5qG6QJo6BHJ0oH
	EcE5g8RerVEMY7elQY9h85zZOD8jkSiBEwPUzSnjbB13A3Y454Z3gG7wDYnyXz8gi1uNIg8tqN5
	6Hi3LawLdoeL9HukSbzqcwk6glGQmOi5zFzR6luMKOsxoubPb8yaqvrJH6nsKYy11f0CTGsTkvP
	uhUr0HK0k66MrkdfaK5b3+ipz4Gr0PiWIxnqXlG8w==
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr233533705e9.12.1788289507179;
        Tue, 01 Sep 2026 12:05:07 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:06 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/16] media: ov2740: add manual white balance controls
Date: Tue,  1 Sep 2026 21:04:35 +0200
Message-ID: <10f597f1911de1d3cc43b5aa7a4b3a13aff4e63b.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor has separate red, green and blue manual white-balance gain
registers, but the driver currently writes the same digital-gain value
to all three channels. This prevents userspace from correcting the
strong color cast of raw Bayer capture.

Expose red- and blue-balance controls relative to the digital gain and
update all three channels under group hold.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 44 +++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 5f381b7972bf..4600bbc90293 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -565,6 +565,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -694,8 +697,10 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
 	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -703,7 +708,11 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
 		goto release_group;
 
@@ -711,7 +720,10 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
 
 release_group:
 	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -760,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -801,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -836,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV2740_ANAL_GAIN_MIN, OV2740_ANAL_GAIN_MAX,
 			  OV2740_ANAL_GAIN_STEP, OV2740_ANAL_GAIN_MIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
-			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->digital_gain =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_DIGITAL_GAIN,
+				  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
+				  OV2740_DGTL_GAIN_STEP,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->red_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_RED_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->blue_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	v4l2_ctrl_cluster(3, &ov2740->digital_gain);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
-- 
2.53.0

