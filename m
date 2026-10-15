Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF943CEF3;
	Thu, 15 Oct 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099510; cv=none; b=ITdDmawZI8xaoIj0JxuXBK496kb8KFqCEO6WZch5jLiiRPjsUPtW+MbE9qA/bButX5SwUa9gtXfq+Oiv27nlGBUqehjRcnN4e2vIXVv7LmotfT0k8Os5W5zju8UWE7bAbhPqeR/w2GQ+GcXQNoCtZdviHZ7xCZb5Cm85Amh6v80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099510; c=relaxed/simple;
	bh=5lk/j9+8HR+b8eTxFfKnUJB03SL0jM01r5lwmNl3Sd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbjkIyfIjfmPPGGj9PjbvBL01iI4oV5ns+2WFiAFFUtaKRG8daFEH9rEl27sUsk08Z2OIdyMP6p5cTHxXfkSAklcjRS+kcPRzTjJZBFCw/jaI2U1I2/HUEHpiEJf444hlXt9rPFcZXyquOsQci5Wj1hW6ZUiqPTf7i7pIIylVJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4W8bbP3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4W8bbP3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E41C6C2BCFC;
	Thu, 15 Oct 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792099510;
	bh=5lk/j9+8HR+b8eTxFfKnUJB03SL0jM01r5lwmNl3Sd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J4W8bbP3Fr1SY+T5tpuLxXGG38Su2o3BIOBl/2/5qaQwrXTbtOqCWBPSHPrbLkklZ
	 safAuNtyna+em3w/f9BtfdX9vr2xjlikyj33JpNtBObx/Kn4Fe2XZnZ/xqrorazIlJ
	 PvjHZyq8NGVFahsL5/wHujLBxD/T28h6xh0OjdfmSVoSHsI2c93KYThN5UWc12FieT
	 Xb2/36450Mf7SbMlBTHFYE9EVpLU/qXs7uwEbwy1HDla46D9DeaFsePOAx3CKUV6IW
	 6X6Hbw5+DaL641cc4aRidGrgQjulMgx6grCSI5YOjfEB4U+da88SsTlBT454aMO0yy
	 s2LJUJdAzywpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D01CCA462;
	Thu, 15 Oct 2026 21:25:09 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 22:25:10 +0100
Subject: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
In-Reply-To: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>, 
 Andre Gilerson <andre.gilerson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 German Pablo Lindo <germanpapulindez@gmail.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792099508; l=8545;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=EfvEBhMI4cDjJCXBWHch0MxiSg00MDxNZQoomRmocno=;
 b=bIAglSnyP5q20T7vZrTk5eM1Li42ty2/L40HuDx4QWH6EJIXIFYSFWBEcEn+H8mBbMuXTMf0r
 fTBsTh/5wscCWbhGUKMB4MU1G4Gk+G8vGasZKin7YnueOjG/Vg4p7gt
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

The IMX681 also drives MIPI C-PHY. On the Surface Pro 11 with a
Snapdragon X Elite it reaches the CAMSS CSIPHY over one C-PHY trio,
which Windows runs at 2.4 Gsym/s.

Only the signalling, the lane count and the output PLL differ from the
two-lane D-PHY set-up of the Intel model. The read-out window and the
pixel array PLL stay as they are, and so does the pixel rate: Windows on
the Snapdragon model programs the same video timing PLL, and its line and
frame lengths give 720 MHz at 30 fps too. Describe each bus by those
three values and its link frequency, pick the one the endpoint asks for,
and write them after the register list:

- CSI_SIGNALING_MODE: 2 for D-PHY, 3 for C-PHY, as CCS numbers them;
- CSI_LANE_MODE: the number of lanes or trios, minus one;
- OP_PLL_MULTIPLIER: 303 for D-PHY as before, 375 for C-PHY, so
  19.2 MHz / 3 * 375 = 2400 Msym/s, a 1.2 GHz link frequency by the V4L2
  convention for C-PHY (half the symbol rate).

CSI_LANE_MODE was not written before. It is now written for D-PHY too,
with the value two lanes need.

