Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837047;
	b=i5UF4Vtr4C1G5phmCPdjIcO1GZbeQ/1NF6uToLPjHiuCXzf5nG1UPe6XHCYDL7GfrJbC
	 9v3xgxvu6Zpr+R3f2on164fxyFNG6rqi2X1uiC9nDP+/Y9sRSbakjxofAvw35NI5JERSB
	 cIqiCg0L44R68g/NM/2/xtDj6BqEdmNqj9bRX09zGEAVLF3kGq5z/xpV5CZjYdcCRtnjL
	 P4CRgrPFpzjRqobTZmoXtpMK2HMP2oI8mX1Ru0/8QxXg9vQzZHmVpup/2k1w8SeDdklj+
	 FNIAjuR6fBy+zIn+rTDyzoK3YSAwjc172m8bvuFYNkjFAmEFiwlGCkP3jybki1ImolA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837047;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=mAqXASWEwKNJlgbkYUnmm9/eh1J2EEYCYnitlV4p82M=;
	b=ZFt48Kw+vx3WIpfvzPT6N9kOtm2vnOdwv4lBmlZfuEqtaoOfyNsGuOHP4jJ1ooMHx4yD
	 SPy77zOYXU4dvLPmDw+j5IrPg61TOohmtgpNHIdWAxN4kfPpiBVdbgHmRJLBEgZw3LEBf
	 ewTlnEtcbIVeXM6Pi+AuSQciOWBmp401Ia1ZDjN/eY7nUSZwOtzWCkjlUv8dgxWq5W3W/
	 eBnIjL4WHd6qc/mf0UQdVGlXzgOQqm9BO8wXplFpNI1sG/7VpRjvU4RDuYxqwKFzFAOpR
	 aa2SLbJY3hGGKVa4CZw6ce/MkuOw1xgc6BnMrVkonir5kgei2Rz/lomaQnGBhE0d5Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=vC0HloUX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB3606A31C;
	Mon, 16 Nov 2026 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=vC0HloUX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794837047;
	b=3QNpmVDlqvDOdfwGFACz5SpAGt+qdg/mjDuijdj58EKJcbq6T2VQeQvOJvkP83/Y32dC
	 SpfGCTWlTKlUrnMogNGpYQqdhJDqKnmf2AgixKYT77l6KNHqTOsfNB2FiKObzqBrfE/ed
	 b2Zmm0rokleKZ+kbvi6sCCTu+smeLf/VTRkSwwfViOoAVjFntqjulzau+6XAyZjcDUcBD
	 VyvdEGaZHKmu+yfPz35M63B83v/TYzhzMaJYNbPyeetpYBKyQzCXJxPqMH4kfoFSKHVIA
	 /kvm83BGDqPRdmutrFMhMZ02Op8sW0vKaLQ3WLU7nK+hg0ckkeK3cOrquqXqbKMCHHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794837047;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=mAqXASWEwKNJlgbkYUnmm9/eh1J2EEYCYnitlV4p82M=;
	b=CacatrLWBDTUfL8c/9AFK16nsWZ2lIMjgkS+tuWyc71XTVAofkHe7K1E1Nh9ddbtMJ9c
	 WpFACvcDjiMKktRif8RGGCuFIn6d3HB7qdfzUU0GC1jEYYB0s6rQounuXEKzlSklhh3p1
	 tuhb30wIJweS6MuOKcX1CO0WoHtYevdAT9vCh3EHFAD2DW1h0Pgqwg5138fV3uoUmuHDD
	 MTXx/Yn9oBDMO3kem1Wnn/R/K2/uFkhV9Ws7RYabXFzIawEr7HPpdGQTjN37tEB0eDyTN
	 OrDM4kqRe6JgcLg1m2UgKiYYrK8Sk0xSj0ajp/4bSycoWf/yss5PEi2u5p+kzxwYFWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F2B31F00925;
	Mon, 16 Nov 2026 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1794837047; bh=mAqXASWEwKNJlgbkYUnmm9/eh1J2EEYCYnitlV4p82M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=vC0HloUXD+09mh2+e4GUgoQojMxwuEveUfpcWatiRQzsi4fbg6SVs3SSBANQKDkrH
	 i01RyLKfpt0NsfnHcI+QlJM7lxGvonbcBtHNRskwok3rfFQhMQztLWsQvay5BwoPBF
	 8FWfLwYNKXVnaWrRFasBFTgAkxtn133j0A0JkFrw=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4CC434A4AB;
	Mon, 16 Nov 2026 13:50:44 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 16 Nov 2026 14:50:28 +0100
Subject: [PATCH v4 7/8] media: i2c: ov9282: drop redundant vblank field
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
Message-Id: <20261116-ov9282-fixes-v4-7-f78e5d415c6f@linux.dev>
References: <20261116-ov9282-fixes-v4-0-f78e5d415c6f@linux.dev>
In-Reply-To: <20261116-ov9282-fixes-v4-0-f78e5d415c6f@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794837042; l=2587;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=EUt3kQszUrH4kl4qi+Rcn4YWMUuh6ClfnKzJw+nORxY=;
 b=AjflWeUJfhn1NFccw0nwhNvafKNut8fFD+JBlgZq4SjcHNzqV6LSo+fg4LdU3DkmWvNvElbuY
 xcQ7AdPg7WQAZvBWv3XU4yMf0j5fg/lK/GJwaFr6yR8hm/FxACS0VLQ
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
index d18fee6730990..01a9144cf8df3 100644
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


