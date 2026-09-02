Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89E233954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319472; cv=none; b=g54BpOJyP0nEEowt3ANm6Cp0CflVvsq/087a2qExsxFc1b7ehsmQF2s6ODBmsXlP1p0l2Kk67uHIC6iaP0BG0Jy2jeQWQS0hYI5ZTp/1+YyG6sWkS86c3vKLYvao3ZINA4enxIUcRwif/TbQLdAbu/GBFY0tVUQX+JHC/kb89iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319472; c=relaxed/simple;
	bh=Uv646sF/ZBqSSzqzux9k+csOS7JoBIzUCjrtu2XHCPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=an3yEmHB8/4qmK+EQTMvro7Rxgb2P9ocx/lZfnECnA62T2dkEBU4kDltpnhF6uuLEwLl+SUwlrc/80EV2R4rLQ79IhS/Gxo1pJlYcR+wq0b6mnhJbJgOUM/2n07W2L9ZSy/KLvnHkdgzVA2Q8Uo6uinRUdXUJbIVeTUgZVdGOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckw1CpVb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckw1CpVb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d7195706f1so5870255ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319470; x=1788924270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=esnm4mjsWTc7E+k3jp0g5qe0tL8q+PLWmjZ6jP3uo/U=;
        b=ckw1CpVbW1upMTEyJqUUOSDaiRMxYDS8jEt8NXxPuIZiqcHQ2HTVg/zMObuPk7eaik
         NYCfPfVwpexWsZyC5FPudGWDKlVkhtsythG4Ziw/2JJLUwQkriwkxgkZ6ZBJbMrbBEoe
         Ha7mF1NA3rFjWzqz85FZ0vP9elIBc4rtxQQek/pAZwDe0OT7ED+fQLMtFOdwPDiPixMq
         1rWlC9SoMTBp71YTb/QXFqXOrjGlKcLv8AIWcrGMYNm0WEyEXzchW05biau/YD1SuEgb
         KKXiXIBGLqE+vnsnTi5GebDVbxg3Droa6IYsCY5x6BZkFMahscTNGZUnezW/fTaeCq3I
         8BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319470; x=1788924270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esnm4mjsWTc7E+k3jp0g5qe0tL8q+PLWmjZ6jP3uo/U=;
        b=QHH/CAF9fAHN36v4COjuESYMzKOnMEyfFnosQRNkha/BpnFO2L9AJThxZfABOIHGNo
         q64Qym3LjcARTAhKhayCUQrfiFeXFgnaf2bJQotY0nv8l+RoakS4niXwiQRrxxmJqGAr
         +p41BGta7Xfk0IVgFb6q7ycCtNIztQJHmEapi6ZJ5hVBQApgkMsKFV2aSTSDELt+XOWS
         vWrPjJnpRPkN1FBjhfBSyYAc3/dbkQjYH/dF9QWy9Kp0c97r483y1hXIDBNHxbQLIxG8
         3Ymd+ukarJGr1hFQU2rwMRub2qiof14DoPkVn2dMXq3iHd+8+rO30nTqi1i2iUrSPNSU
         iqew==
X-Forwarded-Encrypted: i=1; AKwUvBz5CBDGD42oNxT/KWaO4d4aRF2wxybn+cvZ2NSQj3V1RcgIOWRpGlLCeFUdasEGUQZUq8gOxLqS6bMv5Ag=@vger.kernel.org
X-Gm-Message-State: AFuF++npmedJvugVzfYdRDB1o1c01feyPgJAYu2EmQM7f+jR6RWS2Uxd
	J6UInEt1HShDtRDxXBBDII5A3fVTDn2Ak2lVU8SWAelKy3F7t+E2botT
X-Gm-Gg: AYBFou3Bf+1Es9IkqVx50hriw5eRUnREfRV/9hdURePRah31+bxtnjBdUG/HWYKQxOu
	QRAN6wC8jDQtUdXK5UDJIoTLYASENYbNGOhJ2+oND15ot/kMOf3DFMxb5Pm9bOunVnOYgtZfmYU
	trhPZu5MtWrQCQIY1Q9oZvUvbzJyVGn08yVHkEas3YeeK7/GRkf4KyBvJiG311JT0SjdDVqcRCf
	kiU7skxIbM/QV57eZs5j98clHNEg/9nMUZbcpYvxvvahCAn7hGkwozxLYwMgF2W/WE3Dqd1ofHm
	nJARBFX71LX5lGapjHJk5qUuXhA8xdAs41GVB6rZe+VerKgCZCYEKsaM2fBHTne9G2yvZAc5hAz
	ZmMBhXOYidFMkw/NM2Mc99zqUmJJEXcDttkBYsjHGDp1H0xAkCxvE71pFZJVJont0nWLwPXbGLA
	jf+Jy20d9pR2YhyVN43irmnRhiaR1G7nO8nOVzVAewykI0SZmkhlU=
