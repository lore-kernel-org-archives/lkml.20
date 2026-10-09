Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4836B910
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530681; cv=none; b=WRDoe0FL32jJcwEj1ZxxSnhxxJRfObKbIcLb9KhhL/OlxvIYOQoPYxrSMLPogi24Fi3T/HriV5ZMTHbKsAyptS0lt7aKDPesttc+oDEwUkf5kD22tSLFb93KV+qDproOOKqhjDaCn6OdFc1D6C+XFQZD/q78WQj8umPtsWvBycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530681; c=relaxed/simple;
	bh=pxUkCMM2UXyrR1rZnwfMs9nbal+HDiHNcbfctc5svgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmBCY37ZH7IAn/v9jFFWbCbkk+yo+Ch8qn2lNjMDk1fmrx9VVZunERdgOuPPUDoBsd6s7Apco6pNLGnJMVq6tRzLXzTexrO0Ad20HcFVNLoNHL1f9u3Vkz2m241JZsU6tXHRMxiJ3Lov1BcatShJ1QlRp3skpOsMc8igBF9s6n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJPhBEet; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJPhBEet"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-16ad92569b5so238506c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530679; x=1792135479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwSepRwSuQr7wi2Gml76JYUuzR52erk1HLC3v/0O/54=;
        b=LJPhBEetqv+R+qcyXm6nz0nESY94M96buoMXUgf7t5ZmHvRdcx58g8dJ4CCPOM55F5
         tUrgGfTzCebQeS59WAHe7NF/8GEIyPwXGBPmYH7a4cchVvF+PqwP35gV73PAO6BzfP9F
         8kHcLAUGOzl4AzsaibuPa7w6U/LEg4vXIqDzTH+GCgs+070jC81dls9nAJutvIBKgVbv
         AsnU1Yp05o9e8shJ7WCw0g1b5okuajMSJ8oeFdzEX5qSpPNyIebPgB2VxxHYLlWmP9FH
         A1F6w1gqNM628Ck16eejxSXk3EnAMtgQCs4pTA7IwnpowQh7a/hMHmP2f1DgpWkuCk8V
         6bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530679; x=1792135479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwSepRwSuQr7wi2Gml76JYUuzR52erk1HLC3v/0O/54=;
        b=PbLrEFofDnk8WSorR0iLR0zYEa3hNH4ohPidRZTBk/kl+558A1Xl7rYp7e073O5N2S
         makGzH9CYt2n2OBYcHconISGDvjmCQeJLa93pJSJhhDWsKiKxdGGVxFJiCV8yigiue1f
         YvtvE0tkBFFbZp2vWCeZp5Whk7O+xybM99dAsJ8LYe8epiPrWTsSJRyzsjma3YwpTwfZ
         AGBKuV4UgJ/6MYpXd3ninJZdmk80OKWe2dDdDHKGOAsvNYfk0eru1a/vRKIcOuLCzYAg
         0YzUCo7RXXfR9YtiHmZ940NPD0IlNgxPhwcXzP4v+CVKk0ZDGUj27AveuSCx2Cclflmq
         la3A==
X-Forwarded-Encrypted: i=1; AKwUvBzW/7GdcmF8waedQxFR9PGEX11rRBC5OGr015CfCNlSX00EipOV6rlxZR5DzUSKDHk3jnk+4CHedZkryJE=@vger.kernel.org
X-Gm-Message-State: AFuF++n3GoL+PKlY0s9BZcdlc7I+E4YW10azirrXq5haafmdR6sHn3T1
	t+m8odeIO7oz+FBgJqyjqdNYVKPaClVLZzvDWAc8MOoOCRQpaVwmR/DB
X-Gm-Gg: AYBFou28fDsZEL5VdoFw/2XWdv6+gKzP1mAH6Feq/++T50b2HRV6H0tPO3rjpbhUEGJ
	dNooxYlzueGAHXMxMhZ+t6Z67jUMl0WhLics3cLyxkA6o/XlpmVDWhk+ifB0NoAZw7/EA9jsdkD
	OhtfN3kgTeWNThd5/vLJLht+zhWLSzCSgZVGSYuDUC78ZJQ8XbQy1XxaQigkdtr/CGgM1tIOCti
	WC4fEPo50lhO2r83YnBU/KLQp+CTqpRVhzzWSgJoebWXAowguegh+Rit9YIGgTmIEYjm1BZPfu+
	zlPbbYO6RK18Cq+KoLppFXFaX4HNtnJc1elYVsFqCfmV6CqhDpT6WUYsd+p2y/qzfH+esElx356
	I0r7Cie5Y29TcFgly7SX4m7egOTSXVJEdstKny4h14FGaYFP2eWmVVnXIqcQRJS7OUgIp8VMuPO
	qyG3ENHI8u5r0uRLrdfeOUlTPdmnUaWx0nKnXr6HAdpInXI80Odx4FywluLGo0VvZI8Qh+iKIQN
	hfVOj6GCXck+Q7sWErI2A==
