Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895399;
	b=kb7rJ8MmNEPt88mniC6zwzVNlFmYY5v84yImuZZjugfTdoCr9R2D/MwVCX0I2qtvrGcK
	 kSiZE1dkaz5yBZw36B9ZpxArln/fROoL9HoZkAcZr/yIRJR4FfxMfQQeVDIygQC9+p5MJ
	 HDcbm4x7ssQJmoveQM5kUz4dsnkyHUJ7Cuh4c4wPrYpP+ZkdN2nNDNGzRF5DmQNf2cnjc
	 8tjDRgIL7BgOS/CPr9JNkwZdwYnbylc4NvNIDNfxLKjJm9bvKi5rrOjzOyMEmRQ4eZzh7
	 Uc/FHK5FKeLV0/5GNOqI5aaH0r7aXtCfftPfmrpbfvDR5zKcPIQFABc6N/nXjbbIuWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CEKYonBic6UINzzlaHsnI5KCf6ygTszLUf3F+RQKa0I=;
	b=34YT6Rpx4QsJFrOtfj1Zhwv1TqEkE+3A8T4sbc6a8K/KgA0+dnkLMqttYZeNvp8UzPQW
	 bRlXKQ5xslTVxs/198kj2sh93p2Zn5HCA4URGCO67kVxFI2ka+xr1q2Bafq92Unpu2Zrb
	 KjGuWJXBhjdDSsvbHW8V3Qe43lH7Ds8j6VOihP7AkGOv+1/m6Xh2Xy6yzous5DXCpWXeQ
	 M4MxrtwsXWJkCb8k4MPbe0tEW5M9llqrdEKhOPM4xk+kYgiMR7p3wVuOiWFNdVAwRCL8r
	 xBF+bwS0YROS+wf3hmmT3vQzUCeMRH62vfpgMkPsQB47oH6GhtOIM4pCG/G1S+8Jl7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhIoaLUN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95076606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95076606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhIoaLUN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso3851192f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895397; x=1795500197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEKYonBic6UINzzlaHsnI5KCf6ygTszLUf3F+RQKa0I=;
        b=EhIoaLUN4p/VHNF6ruRPVSMimFPRDHu+S23ei/ENMtcOG0Z2BgXv/yKGPT6V/wfGvy
         gh/bDVmQGemcY+DpPL406fO0nA2dRyljeBQNsANcuagAIbyZuFNAuVdpVzNMqItFok8y
         YDHHibQxIeB/ZCO/31KoNrO+zEWvl9MGa/guXakpmlD9Z7MFo+r3me+JYarhChJd1jR9
         Py8hWva6q2kQpxbBAjlNt1iV/CO/6gO+ozfpmsSHyZ6a9lnBt2I2bUjvOLHp8Dg32dU5
         XlZBtOyqLzUQVQxgX0maCrFOn1x31uWIhrCwKfGygJcj9uXVk0kvr49CuW3zDIESXlsb
         s6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895397; x=1795500197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEKYonBic6UINzzlaHsnI5KCf6ygTszLUf3F+RQKa0I=;
        b=XZOyN/VexGrLZuzU0BGHYEJAus1pN0ICeicerZU1jSaT+6/E+Z0pwtCC58gXfj4Kdn
         VEO1A9s48bagZzUqJbloQRIZN9eb25Vt8RZp5qCNBBMJ6xOQOT9HQC3E4h7YYFVqFFQP
         PCysuxLp+I6bn/aA7Rm27F/qC/x+i+ggv4DrWahDdMKD2QLoEKT45atUlxXo5Rt829nG
         c5JayegCwfijFq0zOHGY8IqDebr3A79rMaunX3WUhjv8KxAxr8Dxus6dnj+uLdSCaNRg
         sTdvK7d/B6dOeukwSkU6I5OvwycjkTThAGZdT1wmIPHZHJ/GdgvfwMJgGQYdr/CQqc1C
         2ynw==
X-Forwarded-Encrypted: i=1; AL+hErFhWPGrvavDC3Z6jSOD8qeY10KgVn/Ywdy9b8XfdjVk/ev/Znmds6/a5O436bJ5R1Nq1pgBof9oS4CWsj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8dXFPAGLYbYB6x/0HZ9j+G6eTC1YBAP7Gp1iQoUNHuL6tUDAv
	/MdVD+86GnF2nppFkdHhV4gI8Hjmd4d4uzBRrRZfjiBVfwqsqEuuNP5M
