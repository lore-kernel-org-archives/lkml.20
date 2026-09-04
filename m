Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C144AB9B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518888; cv=none; b=cO8KIfJxEvj5pIpA5x9cGV/jBwVXGgqOyX8oNl3pZ9G8vCAuWB93V1J6Iy4w358CIv5YhiKxcqb0HjpbvFuqys5tNjTmylfd8xaAPokE/7RsJr0G/Yh84bpScUV29H3+++Pim/2HS2xO82QcGvfLrBkYiwYwFbirpc01cr5I8qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518888; c=relaxed/simple;
	bh=8Pwg7mAyZQOld8TWfdbWMimIhOeca8eZ59WqtIuVCEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OtLjMYhfbAdjgadaPzpNDKIahykTG0kD0SAILiRuUXEK7yPnwz2JKE52JtuN3UMJS6qW5to+qbFscgpZZWIaxiTUqr4ledH8l2MEmQL7FUwn5eGr60cIbEGONEYFwyhtEiFsR7NvJ9QSYSuxz6Yv56MjHDzPV++JWrjrUPqPVUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKk3/YyB; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKk3/YyB"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1afdf98dfso525006eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518885; x=1789123685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2A0zeO3ugV0JUUNHg2Amdc4tuaijpGdF0pZT16CH0g=;
        b=YKk3/YyBdVcfdC1Rwy3GkOTpp/UmfGDckmpxeLBFkzzSopXSMZyq1+Co62F1Ss+23e
         XiA0uWpspcEQhzt2T7zkM1fEpFny64xhPBflThHOiRYL9SbfNy5Xx3ZRnKsyDk1O1WYd
         8k4Tw2h0gPs3BKN8nJqgQ9FJwt5Cpr40WkQJSQkaDJIogunbfCxXpLEFQLXHCgGjfwlK
         KeqwNWXZi/56MzZx/TUxY7ZGQhN3NuzOg2etY62ZevTFUDEZImN+3LACOfqF2/w2phPH
         Q5yORmsDRkkzRo/8fIghPEVwAi0xJNAqa3NThtd9hrAFvALKCPvtcii7O8Mtlwx9h89u
         b9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518885; x=1789123685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2A0zeO3ugV0JUUNHg2Amdc4tuaijpGdF0pZT16CH0g=;
        b=AbV0LkK59huXRE9EiB/XK8E06R6lV6VljZyVRIcZiQTMny8TT2bjhepzSUxmYHJCHl
         cZkNKzgR8P5piveB+fAww6lhZy3jf43sKmyMPZLej15OSo1qXTAQwDHtZY3eUi83S8Zk
         Yweg7kSkLMKn6TK7Qm5Rez5LGeirxzAWNJECkeNl7T9bSsJwZlgA1tNs22fKndzz5IbG
         gVuG4KWtlS2vs5uJ4rQGivNIn6T6vO2LzicFhZ8+fnMO000kF6Zm9pEW/3+FbM0e5UIr
         /2pRsZfxp34HEcUGJ1DwBFmCHnHidVw0ybZicgAYfKfdzaygGRURQlyuAXZCEWto/Hzx
         7TEQ==
X-Gm-Message-State: AFuF++nlUeE/d+0d4qtPYqR2ewEUm0xhCyB0g4qf0Pdya24XSncuEnUw
	SRLiXTxa5CWdKFD9wMXbNAAIjfD7JZh1tOS63SniSa6lure7dDcXcwvH
X-Gm-Gg: AYBFou3xEMkHsypKsDoOA8+ZUXgw4aG97nyvvh09fXytEzb4DeXbrHifPew7SYMaxUv
	wxG5nSPDSUaE/k5EoZcV1V1NCIEWVj7sUcsf+7zjo6Qcqk9Ny7irvSY+cf7jZdhla5aoizIS+LF
	vnjQkmsvDTtivXfb8y2kg9nvMS9zedJODhgaVMGvXEiIkpd0a/l/6NhJKrY5pOJ1xi98r/BT9Ht
	Vcn/iEuhSEdEU3u2mZJ9jfjlfXIeOw+5kphmnUZsRTZcRPZdKD3wofE0fBYnC0Atwo1KY2+Alwz
	64soOyvivKdiIginpItV6Vx0Svl4FWK8IEfq2I180iL64HvV888LA8tTiRiXO9MKG3Cjjx1+EKJ
	Od3KPhiax4iYV4K3VbuRQDQQxAkOOHzZW+hQmLJ+VQJalL4ZL1KkfEjHm7sok4un8s44IE2o5Ml
	Cjh7NOGXYw2PFqUKsfXt8WkspC2Vm9jyAteE12QFHHyXlE38W2fxGHw0oRDlXVK99BFzbbguutW
	1oWa74L8aaWeTM=
X-Received: by 2002:a05:6820:809:b0:6b7:83c5:fde9 with SMTP id 006d021491bc7-6b783c6033amr1231122eaf.42.1788518885125;
        Fri, 04 Sep 2026 03:48:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm5858825c88.11.2026.09.04.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:48:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Joshua Kinard <linux@kumba.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] rtc: fix typos in comments
