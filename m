Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D43A83B1;
	Mon, 14 Sep 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413686; cv=none; b=qOQcHyIHqi/qJH7BjbIIAwYzxax4Py7io2xbljwys2ODfR8lRZw3djnwKLHsOkeXtIa6YwasmrgA3sdv3MT4uWVmnlORN/xybKkwoW4RC6xPUsPaUA3gwEj3vXo+pM82DuTm/KrMZnddH6pgNETQiL4mrzLphPrCfezlL5hTKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413686; c=relaxed/simple;
	bh=WRRZv5zlWdvHmn5OUAoEkT5gk8q5459dLRB4h+01wP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkBlMoMRB/SL3KqjkI6WdjAB4IBiBhaFosaH9KbunwHOxuOAaYwSrUkdhsI/9MkqJw66Ii0A4Q4ggCUA13uY0TDIwPE7YQE4k3Va0OHBxeVSz7QiNtsfgQEOEBVA49PiIkiLhPiX4RaNHBX5r4lHbpfNvCJ7PmoSP3DSrndxMVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r+zXQqqL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r+zXQqqL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C4EAC4AF0B;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=WRRZv5zlWdvHmn5OUAoEkT5gk8q5459dLRB4h+01wP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r+zXQqqLgr8gWD01Rk0VaDLnn/MnaLENB3ph1AYCGAT45XSp46qAH0lC5KPezd4qu
	 yUXW+ffpqawUkKiCs3BK59lQt19B8TMw/U1YoyvdZ9Fs3+vaXhfXaUnQVAO6Yxfcus
	 YiRGCPm2devBdFZ7UG1ROzvXzhoqGPlfLYxk7DFE=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87474C88E7B;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:21:02 +0200
Subject: [PATCH 05/10] media: i2c: ov9282: add refresh of missing ranges on
 a mode change
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-5-f520af59df1b@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=2694;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=WRRZv5zlWdvHmn5OUAoEkT5gk8q5459dLRB4h+01wP4=;
 b=YCv5jeMAXcArDOaxGBVDK3QwlT/1EWgdg3v5yETaFDTPMz2hx2mwl69NDpHux2twVOsZ5iZ/x
 jrXP8GO2tfaClJ+QLvPlsu/A5ObPisDRuKlo8odzLvF9wk7DFEmpktm
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

ov9282_update_controls() updates the pixel rate, hblank and vblank, but
currently misses the exposure range and flash_duration. Both are dependent
on the line time and therefore the pixel format.

Refresh both, and commit cur_mode and code in ov9282_set_pad_format()
before the call so the refresh and any nested s_ctrl see the incoming
format.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 4c88de1965171..e64d8343c18e9 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -557,6 +557,8 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 {
 	u32 hblank_min;
 	s64 pixel_rate;
+	u32 exposure_us;
+	u32 lpfr;
 	int ret;
 
 	ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
@@ -577,8 +579,22 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 	if (ret)
 		return ret;
 
-	return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
-					mode->vblank_max, 1, mode->vblank);
+	ret = __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
+				       mode->vblank_max, 1, mode->vblank);
+	if (ret)
+		return ret;
+
+	lpfr = ov9282->vblank_ctrl->val + mode->height;
+	ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl, OV9282_EXPOSURE_MIN,
+				       lpfr - OV9282_EXPOSURE_OFFSET,
+				       OV9282_EXPOSURE_STEP,
+				       OV9282_EXPOSURE_DEFAULT);
+	if (ret)
+		return ret;
+
+	exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
+	return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
+					1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
 }
 
 /**
@@ -855,10 +871,23 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
+		const struct ov9282_mode *old_mode = ov9282->cur_mode;
+		u32 old_code = ov9282->code;
+
+		/*
+		 * Commit before refreshing the ranges. ov9282_update_controls()
+		 * and the nested ov9282_set_ctrl() calls it triggers derive the
+		 * frame length and the line time from cur_mode and code, so
+		 * they have to describe the incoming format, not the outgoing
+		 * one.
+		 */
+		ov9282->cur_mode = mode;
+		ov9282->code = code;
+
 		ret = ov9282_update_controls(ov9282, mode, fmt);
-		if (!ret) {
-			ov9282->cur_mode = mode;
-			ov9282->code = code;
+		if (ret) {
+			ov9282->cur_mode = old_mode;
+			ov9282->code = old_code;
 		}
 	}
 

-- 
2.53.0


