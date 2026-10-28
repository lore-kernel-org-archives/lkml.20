Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186543;
	b=rj9ehZypImdhb219Ne2TuXGKsz5Fp+w4PeWc+Cujjw+Mt4gfeU8MXe5O2fxw+0NB1kYU
	 1O7itgHaqMewVKT/8Bs6DVzGcq8BHugF7roUCTeKW7TMbUS3MJEmeBduCo8jzXSpb6CTs
	 q1/0FQeTxJRSh3Zw2R9dfQN/kgi8IkKQViujRlLma5ngxIQhHMDE5T+bhWm8tXYfT7050
	 YhnNo8knBPHb6oyYJg8cP1686RVDJ8X7N/W6pZd+p48dfZcqmKR9RIYhTiX2vJvZVf68W
	 gSyaH+kKfq3T5ndaiyhyI0WKa2ZFp/xD1hBPiIJTTtU4somio8xFl9nQCISX7FtHQJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pul1Fhca+grMcQyvGnARxk1W+vD6J7riCc/t80iWOCk=;
	b=ZAv4Vs8tDUNCGfVwvlV3ZatlMEdcLb0//YRnRMNreARPFjdkKDdocdvH6g+NulKwriVY
	 l2YcnalXbd77J3l9fiX7sdy03t+wyjv3CubLYCtvrAqWJvLgvzuMelCkbzOncLDVRZzvS
	 Ve/yHPGufFnI7j8nurQP4x3CKbEJwFvugX5fGfx0xrAK6ihRnlfRkImzproIhEAtTs2eb
	 Y9O/aFyl3GKVc7RtSkrF4AAeUm0DqssWTyJH+zxfS0a+M2Z5no/yhbFGzcYdj1JWx8UKO
	 OL7d7eL8ndUIrkmVk7pjfz++y8BTp4v7VMpY7eJPTdnQxM4Px4v+uqW+mgr7lCpvrPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmWQIlOM;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B660A3826
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339B660A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmWQIlOM
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea19c28a50so1146135ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186543; x=1793791343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pul1Fhca+grMcQyvGnARxk1W+vD6J7riCc/t80iWOCk=;
        b=LmWQIlOMmuhbSI++9X11w/lQO3vaaT5W7ZFFiN0UxdoEr4iYPcB1aRlMt8hlaYi+9Z
         wCOhiVAzcYeWLyprxKNL8l/JpuDXtVg8uwt7WXfJ/wJD8Ks6X4yyKSPDAlDqgtOn56hy
         5ibJalntUBWH+2OC38MYn9EiFdgFsvYIRFv6iOw2yUoDCvLj8mL4hPE8S2OQs9+59evF
         I+sflQrcuwQHkuu7aeVjrwMffXPwmdL3yXVQjmVccDQVpzI7sAUtXfDaTreL3r0o8L9E
         ox4V8oZ4PBHk0tfE8HSHHuNl+mlAJ0aaPQ5D3z6sTME2dASvTn90QZWSEvLtQ/boWnrE
         nAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186543; x=1793791343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pul1Fhca+grMcQyvGnARxk1W+vD6J7riCc/t80iWOCk=;
        b=f2Yi17UHl3X94RjRC1sO+4eyw+Pes7nnRe38b0QMNC+ky70alCUasRH+NL/h2tRbQN
         POOu+pxWKEnaFbxBgBtuPpGDAtm9TAjbZ8ZyTahxGYOeu+nC95Wy5AOw1EFQ4MkuG00B
         iWtgEtJkUI7N4PT81sEtIgVexdS1HTUlJAja5nVN3fACRxRRkCfHZC8tiUE/inRBoXzA
         r38llYwUrQRSXRU+6gL3ugsu+lqs2nOuW4+68Z8MO3dBYXj++HSBDBqQ2fe2W8KDx3fk
         eP6Hy/P0kGYS0purTXDS2agrNX+R7ljgcaO2TKNlT5jeP2aQzrv2AsiXqBsfLFcCTBin
         1pyw==
X-Forwarded-Encrypted: i=1; AKwUvByo3neveGNIF/lsqh8vWjK56gfq5R00ja2HgtjBhPbK8v/FkWHyQ3WlbXpx0N9rr3zwWvtNTdcyjyQqYpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWFUZ88f+0v8WU/FlHhRKD8oVLjdOwGOyeMaYOTwu4HGfPvoY9
	7LDUc/WV92LWJfAFfIHRCyDmNCkxZzDksn19nYtEGdreWGXtrJutvoxE
