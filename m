Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444788;
	b=O6ljRqnIbe9Uo+0nepbH1Rg8NPuvf4yTwmEsauopQQf3sGTvEJ8DLtEt6ut2I8VO5Uvo
	 yRwsAtO7o6/JfIALN2TKmPaXgzHS3yncn7WxQyzplRVMwJTgJBV9jtShWiACk1EK2zPyt
	 SHbNixpt2B1PLYKFjiM375JoZr3jz7wXSGHggU2djfwkxkbSv/WAm+dQObilQoLZqQ6c9
	 AKOZtZbh/nTGad5i8ntXkhpE09FNZ/dv5ZzaURdtglvRHaX+hbdENNczhHfMw8/JvjEHM
	 SQpP05ZQemVZgF2kRKlUjmU7cimjmMFE02He9PUNp3N5JMxYNYHAq19LvQmdua1iStA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444788;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=lhRbX6f6jgzKxjLjMytTeTGyzKrhtXwv4YYKKTJC7mQ=;
	b=R7WTVpUAYGuyriK085FnNdVZ+pZt9qWJ9F48KupcfgNSebmIu2G7oOcGuiw97no2QMUv
	 WG64UGBL0346kx6IfVM2CvrqMhU+qbqkYfQT+v12SH25wwJSs3UJHdMGFJ76aRFwqEk1k
	 J5tFjQzWKKuLfhLx2TvYaohQovRXknEENcQz8wAm+Tof7ux3sIsJ75AD9mZdi7R6T7jsW
	 LyDwBqdDK6mKIDHwu3a0uJOjPLAm0agHOyhtZosQFrIOezqKvXVwEn6+6kgAJpkrq2J5C
	 vn6eKu9OMBqGdYVRZCfN0aSzax30+og7tMSLVQ10bh/gugxBjnOcP6YwDJK4JWDycJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QDaAkGEG;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5E960A3811
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5E960A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QDaAkGEG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01DB41A1246
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA74E60582;
	Mon, 19 Oct 2026 21:19:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F351B10328C52;
	Mon, 19 Oct 2026 23:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444786; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lhRbX6f6jgzKxjLjMytTeTGyzKrhtXwv4YYKKTJC7mQ=;
	b=QDaAkGEGNPMUD/3uIwovgs/h+oWMbMicEJXIUyG/NwCx+aC0FgFjAM/2Js1QUrUc0y9kc9
	ryWdohFaXtqBneeF2JbG/2w5oNfiA1Wkgcdnu225ZVnAHhbVRJ+IoCWei8oy2UcGhCGYxO
	hYZPDxzEvkZDnkLF4zmA0d2bWO7X2gB4oTvwmyL2h3z5e3+WfuYlTg3QtNicM8Z/TKG8nr
	+R96bdFKfj0E2hcTGlplwpySM6z+3K56BRcFg4O00zy8EUWeJLjhEwNBiPE7eypWgjuH/J
	MXlI1EAuUoutpKTt1OMWNk0/kVqgjkJpVqqXMsyKlDbvHc4zH6JN+GXf6UhHmg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/19] rtc: abx80x: simplify locking
Date: Mon, 19 Oct 2026 23:18:20 +0200
Message-ID: <20261019211827.126262-19-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
References: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use the ops_lock that is used by the core to lock operations. This ensures
we will never get any ABBA deadlock.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-abx80x.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 718e6b8555f5..1c69d0e2f940 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -15,7 +15,6 @@
 #include <linux/i2c.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
@@ -138,7 +137,6 @@ struct abx80x_priv {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
 	struct watchdog_device wdog;
-	struct mutex lock;
 	int irq;
 };
 
@@ -249,8 +247,6 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[ABX8XX_REG_YR] = bin2bcd(tm->tm_year - 100);
 	buf[ABX8XX_REG_WD] = tm->tm_wday;
 
-	guard(mutex)(&priv->lock);
-
 	err = regmap_bulk_write(priv->regmap, ABX8XX_REG_HTH, buf,
 				sizeof(buf));
 	if (err < 0) {
@@ -274,7 +270,7 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	unsigned int status, status_flags_clear;
 	int err;
 
-	guard(mutex)(&priv->lock);
+	guard(rtc_ops)(rtc);
 
 	err = regmap_read(priv->regmap, ABX8XX_REG_STATUS, &status);
 	if (err < 0)
@@ -349,8 +345,6 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	alarm[4] = bin2bcd(t->time.tm_mday);
 	alarm[5] = bin2bcd(t->time.tm_mon + 1);
 
-	guard(mutex)(&priv->lock);
-
 	err = regmap_bulk_write(priv->regmap, ABX8XX_REG_AHTH,
 				alarm, sizeof(alarm));
 	if (err < 0) {
@@ -391,7 +385,7 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 		flags |= (ABX8XX_OSC_ACAL_1024 | ABX8XX_OSC_ACAL_512);
 	}
 
-	guard(mutex)(&priv->lock);
+	guard(rtc_ops)(priv->rtc);
 
 	/* Unlock write access to Oscillator Control Register */
 	if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_OSC) < 0)
@@ -473,7 +467,7 @@ static ssize_t oscillator_store(struct device *dev,
 		return -EINVAL;
 	}
 
-	guard(mutex)(&priv->lock);
+	guard(rtc_ops)(priv->rtc);
 
 	/* Unlock write access on Oscillator Control register */
 	if (abx80x_write_config_key(dev->parent, ABX8XX_CFG_KEY_OSC) < 0)
@@ -523,8 +517,6 @@ static int abx80x_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
 	int err;
 
-	guard(mutex)(&priv->lock);
-
 	if (enabled)
 		err = regmap_write(priv->regmap, ABX8XX_REG_IRQ,
 				   ABX8XX_IRQ_IM_1_4 | ABX8XX_IRQ_AIE);
@@ -551,10 +543,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		return put_user(tmp, (unsigned int __user *)arg);
 
 	case RTC_VL_CLR:
-		scoped_guard(mutex, &priv->lock) {
-			err = regmap_update_bits(priv->regmap, ABX8XX_REG_STATUS,
-						 ABX8XX_STATUS_BLF, 0);
-		}
+		err = regmap_update_bits(priv->regmap, ABX8XX_REG_STATUS,
+					 ABX8XX_STATUS_BLF, 0);
 
 		return err;
 
@@ -623,7 +613,7 @@ static int __abx80x_wdog_set_timeout(struct watchdog_device *wdog,
 	struct abx80x_priv *priv = watchdog_get_drvdata(wdog);
 	u8 val = ABX8XX_WDT_WDS | timeout_bits(timeout);
 
-	guard(mutex)(&priv->lock);
+	guard(rtc_ops)(priv->rtc);
 
 	/*
 	 * Writing any timeout to the WDT register resets the watchdog timer.
@@ -710,7 +700,7 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
 		len = min(lower + bytes, (size_t)ABX8XX_SRAM_WIN_SIZE) - lower;
 		len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
 
-		guard(mutex)(&priv->lock);
+		guard(rtc_ops)(priv->rtc);
 
 		ret = regmap_update_bits(priv->regmap, ABX8XX_REG_EXTRAM,
 					 ABX8XX_EXTRAM_XADS, upper);
@@ -806,9 +796,6 @@ static int abx80x_probe(struct device *dev, struct regmap *regmap, int irq,
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->irq = irq;
 	priv->regmap = regmap;
-	err = devm_mutex_init(dev, &priv->lock);
-	if (err)
-		return err;
 
 	dev_set_drvdata(dev, priv);
 
-- 
2.56.0

