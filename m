Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424211;
	b=XtBgHcog94KUWMIJQnfdq9b3ShOF2jBMz0eH6R/qcTUdqVinlKGBihih3khzT1Dv07fg
	 4YQ9R37sZxPimRpabsx3rQ0jIRkuEWXdsqJwiSQn+mdWWCGbDtHUB7GWtBhUGZY15SmOj
	 0w8c9BJpho97Hpr7Cgcjn1/+BhRl3lceH7yyvQ/CO6C+MYUxV+nRBShiNm+QVknSLMlQb
	 k0tabfEHcg6PqZo6UsGM1spGCocLFYdGSJwj/UBfUH+KmA6rrMcG05INqtkmrbfI2hM2m
	 YDMGB/q46uknPGdPHziz8zOzqeMXnjy/+jmtgodAt26UYAasFGdsc5eCB0O5e4A31DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z7pXhh8tp0AlSwDjlrYsLtv9RgjApMzLU3oJCHQgM44=;
	b=NI5dOborJLxEJK0yWE1bXRcyWLXHSeZeZM1z8H+c2JHn9jyPtAiDJvN8FuRlvju5+jj2
	 7h6us5lC9WDI3xpAxy76+3loI2OaFtzwGh1502qPl6nIjLAyHytveORWweV3zMSGtawGt
	 uaQR+9pbmuRg7ybghM6k24JVVCv56WZiqL7O9o/ekhX1igyxLFHCQw54RlBeJ8MFTnAdV
	 sSh/WnkwLRmjesl9dlLaDUgY12lwzCgM8Do3kOPfyllqU1CjHyK2sFHp9Cucj9uIwi0+a
	 LBy9ZmC09oba1R6/VdMZfURmgp/kdgESvL5XrQD9pfKutjF8R7QTUzUqQ1SUIhjuvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdguYSzp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF093606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF093606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdguYSzp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e10a70540so2134463f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424209; x=1795029009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7pXhh8tp0AlSwDjlrYsLtv9RgjApMzLU3oJCHQgM44=;
        b=vdguYSzpvoO2gK8AhXE/ebduyeOn7verKNkkx9pTlJ+KJDRuEC2yIx/htcf6X00Nht
         rRn3LR4OG5w/ik2cqXIDxSInm/wT5DYq5bUPQJ2n7fBgFV1KZ3KrKTNGNRC9yTtguKOG
         ubsOqIAn++TNCVgZ2EBdsNNRKV5xciK6XNaFR7n9XPocvWnQBuqB49XRmCskzuobWtPz
         /Y0UAgjRsNwx2UVVX/dwqkE3rRA83zScHKacnqvqo7IYnkOjpaFx6u4ozLmQG7ipjTjk
         2++GMb5sjhlvNZNkjKGqAX3l4Ewre72Kc+3IpGd40+L2axzecP4V0QkpPAB7ODapp8nQ
         DZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424209; x=1795029009;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7pXhh8tp0AlSwDjlrYsLtv9RgjApMzLU3oJCHQgM44=;
        b=vuUuYV3MmbnqDNXou/faJzIBph2r94/xuA+/cy5ydf5c4O+15khYKp+xlmRll0syAi
         2VGkhyS7ZSFTgVPgxkjLsvRnpqiMdOfYZ9dv9gGkppTzQd8xBhPcKlZ7Hj9uVtPDMFoL
         1U9ogSxcqXjkurZuZ1zNUEs9G4g4ql1rBn3Zn4QhWBp19QpL77oY3cDyKkBFdHcIwxnY
         RIsVivfBpAvqBLkzhHOoKTylFRygb36IXRIGH8W6cr5heLixpTOHVs2NJZFqiJ60TgN6
         NcGAO9LYeRA7dyJFt/JL87G09syH/dVdYy8tOUiRJRtmS5FrrAh7d7AZvAsvbmfTeHyN
         nuag==
