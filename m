Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967552;
	b=ZCGmc4K+dGjeddQu44UnukweunzFTS+ZZmjlS3Z/uvTUCxJ+t9HkiqeJRRvGvjlo1gj5
	 1blDmFLXrmCQJwyGfWwUGfXf9BAnD8kL3tHQ47JGYz6sV5mHABs8FKtcnlo7QrFKqEjD3
	 /D6kn9nb+iTk4SuiJUvYd0NK142ec2G4K7LziNs16C0eNPf2TSk1No4iRVjQhjvfhPzYI
	 ToYqmodvqWLTDMHuVFTcICSj2KWaVDjV7hE6nj/1Fjpgha/cDTTHZQw+i/gVrjEXwPHwq
	 ppCihjVout0bN758P92kZVPWdoiP8JiXEQLu4gS62F/+Z5QLl1IJgEnIKERI3eCsqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jYty0lvCLSyBblR69yQ8tRee1FK9VP2YpTyA2jpNlIc=;
	b=H8oq/S+WPSndzp2Txoxq+X/AlqMWbQlXr8bZ/Um90/d2s3QiZxs4No7x8q5Iju6U3Ht2
	 BAhPcaTZG0Y0YOa9upUu0+2asJuAqKBFJ1ONehsTs8W/jgWUXHu2+G9laDwRM6rKqVJJD
	 ZpvcD+mO5/A1KoER1K8T8oa/5mxwYlSVFseAgYM6zO5TtzDNYtFTPeJ35+UvSPf+rmeDy
	 RR2RsmQ6Fn23k5Z+0u9CsHW6twuHowTaEOrwE80luzSuO0nlkw6aAmuNeV7xvSSwpQFqG
	 4Qe3vDpvH7jrvb+fLQ0EUrV7jDabr2uc8wQva+auwlMsQdqkthiKVxhMqLHe1CXEccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=metarealtyinc.ca;
	spf=pass smtp.mailfrom=metarealtyinc.ca;
	dkim=pass header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=ZP88sVJu;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=ZP88sVJu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5495d549924so5280781cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc.ca; s=google; t=1793967550; x=1794572350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYty0lvCLSyBblR69yQ8tRee1FK9VP2YpTyA2jpNlIc=;
        b=ZP88sVJuW7FHwd94CoiFWSD11pdT3VEOmf7P2J/BOSYFCShoaUnaPE1si26g1U4vdL
         WDq65PDVArYcsDTix7oTpKF4Xk0NJow+yYgn4ZczeKk/xCn56g+3Cf09JmnVKV0luJpk
         PBD+dCXpdaYhV5B36DRODl5RvpMmuJsoy+aOY19VN2y3mpgQBVrKcRWXTj75Y1ewepDB
         LBuUsgIVdujkRK24uMe0PCOOGixhBTDQcu26C0IiA6da3PPd+58HRe/bMaQqhRQmYV1X
         MXbGFjrFPQwpAuMMDTY0fWlUfVznHnSjPi9sLoYWTAX9fIuQAOmu+l3skNEWdxSangax
         RpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793967550; x=1794572350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYty0lvCLSyBblR69yQ8tRee1FK9VP2YpTyA2jpNlIc=;
        b=0DPSGzIgnhPLKTtecXXlCfch5yYPxtWabQAGChfPgRuGuXg2FfEOOW3AQvfvQ7asZ+
         sNAgQLRtA9ZeNct4tZcfTDFE7HvWZxm+iAcH1sO8ZyC0CzEd2hLVl7l/6Lt0uJB0DCnr
         +779by4ezTjlAWtW9vviQNjSfhpD+Am/m/xphV93mERfHN6AqdiaPm+G+ke4LQuH0uRB
         ODDuXK2x85t83Oi9+abE4WXOdNuIRRcmvXZ5VhxVH6h7C30+LWOZQc9teqYyPQoCed9H
         AhqxmnV0qAo1jYv7KgM9nHsJ296NbO8zTY/IaEMajC0b3tPOR8bxanbgv9f53wtFrFBU
         nNVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH09JwQ2q3umeClBqMVheY4UUgaBixf0PJ6rCAVd2vfm2GYqF9U8YGgJea/DA1kJ69fi8RAfLgq8YM7Bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lXP0vZlpre3EsQTtpPDZhxKqhRXvMvAyB/2Z3oxSAIrUG1RHf
	9Pd08sYDvma7naqO+H2uesluH98yZo4/yzSjSdv/AfOMcqpaI7plR/2dimqM+IvV2tA=
