Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D947C108
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755006; cv=none; b=Cw90AFDZ137Yo0yE8R3umJN17ktUkawKFjFZOp8KDdi6K2XUI29kIPzfcRrwhc3GwUL6PNe1PN2bHftUtLc194YJSfkV7WRe0Iktm24vnL3kCOB+dwvOj2TKVv9+jKXszcLS8hgcoyPKaPmTOm5Xy3XkDCGNUcZUiU7DAP54lbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755006; c=relaxed/simple;
	bh=g2dDcbuELeoyq024UQ7gXyKl9zmzOJf9YkgYRJ77ljI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nt0PdBwF16HNiO8uDlbGiEM3Qy5WA0MOPfj8HH1BGx/fcrPLu5cr/Rht80mk9g7GBJkLgJp6i5XJ4rJzNIaXB3HH+OdHSg+9jMKSHjP5s9ieAYxj7JX8c7cx/EZq2Tq9PffJw8zxiuz87w4sNizBJi0mrK9FnzfA8DpwDa+273w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCwt6QFi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCwt6QFi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so6046175e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755003; x=1790359803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKlUeTgsUIfRI0atORsIxb1VqvMvzHxb6pWhQeWrV9k=;
        b=YCwt6QFiHq+D4VlriQ8DmObjeX+q6E6ruhxqrOQsn3TUysH3VZ5pHMfAHVKEAn2RN3
         xxGjUxmX7Wq3OFKNCu1WnPFEwWVtWr6+rC3UCtRgPqFfHM8ojV7ArlKfLe1TxWh1mlD+
         jVj8grFgndB4n6pWStnfkGVZSlsekJh+NJJBsKgS02SUHsAvv3xAgOepqq9B/jqJGKFK
         fj52b6NHXXxKggXPKVS26XI4ZO2g5r/jF2YOywYnFi+x5+jnob7eLPh+yZ+QEDznC5Sv
         vr16Zk7HZPqRm9V15CxBBZhvVBDi55akhPKb2tVsEK8IF23CsTN1qo07am0YftgOC/vL
         el/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755003; x=1790359803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKlUeTgsUIfRI0atORsIxb1VqvMvzHxb6pWhQeWrV9k=;
        b=wCAGEjrmcDS/E9urD7VkwGayFxPZ1tf5Mn4Q/YNObGUbBWIYvrgc+xh8Or3oOE7Btv
         AZewsIJLAeJSCk9EHlYPJlIrwrkv72rz2rt1PhEKnWDAUgWgofYGI4Xt2JwRjCVEvLba
         zxhsHL/FknA4vW/oS8D49/YzYHXhTxCIgjDkmqnIXNhG2xGZwp8va1qoTpIOJIxzIQDe
         XgJpX2cJW75PbiF6aQEllcc2bxpXy+tzuQH/19Vvf+eX+gLcm+6u6QAA++IwvtfHLOi+
         iPsbmaFBtmCCLeuu86eYKsGtKcmqYruLLXc/PJFwjQ6h3KICuP8mBU8LWNGmvNG2BWFQ
         6YNw==
X-Forwarded-Encrypted: i=1; AKwUvBytZdOz8s5FlxtF1GAuMzzSWQ+yBe7Bu4xHkumjL5cm9zQoX3WKK9tU0d7kaAXwT0Bh7Kzmqz8KsclWapQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nNe/Igbi5HTJdGKfTPQr4KZnRuAN0PHQh0d+JKcgh8F16aMq9Z
	J5xr0stWy8br3aIZNsR7ZPzcBYWti4fwBnxvhGalXVicc9pC/VD86+/3
X-Gm-Gg: AYBFou0ef4ooEf1C9TDf3MlL4PNjqUufT2kA74IA6hUyUSvZ+diipDF64YItkOCAKy2
	Bq3uztPqr56KdhBJSO5NmSegvIjwW4/ScgVPmDlLSyH6MzD3YXCYUlCO55mOM/8i94Fbgis+gXI
	cSVy2MSDVND6PxTjAIr6YF+XDkSSsdwZox1+AJ4buhw/ikhFD32OaMXyxf98VrZiUutHcBZW3ht
	p7Zcze63lxd2bPrZEnDfCkvSDbQH0JzH9h7FKyauzc+nSCWTECvIAuULUOLdSzNpqrr1lM2GjCr
	W3Tudgp2oiwiDxCKSYAoKOLPooA8xq6wm1IQSPo03M7+o06fSVbR+hSyPv6Q/mpAYNRVTvvBrWD
	NwI0Sbzn7+9k4bROiPXgg5VsW9fLFUZcghy+ha9fPY2322gAeUAmf9ti9yUsj0AsN/ewWE+RTOc
	0nB8jkPOTTplP+ACgX/XaT9XvqC4buoFhq7LAjlPwQRbwgLcjq+UXefIbnS06lBPax0kPWWT9gY
	wfX3PUlvaowW1lj89I=
