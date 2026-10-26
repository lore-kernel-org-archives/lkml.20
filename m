Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013053;
	b=yukOfV26bPfLPiLYgqKyYQ8eUZaiR+vGVTvVKYsubVW/r+VP4jivxqjgmWQwRPaUvxbx
	 fb2FKVk1btP3h3L73L0fXO0tMZcNpa3eWqgGcUvvQTuaWkXoHGUF/cogFcTNtiXJKq9jK
	 CtVHqfI0dXNUP/C4GfzAeCnA55aQDpAjpO6/AaICFkv+vyOxCEsfQ7fxccUqu7Adrvky3
	 75ZLFq32F/Hb3WDP69vsR50Vc/ZFxA7XNKEQsUyhZ0gLj4zMkFewtwID8Bfam/gtHyz3Q
	 p6hoOqF7n7Be0kxXFAOtnxIy7+NYtYjbGXJNb5Ecr4xq9uaRnfzcswwjAYVWw16LhqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AeJpWAOoIyC7Os3oyjM1e/I/dQTm9UtGMECDstaLpqI=;
	b=BY2o4tRYu3ZA9SO7G6G+B+1aeINUFAn6k57JqjId+RZDJQfLXlZQYB8HGJRqy1Lu2vTA
	 0QlDkT9Tz8hirzg+AV+r2yPUpvkmyOIbq2w0putHDgl+U4+7RkTTYebr+UT+7TPlbWzoq
	 dPTSqheZrDpcKyyqgdjHsuPNl7s8g/llM7WFv4BexqEN4OtV2pjnUTDsl3yCiJfbDckGq
	 6M32uJK+lMoIiroJKo4y0tZGJ5GHKF29MQ1C7aTi1ayHBUM1rXosUPqkU/fjjtYjZU9pN
	 eSbfZyB+1t/sOSj3qu52+YZANAo3tNlzUfkFaUEA121uugxY62yj8xl3DFfIBnjDikA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqtNd8ya;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3D606C9E4
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF3D606C9E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqtNd8ya
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e93e0d86a0so2746925ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013052; x=1793617852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeJpWAOoIyC7Os3oyjM1e/I/dQTm9UtGMECDstaLpqI=;
        b=IqtNd8ya6/ORt2YKtwr67E73cC01QsBlM0+wf1OeJcklU+2vCAjNrlfBiy02j5c/qH
         ufH5MXCbUX6UqziazDE3rfKFrqMzVhLhU53slPRjw5AUUutSpTusblnGeDGqCDiH2uHj
         mYcb55yiZNEBNmQRfEi8wPTFwbPL11bIeduYwZVrMsmOqHtpeCk54LARZlsnP9+yazH3
         FG0+3LumFRnQ8Oaf0lzneGOiAhSxb3SV6G7PmPkszzmVm6Y8gaH69EY4ZnZM2D7TYyEw
         y0Pl84qiyR14K3qgC9TflBHC+kF4dhDjOmEoZUmydiVyCYx24ciA1Sk2e6LGLav4McnD
         vquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013052; x=1793617852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeJpWAOoIyC7Os3oyjM1e/I/dQTm9UtGMECDstaLpqI=;
        b=zwOAcQpv4bFjlIAx4ILGjeRGSXgD2Y4eP/2LU1JhZifzuzYxFnv4pUw0Jsdu67O7Wn
         MsBfpWa3P80ADiKNr4C8r17Xm2GiKRpZqlglpVMqsBUDdLKHXh342yJdi7uwyq86uRXu
         UM81RCIUGJl9Va2E1xahGc93ashApkggIJbtpoY/K4styqKpjyC2drtnUgOlQjTSoAM4
         6vxh6Jr271W56xqiE/viab6/42pnSsEFYPNyR2DnDQzOdoKbVrTGLzf/Q5k4DH5TPpa+
         p8CMve0MmUCRf/teQum6OaGVR4uKAvrA6hZOJts/an5XIgkPKzh6ZkJuw/5q++e5xUyA
         1ZhA==
X-Forwarded-Encrypted: i=1; AKwUvBzMnXIl3TCOBtr7+1Bj0CXO4dS0gHoguqpIm+Mc7lj4ryk3nUXpoOTyq1qkrYCsdiCKvpLGiAjRTqdZslM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDNePJxpyzc9vAcGmwkYVrBEEBIQNBxW3jEcfeMqVKs0wDdEn1
	LHDMMJIgYMRy0kQ1ITp8I8ZN1m1Ama99jD7ePIWJM5cxtOQx/FBOU4B3
