Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D219E7F7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956934; cv=none; b=YRBhKSajL0SmyWXg/Cvp8kJLbEdmNLDJ2AXG3lcQ2Rkh0sTh/LdMsROeoA6CidwirNw+cT6/xZ7uT+ANl4cko8Tb3vCzTm490EnPJ9kQtN2VXasXDkVjjpqLgsTIPIKtFOlZfRJoJSRIwph6TlCemV1e7G5r/2PQaOrd0fh2llE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956934; c=relaxed/simple;
	bh=zeFPQWhH42Ky6P92MlkSlC7CGU+soJGaRARkvqRViQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMLSnlqgk23addRxvFtTbV5S5VdL7e25U9NwMfVZOxnVLoboFN1tM40APt2MK1cYFsJKXS6gt8TgkrjNXG1vYthPOBFg0Cs5HXzreCG5sOx4ygxfUzCd0k6UdhgxuhK+i5nkPsPRQxVq3EGRnzPsx9e9JVzQsX7AjFwugr0WTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi4lXOcl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi4lXOcl"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d93ff61046so24322285ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789956932; x=1790561732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uoEj2FUnGrlhFVnXCqAOwFHzmNPykWmrtcimpYb3s9E=;
        b=Qi4lXOclxRdKKX8zx6MoFTmyU3jG6v+RBBgNHLxSWsAiaH+2ZCO7ySyJ02UUmjZQtX
         qWNCTZu7fRPP4rBrQHUcKQ42wfgYDjPGEI4aqzWZWa76nQMYkdz5Z4mLTorvBVkMDOoO
         efZqd24MhDy7AC6HuFKHwZAqgxB0yfQUmunH3gkTiyhd64gufww+pAFH4CoxIbQTDctP
         nVtHpLs2fNhv5jEG59YPoC5H2IC0ZZCPat/HsMeW039TvIbVHZNY08gsL/aGawc773CN
         i51UgJr0LkKH6vZOXqCVk3LtvuJWX6uIktgv+hme/S9WNL5ib8LilAbnog+VJfecSTGe
         wkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956932; x=1790561732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoEj2FUnGrlhFVnXCqAOwFHzmNPykWmrtcimpYb3s9E=;
        b=SZdaF6AKqE+1Mh2ebajV5nnlEofwpVx1kXxsrDUBQjncseiQCv7I4/nYjxrGIufMAH
         22pA1z66Q3j3gK6mflGdBc4Ds8arNOcMwOVZxbO2GCSfyK3vvW1+nDMWshIpQ5sS4hU4
         PnIN6w1amoizW01V7Rx7bhQmla/5hSmdWCSyUdZ/yR0BvZA9yLXBFPGDc2MII2mi6s7L
         R61oYvcqTpTpf/7B0jiF9N27GlW1LkgKzrtZX/TXldCDy9WM8acvDjdambipNrg/yBML
         gRp9BBQDQLhSVQNDS/yClrDuPhRbhnTm0/wAHBHZdWmh29sHAkhw0j+yT1R1hJaeNjm3
         GqQg==
X-Forwarded-Encrypted: i=1; AKwUvBzeswAC/cFdFrQbyyOP8fz24pq4uek85mqk00cfp2tM8coIB6eo69kf08hRoRvrbIKzIiHaYRf6EIW8FUw=@vger.kernel.org
X-Gm-Message-State: AFuF++k6SzGaV2R1DSO7kNxXl1G5MUbqG+JXdVdUKOaB3SSGQo/J4TZ7
	MeQWiojOxZ2g2KDgr/BofudWkXWdbi6atueqJTkNMYMtyMpsUfcYODLntEWPT0CP4j0=
