Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420D3890F8
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201222; cv=none; b=vBpuFg8NrJr9S8m5KNfskEfD4MBgpuNMM1ezC7M25NXi3euI+Y++skB98or+qLIukRHCV+e/reIJUqQgki6lREQlxoFdwHQH5y3NQF0ZgOCsfNwO8688aNfMoHS47r0eYTOy3ocxoJRyTj920OcMp8XdJP/UhI/Lxw7Oa9QnBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201222; c=relaxed/simple;
	bh=swd+vsvif/pEvSKneilDq29Ix8AAJrQvAEloYSV3VBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snYMvB3654XJOiybdRZW+M27YOs3UUCFT+h3k1w/4hJunOrR6H0WySkmZ6ubejOX/A8sjeD7jxsDx8x+WL9Ivf2/SLN1Az0s04pNVYXojP42buchg4U8dr36gi2PfGBnbQQSMeqlTBSuiaY77anDtIqADf+vjrCt8B1HGLwpArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCYJ6u2n; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCYJ6u2n"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35ef6b49813so876880eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201215; x=1792806015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5QkAbLwreVKcQWjJK4R3wqSVXX50wM4/fGaqVkb6Q0=;
        b=nCYJ6u2nR22Y7v3wcN3wj+1pRxTEKqu2eSZdpHoVK51CAqv8zlOt5ERTZQgXM+oOvu
         LIVB0J//Hs9nmd7P9zzj+ZiDnuj3e/XX1Ab5yrJGsK0C/m+PjvpP4pjSpcGspT7Fhv/l
         I7BoLbrL3tICawiirQlioxSQfaRehXBEZ6mi916OGRzSvkH7peVw/DsYeyMVlTLPXtUI
         zZE7dEK9V0O8UB7mS6r8y2SPu3/ZXl2h/DMZHuc8O8AH4LV8drkVpMOW68KEd7RfqS/y
         sEJ8QglKjrVd7+aQPmS+9bhAbVkAV1peWbepnugfISGhYT0EfPAv5ljyT4pmvfz73POe
         5xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201215; x=1792806015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5QkAbLwreVKcQWjJK4R3wqSVXX50wM4/fGaqVkb6Q0=;
        b=gGUoGQ3L5pwN3lgJuw8mbFbHWuxLhH5cecK4HeP4k4YEsCH44Puov/qH8L18V68+QA
         4d4GxC4kl9VcPLANFFY23N8vGuT5F0IQYfPeK/n/X7cqbYXLbNAswLwqKj1VEjOn1jzR
         sUse/MLkREmpPoZbBHJme0qU05li/9NKvzXgPa6zF2PV/ORMiBxPIYJh69rosrhLbSET
         VUECycwLnX/4qy5dRfHnkZTZzb16L0uGa7wMQe1BtyRRw8mIsC01Aq+Df1pwQsYBByGW
         CyaIYKox8W8QqKDfbOdiU/Kt8AK/TsRlFfZmYPggY7GkxOrkBHouhj1FFT8VKu1UhZlE
         g6Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwOHR8qQseExfz5mbpQ2BbaJbzyjNWjTOXbsAMnqv/FmnpuZOO5yCy8tzfblbgI6M5auUMjyAQTA3bcpc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2g4S3r37e6zhq3oDf/DvtN15AiokrQEyITVqFUW4lC7RsN71b
	xOvaYVDjQxxzE5zjiu2XYPyCtmQxI3qMR40ZOanCRn0wrFo0y9Ry+cJI
X-Gm-Gg: AYBFou2KRdy0t+E46iRjgUv8Uy4MXtrkUnRH7H4hl5D6lLuCxQpmimwTWS1/G2FdhID
	uVdCyXZD9lq/3doltpIfSgAo2cXU+5eKFuYDOxlZDB9HfwQYcEHamh3kiToXSFJ4Ya3wxoG3/5i
	kLXwDT6K8rfllD2QZdCGtmO0yY0YWEwTqHsOlo8+EmbhquLR5sWXRmsFm/Kq+yOIT82EHAyHlYy
	ydct+tLUqxEwpvT4E2P5iN251H/Qr2DZUeqfFA/aQScSFAx9f2mIUn7JiJlwMeAGAHw7Ibc1AuW
	8mGP1PH158fx09ruf0Y4Y7HCms6cZ/1BVMVo3k7f+vCqZyaLRR0wBVjLvcH9Yqv7665actofDAq
	DNEgeQ2p3be46y+ho8eK5DjEIS8ZBtAPUR5qqPUj1P7CiA1lXxuYQK9/78ck2dWBod+XFiCXowC
	tkxROQb/9Xo2soKQqW8A6eL7t4EjZ0A49Nq0J50QZnB1BZsNAMevaGGmvVzQ3prwPAyWoBEmtRl
	ElzQbYGyVH1s7vzmm+RkFG/1H1OkYzUGf1q2NoLlPPYp6QkkMM6N1ZxCSBUDqCw7HSNo47qmMSP