X-Received: by 2002:a05:600c:6308:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49fc5728e35mr46424925e9.20.1789755002999;
        Fri, 18 Sep 2026 11:10:02 -0700 (PDT)
Received: from Jorge-Linux ([2a0c:5a82:3505:c900:6bc4:7c82:6f6f:f81a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm39304715e9.1.2026.09.18.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:10:02 -0700 (PDT)
From: =?UTF-8?q?Jorge=20N=C3=BA=C3=B1ez=20Granero?= <eljorge199525@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jorge=20N=C3=BA=C3=B1ez=20Granero?= <eljorge199525@gmail.com>
Subject: [PATCH] platform/x86: asus-wmi: add speaker mute LED
Date: Fri, 18 Sep 2026 20:09:54 +0200
Message-ID: <20260918180954.56382-1-eljorge199525@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some ASUS laptops (e.g. the ExpertBook B3405CCA) have a mute LED on the
F1 key next to the mic mute LED on F4. The mic mute LED is already
driven through WMI device 0x00040017, but the speaker mute LED is not
known to the driver, so it never lights up under Linux while the
firmware does light it under Windows.

The DSDT of the B3405CCA exposes device 0x0004001C in the same LED
group with the presence bit set, and calling DEVS(0x0004001C, 1/0)
turns the F1 key LED on and off.

Register it as "platform::mute" with the "audio-mute" default trigger,
mirroring the existing mic mute LED, so that the snd-ctl-led speaker
mode drives it automatically. Only registered when the firmware
reports the device as present, so nothing changes on other models.

Tested on an ASUS ExpertBook B3405CCA (BIOS 307): DSTS reports the
device present and DEVS 1/0 toggles the LED.

Signed-off-by: Jorge Núñez Granero <eljorge199525@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 24 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a650904..60bbd10 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -262,6 +262,7 @@ struct asus_wmi {
 	struct led_classdev lightbar_led;
 	int lightbar_led_wk;
 	struct led_classdev micmute_led;
+	struct led_classdev mute_led;
 	struct led_classdev camera_led;
 	struct workqueue_struct *led_workqueue;
 	struct work_struct tpd_led_work;
@@ -2054,6 +2055,16 @@ static int micmute_led_set(struct led_classdev *led_cdev,
 	return err < 0 ? err : 0;
 }
 
+static int mute_led_set(struct led_classdev *led_cdev,
+			enum led_brightness brightness)
+{
+	int state = brightness != LED_OFF;
+	int err;
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MUTE_LED, state, NULL);
+	return err < 0 ? err : 0;
+}
+
 static enum led_brightness camera_led_get(struct led_classdev *led_cdev)
 {
 	struct asus_wmi *asus;
@@ -2084,6 +2095,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 	led_classdev_unregister(&asus->wlan_led);
 	led_classdev_unregister(&asus->lightbar_led);
 	led_classdev_unregister(&asus->micmute_led);
+	led_classdev_unregister(&asus->mute_led);
 	led_classdev_unregister(&asus->camera_led);
 
 	if (asus->led_workqueue)
@@ -2181,6 +2193,18 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MUTE_LED)) {
+		asus->mute_led.name = "platform::mute";
+		asus->mute_led.max_brightness = 1;
+		asus->mute_led.brightness_set_blocking = mute_led_set;
+		asus->mute_led.default_trigger = "audio-mute";
+
+		rv = led_classdev_register(&asus->platform_device->dev,
+					   &asus->mute_led);
+		if (rv)
+			goto error;
+	}
+
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
 		asus->camera_led.name = "asus::camera";
 		asus->camera_led.max_brightness = 1;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c8..6cb2e58 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -54,6 +54,7 @@
 #define ASUS_WMI_DEVID_LED5		0x00020015
 #define ASUS_WMI_DEVID_LED6		0x00020016
 #define ASUS_WMI_DEVID_MICMUTE_LED		0x00040017
+#define ASUS_WMI_DEVID_MUTE_LED		0x0004001C
 
 /* Disable Camera LED */
 #define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on (unused) */
-- 
2.55.0

