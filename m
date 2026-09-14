Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FC3A1E67;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413685; cv=none; b=h8PPyHGTL/xh6TuuK/n8jeJDNI34TrJ0QwLz9aDGM/w9Pjyt9mzukBEZRpC6/19AZKbfLWf5TplpXif/gdcrkRJg8hPnmC2mRahRpneM1tdamXuMwOOd9vwp8pU32yXnQwOmhhC+K8uE3rBipd3/LfP6CLOyzrB6Wq+aBHw25HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413685; c=relaxed/simple;
	bh=aGlhmX7jD+MBnjOKtuwFJE1JDXZjtQZXasoYCmCS4OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMO4X453BLGzp/pNFfrCctthLTejmFn4Xr3h84EOAJHZbBqyPWXptkeyIjRpSSnFwmWN7JnavB/zYTM5R1SfB9dqb2uZomMA+xe6exNvdqTCXOD+gY/fvN684j+zgWv1xDOCCuVks7h9g/xcPBmo2QiJCeUxjRvBWn0ZwIFwF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kyMRsOkn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kyMRsOkn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 739DAC2BCFF;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=aGlhmX7jD+MBnjOKtuwFJE1JDXZjtQZXasoYCmCS4OQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kyMRsOknG48np14cAZFPbXUl4R7wv1vNSumVvFxjUo/JQRuydTxZ048MpiH8EBS0Q
	 VeUIKe+tcmpzLzg4NhI74Tt0ojOvtMimX15iJEvCTol4qvQPG5sxvWfXUw4jSpP4G8
	 Wt3uQZTOuoBA7I/1PqjcCGTNhBG/mxXRowlvoMPI=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5673BC88E7D;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:20:59 +0200
Subject: [PATCH 02/10] media: i2c: ov9282: fix line time and exposure time
 calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=3330;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=aGlhmX7jD+MBnjOKtuwFJE1JDXZjtQZXasoYCmCS4OQ=;
 b=09NOCbRYWWMa4nkEoSDjjdX1ogzH3XZwHTv9qF5qOh/z8A1ku+qsPTlxSAYNsoDonNgjVY+bm
 sINCkAOmsoaBrxVajMBwTY4RZxhKg/bsgYiNK4U2iRO56Q8XOnshzfv
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

ov9282_exposure_to_us() divided the line length by the pixel rate control,
which is the MIPI rate and not the clock HTS is counted in. The right
clock is PLL2's system clock. With the PLL2 dividers left at their reset
values the chain

SYS_CLK = XVCLK  / pre_div0 / pre_div * loop_div / sys_pre_div / sys_div
        =    24  /    1     /    3    * loop_div /     4       /    2

collapses to SYS_CLK = loop_div MHz.

Fix this by introducing a new static function to calculate the current
line time and use it in ov9282_exposure_to_us().

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 46 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c10b2e205834e..3f83a6cf338d8 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -10,10 +10,12 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time64.h>
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
@@ -472,6 +474,41 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct ov9282, sd);
 }
 
+/**
+ * ov9282_line_time_ns() - Calculate duration of one sensor line.
+ * @ov9282: pointer to ov9282 device
+ *
+ * The line time and therefore OV9282_REG_TIMING_HTS and the strobe frame span
+ * are counted in PLL2's system clock. We assume the PLL2 dividers are at their
+ * reset values, so the formula reduces to SYS_CLK = loop_div MHz.
+ *
+ * Return: line time in nanoseconds.
+ */
+static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
+{
+	u32 hts = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+	u32 sclk_rate_mhz = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ?
+		OV9282_PLL_CTRL_0D_RAW10 : OV9282_PLL_CTRL_0D_RAW8;
+
+	/*
+	 * OV9282_REG_TIMING_HTS counts 2-pixel units
+	 */
+	return DIV_ROUND_CLOSEST(hts * (u32)NSEC_PER_USEC, 2 * sclk_rate_mhz);
+}
+
+/**
+ * ov9282_exposure_to_us() - Convert an exposure register value to microseconds
+ * @ov9282: pointer to ov9282 device
+ * @exposure: exposure register value to convert
+ *
+ * Return: microsecond represenation of the given exposure register value.
+ */
+static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
+{
+	return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
+		       NSEC_PER_USEC);
+}
+
 /**
  * ov9282_update_controls() - Update control ranges based on streaming mode
  * @ov9282: pointer to ov9282 device
@@ -510,15 +547,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 					mode->vblank_max, 1, mode->vblank);
 }
 
-static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
-{
-	/* calculate exposure time in µs */
-	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
-	u32 trow_us = frame_width / (ov9282->pixel_rate->val / 1000000UL);
-
-	return exposure * trow_us;
-}
-
 /**
  * ov9282_update_exp_gain() - Set updated exposure and gain
  * @ov9282: pointer to ov9282 device

-- 
2.53.0


