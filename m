Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B352F9C37
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791065256; cv=none; b=LTQVnxC3+l9kMcJDODT9zwA/dm5WfKQT98TLYzaHLtTmb9Mt4VfIHT3Lr8DncamPAHyu8WPbv7lvsxfAOW1zxkkFfBXR/HhGDfv90eZZGmBJhQVeqyKf1DuUPLZWBP4KLjP8/0So2xDVDB6pTenlhmQsG1EcEDloW6SimYmvH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791065256; c=relaxed/simple;
	bh=wNt5RXQgaGTgkq4JGxWl54lQqBM8IU3v5NoGU/Th9YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIdSK/6frvr2B+q0PW3twU43QfYa5se5WPS6rQDBS4JJb0MlvEzYRyhY11216yZlA+b59FIsKB8T502/vt5Ol1dWVCcfmp16lM5aAjkZZCqanIP03sUG8UXby7359/AZtvZKqCwdbwcGiDj6Po46roYxscKBaVvTYFeeIqivR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQl4qTCE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQl4qTCE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso6685825e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791065252; x=1791670052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrcQD0fG5yzGP1DmVTEJix1v2RysWyPw2gcDP05uFGA=;
        b=nQl4qTCEiXwqd/qAYk2rI5J0EW0RaWm7A8/9Ke+7ZikGCVuOoCSejnbeGvpakculS1
         X5HJvD6uM8xq/fMK3TD1beRL1Hyat8L/o7KdYvAFXj12mHdrCU0D11dz+ZrKaCrUXf9+
         SUfbfLUkd3eC2s6TU9pI6gsoF/Pu3rTnjyk7oPiMIe+ePrFVAVLKbheykY6pI9d0SMIO
         oOFDChuVvbhes8xSQ75RiMQFf1fDwloi4zTqJmzKtm5YAl2i0zgPXu5Axrfmx+w+7ER5
         E/PyYMzRCrmqNDjyDJ2M63RikWexdEiwVkPrYkYEqvgdJZZH5+Qve2qhMA7zQyptNV/O
         RtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791065252; x=1791670052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrcQD0fG5yzGP1DmVTEJix1v2RysWyPw2gcDP05uFGA=;
        b=LDRBSwL7riUJ2iqmVdrI3kVN4kva9wAMgFRRSsV6akcuPl9mA4KDEJxdSBfsBbxwau
         OKjeh32r1ImJCUykozudNwR2U+J917oRYZ276Lyw7zzg+QynBul/40arHCskZZO1e2p7
         2BWGzu9QW8hhF+8+GIrrnJLitKgxYo4pzch0qFaWgS5gQztKlhOqp5BqRCrdBqLwkBlO
         Ss9mPgxKWPkf/2QS8sPsTT08j26h7tuNbniSWezoTM8C62Tylq+/ZRB6gVuvNXywFmN4
         WltBOJR7RpUy61YfbSKsQeukBVIwZM+O2KBbuyOvLhH5D+HsPOHZyhN6uq5Drw00N39t
         B3Bw==
X-Forwarded-Encrypted: i=1; AKwUvBya1j4kTxr3AuV8CH/ObomgJDt0px+Gh6NBtzUZDQDqLtQUD0UpJTQNlQlLQW6M9HnzU0DOew1q3VX22Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++l/RUpN69CmRml87lWu8NhuaX+4eZoMseRBCkTH0vKV86T2j3j6
	wbuOjwnFwVvfYitj56lvWuBGN0uZeVE2E4TyV3+/JZyXrsAe1aI95rqT
X-Gm-Gg: AYBFou1GlsCJgxzJxJW1lw+RVaCyr7UMeSO0iQd6xCC9dkoQ66W0Uw1A7/mbebSQsB9
	pvMZuD9hnRFpg7odjwN8mUvlSZE65C71IMw63xeCsOC0nEttupEERlDTcs3SD3BiC++ijovFQU+
	bl2Y8Ks08zDvirVmtG3pcgQclNe5fOLZXN4YQWEsuJNj2NtzEYgCHiq8KiAKGOqwcHS8l8RCN8s
	fmRoXLwKinIJBH0XPPWSyhObWFrQdmbio1KcH6/IGKP6HFCqaTJ4qwvsBcb7zafBTuVMmt7+UPo
	co0w5/giJi7tNaa8tb8SdWKaR7Uam8Fchp7VFd/zoKb7CvJOOpJRvmA+/5BBFmhk3tLufnjl+51
	8DiFMUpaZ8R7M+H+GLlLlTaBa9Zb49SYBtUX1rez8q30pNAremlxvPmmLn8RR3/vZTkf62muBmx
	1pD4cWjSbKBqz44piMDsBCn+IGiMnXbz8hY+aPV/UAcmYQjx+3/FUWuYCzsg6BSaogEtEZp1HwI
	nKMt0FYzakFRlIfkp9cPHWRwmGpkW1+3lkonUXcNEf7ug==
