Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140250;
	b=HWKtSI8wnA6u7TAb3gX8HjF5FzoIxhjbAIZXPrI6MAxN6KCkTAk0hJhdbCoAqRFN6v6O
	 NvaYMyzAO4MJgVqMzvGpia46U1TLYfmS9Tf3H6YgsApAZjtLkvcYUD3IjoUXjg+/vAV8z
	 n+BJNO02qWOE294dWcIYgtM4gPUr2laEq8kW+jQP5sQct1Y9UT4Tqt9Urf1rKOkTUdq7I
	 clqFbNG+tjYWezfQ7tfDbIq9BrktDhtEjqSb2Hrkj0kWtD4/OEe8OHuxQWalFPgxn9tz7
	 BhEDZhHXxoZEwA3OlmWeOCnfsNS5Eq4s8Hj/fzbAEe2nYKt2m1U+I+ozLgnJh5jI0TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140250;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+kjltxbnkDZN6ozblFVGNzhZMSJyfZBHb8P9h4q1fs8=;
	b=CkF10gsOgoIOCR/pwSbf6LH4SM/j64lw9Kit6d1LVzaenma+G1XsNlviK3caCXQWftjc
	 SidE5w2L3Q1PUi8Eg8sbH9ORUOUQ7twHdvbr52qBzGqFIFQTJo98UMgyVBYqqwWBhS/AT
	 rhHykJ0jO/s1+e6PD89rq9Yl2z8TCwa6/h3m4BAckET0skK4lx/NT4Y5wmm88ePXHnLqz
	 EvlbFHaxRcEDiloZzlq5SQZEcriisdgHsZ8niqdqte0lYJHKScRW0zjMtNYTbidBfmrGq
	 0X0I0iVYl5To+5wCCF8P7qSxtaVlDOrKIay5hBF7RLfuF3N8z5agklTkBSpj4naw0Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWLFZSLO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA2606A33A;
	Sun,  8 Nov 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWLFZSLO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794140249;
	b=xuuMirpFiSfrc5Gc4hRf3vdJY5tsM4kKVrKsTDKX36FuWMDmCoDAQbzX9szOpSkS+x1S
	 0tta6z1lfmSeFyYsOibpU4MgZU0vsJrjTuZGomI/XsEFTbHYPW+GYHdPo4s5EfEsiHVYE
	 /kM8VfvNsOlJ8j6xvpat4zveqO4xlUWjYp5qbgZ8u04gnD8VrVJSlEGdXsaPn+BI9Bdvw
	 roIoqSjEYXFM7glZf6uLbPXHfvIn4hadMPnFuu9z8NP6FtdZ82v40JjQbuYRO0xKlCWNS
	 O02C5Gj8UEkI3MTFneDuspzT21ojePWJUeR8/1A+UdbC4i/4an7tkHo4tlgxQrBYE2g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794140249;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+kjltxbnkDZN6ozblFVGNzhZMSJyfZBHb8P9h4q1fs8=;
	b=ojCNrpD4Smo/Pt54sA11ymqzT6Q685Oa9vcpvsffAy5cNE1lezfKqCuTadfSuzo2cibl
	 Fg0m1/Lw0X1HJdyB6XoCgs0UP6vjfMmEMBfLeBIM9xm0Wn8getOSBYxYseApMOy7fww4o
	 Tyim3z7tmvQ5CBsaahqR7t750moQg4r9sOF8u72HTWN8EBkdLwdS87EbLm8ZuzuJIeY3I
	 3mBt4YdKYHMI47et6z9ljkPtJ+2swYE3WZQIH9V65r5FapwMLLjCTO7vud91G0Ia/Ghc/
	 G3XHu5tZwTRj25LZ5YGG1jrSyxaJtWzI2LiPL6Up/5WzfsU+4jZJWhgAkiAST0znEaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F4FD1F008A3;
	Sun,  8 Nov 2026 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140249;
	bh=+kjltxbnkDZN6ozblFVGNzhZMSJyfZBHb8P9h4q1fs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mWLFZSLOR6I3SUEsNfWkr6VViYI65XMzHbabMydqy4C0Mu0lUTmw/Uwr2Kbw7V81P
	 J87zffUB6bfPjphqRBc4+jUE8sTxEzuY+LqDNk0CRKB6cESM+tFATGRikvu4BXkXoM
	 4cXUgV1/vchrsdZV6idp2Vnx2jN0j+RIRvglOM0Pf9Xk5fxtDQV8WTYdvnBd5SieZp
	 QeOwHJqrDa2oux/pn5huvfzeqlJTLYgSN0p1eK+IkMOOpHQUy+FdVDox5AZYI2ITZr
	 nXgNfPgn2Od6KyVPYHjxg2dcdM+288imEYrBuiABjNGVYBDmAXWk+KzZUn7bXATQIG
	 Mjeii0DQQGqxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 00DA247F43;
	Sun,  8 Nov 2026 12:17:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 08 Nov 2026 12:17:24 +0000
