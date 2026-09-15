Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654F4BE431
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495816; cv=none; b=kMxwew2cfzF5H+kaRKx1x7b4dfKbGJwRja6qZwb3ZHpVHe3G01tPs4pSmdE2lN0kSyG5u4mtdl7d/jocUSvtsFF0dnoZZbi2VXRSgXGiPxr4w/ss0IjRuCPRnqzWg3Pw1MAdgoOOI5fLruD8WiO/qzsJ3VfUsx+isQska1h0wSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495816; c=relaxed/simple;
	bh=jFoxdux0wrRAGgjXbC4e/Ezp+SHTGN6U+C7MT5kRbTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMf+paSuSybv5u05RYdi7w8mXxviOJ4jkGqU4kskU89WtSBJiJgdeFQ084IYz/VBHGTIWQYxK2B5iDgaplq33TWBw4t+RlrwEDLssaT28LZ379Dln+CB999/HW8v+N2+SjdzasCpZawGXGNDLd0fA6d++nmAxlkfe5//X6Kuuz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RlA4eZoO; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RlA4eZoO"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa8so7382085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495810; x=1790100610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4WiN+Wa/+9pdrc7rIlvQD4FYM3H93hwsZ2FoFV7wN8=;
        b=RlA4eZoO6/22YVnN5f/CUqGcbvRxkxwV2p/x8YrlOA9rX+j32FFLnwppkhExSGpPtK
         DA5FyWlo9iK2GCZ4gLNtSrdojsHI/Z62bMDKEvBdXSwEyWK5kDE3At+dqx+rx59pz28T
         6Cg239I3bQAVP1++pRUPQgLfme9hHBmrmBW/65jU4Qgo57iYBRMcXSlaSSFshNIxXY6M
         dhQK8qmJndMsBHxAFD7jc2mLNx8ZUAnuf8WrdXW0jXjqYQ8nyV/XYigZtc9lIygCiDXV
         T74DLD6Fnwf7sVTmubMq9CIY4gOiFaebViH9fW9yM/A/Z4MZ9pXakJz7GqegctPPJ4wr
         T3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495810; x=1790100610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4WiN+Wa/+9pdrc7rIlvQD4FYM3H93hwsZ2FoFV7wN8=;
        b=k0gDOS8EH4B2IK5RlDv4Z7LDqIlXmxli8H1dopj3HatZ9xtWWL8jaqkphYv7XDensH
         8L864oPWdx11PK3XUqIRs3O4tyn9QtZ62VSBuYK0TWT5jRkFEr6EqG21sfx2LdBqVKyq
         2bdl7gjirSqZP9qCX+PCl1AhdchabYXvC0hOITwfQ3m7pPV1rILuxX/oTm+yxuGFqy4J
         msCBGDZE7RWBuk1u+izAvLDapAUEdvb4Jy3bWtni98L3yJcbQk7XP09cP5h57eoeXwBA
         SiDBgEUL3bJ01eTHJIeok9kNYBhB1V8N5pNhpZbRqJjwV06veYrXGDfk9P4f6oFIyhmo
         Emnw==
X-Forwarded-Encrypted: i=1; AKwUvBw27WGTBlFC/kMayCYuqkc5QbhICex8sqB6wDom2ALR6jcmupxvfGBpCjHBpSw799aPVO3Huldb9/arcAU=@vger.kernel.org
X-Gm-Message-State: AFuF++lpgkzAc35888E+IfDFzMdo/2a4o00ZYpNo4BNeWzTOHYuSTZ3k
	Wm7HkzUW5VLV7+3q6MjFkv/xfJ8MWZeulrqlUxEQ+LkKxbZROr5ehPbIl2AfnQkmlZ588VXe3bX
	EOp5tfgQ=
X-Gm-Gg: AYBFou25y3tYANKo2Fei8UMyEakGwN4xsmQRjT7lXuEX55WypPdakPHHovLQ+xyDe/H
	ha1wrk4LZY89irHJbSf2qLf0tjNz0eUNf3z8hdsRhqlK1z4olumtPRLWb969iMs9XXJwkeYbSK7
	THCRFjJGi5gKsp21jQNoGHpv9AChtAZcF3jg+JEMN4rOKspgoTZukwqHhHerYKZRS8+8q9dAbmm
	PyAVP0lR0gWQIHTiKRNIDkEDCuatGdVrRzz2TO80kT6VhMPpmD9sT+3aRE1GCihImaRJuE3oQXz
	P0hABnLncQFUDKAEPEsfJLf7EhntCJ6DSTpJC/NfpAwK184ACuRJ57vAFN4fQzYlIEQCMK60Vhd
	lP2mECEaAH8NsuF5YxQfbjO4P2mbi4zsgdRFaGIcIeGWAEoW5akcfeL/+ijY8hxvGTXqHLf5o6o
	8aldFkFrKlZ17gOCrY+316SCqdEEAIsG5c0GGm5XlXIFAGw7cUensArOSZ3rH23wl8oHWxpP4vc
	Fo=
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id af79cd13be357-93a299edea9mr1397956185a.39.1789495810011;
        Tue, 15 Sep 2026 11:10:10 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:09 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] misc: tc9564: introduce base PCI driver
