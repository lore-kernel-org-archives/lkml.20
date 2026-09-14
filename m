Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E53A9615;
	Mon, 14 Sep 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413686; cv=none; b=CVOrK5TNNmvgHRUlIVfpgzaOULxoOuSYAtp1W5cp4uye52YY1orhgIJ2sMnGrW6Fxiy67Mf9dkvs3Hvmyo91DlgH+7MYtHZsc5UHKeaKPUuDASBCaJJMeuuAcfYRzLQESIUIKPxzNsZgsy+dQO9w+o1cVHZyoqIGbDfo7/mc3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413686; c=relaxed/simple;
	bh=MgosDSepN/VAOdz00IAVr7J4q2hquqwEmAxEj3m5LkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmNuuyYPNFefe+SdFbOJ+oomyKc3045KCPqpm8AEvCeD00CiGzkaeN9ccbFkDKNullmzYGuv4K4EmAUq/YBW22eUtv0MV0EjoSr1WTN3DsIErCybe1fEV7Ec5ID99WEYfPYnHtH2AzOwjzVso3+sQ2DmtHnOV81oGQAvs844J5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oWOTr5s/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oWOTr5s/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05A8FC2BCFB;
	Mon, 14 Sep 2026 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413686; bh=MgosDSepN/VAOdz00IAVr7J4q2hquqwEmAxEj3m5LkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oWOTr5s/425Fh+MZI793LJVDEf9iVAnEU7Dy3cFuVCjSxGFm4mBBuQmAjybR0DHXe
	 SpaEQBosG1M3FsUO7HgeV0E+JT/Z38N6+d8RHyjlRLscqQtQz+tuz1bs+B2xEEPurr
	 JnFpVWnOhDmvXPocTJPudM6+PGyfElp5pomztpR8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA47DC88E73;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:21:06 +0200
Subject: [PATCH 09/10] media: i2c: ov9282: fix flash duration control range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=4273;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=MgosDSepN/VAOdz00IAVr7J4q2hquqwEmAxEj3m5LkQ=;
 b=6J5T3TCPbUGlmQx6mf1lG2b/++XSje4gsjGhSx8QNPCYrmlUK9KfEYkp16qRB5+t3+Ax7BQDp
 reD6CCEB0v9BTnYvvJdjXdd2fk68YT3Cgu0kp+OMpVD68OY2kD3uL76
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

When updating the flash_duration range ensure the ceiling is at least as
long as the exposure time is. This may cause the calculated
flash_duration register value to be rounded up.

This is done by introducing a new
ov9282_update_ctrl_range_flash_duration() function and using them
wherever possible.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f728709fcf0a6..be38ecfad8c82 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 				NSEC_PER_USEC);
 }
 
+/**
+ * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
+ * @ov9282: pointer to ov9282 device
+ *
+ * This may round up the ceiling to the microseconds representation of the
+ * next flash_duration register value to make sure one can illuminate the whole
+ * exposure time long.
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
+{
+	u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
+	u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
+	u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
+
+	if (fd_max_us < exposure_us)
+		fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
+
+	return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
+					1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
+}
+
 /**
  * ov9282_update_controls() - Update control ranges based on streaming mode
  * @ov9282: pointer to ov9282 device
@@ -555,7 +578,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 {
 	u32 hblank_min;
 	s64 pixel_rate;
-	u32 exposure_us;
 	u32 lpfr;
 	int ret;
 
@@ -590,9 +612,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 	if (ret)
 		return ret;
 
-	exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
-	return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
-					1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
+	return ov9282_update_ctrl_range_flash_duration(ov9282);
 }
 
 /**
@@ -605,11 +625,9 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
  */
 static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 {
-	u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
 	int ret, ret_hold;
 
-	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
-		exposure, exposure_us, gain);
+	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u", exposure, gain);
 
 	ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
 	if (ret)
@@ -623,9 +641,7 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
-				       0, exposure_us, 1,
-				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
+	ret = ov9282_update_ctrl_range_flash_duration(ov9282);
 
 error_release_group_hold:
 	ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
@@ -660,11 +676,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		 * Ensure the flash duration range is also updated on powered
 		 * down sensors.
 		 */
-		ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
-					       ov9282_exposure_to_us(ov9282,
-								     ctrl->val),
-					       1,
-					       OV9282_STROBE_FRAME_SPAN_DEFAULT);
+		ret = ov9282_update_ctrl_range_flash_duration(ov9282);
 		if (ret)
 			return ret;
 		break;
@@ -674,10 +686,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		 * duration. Therefore recalculate the flash duration range
 		 * here.
 		 */
-		exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
-		ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
-					       exposure, 1,
-					       OV9282_STROBE_FRAME_SPAN_DEFAULT);
+		ret = ov9282_update_ctrl_range_flash_duration(ov9282);
 		if (ret)
 			return ret;
 		break;

-- 
2.53.0


