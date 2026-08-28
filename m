Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A94534A7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933733; cv=none; b=afRR69qqpq674XWeEWnw27c7zZfkc6f1JaAH1q2/KdIHM1jWd4z5MFGWrjd+bW2O/AQheyq6kj84jCABP4eWHOX0JOG7UU44ABZt8YFwxkUyGv+JKJo0Sz2iOUu+EIAkgrc9qcJED7/DFR0r6yynqPDDblsj3IvwDhJRLCB8BV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933733; c=relaxed/simple;
	bh=BODxtu22bMbCeaCPm4r8rZD3W2Qadd/rUd5ROI9uEaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cip086BPI/I8QtmG854Z5w+6vVLp0Ak6C7JVDyk2fC1U3C8b7do/TosipSP4dp7PrAm2LLVF/57sEAFQ574LxnaNaHtIG2hXP64YTd1wxz/tasaSHAJjVM/IN/9xlyxDiENTF0FF32/B7Z8FRjOmZ7hyX3wk3OyzVVxkGp/HgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwJZcSsm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwJZcSsm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4815bce4652so905991f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933729; x=1788538529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCkwaqt6mT/Mgi3LcK6pYptNejEWdk/2Ric0vWmObaI=;
        b=NwJZcSsmuLytFiukC6ddgOt+GaEainfG9kfrdthYL635duk1+oOy9bCaTO3u/MAc+v
         vCe+BBeqM45lsFPPhbx1jf1UbByeH4bGkMs8s1srDUzJALEPLjFXnBBdYDZb2do/FuH3
         EzpXhlBgU5LeJzBJU5cOOFzRt3kH5lCeu2ZpSa3Bmqr37h2e99yiP5QL835ILDeP/EIa
         RjRJXuZgOl+WcLQyseFiaQS4klKQ+m1TS6/4xglbf+vkr0LWCz3Sk0IKQmyBEAuTAeMB
         7L+wSO8QV75jVNzFtAzJN7BYaCkCi0K7paRMhpczQqba+a1113Mf9zt+9cCeRh0mRZTb
         8u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933729; x=1788538529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCkwaqt6mT/Mgi3LcK6pYptNejEWdk/2Ric0vWmObaI=;
        b=l06C7lU10MZisQdb+0LoWa6O+1pOqraG/GcKz+B9X5K7rq3Ljb3JxlJ+LdSEk/bBQI
         QRWvODKikqmHmMy8SiQ1jFmwaHs9/+cl+CeFLFadjUCQMYQVShm0V0r4cwa//r2JHtSO
         j6wyLC/XaPti4AyIswTA8VEwSKbJIvfVgtJu5uIbDEzMfLQ4sir/a399EhzExdZosaXs
         LBvFjOZQ9Lvm9gmAmNWM0ZeFD2Dli01dbPk8iM4CV53l1bAMTrttoeW4dt8M/fVxmo3M
         rDnLKg4pCGEFPznJdU8mrCyhuQH+c2V8tJjv3ieSW4bbtzr+0bPmN8vzZ7Ai2gGVcBjV
         pEWA==
X-Forwarded-Encrypted: i=1; AHgh+Rok5VQZ0Dat0Pz5Zd+wX+adMwOG9VF+k47GaWCvBwgnAGNw1owGzPvlZ/GPO4jfuP/cBfiy1H1W9wG+LpM=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ42eGv8bFjdi3zGQnLKc88xwX4alLNsdI2iiRYbPBjmq6t54h
	eOkYFXYW2yS8hCjzPWlCoFPaZ2w35gcWqeZiWqJhAQdjEEKJbx8wOV6t
X-Gm-Gg: AR+sD11cha/tlnZVdmAJTsUoHBmRjCfYhH1sA77CGtXMMWeOS8mU62M05wcuPw0hciI
	HwhsF5Q9NGIasCuH0gMZ9p9FcdRAzwXUhCFipQ5pqzgaw1xUPL6Ho1/n19k5Av5C1ZYjfAe5Py0
	uXkiPi7nfLMPkFmvpS489CJHgX+R/UH4gw34wID/MTEFgzs+EsL3O1D+4INMtkkC9WhxmlZx+Q1
	TBSJ9FUOI4foiR8hazoaBaKH/iyT3YiwWslR078BFs4D+z68c+vy177yBygZQa5qzQyr6WwWbrC
	+pO4M/9jAMctQYQcwAkEHDpI7JfHAS9eaaq6jLRB015oOGTvDEl8yQFFp0nHMmduHkrf5oa1CF8
	II9W68bpmL+dWi31AAagVQZPv3gJyROdN5AZuRu1GFSU3xEJ3G0e9Ti1Hz974BfE3HUsDdt74yO
	fIroHPIftM0fDREF2qh3Il/yy1CB3mDzJYi8PiOBA9RiHTOEePEmhGgxvuYUTipZV7R5mycUm7r
	pc57L7+DMa7R+jDfgN+n817dyPNusvcOZqG/rua7g==
X-Received: by 2002:a5d:5d05:0:b0:482:e6ec:4ee9 with SMTP id ffacd0b85a97d-482f79947cfmr13628325f8f.7.1787933728667;
        Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
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
Subject: [PATCH v4 12/15] media: ov2740: add manual white balance controls
Date: Fri, 28 Aug 2026 18:14:54 +0200
Message-ID: <a34bb1a2647d85de407b4c93627981ef0577cc75.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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
 drivers/media/i2c/ov2740.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c67fcbad5bdb..c7f85c47bbd7 100644
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
@@ -694,35 +697,41 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
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
@@ -763,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -804,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -839,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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

