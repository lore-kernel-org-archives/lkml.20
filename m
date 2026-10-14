Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4021473C67;
	Wed, 14 Oct 2026 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960589; cv=none; b=HxzVxqGwz5tCKA0N4p7zPHe/G8/MBUlcf/L1RWDB+pTV8v7/EPXHdJRzOSPqClBOt1T6PNO3dcT3nrV1UcGNHY0qrXCx6me1jT88JA8EV0YPgfB3XN0IypwhTUrRN0aeK+Q6kQInDKmS5K532GgVcDe5k+dmoert28ifTlJj4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960589; c=relaxed/simple;
	bh=zPC5moBljhNzlmUtQ7XMjH++BhuNp1h8I5t6WroYep4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUJN5wZOCrDCM0Uxn+9STXUhuE37I1bpNsMFKHhtFSfIEVX8imvxcNPflRpoDTvsAH+EehYy7ooT84FH8bxIXu8JcH+4+DAgogT12EbbgqFL8MZW/MRvC4Y+omkWUHfxYOjNMEmZLbR8tCIjrYmmxbYmKe7/tRLeFNaPMOeuA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FiqWZeUq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FiqWZeUq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A10F6C2BCFF;
	Wed, 14 Oct 2026 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1791960588; bh=zPC5moBljhNzlmUtQ7XMjH++BhuNp1h8I5t6WroYep4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FiqWZeUqS6KPV4UlTXmAGuv+9vG4rWRyidZF2IxfPq78AtY5P7buT2FrBsVRoLpjg
	 HFeUGbCOl1yYhqB61kpgrgECe6qRSaq/8WfUThl0tGDbf/kk9sO6psasOhH4YdTR7+
	 B/nQC8rB2C5G0WxKISCH0WmRSRLnMdX1XCjBZpQg=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E103CC6B1A;
	Wed, 14 Oct 2026 06:49:48 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 14 Oct 2026 08:49:14 +0200
Subject: [PATCH v2 7/8] media: i2c: ov9282: drop redundant vblank field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-ov9282-fixes-v2-7-3bb376d8b1a9@linux.dev>
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791960586; l=2587;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=zPC5moBljhNzlmUtQ7XMjH++BhuNp1h8I5t6WroYep4=;
 b=V7A7q/wK2hMM3qXOmHKMKtcxHthKnf0bnJpPOPLdGeWd3wZpEpu6xO2I4+U+foDyxg8LnlqsQ
 9t8Ixe6bRpSB6F91trlrbuYQL18R3NpOLpS1F3Zu+jR9w48VpwgT2Tk
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

The ov9282 main struct has a dedicated vblank field which was only used
to duplicate the value of the vblank v4l2 control.

Therefore drop this struct field.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 5114fbf28a26c..f877cb9e78c38 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -196,7 +196,6 @@ struct ov9282_mode {
  * @again_ctrl: Pointer to analog gain control
  * @pixel_rate: Pointer to pixel rate control
  * @flash_duration: Pointer to flash duration control
- * @vblank: Vertical blanking in lines
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
  * @code: Mbus code currently selected
@@ -219,7 +218,6 @@ struct ov9282 {
 	};
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *flash_duration;
-	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
 	u32 code;
@@ -629,17 +627,13 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		ov9282->vblank = ov9282->vblank_ctrl->val;
-
+		lpfr = ctrl->val + ov9282->cur_mode->height;
 		dev_dbg(ov9282->dev, "Received vblank %u, new lpfr %u",
-			ov9282->vblank,
-			ov9282->vblank + ov9282->cur_mode->height);
+			ctrl->val, lpfr);
 
 		ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl,
 					       OV9282_EXPOSURE_MIN,
-					       ov9282->vblank +
-					       ov9282->cur_mode->height -
-					       OV9282_EXPOSURE_OFFSET,
+					       lpfr - OV9282_EXPOSURE_OFFSET,
 					       1, OV9282_EXPOSURE_DEFAULT);
 		if (ret)
 			return ret;
@@ -666,7 +660,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
 		break;
 	case V4L2_CID_VBLANK:
-		lpfr = ov9282->vblank + ov9282->cur_mode->height;
+		lpfr = ctrl->val + ov9282->cur_mode->height;
 		ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
 		break;
 	case V4L2_CID_HFLIP:
@@ -1382,7 +1376,6 @@ static int ov9282_probe(struct i2c_client *client)
 	/* Set default mode to first mode */
 	ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
 	ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
-	ov9282->vblank = ov9282->cur_mode->vblank;
 
 	ret = ov9282_init_controls(ov9282);
 	if (ret) {

-- 
2.53.0


