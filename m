Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732727;
	b=tHdXLHYWB7lqbK809LyJjfqADkHy4+Q0lUXx3UWoBCJMyuP0uVZ+JKMYxCpHNhbKsIAW
	 b4tQk1KNjondlq17ki8jzU3xDZBQzbQQysCrF4W9q4ztzgPttlhhlqwPqGA48L+IejP4N
	 O7mzxnjV8a8+QkMrW12VEzMPFmbBnOkNf8FWMY6oKIQ5IxGJyBouAQ2d80Zt3SGzeAac5
	 u9H249LzG48MfVxpNwQOPG/GqQoROMdJSj8zD87e4xC0l1ceVKb8WEGg+8UMeUnzenNgw
	 BeXgU85X5qK2dXmfJOfVGTmvWS5O4JQI6twU/ULuyE4kLKUKsLwN6VaIMdETCsOvDRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cVjBt24AZadG8lfyxs4mRXI5N5Rh1ABfAQ7ljq9C298=;
	b=oA2DfDDqzN+DmQ+OBLInijPQQRJnLsYl4Hf/i3Xw0B+d1Q7cOcCU1S2iuZMb9Dm96ZJZ
	 uJfYWSgSEKwlDov5sb0L5egxjv5DYyN+W8t/8nrK/UKSc0mvX/YWMTlWwmiKI1WyiUebu
	 SSxabUzmSTrQNuZin5ACyVyYUIoeZESmT3bne4aZtgWKprxW1dBDQggbV5xS0WVPhY/H9
	 6TCWIjKJrmYTMrTKj6gu1VtAqAdIAVuStgLgRLOpGgeTjgu07FzE9o25OzlSSh2lA83pG
	 5J7w+M6b33k2Q3NpxJvpqoNGcs9zPpp81P8kXvFRxqPvwj8v/MmjP0xt2yaSaaDelPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5CnSrK5;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F30606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5CnSrK5
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3725452a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732725; x=1795337525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVjBt24AZadG8lfyxs4mRXI5N5Rh1ABfAQ7ljq9C298=;
        b=N5CnSrK5PjiERs3XjuKDct+r3kV34T7huuhONym/1t3LnJYualzj+8qkB9FrYdMblM
         P6baO2JIy7weNaQydD95hE5qUYCRTOukJsL4oayCT3+b/qkM7ASLzNAsewK/S7deP9Cp
         r3sXX+4hrNNOXxvkxQPYgEBVa96ti22mNqKXdHm7+Ia2DrlGbCyxtwVlkzoKAmVFKtze
         f/l9qSpNSwOYTkUavOSit24BwqzL3DwlnzavyoYeCC5UpHVV/gYYbOp4Hq/pAEwuFtc+
         YF0FMewXCAHh5MAzS1pjq16Bxm+KjC1oGRbnUcLFAoD/iU0vqHNOD8+vb8OzMIX4QPLi
         3B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732725; x=1795337525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVjBt24AZadG8lfyxs4mRXI5N5Rh1ABfAQ7ljq9C298=;
        b=V8Ycb5ZCd8MTi3lybJhlDPG745+/El5DMjEUOQCfMvv/4NgoAdDiMH1yv6UfRwkgz3
         v3HwTfji1RzFzwWZ95uNRCHdPGFFVdL13Nhv0PB1DYgj8HNuDlKnG2B0Gwep5XLbUktA
         hzEGVCq1zNO8Qcb4Kx9TgolHt88DO207p/aYTFWiYkzSWH32NwNo/WCOuxVnrfp1Su/d
         z5zoCD6R2SGy8R0tWMCAGXcJrHgquWbYUQxHE3q9bWMxtIg7wMjt0uVOrRj0VMOFb3Ur
         BlDzHd0pqviiSf1Iny6GZegOH7rIpx6Q0lU7S4r5TJ3tXKPggzW9X0tbS59tV6iC2XoC
         2INQ==
X-Forwarded-Encrypted: i=1; AL+hErFJqdvhyTg/YyFEYokXoNoyTSmmghGluusPiEHe8u2menVm0phrR78eQzgVuHiXBFHriLd+s+zNIudBLMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//hAV356hbANucBDto+zN/euDjRyVWrHBCGu2ImTjkrDZXxE7v
	MmPzsfusZvCjQI5l8/OpLIb+Deg+YCwe9T/hEI4ANrnM6ePs+ltjU2HS