X-Gm-Gg: AYBFou3AMKzbRJVxd1xbZ/gdxSn36aRDQai8BYaVW3esIm+vuPgAVT+9+Ql/xVeq22c
	4VL8weNskt0+Avjm1zHtL9blGDJqCLJWIoWTL+OzJwBkE1bZgtt0TNDBaC3W5lVDbOhxFhzp6+W
	/slvogqOrx0WctbrSSxFh0b4E9mI9EuacYlcREY6at0VskLKj17e/XkFk+FRdqLylCGTStN2nJQ
	MBUnNjhWrgz1p04krN8zCoVefgUnVMeQSGPvoUiCzGLZWohxUNQlNsawo7+49KMVZSshyN2bQb2
	SWZwvtY4P86AudkSzprRoFRU/FKLH7h9n2GbZHrw6TJ0XIN80ovF/bFZRDacy+JO0KMP7nEn7NO
	yTDPrIeRphNKxqng7OXKtftnLj0/j2e31J3tRcUZoYzIBAxl3mzdgQia16/58EnOIDHriXJe5EW
	3mX6SXqiHT88XUwnPAdE7PD/u76yKBWUvcCP9zlWaLDFUKasXMyM6fdLBAXkuQX4bPxbAJA/dWK
	aymNG6LprboxdaPIIptT+SLb2ZAlhDxE4RZPEoYgpaC8GYHGXRPoQOIZ2WsUWijJQoIx2vt2esU
	RxKPbGgNQ20xN7ZsDIZT45RGbzxPjanY/IzTt0cC0eW82D5xGjeUWxFaTdtMZ//2v3S5N0m6sQu
	VHcy9X3QTkKMHQGUDXaw/kRy/WwUGO+6z6hI5ziTxbpsqGsmG1KJic5P8R3H0wGju+wPK+gt1XL
	f9jMHT7j/uJ5iSV6SqWZk=
X-Received: by 2002:a17:903:46cd:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2eb0008e281mr37292725ad.1.1793186542551;
        Wed, 28 Oct 2026 04:22:22 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:21 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] media: i2c: ov7251: Add strobe output enable control
Date: Wed, 28 Oct 2026 20:21:53 +0900
Message-ID: <20261028112154.855185-9-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OV7251 has a STROBE output that pulses during the exposure of
selected frames, meant to drive an illuminator. On the Microsoft
Surface Book 2 the front OV7251 is an infrared camera (Windows Hello)
and its 850 nm emitter is wired to that pin: ACPI describes no separate
LED, GPIO line or regulator for it. The mode tables leave the pad
disabled, so the camera only sees an unlit scene.

Add a V4L2_CID_FLASH_STROBE_OE control, off by default. When enabled
it sets the STROBE pad output enable (SC_REG5 bit 3), strobes
alternate frames (frame pattern 0xaa instead of the default 0xa5, which
lights four frames in eight) and sets the
pulse length (strobe frame span, in lines) to the exposure time,
clamped between 52 lines and 45% of the frame length, never more than
776 lines. When disabled it
restores the defaults the mode tables used to write. The span follows
exposure and vertical blanking changes while the strobe is enabled.

The limits come from the Windows driver, which clamps the span to 52
to 776 lines: 776 lines is 45% of the 1724-line frame of the 30 fps
mode. Expressing the upper limit as a duty cycle keeps the emitter
within that envelope (eye safety) at 60 and 90 fps too, where a fixed
776 lines would let the pulse cover up to 96% of the frame (552 of 572
lines). Keeping the 776-line limit as well bounds the pulse when
vertical blanking stretches the frame, up to 65535 lines.

Alternate frames is what the Windows driver uses for face recognition
on this hardware: its 30 and 60 fps modes write 0xaa, and a register
dump taken during a Windows Hello sign-in on a Surface Book 2 shows the
same. Lighting every frame (0xff, which two of its other modes use)
would double the average emitter power. User space tells lit frames
from dark ones by their brightness; V4L2 has no per-frame illumination
flag yet.

The control is written only while the sensor is powered, and from
__v4l2_ctrl_handler_setup() at stream start, after the mode and strobe
register tables. Setting it while the sensor is idle does not power it
up, and the emitter goes off with the sensor when streaming stops.

On a Surface Book 2 at analogue gain 128 the mean pixel value of the
infrared image of a room is 19 unlit; with the strobe enabled the lit
frames read 496 at exposure 504 (span 504) and 587 at exposure 1704
(span 776), the dark frames in between 18 to 20.
The span read back while streaming is 258 at 90 fps, 45% of the
572-line frame.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 85 ++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d08bd373b3f3..fdc247448e92 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -18,6 +18,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
@@ -56,8 +58,15 @@
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
 #define OV7251_SC_REG5			0x3005
+#define OV7251_SC_REG5_STROBE_OE	BIT(3)
 #define OV7251_STROBE_FRAME_PATTERN	0x3b81
+#define OV7251_STROBE_FRAME_PATTERN_ALT	0xaa	/* alternate frames */
+#define OV7251_STROBE_FRAME_PATTERN_DEF	0xa5
 #define OV7251_STROBE_FRAME_SPAN	0x3b8c
+#define OV7251_STROBE_FRAME_SPAN_DEF	0x1a
+#define OV7251_STROBE_SPAN_MIN		52
+#define OV7251_STROBE_SPAN_MAX		776
+#define OV7251_STROBE_MAX_DUTY_PERCENT	45
 
 #define OV7251_NATIVE_WIDTH		656
 #define OV7251_NATIVE_HEIGHT		496
