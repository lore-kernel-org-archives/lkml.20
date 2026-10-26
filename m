Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986659;
	b=mxdn1Ov4jbNR5Tq94ZTYU9LOe/izdwWzvSXO8Hnhda05WipWPG0rOQRJHhLqi03UyCKZ
	 SqgjJNwixGQwLWbg4TKn7QnrD5rWImPNIQBP97TsrPX1W9EnwZVA4L9+Ld4tdaMsf8nlF
	 7cHaxZuCB9V+9rrodD+xzkAoFKaIW8bAA1sAUMUGOEdKLVsnUkusrkYsbngqpWorFALNg
	 8CnGKZ1A00HYwHRfGPHeQq6H7kdC3cvVMoTzOT/FH9sxF4GyF8kiM9z5KzOOzZdSTcbAy
	 BNaX9RcGbHufAT3g8acvprkXIKfjq/n80123Knr/ycMxb3QJK1qvI4sLy+1HM8L+K+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yevYxKqoMpJZwCLQClSsJi+dFUwCf030YPfXIGC6jzg=;
	b=ejD5BZb2NYhXHTmGsyG9Lhrh9JeG4Ds+cL+mmSzwkytUlNBXfUOeHiC1Yzsljv1KSItI
	 NIvVuUaMwCulZFnTM9zvhhmVjQVx6cPFqdOKH2MmRQJrw50oTIzWJgeBX2ilhXUQQX0p7
	 lxeI3QI4YIDuLMZdTh5bysxDMBDNGizoPcDjAQ2kDxmp3SFYTb1WaEODdenu/v/yEOGFc
	 8RU4QoWJxIdO92bQsfOALgtS5yDXendQK7bJAIChBKRZZWgtexBrrR1qX/CUNSYY8EFfT
	 XcQArujwBpDyslm0eHadYVKgNN/UibC97RRgxd+L/9SOV80LZN0achUwcmtYLijDVKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FEFdGw5u;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C443606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C443606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FEFdGw5u
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c03744ef27so743941137.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986657; x=1793591457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yevYxKqoMpJZwCLQClSsJi+dFUwCf030YPfXIGC6jzg=;
        b=FEFdGw5uOhVwmlB7IU1kaWdzZEcbir34JRFUKePXEXT+b3PgN0bxZ2Pi6lZs3snMlx
         GSp0mEiJ+lEoCUwCC3tKGFg1gteMWBqDIZZesnt7eOdhyOkT//kBzTsG0OdT30jghpqj
         TQ6dTthYMslQ9SYpkCYorN/ZkV0DDsG9n+xC2fG4utAZJhOolNCXJos6BUJdv7VmaT/8
         k7wLjdBUU1hobbC/GQ6UnPlRbjCk8D4uE6TONFmb1zJSxpTRa8izlhybuEXdqI7Qc/cP
         mO4bI5L6VsZo3i/D+vzOiQpNlA6LnFSh/sCfGQ0ZguwWx+eK+GnPhw/nI9itzTzjdun0
         XxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986657; x=1793591457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yevYxKqoMpJZwCLQClSsJi+dFUwCf030YPfXIGC6jzg=;
        b=QHyC8h/Th81mWIS17oT8xvtxffb6aO04O1ErsjiQhJ4RcW1NZhzoqSh1e69Bbl/fX9
         9+cTaQa96xthSbLAxY/XVHne7s2B1LurVcWpBTuSgvkZzZvLuYevqT0H2yJcfuR30upr
         n7cOBhXoHbQ1PgKNwmmAsIcLA+XineU7aL3uMOB4nM4oOHAvXfcBRmUlKianBezg9dUN
         J6xCFI0G/Ig/9EAxbn1TOBcTvOqwTjpQJLr5oQWglZ6ZA1rbMEhgBDpN2g9aCj9TpQXY
         ISkbtAIy5l8hqvF9uvpoUO0tQFiCXE3oA+vGivxGGxYdVbbpC1eKIcHhZJFi8cVbHem2
         pRAg==
X-Forwarded-Encrypted: i=1; AKwUvBwWpzDJIpGgc6Vf0cYO4hxKVNeCuC3D4QLVwk1JPL+8pzBEyqbjiD5oZrh5DrCugF0JBLWzXR/R38BufJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpecYetgBgX2Lp+4/Rf/KcT+kfJ7qFp6/7TGae8bES3qJ4oNAH
	3/yRU3QlDPPXO1QFV5vCHdyCrHKoG9ipV1dw7uRGC9qALDUVPTgTijC0
X-Gm-Gg: AYBFou3exisneFshPBgt0n9Di6oB90Lrr8yD1ep7Obp3FrvG7w/MSA9KuEhhJNEZt/t
	x2u2XKaYcH4T2mCt60Eqr7QWA7pmQthbYTWbbR+ZUTYk+Pn4td+MCVhM6LBsfqeE5w98X5Eb7mq
	9ulm9lIZIb4GY9aVd1p3qZf48YmFcManXI45d5LZQ8XfM11X4uzXw23GMSpja8CfKAuY3Jg4kBL
	2vTWyIevuHc3fkk1oO5Zv0LIUJ1dRmqsMIjsdePGYOIU8uXp6aP7c2hmSFqBh9vHpqGo0H/JxcT
	2sT8zvbTCvfj2o73RrYWblLsL+BCgFp1qbOgwiIoATjGiAXF6s1Ltkh7E0TCPbjTQ+Th3o1IQ+/
	hPli0YiROCOB0Vz1maf/6KVL+WXm5zSGMzYebh5LbF0ZvYX3CiDLLdzOzifrnXv08XGOoc2CMSi
	u7pNp4DVFgpnExLlPy6Rqw1hQWjspiZeWjTRCWttOdm7O+iQ+OdP2zZrCzDccRWAl0CjWuWYGf0
	6U/jmAbnSSy5eXLQ7NGTrGn9APHnhe4ehVGAyfBFbFLuV2yz7/GBjJmzBFGAMwK8agDHhmpjrxG
	up4TfYOGnPdX9z4oqdqL
