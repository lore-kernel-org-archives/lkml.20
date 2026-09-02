Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2FE4A6CE7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360858; cv=none; b=er2YKB6aKInGQaMEDLujUyhqOI8cOIjucgZnMEL1OWyvjlSzweMzLIyBJTuK0MLW+dVUPc5pAVH7A0AbYtMZ2/XBuKlJgXfPxdVBXhBixg/DCxJ+61Wx1ZSFnPl+umItNFeBgytOyQlwTx9ybyToVT8+CnZI4SDhCJMDyy+Ldzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360858; c=relaxed/simple;
	bh=yy7NqzFTCZj46zAWpwdiPyZCalfwq4poxZvjcHNMIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTX0U8I57UQaLLyTimpA73vkugXatO/U95dcf5ObHjeW7Tc4Tc9dF9j+nie/8jjS5j1n/a4tEK3fcetwuOIIqUxDrMMP7vrh6TgjE9/RN+yd1ewAVx+KeYmGswuXe+2Lu/rG9q5jLbvINH6WKgJeKxbj7BPkvPqORh5E4Guc12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwzJjDim; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwzJjDim"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e397f74so1369466f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360853; x=1788965653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=dwzJjDimp4xFPafy4nLSrm/9JVSmVzPXkmLkiZo8aA7ThIXWNFXN2MOwT3cfv58NMl
         HRpfhyz4ZII3NZBHPUOrFOWxmBBRQUv/gAdP3ImeAx+zfVhcxQKLKNMybRe2eI8l8f6U
         t9yUOHEmqKmKtKpeLnucYgU7On9yA+7uAFRmgwY5LDJ+mcLY/chekasQEbVuZFD8gm1i
         SWF14LxSTrBjXydpNsmv3nRC1y9PxVxTERCzQH85k+N/X6cgdVXQJE/8EDF8IpbXXTY5
         OPc/T+uJ8bMtJEcONVzZbvmqN9kE+8cX1VUPLepSh4Cn4GJUgVYvvQNp7HWnF4HVl3gp
         mRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360853; x=1788965653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=LyG04AXX5KmgkExAdAPjkqAgGYTERy6EoHr8G1miTEX8GT/0cjChlZHlsb9/0oPnuv
         Ru4F4GsS/HwghBQZdMbRBDmfoDdVKQPi+VAEqGwy0qZ71ARModVpz3OjTN9hHheIOrY5
         cu6KAStYmKxNav5TCr7mhM7YfwZjjAYG914/OZiDraDzjwmiS3y6PqRhdxudtQO2S93I
         jN98yXrmAMwtjdmc10a+WFT3XNnTEZQNCiBgo6LTCDPojGyHHLJ/bJWzT+OD4g/4irWV
         wluQrQtlR70L48UbEYTRYUiIPvKRCG3ESTe0hGzgFHvVwBL4u0ZQyecT6uYf2+q/Och7
         OhFA==
X-Forwarded-Encrypted: i=1; AKwUvBxXRS3zXYoaPKMY2ndWdo2H6F3fawS07xnsbSmNfI3WHsZm5x8XrhU5vTE7pzGHl+p3xT4JGh2qctnqTDs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+47JaNengZ3aZekhcIdgUteb3VetqgdJk63XRGaKUJ+H5kvjt
	CPywcu9dCJzaAK91XzMrP4gQXd/qfoieIDLWdu5+yxsk2Anbv0GFPXdL
X-Gm-Gg: AYBFou0upFbXECVeX6hIhNqoAASxG7rgI7HXcLirqREXblrP6uSPP0pi76cW+lg5ZNP
	+PcmaVDF6N9ifFV5BV7dracRJ9sBVpzzJ4xajho7CalYEEbsj/gP9RQfNLfZRcCJ3HGx4LohJUU
	vrn4xhMctXSj2ZDgsKayEZUW8JfE6PKreH6EgzZw/Qbzuz5RsP4VYDyofBWf10KEzvl9iEEBlmX
	huDOGcBxh9ElJim1j/m8wka+urDs5b6g78o4kblpZIYiBy/7FmAJn9EpolGq2y84mA+0efR3q6z
	ofHLtltuYb/gXWo9gghEeImhQaM9Dy8ZOQF0gIhBZRn4Kmkll819KHoyC4VYxi4VRbd+Oe079nU
	UKgc0d78sFBcPm3Flgej5EXk+a40V4zQfN/xYIAHrpEU69K//qX6RhGCJ2wCMG+n3N9B1vchUOF
	q+lESXuABgCVA98dv6LSSNsRPLWw7sUMiZmPyW0Vp4AKN6f6whHDvE+KN/kVSjGxYGQ84ysf7iD
	7F7nPnwgAs+zeLxZDBU8bsPGQekBXnocCKG7/AfMu6M
X-Received: by 2002:a5d:5f8b:0:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-485781f5357mr7781856f8f.7.1788360853430;
        Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/16] media: ov2740: add manual white balance controls
Date: Wed,  2 Sep 2026 16:53:42 +0200
Message-ID: <3cc40ef9fd6aec21cfbb13f238d547b9852a2bae.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

