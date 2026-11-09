Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211790;
	b=baYOXumxsV7fmOJZDoU/Rim6ghH+R68XgloS4/4ehCBLMHa4iwIJLUlVUdCp/f5qU0ni
	 jH7x920deb4znj8nYj9bfuvuYwBa8rbZHU32tWeN1qdpbLHtT0T1a4rtl2gHH90YesAhW
	 4fAc1xVxT3BZ8TsBLw5xl4l7RO3WgOp0k/xLWtn5JAeM1mNM1KkCcihuB9xF4RXsQ7c9j
	 w7AWO8Xa8KycMb3Qva1f3GJRz8/G4dN/O9A4IWHUFIltpVzjvHtoajNWSqGcoO2h3sVK/
	 0ICjUnNu/dDZ0ETXAXGI2NrT0gmk7mY9rvJVJd9dZaiPmFEdk5OIbvXdUfIjiNrDl4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
	b=Axc/HGszhU8JDsUVN8MgK5lzfIuS8Gp9EuL5T3TonxYaQ3zSdddlYTd3qdNO11IYd5Xi
	 +IGSUxq1y07ipkbeFzbb9Dr30HIrss+klBzHiuOaxg3Q1Gr2s9OZwd7+RFHpsuYlMySox
	 z9v8zyf6//f0Ar6uHGcXjUfRFTenLgg3AK3Cyj96DdAwRscJZvvDx0xMu4JKEBdixc1W3
	 cax0h2YuPilRqDR8Ro9lNXdJXpll93uhqvH1BsOwlDTs6hTjB/biz6L/VShj59DPnOr5O
	 EZfxIp9EKFDvKStiZIbYmp4+eSNQNC7fRs5f3opNhMvmpMZKO1KKoIpfUX47xigJ9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syyn0Bb3;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85852606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85852606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syyn0Bb3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso1186391eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211789; x=1794816589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
        b=syyn0Bb3WujsQqKe3RBqM1Su4zL2bjghtLPkK16Z+lJGmfLOWaOQXvXu2pwJcxK1Gg
         N9qBnEHjCWpW528StzFRqsGBW4pQ9Hd2FBQXwQai4NkJQHHfkgBQdVNBrtZ2KeLHwbI3
         CMp4Qpuqw65Wmbds1tMj3Rj5LcuZxHbnpQiTdTJguZscXXawYWUQdBqKeLihlg6XHA+q
         3O58ICrykanbfd5dRZB4Pk2++Nr9Y93LKjVwWVrTFsi1XiUVAb+a/au/w4ro4BeJaeKo
         d6pHXRFJHuR4gPhxfUyliWM5pXV2mLvwE08faqJ/AnX+L0DBM4zaBosn+YZuPaJx521N
         ispQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211789; x=1794816589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
        b=idxia2bPSwXY3y1T6jWaIihfHN27C9MlU2YK5QFGZX0GmAtULKULAUC0AUkFzevBTp
         MinJdt2fgdx2ecL9jtkTT9LcQPXTbYeEtVv05qpEJtE2uetdH6doQTKnqjTuWKUBUg6e
         pe+iiOTFuc/QdxpBYuRDz1PGeiwWzByC9v/L/f7vW/PSTWoGU+HeRI38RkgdkQCg6oHH
         gruWQ+NtpP4rXvfqb8sUR1s3uv3R42XAErXHzZppt6UGKrXxb0txZnoKk3fPPuC1lyfe
         eGnRFC/EK2D2sD+3LUNpDFpy0F/HOa3ESwb9yi2NGzhly1Nun8L+mrbezhm5HGI6tz3z
         +Q+A==
X-Forwarded-Encrypted: i=1; AL+hErHExQU/UlpIh9m4Tj8gTztwtabgDlbP7RBMc5fJGXaBNWpjk6dTF5PhRtPKR6NYcbIiMb1YlAMEP/tgigQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EJZGWARcClTSuaMmfQ9WC7uwkbYnqxSZoJtzz4nofkYAFJqFm
	6JxkO0OdHsaNmw6DYqTSsuU/J32jj2YurYxjPCTv6v0jpWcNF1b8gAYU