X-Gm-Gg: AYBFou2dvTbTeyR+4nuBLzT32d4rjUX5o6AiiWZYf+w4wYfAASLa2auQp3GMQXf365N
	tMj98dRMXUrAdbpMumf2HSqly4ViH9EpE5wQibrIQLBH0FhHaEVzWJRKyjntMdLR9ADuSa4uwGs
	+9VDoASuyB6XEqPcGrs0SFQdpZNJnbMbzBSXRLtCVyYuM/s5PKNTC2gqXeR7a5HW48tU2UdmGVu
	Rg7rUkxDqAIEFU1J/8KWMfPSHirHOdBNKzNBlzJxplJpC+SbF7qZP02MCWW7R4Zy4w2zGxv4UrM
	GuiP6ug1dlvJuykBbX6LAK5QzXvOo4AQVv6O72rpLrm/ErONLC0OmfY80ya9faA3vupHNlqorvs
	kQ6nJxnGoh+5jl05Cu5fzSqmaN/x7fDdb6Kx+q9LJipNujCJcMZrpzfo40Tujb0uElyXo6ASBZm
	v6XOA89uEmVROlsN0ALDlzOHoJYo6oelajj1ZwkJKv99zaxhVo3XxS/3SuGR7DQsl4Ny8HdYgHh
	uNUAatgLvDODCL0lmJrzmaHT/VzmwFb6LvgfuKTPMXI+m0NOR0bVI9hoPpDszuxhNeVeSBrteX3
	6DHiRPyY/TfTavoCdsv9IQA7FXnQCTiylcTO1J55gSG8EPbwZhd05Z9xYPqzXM+earWtf//6ta1
	I6kzm1oOGrOD1d79FXZqCwR5oFEV0nm8luA4dr9UujKLEXCuUDAlCecbjoWxpgEmwGasU7VvWal
	HfvkjoBJ1g//zLgAvh/BfgHYYuItEjLU63EM/iHpSI0j1hxs76O4h3U9FIDHVjxSqg
X-Received: by 2002:a05:622a:8b08:b0:535:a5fb:6451 with SMTP id d75a77b69052e-54e1666f2b4mr35077391cf.75.1793967550081;
        Fri, 06 Nov 2026 04:19:10 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::879a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25785f09sm19064901cf.9.2026.11.06.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:19:09 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: rshouriesh@gmail.com,
	sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	hverkuil+cisco@kernel.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	bingbu.cao@intel.com,
	kulikeduard89@gmail.com,
	u.kleine-koenig@baylibre.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jake Steinman <j@metarealtyinc.ca>
Subject: [PATCH v2] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Fri,  6 Nov 2026 07:19:07 -0500
Message-ID: <20261106121907.42745-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
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

The HM1092 is also the IR camera of Intel IPU6/IPU7 laptops. There it is
enumerated through ACPI as HIMX1092 and clocked at 19.2 MHz rather than
24 MHz. The driver cannot bind on those machines: it has no ACPI match
table and probe rejects any external clock other than 24 MHz.

Turn the single fixed mode into a table of configurations selected by
the external clock rate, each with its own init sequence, link
frequency, timings, readout window and exposure default. Add the
configuration the vendor Windows driver uses on the Intel platforms:
648x368, HTS 1620, VTS 740, with the PLL pre-divider at 10 and the
multiplier at 94, giving 19200000 * 94 / 10 = 180480000 Hz.

ipu-bridge lists both 180000000 and 180480000 for this sensor, so
matching any menu entry against the endpoint is no longer enough. Check
that the endpoint offers the link frequency of the selected
configuration.

The 24 MHz configuration is unchanged: same init sequence, timings,
controls and defaults.

Tested on a Dell XPS 16 DA16260 (Panther Lake, IPU7.5, 19.2 MHz clock
from INT3472) with the ipu6 driver on v7.4-rc1: the sensor binds on
CSI-2 port 2, streams 648x368 Y10 at link frequency 180480000 and is
used daily for IR face authentication. The 24 MHz configuration is
compile-tested only.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
Changes in v2:
- Drop <linux/mod_devicetable.h>, <linux/i2c.h> already provides the
  match table types (Uwe).
