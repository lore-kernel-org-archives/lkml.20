Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316224;
	b=Nzw3Y9DNZ2JHSWsuVKTlnrHTdZuC6TvXwKe0i0kDTi8w8Yx4UGbN+lfW+dz70Bi/FAlA
	 ZNBtYOmFP11pA3+cVUupnqHWS8m5IWOvbiUIzdC/lt7EtrraI0HiHIGkURZKKU2pnhtq8
	 xQnt/lhQw3YXEaYgqzFA4Bh8masJ+bxvd70TFd0HGau2hwQJj88RpORkErIJFRDqZberG
	 G4fz+Okn2f6wzhdWY1OcLPkdL8+/qeGv5g0pR2MtJg3PyZRRgcfytu5rzbag1COhHCV4K
	 ADq5z0Zr981AnQeAkwTPOiTJkK2cJfQkMf0TRlcFjYWvyZgkFh3w47iqL0zhW/xy8DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316224;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=gu+ZjJCuTAfdDqIwkf9L1CZD9/vlEaB3MeDQlKk6X94=;
	b=WF+aLHzK7ZMA9M2/1PU5jIkDr7TMLPRenENTIFeZTYtOYEVkCIATs9JvErZn8/CEhpfk
	 rnLfM04dlgU8A6VL6GoWciIiZm7G8tZy2lY5hPBPAHQ7IYpjPfXkAF9b38d3qG/zP3Js5
	 /Y8KWcVLts1ZnWnhfnHQ7sPfgL8SXhkG3/9+OIUR+NcdG00PS4GYzakaz5Y65dDpUZGty
	 eVI/le4WvT2DM0ilV59hiJYaEP+G21tQEoXEJ2UFq8T28Cx7F61JNboE2EIVujt/CzMxF
	 FH7LYzLHCFVTher6nMEahfCpoNQtASIHlhj5/cocSI3B67PVc/2IfKAeWCIwZPCdf9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=0PQ1Frab;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C031606B2D3;
	Tue, 10 Nov 2026 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=0PQ1Frab
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794316224;
	b=0ZZBlSUxwt99RoqtlLJFUnXXhZ+YjiVtApbcttAe9E8NHQC7N3UN9/gofRqo+Sfq9S60
	 LrIEw4IfYGvayjzIcExmdH0FZUkcHhBP0CuBouOoxWBJBCVA2LxpJu1T+MQ9Le+5Hp85/
	 rHYWJmvo2AraoE1w/Vxua3jHqi+9SyHaUVjYkpehmXEqSM9axBJbqUs1XFtZUIx3x4qQM
	 MynvGnv9yOFJrN4JkhwNnQ96DfRsmvppngGh35EbbbJGbhuxv6ySN0Ls+kcuogS0/obu0
	 ascSv5qot9N3okfDxD+I6zPJatFsL5CLDghbCGLKjIHSrKkdoWJDkipdQX7xccqBLzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794316224;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=gu+ZjJCuTAfdDqIwkf9L1CZD9/vlEaB3MeDQlKk6X94=;
	b=YVMeHZuc5GiJdQTLFq+G1cOTOCASX8XTTVOen/KaOBNZUzGxZxkRYiRshPiK0ZsZnd2R
	 P7MsRQJDpiE+f/Yk/2mSyqX+oxQ/Vfdq2ygFlZTuM9IkMDLnNmmahNmEulr/1EjuD81Gf
	 ykGkINCVpE31Hwlc3QX+eL6KFN2kKwHY9Npwg0laOT8lP+wGuz0QkHGqiIXgk+nKM0nFa
	 WukzCHxFolISvrHjrvMee34Gh4w0tFkt5aiVJGZLa9iiMu2t9glbE2CynQl9wPuTVv3hW
	 58/wzjaxGiSZoabfRya59JAdk4zJb8q9h/3768xaGqr/HmbbVHRzLhPK68CbrOBjQtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49DA31F008BC;
	Tue, 10 Nov 2026 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1794316224; bh=gu+ZjJCuTAfdDqIwkf9L1CZD9/vlEaB3MeDQlKk6X94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=0PQ1FrabY2DVrkE/eScm8kWv7Yz9n+VYg6MC75d4MfNrAppF1O2nVBt6cwFCg52fO
	 5/0YNOiKgOecmU/xi3UAyo+ECbR24N7HWctKEjm/YtXrLGRubs8hQPsb9yaiqK6sQk
	 knvjrQxIdjckDyxNhJ1wbtSr4qjsKqs3MwF44ORo=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CFEC48B7E;
	Tue, 10 Nov 2026 13:10:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 10 Nov 2026 14:10:16 +0100
Subject: [PATCH v3 7/8] media: i2c: ov9282: drop redundant vblank field
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ov9282-fixes-v3-7-cb6df80cbc22@linux.dev>
References: <20261110-ov9282-fixes-v3-0-cb6df80cbc22@linux.dev>
In-Reply-To: <20261110-ov9282-fixes-v3-0-cb6df80cbc22@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316220; l=2587;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=crQJ9f8EsYTkvfucspMpYtviPUKObgIfvZ6RdzbwfZk=;
 b=mvndjk3+2li2lsiSbUa5cplumN//f8Jf9Y2dkcQWFutlUk/Qu8KRGX63rwhz9npI4dWesnkFx
 w1sJQUPeylwAuH4x/v3kCEn7VHvqM5IkXlKhAF0kBTv7UpnWBLhEBwO
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
index e46695d1377ed..d24fcdd4bcc33 100644
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
@@ -1384,7 +1378,6 @@ static int ov9282_probe(struct i2c_client *client)
 	/* Set default mode to first mode */
 	ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
 	ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
-	ov9282->vblank = ov9282->cur_mode->vblank;
 
 	ret = ov9282_init_controls(ov9282);
 	if (ret) {

-- 
2.53.0


