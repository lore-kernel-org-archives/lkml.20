Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1E33F58B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577690; cv=none; b=D8BF+lcuDIBLCAaSYJXEOtgEJ3wdUGll0XdUJVdFWybxnUQ5f36jUBie3KBKIRtvkr15XBJq+vV4xZD2uRSD7DOWMo8kqrWDzGrKHg/66Z7MVq8X8Ykz1VBicAtbB5K2mjiqODHL9SAsR9C448elMvlmGcfFEF6zcMJ8cQy5y54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577690; c=relaxed/simple;
	bh=5Urq4eDrVzgAFrC+1rVv6neHrmL/040TUCMXwO44DOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n36rVoDvdynguWeEXKUJfsBwHP0OUDjH2E0Qzhvve22zoBgpMvb6DjUElHNnH/ST3ajxFOBTEuPwZep1NPF/FxP0DlFQDKYQcFYugNjvrVqMho/mzwEmUuBwmNsM0nu4vcm8dpnj2yl3ruDjcf2sodpVQRBfzRjx+aMBPajtKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5xN/s7I; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5xN/s7I"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d72ae08fa1so15988915ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577689; x=1789182489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OrCwhNdL89P0wEagSgqn6hXLxeGiWl+S+zwJeufNsc=;
        b=n5xN/s7IpxIq5ONyFOUUY69eWqo6z422bXAHlsJZu3IfC8U2tdRTX8TG3wxykXBHV7
         BJtkcu0wa5KULJeR8pCP4zUx44+8JvXrhE9SIwH72fBIoVrYxdQfwUEr1CQFwgywHl74
         0dDzIMxGb1L+im6zTgAfPqwK5NVZ/05CDEsjXFH19t2Q4gAb7osgvQrc5HuU81iIk7JJ
         jnsEwNCQxhNf0yrDfZStafcdmWvnJoP2vKkZkbHaIz14tBJgiej3nLbVNVNVsyHnAurR
         +Dpu/4dKDgsLn3cTwJTBy2d2PXHet0JxTUB5cjeZcsgMQpeDl/hjhZHLO+8+Z4UydcQU
         020Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577689; x=1789182489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5OrCwhNdL89P0wEagSgqn6hXLxeGiWl+S+zwJeufNsc=;
        b=PMRRKMAITQV6n5SrOnjibQzGJiJOVh4bU1MqNKWxhXF9m3I/qLW9j20JZVLiYQuukV
         3kyu/oeUL0GRgpl3yeJhWnZJ9mVPcRsYi9GZmMi91ARrnYcUeiIqL7yIu5adxHj2Jq9w
         EMJBIQoxKpti7+BoJvWOqK9mvIEV79JbBASuxqTYq09KZvEzwPa3Y3gJWv74U1dKPz9D
         Qo7e9z3pDdTAcBX2aCCeSuntK+aFIr/Bl3BWa/rOdy+FX76DtG+ee2LWW2C6GpOLn8VO
         frd53T15N+raq0VEMzQ2RoRu+AItol5qt0m3HDSYYR60ETDH6ZCEPZN1L6oz0GOcnUTw
         jq+g==
X-Forwarded-Encrypted: i=1; AKwUvByoLx/79icH7R9R/pDiylrJyQv99kubUCXPTyHS4zQE/b7q6UZYUm8ahZXzsfMVnQKZh1x5Px9pbW1oyso=@vger.kernel.org
X-Gm-Message-State: AFuF++lrwMjMB21Wq3lgr6/AjhAuPFUDnVnCaJbuMurSZbzc1rNdBzUe
	rIjhbm9yVC9LFsHed7Qtu9asKQgxCy7VmQ4YmZW5T1icKvVJsHp3jH1W
X-Gm-Gg: AYBFou39lnD80k+VQm0pcQ+eMsHpHDHC/OqiU8Yput6WabVF4e4M+tNE6Tpf68EBAW5
	7rp+izclIxTX0LcIg0iaz8Ce50RqLJ5aPymBhXQaVv9UkolRZWETyEuvAkPYQ1iULumvh+xPjBF
	aUjJlkCDHEb6GTxC3+TStz8Y+WnlSNfN4x9+9eR7YwtzVxc7kuSR7mSoKmzGiSjPkUqzudyE8Xz
	zfY9PwkOSbrZvln7nd0Ju+pllUDdPrTwcKiBD/XFkKdvEVF48boxHpyJSD1P3g8HdKRS50RG6bI
	p6M7ur+dImohtViYCJkSr0fa3qP6Pniw+CbD3p0mZJ8hDV0uzDCdyN6HkS45AB1jTqt8tIdJUG9
	o91lKCzhAAnppyooOeueHuj1C+S9A3J7BgTTJwDQkyjmm3WxyXLdngqmusylYcZC8ktafBNopy6
	0DQXVoKopBBIfdi3cz1N+ugs7RhoyoRTl7BNTi6Id393yVIEVXi+qLgluP8RtfK7IQ7vrUA/e1U
	LvjmY4smoc2OtFzsRyWJXgwXw==
