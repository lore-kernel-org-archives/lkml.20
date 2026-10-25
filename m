Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952994;
	b=wPJbzzdHd3l27uXKy8a103uU134mBvrrXL6yT72TpMO9siMMa2ODx/ApqM7+RFPJABXm
	 Bbzoz3JEIG9ZWL7BM9Nhp0pN/lw+4lxTelSKQvHbjonaqcOAN5TwSeEeu1WRwvJGxKP+R
	 IT2rmkaOAA1yGg1wftDn+6CRIoW+Dxk7dJYmLOcd01JRMxBytUDN0gC/tw9gO4Ln029Lu
	 MvomMd2jwla2fzhAm38dzN+ICPHvFkKMT8JlIzdFq4Rsd75g0eEoAwUO6mR7wf4wAOV6S
	 ua/1dMx0z/0BLRaICBYGU3NXvm24kzAH7UTxb0CxyVRs+h/kodeeGjJJkGFnva/XwYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=y6FshiR99RFnuWN54Tkkwtj2Axc2lsc5KYS1qB/8moY=;
	b=ZwIXP82RKuxEbXbtvOsG2yTx5ZPKe/IXXDHd22Q4ockApnp4aaCctULlXwuHOrlB7HQg
	 jsGNgDXt1aWb/0vJSHg2IdTGZv1oSWF7JIsFb2BKb0+JWooZIhtcwY2AreNSzlmz1Kl52
	 jApnL6bFc9e/NHZbGWHYvGkA6Y9PUaibbysxo+mAHVhB4Ogj20Pg930UvH0e+RRm+4vVy
	 kGU2RT3XOKZX66u3d/5XzH+k3u44C7rAtCrLYhhBSBNgRRf232B6kZDVKwBFXakWAV+iy
	 +mM+vOCfHDFHUQGGOrVa/YpLcwvOHm2zmAIyXPwOgmP5dtlXdmgkWnghrY+ZMSMgUmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phSLBhUU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE855606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE855606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phSLBhUU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so2490585e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952992; x=1793557792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6FshiR99RFnuWN54Tkkwtj2Axc2lsc5KYS1qB/8moY=;
        b=phSLBhUUP32B+FeF3l7cQFgwAFjxm5Z0IdxHhnEYceesOsrtlblC2GDX9JWWNO+MuJ
         Rscg+lV6RjIwFJIOVmJD1GJkEUBmhLTozub0+v5+HkvFyANlUYrDxjQ0nZVoQvStK2jk
         JFcqGyD0jXWQHbrH2x/2LS9QmjBFqVrOhgWwek7SaDKIbzMSptvC+atN4Z/XyYODgxDC
         sdFfCPJoZ9hwLjOxzlxxRwE4oQT4FatxP1/iyCoFgMaCUCYENI0r31M3afw1bagU4ca6
         fKuZOZbLMLiR4L0Nf56NtHY0NqO/I+ehPIoApatQrD1hOA6AoaqmVuZGLI5o2IBXarEl
         CJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952992; x=1793557792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6FshiR99RFnuWN54Tkkwtj2Axc2lsc5KYS1qB/8moY=;
        b=0KNKqwZc9Ts8/+xkyYa6NJRU15CMAh9afjMZWwAFM9mm/L3yl84/JNDeSzW8O95JBj
         wmylqWxTd9x8oPodVPsvkZauc8MjB0b9VjP5oKPuVzMNqGT3rwrQ2lTMUmw6OU4fNeV3
         L+PCGTETIv5JJppRxrkHcjFD6/ZbphQTUGyhBvtj39Hcj+/jW6EBlY2yIxJrs/B3+onU
         McIrYhN6EROk/iFis356lPl6TE2ZFNlp/1CLsAwFT3p8s26X6RBLM1kopxIEEc2FI/dS
         QmqzH21io65/xLP1LikkCmmxO2bfvnmBBP4Yw7AtGH8CiCd4Sdv1V4RwqrH9k+5MDvkX
         wRkg==
X-Forwarded-Encrypted: i=1; AKwUvBxSqkyeLTp/OFlRz14Vm08MQlfx3v/nMMj46eX+kU1mUgz7EJmE0/wHHJcurpA7do3qx41/lIO21do4/wQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBbeFNPw3trLwrzeLmRxtNLHekmAczgf0txv/Me45LcRoYYc+q
	zn3itjGak7aZIcPe3LTsAwysVG6br+zhHuFs+sdvrI9hTS0BrKnvUFNV0C/Zse6/dMw=