X-Gm-Gg: AYBFou3a3KTLe+4chQpxsrLD6WJsQF5/NQbFpBS0U0FKR7Zor9DJS9Wn7sZ0ZAt59/P
	aXjgA+48gGpFf1HBdGLwu6NnAfX7ImZsyp/kl/GJv/oLmBEXtoA00194rGiFWrEcq4IQimqHkVn
	GPJygAWwZNoreGroWKmkVyOdZG+dln00HR3EQVwrZTDpwDkdc8/S5MiQAQNPkLNoXg1zESWBZLc
	ZCQXga1UmvpBQEqX3kLSUmzgtvVgw+WkHHD2Y43nusEcvncTNKpAKZz6002qg185vVkyNFVsFII
	HeaRRtp3y2jVDleJqfKXjbiHq7UgRfreRXzVJhgkNZlYJVsvHG/qTLjxTGMECna1QBzKZwq1/L7
	Jdx9PKkjzF0OVywhtPr60ZvL2dW0h5/aJWuX0gOYTpLdZ9oII3xAZndWVGVC02+GcX0biBAC7St
	Qrsfv/WPX/zETZba7pQUvWJ4/CKLger/Ox2+3DssTLB5wPq3f9T2fC/J6OwJGRWf/79V9JKUfNn
	ogE93l97k5WWBaB7S50+RbJvXJXwrvvl9o8gXUvi0N2Ra80xPcS3QRUIxfO0odKCKNvwZXn3+Cv
	adVhbPXt2GHBvx4ZQ17vRDCv7bhM0ni1d4ZTrkH7UNivDvixBfxoeNdSs1dIJi67+lm2/aM6AMi
	JEt/UM7KQtsoUuxSTF8KWqX75rIEtuA9HaPnyAA==
X-Received: by 2002:a05:7301:e0a:b0:373:d25b:8cf0 with SMTP id 5a478bee46e88-373d25b9033mr3417937eec.29.1794211788472;
        Mon, 09 Nov 2026 00:09:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm12000389eec.29.2026.11.09.00.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:47 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: apm-power - remove driver
Date: Mon,  9 Nov 2026 00:09:44 -0800
Message-ID: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
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

