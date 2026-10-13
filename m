Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9D747F3B1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862134; cv=none; b=ZCn6+oydNXDgfrzJFeo40YuZuxhodzFm8TlRaNDGbwq2VJGFMeygYM7O6J7TXqNXB1jSy9TOjbUnw4WjyMvel1Q6zJ/kq0+i4sB4uFV/4SBAwB2xAcuFOyA+tIQyj8FD39qg/s7NCn6JaZ/HYAORJ1gM6CmF0RHhxbZJGIMDONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862134; c=relaxed/simple;
	bh=qJhgGxXRGMJNICdKYmXRTfkXBuoWN57m2gDIoIuL12k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+DnNPXVrukV24UUW3iCZU3XyK7j4ms2jsMHTdHAUAHfIH8fwvJ6HObZzwOjszCz+XIdkivTOb0uvHrsDB58mjlDeBvl2QIgLc3u5aKnVIX2+ShhAzC8enm+Fz8YvpRMK0+HFbP+1thFUvevtMxLmi7d2kNdZ2cj1+FmhMMASVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeT7hi/Z; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeT7hi/Z"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1780824eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862126; x=1792466926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lvu+jb2QB6yKJjAkEFuYbvKnYhCB/5Vq3ySVvvwnsqw=;
        b=GeT7hi/ZIBBy8nB6cU3wGKxnKRAwUEDqI7PG/ztWKYl7DaXHdvVwplWjqoQDjRo/+F
         Wu/M4lCUN6fNwPq9VzM+VPJ8WZsFycv2NaJMXKedinRaspo+gIoIB7JxPstH0lV68COK
         70FMG4ipqWvLcZXMsWSkAXMEhpgo7agDQE7R4Nlz9cn6GzDq4+VSJt95Xb8eIN6vo/BK
         AzVWT/t02l2xdgp5Jmu+PZaMxT2vJvovnoQCE+TXRaV16t+cMMdvDJ7u/p+xXdgbCuGH
         BG1FMhHbzwQV9SJpXtwhnkLRmApaIXnLRbGocYyPHxSPKxUyJbfT+NA0BOE9ZUv4JoAa
         o1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862126; x=1792466926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lvu+jb2QB6yKJjAkEFuYbvKnYhCB/5Vq3ySVvvwnsqw=;
        b=pyNUNBECiGv+FXisblLNKFVMkqmF5mPevPWV5bvwGyx9AOYTckhRgzP/D6OfyAuynB
         CqYM/8QBzQqMnuyjMA8JmXu9MX0aWFFpxysEqXQgO+kFmvXxcm1pBns9Z3zY5PuqO6E2
         9qY5wfzU/DNKkOvBJxOcKsiIzYuAHnRM1xiJ5ALwfCDic4RtGAxIy+9dCa4nKzco8Hnf
         uNMXEPlLhOtuA+HVfSW1Mlkdh5er+RsE0vM9Utre2H6BMWCegscOYa1BjlSiFl8jK7sL
         FjHJJskExVv9eM9kHMy+zBttcd8bFCnj7mrdecmUtMgk0q+sctKEyPuz0B82lrE761cF
         CrnA==
X-Forwarded-Encrypted: i=1; AKwUvBzDxeRmdum7z9p+B0RuvRslB6iMBao6Z46Poi5CpQaiz4tSPR4en+6j1JjCqWA22AtBc+rcgx/G4u1rAVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIax2a56qHznS4dXifFzDvFg4nvkwoumbmHWUniFHh+te3sszWY
	tN3neSq1sQw8ewUlY+kZGjLhDRPfJAAIZ0k+nAvFkDew4wufFXdeFJBV
X-Gm-Gg: AYBFou0xuQNCZVDTM5PvIVpWkds9GZrsZdIQLQmCVK3cFl9B/21MSlktlpWYRtsz7yl
	9DXA0Ku4OZgFleTicvGHIkUaWSbZycryBrmfKVKbFn2qkd4gQ1S1E8aXhnAFZT8GxPOmujQSaHa
	EJVzyJMpblZiZkQB/RHdBt198QU7znI1N6pMOxLXVRv0NQhnhaTs9bw/CixcsWG8Ita2rjA5rIz
	7I8zPrZ88TfK/d4mVBUmaCu1+8AfDf7RlXDfuO2Blm+MwIJB2l8cMEFme0K/nGZF8kk4G+enqen
	uhRZUfyHAI7FtKf4iM7v/TPq+dZvorKOtBcIBpVpmS/Z8EvMyqivzOwYyyWqaJFB11oQoGbWj2q
	zgsKmfujqSyG0za6nW9BULIttrB3KX7weqliKH2+DQar4clThx8wEuzTN/Wmfx9ljYPQ323Pl7v
	FA+tgMCrILFohP4mGdJw5+7XdfgsfDrVYwvZux3jwpYEeZQ82h79JJ9jgUbtRcM4/8ME/P35plE
	dz0AnZxIAeXVeRIj+HTn6MvdLi+kZpP2PEXfEJF8T6dGg==
