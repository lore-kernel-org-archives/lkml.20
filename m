Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECEE435515
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199295; cv=none; b=Uw4o24ZsTd5G3ZnaMI0gb4oyPuMU0KJXNvXYtBsKLGKInaqOpBaB5aPpywM+1f12iO/86kD2JEzd09H//5/LPKFapTxR/uggiUk4dFSN5ywapdu+I+gTs3f5/2Us7ERT6d4d1Pu9g0Oo/mXwmaz4Glmti85Ys1UxNuShbzT9+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199295; c=relaxed/simple;
	bh=oLflI2lIWaedlQfh7py6if9FMg6ErqlHPns57DR1I38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DW5qjB9WZaPGZ+vKP/8Lpvb9pWTE0kos+Tj9h8L1FR1sXnYlmJ39EIz80Jd5MxkXEVnOSVwvFzUvEeH/Rf/Ve7pl5v59Pr9vWkeX0aKV/QGIMmsCntTBD809H95j5WvI3QlJ4pek6O5kwzkJxT17ASokJQsekY06eegjwtGw9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYs0nWWm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYs0nWWm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso53450045e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199292; x=1788804092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MemavacMmy8dnLfi03Bks7Tye/ONeVO/Ogj/0TC3Kco=;
        b=UYs0nWWmLnjfUE1Bz+9RZ6Wh+QDcDbsr7qHtlDqfLCON4PvJK1aKPECoITQbOvCeNd
         qJf7EJ6slt5WKPJOZ3c2klTwkWntLGbxfC4wYJBQXCc8MWdYu1Ti98lliDL5TZ9ux6pl
         KbG9/vkW2qwYkdpmmBTXik/QUuQIO9y3kFux+46ojIgtYUUMESGtavuHGnkxEGy8Cf5r
         wLpBJGwA0vA1VHx38iZvYCKRsKvOTtuBQD+oxNCs49HhJ7CoDdtC0tC73koDLVbMk2h8
         VPbVk82eV7CK+zzgzzSK8bSXEDTDP/lG87vSnuuHWmrqAeYcMTkolU64KRHIrL2Zb9TR
         KSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199292; x=1788804092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MemavacMmy8dnLfi03Bks7Tye/ONeVO/Ogj/0TC3Kco=;
        b=VW2q21t/e6TjeYRvnejZMFjBR0zEcib/pTYz0ImAGsmV5BmBgw53m/CEpv/ZIVmXhC
         vieywcU4eZe5AH5AvrgvBH0uY0UTsdj/2x++EGBQ4Wy/Q9Z4/IooPCvlbuE8ZU03UPuh
         Rxnv+jOd9oEBlg4HCzla7bYr/7GcXwe1y0f/vIei4LFO2BJEl7+4BGBDelX3RjUZpsBl
         sGFXi6KIQQMTqnepByG+NpODLBR81uaDYcAyrVFpMMPTHAEQ7B5BwH2zB8Eyu8ZqgLuq
         w9AOB6J7YXPemC7vhjF0S9WcJ2Oc+dkiox4E8CgzeNaJbS+fBYt48HyI1QvJ9a8MfysJ
         CCOg==
X-Forwarded-Encrypted: i=1; AHgh+RpEUZREf5tOu//HlG1CAY6GnF7fsY9Hac+kSnYU0pgkoSQkBjyIfoUUcdMT4tjl+lwumjjNTTPm8iRAvAc=@vger.kernel.org
X-Gm-Message-State: AFuF++lKpbMW2bGPxnxUsnluitUsfio7reL7mOrn8uxti6DjpW6Pbh5w
	pKPWI7qJT+9Hs8/yvPttjYp0ZZ8H+61pCgagafMENUxqasChzTIdDWL3
X-Gm-Gg: AR+sD11BddbI7GdG85O3yVLlWEC0sZmm8OGk9MsYpiVwOM9haDP7AWO8AXTmEgq53Dw
	bsPzZVCfhO5e2IPp0+6zkiqru5dwj+vNM4swHIhUUo0DMIM5S3WYvPPpuSumF1JdGvw2EeSjk78
	+OPteYlcvYGUzjAe8dtuVzsrZeykEVhdASAlxNa68mkLF0vQQJWq6/3x9mJy35SP9AFe7R+2auX
	7BYVkijTSiGeZayu9/XJySbqaLq1fd09vRd4GT4PntMzt+7TocE4eTIN82WXUyeU2+a9jXA41Ay
	w2HZ+d42RAregexBB9NzWr0qaiRw43okpUDG+bCT73gsy8PP/CK1ms8Dl02VhjeIxitsfjFCDOk
	Y0GIfyNOnB74ZH41TSijtgHb4aFArrjaAATo7bNPRLte40MRamsaSae9Qf0aqhCC4VS8yhedl6Z
	RzH2R43EUt/PBJ82LNGrPWcmmnU0oCLMgMtWI1MbbOyWQTqRzr9yagxZ0koyrS0U0Tw/oxAs/S2
	sOrQNzq6tEZtnWX/GhRcf5BrCmnYCVWKSL8PNkUE0k=
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr494023035e9.5.1788199291582;
        Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 13/16] media: ov2740: add manual white balance controls
Date: Mon, 31 Aug 2026 20:00:58 +0200
Message-ID: <20260831180101.3109854-14-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

