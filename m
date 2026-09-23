Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB313A3809
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155608; cv=none; b=r7GFjZelcrPh/a0KVqArAEPyhOT+lcXmdfqudgkwRuEIbiiulzPnhv7Vu09JOsUi6HRa1lLEkhA/R6NcdkzHw+sL1NRDhT8ettHFMe77yVWO2gw2ZQtU8Up/jUkFRwBMSX+PEnPfBS3FogivePMSMA8o2z6WfaGgiRKLQOELdnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155608; c=relaxed/simple;
	bh=gDkGHtVuOGyiCNM/KOJ6y139mx3vXj7oIyTL88PrJNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEaYJbMWuRl6uyykCIz9le2BLIJvLSfSDTq24gQF3S0nfN4U9au0bHcmHHZ3WktH0kAvYXGVIwIsG/jCDmLlIn/yWFl50BiIYVX0ngbAJs9zt1q7cO8oLhS7he9GzyWVNFl94hKAjm9nnDkHi+WVn+1ItHu0ItiXgBWhb+AoX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXu2bGdD; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXu2bGdD"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso372640a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155606; x=1790760406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYEBkNdsAvF45qpnvlTmS2AB5A8WDSA5/DwkjxH8zII=;
        b=SXu2bGdDhAu+avS2jFBBYxk+NSp7YIs/FaWRYH5DHVcSGUVeDfd3zuvHsP0DItpDof
         jyQIxHfC2aZm5pv+hz1LgC2OktpApHUu/44nM2w6CyfF10mqFQxlk7CNzKvK4Ls4yIfI
         oHqr7lyJoq41UK9XCUBc+JH1QkHMJUIO4EveFY7b8QPwt+mgEjDzspuOMeh6njTPqrKh
         E2+bq/vQ0Sg1y8bseKCzBf6cnCZvBVNHw6wXRA0l9xgUfCcsx1F8mBIgg4JAnUjnEvGj
         9BAd2lIH/1SWPiKCv7GNjnKTUmfcQdYvRZptsCOA8YGumTRyUrrijCUOP+Iino4ZMKF9
         BYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155606; x=1790760406;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYEBkNdsAvF45qpnvlTmS2AB5A8WDSA5/DwkjxH8zII=;
        b=N4Tf8dPhE3FmdItzmEwtXmre8ZmQyOVjZlnVYELUziQMlKmhanF/A6UKH5YH2Sk00H
         Kduvm1vdt16gdI5ISwbpznFFtLt0OQD9JyYZ6eKU/jKjzXNpyIMD1boAcz+IT/Y6UFvI
         DTbB+fF061D9u2JsmmMPJtf2NYHkZtZ1+tDJvLLwajFH3rwG01j2bh8iUu8r+iZNMXB3
         pCZfUpNT9oSYbgciyv8AevMfSUA+2THzFA+IRpQRurqzimi0ctVmKGnkGAyGNzL70a20
         4V5mlaj+CyKxjKQXyTKTcxMjvVNgqKlFlXux3h636kKlvE2AhuiIt/2tq7yzFvh7ZGEf
         TwNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCGQZmoGE3HuZYiGz3BV11jBXjyCHfUUX8sk8jRan+Tc5dHdJno5el2HAj4v1sW/n+rZ/KEEIgykB0xNM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/lgw58tBjpYzeOs2DDNG5PWLh8vb1SFT3vBV4hTIc0SXngSDS
	SfjsS5EoLYE/aUkWG4LYLnrPcT0fDuGLebito3mtGpolCmdpB3OTZg3+
X-Gm-Gg: AYBFou1U8a8p3D01QgHkp1KDF8nJEpu7YUaSRo3oDDAemKpS2XeQ15JAYwOzeS/2pRC
	RNk+hurxK7sEJ6YfigjuoRUlm997bj1qD8NgPNaZeDyafK7sy505kN+nIdy9RFjjM4biV5USi0n
	dBTgmy10A9d8ILi14hojlH1j/8Ffb0fKutE0UwapVUeqQvKRtHFaZ7D0LfLXU7uG5TXgPEoUvws
	XKd2WAqmLbW7V6dl4OFVD6L23ylVYz7xGCuQV8dPo8SsX2FonDt2Y3cC+ieBA/7U1/YKybHgr6i
	pned2chggdqat6s3TtSBsK4AEv0Nbmlgq2rCzHFdceDHr5zP/bcS1iU+dXislIJmgz2toh4d63Q
	Tplae7oySLfeOjWes3Oyg6IaHybYWoxCUuq22NQpVwqzPhjnEyevgzHUrl3nmHwnFRexuS7a91J
	RwmIdmPwJvQwvWq7KOSOYqYFXxj8Vlz1+HSxaybHBDe3kvUfcUQgycgXkeoeFBZe6Z1oQjbo4lK
	rVuQWBS4Eau5FWCeTsOZUYIp4zIj4vLAdDpMEd13kDhpZDXSAthF9Qy4Y3UPU3xMemNN2n/LddV
	4my5HzJvhCLnT0fmKi/5
X-Received: by 2002:a17:90b:2f88:b0:39e:6c69:7773 with SMTP id 98e67ed59e1d1-3a07e6cc58fmr1704432a91.28.1790155606220;
        Wed, 23 Sep 2026 02:26:46 -0700 (PDT)
Received: from Gracelands.reavernet (180-150-12-158.b4960c.syd.static.aussiebb.net. [180.150.12.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc32086sm4053794a91.13.2026.09.23.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:26:45 -0700 (PDT)
From: Stephen Bancroft <stevereaver@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Stephen Bancroft <stevereaver@gmail.com>
Subject: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
Date: Wed, 23 Sep 2026 19:26:24 +1000
Message-ID: <20260923092626.873202-1-stevereaver@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921021459.283023-1-stevereaver@gmail.com>
References: <20260921021459.283023-1-stevereaver@gmail.com>
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
Changes in v4:
- Set .suppress_bind_attrs: remove() frees the mtd_info and lets
  devres unmap the window unconditionally, so a sysfs driver unbind
  while a /dev/mtdX fd is still open would leave userspace holding a
  dangling pointer into freed/unmapped memory (Sashiko AI review).
  Module unload is now the only teardown path and is already blocked
  by open fds via mtd->owner.

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
 drivers/mtd/maps/int0800.c | 115 +++++++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
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
index 000000000000..c5f108aa3479
--- /dev/null
+++ b/drivers/mtd/maps/int0800.c
@@ -0,0 +1,115 @@
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
+		.name			= "int0800",
+		.acpi_match_table	= int0800_ids,
+		/*
+		 * remove() frees the mtd_info and unmaps the window even
+		 * while /dev/mtdX fds are still open; the only safe
+		 * teardown path is module unload, which open fds block
+		 * via mtd->owner.
+		 */
+		.suppress_bind_attrs	= true,
+	},
+};
+module_platform_driver(int0800_driver);
+
+MODULE_AUTHOR("Stephen Bancroft <stevereaver@gmail.com>");
+MODULE_DESCRIPTION("Read-only MTD map over the INT0800 firmware flash window");
+MODULE_LICENSE("GPL");
-- 
2.43.0