Date: Tue, 15 Sep 2026 13:10:01 -0500
Message-ID: <20260915181003.1633543-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915181003.1633543-1-elder@riscstar.com>
References: <20260915181003.1633543-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Toshiba TC9564 is small and highly-specialized SoC that implements
a PCIe switch as well as an Ethernet AVB/TSN bridge.  In addition to
these, the SoC implements other functions, including a reset and clock
controller, an address translation unit, and a few other devices.  PCIe
BARs provide access to registers that manage these IP blocks, and the
SoC is modeled using a PCI endpoint bus in devicetree.  This allows the
IP blocks to be bound to platform drivers using MMIO through the PCI BARs.

Create a new PCI driver under drivers/misc that binds with the embedded
PCI endpoint functions within the TC9564 SoC.  Because these functions
will use devicetree pci-ep-bus to provide access to other IP blocks
within the TC9564 chip, the main purpose of this driver is to do basic
PCI initialization, then call of_platform_default_populate() to scan for
the any endpoint bus children, and probe all devices defined therein.

Because we're using pci-ep-bus, we need to use the PCI quirks mechanism
to have of_pci_make_dev_node() be called for each endpoint device in
pci_bus_add_device() (via pci_fixup_device(pci_fixup_final, dev)).

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Dropped Kconfig dependence on REGMAP_MMIO
    - Added call to of_platform_depopulate() on error in the probe function

 MAINTAINERS               |  1 +
 drivers/misc/Kconfig      |  9 +++++
 drivers/misc/Makefile     |  1 +
 drivers/misc/tc9564-pci.c | 84 +++++++++++++++++++++++++++++++++++++++
 drivers/pci/quirks.c      |  1 +
 5 files changed, 96 insertions(+)
 create mode 100644 drivers/misc/tc9564-pci.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aa6b805e1ab2b..cf846853fdc79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27675,6 +27675,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
+F:	drivers/misc/tc9564-pci.c
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 7364931dad3a1..c35f9dda355a6 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -568,6 +568,15 @@ config MCHP_LAN966X_PCI
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
 
+config TC9564_PCI
+	tristate "Toshiba TC9564 PCI function support"
+	depends on PCI
+	help
+	  This enables support for the two PCI functions implemented by
+	  the embedded PCIe endpoint in the Toshiba TC9564 SoC.  This
+	  driver uses a pci-ep-bus node in devicetree to provide MMIO
+	  access to other SoC devices through PCI function BARs.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index e8d8d5d88c0df..7cc3d615d37a4 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -71,3 +71,4 @@ obj-y				+= keba/
 obj-y				+= amd-sbi/
 obj-$(CONFIG_MISC_RP1)		+= rp1/
 obj-$(CONFIG_INTEL_SSEI)	+= issei/
+obj-$(CONFIG_TC9564_PCI)	+= tc9564-pci.o
diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
new file mode 100644
index 0000000000000..10dfa3beecc53
--- /dev/null
+++ b/drivers/misc/tc9564-pci.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC9564 implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to three downstream PCIe ports.  Two of the downstream
+ * ports are external, and the third is internal, implementing a PCIe
+ * endpoint with implements two PCIe functions.  Each PCIe function drives
+ * a Synopsys XGMAC Ethernet interface capable of 10 Gbps operation.
+ *
+ * The TC9564 implements other functionality, including an embedded MCU,
+ * a UART, a GPIO controller, a reset controller, a clock controller, and
+ * interrupt handling.  These features are separate from (and in some
+ * cases used by) both Ethernet XGMACs.  Each Ethernet MAC must be
+ * attached to a working PHY for it to be functional, and for this
+ * reason either of them (or both!) might not be usable/used.
+ *
+ * This PCI driver binds to the Toshiba TC9564 (physical) PCI function
+ * (VID 0x1179, DID 0x0220).
+ */
+
+#include <linux/device.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pci.h>
+
+static int
+tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	int ret;
+
+	/* Despite being a PCI device, we require devicetree */
+	np = dev_of_node(dev);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	/* Scan for pci-ep-bus nodes and probe their sub-devices */
+	ret = of_platform_default_populate(np, NULL, dev);
+	if (ret)
+		goto err_depopulate;
+
+	return 0;
+
+err_depopulate:
+	of_platform_depopulate(dev);
+	pci_clear_master(pdev);
+
+	return dev_err_probe(dev, ret, "failed to populate platform bus\n");
+}
+
+static void tc9564_function_remove(struct pci_dev *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+	pci_clear_master(pdev);
+}
+
+static const struct pci_device_id tc9564_function_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_TOSHIBA, 0x0220), },
+	{ },
+};
+MODULE_DEVICE_TABLE(pci, tc9564_function_id_table);
+
+static struct pci_driver tc9564_function_driver = {
+	.name		= KBUILD_MODNAME,
+	.id_table	= tc9564_function_id_table,
+	.probe		= tc9564_function_probe,
+	.remove		= tc9564_function_remove,
+};
+module_pci_driver(tc9564_function_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 PCIe Embedded Function Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21fd..54e310c4153df 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6391,6 +6391,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_TOSHIBA, 0x0220, of_pci_make_dev_node);
 
 /*
  * Devices known to require a longer delay before first config space access
-- 
2.53.0

