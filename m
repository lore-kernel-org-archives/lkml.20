Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897578;
	b=QHKUJgX7HsSSjJ0rpfXKVZUsqhZA19GxWNm9aCAyhe1BHpBsSXV0bQ0z8Ke8FjmgMF3P
	 z6747lZKGLZpSXNpHjUCyFv1C2+RqR53BGUn0vMaJ6rYMdkbTzovBho8ppckMUw5vtgCh
	 TEIrPN/fQoRzJf3qgwYeFZNuYvqcRfPKl9LOuP5itzGgdLitCUIdTJPoX7NaldfRV+ch7
	 KzoOKtySYJYSoOhNfzWY0Y3nFPrJxohbbm0wKE4l26egJYMyWfeqTmBmu6HPQfq+02l+r
	 TN8s5FeJL+5uCeXkuw4HvnF0BjKI+5z/XuB9tDGgnXRkAAWdz14F3iSC2TUY1gftIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ltpPctHcCv3D3mCQn85U0Am43143Q5d2LuJIwwGQgSA=;
	b=URXJic2Q3e/IpAR7/8eQlmfZ6GW+1X3sjYR/GJ03koAjbf2pkwRUBCnhIMA/J7Z30UoI
	 CWdnnbiaczXUwx2et6hyon77SVgFCQ6rW7+Lp4LIfowzKqVUm459/6XJfoZwlyWev5BcL
	 umUT09tDfibZVZ59wINwr3w1JoeIfS8uiGMopdi21NL878iQ0uqgu7P+3N1Yz5JY+ytdl
	 brGdz1cwhbZGcMTOJ/kyt1MDtHY0bEqYcV+m++4I475G/CUP6vaE2cSsWuY8DuzWTol5r
	 UB2svdJKke9AW0Oo2emrsV5Fwi9tXIP8J0V5tuRgEDYrIv35LpZsQCdMckava7Uvvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sI3sci8P;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719560A2621
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E719560A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sI3sci8P
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so1519606eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897577; x=1793502377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltpPctHcCv3D3mCQn85U0Am43143Q5d2LuJIwwGQgSA=;
        b=sI3sci8PU0LRbXzg9pnV9RKSt5pEesz1u3xPqqTfEF9W2neduMRDwC6nKr6nO7RYAx
         4SccFKxbd4j2G6559Hcgg6oQgVDeQojGC/SgpK0kDueKRFIbstaC91zBdoxg7pnjB9WA
         hzJ8cK0LfY4e61+dPYQ6uApB2CBafT6UolL8Mcz+2dpb/KJpwu65dAz5VBAVM1yPUxq7
         0uV83XlIeiSa4C7938vCjWJRq0QUi2TNQMduDgDeRvThLQWTmKuCb4b14+BFS9ksTfmd
         AskoiJ4tp6+3l4t1K2cI7QpXHD0Hx6bAYt/IdOYtTSOz0Zm0NzIA1ejVuMa1YXIbZ5ps
         q+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897577; x=1793502377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltpPctHcCv3D3mCQn85U0Am43143Q5d2LuJIwwGQgSA=;
        b=huEZjwNLcDtS5bXEVChoJD0cqJ6wr7D9XKusYHRMFeeY1GtJyTSLuoco5OMDGTkq4K
         sKQmMKgiU4+1wwcvEQ/+knMxlwANGCP4V4JUVqQk4hCB/23Yp3s56CWe00LXEIQIpoti
         xawb9BmVF+YPS/NV7qFLFkwzQUIZO/wo0Ug0ZghEXtrpqU9SWvJ9RE6s9a7KTOJ8t33W
         VF7mlr4ETL+3DgiTSm3jTVZgOWkhLPSs/VEKCGrLof442kLPX+kC3WDHcPwzQ8asDhgQ
         W8FyFPNEBq/cJ/uGFv8SpUfz6SKaiUJYjRW5ndpojRC5EjxRbKwKqMvIMqfqeesUB7Xf
         A/fg==