X-Gm-Gg: AYBFou31lE1U9uF5rl8m7J1EsECNYlZVd9RrlsI3W0O5tvh9hEuO4KSlgm4jsb9NiaX
	jflKiF6SmfcxAFP87bxiHj2hi01S3qyd0AKLUNOcFdx8hB8ITIGg0+0NCo0EwqUkPpR2XZwrLJ5
	6ev/y8sJQMSMnvxph2Cb3QA16km6V7JCdpV+kacxAxP+NJ1wMEapPJaQqoftPT7AltWip0GEEVI
	CfKL4u2jTXA3/uNcMnidG3lEzZx4bOt4ITzhvRR2W12VWhhHi3ZndjZUFvdYLDP5EMDFOoB5hxJ
	4fqnJmvV+uZrFTBQhVUnoi/00UVCyhHA82ZVHxemXbY7yPNzOMvxEB9WcfujoW5e758ko9ce6JD
	JzWCeis2ww6WVMoUlwlku5CJ/5reCQCWWp0HPTIyeN5JucBLMX8cERvEycXlB9IX/8TTaEp0AD8
	jJEeqIfVMjCfEq82BiDDbZPHppC+tPeD8i4zOPOCykAMwqGSA+puis+XnJl7KnveLaCBsvAMTyY
	UssaGkbAy76Mcd0wBpdMMYNTRoSs5LBiWVoxKlFxEelvhRwb3pqUDmS1KOcsxTIySYO9cgjMamg
	JSISyFuFutdOWKaXEsOO
X-Received: by 2002:a17:902:c941:b0:2d9:3bee:4f32 with SMTP id d9443c01a7336-2ddb1b9a350mr148208115ad.20.1789956932311;
        Sun, 20 Sep 2026 19:15:32 -0700 (PDT)