Tested on the Surface Pro 11 (X1E80100), with the endpoint on one C-PHY
trio at 1.2 GHz and CAMSS capturing raw frames over CSIPHY2, CSID1 and an
RDI interface: 3844x2640 at 29.99 fps, the colour-bar test pattern
arrives intact, a scene captures, and VBLANK still sets the frame rate
(8.19 fps at 9000 lines). The D-PHY path is not tested here.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/media/i2c/imx681.c | 95 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
index 6c8e4b3..c660f06 100644
--- a/drivers/media/i2c/imx681.c
+++ b/drivers/media/i2c/imx681.c
@@ -77,6 +77,9 @@
 #define IMX681_REG_LINE_LENGTH		CCI_REG16(0x0342)
 #define IMX681_REG_ORIENTATION		CCI_REG8(0x0101)
 #define IMX681_REG_CSI_SIGNALING_MODE	CCI_REG8(0x0111)
+#define IMX681_CSI_SIGNALING_DPHY	0x02
+#define IMX681_CSI_SIGNALING_CPHY	0x03
+#define IMX681_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX681_REG_EXTCLK_FREQ_MHZ	CCI_REG16(0x0136)
 #define IMX681_REG_PLL_MULTIPLIER	CCI_REG16(0x0306)
 #define IMX681_REG_OP_PRE_PLL_CLK_DIV	CCI_REG16(0x030c)
@@ -93,7 +96,6 @@
 /* PLL, as the Windows traces configure it and the part reads back. */
 #define IMX681_PLL_MULTIPLIER		225
 #define IMX681_OP_PRE_PLL_CLK_DIV	3
-#define IMX681_OP_PLL_MULTIPLIER	303
 
 /*
  * Where the read-out window sits in the pixel array, and how much array
@@ -119,16 +121,44 @@
 #define IMX681_FRAME_LENGTH_LINES	3177	/* 0x0C69 */
 #define IMX681_FRAME_LENGTH_MAX		0xFFFF	/* 24-bit reg, limit to 16-bit */
 
-/* MIPI lanes */
-#define IMX681_NUM_LANES		2
-
 /*
- * Link frequency derived from PLL settings in Windows trace:
- * EXCK=19.2MHz, PLL2_MUL=303, PLL2_PRE_DIV=3
- * OP output = 19.2 * 303 / 3 = 1939.2 MHz (MIPI bit rate)
- * Link freq = 1939.2 / 2 (DDR) = 969.6 MHz
+ * The part drives either bus. Only the signalling, the lane count and the
+ * output PLL differ between them: the pixel array, its PLL and the read-out
+ * window stay as they are, so the pixel rate below holds for both.
  */
