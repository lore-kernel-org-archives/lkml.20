Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CB50B429
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174635; cv=none; b=QZwchRh1BJ/icLVBj3Uthi7dyNIW1awocgXkskUZtWkOb07OYDTRnUPxCRzFx4M2Lv56E8oDaumRCIFuJRfeCGygRIax/LlYyHv6k4PnWOezXH1lKIar45kGf9xTFI2hsJnDCAkn1l3rUC231crhbtrzcKoJwVcKP41ZiyBWI50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174635; c=relaxed/simple;
	bh=OJefmdtcgSgaSMrhXgucaralmXFSNo9afs27yRRbMq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRvN1S+OEuZd3FUB/5n1KMC9O9vkGk8OzdSssyNlEMskgQBg4czn/hwk1X7C5lR4yYP83mokZhdqHiJ9YdoxHpLdz8WsKbihmx1IvPrVlBy8BA6icdPO5rkSd7Gw2ZITXnBgwM51oOYYPMe/5KfQziFfk4kBsk+GSvnK/rRorB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKF+VafY; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKF+VafY"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c7bd056863so459866e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174631; x=1790779431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVDr+039wsXoI+SgZ5r50ghgsnSdnZYFac1ieItKnsk=;
        b=XKF+VafYhyEqUth+S5j1z+3I40paLlJigCvuHqpi/Kkk+4sMKW2/XbQOri2lEgEeMU
         dyaCZTqG2Rylnube0FZ+xeri2+cGU6yS3M5KH5vftFAwMWmiFHCzivm6uLTWoVBWq5Dg
         bMOWtssOob/2LlZsUnY9iIjBhT3nWpLL+p0ZcQkAsYZmFlVihkpXlumNm034DRgtlEmE
         FHwTACHQqcREkEmnzY1QCL4UmmGryT64Fkbufhmxc9ya032eIUlxs8Wx3Q9hIzQrgRcr
         j+tXDisoDpjcLBLeD8i3dMxqX51D8Tg1CV1joKuGjt3SGdIoJ+PGWkbBSCJQTGZrWNrh
         p6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174631; x=1790779431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVDr+039wsXoI+SgZ5r50ghgsnSdnZYFac1ieItKnsk=;
        b=F3lSq1KyN+wpcran4pZ4VUCmsfokkgORK9v3/2fSa34CQnKykNu6LlD3cMajflz4iS
         uG1I90dAI+g3oq3Ef7tEbfSCaRNDNzZICakoCaeU8o+gqqPLrhdPqFurdQhFMtbs/Yqc
         sFwpvYkIoWD/yOgcsqxkAtO9kAIniU29lMy5ICXe3devqt7vD/eAb2BInc2C42wq99lO
         QzspWM5ptxgQlfzSuMlbX0CsJ72e9jmnJ7fKZRjL7cVgMk9RVLWIHGV9xAt9jS2ZMJXZ
         00aQAWhE9xhNZkh9bYOojTNM3Hq5WLVPWa9cdpAQ2TehVm3mIPIsrRYp6LHbHm9JMHHW
         X2IA==
X-Forwarded-Encrypted: i=1; AKwUvBzWzdQMP4YPLzBmaPb3HRdZ6q51hvmMkFYxDM3ILqVFIJTj1CNk+QA1RLLfGXXzLyphr5Zcf1kraTxHSXs=@vger.kernel.org
X-Gm-Message-State: AFuF++nBts1xoTAOxowmn/eiy0Ev2DhMIZ/WZaKCC0mqMLEQIxJHcmqt
	2VmFuVEk0tu59nLitURIvkXRK+v26RWo34mI4s/j1jc1ic+HZG4oWrF9IXaERuz7