X-Received: by 2002:a05:7022:3a81:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-16a5afe51b5mr1363735c88.14.1791530678695;
        Fri, 09 Oct 2026 00:24:38 -0700 (PDT)
Received: from chitransh.. ([27.61.36.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm4600941c88.5.2026.10.09.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:24:37 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Fri,  9 Oct 2026 12:54:01 +0530
Message-ID: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008141610.42894-1-chitranshmandhaniya@gmail.com>
References: <20261008141610.42894-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Some Dell OptiPlex AIO 7410 (35W, board 01KP8D) ship with DELL0501 in
the ACPI DSDT (status = 0x0F) even though no UART scalar board is
physically present.  This causes acpi_video_get_backlight_type() to
return acpi_backlight_dell_uart, which makes i915 skip registering
intel_backlight.  The dell-uart-backlight driver then times out talking
to the absent board and the probe fails, leaving the machine with zero
backlight control.

A BIOS update fixes this on some models (e.g. OptiPlex 7420, board
0914RT) by setting DELL0501 _STA to 0, but Dell has not shipped a
corrected BIOS for the 7410 even in the latest release (1.37.0,
2026-05-28).

When the initial get_version command returns -ETIMEDOUT, fall back to
driving the backlight through the Intel PCH PWM registers (BLC_PWM_CTL /
BLC_PWM_FREQ / BLC_PWM_DUTY at MMIO BAR0 + 0xC8250).  The fallback
reads the BIOS-programmed PWM frequency as max_brightness and registers
a BACKLIGHT_PLATFORM device so that compositors (Weston, GNOME, KDE)
pick it up normally.

Tested on:
  - OptiPlex AIO 7410 35W (01KP8D) -- timeout, fallback activates, works
  - OptiPlex AIO 7420 35W (0914RT, old BIOS) -- timeout, fallback works
  - OptiPlex AIO 7420 35W (0914RT, new BIOS) -- DELL0501 absent, driver
    not loaded, intel_backlight works natively (no regression)

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
v1 -> v2:
  - Use __free(pci_dev_put) for automatic PCI device cleanup (Ilpo)
  - Replace 0x10 with SZ_16, add linux/sizes.h (Ilpo)
  - Name BIT(31) as PCH_BLC_PWM_ENABLE (Ilpo)
  - Fix double-space in block comment (Ilpo)
  - Reduce devm_backlight_device_register() to fewer lines (Ilpo)
  - Extract dell_uart_bl_init() for the normal UART backlight path
    so the probe function reads more clearly (Ilpo)

 .../platform/x86/dell/dell-uart-backlight.c   | 157 +++++++++++++++---
 1 file changed, 134 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..edc7cfe38069 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -13,10 +13,13 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serdev.h>
+#include <linux/sizes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -50,6 +53,12 @@
 #define MIN_RESP_LEN			3
 #define MAX_RESP_LEN			80
 
+/* PCH PWM backlight registers relative to Intel GPU MMIO BAR0 */
+#define PCH_BLC_PWM_CTL		0xC8250
+#define PCH_BLC_PWM_FREQ	0xC8254
+#define PCH_BLC_PWM_DUTY	0xC8258
+#define PCH_BLC_PWM_ENABLE	BIT(31)
+
 struct dell_uart_backlight {
 	struct mutex mutex;
 	wait_queue_head_t wait_queue;
@@ -64,6 +73,11 @@ struct dell_uart_backlight {
 	int power;
 };
 
+struct dell_pwm_backlight {
+	void __iomem *mmio;
+	u32 max_brightness;
+};
+
 /* Checksum: SUM(Length and Cmd and Data) xor 0xFF */
 static u8 dell_uart_checksum(u8 *buf, int len)
 {
@@ -267,32 +281,97 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
-static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
+/*
+ * Some Dell AIO models (e.g. OptiPlex 7410) declare DELL0501 in ACPI but
+ * have no physical UART scalar board. When the UART times out fall back
+ * to driving the Intel PCH PWM backlight registers directly.
+ */
+static int dell_pwm_update_status(struct backlight_device *bd)
 {
-	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
+	struct dell_pwm_backlight *pwm = bl_get_data(bd);
+	u32 duty;
+
+	if (bd->props.power != BACKLIGHT_POWER_ON ||
+	    bd->props.state & BL_CORE_SUSPENDED)
+		duty = 0;
+	else
+		duty = bd->props.brightness;
+
+	writel(duty, pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+	return 0;
+}
+
+static int dell_pwm_get_brightness(struct backlight_device *bd)
+{
+	struct dell_pwm_backlight *pwm = bl_get_data(bd);
+
+	return readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+}
+
+static const struct backlight_ops dell_pwm_backlight_ops = {
+	.update_status  = dell_pwm_update_status,
+	.get_brightness = dell_pwm_get_brightness,
+};
+
+static int dell_pwm_fallback_register(struct device *dev)
+{
+	struct pci_dev *gpu __free(pci_dev_put) = NULL;
 	struct backlight_properties props = {};
-	struct dell_uart_backlight *dell_bl;
-	struct device *dev = &serdev->dev;
-	int ret;
+	struct dell_pwm_backlight *pwm;
+	struct backlight_device *bl;
+	resource_size_t bar0;
+	u32 freq, duty, ctl;
 
-	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
-	if (!dell_bl)
+	gpu = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
+	if (!gpu || gpu->vendor != PCI_VENDOR_ID_INTEL) {
+		dev_warn(dev, "No Intel GPU found, cannot fall back to PCH PWM\n");
+		return -ENODEV;
+	}
+
+	bar0 = pci_resource_start(gpu, 0);
+	if (!bar0) {
+		dev_warn(dev, "Intel GPU BAR0 not assigned\n");
+		return -ENODEV;
+	}
+
+	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
 		return -ENOMEM;
 
-	mutex_init(&dell_bl->mutex);
-	init_waitqueue_head(&dell_bl->wait_queue);
-	dell_bl->dev = dev;
+	pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, SZ_16);
+	if (!pwm->mmio) {
+		dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
+		return -ENOMEM;
+	}
 
-	serdev_device_set_drvdata(serdev, dell_bl);
-	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
+	ctl  = readl(pwm->mmio);
+	freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
+	duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
 
-	ret = devm_serdev_device_open(dev, serdev);
-	if (ret)
-		return dev_err_probe(dev, ret, "opening UART device\n");
+	if (!(ctl & PCH_BLC_PWM_ENABLE) || freq == 0) {
+		dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n", ctl, freq);
+		return -ENODEV;
+	}
 
-	/* 9600 bps, no flow control, these are the default but set them to be sure */
-	serdev_device_set_baudrate(serdev, 9600);
-	serdev_device_set_flow_control(serdev, false);
+	pwm->max_brightness = freq;
+
+	dev_info(dev, "Falling back to PCH PWM backlight (max=%u current=%u)\n", freq, duty);
+
+	props.type = BACKLIGHT_PLATFORM;
+	props.brightness = duty;
+	props.max_brightness = freq;
+
+	bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, pwm,
+					    &dell_pwm_backlight_ops, &props);
+	return PTR_ERR_OR_ZERO(bl);
+}
+
+static int dell_uart_bl_init(struct device *dev, struct serdev_device *serdev,
+			     struct dell_uart_backlight *dell_bl)
+{
+	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
+	struct backlight_properties props = {};
+	int ret;
 
 	get_version[0] = DELL_SOF(GET_CMD_LEN);
 	get_version[1] = CMD_GET_VERSION;
@@ -300,7 +379,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 
 	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
 	if (ret)
-		return dev_err_probe(dev, ret, "getting firmware version\n");
+		return ret;
 
 	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
 
@@ -318,13 +397,45 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	props.max_brightness = DELL_BL_MAX_BRIGHTNESS;
 	props.power = dell_bl->power;
 
-	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight",
-						     dev, dell_bl,
-						     &dell_uart_backlight_ops,
-						     &props);
+	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, dell_bl,
+						     &dell_uart_backlight_ops, &props);
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
+{
+	struct dell_uart_backlight *dell_bl;
+	struct device *dev = &serdev->dev;
+	int ret;
+
+	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
+	if (!dell_bl)
+		return -ENOMEM;
+
+	mutex_init(&dell_bl->mutex);
+	init_waitqueue_head(&dell_bl->wait_queue);
+	dell_bl->dev = dev;
+
+	serdev_device_set_drvdata(serdev, dell_bl);
+	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "opening UART device\n");
+
+	/* 9600 bps, no flow control, these are the default but set them to be sure */
+	serdev_device_set_baudrate(serdev, 9600);
+	serdev_device_set_flow_control(serdev, false);
+
+	ret = dell_uart_bl_init(dev, serdev, dell_bl);
+	if (ret == -ETIMEDOUT) {
+		dev_info(dev, "UART backlight controller not responding, trying PCH PWM fallback\n");
+		return dell_pwm_fallback_register(dev);
+	}
+
+	return ret;
+}
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
-- 
2.43.0