The apm-power input handler solely listens for EV_PWR KEY_SUSPEND
events to queue APM_USER_SUSPEND via legacy APM emulation. The only
in-tree platforms generating those events are legacy Sharp Zaurus ARM
machines (spitz/borzoi/akita and collie), none of which were converted
to Device Tree. Both mach-pxa board files and mach-sa1100 were marked
deprecated in v7.3 by commit cc7852314abd ("ARM: PXA: mark remaining
board files as deprecated") and commit 7d92e50ceacd ("ARM: mark
mach-sa1100 as deprecated"), and are queued for removal in v7.5. None
of the remaining ARM platforms or other APM_EMULATION targets
(MIPS_ALCHEMY, PMAC_APM_EMU, and SH_HP6XX) emit EV_PWR input events or
enable CONFIG_INPUT_APMPOWER, and arch/arm/configs/pxa_defconfig
already dropped CONFIG_PXA_SHARPSL at the same time, leaving its
CONFIG_INPUT_APMPOWER=m entry inert.

Normalizing dashes and underscores in scripts/modules-check.sh for v7.5
exposes a module name collision (apm_power) between
drivers/input/apm-power.ko and drivers/power/supply/apm_power.ko.
Remove this obsolete input bridge to resolve the collision rather than
renaming a module whose last target platforms are going away in the
same cycle.

Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/r/20261108225808.1809266-1-sashal@kernel.org
Link: https://lore.kernel.org/r/20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org
Link: https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/configs/pxa_defconfig |   1 -
 drivers/input/Kconfig          |  12 ----
 drivers/input/Makefile         |   2 -
 drivers/input/apm-power.c      | 122 ---------------------------------
 4 files changed, 137 deletions(-)
 delete mode 100644 drivers/input/apm-power.c

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index e7a7ed2b7ef7..e70d2789d1f6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -224,7 +224,6 @@ CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
 CONFIG_INPUT_JOYDEV=m
 CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_APMPOWER=m
 CONFIG_KEYBOARD_ATKBD=m
 CONFIG_KEYBOARD_QT1070=m
 CONFIG_KEYBOARD_GPIO=m
diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 88ecdf5218ee..064beedf5558 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -162,18 +162,6 @@ config INPUT_KUNIT_TEST
 
 	  If in doubt, say "N".
 
-config INPUT_APMPOWER
-	tristate "Input Power Event -> APM Bridge" if EXPERT
-	depends on INPUT && APM_EMULATION
-	help
-	  Say Y here if you want suspend key events to trigger a user
-	  requested suspend through APM. This is useful on embedded
-	  systems where such behaviour is desired without userspace
-	  interaction. If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called apm-power.
-
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 2cd6e1c9a778..7d2af8dfd17e 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -27,6 +27,4 @@ obj-$(CONFIG_INPUT_TOUCHSCREEN)	+= touchscreen/
 obj-$(CONFIG_INPUT_MISC)	+= misc/
 obj-$(CONFIG_INPUT_KUNIT_TEST)	+= tests/
 
-obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
-
 obj-$(CONFIG_RMI4_CORE)		+= rmi4/
diff --git a/drivers/input/apm-power.c b/drivers/input/apm-power.c
deleted file mode 100644
index 028fcaf4c142..000000000000
--- a/drivers/input/apm-power.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Input Power Event -> APM Bridge
- *
- *  Copyright (c) 2007 Richard Purdie
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/tty.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/apm-emulation.h>
-
-static void system_power_event(unsigned int keycode)
-{
-	switch (keycode) {
-	case KEY_SUSPEND:
-		apm_queue_event(APM_USER_SUSPEND);
-		pr_info("Requesting system suspend...\n");
-		break;
-	default:
-		break;
-	}
-}
-
-static void apmpower_event(struct input_handle *handle, unsigned int type,
-			   unsigned int code, int value)
-{
-	/* only react on key down events */
-	if (value != 1)
-		return;
-
-	switch (type) {
-	case EV_PWR:
-		system_power_event(code);
-		break;
-
-	default:
-		break;
-	}
-}
-
-static int apmpower_connect(struct input_handler *handler,
-					  struct input_dev *dev,
-					  const struct input_device_id *id)
-{
-	struct input_handle *handle;
-	int error;
-
-	handle = kzalloc_obj(struct input_handle);
-	if (!handle)
-		return -ENOMEM;
-
-	handle->dev = dev;
-	handle->handler = handler;
-	handle->name = "apm-power";
-
-	error = input_register_handle(handle);
-	if (error) {
-		pr_err("Failed to register input power handler, error %d\n",
-		       error);
-		kfree(handle);
-		return error;
-	}
-
-	error = input_open_device(handle);
-	if (error) {
-		pr_err("Failed to open input power device, error %d\n", error);
-		input_unregister_handle(handle);
-		kfree(handle);
-		return error;
-	}
-
-	return 0;
-}
-
-static void apmpower_disconnect(struct input_handle *handle)
-{
-	input_close_device(handle);
-	input_unregister_handle(handle);
-	kfree(handle);
-}
-
-static const struct input_device_id apmpower_ids[] = {
-	{
-		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
-		.evbit = { BIT_MASK(EV_PWR) },
-	},
-	{ },
-};
-
-MODULE_DEVICE_TABLE(input, apmpower_ids);
-
-static struct input_handler apmpower_handler = {
-	.event =	apmpower_event,
-	.connect =	apmpower_connect,
-	.disconnect =	apmpower_disconnect,
-	.name =		"apm-power",
-	.id_table =	apmpower_ids,
-};
-
-static int __init apmpower_init(void)
-{
-	return input_register_handler(&apmpower_handler);
-}
-
-static void __exit apmpower_exit(void)
-{
-	input_unregister_handler(&apmpower_handler);
-}
-
-module_init(apmpower_init);
-module_exit(apmpower_exit);
-
-MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
-MODULE_DESCRIPTION("Input Power Event -> APM Bridge");
-MODULE_LICENSE("GPL");
-- 
2.56.0.506.g506a7eabc5-goog