X-Forwarded-Encrypted: i=1; AL+hErEOXrzJ5Ne1w0M4SSG4/bi20eem7ocLg53qZpUjA7g61sYFqGVW72uZBX1e9hA4zQJkFuzb0dtjn2aSkmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Xn5Erl0ErIuVqDq75FNVecg7UUMAB6L1baSmIzVccb6tjdtl
	3ueQmoRYZaWsB6nq74TypAzATHyPs1M9P+IYCQH7sJCx5p8FIV1YMruY2f4hiltT
X-Gm-Gg: AYBFou0wRi5/5N9nymC8UdfXJWOt7kohobV2HfYJArPNT/mMmjkxXMCqswSTXtids5Q
	B2M5G++LtL5ymJm3TqiHuy14yY54Facbe9xv3d6AqPVzAcHYuI9fRAiJQSeHR9SL2iBjV8hMHTg
	RY0869hEro3cvnGOJCM2XFVGZvJ14n9oNKWWBhERssEJg7xUfSmka/CGdK4OmuFEWDbAZq3gltV
	RVdRvPvsYkFKVogYI7wFtsGSNyK4hHjhDTdF4CmtqyCje0lUacLdM0Y2U4UebYudgPkkXJtvzd5
	A447tUG94cJNr9p0o9Gv6b6xdSHxuJClYZ1t8r9GDD3xCWfaC4ObSuLPauN2wiOQeSoXRYH88FL
	XnXxXp3TAoR32nBNUALrEpl9+eFT70VRFhferKgMdaMSLjjLniBM6DzJUobneVqzkaFUhSXSAEK
	G2V8OnDg0PeIalCUtWEJKxztcyX+pnplkArOwC1u/K9g0Q5ENRqKto93Pn8YP4J+hPiW5e4qjqB
	FvGhrIKZtfAbFLt0wQeNpgGZKlN7s/ry7vT++IaxS19W9y2mSI4rNortAqS1HXd2k0bYB+DCgy2
	tjT0E3f01vKhpVgPoIZ0lw==
X-Received: by 2002:a05:6000:2c05:b0:492:a72:92fc with SMTP id ffacd0b85a97d-499c70828b4mr5633077f8f.44.1794424209122;
        Wed, 11 Nov 2026 11:10:09 -0800 (PST)