Subject: [PATCH v3 1/2] media: imx355: Reuse existing CCS defines
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
Message-Id: <20261108-imx355-ccsify-v3-1-366ce7ae1bef@ixit.cz>
References: <20261108-imx355-ccsify-v3-0-366ce7ae1bef@ixit.cz>
In-Reply-To: <20261108-imx355-ccsify-v3-0-366ce7ae1bef@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9843; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=F6VsM+VGXnh6G4/JbUAIcADcqcIPq31RGAxTnO6cATU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq8GhXkVThQQsirxaSGOG4grFdXj93ZYjcpeUAp
 DSxJRFbwF2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavBoVwAKCRBgAj/E00kg
 ch4bD/9sY9ed66/rQUDcrXnQiKP1E6fby7ExoOfTqGBwuQyT+/PNFHGGk0ORsps/OAA6raR7xoa
 8IzYMelD4ygy806pDybNj4nosPUguiTdAog9sdWD/+QxPMGXQy/XyJCqIbQ3YO4HktbEcyaX6tj
 Kj6GhXQ8P3S9IcelhPAI/oNnSr8cebgGIxOwtUnF16e2L0QyGClJG01rfcy5lQLtQ6bF3sAXdbB
 a+u2VWgzX3Tg5CROY6Xy9ytah//V0sEMYCJesz0ZnAqrN5pqTfBKrgZ+V9XE76qQLNJOdXC0ypk
 oiW/jBopKtO+yTuXXwxJ9jqajtcwHbacL8SLtZ6o30ymzfUGGoy9cRObttmQUeyFYDm5jSv3VPk
 9Fs6n4YxrqekQSIyrY81HVv4JJMArcFakqm6mm8Y2C069x9yRa9QMkNxbtRTy/zLe043q5GWQa5
 3XmvNBGe5jsRYMotcdH6hvMP1bj80A6REHxtu9CQn4ffaXla+Y9ejwu6g/1MXImtw3OTy3yoPXl
 qnM/klFV0yvsI5OuTK0neQmL31wecq0Hu+kWSntrRTWCWE5PbvhD7qCvlX4+qdKmr6BN5wyxJWu
 058AnBUi/HT+bldY33Rx+6mU7lkx4bWTCZeLKIjGx9U2wfqMy2quq7ZGKivReGxPCGjkbjIupDe
 fx/Z2oCPQ84MLLQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The driver may not be MIPI CCS compliant, but does use same address and
often set same values as compliant drivers. Do not redefine registers we
already know and are standard.

No functional changes.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/i2c/imx355.c | 84 ++++++++++++++--------------------------------
 1 file changed, 25 insertions(+), 59 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 45e3002bd93ca..05a561636407c 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -14,89 +14,55 @@
 #include <linux/unaligned.h>
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
-#define IMX355_REG_MODE_SELECT		CCI_REG8(0x0100)
-#define IMX355_MODE_STANDBY		0x00
-#define IMX355_MODE_STREAMING		0x01
+#include "ccs/ccs-regs.h"
 
-/* Chip ID */
-#define IMX355_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX355_CHIP_ID			0x0355
 
-#define IMX355_REG_LANE_SEL		CCI_REG8(0x0114)
-
 /* PLL registers that depend on the external clock frequency */
-#define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
 #define IMX355_REG_PLL_OP_PREDIV	CCI_REG8(0x030d)
-#define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
 #define IMX355_REG_PLL_IVT_PCK_DIV	CCI_REG8(0x0301)
 #define IMX355_REG_PLL_IVT_SYSCK_DIV	CCI_REG8(0x0303)
 #define IMX355_PLL_OP_PREDIV		2
 #define IMX355_PLL_IVT_PCK_DIV		5
 
 /* V_TIMING internal */
-#define IMX355_REG_FLL			CCI_REG16(0x0340)
 #define IMX355_FLL_MAX			0xffff
 #define IMX355_VBLANK_MIN		20
 
-#define IMX355_REG_LLP			CCI_REG16(0x0342)
 #define IMX355_LLP_MAX			0xffff
 
