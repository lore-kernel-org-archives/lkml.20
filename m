Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9244BB80D;
	Thu,  3 Sep 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446919; cv=none; b=BPJOptBYOj8P5vXE20a3vDmJwdboe1OWfqXCc7z3xR9w3Rp8W4aak21WXRbyueIOv1WRNfQhyLWULDw4tc/aIJWSksj3gU2Azo8YPPIyLy/9DISwWMIj9lqIeUVaBH3n8YR6fdDtIEgAPpp9mo397UX3SY19SQxdXmYFowgBo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446919; c=relaxed/simple;
	bh=7PR0tE664SrEKUrrvEpFf3dr9BxOTxo3gbfyZ5sTqwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6FIQFlfLWh5O1OkOGvwhYguE6OIsziPQogPq3lZIWbhxSz1SsEghIWucTg5PzTc+CRMR3iD+VRng6SLCeHp5z1Qsf1fVQmYmKL0RWXJZkGCsxbu264e0pvjChhq6lL4ej8SwudA1ZlsugGL+UXdW4MyF1sNuwRE/5oYwGQedpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QMufVQds; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PsH/xDLN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QMufVQds";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PsH/xDLN"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788446915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSiPl1Eq7KKLTt1UhXrTqQ8J4cUQVL1d4HGOdMyYuAc=;
	b=QMufVQdsYuUDNntGCbXiKOsw4H4d1WuJWkRXsKmuKp9kSuhhjZN8Y3XI5VZyrX76McB5oB
	TWENZ6L8dOws5wmr3yES2EPlxPWuiW+0AdVPTgam0DquyyHQluTMsqR31EcaLnvxajyLLK
	lTah5iANXTKZmcrN4pyAMQLnCDVng8SA7DCNoD/QpeODLXT2Sc7cGIunSneLlZJejN9zfQ
	PKjn2gZ8Sb1WLyOd3aJs477E+sOvioUtzDFEKxpvUl0ixGUUBH8Gdjx5eLC+FhkI2FxYo+
	JOjtgGdPKk7Hmw0GE/2gvEuoNddOYiKgtMr6hs39g8DtWPTZ9IfN4cic5eUBXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788446915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSiPl1Eq7KKLTt1UhXrTqQ8J4cUQVL1d4HGOdMyYuAc=;
	b=PsH/xDLNtKV1q4CCq2HHgjs+jdHtdnM2CGrA7SsSn/1Cu0oO7BvYplOG+9MgLXcw8EACmD
	Y0/k7TOGw/UDvwCA==
Date: Thu, 03 Sep 2026 16:48:27 +0200
Subject: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
In-Reply-To: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788446914; l=5567;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=7PR0tE664SrEKUrrvEpFf3dr9BxOTxo3gbfyZ5sTqwU=;
 b=rwnGF9xmd2kcTpNKSYflBkj2VOpyD2hiaUK268FmJ2yxnx027qSmQ/FDKvM5yMloSNQbxW7V8
 tjc7wBNIO7mD7fwXPQ9NTW1eTKOrwij2GfceV/Y7IMirrCOsTo6zP+j
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This can be used to create a A/B update scheme.

To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
message must be sent to the firmware. Add support for this by
registering a reboot mode driver.

Furthermore, safely registering the reboot mode requires adjusting the
teardown sequence. Replace the manually called rpi_firmware_put() with a
devres-managed called (devm_add_action_or_reset). Without this, the
cleanup function of devm_reboot_mode_register() would trigger a
use-after-free error by attempting to access the firmware context after
it had already been freed by rpi_firmware_remove().

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/Kconfig                   |  2 ++
 drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++++++----
 include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d84838..34605bf7c9734 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -115,6 +115,8 @@ config ISCSI_IBFT
 config RASPBERRYPI_FIRMWARE
 	tristate "Raspberry Pi Firmware Driver"
 	depends on BCM2835_MBOX
+	select POWER_RESET
+	select REBOOT_MODE
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e73..2a0c40b8052e5 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
@@ -29,6 +30,7 @@ struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
 	struct completion c;
+	struct reboot_mode_driver reboot_mode;
 	u32 enabled;
 
 	struct kref consumers;
@@ -273,10 +275,37 @@ static void devm_rpi_firmware_put(void *data)
 	rpi_firmware_put(fw);
 }
 
+static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *reboot,
+					  unsigned int magic)
+{
+	struct rpi_firmware *fw = container_of(reboot, struct rpi_firmware,
+					       reboot_mode);
+	__le32 fw_magic = cpu_to_le32(magic);
+
+	if (!magic)
+		return 0;
+
+	return rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
+				     &fw_magic, sizeof(fw_magic));
+}
+
+static void rpi_register_reboot_mode(struct device *dev, struct rpi_firmware *fw)
+{
+	int ret;
+
+	fw->reboot_mode.dev = dev;
+	fw->reboot_mode.write = rpi_firmware_reboot_mode_write;
+	ret = devm_reboot_mode_register(dev, &fw->reboot_mode);
+	if (ret)
+		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
+
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *fw;
+	int ret;
 
 	/*
 	 * Memory will be freed by rpi_firmware_delete() once all users have
@@ -292,7 +321,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
-		int ret = PTR_ERR(fw->chan);
+		ret = PTR_ERR(fw->chan);
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}
@@ -302,9 +331,14 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fw);
 
+	ret = devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
+	if (ret)
+		return ret;
+
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_reboot_mode(dev, fw);
 
 	return 0;
 }
@@ -321,14 +355,10 @@ static void rpi_firmware_shutdown(struct platform_device *pdev)
 
 static void rpi_firmware_remove(struct platform_device *pdev)
 {
-	struct rpi_firmware *fw = platform_get_drvdata(pdev);
-
 	platform_device_unregister(rpi_hwmon);
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
-
-	rpi_firmware_put(fw);
 }
 
 static const struct of_device_id rpi_firmware_of_match[] = {
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 66cc5a426c3c5..f905bff0fb3ea 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -81,6 +81,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
@@ -92,6 +93,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
+	RPI_FIRMWARE_SET_REBOOT_FLAGS =                       0x00038064,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,

-- 
2.47.3