X-Gm-Gg: AZFdTZflrWxet0EZ7ODvJt9WRLRaeH8bDjZhZrHBpk7s2CwMugrLK7CEaqvg1r1ooce
	I6KYhOOYwOjkFbsxivmy9GJXbNyK9LdCkEC835Spg8X0Pt6NzuHoMcaNW4gnfBJiQBDrQvLSi1d
	T5tR3I9BOhYxboes8Oom+qP2WsPzf/XFiYQUSWxTyXzy+0NKebhgNiFGSo+WOe0Nn1gpkJRX65D
	TnCAIL5c5wTV18eW0mOK9G/CiINyfYsuYdEU9xLO65AQ+1o0EcpDWz5Lv0D2mT+JcU54puN6sMj
	XSk7tk1u64pmnSgfKYlRAZoo6c87LczLeAzqJK7y7prfyzs5k5c37zActntGwr4a4/xyIoew3z1
	0aNds1/7fzFB+FNm+rqsdd3FzA0Ogy0XJ1NUgIh7W0Wyn9eZ8scaJwO7XFkgkVgzRwWIZvsAM7m
	8Qs7kGLa3JvTScHtIrnlCgE6DNuApA1aSAhtdi5IGGyehpU7ap4bi4bJhWMM8ompG3lNDHinEdI
	6cQAqYjILGbCRmKZLDWHV6ZZ0Rj2jkIbdz3DBhzWcuXiygxbFNZbRYqENO53pkk7teH1RWZafQ7
	70muoFja2M93/XsbUA==
X-Received: by 2002:a05:6000:990:b0:493:1477:cdd7 with SMTP id ffacd0b85a97d-49c729bc072mr25731754f8f.45.1794895396632;
        Mon, 16 Nov 2026 22:03:16 -0800 (PST)
Received: from averion.play.pl ([2a02:a313:21ec:9380::e204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm25837561f8f.18.2026.11.16.22.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:03:16 -0800 (PST)
From: Daniil Demakov <t3127430@gmail.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniil Demakov <t3127430@gmail.com>
Subject: [PATCH v4] leds: pca9532: Propagate I2C errors
Date: Tue, 17 Nov 2026 06:00:02 +0000
Message-ID: <20261117060002.3752-1-t3127430@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Check return values from SMBus read and write operations and
propagate errors through LED, PWM, blink and GPIO operations.

Restore previous LED and PWM state when hardware updates fail.
Protect shared LED and PWM state with the update mutex.

Check register writes during device initialization and register
LED class devices only after successfully configuring the hardware.

Signed-off-by: Daniil Demakov <t3127430@gmail.com>
---
 drivers/leds/leds-pca9532.c | 336 +++++++++++++++++++++++++++++-------
 1 file changed, 270 insertions(+), 66 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c8085427696f..19b993d9ac9f 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -14,6 +14,7 @@
 #include <linux/leds.h>
 #include <linux/input.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/leds-pca9532.h>
 #include <linux/gpio/driver.h>
@@ -42,6 +43,9 @@ struct pca9532_data {
 	struct i2c_client *client;
 	struct pca9532_led leds[16];
 	struct mutex update_lock;
+	/* Protects beep_pwm between the event callback and workqueue. */
+	spinlock_t beep_lock;
+	u8 beep_pwm;
 	struct input_dev *idev;
 	struct work_struct work;
 #ifdef CONFIG_LEDS_PCA9532_GPIO
@@ -144,68 +148,147 @@ static int pca9532_calcpwm(struct i2c_client *client, int pwm, int blink,
 	return 0;
 }
 
-static int pca9532_setpwm(struct i2c_client *client, int pwm)
+static int __pca9532_setpwm(struct i2c_client *client, int pwm)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
 
-	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
-		data->pwm[pwm]);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
-		data->psc[pwm]);
-	mutex_unlock(&data->update_lock);
-	return 0;
-}
+	if (pwm < 0 || pwm > 1)
+		return -EINVAL;
+
+	ret = i2c_smbus_write_byte_data(client,
+					PCA9532_REG_PWM(maxleds, pwm),
+					data->pwm[pwm]);
+	if (ret < 0) {
+		dev_warn(&client->dev,
+			 "Failed to write PWM register: %d\n", ret);
+		return ret;
+	}
+
+	ret = i2c_smbus_write_byte_data(client,
+					PCA9532_REG_PSC(maxleds, pwm),
+					data->psc[pwm]);
+	if (ret < 0)
+		dev_warn(&client->dev,
+			 "Failed to write PSC register: %d\n", ret);
 