X-Forwarded-Encrypted: i=1; AKwUvBzOtKuZVR1jbG0aCptrNmqJfrJB3m0Ilshkpf6RIopesEQy6A/XAlRbxF1ZeV9b4yTLjB1VqREOokh0y+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ721K5G/H8/wjF7s+5ZWPYK00dKqbyRkKmQG8L5/k9Ky0VzcY
	YzINo+GDkrYHWkGiOcrSYHP/f7IuhqQ+2VHbGKsgYG/7Y56enzIrynOt
X-Gm-Gg: AYBFou0hmtdefZQHe7mhMINn/qay1FpMepnLMH/r2k9jFvy++wmXTA23ba7Q33ynbmK
	Uv3/QiWutA8jta9jEvre6ql99H/oTYPKn4dW9mFEqr/LJN7CSZJrG+UilqgBgAa+GeRv/UYvsvR
	phvmA6SfRTn5/HqH1txle2MKGpWo08Jwv2XVh++CdTaNP5aqgMGmfS343l3uZLy8qbChLIAjZxO
	08H6m4c3M3MqAy/KZDPG8fT/zegvNkD9zOdHbbV01f7WRp+FYQlHVZdbTm2lCRjYD9yUS+Zlp42
	ztCsySe3Vy11jhBHhiMLZpnxgTqvtKFvaAM3SrT5NeGwM1AyOZpY4fmZpYgl8bwaqIhzMShqfy/
	NTskVUj8P7rboklCqn2ebzKTVYD8zYeb29xlKVrIhbTvcE6cvF6DqmJ5okiu/ED6CDFhSIdWRBA
	CQR85URdxjDb8acawTL61yjvXhYvZ8j3jxvQrvLyhtT6trBZT98iGZvYXWvK71u4vng3AllLS2n
	/exRnuqhxSqUlFAvunf3R+64Y0iBdUV5d9eoZADD7BWbcWjR0LzgPiYQu7xrX+3+F2+TbpE2D07
	xDo+AUJkJtUihf2McnGFPTO7A4W10mf67Q1tfniSF7Y=
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr3001487eec.28.1792897577020;
        Sat, 24 Oct 2026 20:06:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:09 -0700
Subject: [PATCH 06/31] hwmon: (pmbus/adm1266) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-6-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer size to i2c_smbus_read_block_data() and shrink the
GPIO read buffers to I2C_SMBUS_BLOCK_MAX since they contain raw binary
status bytes and are not NUL-terminated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/adm1266.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 22ccb721dd51..9f3b5bc9f3e2 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -165,7 +165,7 @@ static const char *adm1266_names[ADM1266_GPIO_NR + ADM1266_PDIO_NR] = {
 static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct adm1266_data *data = gpiochip_get_data(chip);
-	u8 read_buf[I2C_SMBUS_BLOCK_MAX + 1];
+	u8 read_buf[I2C_SMBUS_BLOCK_MAX];
 	unsigned long pins_status;
 	unsigned int pmbus_cmd;
 	int ret;
@@ -177,7 +177,8 @@ static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 	guard(pmbus_lock)(data->client);
 
-	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
+	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd,
+					sizeof(read_buf), read_buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 2)
@@ -194,14 +195,15 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 				     unsigned long *bits)
 {
 	struct adm1266_data *data = gpiochip_get_data(chip);
-	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1];
+	u8 read_buf[I2C_SMBUS_BLOCK_MAX];
 	unsigned long status;
 	unsigned int gpio_nr;
 	int ret;
 
 	guard(pmbus_lock)(data->client);
 
-	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS,
+					sizeof(read_buf), read_buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 2)
@@ -215,7 +217,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 			set_bit(gpio_nr, bits);
 	}
 
-	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, read_buf);
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS,
+					sizeof(read_buf), read_buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 2)
@@ -361,7 +364,8 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	int ret;
 
 	guard(pmbus_lock)(client);
-	ret = i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV, buf);
+	ret = i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 3)
@@ -387,7 +391,8 @@ static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
 	int ret;
 
 	guard(pmbus_lock)(client);
-	ret = i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);
+	ret = i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 	if (ret != 2)
@@ -461,7 +466,8 @@ static int adm1266_rtc_get(void *data, u64 *val)
 	int ret, i;
 
 	guard(pmbus_lock)(client);
-	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
+	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 6)
@@ -525,7 +531,8 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
-	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 

-- 
2.56.0.257.gf7497c7d27-goog

