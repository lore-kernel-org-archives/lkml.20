Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337544;
	b=bneLDu2ghfOLd5HQvg5E4LIk7aR/10FTQA8urdS1Jy9Ns1zQhXjOra/zPpwZfnW3si64
	 rZ7k0VOVU7yOKycPR23tufetLCJXDyocADT0ZwTUYe3bOV7VfBRDD4uP10/2mzmUjzox5
	 3S9kv2LaODaCAqB67NFvhBqAvzhLxyGtLmcL5RceH1AYQWIQ14n0otT3PTP/wEMF7xAG+
	 UvhaTY+OY0pG3ivj+vsVd5U0e0dsVbYAz1pty+awD9YBT14trxDFwSN/uziIHkEhgwtjD
	 LJ0sETsE4El4T4JGyfqoXRLjSI8i9btG/xJNItkfQOX36VN+4pM5IbPLI3azPk+krNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXiFdoM3VUtdMQk8Cs/mdyvY7n8e7T8ndzqRjJZyIs0=;
	b=MPu/VNv8ky0hkBIt0OIiL2etKpq6UJDOk7kAzVsjmYaIYR83Vd3dCkYDT10jYRU9pPRR
	 7EhY7Wb/rkutSaX1i9ZpISQALh0XcNm4K4RXj1ylVTwBHXmGd73mu1/k+Zf2JtzC4zumw
	 w9H1MZVREFp+0yXDt00e/NyTLvWX6A68kjihwYqe9+KEUAiEUvFvj4x2t05s/PyW1zjpG
	 zcFrFGdL/rmEOc0rnOvFd+lVKVJ+xr1xWyuOj8QtBWu3iAy2WMkWOVIt5Wi4YKx4wJ4I1
	 GFc/lg9vKKbPaDjoOHPiwHiaGV1Y5RpJ27/DrvEBwP8AiZjKfUMUQ5kksMCuYmOZ/qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tv0adml+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF37C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF37C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tv0adml+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1986225e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793337542; x=1793942342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXiFdoM3VUtdMQk8Cs/mdyvY7n8e7T8ndzqRjJZyIs0=;
        b=tv0adml+rloynd9hgaO4/MP13pRUpMdvwJ5Ux6fTjjFUPhVLGQTT6XeDcXeeD75BaE
         wWz1ZX+Z6MX8n00Q5m/hM22fUjqoot9VcVn+Ybft/3H7M01s8m8mEWuxUvcuAGcFdaHt
         4HRrPUi6UELDGWjNIWyEQUk6cWXfmUIPPBNYE73SQoFLLLa71YF642TuoTBB9yceYQSS
         4YA2o/k2kn+QBN6z7WqmfSWtFv02FJFEu1CJVCVTNEbD/erTK4maDG3h5ZfUR4V33VkN
         oJOh1qx0vq6ZzPoKQ5Z+ONt80T4uEK+ndiJLgJsaF1nHiw+hietMj//JnyJeB+1ChFJi
         /zoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337542; x=1793942342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXiFdoM3VUtdMQk8Cs/mdyvY7n8e7T8ndzqRjJZyIs0=;
        b=bvgyPRZ5rz6JzgMqoxbj7Hi1P3pEWOAgJfXdhOuvo/ey3L4dycqWa3XC4nK4y+qd1q
         VkfN/hz4jT7dgXi3pv7YhN2ts8uwLk2lW2CMX6yZwzqzbhf+gfmcHkMYtmQS+Fp1xpbD
         qe7RRhSlxE/2iNkW52ko4QzMq317sEgv5vHMzRJICbUE6CehdsZaBW/tqVwEElm94kDK
         pSqqdqxwoyl+oGduKj2nrCdataF3oPwxltUTjoW6nxyXpD4uX+p/+IvBqagJmWs6PFO5
         AroRCeDjAN0PIBbYDIwjGLsO8Y0CYvQXKqevFsd61XoiA3mWigOBZi4FQanyD6JoEzee
         ekBg==
