Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD347DFB0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206938; cv=none; b=jav3RA8qjCmXeZgwhascjQqiLfr8G9NLzk0qVwCocxPMwOP7tJBPGO2iD5OWu9bHZIJ+e/oG5LLek2kRBd+LUJZvSbMNcWgV6pWCCVec/LGYyYuSKK0zu415O9Lcdk5OucXOfxVrbYdukGfjTHlBLJQwZY+/h107FwkBkBcwLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206938; c=relaxed/simple;
	bh=97h0On+O0nndVypk+vYrkeIaPpouAICFd+eAnPIi2Bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k505r2b5KLJcB8J19c8pxbjwhP0V+W47Zghc+IpPNsqvl4/GeGvNtz8C4syO6LR8F7iUbejUlk9mJva0TRYWyFy9CaxaLX+JcyipMC+jL7gdvPrkeyArVJxyk++5oxn9M/NtPLvuZ+YkJ2p3vn8320jKeCyBL/AM2CcTzyW0MWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/97QmeZ; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/97QmeZ"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab18so76662c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206930; x=1790811730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJrIoM3AOwboDtTyaYjUbHslev/bmdfBymxr2132i/U=;
        b=e/97QmeZGuFa92Uuk4FHPd7EjkrZiVjU77Z+DVNb0xT2mOauJc5U/1Anx0sNcYzHlk
         4ejT7YJrIaur1iyaRDM0+y1rpazvHfJenRIBiI4CpRac+pKRHuaO7PDl0nOV3rTSTAT9
         YnjxS2LwGkdQ1h49XKLllWvt62uts6Y55PTcfu7xv4ViyEP5YgDcpQf0f6GACIzDKux+
         0kl36RZApU41LVd0MR0IiEg+lwrOcPiO1b59781CPVy7YLyxc47mrdusCx1DKYbZKtaV
         gmTgI9XPqgq9KDKNSqMMMh0kJEVxHHjLMzBrMeYEvIqb6AL1QVbSY0ADdsw+Tcp3kZS7
         hvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206930; x=1790811730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJrIoM3AOwboDtTyaYjUbHslev/bmdfBymxr2132i/U=;
        b=MU7ax/h5L7IubuGjmJWiZYJblvxFv87ODaZkRddEFf4KzYGYLNhNCbPocgGopn+vZS
         AdaLHC+UqBqRnan4dgZ2PNKKrIjnqyn74Gz3ovy0Sb31qah1igg3f1lDAckjyPpP1EvI
         22HFoNOjeXgBmzDrIBjEAWSQYw7kpVs0rXQREn4Wbu/9dLKLdRlG7AQlcv2hnrs7Zcnb
         BdbwE2JBORgVuCLy3yDcvAavgTxmcdjJvPxufqqCX8KEFPvjAgwAEBGvGJjFBdP/LhlV
         5rdKFR9CB0Eh10W0quKZgSrSbLBK1BJhrzjedCKu27wYNfQDpFL3ohAWu7AIDmly3WFK
         vNJA==
X-Forwarded-Encrypted: i=1; AKwUvBxusC8ppqMrPIUc4yfeF0425sLwLtEOGYOsb2gNweZkJopizciBPzQf+U3eMIBetJY9STQH9Czsa0+sKBU=@vger.kernel.org
X-Gm-Message-State: AFuF++loG94D1z5PYNImyZ62tcMFq9gE/tWzc2Hda8098VekZp6wlZuL
	lqIxpknng8MQF5Ffzy6rRN1nBc+zRMrPUWNV7PtEh3vGtJIqjPomoOXG
