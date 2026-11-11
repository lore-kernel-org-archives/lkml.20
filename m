Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415061;
	b=x2FSBCu7Pzq9/jCNtMQliEYB4WmIrMDf/8hVGsCwgJmvo0SziOQfxKZjTkK/GZvLL5CY
	 4lXWyWTG/MjBC7UGaDMPFbb1KPTPwF26YT4yoYAuIaF9iqq0lBX4bvsVuVYGaABMA2CUI
	 9bJDsQaplZicD4oWSnh2pnQGKQxH0Qc41cCPpAqH6kklYQ73lVrrShs9mKvkLLPjDHh6T
	 QqHgwT8x6Se7oHEDWmxz5R6tAXFh2sPEjEEK4P4PqVKdq+yGs2696b5PyfTG+pSrYPcQf
	 viIG45V5uz44fHLVVsP+9xM365qjgEahWV5QG3nxEpulabQu6dz/FJDZ94/qm8W96dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
	b=zFX+iyNMHPiqA1UbUVkGZJqFM0CGWb0mcAiM5CHRxFq3vvieOro7IG2F6BysGNN08gsz
	 0mzwUluds9wKgEV3OKEdqSQKmM65QJUOrUUQgIGTIU5TUGPPH5EbOJJkK9cIHo4yKmGsO
	 S3CaIg6sXURJy43PNLeTdvBIe3QDYnL3jm4xq//FbVSR83NhgPevyS2dV+zIb8AKCdKD/
	 MBwQSQa4wI9W/DJL+jA7i4V6wosHQ11izaPteQVTPm0yhlI880vePBPmWjIh0wUjw6Ddf
	 fTxtBEjMaplGGFO5MWW12HV+T86JcXcszGJXYG3QgScmaYYuM1XejJ+y4wOr0cUZXGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0X2vnYYI;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBEE606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBEE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0X2vnYYI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2864869f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415059; x=1795019859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
        b=0X2vnYYIBgVC9/TjHP1o3AwyHS4/VoUR0IZ8uxXkMGTdMD5WPhv7RegoaIRLZwesQT
         d1lHJUz83MB1vYnLvNC2UF/1wUBUcH+Iy8eZpqhPuax+caYYUn9JzEKuvdmRPaFBoted
         vFwMTGV/zZ3adkfAUu32zcKcNPhzb+0duIHyWY3BmU3U5bZZs5uTLPed4TzpZ9WFkuRR
         RXufv194brSxSALqNE/grKASrOYFCZCfq6K+SwbPLGyoe2SoOpSSU5LADzo1JMWtcKZF
         J6TLT9NsGmlJUoOU1cYPk8Vo06fOMp9mGpT9pmZDK8/ZWyfqqkm/zc5Ynf6jpj0IWoBW
         DCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415059; x=1795019859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
        b=kFJ+xvww8o7LdWfmNRgwdPT7w4kBj9HUCGW1u5vWXUoYyYFEUjh0s5pCBu5iOyMON3
         BS7I6+YXOxT6hQqdiXmoX0FjoJvs2i/E++L3OaMLEbD+WeB2Vy1rpDPbGcwPwssGNN46
         Y53dF05JheGW/IV/uKwUiXhNiruO3yjlSWvBqhSmGyMep++MhDRUGfHL8Q1uzicmnm+t
         q9StHGam3yLXTECa69V2xxNaOKMvG6KpcoRpKwt+8MvwF3nPYnwyCzg/L5cnAyt1R2l1
         2JUVAmN1Csz5JPGRIg0nU/iOMeYCNQ6eI8vpG4XY/WrpqiQUkmHbvuKgIYiFOq5G/NwA
         NKxQ==
X-Forwarded-Encrypted: i=1; AL+hErHSKRTLMfewn876R0pRJ1wFFLacBe/dpPQ7v92zZLlKf/ey0LatUd2C5S2MvLWtLm/b6PEi0GElkAdZgzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k27ItEbSDY7wOhue3jgkolJi4Ut367SNqfzFAHo+yZaKPbzQG
	KA5WN3AbSsqQUzUkOhoF1zdAiIJuPje13j56kede2J3xQIyh1s6BcaV/
X-Gm-Gg: AYBFou2hJic5YBrYx5KCNNWzy/mXlB9/eo88Vs7W+LUUKSUYoiVPSpBVatdsrxxVT8d
	6YGYy/G7cGx+C1HFGs9FWPs6XsuXA2IEhMZ7KNX1qt7Q1z7CMRzx7+F9WIDUxY40oXnfc/ctkQy
	qHxahyGzslXOQSFOBnkKjdXj8lWQmLyvzhLx+31dWx7gw4QyQ5JTjWgLYFD3BzmHHW0Vm5+q6qi
	lx95xaa9bkbg/jowIkB3INWMhMleW5U+/0Fg2KB71PQvn02XTVKL5BmZoYMedqZWcmSqYqXNA/P
	xEjpNGh+TLcDcwIS5z8nzY4zrjKazs9f6whLFd2mD8nGtNXQ2AXJNZ/dz7B8s4AE1VVlbuAmHGa
	fi9e8S60ychECT7OS9/o0OzoYUsUp2sk4eBQQxSVOfDyufn4aGNyC/6B6DHuKkAAOm60myl4DGg
	Uj/PkZBQ59rVSn/3gi7THhb/FhThlFIaKKIfZhDTlTwCcMP7koAo/+vZhoZH2N188IJrNgVQRdG
	+Bmgc1C1H6lNJLJ6DH/hFSpdf6rfagTH6gk5/ZAEFVE4RrYzDAYgkLoMDKAO4ECnnEoYBHkcW14
	vJaiRILIXbGpREcq10i8GSEB0tGfQXYqnAIHry/R4seHmcwjNXUB+3ji0Eu/QTEBpidzFMLVT5m
	AR/Yg7pIFbOWW