X-Received: by 2002:a17:903:1b0b:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2db12620112mr179499975ad.15.1788577688543;
        Fri, 04 Sep 2026 20:08:08 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm10344142eec.13.2026.09.04.20.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:08:08 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
Date: Sat,  5 Sep 2026 00:07:32 -0300
Message-ID: <20260905030732.39196-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905030732.39196-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
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

The PLL register tables are the 19.2 MHz ones; OmniVision's 26 MHz PLL
programming is not publicly available. With a 26 MHz input the same
dividers make every internal clock, and therefore the MIPI link, run
26/19.2 = 1.3542x faster: a ~541.7 MHz link and ~40 fps instead of the
nominal 400 MHz / 30 fps. Rather than leave link-frequency and
pixel-rate describing the 19.2 MHz case, add a second
V4L2_CID_LINK_FREQ menu entry (400 MHz * 26 / 19.2) and select it when
the external clock is 26 MHz. pixel-rate is derived from the link
frequency and scales with it, so the frame rate and exposure times
reported to userspace match the hardware, and the IPU6 CSI-2 receiver
programs its D-PHY high-speed frequency range and bandwidth budget for
the rate the sensor actually transmits.

The ipu-bridge fwnode only lists the nominal 400 MHz link frequency
(keyed by ACPI HID, not by clock rate), so v4l2_link_freq_to_bitmap()
still matches on the 400 MHz entry and the 541.7 MHz index is selected
explicitly for the 26 MHz case.

On a Meteor Lake test machine a single CSI-2 "frame sync error" may
still be logged by the IPU6 receiver at stream start, after which
capture runs cleanly; this looks like a sensor PLL settling transient
and is not addressed here.

While touching the clock check, terminate its error string with a
newline.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 45 ++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 114db38c0..5184eb1cc 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -16,7 +16,16 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV02C10_LINK_FREQ_400MHZ	400000000ULL
-#define OV02C10_MCLK			19200000
+/*
+ * The PLL register tables target a 19.2 MHz input clock.  On boards that
+ * clock the sensor at 26 MHz the same dividers yield a 26/19.2 = 1.3542x
+ * faster MIPI link (and frame rate).  OmniVision's 26 MHz PLL values are
+ * not public, so rather than re-normalise the link the driver advertises
+ * the real, scaled link frequency: 400 MHz * 26 / 19.2 = 541.667 MHz.
+ */
+#define OV02C10_LINK_FREQ_541MHZ	541666667ULL
+#define OV02C10_MCLK_19_2MHZ		19200000
+#define OV02C10_MCLK_26MHZ		26000000
 #define OV02C10_RGB_DEPTH		10
 
 #define OV02C10_NATIVE_WIDTH		1928
@@ -345,8 +354,14 @@ static const char * const ov02c10_test_pattern_menu[] = {
 	"Color Bar type 4",
 };
 
+enum {
+	OV02C10_LINK_FREQ_400MHZ_IDX,	/* 19.2 MHz external clock */
+	OV02C10_LINK_FREQ_541MHZ_IDX,	/* 26 MHz external clock */
+};
+
 static const s64 link_freq_menu_items[] = {
-	OV02C10_LINK_FREQ_400MHZ,
+	[OV02C10_LINK_FREQ_400MHZ_IDX] = OV02C10_LINK_FREQ_400MHZ,
+	[OV02C10_LINK_FREQ_541MHZ_IDX] = OV02C10_LINK_FREQ_541MHZ,
 };
 
 static const struct ov02c10_mode supported_modes[] = {
@@ -396,6 +411,9 @@ struct ov02c10 {
 	/* MIPI lane info */
 	u32 link_freq_index;
 	u8 mipi_lanes;
+
+	/* External (sensor) clock rate, Hz */
+	u32 xvclk_freq;
 };
 
 static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
@@ -507,7 +525,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov02c10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ov02c10->link_freq_index, 0,
+						    ov02c10->link_freq_index,
+						    ov02c10->link_freq_index,
 						    link_freq_menu_items);
 	if (ov02c10->link_freq)
 		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -875,6 +894,21 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
 	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
 
+	/*
+	 * The IPU6 ipu-bridge always describes the nominal 19.2 MHz link
+	 * (400 MHz) in the fwnode, keyed by ACPI HID, even on boards that
+	 * clock the sensor at 26 MHz.  There the real link frequency is
+	 * 26/19.2 higher; advertise it so the CSI-2 receiver programs its
+	 * D-PHY frequency band and bandwidth budget for the rate the sensor
+	 * actually transmits.
+	 */
+	if (ov02c10->xvclk_freq == OV02C10_MCLK_26MHZ)
+		ov02c10->link_freq_index = OV02C10_LINK_FREQ_541MHZ_IDX;
+
+	dev_dbg(dev, "%u Hz external clock, link freq %lld Hz\n",
+		ov02c10->xvclk_freq,
+		link_freq_menu_items[ov02c10->link_freq_index]);
+
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
 	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		ret = dev_err_probe(dev, -EINVAL,
@@ -924,10 +958,11 @@ static int ov02c10_probe(struct i2c_client *client)
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

