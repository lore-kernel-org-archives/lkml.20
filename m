Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231A3D6662;
	Fri,  4 Sep 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508023; cv=none; b=l8UmiYJUe4wIAB2DGn1iyjP2fFVjQ9IehOBZpJiAos7ysnERO48o3e+EHFLud06F9F305k+Nzke0WBy+nbQIEyjLepWQH+MsQ7Ykc3mztW0JmZHQUUIB07xUiwcrumqxr1ZX2cl6kcW4HgnJeBeIg0iW5hHfOMX1YIar5Lt1fdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508023; c=relaxed/simple;
	bh=m/CpdHsEvCUAW7gTaGCn5VOySfV0RT0PmGxauC7Qq9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpk8pT2sOZLTnG/stsoPYBpKiFZ+MlZ3hPMcC2SoSDJ3EXhqHzCPlMYt5Rxm0tvJw0JsuDEFzuTxCB5mgk+UvXxjzKcK2yj/KTfvulbpn4BM2kDo6W6rKQbE0TYydFM6r2Uj+Gf1IFkFzW2s5eaXyGN6YRY7KjgIyg2Igep5zKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zaxys6tg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JLzMvJgv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zaxys6tg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JLzMvJgv"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AM15zzYi1yxVJZ232mvEjfyytA9TXr/3DtqNdm0DHBM=;
	b=zaxys6tgPVbJX8vLnb8M/vj1wL3qhYCNdiJ36chsK5B6qMPvA9tKNQ7N5khlICnnPZr0ql
	vxPYU9x4PAuYZNHRC2Y9ESw/2ABiZBY3XN7hfBw6gDdOAImAq/iVq5bKuCGJji/E1KVme9
	IoL9V79bqrmr29Cxq9ZhKQtfLk3WTMyf3ooiq8/ltp9eZR8SOUwghn9CyyCT1QY+tMQZN6
	ibAlODXyidW1wCywLfsqS+VeCe840OB8oqJPj1SptMAkixPj/womAThisoJIZa4hY14vB/
	CTyv8JQgvl9SeZcys25jXKsXk5iXzBh9YRR1qGPiyj5CcNqx7o9ndyKJ+zlqeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AM15zzYi1yxVJZ232mvEjfyytA9TXr/3DtqNdm0DHBM=;
	b=JLzMvJgvk15wscBR3sZMxMkrUMD4hCcY6ItDGtLN6M4vRakonQ4umjiakjQ0xE6FSuJ1Ad
	vqfGmtXTaQRv1kDg==
Date: Fri, 04 Sep 2026 09:46:51 +0200
Subject: [PATCH v4 3/4] firmware: raspberrypi: Add reboot mode support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rpi-tryboot-v4-3-fdee8bc53ff7@linutronix.de>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
In-Reply-To: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=5609;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=m/CpdHsEvCUAW7gTaGCn5VOySfV0RT0PmGxauC7Qq9Y=;
 b=9dVVDGfkubSY0dcIMI5zmv98wOBijAH+GwXXiWdPr/8GmVq4fCSaDbzAl5s67ZSg/uwIlfNbS
 Q7VbkGUvJkDChKqEHUqPJ1uohqQAm4pZ4iQ/iaFMsSxfwTa7aG6V2R9
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
index b7cc11e4fbfa6..ec9e06960ec32 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -139,6 +139,8 @@ config RASPBERRYPI_FIRMWARE
 	depends on ARM || ARM64
 	depends on MAILBOX
 	default ARCH_BCM2835
+	select POWER_RESET
+	select REBOOT_MODE
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e73..9038bd5fdb8e2 100644
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
@@ -300,11 +329,16 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	init_completion(&fw->c);
 	kref_init(&fw->consumers);
 
+	ret = devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, fw);
 
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
index 8ad1cdbf5e9f5..b75596dc367bb 100644
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