X-Received: by 2002:a05:6000:18a9:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-499c6f8db6cmr5151187f8f.24.1794415059075;
        Wed, 11 Nov 2026 08:37:39 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm11895837f8f.22.2026.11.11.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:38 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 2/7] ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro device
Date: Wed, 11 Nov 2026 17:37:29 +0100
Message-ID: <20261111163735.227286-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

Now that warp-mfd owns the device and hands the window out as the
"warp-pata" cell, take it from there.

PATA_CSWARP depends on WARP_MFD from here on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/ata/Kconfig       |  2 +-
 drivers/ata/pata_cswarp.c | 48 ++++++++++++++-------------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 9704ed688775..407b79bf9405 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1035,7 +1035,7 @@ config PATA_GAYLE
 
 config PATA_CSWARP
 	tristate "Amiga CS Warp PATA support"
-	depends on M68K && AMIGA && ZORRO
+	depends on WARP_MFD
 	help
 	  This option enables support for the on-board IDE interface on
 	  CS-Lab Warp Expansion Card (NOTE that idemode=native has to be
diff --git a/drivers/ata/pata_cswarp.c b/drivers/ata/pata_cswarp.c
index 58fe6d0012dc..41b4c93052cf 100644
--- a/drivers/ata/pata_cswarp.c
+++ b/drivers/ata/pata_cswarp.c
@@ -14,14 +14,12 @@
 #include <linux/ata.h>
 #include <linux/blkdev.h>
 #include <linux/delay.h>
-#include <linux/device-id/zorro.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/libata.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/zorro.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_host.h>
 
@@ -32,8 +30,6 @@
 
 #define DRV_NAME "pata_cswarp"
 
-#define WARP_OFFSET_ATA         0x6000
-
 static const struct scsi_host_template pata_cswarp_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
@@ -92,33 +88,27 @@ static struct ata_port_operations pata_cswarp_ops = {
 	.set_mode	= pata_cswarp_set_mode,
 };
 
-static int pata_cswarp_probe(struct zorro_dev *z,
-			     const struct zorro_device_id *ent)
+static int pata_cswarp_probe(struct platform_device *pdev)
 {
 	static const char board_name[] = "csWarp";
 	struct ata_host *host;
 	struct ata_port *ap;
 	struct resource *res;
 	void __iomem *base;
-	unsigned long board = z->resource.start;
 
-	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
-		 board);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pata");
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	res = devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
-				      DRV_NAME);
-	if (!res)
-		return -ENXIO;
+	dev_info(&pdev->dev, "%s IDE controller (board: %pR)\n", board_name,
+		 res);
 
-	host = ata_host_alloc(&z->dev, 1);
+	host = ata_host_alloc(&pdev->dev, 1);
 	if (!host)
 		return -ENXIO;
 
 	ap = host->ports[0];
-	base = devm_ioremap(&z->dev, board + WARP_OFFSET_ATA, 0x1800);
-	if (!base)
-		return -ENOMEM;
-
 	ap->ops = &pata_cswarp_ops;
 
 	ap->pio_mask = ATA_PIO4;
@@ -145,34 +135,29 @@ static int pata_cswarp_probe(struct zorro_dev *z,
 			  IRQF_SHARED, &pata_cswarp_sht);
 }
 
-static void pata_cswarp_remove(struct zorro_dev *z)
+static void pata_cswarp_remove(struct platform_device *pdev)
 {
-	struct ata_host *host = dev_get_drvdata(&z->dev);
+	struct ata_host *host = dev_get_drvdata(&pdev->dev);
 
 	ata_host_detach(host);
 }
 
-static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
-	{ .id = ZORRO_PROD_CSLAB_WARP_1260 },
-	{ }
-};
-MODULE_DEVICE_TABLE(zorro, pata_cswarp_zorro_tbl);
-
-static struct zorro_driver pata_cswarp_driver = {
-	.name           = "pata_cswarp",
-	.id_table       = pata_cswarp_zorro_tbl,
+static struct platform_driver pata_cswarp_driver = {
+	.driver = {
+		.name	= "warp-pata",
+	},
 	.probe          = pata_cswarp_probe,
 	.remove         = pata_cswarp_remove,
 };
 
 static int __init pata_cswarp_init(void)
 {
-	return zorro_register_driver(&pata_cswarp_driver);
+	return platform_driver_register(&pata_cswarp_driver);
 }
 
 static void __exit pata_cswarp_unregister(void)
 {
-	zorro_unregister_driver(&pata_cswarp_driver);
+	platform_driver_unregister(&pata_cswarp_driver);
 }
 
 module_init(pata_cswarp_init);
@@ -181,3 +166,4 @@ module_exit(pata_cswarp_unregister);
 MODULE_AUTHOR("Andrzej Rogozynski");
 MODULE_DESCRIPTION("low-level driver for CSWarp PATA");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:warp-pata");
-- 
2.43.0

