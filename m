Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792971556;
	b=MnoZFbq4FEyNTjQK2HO5leg9KEl9LBKF+TuNLOctcFYGHgP8eocRfxrfusHTV3jJLRn6
	 UkvwSqw6amhcsE7QDamesYfEUGFDfGLmdOTvtoEUyynhqFec9rL8MrWiLjDowYl06E1Ra
	 vp5Wb4EbXwPZCAqu3vbcrt8wIJUhEF4V2i+HNZOvvKDmDgqax3D2tJZ0T6wK/5EpHmuAO
	 Igw5CSz8CYtTCDPRJRL05XDflkIo5GSKF7fneg3oKDr7FKPIYI9HcFH4euLF0HxxzHjmP
	 iLm6zSSdWWiNSaOiA5X7Pfu5V8omLQsJ8vKsnNvRv4tjYztKtAWI9vftXMYbV4YOYNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792971556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hrxxPTtZzklJWr1I8RCcQH6APbY+mTeaGJ9MW6ThL0A=;
	b=4KgBXlQqW5NUfzbBk3RM+smTUKcWMdcaKefZQXFY6KihfEpz7v8mxdx+Dj3lnSw3Z4TA
	 TldwromYUjJ+vV+sPElbef0JYoqixhg5SvwBXm4dYWCxxDSqh6+K3WGeh3c4NgDs51up7
	 f/FGl4CC5tHJreznJ2nPChYJ3VwT8RB3zlDHqsSmePIbS5cUccydAQJQKXDeTtDNnruJU
	 iS1b7yXjIZcJqDZYVl+S3JYUDI/qkL5Hi57KJEsrR/4yEjSf/mi+GeufmrLB9eTNc7gf1
	 nYIsqwz/u9ycD64wnsMAT+6ETPp7g1AgnymwW1jJhTW1nu0KhRUwmis8omuP1pFZlPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="d0T/cp/8";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7FC606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d0T/cp/8
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2509649f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792971554; x=1793576354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrxxPTtZzklJWr1I8RCcQH6APbY+mTeaGJ9MW6ThL0A=;
        b=d0T/cp/8+e869iqNfTNL2kpUbaKN8Ihr6W41M/w2HkFxdFMJMCVHnQVxCSp63fu1D4
         KrzQJ1TO9cDDUTuKtGH0q61qjH9N1aRC9mYbwd7eDloZhcvHa8OxeMALxbqJfBccUwnK
         2KSf2HiMUqdYxqorKokueXPuZp4d6K6YaDFRcdDjla5K5041ZnAq5ca12T5+4do2Xe2P
         qJn/5HSVorPiZIhQSC3BQIERPjtnBxKkJPZCwi08TBCtTQ0aYriqjtwoa3KK9am2tmpk
         8Eip9O0K7Lx3pkcLMR+ls6G6E7mWq9xjjPQnhDvIPOCZ9ADUFzy5R9Nk29cl7xK57XQx
         bu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792971554; x=1793576354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrxxPTtZzklJWr1I8RCcQH6APbY+mTeaGJ9MW6ThL0A=;
        b=MhTKRQCgRckd4ViL67BprH9EcmEEVM0IWmLIKGmwaCNvAvGS11zyvLIduhGR1XOmdU
         T8G09UWNeO0pFekIksooxCZ9aMWg2JKNdAuahAunaysv6R1OC7Ux3SMItR/l+UnnwzNs
         9UFnO2DsI3uzV1iU5bsDpH6gtOxJTHXufUH4EKLSsrhnVJpvFK2slF3P28AaH+j2EFa+
         Ad7Aim0eKb42OER6zdCl6g5FFX1rY/KFzD2eZBtWH/MuPGCQhkPAkOnJwkOKPyrRUUJb
         Od84q8VbkDlj+ZJmV5emDEzKFShEwLN0TL2VG9dd8MtB4Y/zz0a4XEYwNFufcA299ihU
         0JmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7cjYzH08JYphCOvhOBA2XYxYxNw6h03bl3tvEW0latiwiYCnP/PeVhOs/1Eq87CZGrtBAK9/S2Hh2FC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV2RxpT9LhuApQp17WcS6tM51mXJypVBE61eI3FAFe37dHg4xu
	M8afs9hpmiPqHoUXMp3YIRA9+3dUBXYug0wjlBnnjxap572/FceTAtXDxLUEuXrV3ns=