-#define IMX355_REG_X_ADD_START		CCI_REG16(0x0344)
-#define IMX355_REG_Y_ADD_START		CCI_REG16(0x0346)
-#define IMX355_REG_X_ADD_END		CCI_REG16(0x0348)
-#define IMX355_REG_Y_ADD_END		CCI_REG16(0x034a)
-#define IMX355_REG_X_OUT_SIZE		CCI_REG16(0x034c)
-#define IMX355_REG_Y_OUT_SIZE		CCI_REG16(0x034e)
-
 /* Exposure control */
-#define IMX355_REG_EXPOSURE		CCI_REG16(0x0202)
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
 #define IMX355_EXPOSURE_OFFSET		10
 
 /* Analog gain control */
-#define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
 #define IMX355_ANA_GAIN_MIN		0
 #define IMX355_ANA_GAIN_MAX		960
 #define IMX355_ANA_GAIN_STEP		1
 #define IMX355_ANA_GAIN_DEFAULT		0
 
 /* Digital gain control */
 #define IMX355_REG_DPGA_USE_GLOBAL_GAIN	CCI_REG8(0x3070)
-#define IMX355_REG_DIG_GAIN_GLOBAL	CCI_REG16(0x020e)
 #define IMX355_DGTL_GAIN_MIN		256
 #define IMX355_DGTL_GAIN_MAX		4095
 #define IMX355_DGTL_GAIN_STEP		1
 #define IMX355_DGTL_GAIN_DEFAULT	256
 
-/* Test Pattern Control */
-#define IMX355_REG_TEST_PATTERN		CCI_REG16(0x0600)
-#define IMX355_TEST_PATTERN_DISABLED		0
-#define IMX355_TEST_PATTERN_SOLID_COLOR		1
-#define IMX355_TEST_PATTERN_COLOR_BARS		2
-#define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
-#define IMX355_TEST_PATTERN_PN9			4
-
+/* Link rate register: 16-bit wide, unlike the CCS 32-bit one */
 #define IMX355_REG_REQ_LINK_BIT_RATE	CCI_REG16(0x0820)
 
