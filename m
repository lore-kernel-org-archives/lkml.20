Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584390;
	b=hEar5yQ82Rmx2I6Z9WR7qsU5esf1DgW01N3AxKGaeRGkh0bYQbCZGITz5zm+VKmTnvgh
	 lE75JVzGgaJzMZrZC5Q6oXYUCpaNR58Shd6Y5LIOkJTmVoC6Tg+zJw3nrwFDMmTQlQoWM
	 Hy56AL/WJTtg0ik4YKsH1V9Uwx9bvTQfAhp+N3XMNloX1WhgBjiEOOXPHkzarQV6HOdZn
	 RJayusBg6dsaXI9Hsun0eBYKcC8zK25sgJJ7cgu1OccrtuYliE78NVzTrSf5lbx58V3CR
	 cFyA6Gs09j7gdwqnGk69nGgNFC55XnxjJSJslhDasbUfn7aCfMb8B5IBQG7tGNo0y2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7LvNQRaWUgJtWqw9OxLOwbF8xdwf/uEZOyPuZTs/H/M=;
	b=5RXW7/CHpTLc+n/PB6gQpjjVZT+U4tYjGF5Oa3Hl8wyFcV/NjDuVj3Y9yqdt7NrCBfCE
	 f2qoc1mNEGeI45rYnBaE4GnPkOKaJClGVhnS7LJFBcPDiiyUeBWDVpiiuRPLwjRxKoZSo
	 lZCaTm60180T4fU8BXNUqksc9hJckWtdzOUmUKqiSdiAz8SGnG4AbPpa4yUXuqPyeM1He
	 VK6fOE+QgfXZM9y5xEcZ19NffU6fV6iHjrqd7QpgLh68QdJuc19QUUNXh2cAKV5SJOMkD
	 2lwkxt7VfSCD4KBdQlg9ZQ60M1pmTf95lO0+qtUrRo5fdfcJumJLO/RjFSn5g/MVTGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oNdBODqg;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E803606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E803606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oNdBODqg
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so359052a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792584389; x=1793189189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7LvNQRaWUgJtWqw9OxLOwbF8xdwf/uEZOyPuZTs/H/M=;
        b=oNdBODqgeuOZX1VViYy/iJ65CL/+4y3mmE61kFH10oFFGxu3T5Wan4eGVAIzoBehdm
         TUm/g7EFKY6wZ2pThbfvyVwVA+6o23VtUnnCDeOFznEHmjj9wtASS9qO6Yuu2rbxha2N
         EsuA35qbwK/eT/LMZsWFT7j6G8shLoSTOXxavNUwohw5vEFdsDrrvkjmqn9d7u3MLPah
         ZZYaj4XxW8W/9j5VzMRqE37JIjiTHSjNXXE9bsqjjfsBnXCAo9gS4EXi4lYhzu9Kr7UP
         7mRJJCS1xQC6CrgO20TfkW9MT+d5N9aEe3MI96aIZNzWo/0MULAH+EMy+017lvNZDXwl
         BqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584389; x=1793189189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LvNQRaWUgJtWqw9OxLOwbF8xdwf/uEZOyPuZTs/H/M=;
        b=Sg0JquKanFIWqBlQ0t2u/7XCz+chl4c4MzNgBGKfLg/6mLjCoHMyGX7DcER1LrGHjE
         a/3RM/A60UlaKZuU1uvvKff2MJvaoKf3frQbiA4YAuURUD0z0rM42jtS2dalp2T5zwfw
         vc5SbF02cbKQ2RPoGErYAYJRxVx4nGWKkv3s991RjDESRbSh84+gpf9od88jPN5ewzlx
         F0y0mWzSDw3vZ9Xpuqi+1wvzX0p9dBxcjIFuC8bM+J4M0a2iy958YptPvp3w4t3mWu4L
         9Ow/g0aWQtc/MeaHxH0hk/EwffgzLrcW8QDw0mtKeXTEH2B1ysepABfL9jG6ITYTkzRJ
         DWqw==
X-Forwarded-Encrypted: i=1; AKwUvBxoo4wvHn43RhaXFT/c2NUa0iJq4/baRSStjqxjCWEC9/ijJ//f13/aMkvA/hHSzQAiMrmLJwL8R7H7XfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVhPZfoAaKc5mE0FiLFNj5rcaje8P1mTqxzZYtjEMrED/fKGlG
	wVwpcMPEP4ekCZA445LmGiayrpEClq0lfwYI+o5BbJQIv2EfnB/O5vN/