X-Received: by 2002:a05:7300:102:b0:35c:8242:9e59 with SMTP id 5a478bee46e88-35c8242a77amr1010374eec.14.1791862125390;
        Mon, 12 Oct 2026 20:28:45 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:8900:441a:ba51:e5f4:3ca4:4b87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm43617106eec.18.2026.10.12.20.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:28:45 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Tue, 13 Oct 2026 08:58:25 +0530
Subject: [PATCH v7 3/3] media: i2c: hm1092: Add ACPI enumeration and the
 19.2 MHz configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
In-Reply-To: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2

From: Jake Steinman <j@metarealtyinc.ca>

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

Tested on a Dell XPS 16 DA16260 (Panther Lake, IPU7, 19.2 MHz clock
from INT3472): the sensor binds on CSI-2 port 2, streams 648x368 at
link frequency 180480000 and the exposure control changes the image
level. The 24 MHz configuration is compile-tested only.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
Tested-by: Eduard Kulyk <kulikeduard89@gmail.com> # Dell Latitude 7350 (IPU6)
Link: https://lore.kernel.org/r/b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca
[rshouriesh: drop the <linux/mod_devicetable.h> include, <linux/i2c.h>
 already provides struct acpi_device_id]
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 drivers/media/i2c/hm1092.c | 362 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 316 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
index 0ae30fb6b78f..c7b148076e94 100644
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
@@ -43,16 +47,14 @@
  * Digital gain is a 10-bit value in 2.8 fixed point (0x100 is unity) split
  * across 0x020e/0x020f; bits above bit 9 are ignored by the sensor.
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
@@ -74,9 +76,9 @@
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
@@ -84,12 +86,8 @@
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
@@ -277,18 +275,265 @@ static const struct cci_reg_sequence hm1092_init_regs[] = {
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
@@ -311,7 +556,8 @@ static const char * const hm1092_test_pattern_menu[] = {
 };
 
 static const s64 hm1092_link_freq_menu[] = {
-	HM1092_LINK_FREQ,
+	HM1092_LINK_FREQ_180MHZ,
+	HM1092_LINK_FREQ_180P48MHZ,
 };
 
 struct hm1092 {
@@ -328,6 +574,7 @@ struct hm1092 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	const struct hm1092_mode *mode;
 	u8 mipi_lanes;
 };
 
@@ -403,7 +650,7 @@ static const struct v4l2_ctrl_ops hm1092_ctrl_ops = {
 static int hm1092_init_controls(struct hm1092 *hm1092)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &hm1092->ctrl_handler;
-	const struct hm1092_mode *mode = &hm1092_mode_560x360;
+	const struct hm1092_mode *mode = hm1092->mode;
 	struct v4l2_fwnode_device_properties props;
 	s64 hblank, pixel_rate;
 	int ret;
@@ -417,11 +664,12 @@ static int hm1092_init_controls(struct hm1092 *hm1092)
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
@@ -443,7 +691,7 @@ static int hm1092_init_controls(struct hm1092 *hm1092)
 					     mode->vts -
 					     HM1092_EXPOSURE_MARGIN,
 					     HM1092_EXPOSURE_STEP,
-					     HM1092_EXPOSURE_DEFAULT);
+					     mode->exposure_def);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN,
@@ -485,10 +733,11 @@ static int hm1092_init_controls(struct hm1092 *hm1092)
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
@@ -508,8 +757,8 @@ static int hm1092_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	ret = cci_multi_reg_write(hm1092->regmap, hm1092_init_regs,
-				  ARRAY_SIZE(hm1092_init_regs), NULL);
+	ret = cci_multi_reg_write(hm1092->regmap, hm1092->mode->regs,
+				  hm1092->mode->num_regs, NULL);
 	if (ret) {
 		dev_err(hm1092->dev, "failed to write init registers\n");
 		goto out;
@@ -561,16 +810,18 @@ static int hm1092_enum_frame_size(struct v4l2_subdev *sd,
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
@@ -582,10 +833,7 @@ static int hm1092_get_selection(struct v4l2_subdev *sd,
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
@@ -608,7 +856,8 @@ static int hm1092_get_selection(struct v4l2_subdev *sd,
 static int hm1092_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	hm1092_update_pad_format(v4l2_subdev_state_get_format(state, 0));
+	hm1092_update_pad_format(to_hm1092(sd)->mode,
+				 v4l2_subdev_state_get_format(state, 0));
 
 	return 0;
 }
@@ -668,6 +917,14 @@ static int hm1092_check_hwcfg(struct hm1092 *hm1092)
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
@@ -780,7 +1037,13 @@ static int hm1092_probe(struct i2c_client *client)
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
@@ -846,6 +1109,12 @@ static int hm1092_probe(struct i2c_client *client)
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
@@ -856,6 +1125,7 @@ static struct i2c_driver hm1092_i2c_driver = {
 	.driver = {
 		.name = "hm1092",
 		.pm = pm_ptr(&hm1092_pm_ops),
+		.acpi_match_table = hm1092_acpi_ids,
 		.of_match_table = hm1092_of_match,
 	},
 	.probe = hm1092_probe,

-- 
2.55.0