-#define IMX355_REG_BINNING_MODE		CCI_REG8(0x0900)
-#define IMX355_REG_BINNING_TYPE		CCI_REG8(0x0901)
-#define IMX355_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
-
-/* Flip Control */
-#define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
-
 #define IMX355_PIXEL_ARRAY_TOP		0
 #define IMX355_PIXEL_ARRAY_LEFT		0
 #define IMX355_PIXEL_ARRAY_WIDTH	3280
 #define IMX355_PIXEL_ARRAY_HEIGHT	2464
 
 struct imx355_reg_list {
 	u32 num_of_regs;
 	const struct cci_reg_sequence *regs;
@@ -616,39 +582,39 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * when power is up for streaming
 	 */
 	if (!pm_runtime_get_if_in_use(imx355->dev))
 		return 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
 		/* Analog gain = 1024/(1024 - ctrl->val) times */
-		ret = cci_write(imx355->regmap, IMX355_REG_ANALOG_GAIN,
+		ret = cci_write(imx355->regmap, CCS_R_ANALOG_GAIN_CODE_GLOBAL,
 				ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = cci_write(imx355->regmap, IMX355_REG_DIG_GAIN_GLOBAL,
+		ret = cci_write(imx355->regmap, CCS_R_DIGITAL_GAIN_GLOBAL,
 				ctrl->val, NULL);
 		break;
 	case V4L2_CID_EXPOSURE:
-		ret = cci_write(imx355->regmap, IMX355_REG_EXPOSURE,
+		ret = cci_write(imx355->regmap, CCS_R_COARSE_INTEGRATION_TIME,
 				ctrl->val, NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
-		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
+		ret = cci_write(imx355->regmap, CCS_R_FRAME_LENGTH_LINES,
 				format->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
+		ret = cci_write(imx355->regmap, CCS_R_TEST_PATTERN_MODE,
 				ctrl->val, NULL);
 		break;
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
-		ret = cci_write(imx355->regmap, IMX355_REG_ORIENTATION,
+		ret = cci_write(imx355->regmap, CCS_R_IMAGE_ORIENTATION,
 				imx355->hflip->val | imx355->vflip->val << 1,
 				NULL);
 		break;
 	default:
 		ret = -EINVAL;
 		dev_info(imx355->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
 			 ctrl->id, ctrl->val);
 		break;
@@ -825,75 +791,75 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	crop = v4l2_subdev_state_get_crop(state, 0);
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height, fmt->width, fmt->height);
 	cci_multi_reg_write(imx355->regmap, mode->reg_list.regs,
 			    mode->reg_list.num_of_regs, &ret);
 
 	/* Set readout crop and size registers  */
-	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, crop->left,
+	cci_write(imx355->regmap, CCS_R_X_ADDR_START, crop->left,
 		  &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, crop->top, &ret);
-	cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
+	cci_write(imx355->regmap, CCS_R_Y_ADDR_START, crop->top, &ret);
+	cci_write(imx355->regmap, CCS_R_X_ADDR_END,
 		  crop->width + crop->left - 1, &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
+	cci_write(imx355->regmap, CCS_R_Y_ADDR_END,
 		  crop->height + crop->top - 1, &ret);
-	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, fmt->width, &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, fmt->height, &ret);
+	cci_write(imx355->regmap, CCS_R_X_OUTPUT_SIZE, fmt->width, &ret);
+	cci_write(imx355->regmap, CCS_R_Y_OUTPUT_SIZE, fmt->height, &ret);
 
 	binning_mode = ((crop->width / fmt->width) << 4) |
 			(crop->height / fmt->height);
-	cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
+	cci_write(imx355->regmap, CCS_R_BINNING_MODE,
 		  binning_mode == 0x11 ? 0x00 : 0x01, &ret);
-	cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode, &ret);
-	cci_write(imx355->regmap, IMX355_REG_BINNING_WEIGHTING, 0x00, &ret);
+	cci_write(imx355->regmap, CCS_R_BINNING_TYPE, binning_mode, &ret);
+	cci_write(imx355->regmap, CCS_R_BINNING_WEIGHTING, 0x00, &ret);
 
 	/* Set PLL registers for the external clock frequency */
-	cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
+	cci_write(imx355->regmap, CCS_R_EXTCLK_FREQUENCY_MHZ,
 		  imx355->clk_params->extclk_freq, &ret);
-	cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
+	cci_write(imx355->regmap, CCS_R_OP_PLL_MULTIPLIER,
 		  imx355->clk_params->pll_op_mpy[lane_idx], &ret);
 	cci_write(imx355->regmap, IMX355_REG_PLL_OP_PREDIV,
 		  imx355->clk_params->pll_op_prediv[lane_idx], &ret);
 	cci_write(imx355->regmap, IMX355_REG_PLL_IVT_SYSCK_DIV,
 		  lane_idx ? 2 : 1, &ret);
 
 	/* Set MIPI configuration */
-	cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
+	cci_write(imx355->regmap, CCS_R_CSI_LANE_MODE,
 		  imx355->hwcfg->num_lanes - 1, &ret);
 
 	link_bitrate = imx355->link_freq->qmenu_int[imx355->link_freq->val] *
 		       imx355->hwcfg->num_lanes * 2;
 	do_div(link_bitrate, 1000000);
 	cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE, link_bitrate,
 		  &ret);
 
 	/* set digital gain control to all color mode */
 	cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
 
 	/* set line length */
-	cci_write(imx355->regmap, IMX355_REG_LLP,
+	cci_write(imx355->regmap, CCS_R_LINE_LENGTH_PCK,
 		  imx355->hblank->val + fmt->width, &ret);
 
 	/* Apply customized values from user */
 	if (!ret)
 		ret = __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
 
-	cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_STREAMING,
+	cci_write(imx355->regmap, CCS_R_MODE_SELECT, CCS_MODE_SELECT_STREAMING,
 		  &ret);
 
 	return ret;
 }
 
 /* Stop streaming */
 static int imx355_stop_streaming(struct imx355 *imx355)
 {
-	return cci_write(imx355->regmap, IMX355_REG_MODE_SELECT,
-			 IMX355_MODE_STANDBY, NULL);
+	return cci_write(imx355->regmap, CCS_R_MODE_SELECT,
+			 CCS_MODE_SELECT_SOFTWARE_STANDBY, NULL);
 }
 
 static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 
@@ -933,17 +899,17 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 /* Verify chip ID */
 static int imx355_identify_module(struct imx355 *imx355)
 {
 	int ret;
 	u64 val;
 
-	ret = cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL);
+	ret = cci_read(imx355->regmap, CCS_R_SENSOR_MODEL_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != IMX355_CHIP_ID) {
 		dev_err(imx355->dev, "chip id mismatch: %x!=%llx",
 			IMX355_CHIP_ID, val);
 		return -EIO;
 	}

-- 
2.55.0


