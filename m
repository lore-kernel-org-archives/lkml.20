Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A336B92C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199271; cv=none; b=ineNBteJF7UeS+ZFBBCuJkRVEcq9A1bz3UEesxMc0yIlw4xjJNPyv4N7JtRKGKKfsW7tKMdqg90R+oxE47NWQpTBSikKbeeF4AnZo67vBjaqon41VECnI1/mBIBQeOMX8caz57fQMsxuPlMYDIJqGpJRXVGKweYXotlbRzaDNYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199271; c=relaxed/simple;
	bh=+c4zvKKOzyTG8jOPH9TvfJgLdF8RPSCzmK6SpoAiOic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGQXdXqjsSy7N6i8vyFiT7Olpi44i8ghDYp3uP9AgojNJ//iSnzbX3/ZOgY5LGsf5YC3lkO6HfPgMvoo8s72dYfAfRbOop/hI4vrtB3LwbtbYaLrXX7BW8ZgX8DpCeHtV3pYUpAlMj4bgC5mVf1MAaG11etxfAFDLTxeYGcU2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhEr+vQK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhEr+vQK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482fc3327fdso7297f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199267; x=1788804067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfJBnn5eTo/6C/oJ9YXkPmfh/d+EU+7KK+XPUfp9+ec=;
        b=QhEr+vQKYzUzknS1SOAlXxzmOT+DCJP0qSZVRbsZ4ELdgk7yOruQioGSXkc8UZTVTt
         /LnkdNtoO44ywz1a2mwFCaRLHQaekBA2Gh75Ug5Ncz1WHsL77dPGa1p0buFPPIUHdSxE
         xlUMm3nnKGKn3oFUQutJBjLO7lSNe9nB4tPDuHazsn+y0CPYYlarztNhF5NxSRTD9owe
         GbIBOOvVu8ANuZ29Fpx3W+xSA7lr+Z/+Q8a2i4iJUjjiDQ6k1XiGdaXFTdy/BO4KBXNb
         kuqYuxlRkXkvwcqXfUXm2JGh9wQQrGpk07E+jhYXX5VfIMZ+PtjX83q+ocKUJX+bu8YV
         +jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199267; x=1788804067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfJBnn5eTo/6C/oJ9YXkPmfh/d+EU+7KK+XPUfp9+ec=;
        b=FZIpYtsXYhNkIRvSQ/qhBSEECPOMqkAkyB9qg1pGSOGLLxuMLZVKgnwgJd3CJPWGYn
         6QZ17Xk34zQ0YWOrpZH8yI7FbMjv8L8fT78/WegSj7TVrOAjogsiV2IalZYHZ9zSd3YC
         yjck9U95gKOmnpnbLmLUNOHIhKvwwGpcfB7nOpjkp/RVTSoBoOSn+7dET7dBxg8PxRXJ
         zZkgwy7M6MQfuoAd1omS6U4/LLsfbIFTYasnksqONKi0qXpGaax4eZjcl92I0tW4O0N3
         u8ocmvEqnWAbD3Qur/RUirxV2oppGvxlu2x5M0UejZmWOguK/0iwBHYZ+HOrSBg0Z1WA
         BxCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOs7l/zev5dui5MEM4/BBs0YxcZSHMc6KnRO31exaGCVdAic6lbAg9kT7Phs6tL1n55sKW8sejP1jRlRE=@vger.kernel.org
X-Gm-Message-State: AFuF++nfjVQ43sBro03Z9nA45fwzDCQIi+oUc2ySW3wV/JEtGz5hBwjR
	ZRiJjcIAxuDss7/95yU6HBtEiu/Le8RJI5lDa+JwUpoDHzh+jyd+icuV
X-Gm-Gg: AYBFou3U5HNGriEnCRzJny9eAkkCjmOaR+tIdhZDC+srDYJlOBMQiZ0RWhE+YN8TQHa
	3C0Wto8vN0N5AYGVpw3gtEtrQit1oXVqELCWu7jrT9bJES8VY/jBWyLxWu1TnYohnvkmmDuu+A2
	DkgLVS45P7SYtkyO1HWd0S/QALYV/9xHWsH4RrAXU/iN8yaJZRBsLj4MtqtaLWsE1mxibevffYJ
	nunewY3a0Oowo2Wy0rRYlgbnCNR/mvp2sFfgim1piXy3JrkHPTcnYT0+T49ZoivjTNQJiO5ZzUd
	m6o9LI5GXDSmsJ6grVPwpEn7WgXVl4ClYDP0VgrhMo9hL0FKm9aaMGafT8hKDrlAc3wLIgzfG2Y
	lqQk14joZHuz7JL/4PCnag1euXSd+hEd+3h3EOCoVvJoNr67Ms3q308EyC43LgnoNN0FhWU1Ygo
	1uY2bn/IHbGwNOn1mNAARun9/ifXHgFYLR4IoFRX7jEsaQcNkusgwVVs7AM4mcjiVXtPsy1KwOS
	eSiQosBq0kn2u4eVdlbaWTJqIlAOL6GNNwjFATeVeI=
X-Received: by 2002:a05:6000:4705:b0:484:3ad2:27d3 with SMTP id ffacd0b85a97d-4843ad228f2mr17224694f8f.2.1788199267099;
        Mon, 31 Aug 2026 11:01:07 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:06 -0700 (PDT)
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
Subject: [PATCH v5 01/16] media: ov8858: Extract digital gain programming
Date: Mon, 31 Aug 2026 20:00:46 +0200
Message-ID: <20260831180101.3109854-2-mauriziocasciano7@gmail.com>
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

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
With Best Regards,
Maurizio Casciano

