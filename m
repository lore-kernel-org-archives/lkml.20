Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537730;
	b=biwbB8SHsD/gHwSDtqrZe/e2ZW6sRYKnwGDrtkzQaYRx2O0A66KrtIaLA8IWN65CYMIo
	 PF4skFsY7B23nqSCfKklc0sw0J3UcalWBmdqvNz9qsFwDv9xfROpmY9oshVVw3xiFvDNU
	 ZWs9Tynsm+tAsOP+PJigH1sl+PeVKoNjdAm4s2pvvHNXaNiqcj4kexFCFcUiPPjAA2GQ8
	 eX9FGO4YZzDPpY55/KjBYgro0LHpuo+SDJ/iiugkQ530Kn5pRBc1IXciJ/2gjliOR5ydg
	 HQ/daXA9zickJJPvjcvvb7x8GGIONz8foxhf54/0D01dZdj5JMo1xiDGHCBxaP06nIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=chrUwurn9yshXTjogf6DMteu0AabVynmDRhmlPZAR9M=;
	b=BvKzA6BCVX8bTMWteerpsPkqyNjkFDoVdE236G82RmMpnrzfQoSVTVcE/EOBGZQ4eoY1
	 aV7q4M03dCErMwo4FxhkZuoIsepJyYsjmxQZVM5zkcqQpW+k9q7fOILqo9x68DCuv4xNM
	 K/afzx5+ds3thBqC5C6dlFuSVYNOiioZLH6h7EqcEgaPh/9n9AVjwBzB57ewO2Zw69EIp
	 AOBWkM4WnqR54Y0ra3ANXbR7Iwc4ed2QLS/GOSLehONgXxKNId5U6gdWpfsb0oKLtEhJZ
	 ztOZsY1vq3HsOxrH8TOU2OknL1Hcd7JQUXYgkUUYLF+63v5VQCJJf3uucQVGzmd3Ssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B6j6CVbW;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E54606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E54606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B6j6CVbW
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36d1b3b9974so41361eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537725; x=1795142525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chrUwurn9yshXTjogf6DMteu0AabVynmDRhmlPZAR9M=;
        b=B6j6CVbW4fwNB533cmsXg754gzDcvAlvMQx1BI1FN8LEwWD7xjOXrYIeUCCOdmEkQT
         zpxQM55zl1PL1RzJ2sCnjJMXVjVOVTSZbdgqX6bN1gTr49wkXmxUVY2lXhsqRxuHVQHu
         GwoBET9oHdFnwGd+I/NkOfnIetDVyt5qT4+wDCT11yAR0YUSj9Vr7zkLEFZ2PFrHwo1/
         WFD53SIRS5hwhPkKoJZb1BWtbHBOBzeXWri4vsvdvDasb+QulV3bTg8RSTHtLDe25lyi
         wUmWqkMr0jtkhN7m7G+CNBuTUSad6xLX21G+0UIv+Zxy+jOX5mEdwJeIGkKd4hQ5U4jv
         Jz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537725; x=1795142525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chrUwurn9yshXTjogf6DMteu0AabVynmDRhmlPZAR9M=;
        b=d/gu3CqkVbD87v+6xoKxsWDqhk1c9kxtTX7C44q0iJYe9yEjPvgmTCZceq+rm2ULGV
         wjTwJxA6a9fFUBlxOIaNKQKMGXKjf6x1ceNwJyud/gnUhYR1zWfUke6SdPa7g3m6+bCq
         FWdg5ztyKCOrpeKyqU7be3+v5msBJwju8JBSy84EQHZp8bnd0YIsATvtH+hFQ3UrOf+Q
         ekuY0tFIpLBCuIXJzQIP0o+s1YGgtCkKON20zrGunYsl5AUyV9VYJdvp+LzA9rhy9Noo
         vce74W1Mu9HIU/FxkftQoIszKhR0kLpg1iMEZ8rwg5Pv51aiX6WZ+6x02pgRXkGZpP/5
         f8mw==
X-Forwarded-Encrypted: i=1; AL+hErHPa2M1TO+1IaZmjJQjAzl7AVOEimhCEBzjBMGgoAdwAeUiL3LgH9YBYOf6KhuMKdrzGTtVr2xRYkZu+l0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QDcOS2L2Ml7tU/ysEP51IvYfFuWNJHRowlaw2FX9AnoWL0Zpu
	Yeux2y+g3ozjZl1rMtxQhMgXHpMl0r+p4Zo9q6nfj92xY68xDON/wmmt