X-Gm-Gg: AYBFou2wmA1X+bypvstMB6PXAdAjTRZf3Hd2wocMJ6w3K/D8t9IW4GkB6kWPu838MIo
	YTBCKqyPCgYeX7JKNOrXHXmUgG8N5bmU56rOfL2LzRVy/8nqVar7yT4dkFmoOuSD8s140mXASJ5
	gQxaHslBPwFnsNZ8/pkZ0C3NaIyHH3JPVanjBDTuQuWMIU2k3un9GYq6lGzjArZgNljgzJyLkj+
	ol4SpMhiqPpmx2hKgapXy0CdkIP5URfQk3hmApsKqidR4CFdFaHKQ45n3KpuABc1iStia+3ODEK
	AgNE9++9SZZQdeBiePZK2CktvkMfDo+dCC64Orai9Ry1qxDY/gJ1tKWoiAz/p0+xdgJvHaXNFgd
	CF6mbFNX9lKYSDKBDTNfYqL3sVIwVOCPw0hZE2AhAWDZG08J1wbrwNiPMOF3/ZhejcNK1Xwk9Bl
	/bOh3PYje0gjcsxCMoRzpxELeDsSvCPu8YUEKK324mZGoj25LJUpi9J5KPrF5Sa+TriD298qsXc
	oSbC8cFwA==
X-Received: by 2002:a05:6122:e266:b0:5bf:889f:e7da with SMTP id 71dfb90a1353d-5c9f15506c0mr2689666e0c.2.1790174630806;
        Wed, 23 Sep 2026 07:43:50 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3566169e0c.9.2026.09.23.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:43:50 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v2 3/3] media: ov02c10: Accept a 26 MHz external clock
Date: Wed, 23 Sep 2026 11:42:57 -0300
Message-ID: <20260923144257.119076-4-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144257.119076-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260923144257.119076-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several Meteor Lake / Lunar Lake designs (e.g. the Samsung Galaxy Book3/4
series) wire the OV02C10 to a 26 MHz external clock instead of the
19.2 MHz assumed so far. The IPU6 ipu-bridge forwards the rate from the
ACPI SSDB verbatim as the "clock-frequency" property, so probe() just
rejects it today:

  ov02c10 i2c-OVTI02C1:00: external clock 26000000 is not supported

Rename OV02C10_MCLK to OV02C10_MCLK_19_2MHZ, add OV02C10_MCLK_26MHZ and
accept both.

The register tables program the OP PLL multiplier (0x0304/0x0305, 16-bit)
to 0x0190 = 400 for a 19.2 MHz clock: the common table writes
0x0304 = 0x01 and the per-lane tables override 0x0305 = 0x90. Left alone
on a 26 MHz clock the same dividers run every internal clock, and
therefore the MIPI link, 26/19.2 = 1.3542x faster: a ~541.7 MHz link at
~40 fps instead of the nominal 400 MHz at ~30 fps.

Re-program both PLL multipliers by the inverse factor instead, so that
the link stays where the driver and the ipu-bridge fwnode already
describe it: 400 * 19.2 / 26 = 295 = 0x0127, written to 0x0304/0x0305
and 0x0315/0x0316 after the per-lane table when the external clock is
26 MHz. That puts the link at 295 * 26 / 19.2 = 399.5 MHz, within 0.13%
of the nominal 400 MHz, so link-frequency and pixel-rate stay accurate
with the single existing menu entry and the ipu-bridge needs no change.

Tested on a Samsung Galaxy Book3 (two CSI-2 data lanes, 26 MHz clock
confirmed via clk_summary): the multiplier registers read back 0x0127
while streaming and capture runs at a steady 30.01 fps by buffer
timestamp, against ~40 fps with the unmodified tables, matching the
30.14 fps that the exported hblank, vblank and pixel-rate describe.

While touching the clock check, terminate its error string with a
newline.

Link: https://lore.kernel.org/linux-media/ap_CGQTdNFysTLot@kekkonen.localdomain/
Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Changes in v2:
- Re-program the OP and VT PLL multipliers instead of advertising the
  scaled 541.667 MHz link frequency (Sakari). The suggested 0x28a / 0x1b1
  produce no output on this hardware; 0x0127 -- the 0x0190 the tables
  already program, scaled by 19.2/26 -- does, and brings the frame rate
  back to the nominal ~30 fps.
