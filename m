Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325983A8749;
	Mon, 14 Sep 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413686; cv=none; b=Es6AUalZiD33Ku4XE851BmauVg2s5Ky3gmxz3nP6QCZmdOQDE6INeh00r1kydSHS2H/h2XmAaVWAh+PlcK+AvIWKDe7HZ42bEKqJZ/jN92tcUy3YXtkJRZbxsSx43jlkV56jaUIG3EooICgHQXmvxnJVm3PWYZfjkufX8QM3g5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413686; c=relaxed/simple;
	bh=gOLNNogmoOOUL45wHXQtYclrVHmbDfqCCG9L2KZ0nIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2Gw3Z7/sBWR78ZO8vEYYOvKvPMOqZkXoSzSO22Z40xbjP8W/bz5r6JVEUAPGP9adGZz7xJENFCGzKuccnCopT7nKv1G+tro+xqJPvyMdE9IxWvIgTPx5LD67Lv/YRUlQtY+qT5SUnzwnduWAPRc+ZRcPYYFzH10xGAUDpWa9f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X2a5Dp0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X2a5Dp0H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC82CC2BCFA;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=gOLNNogmoOOUL45wHXQtYclrVHmbDfqCCG9L2KZ0nIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X2a5Dp0H0laPCEG8lrUdiOBOMoR2sBtKhK1u61LzZXCvo7j/w2tyhcmnRdBHH9l7A
	 nfM0nSS72df6lPuZYFUe+8O49dcx+L2Qrxb8L2e8ECrlaviuI+TANvkIMSjHUUcKvP
	 +laRUzu/RbQqnoJULSVpa5UcqUl2bqhl+xWQw24c=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ACEC88E6F;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:21:04 +0200
Subject: [PATCH 07/10] media: i2c: ov9282: drop redundant vblank field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-7-f520af59df1b@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=2525;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=gOLNNogmoOOUL45wHXQtYclrVHmbDfqCCG9L2KZ0nIU=;
 b=UC0U5HwzoIhjoGvQsq/peph0ucT2991+FX2i8rB/xNgGLAYdlDCgUuUqZysXuVZK6hQyes9I6
 YhrtGd6BADYCUjCTQLPWjrtLSWg2oubxi1zHtdjLagIsaSPL5F+F2eW
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

The ov9282 main struct has a dedicated vblank field which was only used
to duplicate the value of the vblank v4l2 control.

Therefore drop this struct field.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 632184e76b9bd..28f8b05b4c09e 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -193,7 +193,6 @@ struct ov9282_mode {
  * @again_ctrl: Pointer to analog gain control
  * @pixel_rate: Pointer to pixel rate control
  * @flash_duration: Pointer to flash duration control
- * @vblank: Vertical blanking in lines
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
  * @code: Mbus code currently selected
@@ -216,7 +215,6 @@ struct ov9282 {
 	};
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *flash_duration;
-	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
 	u32 code;
@@ -646,17 +644,13 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 
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
@@ -704,7 +698,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
 		break;
 	case V4L2_CID_VBLANK:
-		lpfr = ov9282->vblank + ov9282->cur_mode->height;
+		lpfr = ctrl->val + ov9282->cur_mode->height;
 		ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
 		break;
 	case V4L2_CID_HFLIP:
@@ -1412,7 +1406,6 @@ static int ov9282_probe(struct i2c_client *client)
 	/* Set default mode to first mode */
 	ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
 	ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
-	ov9282->vblank = ov9282->cur_mode->vblank;
 
 	ret = ov9282_init_controls(ov9282);
 	if (ret) {

-- 
2.53.0


