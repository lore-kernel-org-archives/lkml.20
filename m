Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100072;
	b=g7o5X0Zqx3Ub3tw1GXNsUHokc9TU3VB5zqRBRQiHcMLvz8rtgjaiThe0H+X9uccyI6NR
	 /akO1yN7pAopwOeItGdZ6QiyKc5uVedzpHHLmF2iShD3gDrGJILN6vwSE03HGIcpmt+HC
	 jPLKS1dTxP1yzf66qiBwK4xwj94kw4JiOoKdioeyjfTUgrhijSSbeVAPi6QnFt8vO7eFO
	 M6MplD+5yvL1W6LsNDlVv5cWbioMqqyUTAEE4TO9xfkpqfZMCFZVe6/ZvdwkYCsZNV6X9
	 pjUOo4rKQAO+G2BOKkUC9cc7hCDiMSvCi6DLVMURU7ZffVZ6fyUHgUPYsCvw0UpeOkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZGdn6bkRemJ+L9jxk2hkO3KTzCRPSiubr75CYs/of/s=;
	b=nv7nBTvOjQKpGHdIGwojv9+oYz+7Y0zw44HKV3tI2n4oyE8obcZV73tgkXuey7W0I4r+
	 ZEoomrQNpKcLq3T6q8xcQ+/AWimwOsaVhR/z9oOyHX9AQfNfKQKj/hSzOHV8z/Xs4q7Gz
	 B4qr0gQnknyuUYrApIzfKdehwW+d0zb2oU+H0z0ywlx0265VkKRKSjfPG/U5iu9tCr3AG
	 oD2jZqn1oxZduatkO/H55xt4vGsUf06Yo4xR6aBRHnIExg6q40VENOBsbK4F++dz+cJVA
	 YlYXIFH1oqwLoTvDLVArF8xIFd3eeKk+B/xj83oTXfdYk2HJqBROOvnW89b4xv7GsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dwiWaGAS;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F3606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0F3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dwiWaGAS
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3309874f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100071; x=1793704871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGdn6bkRemJ+L9jxk2hkO3KTzCRPSiubr75CYs/of/s=;
        b=dwiWaGASshTPvNbrS9NEh1hGqf014m0boNiYGu09Ec2a4Tij8YVQjNe8OqiysDTBFC
         B1Xx3Bcw7urz4kZsIe6u2go0X43HfR3tsyk/7Mjp8st93fth87HRBTxsdOcSd1MCSmjB
         fl6KQXOxiqr6bjsXAp77uqx+zHNNnPIPAlyHtxUehaVYzHCGq9fiT3VkZlmTuw/cGzmb
         B2STThN9pioybd+mrMVN8Tjl+z/xnYrKIFUoXCTQf41BbEei8ngkQ00qnyFAAJlLoELn
         VbNtMtPj5zbZ5bSweZuWuV3ir3bMdySnuZAtCJ7iywBjjpqbRKG5iLwZelaosrBxxGzN
         extw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100071; x=1793704871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGdn6bkRemJ+L9jxk2hkO3KTzCRPSiubr75CYs/of/s=;
        b=zQ1MgqTzNPcumtEHYE3fidt9+G7rNazOfKOsdzN2oHbuNP9lLZzdza8WFJDP+RpRiP
         0+qJZ/PC827zsCu/03FFzMuL3Ks6ss4wvkQ3g6gmjUFqlJCanRf4EUCkfVvSdMR0RE/K
         E1so7SX3fnw55TE3bhs4NSV4kOBoxSs+n1VNZ28oB3lmWP0DjflRoiOWMa7xr+4ln6XB
         KxC09RlHnPf8nbYZeE+oAXO8VIfTAbE9AQO7rMqS4lsN4NQ6wDabmkmh+v9t2eCbGfi6
         2lVOdTK5+q8KEtoSyQw8m0npYtYk+PI5WJ5DXsMDwrKLJIA8khrBT65GHTrFqb9EIifi
         pXng==
X-Forwarded-Encrypted: i=1; AKwUvBz8ciUB9ZmABoh1wRXjAu+/dgd3JrCvUvwIT4eX5OE+7qk18nYYxkOr0SYbdu3wGgc/+nLVWENB0bt7OYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq5+ZvDmIfGSj0NyXy8ywmt99wqixsUtcJemK0C/Tfb+nAe+ps
	OP8Cx+kN6arWyLaOHnwLuFpWT+rV7bn3ks5sgTRMzlTR50xrS8os11Fw
