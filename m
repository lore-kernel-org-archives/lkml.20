Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563318;
	b=bkVpQztXcBIO/ahP1Bld67NDVn9GMtsmUZZ5Xy86RiViSnNjaD5eqLf/smgiE2/mj8j5
	 We+srARSfFz8pp7+mveK0Mb4OPmnjqatRnSztSTN+ltm9c0DJiI+5PQNuH/bp1JUfXOVZ
	 EmpwceHCgsvghPNYOdbJJR5HtVjX2DZhpHVBCvypiAXE7rALKyurxV1K05KlOoK4IRYVx
	 jpyZlSUDjfC9CtEwmYAbrdQLkYLa+A2iayAS+NREaIxxpYXcojnkpJ5GnMr7V7b+qDElr
	 WdSMy+HGBR9Lk3ZM+ayPO6YWlmahG/iW5T/ppX/VN3Mf40gEeae0sHQtoqfuDE+ycyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z/VKI7RpLJNOxCKazePUIRScOgx02AgC8jGvZ4BHeOw=;
	b=4waJkztvqwNMFuWWmDpaS4HOFVKlDWSzJakAem6jXpXk+3XVuX+DZWGZ+zF8IRp/ewHM
	 PLC0Bnbaj3xtQ0DOrXN1x89qbzfe7qmZj7nxKNwSW1fSRBLeFDIkYegvHxWdKuHaxPaKk
	 Q5JkZMO7KBQp/QzLRQtpBQVy0oTSti4jT5Xc1XkQaIUqk517mh+2dLhTAiQCURLXNEgJh
	 21fyZiIkeW7AYtdVxf92jYB861eanWB6eE4WNA4D7SVNXWqHz6dT6bwDKJUxDk7nUWLgJ
	 5u1NLUZw1ELzHfEDoBUwHOXsNIsYPObJm3PgwlNVDJu/PgrCXFutT+BkP2IR+7S0vIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvbi1YUQ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88298606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88298606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvbi1YUQ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1adbf62dd31so2318972c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563318; x=1794168118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/VKI7RpLJNOxCKazePUIRScOgx02AgC8jGvZ4BHeOw=;
        b=zvbi1YUQQ7aVWRUMLEDhhyHBLdyqiN4nI5hVMkMqE1W5UV/BN7B/1lPeV0+RClu5pe
         sTNdCZk2+jO4OLZqsjXB4W/Dezxb5/tsjn5PBf2I2inKfFzcs9M8KTS+i18C+1Ej2wjY
         kubKMurAl9Y1XFIAXcNIfE1mgEgh3Qk1v+D2lvd2bKBNHkYjwHExxdhTD+C7skmlUwwS
         g+hW7vQG1QCdCjItKVr7YU521PgeKVZTBAfAIjG8ApoHn7DTXBDld/+vKrTzv3qauUym
         uNHUvJh9an8WWMcfC4nm+gQ2DUsmzUIZh/eUsM2rt/mQtlypk+7dWKo1pFxZjdxiCUVC
         rG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563318; x=1794168118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/VKI7RpLJNOxCKazePUIRScOgx02AgC8jGvZ4BHeOw=;
        b=1f3XBIejl+zq8A7QaKixujpB2U2r9xnVO8oSkTGjjYfeMRuTdiXYkTaDQvZSo3tPC2
         +SW3MMTDotplVnvXQ7MqjzyXxQd+WxKRxqxprFaYj8JFvNaefN83EphrC+q/UMnojJBE
         jmkg9LdO5dc9uhB5F+slnxmL7DBsMl279K9NTsOn2yThozeyDba+xU7O2bKzN2QMyuaY
         58U8iQnM7zOals9/Rl7o3CMd3dcGN12qp3OqH3Si06kD1KQU9HIlk22b3FIXwve3lP3A
         QI2tCyLFrUsC0PF2rjneYfk/9AqS0UmUxck7OwYABGJj0urrHeZMhsrh56S2QTfn/9+Q
         ImHQ==
X-Forwarded-Encrypted: i=1; AKwUvByshCf/U1qmKQAyQey2diCRoaMU9Mvvira7lDcbdgm/8qqNWLc3E+fNnG09P8CXmGrg0ibOpmAkCvx512I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmruth6tQl7g1wQrzAeplouEgDNtVGZFbcun7vyMNSD4mggMyR
	6AEDm3i8dFYsTU5AKDLCUmUYMQDK1Y1hvZcslih7SddNGmOakgaOQKOfc0w3YA==