X-Gm-Gg: AYBFou2qWLuovQIUgwnyq5COPDnP8Ea87HtoE4PSbvaAqWghOi0JTvZpNryZUwo1sMu
	mkOqWojO3MHbs3u4hHTtOURRm0P8yHNOj+p6Yrx0QixPbMixcw5onsplzVlT4f651e7UDRv3xtC
	8xT2b5wkTNv/o9rX2C0do1+gjpjizh7forkYKe1PfLx8/cyIZU1WJeb7OIYE7UOFpuPJgtKlO1o
	Ezh6WejmBSfhzUn6/9oF8ebusDISNr+vDwt+QT2JH4wzVBSRFzto1g+aIpgLBn5dUQP7AYjnVst
	8dHIVI4FVTWIxQu6uW/fHy4iSGIhl0o24OiMAiaQOSZyFJby9OroTiF7rmodZ0AUCnE2ag5MVYU
	4xhTyh96Z9c1cHAFKegb/qmAaf+C8aVU1URjC/j7fw6nOem9ENPI64rZBmErxPRdWXNOmp8MjmJ
	0g5xaMvo7WyHBsaaBv2FdIf6UQx9p7PudZKjzrMUtF4zsc3U3Mp66B2OQDQWqPovOQ8t/6sJmv+
	lbOIag3jxjLTpvAN095VHqSG6wqT8DK25nL
X-Received: by 2002:a05:7022:b055:10b0:144:f47d:c2d9 with SMTP id a92af1059eb24-1450402286dmr503259c88.38.1790206929803;
        Wed, 23 Sep 2026 16:42:09 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:09 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v3 5/5] media: ov02c10: Add support for a 26 MHz external clock
Date: Wed, 23 Sep 2026 20:41:00 -0300
Message-ID: <20260923234100.318151-6-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Raptor Lake laptops, e.g. the Samsung Galaxy Book3 series, feed
the OV02C10 a 26 MHz external clock, which the driver rejects today.

Add a PLL configuration for a 26 MHz clock, with the OP and VT PLL
multipliers at 0x0127 instead of 0x0190. This yields a link frequency
of 399.479167 MHz, which is added as a second link frequency. Select
the PLL configuration and the link frequency, and thus the pixel rate,
based on the external clock rate.

While at it, terminate the unsupported-clock error message with a
newline.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - Advertise 399.479167 MHz as a second link frequency instead of
      relying on it being close to 400 MHz. The pixel rate follows
      from it: 159.791666 MHz on two lanes (Sakari).
    - Choose between two PLL tables, split off in patch 3, from the
      external clock rate (Sakari). Fail probe if the firmware does
      not list the matching link frequency.
    - Make the last menu item the LINK_FREQ control's maximum and the
      selected frequency its default.
    - Stop writing 0x0315. Its reset value, 0x01, is what both tables
      need.
    - Drop the dev_dbg() and move the test details to the cover letter
      (Sakari).

 drivers/media/i2c/ov02c10.c | 75 +++++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 0e5010303..c7a9f5da1 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -16,7 +16,9 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV02C10_LINK_FREQ_400MHZ	400000000ULL
-#define OV02C10_MCLK			19200000
+#define OV02C10_LINK_FREQ_399MHZ	399479167ULL
+#define OV02C10_MCLK_19_2MHZ		19200000
+#define OV02C10_MCLK_26MHZ		26000000
 #define OV02C10_RGB_DEPTH		10
 
 #define OV02C10_NATIVE_WIDTH		1928
@@ -333,6 +335,22 @@ static const struct reg_sequence sensor_pll_19_2mhz_setting[] = {
 	{0x031c, 0x4f},
 };
 
+/*
+ * With the other PLL registers as for 19.2 MHz, the link frequency is
+ * mclk * M / 19.2 MHz, M being the OP (0x0304/0x0305) and VT (0x0315/0x0316)
+ * PLL multiplier.  400 MHz would need M = 295.38 at 26 MHz; M = 295 = 0x0127
+ * gives 399.479167 MHz.
+ */
+static const struct reg_sequence sensor_pll_26mhz_setting[] = {
+	{0x0301, 0x08},
+	{0x0303, 0x05},
+	{0x0304, 0x01},
+	{0x0305, 0x27},
+	{0x0313, 0x40},
+	{0x0316, 0x27},
+	{0x031c, 0x4f},
+};
+
 static const char * const ov02c10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -343,6 +361,32 @@ static const char * const ov02c10_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV02C10_LINK_FREQ_400MHZ,
