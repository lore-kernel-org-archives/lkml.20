Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029F4D7976;
	Wed, 16 Sep 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590651; cv=none; b=INal4Ila4+oNJOuv8cDOhIoOu//QgSSM3pTdNlvpoXBYFdkLkxAVtfWSuAlTm7VcIIroHnK5Lvse5DntxWaMkWkorC1RWlXW7SRxRGhqv7NFvMvPf18qlJTVqHZPSdGaJpr1g34NQIFJctoQ0Q7+62LOQJ7/HCH4QF4XewtDNNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590651; c=relaxed/simple;
	bh=wdzOz5DEzuckueZoOb1nWDUX5u1c8a0hBftyZQcdTco=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Cz/CxlIsq6o4h7EPuva2L3ws3Rz35MBN0IWYaDYTJv8/NA2LFuZUqhI5om9DAeplHS9VIGgFzFN1Osrlbn126mGt0L3jOW+Pi89fHbcn6d3tJhXRKQazfebQG6z+B8tsuhKao5i6YsxUHP/bKPxZO8CBrTIxlIwEfbUCYA9iTAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ze89OcGK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aVUo4Zpv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ze89OcGK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aVUo4Zpv"
Date: Wed, 16 Sep 2026 20:30:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789590629;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtz/dEPNh0lplPJ/cyH/8M6cOSwXw35Jvi1JpyNPkCA=;
	b=ze89OcGKZEGSP9SBaMX5w5TS70pRj07of43p5xIPiMWmHmOVDzV5zVgJGKw4sKSfvq4GdP
	HNLFNq6uMEekNHklGlJic1NPAONlBB6O62gEn5K6rf5bZiUI7WBTuNZS1vTZfXc1c7861I
	2iGYWs8HF51Jj8gEEntO1QMNUHh5d/ejIZXxqFm27i4a0GJKZfqIUvFw3skGzwl9APBYb4
	ZIZXQrh1/guDxZMVph1Cvc2+aD13wIHLhe80SGS8GTvu+nr6tAyquLfwwG813q/LmZrv/j
	LZiJqJzNdTJaW3jDzd5z75sKUCXZTH/5Mtm/ebpm9qhlxG6UKTnYPdIK19PsKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789590629;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtz/dEPNh0lplPJ/cyH/8M6cOSwXw35Jvi1JpyNPkCA=;
	b=aVUo4ZpvNCDAPfOk95/hzYgTx0z32khTMh5zwP9JaWhjGJoEoEkn+kErpbyDWIiOTj32KY
	Cpk5To0PXyVXIRAw==
From: "tip-bot2 for Sean Young" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/platform] x86/platform: Remove Technology Systems 5500 board
Cc: Sean Young <sean@mess.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 jerome.oufella@savoirfairelinux.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260706100304.303951-1-sean@mess.org>
References: <20260706100304.303951-1-sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178959062724.1720534.2157720470320626345.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     fc21598c6477874a7c5451863a10ef63f49ec1e2
Gitweb:        https://git.kernel.org/tip/fc21598c6477874a7c5451863a10ef63f49=
ec1e2
Author:        Sean Young <sean@mess.org>
AuthorDate:    Mon, 06 Jul 2026 11:03:02 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 16 Sep 2026 13:07:58 -07:00

x86/platform: Remove Technology Systems 5500 board

Since

  8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),

this board is no longer supported. Remove the platform support too.

See: https://www.embeddedts.com/products/TS-5500 for more info.

  [ bp: Massage commit message. ]

Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: J=C3=A9r=C3=B4me Oufella <jerome.oufella@savoirfairelinux.com>
Link: https://patch.msgid.link/20260706100304.303951-1-sean@mess.org
---
 Documentation/ABI/testing/sysfs-platform-ts5500 |  54 +--
 MAINTAINERS                                     |   5 +-
 arch/x86/Kconfig                                |   9 +-
 arch/x86/platform/Makefile                      |   1 +-
 arch/x86/platform/ts5500/Makefile               |   2 +-
 arch/x86/platform/ts5500/ts5500.c               | 341 +---------------
 6 files changed, 412 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-platform-ts5500
 delete mode 100644 arch/x86/platform/ts5500/Makefile
 delete mode 100644 arch/x86/platform/ts5500/ts5500.c