X-Gm-Gg: AYBFou1t+mRtP00kRuhVLIE6usaYySWMcFFNtbpAnanOUns89hY+B22Rx9DaoucvS/C
	KefjkM5klg8VTrUJGoB2oXHhhwLWQ0dRCircB7fQ/kOOxBqdUFgkN6jjHbt5FPcWw1FEcLjVVMm
	13bIzglSFc6ZowckCnqb5xceS7Ct55auQyw3tSu0R7BQ5bJ6u8/BOjPGcunNaG/167IArtZnv0s
	otYJ8PKD3sfJ42fV+ILith8TuawD02KXChKscrlxr6IduuHXJFVBfpoGX+xFsnGGZ7m2BcPUyUn
	+gCxsBL5KBFxmOdXoK9CInZnQYLxM0V1ej3WqssWd3IJQ5f+hsKnDx1rLGdtx6nl5TQZzznKBGV
	g7sKPwZBrvS6S4gX48P/SVWNa78XPkQnnCOsq+IB+n4SeYdXzgDugy7pkD7YH0nvDP2WiYbBQWO
	77k4A20YTawpK2dPTqpO2tLGBk/9XZu84bVeBzmZQW2auIkAote4SyKGvZvoy2q4G1ossb0tpmH
	O04T746xIxzm1cDMlAbzBBANcMxUPHo5lljJ50+5FqU7R+wDRBuv9PAsrKLayoaQNuwxZgaTD01
	aLKXruIdXp02wPWHKabC2iAc06N4s0/VFpwKG4jmX8r5hhNMCG2P393TmprFGcVw+Lo/tKuTQzt
	ewLSiaRyEKRrz9nmsxPYK0OY7+udVGOkKI/4dsMwZ+qAkIXqQrCA/dOrtVt2mic58/5hseQ/FKR
	Ipew==
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr11824196c88.33.1793563317369;
        Sun, 01 Nov 2026 12:01:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm26633510c88.23.2026.11.01.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:01:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] spi: acpi: only look up the IRQ of confirmed SPI devices
Date: Sun,  1 Nov 2026 12:01:55 -0800
Message-ID: <20261101200155.15740-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When an SPI controller is registered, acpi_register_spi_device() is
called for every present ACPI device in the namespace and
acpi_spi_device_alloc() walks each device's _CRS. While doing so,
acpi_spi_add_resource() converts the first interrupt resource it finds,
even for devices that have no SpiSerialBus resource at all and are
discarded right afterwards. Converting an interrupt resource registers
its GSI, so this maps IRQs for arbitrary unrelated ACPI devices.

On a Dell Precision M4800 (Lynx Point, 24-pin IOAPIC) the DSDT reports
Haswell-ULT LPSS child devices (\_SB.PCI0.I2C0.ACD0 and
\_SB.PCI0.SDHC.WI01) as present with interrupts on GSI 37 and 38.
Registering the intel-spi controller then results in:

  ERROR: Unable to locate IOAPIC for GSI 37
  ERROR: Unable to locate IOAPIC for GSI 38

Do what the I2C core does and only parse the interrupt resource once the
device has been identified as an SPI device on this controller.

Fixes: 4c3c59544f33 ("spi/acpi: enumerate all SPI slaves in the namespace")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/spi/spi.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 40cda0037ea5..5a2cbebfabc5 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2995,7 +2995,6 @@ struct acpi_spi_lookup {
 	acpi_handle		device_handle;
 	u32			max_speed_hz;
 	u32			mode;
-	int			irq;
 	u8			bits_per_word;
 	u8			chip_select;
 	int			n;
@@ -3138,17 +3137,25 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
 			if (sb->device_polarity == ACPI_SPI_ACTIVE_HIGH)
 				lookup->mode |= SPI_CS_HIGH;
 		}
-	} else if (lookup->irq < 0) {
-		struct resource r;
-
-		if (acpi_dev_resource_interrupt(ares, 0, &r))
-			lookup->irq = r.start;
 	}
 
 	/* Always tell the ACPI core to skip this resource */
 	return 1;
 }
 
+static int acpi_spi_add_irq_resource(struct acpi_resource *ares, void *data)
+{
+	int *irq = data;
+	struct resource r;
+
+	if (*irq < 0 && ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS &&
+	    acpi_dev_resource_interrupt(ares, 0, &r))
+		*irq = r.start;
+
+	/* Always tell the ACPI core to skip this resource */
+	return 1;
+}
+
 /**
  * acpi_spi_device_alloc - Allocate a spi device, and fill it in with ACPI information
  * @ctlr: controller to which the spi device belongs
@@ -3173,6 +3180,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 	struct list_head resource_list;
 	struct acpi_spi_lookup lookup = {};
 	struct spi_device *spi;
+	int irq = -1;
 	int ret;
 
 	if (!ctlr && index == -1)
@@ -3180,7 +3188,6 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 
 	lookup.ctlr		= ctlr;
 	lookup.device_handle	= acpi_device_handle(adev);
-	lookup.irq		= -1;
 	lookup.index		= index;
 	lookup.n		= 0;
 
@@ -3203,6 +3210,19 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 	if (!lookup.max_speed_hz)
 		return ERR_PTR(-ENODEV);
 
+	/*
+	 * Only look up the IRQ once we know this is an SPI device for us.
+	 * Parsing an interrupt resource maps its GSI, which must not be done
+	 * for every unrelated ACPI device walked during enumeration.
+	 */
+	INIT_LIST_HEAD(&resource_list);
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     acpi_spi_add_irq_resource, &irq);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	acpi_dev_free_resource_list(&resource_list);
+
 	spi = spi_alloc_device(lookup.ctlr);
 	if (!spi) {
 		dev_err(&lookup.ctlr->dev, "failed to allocate SPI device for %s\n",
@@ -3215,7 +3235,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 	ACPI_COMPANION_SET(&spi->dev, adev);
 	spi->max_speed_hz	= lookup.max_speed_hz;
 	spi->mode		|= lookup.mode;
-	spi->irq		= lookup.irq;
+	spi->irq		= irq;
 	spi->bits_per_word	= lookup.bits_per_word;
 	/*
 	 * By default spi->chip_select[0] will hold the physical CS number,
-- 
2.56.0

