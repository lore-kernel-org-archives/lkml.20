Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417932;
	b=i0nNfkZhRSFET4E2WnmCbQfGTeC52Ze1FRl4YnLbYjX10KFUWUWn8rfLyDV8KewUkCKp
	 czTLpOfML7Oi7o64Z+tVUqPY3WBhYZHax6UGVR4a/A2lOKlnMI4xi3mI7+Y6U7WHTN6jD
	 UuwTf1XSjNK+XJkWAhPTKANFgZxsnw6yt1EFja8bJYwJq+V5NNYwB6fyFw0fWOz9p46UJ
	 5HlxVO49CzvjNHxqcys8d4pniqcic9cmZX+Ikq7jRluodivf3kATjKYVkm79Rb3Ff7w0u
	 kC8SVPSmpQ1utuIYL9J2pFb0s5Y6ZBloJn0OuXAnwMZjUq1AnM0de3YiSO/tU24ZYSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EPkKw5pYWqZKfuR6l0Uwwj3160zV9BnT9S/XFeYV53o=;
	b=JZ7UGfKTdeOeWwXBOck5ZDONCdr7PW3YD79E+fCg9htBr+jaGgAz9QAQHpgNhNxv3xwz
	 IFnIDag0tQX/ALY7qILkQ8HefCUNWD83uZufAqrkhdzmFndtgyPbdNA+AZYdwKYRxFYwt
	 GF0CAhdjxr79ETDO7V9gogJzGnhBz4qUQzOAXjetheMkb8o47W5p29r49WtWwEo+IdJit
	 +OAIOCsisr3aNA12ssTFPqrS1vi/nanEv1BusWhctrv0/IKwzqdupxAhZRU1sn+3rIwNi
	 9nFMBGT/haGfGcTYj8UbgBGNLnXkJHjrL/HAVHlz1KxO2Kc6oAAGa+BddqsFp03ieMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTlhf7eE;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546B606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8546B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTlhf7eE
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so4171191a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417930; x=1795022730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPkKw5pYWqZKfuR6l0Uwwj3160zV9BnT9S/XFeYV53o=;
        b=wTlhf7eEY1wEKfZZhEyBGiWwYa00glYOltzKr2gIiPlvkLkM9aaw31EFi7EcZvxJIG
         Ui0ZNxZ6ebJOLARKwykEkWiu3bOcyemE6RBNK55VKali86qCCTH0EOAkf5XYhcD2jMZK
         +Kstacg3ugg36H7y+a9k3pWQn/IW8FM/o/N81X+tP6YRc6+mcVc1u05YoUjPItU6CFyG
         x+sMlW/KoWhQ7Ce/KamJIAQlPK2rLvug1ovk5qq9Id6KeVuAGFN3yZI8aJEHMR5oCAqP
         QSAhihPGhV+oEQcHHjN7bsjQRtzofWsEiPC+6CkP8YecQu8cqyPVhgT42sav6JtE3oet
         zquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417930; x=1795022730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPkKw5pYWqZKfuR6l0Uwwj3160zV9BnT9S/XFeYV53o=;
        b=PtiKwL/3IhogAwIQquUZ3FcxUt/oPJLBpQaNeHSwYs3iiH4V/PIhIJUUXQT1bQPC7u
         IJvfLlljCUaaHy4QV7a4gDjicLJD7FrMR4M7nG2+CcrRjit5kI+ZIqMODa5KfZNOLUtg
         UngzuhJg7d4Tmj/8Xp0Hq78sW88e/WfMIDzQ1Y7/w6StuEntPDuy50BcVYTyrgfYB6k8
         Tr4OhM/QZeTeN1nhnPndxjUZ4HGSRxwMcJ6XkTckJI+YIwESWgH/3HiTSEIerznrS5US
         y0lzw2E2/dJKZbXvi5687cr7z+rf2FTFEfWHaPItscuvNePh/DGO8uNzHnZaVB7iq1N+
         /z7w==
X-Forwarded-Encrypted: i=1; AL+hErFSCcSUd6thWIUEM2tpBozNFG8fx4x1ZSccjaVuX/Mi2H6ZSIUh916QzRaQaeA29Hlwhz+BgrnwgEcceps=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Icz7ceBUTOiEO26y8vYUxPm6DnPxpFcsa+eSn0axyL2vuFXs0
	4L7NSVOQX0pdn7c3hzBzjI26on6GXpUAL+ke8yNfuCnrwSEeLjore+Gw