X-Gm-Gg: AYBFou0nSGCkW4qgFsCOLHB2/6+cQWt43n0PLHeh++0sADKpO6vpPTvnelAm9wHx7jh
	7cHAiUY6bmE7TQp1MWXpfTZF5Lwp+DWf+KFkichbtgTHyz8J7F+K8VzDkH2v+2giriB/7T9jDdE
	1VqkUGUOU725l0gJO2lj118yzFb5XT2fZoYJaFOPkkjRf1d6R2fzBYUJVBHAUXaNzBO9+BQAKbf
	P+SZqhiFqZaOygv/wurScXpRUbzV+PUfCcfRzY6DPEi9b27+RWcYaJuXSNU4et8IUPCwclrBqQY
	2AVJcsiASz0GYVTg+TJ9SCoxpR4p85SaZfiUd5qWGkHUjm13dhrgaOnwG+mo0yoTmzgfmutCsOa
	qjqRTpNVOE3PV9OODJzZWHCz3KgByvsPC29GgvxxH3j4bB/1sQ/eB45DZFXG02/8EDY17xgYHnh
	8XeNqJI8KbdOwGbK7pNGBP1GJZtwKCOt9FLINvkRbEd/63jfGodkAxE/tJ0y1hlJyJJwpIhRGg0
	U2VY4GJG4bUBmy4RsjxQsaaqnfbZStRtpKvOG9478e6vtAVK9zZzXymucMKT3lAIMWZY+hFCw==
X-Received: by 2002:a05:6000:26c1:b0:48e:5acf:48f8 with SMTP id ffacd0b85a97d-48e5acf4a99mr1469344f8f.16.1793100070297;
        Tue, 27 Oct 2026 04:21:10 -0700 (PDT)
Received: from laptop ([2a02:a03f:657d:d801:af2a:9465:5e27:73f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm21903289f8f.39.2026.10.27.04.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:21:09 -0700 (PDT)
From: Lucas Gillard <mirsella1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	jlee@suse.com,
	hansg@kernel.org,
	W_Armin@gmx.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: acer-wmi: support PH317-51 hwmon and kbd backlight
Date: Tue, 27 Oct 2026 12:21:04 +0100
Message-ID: <20261027112104.1464336-1-mirsella1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ea6d7395-c70f-9346-fc3f-9465adb5fef1@linux.intel.com>
References: <6aad63a9.f9180b46.32931.492b@mx.google.com> <ea6d7395-c70f-9346-fc3f-9465adb5fef1@linux.intel.com>
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

The Predator Helios 300 PH317-51 exposes early gaming WMI methods for
temperature and fan sensors, but lacks the platform-profile and
overclocking methods (22 and 23). Enable hwmon for this model without
enabling platform-profile support.

Its keyboard backlight is controlled by EC registers 0x30 and 0x31;
the WMI LED methods do not report or change it. Fn+F9 updates both EC
registers. Register an on/off keyboard LED with a blocking setter and
read its brightness directly from the EC, so sysfs reflects changes
made with Fn+F9.

Write both registers to match the firmware's on/off states. Use the LED
core to suspend and resume the backlight, reading its current state from
the EC before suspend.

Signed-off-by: Lucas Gillard <mirsella1@gmail.com>
Assisted-by: LLM
---
Hi Ilpo,

Thanks for the review. This revision is based on the platform-drivers-x86
for-next tree at 9d3475065167197742b0882aff21cf8e78393277.

Changes in v2:
- Use the existing hwmon quirk after the predator_v4 split.
- Name both EC registers and the state mask, and use them throughout.
- Convert brightness to an explicit u8 on/off value without modifying
  the enum argument; remove the redundant mask parentheses.
- Use brightness_set_blocking and return EC write errors.
- Use managed LED registration and remove the explicit off-write on
  unregister. LED core handles teardown.
- Use LED-core helpers for suspend, resume and shutdown, draining pending
  LED work before suspend/shutdown. Read the live EC state before suspend
  to preserve Fn+F9 changes.

I'm currently away from the machine and haven't retested v2 on hardware. I'm sending this update for review.

I used an LLM for code changes, review and local validation.

v1: https://lore.kernel.org/r/6aad63a9.f9180b46.32931.492b@mx.google.com
Review: https://lore.kernel.org/r/ea6d7395-c70f-9346-fc3f-9465adb5fef1@linux.intel.com

Thanks,
Lucas

 drivers/platform/x86/acer-wmi.c | 85 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf513891a8a012aeaa7185a3de521ecf47..b893e04712966fb1d792e4eb27955f3dbc8fad1d 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -310,6 +310,11 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_PLATFORM_PROFILE	BIT(10)
 #define ACER_CAP_HWMON			BIT(11)
 #define ACER_CAP_PWM			BIT(12)
+#define ACER_CAP_KBD_BACKLIGHT		BIT(13)
+
+#define ACER_KBD_BACKLIGHT_EC_STATE	0x30
+#define ACER_KBD_BACKLIGHT_EC_MIRROR	0x31
+#define ACER_KBD_BACKLIGHT_MASK		BIT(0)
 
 /*
  * Interface type flags
@@ -406,6 +411,7 @@ struct quirk_entry {
 	bool hwmon;
 	bool platform_profile;
 	bool pwm;
+	bool kbd_backlight;
 };
 
 static struct quirk_entry *quirks;
@@ -430,6 +436,9 @@ static void __init set_quirks(void)
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
+
+	if (quirks->kbd_backlight)
+		interface->capability |= ACER_CAP_KBD_BACKLIGHT;
 }
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -474,6 +483,12 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
 	.gpu_fans = 1,
 };
 
+/* Firmware supports sensors but lacks the platform-profile/OC methods. */
+static struct quirk_entry quirk_acer_predator_ph317_51 = {
+	.hwmon = true,
+	.kbd_backlight = true,
+};
+
 static struct quirk_entry quirk_acer_nitro_anv15_51 = {
 	.cpu_fans = 1,
 	.gpu_fans = 1,
@@ -717,6 +732,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_predator_ph315_53,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Predator PH317-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PH317-51"),
+		},
+		.driver_data = &quirk_acer_predator_ph317_51,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PHN16-71",
@@ -1968,7 +1992,7 @@ static void __init acer_commandline_init(void)
 }
 
 /*
- * LED device (Mail LED only, no other LEDs known yet)
+ * Mail LED device
  */
 static void mail_led_set(struct led_classdev *led_cdev,
 enum led_brightness value)
@@ -1992,6 +2016,40 @@ static void acer_led_exit(void)
 	led_classdev_unregister(&mail_led);
 }
 