X-Gm-Gg: AYBFou1Pc8I/C8P4dkaw3wnggTp96QSJcU6Mqbjj2ONtPf4Q9pcWfkxN7DUXGfZbh0d
	hVdiUqhkaPr5tNj+0lx3Nu7BqjjuhCjNlCLNlmB7NKvPIgYWcbxaz0punZ5FDiebbuGJG9LbzKV
	zEIyisHn+wsuEdZq3GsA4wAWFbA2ZrhAMSJqMBas0wKHrd/2IzGubLwtvyZ33p/x3yxUfjjhnel
	/cnXd3uMnDaFZAn6dgpDZVKuJu//uqmM6SChoEbdH+wIn4XE3MWyHQagpDmJQIDqmVHvCp4XKhz
	hybOVDvTcjU1GTxG31svSG1n6wn7AV4Ads59MF5sawAYZfW01LAi2sZSxbmUkxhQD2dGy7gA7JJ
	Cy+/nJA/0Cyd2OzA5wN9WZrFrhybqud09N7T6W0i6QXRCJPKzo1N8xUBq3kn8EysO4oVJ5CRqYm
	Z21m1Jf4+zKobEBRiiSrjxQ1qxgPGSO28NNOgagltfB2IsIOWu//mTN8DpPVVIAhnyt1/BC6nuE
	r37Upea5uQFNFhfhX6392c36IDx/qCjz+eWlaIaFLl0YcyVgjiwGdOIReoSrY3HNq1TsnSLm+t2
	cWSDhfyma5xolT9tsG4PDAjrBPAkBROW3tHvz9XlBg==
X-Received: by 2002:a05:6000:4b04:b0:48d:fbe1:bb17 with SMTP id ffacd0b85a97d-48e3eb7ca4emr9697468f8f.41.1792971553758;
        Sun, 25 Oct 2026 16:39:13 -0700 (PDT)