- Drop the staging ipu7 Y10 patch; the ipu6 driver already has Y10 and
  Y10P (Sakari). Retested with the ipu6 driver as described above.

v1: https://lore.kernel.org/linux-media/cover.1791608336.git.j@metarealtyinc.ca/

Note for v6: on v7.4-rc1 the v6 driver needs its set_fmt and
get_selection pad ops updated for the struct v4l2_subdev_client_info
argument added by commit 7eef49c16461 ("media: v4l2-subdev: Add struct
v4l2_subdev_client_info pointer to pad ops"). I tested with that
adjustment applied locally; it is not part of this patch.

 drivers/media/i2c/hm1092.c | 362 ++++++++++++++++++++++++++++++++-----
 1 file changed, 316 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
index eb3607a..46203cb 100644
--- a/drivers/media/i2c/hm1092.c
+++ b/drivers/media/i2c/hm1092.c
@@ -20,15 +20,19 @@
 /*
  * CSI-2 D-PHY link frequency (DDR, i.e. half the per-lane bit rate).
  *
- * The vendor Windows configuration supplies a 24 MHz EXTCLK and programs the
- * MIPI PLL pre-divider to 12 (0x030d = 0x0c) and multiplier to 90
- * (0x030f = 0x5a):
- *   link freq  = 24000000 * 90 / 12          = 180000000
- *   bit rate   = link freq * 2               = 360000000 bps
- *   pixel_rate = bit rate * 1 lane / 10 bpp  = 36000000 pixels/s
+ * Two vendor Windows configurations are known. Each pairs an EXTCLK rate with
+ * its own MIPI PLL pre-divider (0x030d) and multiplier (0x030f):
+ *
+ *   24 MHz EXTCLK, pre-divider 12, multiplier 90 (Qualcomm):
+ *     link freq  = 24000000 * 90 / 12          = 180000000
+ *     pixel_rate = link freq * 2 * 1 lane / 10 = 36000000 pixels/s
+ *
+ *   19.2 MHz EXTCLK, pre-divider 10, multiplier 94 (Intel IPU):
+ *     link freq  = 19200000 * 94 / 10          = 180480000
+ *     pixel_rate = link freq * 2 * 1 lane / 10 = 36096000 pixels/s
  */
-#define HM1092_LINK_FREQ		180000000ULL
-#define HM1092_MCLK			24000000
+#define HM1092_LINK_FREQ_180MHZ		180000000ULL
+#define HM1092_LINK_FREQ_180P48MHZ	180480000ULL
 #define HM1092_BITS_PER_SAMPLE		10
 
 #define HM1092_REG_STREAM		CCI_REG8(0x0100)
@@ -41,16 +45,14 @@
 /*
  * Exposure is a 16-bit value in lines and analogue gain an 8-bit register.
  * The register layout is not documented publicly; it was recovered from the
- * vendor Windows driver. The exposure default (500) was selected from
- * illuminated hardware tests and is also programmed by the init sequence at
- * 0x0202/0x0203.
+ * vendor Windows driver. The exposure default is per mode and matches what
+ * that mode's init sequence programs at 0x0202/0x0203.
  */
 #define HM1092_REG_EXPOSURE_H		CCI_REG8(0x0202)
 #define HM1092_REG_EXPOSURE_L		CCI_REG8(0x0203)
 #define HM1092_EXPOSURE_MIN		2
 #define HM1092_EXPOSURE_MARGIN		21
 #define HM1092_EXPOSURE_STEP		1
-#define HM1092_EXPOSURE_DEFAULT		500
 
 #define HM1092_REG_ANALOGUE_GAIN	CCI_REG8(0x0205)
 #define HM1092_ANALOGUE_GAIN_MIN	0
@@ -72,9 +74,9 @@
 /*
  * Pixel array geometry. The vendor specifies a 1280x720 active array; the
  * full array including the surrounding dummy/optical-black pixels is 1296x736
- * (8 pixels of margin on each side). The single fixed mode reads a window out
- * of the active array (X_ADDR [0x0030..0x04ad], Y_ADDR [0x0008..0x02d5]);
- * subsequent internal processing produces the 560x360 output.
+ * (8 pixels of margin on each side). Each mode reads a fixed window out of
+ * the array (X_ADDR/Y_ADDR registers 0x0344..0x034b, reported as the crop
+ * rectangle); subsequent internal processing produces the output size.
  */
 #define HM1092_NATIVE_WIDTH		1296U
 #define HM1092_NATIVE_HEIGHT		736U
@@ -82,12 +84,8 @@
 #define HM1092_ACTIVE_TOP		8U
 #define HM1092_ACTIVE_WIDTH		1280U
 #define HM1092_ACTIVE_HEIGHT		720U
-#define HM1092_CROP_LEFT		48U
-#define HM1092_CROP_TOP			8U
-#define HM1092_CROP_WIDTH		1150U
-#define HM1092_CROP_HEIGHT		718U
 
-static const struct cci_reg_sequence hm1092_init_regs[] = {
+static const struct cci_reg_sequence hm1092_560x360_regs[] = {
 	{ CCI_REG8(0x0103), 0x00 },
 	{ CCI_REG8(0x030a), 0x05 },
 	{ CCI_REG8(0x030d), 0x0c },
@@ -275,18 +273,265 @@ static const struct cci_reg_sequence hm1092_init_regs[] = {
 	{ CCI_REG8(0x0037), 0x30 },
 };
 
+/*
+ * Init sequence used with a 19.2 MHz EXTCLK, as found on Intel IPU laptops
+ * where the sensor is described in ACPI as HIMX1092. Recovered from the
+ * vendor Windows driver for those platforms; kept in the order that driver
+ * issues it, including its repeated writes.
+ */
+static const struct cci_reg_sequence hm1092_648x368_regs[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0103), 0x00 },
+	{ CCI_REG8(0x0000), 0x00 },
+	{ CCI_REG8(0x0101), 0x00 },
+	{ CCI_REG8(0x0202), 0x02 },
+	{ CCI_REG8(0x0203), 0xe5 },
+	{ CCI_REG8(0x0307), 0x00 },
+	{ CCI_REG8(0x0309), 0x01 },
+	{ CCI_REG8(0x030a), 0x05 },
+	{ CCI_REG8(0x030d), 0x0a },
+	{ CCI_REG8(0x030f), 0x5e },
+	{ CCI_REG8(0x0310), 0x00 },
+	{ CCI_REG8(0x0340), 0x03 },
+	{ CCI_REG8(0x0341), 0x1e },
+	{ CCI_REG8(0x0342), 0x05 },
+	{ CCI_REG8(0x0343), 0xe4 },
+	{ CCI_REG8(0x0350), 0x53 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ CCI_REG8(0x3110), 0x02 },
+	{ CCI_REG8(0x3735), 0xe2 },
+	{ CCI_REG8(0x3704), 0x04 },
+	{ CCI_REG8(0x4001), 0x00 },
+	{ CCI_REG8(0x4002), 0x2b },
+	{ CCI_REG8(0x4024), 0x40 },
+	{ CCI_REG8(0x4131), 0x01 },
+	{ CCI_REG8(0x4132), 0x20 },
+	{ CCI_REG8(0x4265), 0x02 },
+	{ CCI_REG8(0x4b04), 0x01 },
+	{ CCI_REG8(0x4b0e), 0x0e },
+	{ CCI_REG8(0x4b18), 0x00 },
+	{ CCI_REG8(0x4b20), 0x9e },
+	{ CCI_REG8(0x4b31), 0x06 },
+	{ CCI_REG8(0x4b3b), 0x02 },
+	{ CCI_REG8(0x4b3e), 0x00 },
+	{ CCI_REG8(0x4b44), 0x0c },
+	{ CCI_REG8(0x4b45), 0x01 },
+	{ CCI_REG8(0x4b47), 0x00 },
+	{ CCI_REG8(0x5004), 0x40 },
+	{ CCI_REG8(0x5005), 0x28 },
+	{ CCI_REG8(0x5006), 0x40 },
+	{ CCI_REG8(0x5007), 0x28 },
+	{ CCI_REG8(0x5010), 0x20 },
+	{ CCI_REG8(0x5011), 0x00 },
+	{ CCI_REG8(0x5013), 0x03 },
+	{ CCI_REG8(0x5015), 0xb3 },
+	{ CCI_REG8(0x501d), 0x4c },
+	{ CCI_REG8(0x5098), 0x00 },
+	{ CCI_REG8(0x5099), 0x11 },
+	{ CCI_REG8(0x509b), 0x03 },
+	{ CCI_REG8(0x50a0), 0x30 },
+	{ CCI_REG8(0x50a2), 0x0b },
+	{ CCI_REG8(0x50a6), 0x00 },
+	{ CCI_REG8(0x50a7), 0x00 },
+	{ CCI_REG8(0x50aa), 0x22 },
+	{ CCI_REG8(0x50ab), 0x07 },
+	{ CCI_REG8(0x50ac), 0x24 },
+	{ CCI_REG8(0x50ad), 0x07 },
+	{ CCI_REG8(0x50ae), 0x20 },
+	{ CCI_REG8(0x50af), 0x40 },
+	{ CCI_REG8(0x50b3), 0x04 },
+	{ CCI_REG8(0x50b4), 0x00 },
+	{ CCI_REG8(0x50b7), 0x00 },
+	{ CCI_REG8(0x50b8), 0x70 },
+	{ CCI_REG8(0x50b9), 0xff },
+	{ CCI_REG8(0x50ba), 0xff },
+	{ CCI_REG8(0x50bb), 0x14 },
+	{ CCI_REG8(0x50cb), 0x21 },
+	{ CCI_REG8(0x50d5), 0xe0 },
+	{ CCI_REG8(0x50d7), 0x12 },
+	{ CCI_REG8(0x50dd), 0x00 },
+	{ CCI_REG8(0x50e8), 0x00 },
+	{ CCI_REG8(0x50ea), 0x74 },
+	{ CCI_REG8(0x50fa), 0x02 },
+	{ CCI_REG8(0x5100), 0x03 },
+	{ CCI_REG8(0x5101), 0x13 },
+	{ CCI_REG8(0x5102), 0x23 },
+	{ CCI_REG8(0x5103), 0x33 },
+	{ CCI_REG8(0x5104), 0x43 },
+	{ CCI_REG8(0x5105), 0x42 },
+	{ CCI_REG8(0x5106), 0x40 },
+	{ CCI_REG8(0x5118), 0x00 },
+	{ CCI_REG8(0x5119), 0x00 },
+	{ CCI_REG8(0x511a), 0x00 },
+	{ CCI_REG8(0x511b), 0x00 },
+	{ CCI_REG8(0x511c), 0x00 },
+	{ CCI_REG8(0x511d), 0x00 },
+	{ CCI_REG8(0x511e), 0x00 },
+	{ CCI_REG8(0x5130), 0x13 },
+	{ CCI_REG8(0x5131), 0x23 },
+	{ CCI_REG8(0x5132), 0x33 },
+	{ CCI_REG8(0x5133), 0x43 },
+	{ CCI_REG8(0x5134), 0x42 },
+	{ CCI_REG8(0x5135), 0x40 },
+	{ CCI_REG8(0x5136), 0x40 },
+	{ CCI_REG8(0x5148), 0x01 },
+	{ CCI_REG8(0x5149), 0x01 },
+	{ CCI_REG8(0x514a), 0x01 },
+	{ CCI_REG8(0x514b), 0x01 },
+	{ CCI_REG8(0x514c), 0x01 },
+	{ CCI_REG8(0x514d), 0x01 },
+	{ CCI_REG8(0x514e), 0x01 },
+	{ CCI_REG8(0x51c0), 0x00 },
+	{ CCI_REG8(0x51c1), 0x81 },
+	{ CCI_REG8(0x51c2), 0xec },
+	{ CCI_REG8(0x51c3), 0x00 },
+	{ CCI_REG8(0x51c4), 0x55 },
+	{ CCI_REG8(0x51c5), 0x44 },
+	{ CCI_REG8(0x51c6), 0x00 },
+	{ CCI_REG8(0x51c7), 0x81 },
+	{ CCI_REG8(0x51c8), 0xec },
+	{ CCI_REG8(0x51c9), 0x00 },
+	{ CCI_REG8(0x51ca), 0x55 },
+	{ CCI_REG8(0x51cb), 0x24 },
+	{ CCI_REG8(0x51cc), 0x00 },
+	{ CCI_REG8(0x51cd), 0x81 },
+	{ CCI_REG8(0x51ce), 0xec },
+	{ CCI_REG8(0x51cf), 0x00 },
+	{ CCI_REG8(0x51d0), 0x54 },
+	{ CCI_REG8(0x51d1), 0x24 },
+	{ CCI_REG8(0x51d2), 0x00 },
+	{ CCI_REG8(0x51d3), 0x81 },
+	{ CCI_REG8(0x51d4), 0xec },
+	{ CCI_REG8(0x51d5), 0x00 },
+	{ CCI_REG8(0x51d6), 0x53 },
+	{ CCI_REG8(0x51d7), 0x14 },
+	{ CCI_REG8(0x51d8), 0x00 },
+	{ CCI_REG8(0x51d9), 0x81 },
+	{ CCI_REG8(0x51da), 0xec },
+	{ CCI_REG8(0x51db), 0x00 },
+	{ CCI_REG8(0x51dc), 0x53 },
+	{ CCI_REG8(0x51dd), 0x14 },
+	{ CCI_REG8(0x51e0), 0x09 },
+	{ CCI_REG8(0x51e1), 0x03 },
+	{ CCI_REG8(0x51e2), 0x04 },
+	{ CCI_REG8(0x51e3), 0x03 },
+	{ CCI_REG8(0x51e4), 0x08 },
+	{ CCI_REG8(0x51e5), 0x07 },
+	{ CCI_REG8(0x51e6), 0x08 },
+	{ CCI_REG8(0x51e7), 0x07 },
+	{ CCI_REG8(0x51e8), 0x04 },
+	{ CCI_REG8(0x51e9), 0x46 },
+	{ CCI_REG8(0x51ea), 0x43 },
+	{ CCI_REG8(0x51eb), 0x62 },
+	{ CCI_REG8(0x51ec), 0x61 },
+	{ CCI_REG8(0x51ed), 0x00 },
+	{ CCI_REG8(0x51ee), 0x00 },
+	{ CCI_REG8(0x5200), 0x60 },
+	{ CCI_REG8(0x5201), 0x80 },
+	{ CCI_REG8(0x5202), 0x00 },
+	{ CCI_REG8(0x5203), 0x01 },
+	{ CCI_REG8(0x5206), 0x80 },
+	{ CCI_REG8(0x5208), 0x0b },
+	{ CCI_REG8(0x5209), 0x0c },
+	{ CCI_REG8(0x520c), 0x15 },
+	{ CCI_REG8(0x520d), 0x40 },
+	{ CCI_REG8(0x5214), 0x28 },
+	{ CCI_REG8(0x5215), 0x04 },
+	{ CCI_REG8(0x5216), 0x02 },
+	{ CCI_REG8(0x5217), 0x01 },
+	{ CCI_REG8(0x5218), 0x07 },
+	{ CCI_REG8(0x521e), 0x01 },
+	{ CCI_REG8(0x5282), 0xff },
+	{ CCI_REG8(0x5283), 0x03 },
+	{ CCI_REG8(0x0202), 0x01 },
+	{ CCI_REG8(0x0203), 0x68 },
+	{ CCI_REG8(0x0340), 0x02 },
+	{ CCI_REG8(0x0341), 0xe4 },
+	{ CCI_REG8(0x0342), 0x06 },
+	{ CCI_REG8(0x0343), 0x54 },
+	{ CCI_REG8(0x0344), 0x00 },
+	{ CCI_REG8(0x0345), 0x00 },
+	{ CCI_REG8(0x0346), 0x00 },
+	{ CCI_REG8(0x0347), 0x00 },
+	{ CCI_REG8(0x0348), 0x05 },
+	{ CCI_REG8(0x0349), 0x0d },
+	{ CCI_REG8(0x034a), 0x02 },
+	{ CCI_REG8(0x034b), 0xdd },
+	{ CCI_REG8(0x034c), 0x02 },
+	{ CCI_REG8(0x034d), 0x88 },
+	{ CCI_REG8(0x034e), 0x01 },
+	{ CCI_REG8(0x034f), 0x70 },
+	{ CCI_REG8(0x0383), 0x00 },
+	{ CCI_REG8(0x0387), 0x10 },
+	{ CCI_REG8(0x0390), 0x03 },
+	{ CCI_REG8(0x4800), 0xac },
+	{ CCI_REG8(0x0104), 0x01 },
+	{ CCI_REG8(0x0104), 0x00 },
+	{ CCI_REG8(0x4801), 0xae },
+	{ CCI_REG8(0x4b20), 0x9e },
+	{ CCI_REG8(0x0101), 0x03 },
+};
+
+/**
+ * struct hm1092_mode - sensor configuration, selected by the EXTCLK rate
+ * @mclk: EXTCLK rate the init sequence programs the PLL for
+ * @link_freq_index: index into hm1092_link_freq_menu
+ * @width: output width
+ * @height: output height
+ * @hts: horizontal total size, 0x0342/0x0343
+ * @vts: vertical total size, 0x0340/0x0341
+ * @exposure_def: exposure programmed by the init sequence
+ * @crop: readout window on the pixel array
+ * @regs: init sequence
+ * @num_regs: number of entries in @regs
+ */
 struct hm1092_mode {
+	unsigned long mclk;
+	unsigned int link_freq_index;
 	u32 width;
 	u32 height;
 	u32 hts;
 	u32 vts;
+	u32 exposure_def;
+	struct v4l2_rect crop;
+	const struct cci_reg_sequence *regs;
+	unsigned int num_regs;
 };
 
-static const struct hm1092_mode hm1092_mode_560x360 = {
-	.width = 560,
-	.height = 360,
-	.hts = 0x0650,
-	.vts = 0x02ee,
+static const struct hm1092_mode hm1092_modes[] = {
+	{
+		.mclk = 24000000,
+		.link_freq_index = 0,
+		.width = 560,
+		.height = 360,
+		.hts = 0x0650,
+		.vts = 0x02ee,
+		.exposure_def = 500,
+		.crop = {
+			.left = 48,
+			.top = 8,
+			.width = 1150,
+			.height = 718,
+		},
+		.regs = hm1092_560x360_regs,
+		.num_regs = ARRAY_SIZE(hm1092_560x360_regs),
+	}, {
+		.mclk = 19200000,
+		.link_freq_index = 1,
+		.width = 648,
+		.height = 368,
+		.hts = 0x0654,
+		.vts = 0x02e4,
+		.exposure_def = 360,
+		.crop = {
+			.left = 0,
+			.top = 0,
+			.width = 1294,
+			.height = 734,
+		},
+		.regs = hm1092_648x368_regs,
+		.num_regs = ARRAY_SIZE(hm1092_648x368_regs),
+	},
 };
 
 static const char * const hm1092_supply_names[] = {
@@ -309,7 +554,8 @@ static const char * const hm1092_test_pattern_menu[] = {
 };
 
 static const s64 hm1092_link_freq_menu[] = {
-	HM1092_LINK_FREQ,
+	HM1092_LINK_FREQ_180MHZ,
+	HM1092_LINK_FREQ_180P48MHZ,
 };
 
 struct hm1092 {
@@ -326,6 +572,7 @@ struct hm1092 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	const struct hm1092_mode *mode;
 	u8 mipi_lanes;
 };
 
@@ -398,7 +645,7 @@ static const struct v4l2_ctrl_ops hm1092_ctrl_ops = {
 static int hm1092_init_controls(struct hm1092 *hm1092)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &hm1092->ctrl_handler;
-	const struct hm1092_mode *mode = &hm1092_mode_560x360;
+	const struct hm1092_mode *mode = hm1092->mode;
 	struct v4l2_fwnode_device_properties props;
 	s64 hblank, pixel_rate;
 	int ret;
@@ -412,11 +659,12 @@ static int hm1092_init_controls(struct hm1092 *hm1092)
 	hm1092->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						   &hm1092_ctrl_ops,
 						   V4L2_CID_LINK_FREQ,
-						   0, 0,
+						   ARRAY_SIZE(hm1092_link_freq_menu) - 1,
+						   mode->link_freq_index,
 						   hm1092_link_freq_menu);
 
-	pixel_rate = div_u64(HM1092_LINK_FREQ * 2 * hm1092->mipi_lanes,
-			     HM1092_BITS_PER_SAMPLE);
+	pixel_rate = div_u64(hm1092_link_freq_menu[mode->link_freq_index] * 2 *
+			     hm1092->mipi_lanes, HM1092_BITS_PER_SAMPLE);
 	hm1092->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE, 0,
 					       pixel_rate, 1, pixel_rate);
@@ -438,7 +686,7 @@ static int hm1092_init_controls(struct hm1092 *hm1092)
 					     mode->vts -
 					     HM1092_EXPOSURE_MARGIN,
 					     HM1092_EXPOSURE_STEP,
-					     HM1092_EXPOSURE_DEFAULT);
+					     mode->exposure_def);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN,
@@ -480,10 +728,11 @@ err_free:
 	return ret;
 }
 
