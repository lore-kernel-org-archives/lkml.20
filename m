Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3C2931D5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592042; cv=none; b=DGatUoZhMGmsl6yUSr8K1aa0WZH2/KgQqRGilxOKQVwFOBjy3+GT22kgvuXZM/BU5gE2hew08FXG1ZypLxUvU958qmUlOQID7VDY+u3UBieUXdWkxASfeEJEpA5MjEa97xZqnEuI3IiB3Ic1aTwL70BYEN38iNmmMRDKpszQHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592042; c=relaxed/simple;
	bh=mIOAFf4/mkVnKyy9Pr2ub9EN7il/hC4uxGNZV5cUVr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jjy5jd0PUH09EuYcdAEgP/cCPaQz6M4TnGT2jE6Bw8fOWdWlSB/KWLHZlTUHJfq0faKhePmYQ6YorA7LXv5nRoKjCsECAcH3TD0TUK+wrYoOswkaoA9mITX8gEMoM0j4FiFnbQNHZhp2mR5ZIlUAEkWS/i/zxGMKU7FVSBpIYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3h0h6Lc; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3h0h6Lc"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-482f6351832so100130f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592012; x=1790196812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dxoel9GdpZ6JK+POFcZ8n3vlkVi/jnVPwLg6Nkmyd+g=;
        b=H3h0h6Lc63jiNBevHaISkPTVX92bnMBJSyRn13yOkBXkzVtU0FEqUI8m3G7g/4MG5/
         NUvHvqexcjibBKse6wWRZym4JCqo+B2JY5b2/PLbpMZG21I5EpHKuo76Fa7X/qCqESZ6
         dcILIt3xZN4xvHwRfMR8mPfVd/sCKf3QyI8GIUhLKF04mNu6nhh1ohERBvgehKzXc9ot
         zt6da4JNvH0oH4vU4liqHwYetvSSs0h9Ss2bFH9WPKS3mV9fbYJ+CW8Pa26qsQu3XTt8
         pgeGC+10/VVJLZ1GIXsepy40zFdPtWB9wr6RPeN/tziraiRRvU7OpUZKf3OS+Uijy/ni
         fZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592012; x=1790196812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dxoel9GdpZ6JK+POFcZ8n3vlkVi/jnVPwLg6Nkmyd+g=;
        b=sHQy0QDHEs48Yg2HufRnuLeMdlkPgiBoSD4DsTp881p53vAxVWLpvf9jlo13I7Lhq0
         ZOSNHLJDGWahfHJjqu776OA30JxBGlePUcZdhaJmN/0o2bU7eftDK/7LEnHHEdh5D+Fg
         1XBSPpiu+9/ab+SvoOscZMvon9Q3whpnGOQiKZKjmtVqcPlVWgLU7N0vf9QEs1+MdBBv
         6nrQcx7bHEaDCS1yDBp0qw7RYuKpT33cOMsn8BixvNycJJJozoSHDEi/JIjjyeU8UUWm
         n7lzp1ciF0UWJYrF/M89vzwzcCeqcJE+2xZ8Sce8+tTEjsBwkCCSMR7wK8JnYBN2FZ1+
         ZUYw==
X-Forwarded-Encrypted: i=1; AKwUvBw0m23iHVdgzsIhmBK98Jw/xLzFT38ZlrXuQiFntwkfYFXRyCrFdj0arC215HvqjdLkUwYfeeeY5VljSHk=@vger.kernel.org
X-Gm-Message-State: AFuF++mnxr60y8LcIjUMcnw8/AxQUGPETYYCxy3jR+30i5T9Q5oBJD46
	YX0yPXtWu9agd6DsoIbQZqQ6KqFV2kDwkC7Aj5MHqUESIT8lY3321qrs
X-Gm-Gg: AYBFou1iJwrD8v3JF0dt3+DjP5k8LpjcuPZB9KT40UGtx4HWH1UwJkgxtDhOjDKJ2SK
	SrFZxiRpM/EktSdkwcd5pITKO3jpgHNgEedIdNFcdSAz5KujwVqVThKynlg0RYPyDpQzykezk6W
	LjdRWojA6fU4AHRittR3PsbwXfV1LVI5oTfg5iRTTtBmvtfVhrbdMsRMZZ6Moih/AYbFjdj9klb
	ndqveAZtjJUZN9napEklMQYzEBGNehHDiheJV7lz36PNc+xUDxxm46TcilA5j8JQMpnxf4wZDDy
	U0rJygF7lq2zYdMNXQv31yilKjjiUWF5et0OGRo8C4cp0jyl+g8wvvmCjc4/AGmetm+BbC5pWg6
	DOqCEfqjxVexXSfelPMPk7mIeX4IG5dADpZ64jHV8pIlvPxV+SZauL4BUDexfXuoIsS9lE2g7l+
	iki2rcUPVvVhs8Saxhnp5wHu/F+FIbeXRRwcSd9ZQz8AY3BYHXwRFFimlh3DmxiJcC1+jzmvqw9
	peGzb9G