+/*
+ * No WMI method drives this keyboard backlight. Fn+F9 changes both EC
+ * registers, so write both to reproduce the firmware's on/off states.
+ */
+static int kbd_led_set(struct led_classdev *led_cdev,
+		       enum led_brightness brightness)
+{
+	u8 value = brightness == LED_OFF ? 0 : ACER_KBD_BACKLIGHT_MASK;
+	int ret;
+
+	ret = ec_write(ACER_KBD_BACKLIGHT_EC_STATE, value);
+	if (ret)
+		return ret;
+
+	return ec_write(ACER_KBD_BACKLIGHT_EC_MIRROR, value);
+}
+
+static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
+{
+	u8 value;
+
+	if (ec_read(ACER_KBD_BACKLIGHT_EC_STATE, &value))
+		return LED_OFF;
+
+	return value & ACER_KBD_BACKLIGHT_MASK ? LED_ON : LED_OFF;
+}
+
+static struct led_classdev kbd_led = {
+	.name = "acer-wmi::kbd_backlight",
+	.brightness_set_blocking = kbd_led_set,
+	.brightness_get = kbd_led_get,
+	.max_brightness = LED_ON,
+};
+
 /*
  * Backlight device
  */
@@ -2847,8 +2905,15 @@ static int acer_platform_probe(struct platform_device *device)
 			goto error_hwmon;
 	}
 
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT)) {
+		err = devm_led_classdev_register(&device->dev, &kbd_led);
+		if (err)
+			goto error_kbd_backlight;
+	}
+
 	return 0;
 
+error_kbd_backlight:
 error_hwmon:
 error_platform_profile:
 	acer_rfkill_exit();
@@ -2877,6 +2942,7 @@ static int acer_suspend(struct device *dev)
 {
 	u32 value;
 	struct acer_data *data = &interface->data;
+	int ret;
 
 	if (!data)
 		return -ENOMEM;
@@ -2892,6 +2958,17 @@ static int acer_suspend(struct device *dev)
 		data->brightness = value;
 	}
 
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT)) {
+		u8 state;
+
+		ret = ec_read(ACER_KBD_BACKLIGHT_EC_STATE, &state);
+		if (ret)
+			return ret;
+
+		kbd_led.brightness = state & ACER_KBD_BACKLIGHT_MASK;
+		led_classdev_suspend(&kbd_led);
+	}
+
 	return 0;
 }
 
@@ -2908,6 +2985,9 @@ static int acer_resume(struct device *dev)
 	if (has_cap(ACER_CAP_BRIGHTNESS))
 		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
 
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
+		led_classdev_resume(&kbd_led);
+
 	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
@@ -2929,6 +3009,9 @@ static void acer_platform_shutdown(struct platform_device *device)
 
 	if (has_cap(ACER_CAP_MAILLED))
 		set_u32(LED_OFF, ACER_CAP_MAILLED);
+
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
+		led_classdev_suspend(&kbd_led);
 }
 
 static struct platform_driver acer_platform_driver = {

base-commit: 9d3475065167197742b0882aff21cf8e78393277