X-Received: by 2002:a05:7022:150d:b0:156:6676:d0e2 with SMTP id a92af1059eb24-185119e3dfcmr2130167c88.10.1792201214789;
        Fri, 16 Oct 2026 18:40:14 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:14 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 09/11] HID: hid-lenovo-go-s: Move static led_classdev_mc to drvdata struct
Date: Fri, 16 Oct 2026 18:39:54 -0700
Message-ID: <20261017013956.2440130-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
References: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the next patch I will switch drvdata from static global to a
devm_kzalloc struct. In preparation for that, move the led_classdev_mc
to be a member of the gos_cfg_drvdata struct. As part of that effort,
provide a constant name when accessing it and access the led_classdev
through the led_classdev_mc.

Fixes: be6d7dbb368ba840d7 ("HID: hid-lenovo-go-s: Add RGB LED control interface")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 77 +++++++++++++++++------------------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 136372eb6e6b..2e938dd5e77c 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -61,7 +61,7 @@ static struct gos_cfg_drvdata {
 	u8 tp_en;
 
 	/* RGB Variables */
-	struct led_classdev *led_cdev;
+	struct led_classdev_mc led_mc;
 	bool rgb_registered;
 	u8 rgb_profile;
 	u8 rgb_effect;
@@ -348,7 +348,7 @@ static int hid_gos_pl_test_event(struct command_report *cmd_rep)
 
 static int hid_gos_light_event(struct command_report *cmd_rep)
 {
-	struct led_classdev_mc *mc_cdev;
+	struct led_classdev_mc *led_mc;
 	int ret = 0;
 
 	switch (cmd_rep->sub_cmd) {
@@ -363,12 +363,12 @@ static int hid_gos_light_event(struct command_report *cmd_rep)
 	case USR_LIGHT_PROFILE_1:
 	case USR_LIGHT_PROFILE_2:
 	case USR_LIGHT_PROFILE_3:
-		mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+		led_mc = &drvdata.led_mc;
 		drvdata.rgb_effect = cmd_rep->data[0];
-		mc_cdev->subled_info[0].intensity = cmd_rep->data[1];
-		mc_cdev->subled_info[1].intensity = cmd_rep->data[2];
-		mc_cdev->subled_info[2].intensity = cmd_rep->data[3];
-		drvdata.led_cdev->brightness = cmd_rep->data[4];
+		led_mc->subled_info[0].intensity = cmd_rep->data[1];
+		led_mc->subled_info[1].intensity = cmd_rep->data[2];
+		led_mc->subled_info[2].intensity = cmd_rep->data[3];
+		led_mc->led_cdev.brightness = cmd_rep->data[4];
 		drvdata.rgb_speed = cmd_rep->data[5];
 		ret = 0;
 		break;
@@ -931,7 +931,7 @@ static ssize_t rgb_effect_store(struct device *dev,
 				struct device_attribute *attr, const char *buf,
 				size_t count)
 {
-	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	struct led_classdev_mc *led_mc = &drvdata.led_mc;
 	enum rgb_config_index index;
 	bool rgb_registered;
 	u8 effect;
@@ -949,10 +949,10 @@ static ssize_t rgb_effect_store(struct device *dev,
 	effect = ret;
 	index = drvdata.rgb_profile + 2;
 	u8 rgb_profile[6] = { effect,
-			      mc_cdev->subled_info[0].intensity,
-			      mc_cdev->subled_info[1].intensity,
-			      mc_cdev->subled_info[2].intensity,
-			      drvdata.led_cdev->brightness,
+			      led_mc->subled_info[0].intensity,
+			      led_mc->subled_info[1].intensity,
+			      led_mc->subled_info[2].intensity,
+			      led_mc->led_cdev.brightness,
 			      drvdata.rgb_speed };
 
 	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
@@ -1003,7 +1003,7 @@ static ssize_t rgb_speed_store(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
 			       size_t count)
 {
-	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	struct led_classdev_mc *led_mc = &drvdata.led_mc;
 	enum rgb_config_index index;
 	bool rgb_registered;
 	int val = 0;
@@ -1023,10 +1023,10 @@ static ssize_t rgb_speed_store(struct device *dev,
 
 	index = drvdata.rgb_profile + 2;
 	u8 rgb_profile[6] = { drvdata.rgb_effect,
-			      mc_cdev->subled_info[0].intensity,
-			      mc_cdev->subled_info[1].intensity,
-			      mc_cdev->subled_info[2].intensity,
-			      drvdata.led_cdev->brightness,
+			      led_mc->subled_info[0].intensity,
+			      led_mc->subled_info[1].intensity,
+			      led_mc->subled_info[2].intensity,
+			      led_mc->led_cdev.brightness,
 			      val };
 
 	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
@@ -1189,7 +1189,7 @@ static ssize_t rgb_profile_range_show(struct device *dev,
 static void hid_gos_brightness_set(struct led_classdev *led_cdev,
 				   enum led_brightness brightness)
 {
-	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	struct led_classdev_mc *led_mc = &drvdata.led_mc;
 	enum rgb_config_index index;
 	bool rgb_registered;
 	int ret;
@@ -1206,9 +1206,9 @@ static void hid_gos_brightness_set(struct led_classdev *led_cdev,
 
 	index = drvdata.rgb_profile + 2;
 	u8 rgb_profile[6] = { drvdata.rgb_effect,
-			      mc_cdev->subled_info[0].intensity,
-			      mc_cdev->subled_info[1].intensity,
-			      mc_cdev->subled_info[2].intensity,
+			      led_mc->subled_info[0].intensity,
+			      led_mc->subled_info[1].intensity,
+			      led_mc->subled_info[2].intensity,
 			      brightness,
 			      drvdata.rgb_speed };
 
@@ -1448,17 +1448,6 @@ static struct mc_subled gos_rgb_subled_info[] = {
 	},
 };
 
-static struct led_classdev_mc gos_cdev_rgb = {
-	.led_cdev = {
-		.name = "go_s:rgb:joystick_rings",
-		.brightness = 0x50,
-		.max_brightness = 0x64,
-		.brightness_set = hid_gos_brightness_set,
-	},
-	.num_colors = ARRAY_SIZE(gos_rgb_subled_info),
-	.subled_info = gos_rgb_subled_info,
-};
-
 static int cfg_query_device(void)
 {
 	int ret;
@@ -1544,14 +1533,12 @@ static void cfg_setup(struct work_struct *work)
 	}
 
 	if (!drvdata.rgb_registered) {
-		drvdata.led_cdev = &gos_cdev_rgb.led_cdev;
-
 		/* Pairs with smp_load_acquire in attribute show/store functions */
 		smp_store_release(&drvdata.rgb_registered, true);
 		rgb_registered = true;
 
 		ret = led_classdev_multicolor_register(&drvdata.hdev->dev,
-						       &gos_cdev_rgb);
+						       &drvdata.led_mc);
 		if (ret) {
 			dev_err(&drvdata.hdev->dev, "Failed to create RGB device: %i\n",
 				ret);
@@ -1560,14 +1547,14 @@ static void cfg_setup(struct work_struct *work)
 			smp_store_release(&drvdata.rgb_registered, false);
 			rgb_registered = false;
 		} else {
-			ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev,
+			ret = devm_device_add_group(drvdata.led_mc.led_cdev.dev,
 						    &rgb_attr_group);
 			if (ret) {
 				dev_err(&drvdata.hdev->dev,
 					"Failed to create RGB configuration attributes: %i\n",
 					ret);
 
-				led_classdev_multicolor_unregister(&gos_cdev_rgb);
+				led_classdev_multicolor_unregister(&drvdata.led_mc);
 
 				/* Pairs with smp_load_acquire in attribute show/store functions */
 				smp_store_release(&drvdata.rgb_registered, false);
@@ -1579,7 +1566,7 @@ static void cfg_setup(struct work_struct *work)
 	if (gp_registered)
 		kobject_uevent(&drvdata.hdev->dev.kobj, KOBJ_CHANGE);
 	if (rgb_registered)
-		kobject_uevent(&drvdata.led_cdev->dev->kobj, KOBJ_CHANGE);
+		kobject_uevent(&drvdata.led_mc.led_cdev.dev->kobj, KOBJ_CHANGE);
 }
 
 static int hid_gos_cfg_probe(struct hid_device *hdev,
@@ -1593,6 +1580,18 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 	mutex_init(&drvdata.cfg_mutex);
 	init_completion(&drvdata.send_cmd_complete);
 
+	/* Device is hardwired and name is guaranteed to be unique */
+	drvdata.led_mc.led_cdev.name = "go_s:rgb:joystick_rings";
+	drvdata.led_mc.led_cdev.brightness = 0x50;
+	drvdata.led_mc.led_cdev.max_brightness = 0x64;
+	drvdata.led_mc.led_cdev.color = LED_COLOR_ID_RGB;
+	drvdata.led_mc.led_cdev.brightness_set = hid_gos_brightness_set;
+	drvdata.led_mc.num_colors = 3;
+	drvdata.led_mc.subled_info = devm_kmemdup(&hdev->dev, gos_rgb_subled_info,
+						  sizeof(gos_rgb_subled_info), GFP_KERNEL);
+	if (!drvdata.led_mc.subled_info)
+		return -ENOMEM;
+
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
 	 * initial data call after probe has completed and MCU can accept calls.
 	 */
@@ -1616,7 +1615,7 @@ static void hid_gos_cfg_remove(struct hid_device *hdev)
 	/* Pairs with smp_store_release in cfg_setup */
 	rgb_registered = smp_load_acquire(&drvdata.rgb_registered);
 	if (rgb_registered)
-		led_classdev_multicolor_unregister(&gos_cdev_rgb);
+		led_classdev_multicolor_unregister(&drvdata.led_mc);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
-- 
2.55.0