X-Gm-Gg: AYBFou2spCo5IWLTfs9mF2lt5skm3XAnZTMxcT/RC9zHULk1E7Ql1SgZRihFMtvQngt
	xwSX0cH3HgxIxZIGVWdWG1RckzlHQk7MDUN3QWaMITCntbXfo8p7hYA1pZ7cjk/iF3zAeaboYve
	ptGu90ZFCyAa3ZiNTaUGP4XwoCcsaFEXnLv0JW/Swr64e33dM4Ach09lqDUT5xzk3oX2z2PG4CO
	DyA8R5FQJCGwXp3dWZTu6LpLeHGI0liQfI35tc6/0NDmHC6sEGd4s9hcZthBe1mUK80f+zy/bFj
	y45H5K0V5Xcehi2B/pEwuMsL766ZOBptZRFYvg+iHk1D+ADJISYhF2+Yfwp4M3xfegWRVtCP27L
	d99zdElifjY5PM1Xk7KK81nkj1cg5686der0RvUAPuGGEIVKRh2JAG0dqVZsNDPH400KKcsaqZM
	tzADBhR44MJW7A+p0Y/DomWlE7VI9rKVL1S5V360npWFqCuOFz4Hxu8pFd0xykaCFfKdQpFjIwg
	Lb9bp4agraAJ/OWyCxHRwyBlCT4pYF5UNd5jRcpUbXD372kih9Q9tME8+riEUJl+xQ5K9uYpPH3
	oZ6rvr8x+zyKxe5acIauo9hq7vOHf2m8NhGSK6eY/+X7INBSMi3RC8au9RT//CKeQXgv046XETA
	8z0H/TV8nWA==
X-Received: by 2002:a05:6402:42c7:b0:6b7:eda4:e136 with SMTP id 4fb4d7f45d1cf-6b7eda4e281mr1999786a12.41.1794732725246;
        Sun, 15 Nov 2026 00:52:05 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c672asm3090610a12.15.2026.11.15.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:52:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] video: leds: backlight: lm3533: Support getting LED sources from DT
Date: Sun, 15 Nov 2026 10:51:55 +0200
Message-ID: <20261115085155.80043-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
This was part of the original LM3533 controller DT/OF conversion patchset,
but it appears to have been accidentally separated during the final iteration.
Therefore, I am sending it as a follow-up.

Changes in v2:
- leds: switch to macros in regmap_update_bits() calls to apply 0xff mask
  since regmap writes may cause unwanted writing.

Changes in v3:
- leds part moved into a separate patchset
- switched to dev_err_probe()
- for loop moved out of if condition
---
 drivers/video/backlight/lm3533_bl.c | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index fd6e7f4f1f61c..cb9df6ff73001 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -21,6 +22,7 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 #define   CTRLBANK_AB_BCONF_ALS(n)	BIT(2 * (n))
 #define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
@@ -35,6 +37,9 @@ struct lm3533_bl {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 led_strings[LM3533_HVCTRLBANK_COUNT];
+
 	bool have_als;
 	bool linear;
 };
@@ -236,6 +241,8 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
 	int ret;
 
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
@@ -243,6 +250,21 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
 	if (ret)
 		return ret;
 
+	for (int i = 0; i < bl->num_leds; i++) {
+		if (bl->led_strings[i] >= LM3533_HVCTRLBANK_COUNT)
+			continue;
+
+		output_cfg_val |= ctrlbank << bl->led_strings[i];
+		output_cfg_mask |= BIT(bl->led_strings[i]);
+	}
+
+	if (bl->num_leds) {
+		ret = regmap_update_bits(bl->regmap, LM3533_REG_OUTPUT_CONF1,
+					 output_cfg_mask, output_cfg_val);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -320,6 +342,28 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default HVLED or is not linked to any HVLED at all.
+	 */
+	bl->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+	if (bl->num_leds > LM3533_HVCTRLBANK_COUNT)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "num of LED sources %d exceeds max %d\n",
+				     bl->num_leds, LM3533_HVCTRLBANK_COUNT);
+
+	if (bl->num_leds < 0)
+		bl->num_leds = 0;
+
+	if (bl->num_leds > 0) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     bl->led_strings,
+						     bl->num_leds);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to get led-sources\n");
+	}
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		return ret;
-- 
2.53.0