-static void hm1092_update_pad_format(struct v4l2_mbus_framefmt *fmt)
+static void hm1092_update_pad_format(const struct hm1092_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->width = hm1092_mode_560x360.width;
-	fmt->height = hm1092_mode_560x360.height;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
 	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
@@ -503,8 +752,8 @@ static int hm1092_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	ret = cci_multi_reg_write(hm1092->regmap, hm1092_init_regs,
-				  ARRAY_SIZE(hm1092_init_regs), NULL);
+	ret = cci_multi_reg_write(hm1092->regmap, hm1092->mode->regs,
+				  hm1092->mode->num_regs, NULL);
 	if (ret) {
 		dev_err(hm1092->dev, "failed to write init registers\n");
 		goto out;
@@ -556,16 +805,18 @@ static int hm1092_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
+	const struct hm1092_mode *mode = to_hm1092(sd)->mode;
+
 	if (fse->index)
 		return -EINVAL;
 
 	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
 		return -EINVAL;
 
-	fse->min_width = hm1092_mode_560x360.width;
-	fse->max_width = hm1092_mode_560x360.width;
-	fse->min_height = hm1092_mode_560x360.height;
-	fse->max_height = hm1092_mode_560x360.height;
+	fse->min_width = mode->width;
+	fse->max_width = mode->width;
+	fse->min_height = mode->height;
+	fse->max_height = mode->height;
 
 	return 0;
 }
@@ -576,10 +827,7 @@ static int hm1092_get_selection(struct v4l2_subdev *sd,
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r.left = HM1092_CROP_LEFT;
-		sel->r.top = HM1092_CROP_TOP;
-		sel->r.width = HM1092_CROP_WIDTH;
-		sel->r.height = HM1092_CROP_HEIGHT;
+		sel->r = to_hm1092(sd)->mode->crop;
 		return 0;
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -602,7 +850,8 @@ static int hm1092_get_selection(struct v4l2_subdev *sd,
 static int hm1092_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	hm1092_update_pad_format(v4l2_subdev_state_get_format(state, 0));
+	hm1092_update_pad_format(to_hm1092(sd)->mode,
+				 v4l2_subdev_state_get_format(state, 0));
 
 	return 0;
 }
@@ -663,6 +912,14 @@ static int hm1092_check_hwcfg(struct hm1092 *hm1092)
 	if (ret)
 		goto out;
 
+	if (!(link_freq_bitmap & BIT(hm1092->mode->link_freq_index))) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "link frequency %lld not available for a %lu Hz external clock\n",
+				    hm1092_link_freq_menu[hm1092->mode->link_freq_index],
+				    hm1092->mode->mclk);
+		goto out;
+	}
+
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
 		ret = dev_err_probe(dev, -EINVAL,
 				    "only 1 data lane is supported, got %u\n",
@@ -775,7 +1032,13 @@ static int hm1092_probe(struct i2c_client *client)
 				     "failed to get imaging clock\n");
 
 	freq = clk_get_rate(hm1092->img_clk);