X-Gm-Gg: AYBFou0Z8HAtjD6vBdGLsPETGzlLk1C3Cfi+KoNV6xhgnV8jTUQIambmjaEuYnsKGag
	1pW3bmYTvtaX8VwTaJbMnlmzAvjHGtylseZrrfjxi0ONZVyGRQIFGechKn16vX88p5Q/ks9Mcyw
	XKVBY5EEa5wMKSMwrNuxtk15uqoVcpPo+D3F8xpucUozv/F51XZIMjkM8iWvLbxwV89SBiSCJ4b
	10ZTUZpACGSsgssTU/L1Fe7/mFl0+VwVJ1Acn0H4pskJglHvsp6wfGQSjXrorTts33E+cV+9ojY
	iT4n5w+dG3blyNvh4ZBtiFsyPDsDaIkMLhrqL1L3qAo7u9bAJ18g5SyYl0tCRU5B0R+o5NBYQ1X
	44+mLvVrh2SAm/CoyNEFpyt5w6oYEPMpzILSvAeTQn6+jPSGqK9Z8PDXCZU0otHvbVaSaLXX4dn
	vYmY7FMW+mg+NK1M+lPwvRJQwrJv49dJlQXJHGW9d8J/F8zJBfUEjMs7Lf7kAAXgu4FKzdO2zNx
	bxn8G1HTNMOxe5EARopekjUAZs7Deaydp77zgH3ZZ0SNZalySmOgERtiUWbVCNZLoRgJJ8NSKIu
	0w6xSkT9G7sXaOEkpepE68LttqLRPHSMEexDH86YMqJuSOOlAolCKW4HvGptXHl4AI327QT37UP
	/g/p0jy517L5z/17tNvwPDxO3A7opMgb/TANOt7i+OQ42DiKvLkmqQxa3dwOzzyTVkjI=
X-Received: by 2002:a17:90b:55ce:b0:3aa:ff60:9bb8 with SMTP id 98e67ed59e1d1-3adead62140mr9315977a91.3.1793013052375;
        Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 6/7] media: i2c: ov7251: Add strobe output enable control
Date: Mon, 26 Oct 2026 20:10:31 +0900
Message-ID: <20261026111032.88355-7-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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
index ad66422d9e..de650b4457 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -54,8 +55,15 @@
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
@@ -151,6 +159,7 @@ struct ov7251 {
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *strobe;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -243,11 +252,12 @@ static const struct reg_value ov7251_global_init_setting[] = {
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
@@ -258,10 +268,6 @@ static const struct reg_value ov7251_strobe_regs[] = {
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
@@ -724,7 +730,7 @@ static int ov7251_write_reg(struct ov7251 *ov7251, u16 reg, u8 val)
 static int ov7251_write_seq_regs(struct ov7251 *ov7251, u16 reg, u8 *val,
 				 u8 num)
 {
-	u8 regbuf[5];
+	u8 regbuf[6];
 	u8 nregbuf = sizeof(reg) + num * sizeof(*val);
 	int ret = 0;
 
@@ -976,6 +982,56 @@ static int ov7251_set_test_pattern(struct ov7251 *ov7251, s32 value)
 	return ret;
 }
 
+static int ov7251_set_strobe_span(struct ov7251 *ov7251)
+{
+	u32 span = OV7251_STROBE_FRAME_SPAN_DEF;
+	u32 vts, max_span;
+	u8 val[4];
+
+	/*
+	 * The pulse starts with the integration: make it cover the exposure,
+	 * from 52 lines up to 45% of the frame and never more than 776 lines.
+	 * The vendor driver caps it at 776 lines, 45% of the 1724 lines 30 fps
+	 * frame; the duty cycle limit keeps the emitter within that envelope
+	 * at higher frame rates, the absolute one with long vertical blanking.
+	 */
+	if (ov7251->strobe->val) {
+		vts = ov7251->current_mode->height + ov7251->vblank->val;
+		max_span = DIV_ROUND_UP(vts * OV7251_STROBE_MAX_DUTY_PERCENT,
+					100);
+		max_span = min(max_span, OV7251_STROBE_SPAN_MAX);
+		span = clamp_t(u32, ov7251->exposure->val,
+			       OV7251_STROBE_SPAN_MIN, max_span);
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
@@ -1019,6 +1075,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
 		ret = ov7251_set_exposure(ov7251, ctrl->val);
+		if (!ret && ov7251->strobe->val)
+			ret = ov7251_set_strobe_span(ov7251);
 		break;
 	case V4L2_CID_GAIN:
 		ret = ov7251_set_gain(ov7251, ctrl->val);
@@ -1034,6 +1092,11 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1574,7 +1637,7 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ret)
 		return ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 12);
 	ov7251->ctrls.lock = &ov7251->lock;
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
@@ -1621,6 +1684,10 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	ov7251->strobe = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					   V4L2_CID_FLASH_STROBE_OE,
+					   0, 1, 1, 0);
+
 	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
 					&props);
 
-- 
2.53.0