X-Gm-Gg: AYBFou297k3XXl/65W1Mjl4b7+UXUrbdXUXJABUBmSxSMnVYtuR3CvYFNteB3xYh/tQ
	P4EmLQYhrf+c3DXcgCyjVdYIoB3wsCltSs326okqSByJ/KS10gRpeTR2fmY7Zhl9aHDe/re/2sW
	QwgUch+xd+OqS3JL/hQUw5Q8NSvvuhFmojt7EjmzqK5jrxV1Qg349dTSnu15FSqPC2OrpI6D98t
	nuTvNnbVakvGl2GnSkJJLA38z9XJcTjChfVYuxMPMtKTOf1BbHy5zyrVhx+ZWvM2pF5ztM+VyCs
	K85mOy31gb3qqK1igkM78j0vYoOChxFnZXGy7u0YcXVBuXUWpi6brUDeP5mqxljc2ErAqSrmO+D
	btTBOM4X4CFeEAInbIAG4dvx96sQrmZD7s++5JHxr60GpTgbqBjqQFfKxBElDemTEfPWFyv7rJO
	n+yTVKHDHy2zAmzEc36uL4vWnpP+PpPkvCagb3bZE0syt9OieOcx49FJgZwUUBEVgkWAQvw7/i9
	QZRxMvmNDRSj2pdOU2Ymo3OzC0yTC+7B4hHg/Sd2fl6S9wiHS6Li/oqUe0Fgv8UqD3G6i7h3BiI
	vuXtLw==
X-Received: by 2002:a17:90b:55ce:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ad86ca9269mr1359237a91.39.1792584389032;
        Wed, 21 Oct 2026 05:06:29 -0700 (PDT)
Received: from fedora ([2400:2410:5f2b:700:6bda:eb8:32f0:3372])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1774236a91.3.2026.10.21.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:06:27 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] HID: lenovo: Add keyboard backlight support for the X13 detachable folio
Date: Thu, 22 Oct 2026 05:08:41 +0900
Message-ID: <20261021200841.75370-1-vishnuocv@gmail.com>
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

The keyboard backlight of the ThinkPad X13 detachable folio is reached
over HID rather than through the EC, so thinkpad_acpi exposes nothing
for it and userspace can neither read the level nor set it.

The folio takes and reports the level over the same vendor reports this
driver already uses for the Fn-lock, mute and mic-mute indicators, so
register a kbd_backlight LED class device on top of them.

The firmware cycles the level on Fn+Space by itself.  Report the
resulting state to the LED class device instead of the keypress, which
userspace would otherwise act on a second time.

Tested on a ThinkPad X13 Detachable (17ef:62af), BIOS R3IET32WM.

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 drivers/hid/hid-lenovo.c | 122 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 3976d7b53b14..956c26128f40 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -24,6 +24,7 @@
 /*
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/sysfs.h>
 #include <linux/device.h>
@@ -51,6 +52,8 @@ struct lenovo_drvdata {
 	struct mutex led_report_mutex;
 	struct led_classdev led_mute;
 	struct led_classdev led_micmute;
+	struct led_classdev led_kbd_bl;
+	struct work_struct kbd_bl_sync_work;
 	struct work_struct fn_lock_sync_work;
 	struct hid_device *hdev;
 	int press_to_select;
@@ -75,10 +78,19 @@ struct lenovo_drvdata {
 #define TP10UBKBD_FN_LOCK_LED		0x54
 #define TP10UBKBD_MUTE_LED		0x64
 #define TP10UBKBD_MICMUTE_LED		0x74
+#define TP10UBKBD_KBD_BL_LED		0xc4
 
 #define TP10UBKBD_LED_OFF		1
 #define TP10UBKBD_LED_ON		2
 
+/* Above the levels, 0x04 selects the firmware's own automatic mode. */
+#define TP10UBKBD_KBD_BL_MAX		2
+
+static bool lenovo_has_kbd_backlight(struct hid_device *hdev)
+{
+	return hdev->product == USB_DEVICE_ID_LENOVO_X13_TAB;
+}
+
 /* Function to report raw_events as key events*/
 static inline void report_key_event(struct input_dev *input, int keycode)
 {
@@ -87,8 +99,8 @@ static inline void report_key_event(struct input_dev *input, int keycode)
 	input_sync(input);
 }
 