X-Received: by 2002:a05:600c:46cc:b0:4a0:1a7f:2ab7 with SMTP id 5b1f17b1804b1-4a027542cbbmr112974325e9.10.1791065252059;
        Sat, 03 Oct 2026 15:07:32 -0700 (PDT)
Received: from gentoo.netbird.selfhosted (vmi3588025.contaboserver.net. [169.58.107.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm157392735e9.2.2026.10.03.15.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:07:30 -0700 (PDT)
From: Vovan Nikolaevich <vov4ik533@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Add user-status LED support
Date: Sun,  4 Oct 2026 01:06:53 +0300
Message-ID: <20261003220653.123909-1-vov4ik533@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some ASUS laptops expose a user-status LED through WMI DEVID 0x00040019.
On the tested ExpertBook B5402 this is the orange user-status indicator
used, among other things, as an "in a meeting" signal. DSTS reports
presence and the current state, and DEVS 0/1 switches the LED off and on.
The official ASUS userspace controls the same binary WMI capability and
applies any Auto/Busy/Off policy in userspace; this driver exports only
the physical LED.

Register a binary LED class device when a state read succeeds. A
successful read is used instead of asus_wmi_dev_is_present() because
some firmware returns ASUS_WMI_UNSUPPORTED_METHOD (0xFFFFFFFE) for
this DEVID, and that value still has the DSTS presence bit set.

The LED is named ":status": LED_FUNCTION_STATUS describes the binary
on/off state, the device name is omitted since the LED is not tied to
another kernel device, and the colour is left out because it is only
verified to be orange on the tested model.

The WMI interface and firmware behavior across public ASUS DSDT tables
were investigated, and the LED class naming and patch were developed
and reviewed, with LLM assistance.

The same WMI LED support was built and runtime-tested by the author as
a local patch against gentoo-kernel-7.2.8 on an ASUS ExpertBook
B5402CBA (BIOS B5402CBA.314), including physical LED on/off validation.
This upstream version was additionally build-tested against the current
platform-drivers-x86 for-next branch.

Assisted-by: LLM

Signed-off-by: Vovan Nikolaevich <vov4ik533@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 37 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 711f59c1aa62..7cb954c22db3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -263,6 +263,7 @@ struct asus_wmi {
 	struct led_classdev micmute_led;
 	struct led_classdev mute_led;
 	struct led_classdev camera_led;
+	struct led_classdev user_status_led;
 	struct workqueue_struct *led_workqueue;
 	struct work_struct tpd_led_work;
 	struct work_struct wlan_led_work;
@@ -2085,6 +2086,24 @@ static int camera_led_set(struct led_classdev *led_cdev,
 	return err < 0 ? err : 0;
 }
 
+static enum led_brightness user_status_led_get(struct led_classdev *led_cdev)
+{
+	struct asus_wmi *asus;
+
+	asus = container_of(led_cdev, struct asus_wmi, user_status_led);
+	return asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_USER_STATUS_LED);
+}
+
+static int user_status_led_set(struct led_classdev *led_cdev,
+			       enum led_brightness brightness)
+{
+	int state = brightness != LED_OFF;
+	int err;
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_USER_STATUS_LED, state, NULL);
+	return err < 0 ? err : 0;
+}
+
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
 	scoped_guard(spinlock_irqsave, &asus_ref.lock)
@@ -2096,6 +2115,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 	led_classdev_unregister(&asus->micmute_led);
 	led_classdev_unregister(&asus->mute_led);
 	led_classdev_unregister(&asus->camera_led);
+	led_classdev_unregister(&asus->user_status_led);
 
 	if (asus->led_workqueue)
 		destroy_workqueue(asus->led_workqueue);
@@ -2228,6 +2248,23 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
+	/*
+	 * Gate on a successful state read rather than asus_wmi_dev_is_present():
+	 * some firmware returns ASUS_WMI_UNSUPPORTED_METHOD (0xFFFFFFFE) for
+	 * this DEVID, which still has the DSTS presence bit set.
+	 */
+	if (asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_USER_STATUS_LED) >= 0) {
+		asus->user_status_led.name = ":" LED_FUNCTION_STATUS;
+		asus->user_status_led.max_brightness = 1;
+		asus->user_status_led.brightness_get = user_status_led_get;
+		asus->user_status_led.brightness_set_blocking = user_status_led_set;
+
+		rv = led_classdev_register(&asus->platform_device->dev,
+					   &asus->user_status_led);
+		if (rv)
+			goto error;
+	}
+
 	if (asus->oobe_state_available) {
 		/*
 		 * Disable OOBE state, so that e.g. the keyboard backlight
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index be4d2873ffc9..b2f54d865689 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -54,6 +54,7 @@
 #define ASUS_WMI_DEVID_LED5		0x00020015
 #define ASUS_WMI_DEVID_LED6		0x00020016
 #define ASUS_WMI_DEVID_MICMUTE_LED		0x00040017
+#define ASUS_WMI_DEVID_USER_STATUS_LED		0x00040019
 #define ASUS_WMI_DEVID_MUTE_LED	0x0004001C
 
 /* Disable Camera LED */

base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