diff --git a/Documentation/ABI/testing/sysfs-platform-ts5500 b/Documentation/=
ABI/testing/sysfs-platform-ts5500
deleted file mode 100644
index e685957..0000000
--- a/Documentation/ABI/testing/sysfs-platform-ts5500
+++ /dev/null
@@ -1,54 +0,0 @@
-What:		/sys/devices/platform/ts5500/adc
-Date:		January 2013
-KernelVersion:	3.7
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Indicates the presence of an A/D Converter. If it is present,
-		it will display "1", otherwise "0".
-
-What:		/sys/devices/platform/ts5500/ereset
-Date:		January 2013
-KernelVersion:	3.7
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Indicates the presence of an external reset. If it is present,
-		it will display "1", otherwise "0".
-
-What:		/sys/devices/platform/ts5500/id
-Date:		January 2013
-KernelVersion:	3.7
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Product ID of the TS board. TS-5500 ID is 0x60.
-
-What:		/sys/devices/platform/ts5500/jumpers
-Date:		January 2013
-KernelVersion:	3.7
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Bitfield showing the jumpers' state. If a jumper is present,
-		the corresponding bit is set. For instance, 0x0e means jumpers
-		2, 3 and 4 are set.
-
-What:		/sys/devices/platform/ts5500/name
-Date:		July 2014
-KernelVersion:	3.16
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Model name of the TS board, e.g. "TS-5500".
-
-What:		/sys/devices/platform/ts5500/rs485
-Date:		January 2013
-KernelVersion:	3.7
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Indicates the presence of the RS485 option. If it is present,
-		it will display "1", otherwise "0".
-
-What:		/sys/devices/platform/ts5500/sram
-Date:		January 2013
-KernelVersion:	3.7
-Contact:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-Description:
-		Indicates the presence of the SRAM option. If it is present,
-		it will display "1", otherwise "0".
diff --git a/MAINTAINERS b/MAINTAINERS
index c241444..cd1dfa3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26805,11 +26805,6 @@ S:	Maintained
 F:	Documentation/process/contribution-maturity-model.rst
 F:	Documentation/process/researcher-guidelines.rst
=20
-TECHNOLOGIC SYSTEMS TS-5500 PLATFORM SUPPORT
-M:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
-S:	Maintained
-F:	arch/x86/platform/ts5500/
-
 TECHNOTREND USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec..ae1beb3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -3059,15 +3059,6 @@ config GEOS
 	help
 	  This option enables system support for the Traverse Technologies GEOS.
=20
-config TS5500
-	bool "Technologic Systems TS-5500 platform support"
-	depends on MELAN
-	select CHECK_SIGNATURE
-	select NEW_LEDS
-	select LEDS_CLASS
-	help
-	  This option enables system support for the Technologic Systems TS-5500.
-
 endif # X86_32
=20
 config AMD_NB
diff --git a/arch/x86/platform/Makefile b/arch/x86/platform/Makefile
index 3ed03a2..727b92d 100644
--- a/arch/x86/platform/Makefile
+++ b/arch/x86/platform/Makefile
@@ -10,5 +10,4 @@ obj-y	+=3D intel-mid/
 obj-y	+=3D intel-quark/
 obj-y	+=3D olpc/
 obj-y	+=3D scx200/
-obj-y	+=3D ts5500/
 obj-y	+=3D uv/