+	return ret;
+}
 /* Set LED routing */
-static void pca9532_setled(struct pca9532_led *led)
+static int __pca9532_setled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
-	char reg;
+	int reg;
+	int ret;
 
-	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
+	if (reg < 0) {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+		return ret;
+	}
+
 	/* zero led bits */
-	reg = reg & ~LED_MASK(led->id);
+	reg &= ~LED_MASK(led->id);
+
 	/* set the new value */
-	reg = reg | (led->state << LED_SHIFT(led->id));
-	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
+	reg |= led->state << LED_SHIFT(led->id);
+
+	ret = i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
+
+	if (ret < 0)
+		dev_warn(&client->dev, "Failed to write LED register: %d\n", ret);
+
+	return ret;
+}
+
+static int pca9532_setled(struct pca9532_led *led)
+{
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = __pca9532_setled(led);
 	mutex_unlock(&data->update_lock);
+
+	return ret;
 }
 
 static int pca9532_set_brightness(struct led_classdev *led_cdev,
-	enum led_brightness value)
+				  enum led_brightness value)
 {
-	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	int old_state;
+	u8 old_pwm;
+	u8 old_psc;
+	bool pwm_updated = false;
+	int restore_err;
+	int err = 0;
+
+	mutex_lock(&data->update_lock);
+	old_state = led->state;
+	old_pwm = data->pwm[PCA9532_PWM_ID_0];
+	old_psc = data->psc[PCA9532_PWM_ID_0];
 
 	if (value == LED_OFF) {
 		led->state = PCA9532_OFF;
 	} else if (led->state == PCA9532_PWM1) {
-		return 0; /* Non-zero brightness shall not stop HW blinking */
+		goto out;
 	} else if (value == LED_FULL) {
 		led->state = PCA9532_ON;
 	} else {
-		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
-		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
+		led->state = PCA9532_PWM0;
+		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0,
+				      0, value);
 		if (err)
-			return err;
+			goto restore_state;
+	}
+
+	if (led->state == PCA9532_PWM0) {
+		pwm_updated = true;
+		err = __pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
+		if (err < 0)
+			goto restore_state;
 	}
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
-	pca9532_setled(led);
+
+	err = __pca9532_setled(led);
+	if (err < 0)
+		goto restore_state;
+
+	goto out;
+
+restore_state:
+	led->state = old_state;
+	data->pwm[PCA9532_PWM_ID_0] = old_pwm;
+	data->psc[PCA9532_PWM_ID_0] = old_psc;
+
+	if (pwm_updated) {
+		restore_err = __pca9532_setpwm(led->client,
+					       PCA9532_PWM_ID_0);
+		if (restore_err < 0)
+			dev_warn(&led->client->dev,
+				 "Failed to restore PWM settings: %d\n",
+				 restore_err);
+	}
+out:
+	mutex_unlock(&data->update_lock);
 	return err;
 }
 
 static int pca9532_update_hw_blink(struct pca9532_led *led,
-				   unsigned long delay_on, unsigned long delay_off)
+				   unsigned long delay_on,
+				   unsigned long delay_off)
 {
 	struct pca9532_data *data = i2c_get_clientdata(led->client);
 	unsigned int psc;
-	int i;
+	unsigned long period;
+	u8 old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	u8 old_psc = data->psc[PCA9532_PWM_ID_1];
+	int i, ret;
 
 	/* Look for others LEDs that already use PWM1 */
 	for (i = 0; i < data->chip_info->num_leds; i++) {
@@ -223,29 +306,64 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 		}
 	}
 