X-Received: by 2002:a5d:5f96:0:b0:484:3647:d977 with SMTP id ffacd0b85a97d-4870d05a4b1mr5667003f8f.27.1789592011657;
        Wed, 16 Sep 2026 13:53:31 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:31 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 3/9] rtc: abx80x: add mutex protection for register writes
Date: Wed, 16 Sep 2026 22:51:32 +0200
Message-ID: <20260916205138.16771-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ABX80X RTC driver performs multi-step register operations such as
NVMEM transfers or register writes preceded by a configuration key
write. Add a mutex to serialize all the register writes to protect
these sequences against race conditions.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 45 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index e4fd7b5d4b11..44de234efecf 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/rtc.h>
 #include <linux/watchdog.h>
@@ -127,6 +128,7 @@ struct abx80x_priv {
 	struct rtc_device *rtc;
 	struct i2c_client *client;
 	struct watchdog_device wdog;
+	struct mutex lock;
 };
 
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
@@ -219,6 +221,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	unsigned char buf[8];
 	int err, flags;
 
@@ -234,6 +237,8 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[ABX8XX_REG_YR] = bin2bcd(tm->tm_year - 100);
 	buf[ABX8XX_REG_WD] = tm->tm_wday;
 
+	guard(mutex)(&priv->lock);
+
 	err = i2c_smbus_write_i2c_block_data(client, ABX8XX_REG_HTH,
 					     sizeof(buf), buf);
 	if (err < 0) {
@@ -263,6 +268,8 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	struct rtc_device *rtc = priv->rtc;
 	int status;
 
+	guard(mutex)(&priv->lock);
+
 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
 	if (status < 0)
 		return IRQ_NONE;
@@ -319,6 +326,7 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	u8 alarm[6];
 	int err;
 
@@ -332,6 +340,8 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	alarm[4] = bin2bcd(t->time.tm_mday);
 	alarm[5] = bin2bcd(t->time.tm_mon + 1);
 
+	guard(mutex)(&priv->lock);
+
 	err = i2c_smbus_write_i2c_block_data(client, ABX8XX_REG_AHTH,
 					     sizeof(alarm), alarm);
 	if (err < 0) {
@@ -354,6 +364,7 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 					  int autocalibration)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int retval, flags = 0;
 
 	if ((autocalibration != 0) && (autocalibration != 1024) &&
@@ -362,6 +373,8 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&priv->lock);
+
 	flags = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
 	if (flags < 0)
 		return flags;
@@ -445,6 +458,7 @@ static ssize_t oscillator_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int retval, flags, rc_mode = 0;
 
 	if (strncmp(buf, "rc", 2) == 0) {
@@ -456,6 +470,8 @@ static ssize_t oscillator_store(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&priv->lock);
+
 	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
 	if (flags < 0)
 		return flags;
@@ -513,8 +529,11 @@ static const struct attribute_group rtc_calib_attr_group = {
 static int abx80x_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int err;
 
+	guard(mutex)(&priv->lock);
+
 	if (enabled)
 		err = i2c_smbus_write_byte_data(client, ABX8XX_REG_IRQ,
 						(ABX8XX_IRQ_IM_1_4 |
@@ -528,6 +547,7 @@ static int abx80x_alarm_irq_enable(struct device *dev, unsigned int enabled)
 static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int status, tmp;
 
 	switch (cmd) {
@@ -541,16 +561,18 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		return put_user(tmp, (unsigned int __user *)arg);
 
 	case RTC_VL_CLR:
-		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
-		if (status < 0)
-			return status;
+		scoped_guard(mutex, &priv->lock) {
+			status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
+			if (status < 0)
+				return status;
 
-		status &= ~ABX8XX_STATUS_BLF;
+			status &= ~ABX8XX_STATUS_BLF;
 
-		tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
-						status);
-		if (tmp < 0)
-			return tmp;
+			tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+							status);
+			if (tmp < 0)
+				return tmp;
+		}
 
 		return 0;
 
@@ -619,6 +641,8 @@ static int __abx80x_wdog_set_timeout(struct watchdog_device *wdog,
 	struct abx80x_priv *priv = watchdog_get_drvdata(wdog);
 	u8 val = ABX8XX_WDT_WDS | timeout_bits(timeout);
 
+	guard(mutex)(&priv->lock);
+
 	/*
 	 * Writing any timeout to the WDT register resets the watchdog timer.
 	 * Writing 0 disables it.
@@ -703,6 +727,8 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
 		len = min(lower + bytes, (size_t)ABX8XX_SRAM_WIN_SIZE) - lower;
 		len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
 
+		guard(mutex)(&priv->lock);
+
 		ret = i2c_smbus_write_byte_data(priv->client, ABX8XX_REG_EXTRAM,
 						extram);
 		if (ret)
@@ -910,6 +936,9 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	err = devm_mutex_init(&client->dev, &priv->lock);
+	if (err)
+		return err;
 
 	i2c_set_clientdata(client, priv);
 
-- 
2.55.0