@@ -151,6 +160,7 @@ struct ov7251 {
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *strobe;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -242,11 +252,12 @@ static const struct reg_value ov7251_global_init_setting[] = {
 	{ 0x303b, 0x02 },
 };
 
-/* Strobe output settings, the same for all modes */
+/*
+ * Strobe output settings, the same for all modes. The STROBE_OE control
+ * writes SC_REG5, the frame pattern and the frame span.
+ */
 static const struct reg_value ov7251_strobe_regs[] = {
-	{ OV7251_SC_REG5, 0x00 },
 	{ 0x3b80, 0x00 },
-	{ OV7251_STROBE_FRAME_PATTERN, 0xa5 },
 	{ 0x3b82, 0x10 },
 	{ 0x3b83, 0x00 },
 	{ 0x3b84, 0x08 },
@@ -257,10 +268,6 @@ static const struct reg_value ov7251_strobe_regs[] = {
 	{ 0x3b89, 0x00 },
 	{ 0x3b8a, 0x00 },
 	{ 0x3b8b, 0x05 },
-	{ OV7251_STROBE_FRAME_SPAN, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
 	{ 0x3b94, 0x05 },
 	{ 0x3b95, 0xf2 },
 	{ 0x3b96, 0x40 },
@@ -718,7 +725,7 @@ static int ov7251_write_reg(struct ov7251 *ov7251, u16 reg, u8 val)
 static int ov7251_write_seq_regs(struct ov7251 *ov7251, u16 reg, u8 *val,
 				 u8 num)
 {
-	u8 regbuf[5];
+	u8 regbuf[6];
 	u8 nregbuf = sizeof(reg) + num * sizeof(*val);
 	int ret = 0;
 
@@ -970,6 +977,55 @@ static int ov7251_set_test_pattern(struct ov7251 *ov7251, s32 value)
 	return ret;
 }
 
+static int ov7251_set_strobe_span(struct ov7251 *ov7251)
+{
+	int span = OV7251_STROBE_FRAME_SPAN_DEF;
+	int vts, max_span;
+	u8 val[4];
+
+	/*
+	 * The pulse starts with the integration: make it cover the exposure,
+	 * from 52 lines up to 776 lines and never more than 45% of the frame.
+	 * The vendor driver caps it at 776 lines, 45% of the 1724 lines 30 fps
+	 * frame; the duty cycle limit keeps the emitter within that envelope
+	 * at higher frame rates, the absolute one with long vertical blanking.
+	 */
+	if (ov7251->strobe->val) {
+		vts = ov7251->current_mode->height + ov7251->vblank->val;
+		max_span = DIV_ROUND_UP(vts * OV7251_STROBE_MAX_DUTY_PERCENT,
+					PERCENT);
+		span = min(clamp(ov7251->exposure->val, OV7251_STROBE_SPAN_MIN,
+				 OV7251_STROBE_SPAN_MAX), max_span);
+	}
+
+	put_unaligned_be32(span, val);
+
+	return ov7251_write_seq_regs(ov7251, OV7251_STROBE_FRAME_SPAN, val,
+				     sizeof(val));
+}
+
+static int ov7251_set_strobe(struct ov7251 *ov7251, s32 value)
+{
+	int ret;
+
+	/*
+	 * The other SC_REG5 bits enable other pads, which the mode tables
+	 * have always left disabled (0x00).
+	 */
+	ret = ov7251_write_reg(ov7251, OV7251_SC_REG5,
+			       value ? OV7251_SC_REG5_STROBE_OE : 0);
+	if (ret)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_STROBE_FRAME_PATTERN,
+			       value ? OV7251_STROBE_FRAME_PATTERN_ALT :
+				       OV7251_STROBE_FRAME_PATTERN_DEF);
+	if (ret)
+		return ret;
+
+	return ov7251_set_strobe_span(ov7251);
+}
+
 static const char * const ov7251_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Pattern Bars",
@@ -1011,6 +1067,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
 		ret = ov7251_set_exposure(ov7251, ctrl->val);
+		if (!ret && ov7251->strobe->val)
+			ret = ov7251_set_strobe_span(ov7251);
 		break;
 	case V4L2_CID_GAIN:
 		ret = ov7251_set_gain(ov7251, ctrl->val);
@@ -1026,6 +1084,11 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov7251_vts_configure(ov7251, ctrl->val);
+		if (!ret && ov7251->strobe->val)
+			ret = ov7251_set_strobe_span(ov7251);
+		break;
+	case V4L2_CID_FLASH_STROBE_OE:
+		ret = ov7251_set_strobe(ov7251, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -1494,7 +1557,7 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ret)
 		return ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 12);
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1542,6 +1605,10 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	ov7251->strobe = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					   V4L2_CID_FLASH_STROBE_OE,
+					   0, 1, 1, 0);
+
 	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
 					&props);
 
-- 
2.56.0