-	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
-	if (psc > U8_MAX) {
-		/* Blink period too long to be handled by hardware */
+	if (delay_on > ULONG_MAX - delay_off)
 		return -EINVAL;
+
+	period = delay_on + delay_off;
+
+	if (!delay_on || !delay_off)
+		return -EINVAL;
+
+	if (period > ((U8_MAX + 1) * 1000) /
+		     PCA9532_PWM_PERIOD_DIV)
+		return -EINVAL;
+
+	psc = (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
+
+	data->psc[PCA9532_PWM_ID_1] = psc;
+	data->pwm[PCA9532_PWM_ID_1] =
+		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
+
+	ret = __pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	if (ret < 0) {
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		data->psc[PCA9532_PWM_ID_1] = old_psc;
+
+		if (__pca9532_setpwm(data->client, PCA9532_PWM_ID_1) < 0)
+			dev_warn(&data->client->dev,
+				 "Failed to restore PWM settings\n");
+
+		return ret;
 	}
 
 	led->state = PCA9532_PWM1;
-	data->psc[PCA9532_PWM_ID_1] = psc;
-	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
 
-	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	return 0;
 }
 
 static int pca9532_set_blink(struct led_classdev *led_cdev,
-	unsigned long *delay_on, unsigned long *delay_off)
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
 {
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
+	int old_state;
+	int restore_err;
+	u8 old_pwm;
+	u8 old_psc;
 	int err;
 
-	if (!data->hw_blink)
-		return -EINVAL;
+	mutex_lock(&data->update_lock);
+
+	old_state = led->state;
+	old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	old_psc = data->psc[PCA9532_PWM_ID_1];
+
+	if (!data->hw_blink) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
@@ -255,26 +373,47 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 
 	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
 	if (err)
-		return err;
+		goto restore_state;
+
+	err = __pca9532_setled(led);
+	if (err < 0) {
+		led->state = old_state;
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		data->psc[PCA9532_PWM_ID_1] = old_psc;
+
+		restore_err = __pca9532_setpwm(client, PCA9532_PWM_ID_1);
+		if (restore_err < 0)
+			dev_warn(&client->dev,
+				 "Failed to restore PWM settings: %d\n",
+				 restore_err);
+	}
 
-	pca9532_setled(led);
+	goto out;
 
-	return 0;
+restore_state:
+	led->state = old_state;
+out:
+	mutex_unlock(&data->update_lock);
+	return err;
 }
 
 static int pca9532_event(struct input_dev *dev, unsigned int type,
-	unsigned int code, int value)
+			 unsigned int code, int value)
 {
 	struct pca9532_data *data = input_get_drvdata(dev);
+	unsigned long flags;
 
 	if (!(type == EV_SND && (code == SND_BELL || code == SND_TONE)))
 		return -1;
 
-	/* XXX: allow different kind of beeps with psc/pwm modifications */
+	spin_lock_irqsave(&data->beep_lock, flags);
+
 	if (value > 1 && value < 32767)
-		data->pwm[PCA9532_PWM_ID_1] = 127;
+		data->beep_pwm = 127;
 	else
-		data->pwm[PCA9532_PWM_ID_1] = 0;
+		data->beep_pwm = 0;
+
+	spin_unlock_irqrestore(&data->beep_lock, flags);
 
 	schedule_work(&data->work);
 
@@ -286,27 +425,48 @@ static void pca9532_input_work(struct work_struct *work)
 	struct pca9532_data *data =
 		container_of(work, struct pca9532_data, work);
 	u8 maxleds = data->chip_info->num_leds;
+	unsigned long flags;
+	u8 old_pwm;
+	u8 pwm;
+	int ret;
+
+	spin_lock_irqsave(&data->beep_lock, flags);
+	pwm = data->beep_pwm;
+	spin_unlock_irqrestore(&data->beep_lock, flags);
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
-		data->pwm[PCA9532_PWM_ID_1]);
+
+	old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	data->pwm[PCA9532_PWM_ID_1] = pwm;
+
+	ret = i2c_smbus_write_byte_data(data->client,
+					PCA9532_REG_PWM(maxleds, 1), pwm);
+	if (ret < 0) {
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		dev_warn(&data->client->dev,
+			 "Failed to write PWM register: %d\n", ret);
+	}
+
 	mutex_unlock(&data->update_lock);
 }
 
-static enum pca9532_state pca9532_getled(struct pca9532_led *led)
+static int pca9532_getled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
 	int reg;
-	enum pca9532_state ret = PCA9532_OFF;
+	int ret;
 
 	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-	if (reg >= 0)
+
+	if (reg >= 0) {
 		ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
-	else
-		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);
+	} else {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+	}
 	mutex_unlock(&data->update_lock);
 	return ret;
 }
@@ -328,33 +488,42 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
+	int old_state;
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	old_state = led->state;
 
 	if (val)
 		led->state = PCA9532_OFF;
 	else
 		led->state = PCA9532_ON;
 
-	pca9532_setled(led);
+	ret = __pca9532_setled(led);
+	if (ret < 0)
+		led->state = old_state;
 
-	return 0;
+	mutex_unlock(&data->update_lock);
+
+	return ret;
 }
 
 static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