Received: from matebook.galaxus.box (adsl-84-226-215-1.adslplus.ch. [84.226.215.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm12928801f8f.21.2026.10.25.16.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 16:39:13 -0700 (PDT)
From: Cian Ruane <cian.ruane1@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cian Ruane <cian.ruane1@gmail.com>
Subject: [PATCH] platform/x86: huawei-wmi: Add keyboard backlight support
Date: Mon, 26 Oct 2026 00:39:10 +0100
Message-ID: <20261025233910.9907-1-cian.ruane1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The HWMI interface of the HUAWEI MateBook X Pro 2020 (MACHC-WAX9)
exposes the keyboard backlight through the \GLIV and \SLIV methods of
the WMAA dispatcher (MFID 2, SFID 6/7), with the level in byte 2 of the
buffer. The EC stores the level doubled, so the three levels off/low/
high are represented as 0, 2 and 4.

Register a "platform::kbd_backlight" LED class device with a maximum
brightness of 2 so that userspace, e.g. UPower, can control it.

Changes made with the Fn+F3 hotkey are handled by the EC itself and
are not reported to the OS on this model: no EC query or WMI event is
generated. LED_BRIGHT_HW_CHANGED is therefore not set.

The level encoding has only been verified on this model, so enable the
feature through a DMI quirk.

Tested on: HUAWEI MACHC-WAX9 (MateBook X Pro 2020), BIOS 1.05 and 1.26,
Ubuntu 24.04 (kernel 6.8.0-147-generic, with this patch backported).

Signed-off-by: Cian Ruane <cian.ruane1@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 96ee9a97c..8eafda8a1 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -39,8 +39,14 @@ enum {
 	FN_LOCK_GET			= 0x00000604, /* \GFRS */
 	FN_LOCK_SET			= 0x00000704, /* \SFRS */
 	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
+	KBD_BACKLIGHT_GET		= 0x00000602, /* \GLIV */
+	KBD_BACKLIGHT_SET		= 0x00000702, /* \SLIV */
 };
 
+/* The EC stores the keyboard backlight level doubled: off/low/high = 0/2/4. */
+#define KBD_BACKLIGHT_MAX		2
+#define KBD_BACKLIGHT_STEP		2
+
 union hwmi_arg {
 	u64 cmd;
 	u8 args[8];
@@ -50,6 +56,7 @@ struct quirk_entry {
 	bool battery_reset;
 	bool ec_micmute;
 	bool report_brightness;
+	bool kbd_backlight;
 };
 
 static struct quirk_entry *quirks;
@@ -65,6 +72,7 @@ struct huawei_wmi {
 
 	struct huawei_wmi_debug debug;
 	struct led_classdev cdev;
+	struct led_classdev kbd_cdev;
 	struct device *dev;
 
 	struct mutex wmi_lock;
@@ -126,6 +134,10 @@ static struct quirk_entry quirk_matebook_x = {
 	.report_brightness = true,
 };
 
+static struct quirk_entry quirk_kbd_backlight = {
+	.kbd_backlight = true,
+};
+
 static const struct dmi_system_id huawei_quirks[] = {
 	{
 		.callback = dmi_matched,
@@ -145,6 +157,15 @@ static const struct dmi_system_id huawei_quirks[] = {
 		},
 		.driver_data = &quirk_matebook_x
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Huawei MACHC-WAX9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MACHC-WAX9"),
+		},
+		.driver_data = &quirk_kbd_backlight
+	},
 	{  }
 };
 
@@ -322,6 +343,48 @@ static void huawei_wmi_leds_setup(struct device *dev)
 	devm_led_classdev_register(dev, &huawei->cdev);
 }
 
+/* Keyboard backlight */
+
+static enum led_brightness huawei_wmi_kbd_backlight_get(struct led_classdev *led_cdev)
+{
+	u8 ret[0x100];
+
+	if (huawei_wmi_cmd(KBD_BACKLIGHT_GET, ret, sizeof(ret)))
+		return 0;
+
+	/* byte[0] = STAT, byte[2] = level as stored by the EC */
+	return ret[2] / KBD_BACKLIGHT_STEP;
+}
+
+static int huawei_wmi_kbd_backlight_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	union hwmi_arg arg;
+
+	arg.cmd = KBD_BACKLIGHT_SET;
+	arg.args[2] = brightness * KBD_BACKLIGHT_STEP;
+
+	return huawei_wmi_cmd(arg.cmd, NULL, 0);
+}
+
+static void huawei_wmi_kbd_backlight_setup(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	if (!quirks || !quirks->kbd_backlight)
+		return;
+
+	if (huawei_wmi_cmd(KBD_BACKLIGHT_GET, NULL, 0))
+		return;
+
+	huawei->kbd_cdev.name = "platform::kbd_backlight";
+	huawei->kbd_cdev.max_brightness = KBD_BACKLIGHT_MAX;
+	huawei->kbd_cdev.brightness_get = &huawei_wmi_kbd_backlight_get;
+	huawei->kbd_cdev.brightness_set_blocking = &huawei_wmi_kbd_backlight_set;
+
+	devm_led_classdev_register(dev, &huawei->kbd_cdev);
+}
+
 /* Battery protection */
 
 static int huawei_wmi_battery_get(int *start, int *end)
@@ -915,6 +978,7 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		mutex_init(&huawei_wmi->wmi_lock);
 
 		huawei_wmi_leds_setup(&pdev->dev);
+		huawei_wmi_kbd_backlight_setup(&pdev->dev);
 		huawei_wmi_fn_lock_setup(&pdev->dev);
 		huawei_wmi_battery_setup(&pdev->dev);
 		huawei_wmi_debugfs_setup(&pdev->dev);

base-commit: 9d3475065167197742b0882aff21cf8e78393277
-- 
2.43.0