X-Received: by 2002:a17:90b:39ad:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39aee13cbc2mr2140712a91.16.1788319469762;
        Tue, 01 Sep 2026 20:24:29 -0700 (PDT)
Received: from mizar ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f0ca7sm2458432eec.8.2026.09.01.20.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:24:29 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Idotoho Reimon Simanjuntak <idotohors@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: asus-wmi: fix FA401 series keyboard sleep strobe
Date: Wed,  2 Sep 2026 10:23:52 +0700
Message-ID: <20260902032353.16106-1-idotohors@gmail.com>
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
(max) brightness when sleep backlight is enabled.

Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather than
ad-hoc dmi_match() calls. Cache power-state flags from sysfs writes and
initialize the cache to the default enabled state during probe, so the
workaround also applies before userspace writes the attribute. Do not add
a module parameter; the sysfs power-state setting is authoritative.
Use the standard dev_pm_ops .prepare callback rather than overloading the
Ally-specific LPS0 ops. Define self-documenting macros for the TUF RGB
state bitfields at file scope.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
Changes in v2:
 - Cache RGB power state flags from sysfs writes instead of attempting DSTS read.
 - Initialize state flags to enable all modes during driver probe.
 - Move TUF_RGB_STATE_* bitfield macros to file scope.
 - Drop module parameter in favor of DMI quirk + sysfs control.
 drivers/platform/x86/asus-nb-wmi.c | 14 +++++++
 drivers/platform/x86/asus-wmi.c    | 61 +++++++++++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 75 insertions(+), 1 deletion(-)

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
index a65090429..a0b678272 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -129,6 +129,18 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
+/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE) */
+#define TUF_RGB_STATE_CMD		0xbd
+#define TUF_RGB_STATE_SAVE		BIT(8)
+#define TUF_RGB_STATE_BOOT		(0x03 << 16)
+#define TUF_RGB_STATE_AWAKE		(0x0c << 16)
+#define TUF_RGB_STATE_SLEEP		(0x30 << 16)
+#define TUF_RGB_STATE_KEYBOARD		(0xc0 << 16)
+#define TUF_RGB_STATE_ALL_MODES		(TUF_RGB_STATE_BOOT | \
+					 TUF_RGB_STATE_AWAKE | \
+					 TUF_RGB_STATE_SLEEP | \
+					 TUF_RGB_STATE_KEYBOARD)
+
 #define ASUS_MINI_LED_MODE_MASK		0x03
 /* Standard modes for devices with only on/off */
 #define ASUS_MINI_LED_OFF		0x00
@@ -308,6 +320,8 @@ struct asus_wmi {
 	u32 nv_temp_target;
 
 	u32 kbd_rgb_dev;
+	u32 kbd_rgb_state_flags;
+	bool kbd_rgb_state_valid;
 	bool kbd_rgb_state_available;
 	bool oobe_state_available;
 
@@ -1120,8 +1134,13 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 				 const char *buf, size_t count)
 {
 	u32 flags, cmd, boot, awake, sleep, keyboard;
+	struct led_classdev *led;
+	struct asus_wmi *asus;
 	int err;
 
+	led = dev_get_drvdata(dev);
+	asus = container_of(led, struct asus_wmi, kbd_led);
+
 	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
 		return -EINVAL;
 
@@ -1138,6 +1157,9 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 	if (keyboard)
 		flags |= BIT(7);
 
+	asus->kbd_rgb_state_flags = flags << 16;
+	asus->kbd_rgb_state_valid = true;
+
 	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
 			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
@@ -5153,7 +5175,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
-	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -5166,6 +5187,19 @@ static int asus_wmi_add(struct platform_device *pdev)
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
+	if (asus->driver->quirks->kbd_rgb_state_quirk) {
+		asus->kbd_rgb_state_flags = TUF_RGB_STATE_ALL_MODES;
+		asus->kbd_rgb_state_valid = true;
+	}
+
 	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
@@ -5396,11 +5430,36 @@ static int asus_hotk_restore(struct device *device)
 
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
+	    asus->kbd_rgb_state_available && asus->kbd_rgb_state_valid &&
+	    (asus->kbd_rgb_state_flags & TUF_RGB_STATE_SLEEP)) {
+		u8 brightness = 0x80 | 0x03; /* level 3 (max) + light-on bit */
+
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
+				      brightness, NULL);
+		asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
+					  ASUS_WMI_DEVID_TUF_RGB_STATE,
+					  TUF_RGB_STATE_CMD | TUF_RGB_STATE_SAVE |
+					  asus->kbd_rgb_state_flags,
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

