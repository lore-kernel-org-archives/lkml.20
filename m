Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC21326928
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314002; cv=none; b=GzKNlFDBI9SMe9COqV6WE7DSWza+ZOHQkSG1J8bbKcCEjLoopawMMcZuNHgUdty4uvTa/73gBnPJ4p63r5lanFZySZQlqyXDjuu1y9pw2ikLugUTwB+7avTnG8XwYOxc3fkErMoToK8AJATaWg8cs1v1IoPeuARq7Uk+WPqNrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314002; c=relaxed/simple;
	bh=U1WmY9roIWOAlngME8p/4681it92uLDHXzUx3irgDl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICt3NFJTlja/SW0RwjV4/U1832LIRTUS5DSlrilaCHDVxyKhwxp5Sjb/Qh//2qJ39cynORGPSoGQVqW96I9UQ4j9Wzfrm/9hisXqDkPWkuO13pzfDPj7cbKHF98vsLUUqiUApWvdiUJS0RW1qImqAdz/ObJwViajONoFnKVXjKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsgKt37W; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsgKt37W"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39682983a0fso628624a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788313994; x=1788918794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvVGub2hsicLqXSI/3c3voFU7S2m/xG+KP69Hl1dWlU=;
        b=LsgKt37Wz7qQ4HuErL3stzt1cmeILX7ThZ4+5omaVB0Dm4KA6SyuszMdP+wAkHDy/p
         wEifI/0+zjqM94PUPnrYwACPcxJtxJoOwlCm3kbmiucNW7fTLlINdZ96180tRM7Xjp2j
         HE55rR6lUQ0W7Z2r5hwglczHdPZmL4zlG2YMxVevC8qFy+StWBjN7zKaM751HC5vSdj4
         FUHRyEeeQsXkB27m6x9SVJ6y5DuOdpEgc6Fr47SNop0vgtXDSNWKEZLLn/AYV4NIYbul
         Fw8zqfYVL5mOHCjQdXZS3bncSKMtcbsgElmTItStaeiEoziH0lm8MCUmHltkO66ECY3/
         j8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313994; x=1788918794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvVGub2hsicLqXSI/3c3voFU7S2m/xG+KP69Hl1dWlU=;
        b=N6/H2pDfkPMFmxxv1QTFW10dIj09eszPBU6xu/7nTA5Egt5vE7svTohEY/HPRLv/9L
         u/CV/kQFKqpxp8qjIeBQYZgfMbmBltpVDwTMLd1xklNfegzLRgILJY+UsidK64RlAfKZ
         wpRe7mLQvCBMhoZ3HwwY8CSrrvY6WJ2dbgxZ2o6agRoy/TasJ5yctE2jClqAf56habY8
         hU5kvcKerQ5/+jANmBeuInhQrVMIAykYk0hOsMnUor1yMAqO9xE2yzy+ahPql5uABQm1
         PCchKt8uFmq8LZyfjaHDl+/xnLi1a/n7bHbDZHyTEKiih0XoZr4m3igR1VuPcCMDe/8X
         yPmA==
X-Forwarded-Encrypted: i=1; AKwUvBwsZt+a+mlVHrolU5irG28jfMoQ9hU89nmSVbhWeWRdL0GIooyEIwFiMpH7I6/LAeIGJ663eaTWl0x0PBs=@vger.kernel.org
X-Gm-Message-State: AFuF++n7wD0cFAYLN/wvsxuyFifO9VTdaT2jMa5AizAxObuUu6DAb8MT
	CDiOSgEoXUznJOgfWwDe1WKTX7orvRA1+VhKtHS0Vk8MbKX8jaNDiIHA
X-Gm-Gg: AYBFou0cp/7/A8N5kYzPaCcAn6amfEwi6rx0fKyGhmIw/u6p9a2G35fTji/p1e7lEKh
	XIdtOCkRPuuHX42ii63FK/R/89OqoieKI46waB1PUnRSA8G50WyNlVQSBTj6q/XKy2VEkSVreiz
	8a2L6BrwCakRNfoG2T99ig4AEvxfjoRU774fQJzuvBuryjfHpoqxhyWveXaX1PVEybiTrmLykyZ
	Okofj9iqej8VWWrPR5a48uOyK31UAs2/hT5VAyUnh/GfQ+8BO2OjQkeU7I+V7w5Df0OKA3zzADu
	fzO/KKgnV8WULbnXfqiahX+tfXVcFXDC1wNVyrugDDfmw15bNhsqSrQDnLrzude4DtA3pvpizDU
	eaC0SHZy05EYHdGnid/NnskI+6N3zfJt7ohIlXSqot3iEpdF+jQS291NL9qiSaoVQQ/3a46eD6S
	WFlNjKRJ/dfsH+0fkdV4kvGXjBgh+INZVF+lKXB9m6ZoQoBhi+GOU=