Date: Fri,  4 Sep 2026 16:17:54 +0530
Message-ID: <20260904104758.23905-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/rtc/rtc-ds1685.c   | 6 +++---
 drivers/rtc/rtc-meson.c    | 2 +-
 drivers/rtc/rtc-pcf8583.c  | 2 +-
 drivers/rtc/rtc-rk808.c    | 2 +-
 drivers/rtc/rtc-sa1100.c   | 2 +-
 drivers/rtc/rtc-spear.c    | 2 +-
 include/linux/rtc/ds1685.h | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 5fc8e36b1abf..beb987b76f24 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1231,7 +1231,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "Main battery is exhausted! RTC may be invalid!\n");
 
-	/* Check the auxillary battery.  It is optional. */
+	/* Check the auxiliary battery.  It is optional. */
 	if (!(rtc->read(rtc, RTC_EXT_CTRL_4A) & RTC_CTRL_4A_VRT2))
 		dev_warn(&pdev->dev,
 			 "Aux battery is exhausted or not available.\n");
@@ -1395,7 +1395,7 @@ ds1685_rtc_poweroff(struct platform_device *pdev)
 		rtc->write(rtc, RTC_CTRL_A, ctrla);
 
 		/*
-		 * Read Control 4A and check the status of the auxillary
+		 * Read Control 4A and check the status of the auxiliary
 		 * battery.  This must be present and working (VRT2 = 1)
 		 * for wakeup and kickstart functionality to be useful.
 		 */
@@ -1407,7 +1407,7 @@ ds1685_rtc_poweroff(struct platform_device *pdev)
 			rtc->write(rtc, RTC_EXT_CTRL_4A, ctrl4a);
 
 			/*
-			 * The auxillary battery is present and working.
+			 * The auxiliary battery is present and working.
 			 * Enable extended functions (ABE=1), enable
 			 * wake-up (WIE=1), and enable kickstart (KSE=1)
 			 * in Control 4B.
diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 21eceb9e2e13..44bcc0678dee 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * RTC driver for the interal RTC block in the Amlogic Meson6, Meson8,
+ * RTC driver for the internal RTC block in the Amlogic Meson6, Meson8,
  * Meson8b and Meson8m2 SoCs.
  *
  * The RTC is split in to two parts, the AHB front end and a simple serial
diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index df5e20cbc26c..d0ebf4fd227b 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -7,7 +7,7 @@
  *
  *  Driver for PCF8583 RTC & RAM chip
  *
- *  Converted to the generic RTC susbsystem by G. Liakhovetski (2006)
+ *  Converted to the generic RTC subsystem by G. Liakhovetski (2006)
  */
 #include <linux/module.h>
 #include <linux/i2c.h>
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index 59b8e9a30fe6..718f19b5911f 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -295,7 +295,7 @@ static int rk808_rtc_alarm_irq_enable(struct device *dev,
 
 /*
  * We will just handle setting the frequency and make use the framework for
- * reading the periodic interupts.
+ * reading the periodic interrupts.
  *
  * @freq: Current periodic IRQ freq:
  * bit 0: every second
diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 26b2f4184ecc..144bb6fd8f6b 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -228,7 +228,7 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 	 * initialization is unknown and could in principle happen during
 	 * normal processing.
 	 *
-	 * Notice that clearing bit 1 and 0 is accomplished by writting ONES to
+	 * Notice that clearing bit 1 and 0 is accomplished by writing ONES to
 	 * the corresponding bits in RTSR. */
 	writel_relaxed(RTSR_AL | RTSR_HZ, info->rtsr);
 
diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 959acff8faff..74d4aa96826a 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -43,7 +43,7 @@
 #define YEARS_UNITS		(0xf<<16)	/* years units position */
 #define YEARS_TENS		(0xf<<20)	/* years tens position */
 #define YEARS_HUNDREDS		(0xf<<24)	/* years hundereds position */
-#define YEARS_MILLENIUMS	(0xf<<28)	/* years millenium position */
+#define YEARS_MILLENIUMS	(0xf<<28)	/* years millennium position */
 
 /* MASK SHIFT TIME_REG & ALARM_TIME_REG*/
 #define SECOND_SHIFT		0x00		/* seconds units */
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 8ec0ebfaef04..55d3edc7e972 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -200,7 +200,7 @@ struct ds1685_rtc_platform_data {
  * access to the extended NV-SRAM by automatically incrementing the address
  * register when they are read from or written to.
  */
-#define RTC_CTRL_4A_VRT2	BIT(7)	/* Auxillary Battery Status */
+#define RTC_CTRL_4A_VRT2	BIT(7)	/* Auxiliary Battery Status */
 #define RTC_CTRL_4A_INCR	BIT(6)	/* Increment-in-Progress Status */
 #define RTC_CTRL_4A_PAB		BIT(3)	/* Power-Active Bar Control */
 #define RTC_CTRL_4A_RF		BIT(2)	/* RAM-Clear Flag */
@@ -215,7 +215,7 @@ struct ds1685_rtc_platform_data {
 /*
  * Bit names in Extended Control Register 4B.
  */
-#define RTC_CTRL_4B_ABE		BIT(7)	/* Auxillary Battery Enable */
+#define RTC_CTRL_4B_ABE		BIT(7)	/* Auxiliary Battery Enable */
 #define RTC_CTRL_4B_E32K	BIT(6)	/* Enable 32.768Hz on SQW Pin */
 #define RTC_CTRL_4B_CS		BIT(5)	/* Crystal Select */
 #define RTC_CTRL_4B_RCE		BIT(4)	/* RAM Clear-Enable */
-- 
2.48.1