Received: from Gracelands.reavernet (180-150-12-158.b4960c.syd.static.aussiebb.net. [180.150.12.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179ddbdsm25696905ad.35.2026.09.20.19.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:15:31 -0700 (PDT)
From: Stephen Bancroft <stevereaver@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Stephen Bancroft <stevereaver@gmail.com>
Subject: [PATCH v3] mtd: maps: add INT0800 firmware-flash map driver
Date: Mon, 21 Sep 2026 12:14:47 +1000
Message-ID: <20260921021459.283023-1-stevereaver@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <V2-MESSAGE-ID>
References: <V2-MESSAGE-ID>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a read-only mapping driver that binds the ACPI INT0800 "Intel
82802 firmware hub" device and exposes the system firmware flash as an
MTD ROM device.

On x86 machines the boot flash is decoded into the physical address
space below 4 GB, so a plain ioremap() of the declared resource window
is sufficient for reads - no SPI or LPC controller access is needed.
The window may be larger than the real flash; undecoded holes read as
0xff.

This gives userspace a clean, safe way to read firmware flash contents
without flashrom or relaxed /dev/mem access - for firmware analysis,
and for extracting option ROMs stored inside EFI firmware volumes
(e.g. the NVIDIA VBIOS on EFI-booted Apple machines, which can then be
fed to nouveau via nouveau.config=NvBios=). There is deliberately no
write or erase support.

Tested on a MacBookPro4,1 (ICH8M): /dev/mtd0 reads are byte-identical
to a flashrom dump of the 2 MiB SST25VF016B, except for live NVRAM
variable-store regions.

Signed-off-by: Stephen Bancroft <stevereaver@gmail.com>
---
Changes in v3:
- MODULE_AUTHOR: use full author identity (per Miquèl Raynal's review)

Changes in v2:
- Per-device state via devm_kzalloc instead of globals (fixes shared
  state corruption with multiple INT0800 devices)
- Clean up map probe on mtd_device_register() failure (fixes
  memory/mapping leak)
- Use %pa for resource_size_t in dev_info (fixes format string on
  32-bit)
- Add missing Signed-off-by

 drivers/mtd/maps/Kconfig   |  17 ++++++
 drivers/mtd/maps/Makefile  |   1 +
 drivers/mtd/maps/int0800.c | 108 +++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/mtd/maps/int0800.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 1bb3dba2631d..649fd145e15d 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -161,6 +161,23 @@ config MTD_AMD76XROM
 
 	  BE VERY CAREFUL.
 
+config MTD_INT0800
+	tristate "Read-only BIOS/firmware flash via ACPI INT0800"
+	depends on X86 && ACPI
+	select MTD_ROM
+	help
+	  Support for reading the system firmware (BIOS/EFI) flash chip
+	  through the memory window described by the ACPI INT0800
+	  "82802 firmware hub" device, present on most x86 machines.
+
+	  The flash is exposed read-only via the ROM chip driver, e.g.
+	  for firmware analysis or extracting option ROMs (such as
+	  video BIOS images embedded in EFI firmware volumes). There is
+	  no write or erase support.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called int0800.
+
 config MTD_ICHXROM
 	tristate "BIOS flash chip on Intel Controller Hub 2/3/4/5"
 	depends on X86 && MTD_JEDECPROBE
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 01745eca1f73..2f1a7375e13c 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_MTD_L440GX)	+= l440gx.o
 obj-$(CONFIG_MTD_AMD76XROM)	+= amd76xrom.o
 obj-$(CONFIG_MTD_ESB2ROM)	+= esb2rom.o
 obj-$(CONFIG_MTD_ICHXROM)	+= ichxrom.o
+obj-$(CONFIG_MTD_INT0800)	+= int0800.o
 obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
new file mode 100644
index 000000000000..0188d58b168d
--- /dev/null
+++ b/drivers/mtd/maps/int0800.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Read-only MTD access to the system firmware flash behind the ACPI
+ * INT0800 "Intel 82802 firmware hub" device.
+ *
+ * On x86 systems the boot flash is decoded into the physical address
+ * space below 4 GB, so a plain ioremap() is sufficient to read it -
+ * no SPI or LPC controller access is required.  The declared _CRS
+ * window may be larger than the real flash (the whole top-16MiB
+ * decode range is commonly claimed); undecoded holes read as 0xff.
+ *
+ * The device is exposed read-only via the ROM chip driver; there is
+ * deliberately no write or erase support.
+ */
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/* top-of-4GB firmware decode, used when _CRS reports no window */
+#define INT0800_DEFAULT_PHYS	0xffe00000UL
+#define INT0800_DEFAULT_SIZE	SZ_2M
+
+struct int0800 {
+	struct map_info		map;
+	struct mtd_info		*mtd;
+};
+
+static int int0800_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct int0800 *fw;
+	resource_size_t end;
+	int ret;
+
+	fw = devm_kzalloc(&pdev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	fw->map.name = dev_name(&pdev->dev);
+	fw->map.bankwidth = 1;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res) {
+		fw->map.phys = res->start;
+		fw->map.size = resource_size(res);
+	} else {
+		fw->map.phys = INT0800_DEFAULT_PHYS;
+		fw->map.size = INT0800_DEFAULT_SIZE;
+	}
+
+	/*
+	 * Plain ioremap on purpose: the window is already claimed by the
+	 * ACPI/pnp resource reservation, so devm_ioremap_resource() would
+	 * fail with -EBUSY.
+	 */
+	fw->map.virt = devm_ioremap(&pdev->dev, fw->map.phys, fw->map.size);
+	if (!fw->map.virt)
+		return -ENOMEM;
+
+	simple_map_init(&fw->map);
+	fw->mtd = do_map_probe("map_rom", &fw->map);
+	if (!fw->mtd)
+		return -ENODEV;
+	fw->mtd->dev.parent = &pdev->dev;
+	platform_set_drvdata(pdev, fw);
+
+	end = fw->map.phys + fw->map.size - 1;
+	dev_info(&pdev->dev, "mapped firmware window %pa-%pa\n",
+		 &fw->map.phys, &end);
+
+	ret = mtd_device_register(fw->mtd, NULL, 0);
+	if (ret)
+		map_destroy(fw->mtd);
+	return ret;
+}
+
+static void int0800_remove(struct platform_device *pdev)
+{
+	struct int0800 *fw = platform_get_drvdata(pdev);
+
+	mtd_device_unregister(fw->mtd);
+	map_destroy(fw->mtd);
+}
+
+static const struct acpi_device_id int0800_ids[] = {
+	{ "INT0800", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, int0800_ids);
+
+static struct platform_driver int0800_driver = {
+	.probe	= int0800_probe,
+	.remove	= int0800_remove,
+	.driver	= {
+		.name		= "int0800",
+		.acpi_match_table = int0800_ids,
+	},
+};
+module_platform_driver(int0800_driver);
+
+MODULE_AUTHOR("Stephen Bancroft <stevereaver@gmail.com>");
+MODULE_DESCRIPTION("Read-only MTD map over the INT0800 firmware flash window");
+MODULE_LICENSE("GPL");
-- 
2.43.0