+	OV02C10_LINK_FREQ_399MHZ,
+};
+
+struct ov02c10_clk_config {
+	/* External clock rate, Hz */
+	u32 mclk;
+	/* Index into link_freq_menu_items[] */
+	u32 link_freq_index;
+	/* PLL register settings for this clock rate */
+	const struct reg_sequence *pll_settings;
+	int pll_settings_length;
+};
+
+static const struct ov02c10_clk_config ov02c10_clk_configs[] = {
+	{
+		.mclk = OV02C10_MCLK_19_2MHZ,
+		.link_freq_index = 0,
+		.pll_settings = sensor_pll_19_2mhz_setting,
+		.pll_settings_length = ARRAY_SIZE(sensor_pll_19_2mhz_setting),
+	},
+	{
+		.mclk = OV02C10_MCLK_26MHZ,
+		.link_freq_index = 1,
+		.pll_settings = sensor_pll_26mhz_setting,
+		.pll_settings_length = ARRAY_SIZE(sensor_pll_26mhz_setting),
+	},
 };
 
 static const struct ov02c10_mode supported_modes[] = {
@@ -389,6 +433,8 @@ struct ov02c10 {
 	struct gpio_desc *reset;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov02c10_supply_names)];
 
+	const struct ov02c10_clk_config *clk_config;
+
 	/* MIPI lane info */
 	u32 link_freq_index;
 	u8 mipi_lanes;
@@ -503,7 +549,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov02c10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ov02c10->link_freq_index, 0,
+						    ARRAY_SIZE(link_freq_menu_items) - 1,
+						    ov02c10->link_freq_index,
 						    link_freq_menu_items);
 	if (ov02c10->link_freq)
 		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -598,8 +645,8 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 
 	ret = regmap_multi_reg_write(ov02c10->regmap,
-				     sensor_pll_19_2mhz_setting,
-				     ARRAY_SIZE(sensor_pll_19_2mhz_setting));
+				     ov02c10->clk_config->pll_settings,
+				     ov02c10->clk_config->pll_settings_length);
 	if (ret) {
 		dev_err(ov02c10->dev, "failed to write PLL settings\n");
 		goto out;
@@ -878,8 +925,13 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	if (ret)
 		goto check_hwcfg_error;
 
-	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
-	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
+	ov02c10->link_freq_index = ov02c10->clk_config->link_freq_index;
+	if (!(link_freq_bitmap & BIT(ov02c10->link_freq_index))) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "link frequency %lld Hz is not supported\n",
+				    link_freq_menu_items[ov02c10->link_freq_index]);
+		goto check_hwcfg_error;
+	}
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
 	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
@@ -916,6 +968,7 @@ static int ov02c10_probe(struct i2c_client *client)
 {
 	struct ov02c10 *ov02c10;
 	unsigned long freq;
+	unsigned int i;
 	int ret;
 
 	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
@@ -930,9 +983,15 @@ static int ov02c10_probe(struct i2c_client *client)
 				     "failed to get imaging clock\n");
 
 	freq = clk_get_rate(ov02c10->img_clk);
-	if (freq != OV02C10_MCLK)
+	for (i = 0; i < ARRAY_SIZE(ov02c10_clk_configs); i++) {
+		if (freq == ov02c10_clk_configs[i].mclk) {
+			ov02c10->clk_config = &ov02c10_clk_configs[i];
+			break;
+		}
+	}
+	if (!ov02c10->clk_config)
 		return dev_err_probe(ov02c10->dev, -EINVAL,
-				     "external clock %lu is not supported",
+				     "external clock %lu is not supported\n",
 				     freq);
 
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
-- 
2.55.0

