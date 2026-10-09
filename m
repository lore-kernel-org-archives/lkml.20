Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA573DC4AE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548847; cv=none; b=A0WspI+PxRRVTRWNy/k1lqWTasfY0jjAY1O9y1jB61ZL4Je9CpUwlpWVS71di3rSvLo9ABgLrDB06BkfIidg+iecV/FVcuwJMkTRgQWTshHxT9/db5/GrMphT7Bwp0872nwW0mhYjOoBhJjeA9UjWmcJCA8CoxdJy0sRLdLppeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548847; c=relaxed/simple;
	bh=yQL6vWb/BG3Uve71UO4ZlJ5qUXIek0So4bhaBdvS6dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYhJNfKCOpBmkmtdRHeLykY9xy9XLsIS/LxCr3qdfoxD8sAu0/zhV2o49yIvpOtDCcgl7oRkE4H0xEqDrB2ptMnD3ZXBXYvY/1qirH7fGZVQ265FtCJ/yYYSfXhvXz7Vg0CD2gXWwcMJtwbiRRFle4gVSAe3AVI2h+VdyVrq2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czGq60q7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czGq60q7"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2019840a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548837; x=1792153637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZBUg/HubW0aIyjM3YpP6WQYya691V6s6+nB/N/24wI=;
        b=czGq60q7dmlfcW1BxdSLzzLDcrQcIhvYWQ+4VwFL+4EIUtuTRU5HPIR1usfTZWjy0j
         JvA/8aIO1ydkhn88rLl9DQsWQGK0GNk5UUGBjdBOrMZXrr2szIKXBItmcL7gX6ppa3J/
         AjurtsLPFOH/iDO7SVL2e/HiuHz0kBw/VP1PvKbu8muXIer++5+AxXAGX283bPls1JhP
         OguL7DM78ps4ZZ2SIMnS4lTSwqrRoZwi4WtODt1mdG0kxdhdQKMt3PNQD4RyxJSh3mxC
         rD00RgR4k7T0hfcGOJFjDXrBxwK9amoRSBDHZSRi9r8lcH5pcau5S8qjq02vuAcTCrSc
         k5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548837; x=1792153637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZBUg/HubW0aIyjM3YpP6WQYya691V6s6+nB/N/24wI=;
        b=D6EJwKSwU+NIX1NnXK0jV/ii8Dd5teOZZeBYmwfB9TyHb+FhtTMYwbHNCisfnYOSu9
         GWFm1Kygxp3To3FrwhD7Gtvd2o6U9t0Y683vjNMLgD/qSExhIN91oY10Id8mPznQv8tX
         wirBpsKIeK2OwgRoazYIAa2LQx1vL5CuO/V9Z0NeOptmuc0LqkR+Pzqjs0asg27mGn2B
         StGaxV5EHbZ1WkjjsbAXYTkLJ0Lp7FfNHDdg0O05uLZnSAXCgRTjgDji4T3U4vawCu+Q
         45vuyg6UN2HeGjcgZYMvZWtFxC1EliplqVaZraFmdtzGRYANAqQrMWMNxif8TlVs9qac
         P0ww==
X-Forwarded-Encrypted: i=1; AKwUvBwzeEF6TFC9AUfeCOmhqgjX/baQj/Byi7RhpoIe1XcD0i6G/NRxTP5xvgPT++xpPlL4GxlCItkgp57QRiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH2Jnx25KfZqNWvrQ+swZ83RlVc639U/wpiocupZcawLDPqm43
	+6UIYFOpdTvXJYvOkWF0qPFFzQJ/3WHT3qqx2JMXWx6rE5jcF6pAFfZs
X-Gm-Gg: AYBFou1hUOoDqytkSa+jTySiqZUN3zl0/wlwCMEwYrFOa/1TmFY8l43WRarhBiC6GmP
	IJmX9VFEj7h718rKcS58qxsxFvk1lKfLywJybpdPUzfiLGSQCTr6FkIWZivwwJyxKtJUhDU3Lm+
	rx0hFFJz0LpFNPYj2x9woHaKZvXyzPah+m7t0Tcfruhzhls1IZF+uB3wxMRLOz6+gR+WtE4QU4v
	utTbIqjajflTtn90eOQDlEU+9jdCy7xjem7gFesTBuOOjeq4DzYFOp4mk3yibUSlNzpCCslAMYM
	7NO8oAsYUnSoMHtB1hxi/c9LgBQiQqcei1fz5oq127HAmFf3TA1bcOMPZZiOFoQiwaX9kHyn5pT
	26Sg+TuPr8UEg51lsrU3+pIUmj5dHZBW8Fi7lsdfx4GR8x2oB7x/RKbMnEGzfWJo2kHUzfxGhwy
	HFJrw0JzY04QYbFk1uMBWXPtdVFswiIBAES5w0fAMw2zaNeQOUnBbEIXWD2ki/NZcDZQIKThmn9
	XjnWM0084t0ohDkVZjLl7KNxBY=
X-Received: by 2002:a17:90b:1850:b0:3a6:d94d:e147 with SMTP id 98e67ed59e1d1-3ab3a94fffemr1391382a91.15.1791548837289;
        Fri, 09 Oct 2026 05:27:17 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9397:bb62:5cb7:971b:ead7:8dc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm3426729a91.7.2026.10.09.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:27:16 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 2/2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Fri,  9 Oct 2026 17:56:02 +0530
Message-ID: <20261009122602.56624-3-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
 <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
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
  - OptiPlex AIO 7410 35W (01KP8D) -- UART times out, PCH PWM fallback
    activates, backlight fully functional via sysfs and compositor.
  - OptiPlex AIO 7420 35W (0914RT, old BIOS) -- same timeout and
    fallback, backlight works.
  - OptiPlex AIO 7420 35W (0914RT, new BIOS) -- DELL0501 absent, driver
    not loaded, intel_backlight works natively (no regression).

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 107 +++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index e3b7f1beda5b..3179f3a3f094 100644
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
@@ -267,6 +281,91 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
+/*
+ * Some Dell AIO models (e.g. OptiPlex 7410) declare DELL0501 in ACPI but
+ * have no physical UART scalar board. When the UART times out fall back
+ * to driving the Intel PCH PWM backlight registers directly.
+ */
+static int dell_pwm_update_status(struct backlight_device *bd)
+{
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
+	struct backlight_properties props = {};
+	struct dell_pwm_backlight *pwm;
+	struct backlight_device *bl;
+	resource_size_t bar0;
+	u32 freq, duty, ctl;
+
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
+		return -ENOMEM;
+
+	pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, SZ_16);
+	if (!pwm->mmio) {
+		dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
+		return -ENOMEM;
+	}
+
+	ctl  = readl(pwm->mmio);
+	freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
+	duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+
+	if (!(ctl & PCH_BLC_PWM_ENABLE) || freq == 0) {
+		dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n", ctl, freq);
+		return -ENODEV;
+	}
+
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
 static int dell_uart_bl_init(struct device *dev, struct dell_uart_backlight *dell_bl)
 {
 	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
@@ -327,7 +426,13 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_baudrate(serdev, 9600);
 	serdev_device_set_flow_control(serdev, false);
 
-	return dell_uart_bl_init(dev, dell_bl);
+	ret = dell_uart_bl_init(dev, dell_bl);
+	if (ret == -ETIMEDOUT) {
+		dev_info(dev, "UART backlight controller not responding, trying PCH PWM fallback\n");
+		return dell_pwm_fallback_register(dev);
+	}
+
+	return ret;
 }
 
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
-- 
2.43.0

