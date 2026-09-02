Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D537756B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371260; cv=none; b=tP14Ap6yebha++WLounYwo1Rd+Zx1QJin/vYeAw+PCXkkChskuA0pN1F7E+8A9EC+ryQT7DdETW6zSaUu0o32HHSSLV6n195Z6rTOWLgJJE8tgxAOjQ5MuPAffbSKddtYVtZACqi0jrWP6ReLIuegtyToon5oudvfgwsE5+EOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371260; c=relaxed/simple;
	bh=gXEosb8CMRb1UXN41ZT9pY3EtnW7zgAt89WGeEYzu2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wz+LSbAuemxK6+hepXUUz3tZVr9XMB0TEY0P0u18qpYvk4J09vtZA2zmtctATMjfr5WcO0Nby/+mssDLQ5uF/0fykmF217SEATlkGj729qssDzHRCLd6inbraldcM5VfL4bEvcf5elNx+xJX/M7gDYexuFSh8S6FctRNjSP3fko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSR9BfuY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSR9BfuY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1272419a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371258; x=1788976058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ay1coFvWOs2E2g41bXIVDKRlEoaNqpmJez8UBW0Q5bY=;
        b=eSR9BfuYsSUpniVwiv4SGZC2rX2fnQiLrpTyvwttsURol7txP1s8e7fRWjXU66cshP
         T4tN3aSbDT01+72POcXZ5TLUj4+LjHts2P4miSKrelFpt76Ts2xPBGv2hnJZtzZJQutQ
         /zTkb8OcVZIImXXVmQhjwJRN400SJoEVQnXrs5qTHtoISDm+V8CIxJuoAZSq4wpM1Ezv
         55MjLNFU7VM2qLUmLTxT8A6Oz8ou5G42UCNe5fz5ptwHVFOULOQL4U4tQymAeTQ2dpry
         EjS0gT1QSYT21UILCniNl8Qr70ndMNBJ0o8cjA8cl5zsp+Ow5Jn+5GP1v+MkgG2HJ/OD
         bW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371258; x=1788976058;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay1coFvWOs2E2g41bXIVDKRlEoaNqpmJez8UBW0Q5bY=;
        b=Oebg7GgSukbOUiE6P8TJqiQ6ytX1s6XClBZKeq4d9St0X1KczuZp6QUf0TJBwrFUMq
         R6tgB+gWyVqyIXMnIxgozOpRPh0s0stryk35irbeQELN9aF6Xgn1FQGPQ/xLv0PNdHmS
         5q2QBHoqVXMY8N9xTWOA9GMrn719odU0/CkdoSbHBL+k8bGhkFXAjqssnK0q8ktz8brm
         kM1TVHf+WOAz3xxnxrfndmbzqYf/Zrv3h6Vn/riL02rTtENUA+LklZ8zKka0p3FLqS9L
         uUdmy4ynYE4zfiPADsUsc1aGzZ+6RUes4ernhAxu+rE+aBuvznvcT4IS14TookWYB2dH
         iKUA==
X-Gm-Message-State: AFuF++mB8m3RZZ2zUp9VnWI82C0R14ODXLz8nlzn1XU0Q9Kjb8/TdMBH
	Eol22uIZVhKjbV/VcTwftC5S72buwg94r0IBNwXrvqKfHhs7dsMJnU2V
X-Gm-Gg: AYBFou01xNZrHvxCyNN+DExbisCCksckdrylZ2wShJUFWYhJYC41Vkd3t2s67KK4p2m
	Vut/OPOmBTwfQEi13oP5k8LQvbpYMZ/YHtPZ8gfMOJoB0bA1AGtcU6pwAuKdq/2kWgPOPYJU9w3
	qiG6gl03fHFI/HKmhdR1rFmUZI/z17NsF2xrn+I7grhijRtgtXTpyifm83xTl8wN619oizNvjOY
	qYWaQBW5oeANV51zElF0IGnoAAya6sMqITUKHn2VTPu+sYycLGe67gJGHKx6lXsauwV57KvCqBz
	YeG16qrHxgMLxhhgpo6Q5Cpwe752ouJzU1ipPDwyj97+CCG/8KYLUkBqIGFgmuMngOABXXkpS1h
	/3t8UJiCT8Z61wgROX/DmB3Y+N+1sR4OpoW1tfNnBVD3scGJFv0DuTrTwceU8IOfC6NKYYbDHEX
	kQH6Jb6NykT1sFrC8+E+yZvxeVQe/cayopsIJs040TzT07E7KWmULDe1/EYbv475bT5Zu0C9EQ2
	acVqDzha7xYzOpE
X-Received: by 2002:a17:90b:2f06:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39aee12359fmr10172568a91.19.1788371257581;
        Wed, 02 Sep 2026 10:47:37 -0700 (PDT)