-static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
-				    enum led_brightness value)
+static int lenovo_send_led_report_tp10ubkbd(struct hid_device *hdev, u8 led_code,
+					    u8 value)
 {
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
 	int ret;
@@ -97,7 +109,7 @@ static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 
 	data->led_report[0] = TP10UBKBD_LED_OUTPUT_REPORT;
 	data->led_report[1] = led_code;
-	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
+	data->led_report[2] = value;
 	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
 	if (ret != 3) {
@@ -114,6 +126,33 @@ static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	return ret;
 }
 
+static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
+				    enum led_brightness value)
+{
+	return lenovo_send_led_report_tp10ubkbd(hdev, led_code,
+			value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF);
+}
+
+static int lenovo_read_led_state_tp10ubkbd(struct hid_device *hdev, u8 led_code,
+					   u8 *state)
+{
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
+	int ret;
+
+	guard(mutex)(&data->led_report_mutex);
+
+	data->led_report[0] = led_code;
+	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 2,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+
+	if (ret != 2)
+		return ret < 0 ? ret : -EIO;
+
+	*state = data->led_report[1];
+
+	return 0;
+}
+
 static void lenovo_tp10ubkbd_sync_fn_lock(struct work_struct *work)
 {
 	struct lenovo_drvdata *data =
@@ -725,6 +764,7 @@ static const struct attribute_group lenovo_attr_group_cptkbd = {
 /* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
 static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
 {
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
 	struct hid_input *hidinput;
 	struct input_dev *input = NULL;
 
@@ -764,6 +804,15 @@ static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
 			return 1;
 		case TP_X12_RAW_HOTKEY_FN_SPACE:
 			/* Keyboard LED backlight toggle*/
+			if (data && lenovo_has_kbd_backlight(hdev)) {
+				/*
+				 * The firmware has already cycled the
+				 * backlight; reporting the key as well would
+				 * have userspace change the level again.
+				 */
+				schedule_work(&data->kbd_bl_sync_work);
+				return 1;
+			}
 			report_key_event(input, KEY_KBDILLUMTOGGLE);
 			return 1;
 		default:
@@ -1178,6 +1227,60 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static int lenovo_kbd_bl_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness value)
+{
+	struct hid_device *hdev = to_hid_device(led_cdev->dev->parent);
+
+	return lenovo_send_led_report_tp10ubkbd(hdev, TP10UBKBD_KBD_BL_LED,
+						value);
+}
+
+static enum led_brightness
+lenovo_kbd_bl_brightness_get(struct led_classdev *led_cdev)
+{
+	struct hid_device *hdev = to_hid_device(led_cdev->dev->parent);
+	u8 state;
+
+	if (lenovo_read_led_state_tp10ubkbd(hdev, TP10UBKBD_KBD_BL_LED, &state))
+		return led_cdev->brightness;
+
+	if (state > TP10UBKBD_KBD_BL_MAX)
+		return led_cdev->brightness;
+
+	return state;
+}
+
+/* Reading the state sleeps, so it cannot be done from the report handler. */
+static void lenovo_kbd_bl_sync(struct work_struct *work)
+{
+	struct lenovo_drvdata *data =
+		container_of(work, struct lenovo_drvdata, kbd_bl_sync_work);
+	enum led_brightness value;
+
+	value = lenovo_kbd_bl_brightness_get(&data->led_kbd_bl);
+	data->led_kbd_bl.brightness = value;
+	led_classdev_notify_brightness_hw_changed(&data->led_kbd_bl, value);
+}
+
+static int lenovo_register_kbd_backlight(struct hid_device *hdev)
+{
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
+
+	data->led_kbd_bl.name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s::%s",
+					       dev_name(&hdev->dev),
+					       LED_FUNCTION_KBD_BACKLIGHT);
+	if (!data->led_kbd_bl.name)
+		return -ENOMEM;
+
+	data->led_kbd_bl.max_brightness = TP10UBKBD_KBD_BL_MAX;
+	data->led_kbd_bl.brightness_set_blocking = lenovo_kbd_bl_brightness_set;
+	data->led_kbd_bl.brightness_get = lenovo_kbd_bl_brightness_get;
+	data->led_kbd_bl.flags = LED_HW_PLUGGABLE | LED_BRIGHT_HW_CHANGED;
+
+	return led_classdev_register(&hdev->dev, &data->led_kbd_bl);
+}
+
 static int lenovo_register_leds(struct hid_device *hdev)
 {
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
@@ -1344,6 +1447,7 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 		return -ENOMEM;
 
 	mutex_init(&data->led_report_mutex);
+	INIT_WORK(&data->kbd_bl_sync_work, lenovo_kbd_bl_sync);
 	INIT_WORK(&data->fn_lock_sync_work, lenovo_tp10ubkbd_sync_fn_lock);
 	data->hdev = hdev;
 
@@ -1374,7 +1478,16 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	if (lenovo_has_kbd_backlight(hdev)) {
+		ret = lenovo_register_kbd_backlight(hdev);
+		if (ret)
+			goto err_leds;
+	}
+
 	return 0;
+err_leds:
+	led_classdev_unregister(&data->led_micmute);
+	led_classdev_unregister(&data->led_mute);
 err:
 	sysfs_remove_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
 	return ret;
@@ -1477,6 +1590,9 @@ static void lenovo_remove_tp10ubkbd(struct hid_device *hdev)
 	if (data == NULL)
 		return;
 
+	cancel_work_sync(&data->kbd_bl_sync_work);
+
+	led_classdev_unregister(&data->led_kbd_bl);
 	led_classdev_unregister(&data->led_micmute);
 	led_classdev_unregister(&data->led_mute);
 

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.56.0