-#define IMX681_LINK_FREQ		969600000LL
+struct imx681_bus {
+	enum v4l2_mbus_type type;
+	unsigned int lanes;
+	u8 signaling_mode;
+	u16 op_pll_multiplier;
+	s64 link_freq;
+};
+
+static const struct imx681_bus imx681_buses[] = {
+	/*
+	 * D-PHY, two lanes, as on the Surface Pro 11 for Business (Intel):
+	 * 19.2 MHz / 3 * 303 = 1939.2 Mbps per lane, so a 969.6 MHz link.
+	 */
+	{
+		.type = V4L2_MBUS_CSI2_DPHY,
+		.lanes = 2,
+		.signaling_mode = IMX681_CSI_SIGNALING_DPHY,
+		.op_pll_multiplier = 303,
+		.link_freq = 969600000,
+	},
+	/*
+	 * C-PHY, one trio, as on the Surface Pro 11 (Snapdragon X Elite):
+	 * 19.2 MHz / 3 * 375 = 2400 Msym/s, and a C-PHY link frequency is half
+	 * the symbol rate.
+	 */
+	{
+		.type = V4L2_MBUS_CSI2_CPHY,
+		.lanes = 1,
+		.signaling_mode = IMX681_CSI_SIGNALING_CPHY,
+		.op_pll_multiplier = 375,
+		.link_freq = 1200000000,
+	},
+};
 
 /*
  * The pixel rate cannot be derived from the CSI-2 link: this part runs two
@@ -154,21 +184,15 @@
 
 #define IMAGE_PAD			0
 
-static const s64 imx681_link_frequencies[] = {
-	IMX681_LINK_FREQ,
-};
-
 /*
  * Sensor init register sequence, captured from Windows I2C traces.
  * This configures the sensor for 3844x2640 RAW10 output at ~30fps
- * with 2-lane MIPI CSI-2, 19.2MHz input clock.
+ * from a 19.2MHz input clock; imx681_start_streaming() adds the bus.
  */
 static const struct cci_reg_sequence imx681_init_regs[] = {
 	{ IMX681_REG_EXTCLK_FREQ_MHZ, IMX681_XCLK_FREQ_ENC },
 	/* Vendor specific configuration */
 	{ CCI_REG16(0x002C), 0x0505 },
-	/* 0x02 is D-PHY, which is the only mode this part offers. */
-	{ IMX681_REG_CSI_SIGNALING_MODE, 0x02 },
 	/* Vendor access unlock sequence */
 	{ CCI_REG8(0x30EB),  0x05 },
 	{ CCI_REG8(0x30EB),  0x0C },
@@ -197,11 +221,10 @@ static const struct cci_reg_sequence imx681_init_regs[] = {
 	 * low byte of PLL_MULTIPLIER and 0x030d the low byte of
 	 * OP_PRE_PLL_CLK_DIV, and each was right only while its high byte
 	 * held the reset value. Written whole, and the part reads back
-	 * 225, 3 and 303 at the operating point either way.
+	 * 225 and 3 at the operating point either way.
 	 */
 	{ IMX681_REG_PLL_MULTIPLIER, IMX681_PLL_MULTIPLIER },
 	{ IMX681_REG_OP_PRE_PLL_CLK_DIV, IMX681_OP_PRE_PLL_CLK_DIV },
-	{ IMX681_REG_OP_PLL_MULTIPLIER, IMX681_OP_PLL_MULTIPLIER },
 	/* Vendor specific registers */
 	{ CCI_REG8(0x7E9B),  0x02 },
 	{ CCI_REG8(0x0368),  0x00 },
@@ -259,6 +282,7 @@ struct imx681 {
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
 
+	const struct imx681_bus *bus;
 	unsigned long link_freq_bitmap;
 };
 
@@ -508,6 +532,17 @@ static int imx681_start_streaming(struct imx681 *imx681)
 		return ret;
 	}
 
+	cci_write(imx681->cci, IMX681_REG_CSI_SIGNALING_MODE,
+		  imx681->bus->signaling_mode, &ret);
+	cci_write(imx681->cci, IMX681_REG_CSI_LANE_MODE,
+		  imx681->bus->lanes - 1, &ret);
+	cci_write(imx681->cci, IMX681_REG_OP_PLL_MULTIPLIER,
+		  imx681->bus->op_pll_multiplier, &ret);
+	if (ret) {
+		dev_err(imx681->dev, "failed to configure the bus: %d\n", ret);
+		return ret;
+	}
+
 	/* Wait for sensor to stabilise after configuration */
 	usleep_range(IMX681_INIT_DELAY_US, IMX681_INIT_DELAY_US + 1000);
 
@@ -711,7 +746,7 @@ static int imx681_init_controls(struct imx681 *imx681)
 					   V4L2_CID_LINK_FREQ,
 					   __fls(imx681->link_freq_bitmap),
 					   __ffs(imx681->link_freq_bitmap),
-					   imx681_link_frequencies);
+					   &imx681->bus->link_freq);
 	if (link_freq)
 		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -814,9 +849,10 @@ static int imx681_parse_endpoint(struct imx681 *imx681)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(imx681->dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY,
+		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
 	struct fwnode_handle *ep;
+	unsigned int lanes;
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
@@ -827,19 +863,26 @@ static int imx681_parse_endpoint(struct imx681 *imx681)
 		return dev_err_probe(imx681->dev, ret,
 				     "failed to parse endpoint\n");
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX681_NUM_LANES) {
+	/* Without a bus-type, an endpoint with data-lanes parses as D-PHY. */
+	lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+	for (unsigned int i = 0; i < ARRAY_SIZE(imx681_buses); i++) {
+		if (imx681_buses[i].type == bus_cfg.bus_type &&
+		    imx681_buses[i].lanes == lanes)
+			imx681->bus = &imx681_buses[i];
+	}
+
+	if (!imx681->bus) {
 		ret = dev_err_probe(imx681->dev, -EINVAL,
-				    "expected %d data lanes, got %d\n",
-				    IMX681_NUM_LANES,
-				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+				    "unsupported bus: %s with %u lanes\n",
+				    bus_cfg.bus_type == V4L2_MBUS_CSI2_CPHY ?
+				    "C-PHY" : "D-PHY", lanes);
 		goto done;
 	}
 
 	ret = v4l2_link_freq_to_bitmap(imx681->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       imx681_link_frequencies,
-				       ARRAY_SIZE(imx681_link_frequencies),
+				       &imx681->bus->link_freq, 1,
 				       &imx681->link_freq_bitmap);
 	if (ret)
 		ret = dev_err_probe(imx681->dev, ret,

-- 
2.53.0