Received: from mizar.onca-liberty.ts.net ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm470584a91.8.2026.09.02.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:47:37 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	"Luke D . Jones" <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: asus-wmi: use named masks for TUF RGB commands
Date: Thu,  3 Sep 2026 00:47:16 +0700
Message-ID: <20260902174718.16228-2-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902174718.16228-1-idotohors@gmail.com>
References: <20260902174718.16228-1-idotohors@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace open-coded bit shifts and magic numbers in kbd_rgb_mode_store()
and kbd_rgb_state_store() with FIELD_PREP() and named GENMASK() masks.

Define ASUS_WMI_TUF_RGB_STATE_CMD_ID (0xbd) as a named constant instead
of an inline literal, making the required arg0 command ID self-documenting.

In kbd_rgb_state_store(), remove the unused intermediate "flags" variable
entirely. The old BIT(1)/BIT(3)/BIT(5)/BIT(7) construction is replaced by
FIELD_PREP with per-flag named masks (TUF_RGB_STATE_BOOT, _AWAKE, _SLEEP,
_KEYBOARD), building arg0 directly. This preserves the exact sysfs input
format ("cmd boot awake sleep keyboard") and the resulting WMI argument
bit layout — no behavioral change.

In kbd_rgb_mode_store(), replace the positional shift expressions for
arg1 and arg2 with FIELD_PREP using TUF_RGB_MODE_{CMD,MODE,RED,GREEN}
and TUF_RGB_MODE_{BLUE,SPEED} masks respectively.

This is a preparatory cleanup to improve readability before adding
model-specific quirks that depend on these definitions.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 48 ++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429..efc730c2c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -15,6 +15,7 @@
 
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1047,6 +1048,27 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* TUF Laptop Keyboard RGB Modes **********************************************/
+
+/* Command IDs passed in arg0 byte 0 for TUF RGB WMI methods */
+#define ASUS_WMI_TUF_RGB_STATE_CMD_ID	0xbd
+
+/* Bit mask for the save-to-BIOS command flag in kbd_rgb_state_store (arg0 bit 10) */
+#define TUF_RGB_STATE_SAVE	GENMASK(10, 10)
+
+/* Bit masks for kbd_rgb_state_store flags field (arg0 bits [23:16]) */
+#define TUF_RGB_STATE_BOOT	GENMASK(17, 17)
+#define TUF_RGB_STATE_AWAKE	GENMASK(19, 19)
+#define TUF_RGB_STATE_SLEEP	GENMASK(21, 21)
+#define TUF_RGB_STATE_KEYBOARD	GENMASK(23, 23)
+
+/* Bit masks for kbd_rgb_mode_store fields */
+#define TUF_RGB_MODE_CMD	GENMASK(7, 0)
+#define TUF_RGB_MODE_MODE	GENMASK(15, 8)
+#define TUF_RGB_MODE_RED	GENMASK(23, 16)
+#define TUF_RGB_MODE_GREEN	GENMASK(31, 24)
+#define TUF_RGB_MODE_BLUE	GENMASK(7, 0)
+#define TUF_RGB_MODE_SPEED	GENMASK(15, 8)
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1093,7 +1115,12 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 	}
 
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS, asus->kbd_rgb_dev,
-			cmd | (mode << 8) | (r << 16) | (g << 24), b | (speed << 8), NULL);
+			FIELD_PREP(TUF_RGB_MODE_CMD, cmd) |
+			FIELD_PREP(TUF_RGB_MODE_MODE, mode) |
+			FIELD_PREP(TUF_RGB_MODE_RED, r) |
+			FIELD_PREP(TUF_RGB_MODE_GREEN, g),
+			FIELD_PREP(TUF_RGB_MODE_BLUE, b) |
+			FIELD_PREP(TUF_RGB_MODE_SPEED, speed), NULL);
 	if (err)
 		return err;
 
@@ -1119,28 +1146,29 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	u32 flags, cmd, boot, awake, sleep, keyboard;
+	u32 cmd, boot, awake, sleep, keyboard;
+	u32 arg0;
 	int err;
 
 	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
 		return -EINVAL;
 
+	arg0 = ASUS_WMI_TUF_RGB_STATE_CMD_ID;
+
 	if (cmd)
-		cmd = BIT(2);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_SAVE, 1);
 
-	flags = 0;
 	if (boot)
-		flags |= BIT(1);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_BOOT, 1);
 	if (awake)
-		flags |= BIT(3);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_AWAKE, 1);
 	if (sleep)
-		flags |= BIT(5);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_SLEEP, 1);
 	if (keyboard)
-		flags |= BIT(7);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_KEYBOARD, 1);
 
-	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
-			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
+			ASUS_WMI_DEVID_TUF_RGB_STATE, arg0, 0, NULL);
 	if (err)
 		return err;
 
-- 
2.55.0