X-Gm-Gg: AYBFou3HUJAHDlb4HfgTLXwu1TdZcJikKBiZ78hq/pit7bwq7lMJa/OSMDyeYPv/9EN
	ruo86ujPPkx1EjIW6yF6wne09MPdoywVYOnOOjcvekVdc14Jr/5EYN8pbwOSOhq+Eg12B6Xpkjs
	SVAp5rbbta1ll2Kj7kKz7SwbopNnGrLWGaoo1xZRCOOzdkmvLx6EHN2xg/Mth5mv1SW4cI/oWhi
	LE9oWnB9KXRvrnsDS9i2t1EZExw7CMtoHQv3le+KbVk7Qf14N96VLFkRXIcEvRYFB198ijFBsWS
	1O2UA5Wu/pyHekiAl3YgtDxatYmoiCDGscUJR4126SvLt51sxR6v7Ve1pHMHtPr9QYjmqRT0rbf
	8Xhf8tU9ixtU+nGzgKtOtFOrTk/9FkHhahCW3JAEzP3PHxVHH7hzSadmWFJWI53UImAdC/UqAui
	kIkNxXKioqAnVSIhnexE/A3ypFr1lOB7PU7Y8w/dVLTnnZcU0WFh0hzYaIEz342RPsLP0DgZ/zn
	Gqb0+N0qqF2eP+tW6K4VMTZzdN62zqrPrYumX+kyeRB2ogCapzH7g==
X-Received: by 2002:a05:600c:34c9:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4a35acb994bmr84167185e9.34.1792952992058;
        Sun, 25 Oct 2026 11:29:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm138255175e9.14.2026.10.25.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:29:51 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 25 Oct 2026 21:29:37 +0300
Subject: [PATCH 2/2] platform/x86: asus-wmi: unify WMI and HID keyboard
 brightness stepping
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-b4-asus-kbd-fixes-v1-2-fa4dcf7d2a69@gmail.com>
References: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
In-Reply-To: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

WMI notifications and USB HID event passes calculate brightness steps in
two separate functions: asus_wmi_handle_event_code() and asus_hid_event().
The WMI path reads asus->kbd_led_wk under asus_ref.lock in
asus_wmi_handle_event_code(), drops the lock, and then calls
kbd_led_set_by_kbd(), which re-acquires asus_ref.lock. A concurrent event
arriving between the two critical sections can overwrite the newer state.

Consolidate the step arithmetic into a helper, asus_kbd_led_calc_next(),
and add asus_kbd_led_step() to calculate and store the new brightness
level in a single asus_ref.lock critical section. Route the WMI notify
handlers through this helper and remove kbd_led_set_by_kbd(). In
asus_hid_event(), reuse asus_kbd_led_calc_next() under the existing
critical section to keep stepping logic identical across endpoints.

The step logic remains unchanged; locking is consolidated into a single
critical section.

Cc: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 75 ++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2478361b9b531..533c50c1dba6e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1815,6 +1815,39 @@ static void kbd_led_update_all(struct work_struct *work)
 	}
 }
 
+static inline int asus_kbd_led_calc_next(int cur, enum asus_hid_event event)
+{
+	switch (event) {
+	case ASUS_EV_BRTUP:
+		cur += 1;
+		break;
+	case ASUS_EV_BRTDOWN:
+		cur -= 1;
+		break;
+	case ASUS_EV_BRTTOGGLE:
+		cur = (cur >= ASUS_EV_MAX_BRIGHTNESS) ? 0 : cur + 1;
+		break;
+	default:
+		return cur;
+	}
+
+	return clamp_val(cur, 0, ASUS_EV_MAX_BRIGHTNESS);
+}
+
+static int asus_kbd_led_step(struct asus_wmi *asus, enum asus_hid_event event)
+{
+	if (!asus)
+		return -ENODEV;
+
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
+		asus->kbd_led_notify = true;
+	}
+
+	queue_work(asus->led_workqueue, &asus->kbd_led_work);
+	return 0;
+}
+
 /*
  * This function is called from hid-asus to inform asus-wmi of brightness
  * changes initiated by the keyboard backlight keys.
@@ -1822,31 +1855,13 @@ static void kbd_led_update_all(struct work_struct *work)
 int asus_hid_event(enum asus_hid_event event)
 {
 	struct asus_wmi *asus;
-	int brightness;
 
 	guard(spinlock_irqsave)(&asus_ref.lock);
 	asus = asus_ref.asus;
 	if (!asus || !asus->kbd_led_registered)
 		return -EBUSY;
 
-	brightness = asus->kbd_led_wk;
-
-	switch (event) {
-	case ASUS_EV_BRTUP:
-		brightness += 1;
-		break;
-	case ASUS_EV_BRTDOWN:
-		brightness -= 1;
-		break;
-	case ASUS_EV_BRTTOGGLE:
-		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
-			brightness = 0;
-		else
-			brightness += 1;
-		break;
-	}
-
-	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
+	asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
 	asus->kbd_led_notify = true;
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
 	return 0;
@@ -1960,15 +1975,6 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
-{
-	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
-		asus->kbd_led_notify = true;
-	}
-	queue_work(asus->led_workqueue, &asus->kbd_led_work);
-}
-
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 {
 	struct asus_wmi *asus;
@@ -4679,7 +4685,6 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	enum led_brightness led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 
@@ -4696,22 +4701,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		led_value = asus->kbd_led_wk;
-
 	if (code == NOTIFY_KBD_BRTUP) {
-		kbd_led_set_by_kbd(asus, led_value + 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTUP);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTDWN) {
-		kbd_led_set_by_kbd(asus, led_value - 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTDOWN);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
-			kbd_led_set_by_kbd(asus, 0);
-		else
-			kbd_led_set_by_kbd(asus, led_value + 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTTOGGLE);
 		return;
 	}
 

-- 
2.56.0