X-Gm-Gg: AYBFou2Q6ra496dVcf9YB1uRo6nr7U5hcSBkJvEicf5T31kHHF9VJtvjX4Xy0QgYaoi
	ntNWn7TQ5HSnXnXXlCRoZh4WtPP1gyuvU6wZxzTvi3rb+sEs5Sz4oZ7Hs0G3bthqZSMg7VgAYu6
	T3snE0ht1ri90GV/SQJIUhJPsAEVhf04e9bveDJWwqQDEROf5D375+iQUjhiUl6ckozLmKUGzkA
	be48k2o7VXDkZbUfl4LRtKA5RBdQ03arjq8ilHXWtXNfEJt7/NWNe+RzZksPZU5fzvlSL/yrEfn
	2/tkbaoW6yAJHCEKZzwPDCEmgSwgJ+fRlubVvlvc4C4JHWAb+8XBM4xOgWPg5BFXoGcvQV0fhhN
	D5P174/qB2gnRk8Fw52stfkORneu6Z8MHBgIuIx4TVueq+vnVTluF57LULF50O7EQzJ7iQOR1jR
	m7VXcEkJs6RbXC5tTyBIXayMn6IaYk7GhTPy+Sgd43DgWFOGnF2nRg8Y0PRSx/Y4PNTadFVycXN
	Lg5Mzi5UY53FMWJOqM0/R67bX/xwxo62ZFm4/1SixToG+RqakSLoOg5R3Zw1THpaXqeMjnDbxzd
	9qot+ywRQIrw62SJ+aw3M8mEotc=
X-Received: by 2002:a05:6830:4128:b0:81f:6ea9:aba9 with SMTP id 46e09a7af769-860f28d9cacmr2316447a34.20.1794417929931;
        Wed, 11 Nov 2026 09:25:29 -0800 (PST)
Received: from sh170r6 ([47.221.188.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm4833693a34.4.2026.11.11.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:25:29 -0800 (PST)
From: Matt DeVillier <matt.devillier@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matt DeVillier <matt.devillier@gmail.com>
Subject: [PATCH] platform/chrome: cros_kbd_led_backlight: use matched ACPI device handle
Date: Wed, 11 Nov 2026 11:25:17 -0600
Message-ID: <20261111172517.1407888-1-matt.devillier@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The ACPI backend hardcodes \_SB.KBLT for brightness get/set. Older
coreboot ASL places GOOG0002 there, but newer builds can nest it under
\_SB.CREC, so the absolute path lookup fails even though the driver
already bound to the correct HID.

Evaluate KBQC/KBCM on the ACPI companion of the matched platform
device instead of a fixed path, as done with the Chrome TBMC driver.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 .../platform/chrome/cros_kbd_led_backlight.c  | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 8f992a8f79d05..ad267eee8cadb 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -47,14 +47,14 @@ struct keyboard_led_drvdata {
 
 #ifdef CONFIG_ACPI
 
-/* Keyboard LED ACPI Device must be defined in firmware */
-#define ACPI_KEYBOARD_BACKLIGHT_DEVICE	"\\_SB.KBLT"
-#define ACPI_KEYBOARD_BACKLIGHT_READ	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBQC"
-#define ACPI_KEYBOARD_BACKLIGHT_WRITE	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBCM"
+/* Keyboard LED ACPI methods on the matched GOOG0002 device */
+#define ACPI_KEYBOARD_BACKLIGHT_READ	"KBQC"
+#define ACPI_KEYBOARD_BACKLIGHT_WRITE	"KBCM"
 
 static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
 					     enum led_brightness brightness)
 {
+	acpi_handle handle = ACPI_HANDLE(cdev->dev->parent);
 	union acpi_object param;
 	struct acpi_object_list input;
 	acpi_status status;
@@ -64,7 +64,7 @@ static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
 	input.count = 1;
 	input.pointer = &param;
 
-	status = acpi_evaluate_object(NULL, ACPI_KEYBOARD_BACKLIGHT_WRITE,
+	status = acpi_evaluate_object(handle, ACPI_KEYBOARD_BACKLIGHT_WRITE,
 				      &input, NULL);
 	if (ACPI_FAILURE(status))
 		dev_err(cdev->dev, "Error setting keyboard LED value: %d\n",
@@ -74,10 +74,11 @@ static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
 static enum led_brightness
 keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
 {
+	acpi_handle handle = ACPI_HANDLE(cdev->dev->parent);
 	unsigned long long brightness;
 	acpi_status status;
 
-	status = acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
+	status = acpi_evaluate_integer(handle, ACPI_KEYBOARD_BACKLIGHT_READ,
 				       NULL, &brightness);
 	if (ACPI_FAILURE(status)) {
 		dev_err(cdev->dev, "Error getting keyboard LED value: %d\n",
@@ -91,17 +92,15 @@ keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
 static int keyboard_led_init_acpi(struct platform_device *pdev,
 				  struct keyboard_led *keyboard_led)
 {
-	acpi_handle handle;
-	acpi_status status;
+	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
 
-	/* Look for the keyboard LED ACPI Device */
-	status = acpi_get_handle(ACPI_ROOT_OBJECT,
-				 ACPI_KEYBOARD_BACKLIGHT_DEVICE,
-				 &handle);
-	if (ACPI_FAILURE(status)) {
-		dev_err(&pdev->dev, "Unable to find ACPI device %s: %d\n",
-			ACPI_KEYBOARD_BACKLIGHT_DEVICE, status);
-		return -ENXIO;
+	if (!handle)
+		return -ENODEV;
+
+	if (!acpi_has_method(handle, ACPI_KEYBOARD_BACKLIGHT_READ) ||
+	    !acpi_has_method(handle, ACPI_KEYBOARD_BACKLIGHT_WRITE)) {
+		dev_err(&pdev->dev, "Missing keyboard LED ACPI methods\n");
+		return -ENODEV;
 	}
 
 	return 0;
-- 
2.53.0