X-Forwarded-Encrypted: i=1; AKwUvBzc6lNSBzXJHIsIUJA8Rg8dw/7axL6pvIR+vwBrtavvQI4jdX/roF/gwNhXX+HRvxOPolO7SfmkV03rp7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjNrdzrZDELeS4VX8YvrWsYS/61vxZEemDJf0mGCdLIdinyXXx
	xDMn9Aeu8cvsxp9KDKYZQCzQeAfI6yPMvgC7rxn/P5FKxN3LeTP4UNy5
X-Gm-Gg: AYBFou11IaVrIRtq0wbMlZ7rFZbDXpbjM0h+JSEMGfeoEaQFCTO01gNrO7oZX9FKQFx
	yQNEu5LUqckXSYnFKnnhpkRoVmVEdAaRx0xsTac/T18dSumzvxjfwdEkzJlDAEm5Jw9YLtyU4yB
	bruMd1ZY0SUDrE4sDKAmlYHFgmYmxrqWTQUvvfnkmFV8aSCZDTTiKsg0FskkuqyB+q+xWpOmgY/
	P6DOMPtXdgM/gyScJPvQRWkqZrnSjCp0TkMvH1L23otrFLiKsUz640LB8xs71UdU7yJTQISpvSS
	85Yv3f/OC1hHwcjJGwhRCedRFOKN5It1oyA1E9+oFVTnk/2aCLwEa+CsmN9rMGY6GOPEOoFXlWd
	skMFVU7Pzr7Y18b840fwlK7RWxeOGN+EsZ2dMUBHSO4r8gkbp72EeSA22r0W/OsevVfo07UD1Kc
	SwAOYd+7ZBKrlotOG0xs6UUwzE7oBhnjzyjFUzcTf5/PeCs/H89K916byfKDG0m33s+WT0aR8T1
	MsxfcH2UpN4Cs7LjQ/PIJIq6cU79OGXAAYjCsLoxVjewejJpfrlkmPccV1a1FwynW3GfpphDd51
	qGIbISOda/05MZ3kdWz1VA5iAD9J7pCy7yQ7ThsJdKR/UHkRwoCOHCEnUSZ7fqZD8cOqcB+s
X-Received: by 2002:a05:600c:3b2a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ac1709a2c3mr19762195e9.15.1793337542186;
        Thu, 29 Oct 2026 22:19:02 -0700 (PDT)
