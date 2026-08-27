Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437694DA543
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854703; cv=none; b=EH8ib+efxZwQykG+YdDlIeKfa4LQLyOKZdodsIbjSjvHPgGZ/DvG51apKNHOf50bV0HAjIO46ZC1mJCUOKzc3DC4qimAMkxdwCAe/lAwNHkUXUVCy+mDEkmHj2J8ScT6hVx4S4Gug+s1hLFmWz4YRU6wlx+2zmIGix1qGbsGt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854703; c=relaxed/simple;
	bh=q4QyCAxtft+YL/amDh4uvcwfSmyXggOPe+Bo7Y39AoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scFLjqXvLtb2nrpAvVmlje75HnfIJcU21WaZg0iOAECLe2RtN4Wtf1U2tC0M6lv0KsCkwJmuBe1YYDsK8HRU9gLPOd+Az/9zIL0DH9UqAvYU2vIF403C5CWuHX5lkFfQcdOvcjbiNsvysbKotB6LOhIHKBCXJJ3ae5gCiCm0d9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdfrvsXC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdfrvsXC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49800c6a846so469525e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854700; x=1788459500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hgz0BB40fX6hY+eQd47OjT3VIMJyYIXbhigyIL4PMGo=;
        b=sdfrvsXCI+wwaBvGGYZHdddXznW2zYjF+bVKL1GZ3nj0rKAsSeqWZ6EXxwMLgapegS
         gQ+IRQnRkoLEl4ImxVebJgTIKDf2r/d7xE2Y6pDh2yyTtwmQMSk43ryuLxsxqSscvakK
         rxOmlBjWJWEe2JV0K4lZTdXcYfzdrF57euv1H4dbwsowPLg6ZN+cAAu9Mw2eOQwDkN7E
         X+jhkr43mDdQ4IFNMdKhGdMdE/qeuq8egxqodrL5AvuyxBuwvPMB9TfsOLu4AjYBK5S4
         ZPQwlI1S639NmQKJ3spPzPUj2LkX6saKy25B4Dq6NcCiwMvet9lhL5GakAIPDX2Ls9Yh
         NlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854700; x=1788459500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hgz0BB40fX6hY+eQd47OjT3VIMJyYIXbhigyIL4PMGo=;
        b=aI2SrjjmE+vVRRCP2Q+XUBo5F8nTyMWstwFYCyuOdtkUBU1DOZPe182YaI+dyOV8cs
         LViGYOD9P+XTDkwLDGsT9Nek3TcDYBi0sHq9fjE+1aIlfTBGTck0wFCyMWZpN0wwZfZZ
         iFPJDKRak/NKinIfIj6/ICg9hEaKMbvCUIqWIlL1Jy6Qpq2PW0g38O4nPQeoatlRafXL
         mOQDUmrS2eb+SERvekV4Tavw203BRFc+9Bb0uBr7wZ9Lmq0XXyMfyo78RXCv3ZECqXFV
         oWtbeONuVcs+qgAo4zaPHNjbKz+lRtHFJTdgfEY8/OXQGoLCNAyzv2dRVEyp7M8u9xIR
         rdeA==
X-Forwarded-Encrypted: i=1; AHgh+RryZziPb+nj1Fe7WV9Z3txgkRtdCZrA4UvTkehKizSVgNXMSy6zLNYHfDHdletKLqyx6MxF1TpL+umfiLc=@vger.kernel.org
X-Gm-Message-State: AFuF++ketlUSWMTEbNr3LpRhNeLin5ivPbTO9saHI5FxlghP1VlutJhd
	UlSFWDelDzyCVYXCoYTN+/XtofKHZa+s0BmBa0Wb6DqlgpkOtPvo2x0i
X-Gm-Gg: AR+sD11PmHL7vHfeH/3QLBKE6wWyZv7DCnuTwYxo74gk2p0sRnnFPN340yK+ebnXTpY
	0xmYSds6Fj2gZ7anHGfzCC70jo9Fw0TjTzfeqifeLgexwxEuHvc8R/KPFZxI7V0qb46ZbPjxSeX
	D8c1pjaVKFsYeh0pk2opYy0qaGJ0Qq1LwZf9iCyJHqieEz4wywzRvUas7Z4RM4gvv0OBkSpoqNK
	1l7uTkVLsB/y1AiJpnJDQ1TH93HIg7bE3KHKXtvYIsyW2OPO9enbusrAk1B8N1vRomwr3yCnJCR
	gkpmPAnOOyB44jaaGknSqILeZx3d/KCTHizBYbbBcuIKfgHPc+TVeckQvW+RrkbNlty62aSpLQV
	O6a2XVV5vMbkAq4IDOYnxPzH6AEuKfpUQERzbRIRuc4AxfZCIMhIHB7i08dMLcKIY8mSqEX8c3g
	cJ1c9kMq/iMy3GRswhrKAEwGRqzhV8DzxjpqtrYkJdoPW2VByO6775C6hZ6qGEPbG7VPEuUjiFX
	KRizd1hpyv3RPbI0X7f0d/f7+Zhj3vquecc+H0F7vqK
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id 5b1f17b1804b1-49b91c1df21mr13112225e9.3.1787854700424;
        Thu, 27 Aug 2026 11:18:20 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:19 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 09/11] media: ov2740: add manual white balance controls
Date: Thu, 27 Aug 2026 20:17:54 +0200
Message-ID: <20260827181756.2430054-10-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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

Expose red- and blue-balance controls relative to the digital gain,
update all three channels under group hold, and always release and
launch the group even when a channel write fails.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 68 ++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 6083dd28e4ad..2d46d8685971 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -608,6 +608,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -737,35 +740,42 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 blue_gain, green_gain, red_gain;
+	int end_ret, launch_ret, ret;
+
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	green_gain = ov2740->digital_gain->val;
+	red_gain = DIV_ROUND_CLOSEST(green_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	blue_gain = DIV_ROUND_CLOSEST(green_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, green_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
@@ -806,7 +816,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -847,7 +859,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -882,9 +894,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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