diff --git a/arch/x86/platform/ts5500/Makefile b/arch/x86/platform/ts5500/Mak=
efile
deleted file mode 100644
index 910fe9e..0000000
--- a/arch/x86/platform/ts5500/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_TS5500)	+=3D ts5500.o
diff --git a/arch/x86/platform/ts5500/ts5500.c b/arch/x86/platform/ts5500/ts5=
500.c
deleted file mode 100644
index 0b67da0..0000000
--- a/arch/x86/platform/ts5500/ts5500.c
+++ /dev/null
@@ -1,341 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Technologic Systems TS-5500 Single Board Computer support
- *
- * Copyright (C) 2013-2014 Savoir-faire Linux Inc.
- *	Vivien Didelot <vivien.didelot@savoirfairelinux.com>
- *
- * This driver registers the Technologic Systems TS-5500 Single Board Comput=
er
- * (SBC) and its devices, and exposes information to userspace such as jumpe=
rs'
- * state or available options. For further information about sysfs entries, =
see
- * Documentation/ABI/testing/sysfs-platform-ts5500.
- *
- * This code may be extended to support similar x86-based platforms.
- * Actually, the TS-5500 and TS-5400 are supported.
- */
-
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/leds.h>
-#include <linux/init.h>
-#include <linux/platform_data/max197.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-/* Product code register */
-#define TS5500_PRODUCT_CODE_ADDR	0x74
-#define TS5500_PRODUCT_CODE		0x60	/* TS-5500 product code */
-#define TS5400_PRODUCT_CODE		0x40	/* TS-5400 product code */
-
-/* SRAM/RS-485/ADC options, and RS-485 RTS/Automatic RS-485 flags register */
-#define TS5500_SRAM_RS485_ADC_ADDR	0x75
-#define TS5500_SRAM			BIT(0)	/* SRAM option */
-#define TS5500_RS485			BIT(1)	/* RS-485 option */
-#define TS5500_ADC			BIT(2)	/* A/D converter option */
-#define TS5500_RS485_RTS		BIT(6)	/* RTS for RS-485 */
-#define TS5500_RS485_AUTO		BIT(7)	/* Automatic RS-485 */
-
-/* External Reset/Industrial Temperature Range options register */
-#define TS5500_ERESET_ITR_ADDR		0x76
-#define TS5500_ERESET			BIT(0)	/* External Reset option */
-#define TS5500_ITR			BIT(1)	/* Indust. Temp. Range option */
-
-/* LED/Jumpers register */
-#define TS5500_LED_JP_ADDR		0x77
-#define TS5500_LED			BIT(0)	/* LED flag */
-#define TS5500_JP1			BIT(1)	/* Automatic CMOS */
-#define TS5500_JP2			BIT(2)	/* Enable Serial Console */
-#define TS5500_JP3			BIT(3)	/* Write Enable Drive A */
-#define TS5500_JP4			BIT(4)	/* Fast Console (115K baud) */
-#define TS5500_JP5			BIT(5)	/* User Jumper */
-#define TS5500_JP6			BIT(6)	/* Console on COM1 (req. JP2) */
-#define TS5500_JP7			BIT(7)	/* Undocumented (Unused) */
-
-/* A/D Converter registers */
-#define TS5500_ADC_CONV_BUSY_ADDR	0x195	/* Conversion state register */
-#define TS5500_ADC_CONV_BUSY		BIT(0)
-#define TS5500_ADC_CONV_INIT_LSB_ADDR	0x196	/* Start conv. / LSB register */
-#define TS5500_ADC_CONV_MSB_ADDR	0x197	/* MSB register */
-#define TS5500_ADC_CONV_DELAY		12	/* usec */
-
-/**
- * struct ts5500_sbc - TS-5500 board description
- * @name:	Board model name.
- * @id:		Board product ID.
- * @sram:	Flag for SRAM option.
- * @rs485:	Flag for RS-485 option.
- * @adc:	Flag for Analog/Digital converter option.
- * @ereset:	Flag for External Reset option.
- * @itr:	Flag for Industrial Temperature Range option.
- * @jumpers:	Bitfield for jumpers' state.
- */
-struct ts5500_sbc {
-	const char *name;
-	int	id;
-	bool	sram;
-	bool	rs485;
-	bool	adc;
-	bool	ereset;
-	bool	itr;
-	u8	jumpers;
-};
-
-/* Board signatures in BIOS shadow RAM */
-static const struct {
-	const char * const string;
-	const ssize_t offset;
-} ts5500_signatures[] __initconst =3D {
-	{ "TS-5x00 AMD Elan", 0xb14 },
-};
-
-static int __init ts5500_check_signature(void)
-{
-	void __iomem *bios;
-	int i, ret =3D -ENODEV;
-
-	bios =3D ioremap(0xf0000, 0x10000);
-	if (!bios)
-		return -ENOMEM;
-
-	for (i =3D 0; i < ARRAY_SIZE(ts5500_signatures); i++) {
-		if (check_signature(bios + ts5500_signatures[i].offset,
-				    ts5500_signatures[i].string,
-				    strlen(ts5500_signatures[i].string))) {
-			ret =3D 0;
-			break;
-		}
-	}
-
-	iounmap(bios);
-	return ret;
-}
-
-static int __init ts5500_detect_config(struct ts5500_sbc *sbc)
-{
-	u8 tmp;
-	int ret =3D 0;
-
-	if (!request_region(TS5500_PRODUCT_CODE_ADDR, 4, "ts5500"))
-		return -EBUSY;
-
-	sbc->id =3D inb(TS5500_PRODUCT_CODE_ADDR);
-	if (sbc->id =3D=3D TS5500_PRODUCT_CODE) {
-		sbc->name =3D "TS-5500";
-	} else if (sbc->id =3D=3D TS5400_PRODUCT_CODE) {
-		sbc->name =3D "TS-5400";
-	} else {
-		pr_err("ts5500: unknown product code 0x%x\n", sbc->id);
-		ret =3D -ENODEV;
-		goto cleanup;
-	}
-
-	tmp =3D inb(TS5500_SRAM_RS485_ADC_ADDR);
-	sbc->sram =3D tmp & TS5500_SRAM;
-	sbc->rs485 =3D tmp & TS5500_RS485;
-	sbc->adc =3D tmp & TS5500_ADC;
-
-	tmp =3D inb(TS5500_ERESET_ITR_ADDR);
-	sbc->ereset =3D tmp & TS5500_ERESET;
-	sbc->itr =3D tmp & TS5500_ITR;
-
-	tmp =3D inb(TS5500_LED_JP_ADDR);
-	sbc->jumpers =3D tmp & ~TS5500_LED;
-
-cleanup:
-	release_region(TS5500_PRODUCT_CODE_ADDR, 4);
-	return ret;
-}
-
-static ssize_t name_show(struct device *dev, struct device_attribute *attr,
-		char *buf)
-{
-	struct ts5500_sbc *sbc =3D dev_get_drvdata(dev);
-
-	return sprintf(buf, "%s\n", sbc->name);
-}
-static DEVICE_ATTR_RO(name);
-
-static ssize_t id_show(struct device *dev, struct device_attribute *attr,
-		char *buf)
-{
-	struct ts5500_sbc *sbc =3D dev_get_drvdata(dev);
-
-	return sprintf(buf, "0x%.2x\n", sbc->id);
-}
-static DEVICE_ATTR_RO(id);
-
-static ssize_t jumpers_show(struct device *dev, struct device_attribute *att=
r,
-		char *buf)
-{
-	struct ts5500_sbc *sbc =3D dev_get_drvdata(dev);
-
-	return sprintf(buf, "0x%.2x\n", sbc->jumpers >> 1);
-}
-static DEVICE_ATTR_RO(jumpers);
-
-#define TS5500_ATTR_BOOL(_field)					\
-	static ssize_t _field##_show(struct device *dev,		\
-			struct device_attribute *attr, char *buf)	\
-	{								\
-		struct ts5500_sbc *sbc =3D dev_get_drvdata(dev);		\
-									\
-		return sprintf(buf, "%d\n", sbc->_field);		\
-	}								\
-	static DEVICE_ATTR_RO(_field)
-
-TS5500_ATTR_BOOL(sram);
-TS5500_ATTR_BOOL(rs485);
-TS5500_ATTR_BOOL(adc);
-TS5500_ATTR_BOOL(ereset);
-TS5500_ATTR_BOOL(itr);
-
-static struct attribute *ts5500_attributes[] =3D {
-	&dev_attr_id.attr,
-	&dev_attr_name.attr,
-	&dev_attr_jumpers.attr,
-	&dev_attr_sram.attr,
-	&dev_attr_rs485.attr,
-	&dev_attr_adc.attr,
-	&dev_attr_ereset.attr,
-	&dev_attr_itr.attr,
-	NULL
-};
-
-static const struct attribute_group ts5500_attr_group =3D {
-	.attrs =3D ts5500_attributes,
-};
-
-static struct resource ts5500_dio1_resource[] =3D {
-	DEFINE_RES_IRQ_NAMED(7, "DIO1 interrupt"),
-};
-
-static struct platform_device ts5500_dio1_pdev =3D {
-	.name =3D "ts5500-dio1",
-	.id =3D -1,
-	.resource =3D ts5500_dio1_resource,
-	.num_resources =3D 1,
-};
-
-static struct resource ts5500_dio2_resource[] =3D {
-	DEFINE_RES_IRQ_NAMED(6, "DIO2 interrupt"),
-};
-
-static struct platform_device ts5500_dio2_pdev =3D {
-	.name =3D "ts5500-dio2",
-	.id =3D -1,
-	.resource =3D ts5500_dio2_resource,
-	.num_resources =3D 1,
-};
-
-static void ts5500_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness brightness)
-{
-	outb(!!brightness, TS5500_LED_JP_ADDR);
-}
-
-static enum led_brightness ts5500_led_get(struct led_classdev *led_cdev)
-{
-	return (inb(TS5500_LED_JP_ADDR) & TS5500_LED) ? LED_FULL : LED_OFF;
-}
-
-static struct led_classdev ts5500_led_cdev =3D {
-	.name =3D "ts5500:green:",
-	.brightness_set =3D ts5500_led_set,
-	.brightness_get =3D ts5500_led_get,
-};
-
-static int ts5500_adc_convert(u8 ctrl)
-{
-	u8 lsb, msb;
-
-	/* Start conversion (ensure the 3 MSB are set to 0) */
-	outb(ctrl & 0x1f, TS5500_ADC_CONV_INIT_LSB_ADDR);
-
-	/*
-	 * The platform has CPLD logic driving the A/D converter.
-	 * The conversion must complete within 11 microseconds,
-	 * otherwise we have to re-initiate a conversion.
-	 */
-	udelay(TS5500_ADC_CONV_DELAY);
-	if (inb(TS5500_ADC_CONV_BUSY_ADDR) & TS5500_ADC_CONV_BUSY)
-		return -EBUSY;
-
-	/* Read the raw data */
-	lsb =3D inb(TS5500_ADC_CONV_INIT_LSB_ADDR);
-	msb =3D inb(TS5500_ADC_CONV_MSB_ADDR);
-
-	return (msb << 8) | lsb;
-}
-
-static struct max197_platform_data ts5500_adc_pdata =3D {
-	.convert =3D ts5500_adc_convert,
-};
-
-static struct platform_device ts5500_adc_pdev =3D {
-	.name =3D "max197",
-	.id =3D -1,
-	.dev =3D {
-		.platform_data =3D &ts5500_adc_pdata,
-	},
-};
-
-static int __init ts5500_init(void)
-{
-	struct platform_device *pdev;
-	struct ts5500_sbc *sbc;
-	int err;
-
-	/*
-	 * There is no DMI available or PCI bridge subvendor info,
-	 * only the BIOS provides a 16-bit identification call.
-	 * It is safer to find a signature in the BIOS shadow RAM.
-	 */
-	err =3D ts5500_check_signature();
-	if (err)
-		return err;
-
-	pdev =3D platform_device_register_simple("ts5500", -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	sbc =3D devm_kzalloc(&pdev->dev, sizeof(struct ts5500_sbc), GFP_KERNEL);
-	if (!sbc) {
-		err =3D -ENOMEM;
-		goto error;
-	}
-
-	err =3D ts5500_detect_config(sbc);
-	if (err)
-		goto error;
-
-	platform_set_drvdata(pdev, sbc);
-
-	err =3D sysfs_create_group(&pdev->dev.kobj, &ts5500_attr_group);
-	if (err)
-		goto error;
-
-	if (sbc->id =3D=3D TS5500_PRODUCT_CODE) {
-		ts5500_dio1_pdev.dev.parent =3D &pdev->dev;
-		if (platform_device_register(&ts5500_dio1_pdev))
-			dev_warn(&pdev->dev, "DIO1 block registration failed\n");
-		ts5500_dio2_pdev.dev.parent =3D &pdev->dev;
-		if (platform_device_register(&ts5500_dio2_pdev))
-			dev_warn(&pdev->dev, "DIO2 block registration failed\n");
-	}
-
-	if (led_classdev_register(&pdev->dev, &ts5500_led_cdev))
-		dev_warn(&pdev->dev, "LED registration failed\n");
-
-	if (sbc->adc) {
-		ts5500_adc_pdev.dev.parent =3D &pdev->dev;
-		if (platform_device_register(&ts5500_adc_pdev))
-			dev_warn(&pdev->dev, "ADC registration failed\n");
-	}
-
-	return 0;
-error:
-	platform_device_unregister(pdev);
-	return err;
-}
-device_initcall(ts5500_init);
