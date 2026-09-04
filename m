Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5053612E2;
	Fri,  4 Sep 2026 07:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508022; cv=none; b=i7BkiuuItNAzN47sSjf6EWDio8rcYGJ08ynVNKDa5ZYKpTNwt66KI6lxvkXjoLb2O64Ci5ILugFRmgtFLCljaobtzfd4nhpeYB7wlnUpW9BylyZNo/B1wteqdFgfRXDQqkMw1P41SUmgDaR2EhpBG9F0w1J355jZKikDr02fvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508022; c=relaxed/simple;
	bh=JjU0NmyrHjQlVYmu58rWFIQi9wV0Yk0e9whJMEcZGqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7j7KQ5/z8hrXdQqCLqTc8vlQgMa+awOk2FM8yk0Hg7QGnrn6d3/T5bX5lWyA+A7Lwr90SjdecfZaExPpBw0ASW0FDtgMYoNuE7I5dY4E/6Tmeb2sbjjsPOfPhdjDG9OPbTSFjDH3aOb0dQiLepTTeOtDpfP/Uo86PEjyAxTf3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bF7WFeEs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MHewjGPm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bF7WFeEs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MHewjGPm"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1PdO7b96oZEBitMdoxZM/am5g9LcgR3z7wz5ec3PhU=;
	b=bF7WFeEsT8kmHKHQhjY9iCFz5V0byYZjWwOj/fH+48AUnQjt3k3dMRstbjXC0zYtaKWH2Y
	Zlu95OV5I2MxjnumjqZY1n4QLsUClBa5IE8CuvQOBAkxHtlAyB2MwzoY49zwnLyQTPUxzT
	QQtNrRelKtMLreXUAC1d37wIleDlYaWXkocuv0jF/jYMrz6bSz7MT35x/oZSSFzcbJNCJt
	bbHnC9/8pu6nA1BVV2WTUrjiqNJAZ65bAKNwzgJsDwDr//NWgJVS41OUByEcNQr7MgSgxW
	uP54l40xWXU2cIc5DKwjMrxsgAwL8HTaB1mUs7rQCjyXPUhRz2OdAbOHgH85zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1PdO7b96oZEBitMdoxZM/am5g9LcgR3z7wz5ec3PhU=;
	b=MHewjGPmtYcj8ZvRqg4xz7hnipB4HfkJOiZsohayRmZ2RkL+7WMaIVbKYXWVlodbhGlgOI
	xeJe0+a/so+Z77Dw==
Date: Fri, 04 Sep 2026 09:46:49 +0200
Subject: [PATCH v4 1/4] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rpi-tryboot-v4-1-fdee8bc53ff7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=4658;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=JjU0NmyrHjQlVYmu58rWFIQi9wV0Yk0e9whJMEcZGqg=;
 b=ost2OB3Qt88g8OIHEOl7bVAwsWB4M1WIMH00w5+gBo+XQfbaXFF4XfW4HvZpAgqGWDwaKjNv/
 UClcw+3TsIFBVlEaAQXJ0BHtva0fxrqZo+EcSNFsa2fO38P6w0qydCP
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The enum was once ordered by tag values. The later added tags were added
in a different order. Reorder the tags again.

No functional change intended.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 975bef529854a..8ad1cdbf5e9f5 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -72,26 +72,26 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_EDID_BLOCK =                         0x00030020,
 	RPI_FIRMWARE_GET_CUSTOMER_OTP =                       0x00030021,
 	RPI_FIRMWARE_GET_DOMAIN_STATE =                       0x00030030,
+	RPI_FIRMWARE_GET_GPIO_STATE =                         0x00030041,
+	RPI_FIRMWARE_GET_GPIO_CONFIG =                        0x00030043,
+	RPI_FIRMWARE_GET_PERIPH_REG =                         0x00030045,
 	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
 	RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
+	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
+	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
+	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
 	RPI_FIRMWARE_SET_TURBO =                              0x00038009,
 	RPI_FIRMWARE_SET_CUSTOMER_OTP =                       0x00038021,
 	RPI_FIRMWARE_SET_DOMAIN_STATE =                       0x00038030,
-	RPI_FIRMWARE_GET_GPIO_STATE =                         0x00030041,
 	RPI_FIRMWARE_SET_GPIO_STATE =                         0x00038041,
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
-	RPI_FIRMWARE_GET_GPIO_CONFIG =                        0x00030043,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
-	RPI_FIRMWARE_GET_PERIPH_REG =                         0x00030045,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
-	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
-	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
-	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
-	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,
@@ -107,7 +107,6 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_GET_PALETTE =                0x0004000b,
 	RPI_FIRMWARE_FRAMEBUFFER_GET_TOUCHBUF =               0x0004000f,
 	RPI_FIRMWARE_FRAMEBUFFER_GET_GPIOVIRTBUF =            0x00040010,
-	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT = 0x00044003,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =  0x00044004,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_DEPTH =                 0x00044005,
@@ -117,6 +116,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_OVERSCAN =              0x0004400a,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_PALETTE =               0x0004400b,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_VSYNC =                 0x0004400e,
+	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT =  0x00048003,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT =   0x00048004,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_DEPTH =                  0x00048005,
@@ -125,10 +125,10 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_OFFSET =         0x00048009,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_OVERSCAN =               0x0004800a,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_PALETTE =                0x0004800b,
-	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
-	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VSYNC =                  0x0004800e,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_BACKLIGHT =              0x0004800f,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
 
 	RPI_FIRMWARE_VCHIQ_INIT =                             0x00048010,
 

-- 
2.47.3