Received: from acer ([46.196.225.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm13187128f8f.51.2026.11.11.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:10:08 -0800 (PST)
From: Batuhan <tuugspeedman@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] platform/x86: acer-wmi: Add 4-zone RGB keyboard support for Nitro AN515-58
Date: Wed, 11 Nov 2026 22:09:24 +0300
Message-ID: <20261111190925.7250-1-tuugspeedman@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Batuhan Güvener <tuugspeedman@gmail.com>

Add support for the 4-zone RGB keyboard backlights found on Acer Nitro
AN515-58 laptops.

The hardware operates via a dual-control mechanism: global hardware
brightness is managed by the EC via RAM offset 0x31 with a range of 0 to 4
(where 0x04 is maximum intensity), while per-zone RGB color control is
handled via WMI Method 6.

Exposing max_brightness = 4 to match the EC hardware level causes the
led-class-multicolor subsystem to scale color components down, restricting
the palette to 5x5x5 (125) total color combinations. Keeping max_brightness
at 255 allows fine-grained 8-bit per-channel control from userspace, though
it creates a dual-control scenario where hardware EC brightness and
userspace multicolor brightness operate concurrently (e.g. EC brightness at
4 while userspace intensity is 0).

Additionally, when the system resumes from a shutdown or power cycle
while brightness is set to 0, the hardware initializes with 0
brightness but cannot derive valid multi-intensity values. To ensure
consistent state evaluation, it defaults to max intensity
(255, 255, 255 - white).

This implementation builds upon initial findings and reverse-engineering
efforts by Dirga Yuza and open-source community driver implementations.

Link: https://lore.kernel.org/r/20260503062131.158944-1-dirgayuza123@gmail.com/
Link: https://github.com/0x7375646F/Linuwu-Sense
Link: https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module

Signed-off-by: Batuhan Güvener <tuugspeedman@gmail.com>

---
Changes since v1:
- Clear non-English comments
- Rebase onto linux-next
---
 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/acer-wmi.c | 264 ++++++++++++++++++++++++++++++++
 2 files changed, 265 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4154045595d0..f6af91ede346 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -169,6 +169,7 @@ config ACER_WMI
 	select LEDS_CLASS
 	select NEW_LEDS
 	select PLATFORM_PROFILE
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf5138..a374f4a6c979 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -20,6 +20,7 @@
 #include <linux/fixp-arith.h>
 #include <linux/backlight.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/acpi.h>
@@ -36,6 +37,9 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/mutex.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -77,6 +81,41 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
 
+/*Method IDs for 4 zone keyboard RGB*/
+#define WMID_GUID4 "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
+#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
+#define ACER_WMID_SET_GAMING_DYNAMIC_LED_METHODID 5
+#define ACER_WMID_SET_GAMINGKBBL_METHODID 20
+
+/*
+ * Gaming keyboard backlight enable command payload:
+ * Bit 3: Controller enable flag
+ * Bits [43:40]: Target 4-zone keyboard backlight interface
+ */
+#define ACER_GAMING_LED_KBBL_ENABLE	(BIT_ULL(3) | (15ULL << 40))
+
+/*
+ * Method 6 Gaming Static LED payload format:
+ * Bits [23:16]: Red intensity
+ * Bits [15:8]:  Green intensity
+ * Bits [7:0]:   Blue intensity
+ */
+#define ACER_GAMING_STATIC_LED_RED_MASK   GENMASK(23, 16)
+#define ACER_GAMING_STATIC_LED_GREEN_MASK GENMASK(15, 8)
+#define ACER_GAMING_STATIC_LED_BLUE_MASK  GENMASK(7, 0)
+
+/* 4-Zone RGB Keyboard EC RAM Offsets */
+#define ACER_EC_ZONE_COLOR_BASE_ADDR       0x3C
+
+/* 4-Zone RGB Keyboard Protocol Constants */
+#define ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS 100
+#define ACER_KBD_RGB_MAX_INTENSITY         255
+#define ACER_KBD_NUM_ZONES                 4
+#define ACER_KBD_NUM_COLOR_CHANNELS        3
+
+/* Keyboard Backlight Modes */
+#define ACER_KBD_MODE_STATIC               0
+
 #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
 #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
 
@@ -389,6 +428,131 @@ struct wmi_interface {
 /* The static interface pointer, points to the currently detected interface */
 static struct wmi_interface *interface;
 
+/*Defining payload packages, zone information and general LED protocols */
+static acpi_status WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out);
+
+struct led_information {
+	struct led_classdev_mc led_general;
+	struct mc_subled led_colors[3];
+	struct rgb_wmi *parent;
+	u8 zone_id;
+	u8 current_brightness;
+};
+
+struct rgb_wmi {
+	struct mutex led_lock; /* making sure EC receives single command at a time */
+	struct led_information zones[4];
+};
+
+static int acer_kbd_set_static_preamble(u8 ec_brightness)
+{
+	u8 r = ACER_KBD_RGB_MAX_INTENSITY;
+	u8 g = ACER_KBD_RGB_MAX_INTENSITY;
+	u8 b = ACER_KBD_RGB_MAX_INTENSITY;
+
+	ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR, &r);
+	ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR + 1, &g);
+	ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR + 2, &b);
+
+	u8 gm_input[16] = {
+		ACER_KBD_MODE_STATIC,   /* mode = static */
+		0,                      /* speed */
+		ec_brightness,          /* brightness, 0-100 */
+		0,                      /* reserved */
+		0,                      /* direction */
+		r, g, b,                /* color readings from EC */
+		3, 1, 0, 0, 0, 0, 0, 0
+	};
+	struct acpi_buffer input = { .length = sizeof(gm_input), .pointer = gm_input };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u64 resp = 0;
+
+	status = wmi_evaluate_method(WMID_GUID4, 0,
+				     ACER_WMID_SET_GAMINGKBBL_METHODID,
+			      &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length >= 8)
+			resp = get_unaligned_le64(obj->buffer.pointer);
+		else if (obj->buffer.length >= 4)
+			resp = get_unaligned_le32(obj->buffer.pointer);
+		else if (obj->buffer.length >= 1)
+			resp = ((u8 *)obj->buffer.pointer)[0];
+	}
+
+	kfree(obj);
+
+	return resp ? -EIO : 0;
+}
+
+static int send_zone_color(u8 zone_bit, u8 r, u8 g, u8 b)
+{
+	acpi_status status;
+	u64 resp = 0;
+	u64 payload;
+	u32 rgb;
+
+	rgb = FIELD_PREP(ACER_GAMING_STATIC_LED_RED_MASK, r) |
+	FIELD_PREP(ACER_GAMING_STATIC_LED_GREEN_MASK, g) |
+	FIELD_PREP(ACER_GAMING_STATIC_LED_BLUE_MASK, b);
+
+	payload = (u64)cpu_to_be32(rgb) | zone_bit;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_STATIC_LED_METHODID,
+					payload, &resp);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return resp ? -EIO : 0;
+}
+
+static enum led_brightness rgb_get(struct led_classdev *led_cdev)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct led_information *led_info = container_of(general_mcolor,
+							struct led_information,
+						 led_general);
+	return led_info->current_brightness;
+}
+
+static int rgb_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct led_information *led_info = container_of(general_mcolor,
+							struct led_information,
+						 led_general);
+	struct rgb_wmi *data = led_info->parent;
+	u8 r, g, b;
+	int ret;
+
+	mutex_lock(&data->led_lock);
+
+	if (brightness == 0) {
+		r = 0;
+		g = 0;
+		b = 0;
+	} else {
+		led_mc_calc_color_components(general_mcolor, brightness);
+		r = led_info->led_colors[0].brightness;
+		g = led_info->led_colors[1].brightness;
+		b = led_info->led_colors[2].brightness;
+	}
+
+	ret = send_zone_color((u8)led_info->zone_id, r, g, b);
+
+	if (!ret) {
+		led_info->current_brightness = brightness;
+		led_cdev->brightness = brightness;
+	}
+
+	mutex_unlock(&data->led_lock);
+	return ret;
+}
 /*
  * Embedded Controller quirks
  * Some laptops require us to directly access the EC to either enable or query
@@ -406,10 +570,94 @@ struct quirk_entry {
 	bool hwmon;
 	bool platform_profile;
 	bool pwm;
+	u8 kbl_four_zone;
 };
 
 static struct quirk_entry *quirks;
 
+static int acer_kbd_rgb_init(struct platform_device *device, struct rgb_wmi *rgb_data)
+{
+	static const char * const zone_names[] = {
+		"acer-wmi:rgb:kbd_backlight-left",
+		"acer-wmi:rgb:kbd_backlight-center-left",
+		"acer-wmi:rgb:kbd_backlight-center-right",
+		"acer-wmi:rgb:kbd_backlight-right",
+	};
+	u64 gaming_sysinfo;
+	acpi_status status;
+	int ret, i;
+
+	if (!quirks || !quirks->kbl_four_zone)
+		return -ENODEV;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID, 0, &gaming_sysinfo);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_LED_METHODID,
+					ACER_GAMING_LED_KBBL_ENABLE, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	ret = acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+	if (ret)
+		pr_warn("Failed to set static preamble on init: %d\n", ret);
+
+	mutex_init(&rgb_data->led_lock);
+
+	for (i = 0; i < ACER_KBD_NUM_ZONES; i++) {
+		struct led_information *zone = &rgb_data->zones[i];
+		u8 r = 0, g = 0, b = 0;
+		u8 max_val;
+		u8 start_offset = ACER_EC_ZONE_COLOR_BASE_ADDR + (i * ACER_KBD_NUM_COLOR_CHANNELS);
+
+		zone->zone_id = BIT(i);
+		zone->parent  = rgb_data;
+
+		if (ec_read(start_offset, &r) != 0 ||
+			ec_read(start_offset + 1, &g) != 0 ||
+			ec_read(start_offset + 2, &b) != 0) {
+			r = ACER_KBD_RGB_MAX_INTENSITY;
+			g = ACER_KBD_RGB_MAX_INTENSITY;
+			b = ACER_KBD_RGB_MAX_INTENSITY;
+		}
+
+		max_val = max3(r, g, b);
+
+		if (max_val == 0) {
+			zone->led_colors[0].intensity = ACER_KBD_RGB_MAX_INTENSITY;
+			zone->led_colors[1].intensity = ACER_KBD_RGB_MAX_INTENSITY;
+			zone->led_colors[2].intensity = ACER_KBD_RGB_MAX_INTENSITY;
+			zone->current_brightness = 0;
+		} else {
+			zone->led_colors[0].intensity = (r * ACER_KBD_RGB_MAX_INTENSITY) / max_val;
+			zone->led_colors[1].intensity = (g * ACER_KBD_RGB_MAX_INTENSITY) / max_val;
+			zone->led_colors[2].intensity = (b * ACER_KBD_RGB_MAX_INTENSITY) / max_val;
+			zone->current_brightness = max_val;
+		}
+
+		zone->led_colors[0].color_index = LED_COLOR_ID_RED;
+		zone->led_colors[1].color_index = LED_COLOR_ID_GREEN;
+		zone->led_colors[2].color_index = LED_COLOR_ID_BLUE;
+
+		zone->led_general.subled_info = zone->led_colors;
+		zone->led_general.num_colors  = ACER_KBD_NUM_COLOR_CHANNELS;
+
+		zone->led_general.led_cdev.name = zone_names[i];
+		zone->led_general.led_cdev.max_brightness = ACER_KBD_RGB_MAX_INTENSITY;
+		zone->led_general.led_cdev.brightness = zone->current_brightness;
+		zone->led_general.led_cdev.brightness_set_blocking = rgb_set;
+		zone->led_general.led_cdev.brightness_get = rgb_get;
+		zone->led_general.led_cdev.flags = LED_RETAIN_AT_SHUTDOWN;
+
+		ret = devm_led_classdev_multicolor_register(&device->dev,
+								&zone->led_general);
+		if (ret)
+			return ret;
+	}
+		return 0;
+}
+
 static void __init set_quirks(void)
 {
 	if (quirks->mailled)
@@ -466,6 +714,7 @@ static struct quirk_entry quirk_acer_nitro_an515_58 = {
 	.hwmon = true,
 	.platform_profile = true,
 	.pwm = true,
+	.kbl_four_zone = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_ph315_53 = {
@@ -2815,6 +3064,8 @@ static int acer_wmi_hwmon_init(void);
 /*
  * Platform device
  */
+static struct rgb_wmi acer_rgb_data;
+
 static int acer_platform_probe(struct platform_device *device)
 {
 	int err;
@@ -2846,6 +3097,11 @@ static int acer_platform_probe(struct platform_device *device)
 		if (err)
 			goto error_hwmon;
 	}
+	if (quirks->kbl_four_zone) {
+		err = acer_kbd_rgb_init(device, &acer_rgb_data);
+		if (err)
+			pr_warn("Failed to initialize 4-zone RGB keyboard: %d\n", err);
+	}
 
 	return 0;
 
@@ -2898,6 +3154,7 @@ static int acer_suspend(struct device *dev)
 static int acer_resume(struct device *dev)
 {
 	struct acer_data *data = &interface->data;
+	int ret;
 
 	if (!data)
 		return -ENOMEM;
@@ -2911,6 +3168,13 @@ static int acer_resume(struct device *dev)
 	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
+	/* Ensuring keyboard is at static mode after resuming from sleep. */
+	if (quirks && quirks->kbl_four_zone) {
+		ret = acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+		if (ret)
+			pr_warn("Failed to restore keyboard static mode on resume: %d\n", ret);
+	}
+
 	return 0;
 }
 #else
-- 
2.56.0