- Drop the second V4L2_CID_LINK_FREQ entry that v1 added: with the link
  back at ~400 MHz the existing single entry matches the ipu-bridge
  fwnode directly, so no ipu-bridge change is needed either.
- Bryan's Reviewed-by and the Tested-by on v1 are not carried over, as
  the patch was rewritten.

 drivers/media/i2c/ov02c10.c | 43 ++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cdccbdef3..17208f2e6 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -16,7 +16,8 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV02C10_LINK_FREQ_400MHZ	400000000ULL
-#define OV02C10_MCLK			19200000
+#define OV02C10_MCLK_19_2MHZ		19200000
+#define OV02C10_MCLK_26MHZ		26000000
 #define OV02C10_RGB_DEPTH		10
 
 #define OV02C10_NATIVE_WIDTH		1928
@@ -337,6 +338,23 @@ static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
 	{0x3016, 0x32},
 };
 
+/*
+ * The mode tables target a 19.2 MHz input clock, programming the OP PLL
+ * multiplier (0x0304/0x0305, 16-bit) to 0x0190 = 400 for a 400 MHz link at
+ * ~30 fps.  A 26 MHz input clock instead runs every internal clock, and
+ * therefore the MIPI link, 26/19.2 = 1.3542x faster (~541.7 MHz, ~40 fps).
+ * Scaling both PLL multipliers by 19.2/26 -- 400 * 19.2 / 26 = 295 = 0x0127
+ * -- puts the link back at 295 * 26 / 19.2 = 399.5 MHz, within 0.13% of the
+ * nominal 400 MHz, so the frame rate and the advertised link frequency both
+ * stay correct without a second link-frequency entry.
+ */
+static const struct reg_sequence sensor_pll_26mhz_setting[] = {
+	{0x0304, 0x01},
+	{0x0305, 0x27},
+	{0x0315, 0x01},
+	{0x0316, 0x27},
+};
+
 static const char * const ov02c10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -396,6 +414,9 @@ struct ov02c10 {
 	/* MIPI lane info */
 	u32 link_freq_index;
 	u8 mipi_lanes;
+
+	/* External (sensor) clock rate, Hz */
+	u32 xvclk_freq;
 };
 
 static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
@@ -619,6 +640,17 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 		goto out;
 	}
 
+	if (ov02c10->xvclk_freq == OV02C10_MCLK_26MHZ) {
+		reg_sequence = sensor_pll_26mhz_setting;
+		sequence_length = ARRAY_SIZE(sensor_pll_26mhz_setting);
+		ret = regmap_multi_reg_write(ov02c10->regmap,
+					     reg_sequence, sequence_length);
+		if (ret) {
+			dev_err(ov02c10->dev, "failed to write PLL settings\n");
+			goto out;
+		}
+	}
+
 	ret = __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_handler);
 	if (ret)
 		goto out;
@@ -877,6 +909,10 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
 	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
 
+	dev_dbg(dev, "%u Hz external clock, link freq %lld Hz\n",
+		ov02c10->xvclk_freq,
+		link_freq_menu_items[ov02c10->link_freq_index]);
+
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
 	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		ret = dev_err_probe(dev, -EINVAL,
@@ -926,10 +962,11 @@ static int ov02c10_probe(struct i2c_client *client)
 				     "failed to get imaging clock\n");
 
 	freq = clk_get_rate(ov02c10->img_clk);
-	if (freq != OV02C10_MCLK)
+	if (freq != OV02C10_MCLK_19_2MHZ && freq != OV02C10_MCLK_26MHZ)
 		return dev_err_probe(ov02c10->dev, -EINVAL,
-				     "external clock %lu is not supported",
+				     "external clock %lu is not supported\n",
 				     freq);
+	ov02c10->xvclk_freq = freq;
 
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 
-- 
2.55.0