-	if (freq != HM1092_MCLK)
+	for (unsigned int i = 0; i < ARRAY_SIZE(hm1092_modes); i++) {
+		if (hm1092_modes[i].mclk == freq) {
+			hm1092->mode = &hm1092_modes[i];
+			break;
+		}
+	}
+	if (!hm1092->mode)
 		return dev_err_probe(hm1092->dev, -EINVAL,
 				     "external clock %lu is not supported\n",
 				     freq);
@@ -841,6 +1104,12 @@ err_ctrls:
 static DEFINE_RUNTIME_DEV_PM_OPS(hm1092_pm_ops, hm1092_power_off,
 				 hm1092_power_on, NULL);
 
+static const struct acpi_device_id hm1092_acpi_ids[] = {
+	{ "HIMX1092" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, hm1092_acpi_ids);
+
 static const struct of_device_id hm1092_of_match[] = {
 	{ .compatible = "himax,hm1092" },
 	{ /* sentinel */ }
@@ -851,6 +1120,7 @@ static struct i2c_driver hm1092_i2c_driver = {
 	.driver = {
 		.name = "hm1092",
 		.pm = pm_ptr(&hm1092_pm_ops),
+		.acpi_match_table = hm1092_acpi_ids,
 		.of_match_table = hm1092_of_match,
 	},
 	.probe = hm1092_probe,
-- 
2.56.0