-	unsigned char reg;
+	int reg;
 
 	reg = i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
 
+	if (reg < 0)
+		return reg;
+
 	return !!(reg & (1 << (offset % 8)));
 }
 
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 1);
-
-	return 0;
+	return pca9532_gpio_set_value(gc, offset, 1);
 }
 
 static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset, int val)
@@ -394,40 +563,57 @@ static int pca9532_configure(struct i2c_client *client,
 	struct pca9532_data *data, struct pca9532_platform_data *pdata)
 {
 	int i, err = 0;
+#ifdef CONFIG_LEDS_PCA9532_GPIO
 	int gpios = 0;
+#endif
 	u8 maxleds = data->chip_info->num_leds;
 
-	for (i = 0; i < 2; i++)	{
+	for (i = 0; i < 2; i++) {
 		data->pwm[i] = pdata->pwm[i];
 		data->psc[i] = pdata->psc[i];
-		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
+
+		err = i2c_smbus_write_byte_data(client,
+						PCA9532_REG_PWM(maxleds, i),
 						data->pwm[i]);
 		if (err < 0)
 			return err;
-		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
+
+		err = i2c_smbus_write_byte_data(client,
+						PCA9532_REG_PSC(maxleds, i),
 						data->psc[i]);
 		if (err < 0)
 			return err;
 	}
 
 	data->hw_blink = true;
+
 	for (i = 0; i < data->chip_info->num_leds; i++) {
 		struct pca9532_led *led = &data->leds[i];
 		struct pca9532_led *pled = &pdata->leds[i];
+
 		led->client = client;
 		led->id = i;
 		led->type = pled->type;
+
 		switch (led->type) {
 		case PCA9532_TYPE_NONE:
 			break;
 		case PCA9532_TYPE_GPIO:
+#ifdef CONFIG_LEDS_PCA9532_GPIO
 			gpios++;
+#endif
 			break;
 		case PCA9532_TYPE_LED:
-			if (pled->state == PCA9532_KEEP)
-				led->state = pca9532_getled(led);
-			else
+			if (pled->state == PCA9532_KEEP) {
+				err = pca9532_getled(led);
+				if (err < 0)
+					goto exit;
+
+				led->state = err;
+			} else {
 				led->state = pled->state;
+			}
+
 			led->name = pled->name;
 			led->ldev.name = led->name;
 			led->ldev.default_trigger = pled->default_trigger;
@@ -435,6 +621,15 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
+
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set LED %s state\n",
+					led->name);
+				goto exit;
+			}
+
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -442,19 +637,26 @@ static int pca9532_configure(struct i2c_client *client,
 					led->name);
 				goto exit;
 			}
-			pca9532_setled(led);
 			break;
 		case PCA9532_TYPE_N2100_BEEP:
 			/* PWM1 is reserved for beeper so blink will not use hardware */
 			data->hw_blink = false;
 			BUG_ON(data->idev);
+
 			led->state = PCA9532_PWM1;
-			pca9532_setled(led);
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set beeper state\n");
+				goto exit;
+			}
+
 			data->idev = devm_input_allocate_device(&client->dev);
 			if (data->idev == NULL) {
 				err = -ENOMEM;
 				goto exit;
 			}
+
 			data->idev->name = pled->name;
 			data->idev->phys = "i2c/pca9532";
 			data->idev->id.bustype = BUS_HOST;
@@ -467,6 +669,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->idev->event = pca9532_event;
 			input_set_drvdata(data->idev, data);
 			INIT_WORK(&data->work, pca9532_input_work);
+
 			err = input_register_device(data->idev);
 			if (err) {
 				cancel_work_sync(&data->work);
@@ -498,8 +701,8 @@ static int pca9532_configure(struct i2c_client *client,
 			dev_warn(&client->dev, "could not add gpiochip\n");
 		} else {
 			dev_info(&client->dev, "gpios %i...%i\n",
-				data->gpio.base, data->gpio.base +
-				data->gpio.ngpio - 1);
+				 data->gpio.base, data->gpio.base +
+				 data->gpio.ngpio - 1);
 		}
 	}
 #endif
@@ -591,6 +794,7 @@ static int pca9532_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, data);
 	data->client = client;
 	mutex_init(&data->update_lock);
+	spin_lock_init(&data->beep_lock);
 
 	return pca9532_configure(client, data, pca9532_pdata);
 }
-- 
2.56.0