X-Received: by 2002:a05:6102:449b:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7ce5ce9a4f4mr1434993137.34.1792986657424;
        Sun, 25 Oct 2026 20:50:57 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:56 -0700 (PDT)
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
Subject: [PATCH v4 5/5] media: ov02c10: Add support for a 26 MHz external clock
Date: Mon, 26 Oct 2026 00:50:15 -0300
Message-ID: <20261026035015.110903-6-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

Some Raptor Lake laptops, e.g. the Samsung Galaxy Book3 series, feed
the OV02C10 a 26 MHz external clock, which the driver rejects today.

Add a PLL table for a 26 MHz clock, with the OP and VT PLL multipliers
at 0x0127 instead of 0x0190. This yields a link frequency of
399.479167 MHz, which is added as a second link frequency. Record in
link_freq_configs[] the external clock rate each link frequency needs,
and pick the link frequency listed by the firmware that the external
clock can produce. The pixel rate follows from it.

This replaces the external clock check in probe.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v4:
    - Record the external clock rate in link_freq_configs[] and pick the
      link frequency listed by the firmware that the external clock can
      produce, instead of a table per external clock (Sakari). This
      replaces the external clock check in probe.
    - Name the 26 MHz PLL table after its link frequency.
    - Like the 400 MHz table, the 26 MHz table only holds 0x0303, 0x0305
      and 0x0316, following patch 3.
    
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

 drivers/media/i2c/ov02c10.c | 52 +++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 62ea20dc5..1fb2a8586 100644
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
@@ -336,6 +338,18 @@ static const struct reg_sequence sensor_pll_400mhz_setting[] = {
 	{0x0316, 0x90},
 };
 
+/*
+ * With the other PLL registers as set by the common mode table, the link
+ * frequency is mclk * M / 19.2, M being the OP (0x0304/0x0305) and VT
+ * (0x0315/0x0316) PLL multiplier.  400 MHz would need M = 295.38 at 26 MHz;
+ * M = 295 = 0x0127 gives 399.479167 MHz.
+ */
+static const struct reg_sequence sensor_pll_399mhz_setting[] = {
+	{0x0303, 0x05},
+	{0x0305, 0x27},
+	{0x0316, 0x27},
+};
+
 static const char * const ov02c10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -346,9 +360,12 @@ static const char * const ov02c10_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV02C10_LINK_FREQ_400MHZ,
+	OV02C10_LINK_FREQ_399MHZ,
 };
 
 struct ov02c10_link_freq_config {
+	/* External clock rate the PLL settings are for, Hz */
+	u32 mclk;
 	/* PLL register settings, which set the link frequency */
 	const struct reg_sequence *pll_settings;
 	int pll_settings_length;
@@ -357,9 +374,15 @@ struct ov02c10_link_freq_config {
 /* Indexed like link_freq_menu_items[] */
 static const struct ov02c10_link_freq_config link_freq_configs[] = {
 	{
+		.mclk = OV02C10_MCLK_19_2MHZ,
 		.pll_settings = sensor_pll_400mhz_setting,
 		.pll_settings_length = ARRAY_SIZE(sensor_pll_400mhz_setting),
 	},
+	{
+		.mclk = OV02C10_MCLK_26MHZ,
+		.pll_settings = sensor_pll_399mhz_setting,
+		.pll_settings_length = ARRAY_SIZE(sensor_pll_399mhz_setting),
+	},
 };
 
 static const struct ov02c10_mode supported_modes[] = {
@@ -520,7 +543,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov02c10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ov02c10->link_freq_index, 0,
+						    ARRAY_SIZE(link_freq_menu_items) - 1,
+						    ov02c10->link_freq_index,
 						    link_freq_menu_items);
 	if (ov02c10->link_freq)
 		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -872,7 +896,8 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	};
 	struct device *dev = ov02c10->dev;
 	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
-	unsigned long link_freq_bitmap;
+	unsigned long link_freq_bitmap, mclk;
+	unsigned int i;
 	int ret;
 
 	/*
@@ -897,7 +922,19 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	if (ret)
 		goto check_hwcfg_error;
 
-	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
+	/* Only keep the link frequencies the external clock can produce */
+	mclk = clk_get_rate(ov02c10->img_clk);
+	for (i = 0; i < ARRAY_SIZE(link_freq_configs); i++) {
+		if (link_freq_configs[i].mclk != mclk)
+			link_freq_bitmap &= ~BIT(i);
+	}
+	if (!link_freq_bitmap) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "no supported link frequency for external clock %lu\n",
+				    mclk);
+		goto check_hwcfg_error;
+	}
+
 	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
@@ -934,7 +971,6 @@ static void ov02c10_remove(struct i2c_client *client)
 static int ov02c10_probe(struct i2c_client *client)
 {
 	struct ov02c10 *ov02c10;
-	unsigned long freq;
 	int ret;
 
 	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
@@ -948,12 +984,6 @@ static int ov02c10_probe(struct i2c_client *client)
 		return dev_err_probe(ov02c10->dev, PTR_ERR(ov02c10->img_clk),
 				     "failed to get imaging clock\n");
 
-	freq = clk_get_rate(ov02c10->img_clk);
-	if (freq != OV02C10_MCLK)
-		return dev_err_probe(ov02c10->dev, -EINVAL,
-				     "external clock %lu is not supported",
-				     freq);
-
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 
 	/* Check HW config */
-- 
2.56.0