X-Gm-Gg: AYBFou0+OWa4njyxaBeSSJ53IAnfOUg9qPTgbOzOLXc9+tiXWQVA5YPpABPx1zAb8Wq
	aAeezORi8940lDr6FZbelPHU483kYFo2KQeq6elXtJtmz4YjNcQmQaVHDCop1XlNI5mmhEgh7uQ
	G13DAvV33QixxIQEA3RujWVwsjJfoi+HBvnCDcpAmv4c607OOFRjtKzF6eQeyLXmwhEfS7fLTvk
	znBwa+ZHPxOc4Aal1sl+f+qyuU+VvfEpOBprlcHCUobYS28s6aGj/cI3l9R9+0kTJQNTmuxUDi+
	QrfQGD4A5whOH46FDOYJX5cFPbmbt/Vqjo5h+irtUpofL5/x3UxTTmaDTCCLJve4/sv5UthBphc
	ciOUUIDIjFIgmI0VMidBV54+UNn0nEZUVd13TcXL9q6oBVcYkMCVHm9auhQXiTY9MSLkOyp/YdB
	ZaQs3BXupmp4R06YgONNcPig5M1MbjniL/ChM0a5wLLEeEdeND/YoM/GUezT8qhSI4PMBdOi4yb
	aq13IWcT+y5ljksJlUS/yjXtv7fTk+jSgekMAg3uQjBbhjLPhZ3526JeK1X+1Wba28PB8KUZ4Ry
	OPYDg0kBb9eKebUXlkzfVBJm6tyE1BG12vtmwbBbmUUcocp2Agv6hlVN6ZFFylYuWnBpVaVDksG
	1TDHiizPMa90Wi0ey4/FoMLw/yA8ep8Ej/hrB2eq+12EHU73wm2ujOufaTU3ehEI/Fm9Wsp9brf
	64o1pNOKAELA==
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr1702393eec.1.1794537724468;
        Thu, 12 Nov 2026 18:42:04 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:42:04 -0800 (PST)
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
Subject: [PATCH v3 8/9] media: i2c: ov7251: Add strobe output enable control
Date: Fri, 13 Nov 2026 11:40:58 +0900
Message-ID: <20261113024059.1087031-9-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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
LED, GPIO line or regulator for it. The global init table leaves the
pad disabled, so the camera only sees an unlit scene.

Add a V4L2_CID_FLASH_STROBE_OE control, off by default. When enabled
it sets the STROBE pad output enable (SC_REG5 bit 3), strobes
alternate frames (frame pattern 0xaa instead of the default 0xa5, which
lights four frames in eight) and sets the pulse length (strobe frame
span, in lines) to the exposure time, clamped between 52 lines and 45%
of the frame length, never more than 776 lines. When disabled it
restores the defaults of the global init table. The span follows
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
same. Face recognition uses the dark frames too: subtracting a dark
frame from the lit frame next to it removes the ambient light. Lighting
every frame (0xff, which two of the Windows driver's other modes use)
would lose that reference and double the average emitter power. User
space tells lit frames from dark ones by their brightness; V4L2 has no
per-frame illumination flag yet.

The control is written only while the sensor is powered, and from
__v4l2_ctrl_handler_setup() at stream start, after the mode table.
Setting it while the sensor is idle does not power it up, and the
emitter goes off with the sensor when streaming stops.

On a Surface Book 2 at analogue gain 128 the mean pixel value of the
infrared image of a room is 19 unlit; with the strobe enabled the lit
frames read 496 at exposure 504 (span 504) and 587 at exposure 1704
(span 776), the dark frames in between 18 to 20. The span read back
while streaming is 258 at 90 fps, 45% of the 572-line frame.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 76 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 2abf1b112351..7c1213d13ef4 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -56,6 +57,16 @@
 #define OV7251_PLL2_DIVIDER_REG		0x309d
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
+#define OV7251_SC_REG5			0x3005
+#define OV7251_SC_REG5_STROBE_OE	BIT(3)
+#define OV7251_STROBE_FRAME_PATTERN	0x3b81
+#define OV7251_STROBE_FRAME_PATTERN_ALT	0xaa	/* alternate frames */
+#define OV7251_STROBE_FRAME_PATTERN_DEF	0xa5
+#define OV7251_STROBE_FRAME_SPAN	0x3b8c
+#define OV7251_STROBE_FRAME_SPAN_DEF	0x1a
+#define OV7251_STROBE_SPAN_MIN		52
+#define OV7251_STROBE_SPAN_MAX		776
+#define OV7251_STROBE_MAX_DUTY_PERCENT	45
 
 #define OV7251_NATIVE_WIDTH		656
 #define OV7251_NATIVE_HEIGHT		496
@@ -149,6 +160,7 @@ struct ov7251 {
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *strobe;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -512,7 +524,7 @@ static int ov7251_write_reg(struct ov7251 *ov7251, u16 reg, u8 val)
 static int ov7251_write_seq_regs(struct ov7251 *ov7251, u16 reg, u8 *val,
 				 u8 num)
 {
-	u8 regbuf[5];
+	u8 regbuf[6];
 	u8 nregbuf = sizeof(reg) + num * sizeof(*val);
 	int ret = 0;
 
@@ -764,6 +776,55 @@ static int ov7251_set_test_pattern(struct ov7251 *ov7251, s32 value)
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
@@ -805,6 +866,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
 		ret = ov7251_set_exposure(ov7251, ctrl->val);
+		if (!ret && ov7251->strobe->val)
+			ret = ov7251_set_strobe_span(ov7251);
 		break;
 	case V4L2_CID_GAIN:
 		ret = ov7251_set_gain(ov7251, ctrl->val);
@@ -820,6 +883,11 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1282,7 +1350,7 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ret)
 		return ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 12);
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1330,6 +1398,10 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
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