X-Received: by 2002:a17:90b:46:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-39aedbfe60amr2194340a91.0.1788313994349;
        Tue, 01 Sep 2026 18:53:14 -0700 (PDT)
Received: from mizar ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76622csm8861666a91.11.2026.09.01.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:53:13 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Idotoho Reimon Simanjuntak <idotohors@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: fix FA401 series keyboard sleep strobe
Date: Wed,  2 Sep 2026 08:52:55 +0700
Message-ID: <20260902015256.23434-1-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FA401 series accepts the TUF keyboard RGB power-state command but does
not advertise the device through the normal DSTS presence probe. Register
the state attributes for this series and re-assert keyboard brightness in
the PM prepare callback so the EC enters S0ix with the correct state.

Without the brightness re-assertion, the display server blanks the keyboard
before the kernel suspend path runs, leaving the EC with brightness=0 and
preventing the sleep strobe from activating. Because kbd_led_wk may already
be zeroed by the display server at prepare time, always re-assert level 3
(max) brightness; the sleep strobe requires a non-zero brightness to
activate.

Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather than
ad-hoc dmi_match() calls. Use the standard dev_pm_ops .prepare callback
rather than overloading the Ally-specific LPS0 ops. Define self-documenting
macros for the TUF RGB state bitfields at file scope.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 14 ++++++++++
 drivers/platform/x86/asus-wmi.c    | 43 +++++++++++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b16..fb06013ca 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 = {
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
 };
 
+static struct quirk_entry quirk_asus_fa401 = {
+	.wapf = 0,
+	.kbd_rgb_state_quirk = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -163,6 +168,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 }
 
 static const struct dmi_system_id asus_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. FA401",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "FA401"),
+		},
+		.driver_data = &quirk_asus_fa401,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. Q500A",
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429..8d7c9e8bd 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -129,6 +129,14 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
+/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE) */
+#define TUF_RGB_STATE_CMD		0xbd
+#define TUF_RGB_STATE_SAVE		BIT(8)
+#define TUF_RGB_STATE_BOOT		(0x03 << 16)
+#define TUF_RGB_STATE_AWAKE		(0x0c << 16)
+#define TUF_RGB_STATE_SLEEP		(0x30 << 16)
+#define TUF_RGB_STATE_KEYBOARD		(0xc0 << 16)
+
 #define ASUS_MINI_LED_MODE_MASK		0x03
 /* Standard modes for devices with only on/off */
 #define ASUS_MINI_LED_OFF		0x00
@@ -5153,7 +5161,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
-	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -5166,6 +5173,15 @@ static int asus_wmi_add(struct platform_device *pdev)
 		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
+	/*
+	 * FA401 series accepts the TUF RGB-state DEVS command but does not
+	 * advertise the device through DSTS. Keep the normal DSTS probe for
+	 * other models and force registration when the quirk is set.
+	 */
+	asus->kbd_rgb_state_available =
+		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
+		asus->driver->quirks->kbd_rgb_state_quirk;
+
 	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
@@ -5396,11 +5412,36 @@ static int asus_hotk_restore(struct device *device)
 
 static int asus_hotk_prepare(struct device *device)
 {
+	struct asus_wmi *asus = dev_get_drvdata(device);
+
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
 		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
 					   ASUS_USB0_PWR_EC0_CSEE_OFF);
 		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
 	}
+
+	/*
+	 * The display server may blank the keyboard backlight before the
+	 * kernel suspend path runs. Re-assert brightness and power-state
+	 * flags so the EC enters S0ix with the correct state. Always use
+	 * level 3 (max) because kbd_led_wk may already be zeroed by the
+	 * display server at this point, and the sleep strobe requires a
+	 * non-zero brightness to activate.
+	 */
+	if (asus && asus->driver->quirks->kbd_rgb_state_quirk &&
+	    asus->kbd_rgb_state_available) {
+		u8 brightness = 0x80 | 0x03; /* level 3 (max) + light-on bit */
+
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
+				      brightness, NULL);
+		asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
+					  ASUS_WMI_DEVID_TUF_RGB_STATE,
+					  TUF_RGB_STATE_CMD | TUF_RGB_STATE_SAVE |
+					  TUF_RGB_STATE_BOOT | TUF_RGB_STATE_AWAKE |
+					  TUF_RGB_STATE_SLEEP | TUF_RGB_STATE_KEYBOARD,
+					  0, NULL);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b9..69d224774 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -52,6 +52,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool kbd_rgb_state_quirk;
 };
 
 struct asus_wmi_driver {
-- 
2.55.0