Received: from ahmad-HP-ZBook-17-G3 ([5.212.7.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm1213805f8f.26.2026.10.29.22.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:19:01 -0700 (PDT)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: [PATCH] platform/x86: wireless-hotkey: Drive the HP airplane mode LED
Date: Fri, 30 Oct 2026 08:48:39 +0330
Message-ID: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
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

HP laptops with the HPQ6001 wireless button have an airplane mode LED
next to it (white with radios on, amber in airplane mode) that stays in
whatever state the firmware left it on Linux. The HPQ6001 device has a
WLED method for it, and HP's Windows Wireless Button Driver (2.1.9.1)
calls it from the Wireless Radio LED output report (Generic Desktop
usage 0xc7) of the radio management HID collection it exposes:
WLED(1) with radios on, WLED(0) in airplane mode.

When the method exists, register a platform::wlan LED that calls it,
with rfkill-any as default trigger, which follows the same state.
Restore the LED on resume.

Tested on an HP ZBook 17 G3 (board 80D6) with Ubuntu's 7.0.0 kernel:
WLED(1) and WLED(0) switch the LED white and amber, the firmware does not
change it by itself when the button is pressed, and with this patch the
LED follows airplane mode toggled with the button and with rfkill.

Reading HP's Windows driver (Ghidra) and the ACPI tables, and writing
this patch, were done with the help of an AI coding assistant (Claude);
I tested the LED on the machine.

Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>
---
 drivers/platform/x86/Kconfig           |  1 +
 drivers/platform/x86/wireless-hotkey.c | 65 +++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7ee9ff387..3bc09a694 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -458,6 +458,7 @@ config WIRELESS_HOTKEY
 	tristate "Wireless hotkey button"
 	depends on ACPI
 	depends on INPUT
+	depends on LEDS_CLASS || !LEDS_CLASS
 	help
 	 This driver provides supports for the wireless buttons found on some AMD,
 	 HP, & Xiaomi laptops.
diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
index 3151844d1..cbe92c967 100644
--- a/drivers/platform/x86/wireless-hotkey.c
+++ b/drivers/platform/x86/wireless-hotkey.c
@@ -10,7 +10,9 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/acpi.h>
 #include <acpi/acpi_bus.h>
 
@@ -25,6 +27,9 @@ MODULE_ALIAS("acpi*:LGEX0815:*");
 struct wl_button {
 	struct input_dev *input_dev;
 	char phys[32];
+	acpi_handle handle;
+	struct led_classdev led;
+	bool has_led;
 };
 
 static const struct acpi_device_id wl_ids[] = {
@@ -87,6 +92,41 @@ static void wl_notify(acpi_handle handle, u32 event, void *data)
 	input_sync(button->input_dev);
 }
 
+/*
+ * HP's HPQ6001 device has a WLED method for the airplane mode LED (1: radios
+ * on, 0: airplane mode). HP's Windows driver calls it from the Wireless Radio
+ * LED output report of its radio management HID collection, so drive it from
+ * the rfkill-any trigger, which follows the same state.
+ */
+static int wireless_led_set(struct led_classdev *led, enum led_brightness value)
+{
+	struct wl_button *button = container_of(led, struct wl_button, led);
+	acpi_status status;
+
+	status = acpi_execute_simple_method(button->handle, "WLED", value ? 1 : 0);
+	return ACPI_SUCCESS(status) ? 0 : -EIO;
+}
+
+static int wireless_led_setup(struct device *dev)
+{
+	struct wl_button *button = dev_get_drvdata(dev);
+	int err;
+
+	if (!acpi_has_method(button->handle, "WLED"))
+		return 0;
+
+	button->led.name = "platform::wlan";
+	button->led.max_brightness = 1;
+	button->led.brightness_set_blocking = wireless_led_set;
+	button->led.default_trigger = "rfkill-any";
+	err = led_classdev_register(dev, &button->led);
+	if (err)
+		return err;
+
+	button->has_led = true;
+	return 0;
+}
+
 static int wl_probe(struct platform_device *pdev)
 {
 	struct acpi_device *adev;
@@ -102,6 +142,7 @@ static int wl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, button);
+	button->handle = adev->handle;
 
 	err = wireless_input_setup(&pdev->dev);
 	if (err) {
@@ -114,24 +155,46 @@ static int wl_probe(struct platform_device *pdev)
 	if (err) {
 		pr_err("Failed to install ACPI notify handler\n");
 		wireless_input_destroy(&pdev->dev);
+		return err;
 	}
 
-	return err;
+	err = wireless_led_setup(&pdev->dev);
+	if (err)
+		dev_warn(&pdev->dev, "Failed to register the airplane mode LED: %d\n", err);
+
+	return 0;
 }
 
 static void wl_remove(struct platform_device *pdev)
 {
+	struct wl_button *button = platform_get_drvdata(pdev);
+
+	if (button->has_led)
+		led_classdev_unregister(&button->led);
 	acpi_dev_remove_notify_handler(ACPI_COMPANION(&pdev->dev),
 				       ACPI_DEVICE_NOTIFY, wl_notify);
 	wireless_input_destroy(&pdev->dev);
 }
 
+/* The firmware does not keep the LED state across suspend. */
+static int wl_resume(struct device *dev)
+{
+	struct wl_button *button = dev_get_drvdata(dev);
+
+	if (button->has_led)
+		wireless_led_set(&button->led, button->led.brightness);
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(wl_pm_ops, NULL, wl_resume);
+
 static struct platform_driver wl_driver = {
 	.probe = wl_probe,
 	.remove = wl_remove,
 	.driver = {
 		.name = "wireless-hotkey",
 		.acpi_match_table = wl_ids,
+		.pm = pm_sleep_ptr(&wl_pm_ops),
 	},
 };
 
-- 
2.53.0

