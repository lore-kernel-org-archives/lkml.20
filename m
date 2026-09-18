Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FF4F3ED4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745233; cv=none; b=lKbJ4mZJoi0kjfc1mJbCTAH9vL0YJhC0Jr0UUCY6qQlcw9s4ix3NCaNiXrelEkOQw2dUFkhfsn0bSQW3w52gYvV3Dpw/BY75K1mNHpKkrgteKdkoYVGnhYd+fwfZLwLZoD4+5urDWjbMBwcRHH1frlVCEAFcOKPFOoDOLIjEsR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745233; c=relaxed/simple;
	bh=COBOR/J1xKvdjdfhzkygn5/MMwImdCVq1tdwr8l5gi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmsnSjrZGBQsNsl5CoCXGfMOKfi4E0gjq3ydeIhWgXA+4QDzYL9j8FxAEXHQNpQ3yPNzkf1m50NPAEraTmf1zgXzRxma3F6ofL4F92n7SD6bal5Hvn5JdOTElthfi6IpTPCnCrCzfnMFe1GRv4jNHkWzFVCYKGpPt53akAF35Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=k+dNFuLl; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="k+dNFuLl"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067cso90279685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789745226; x=1790350026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnXYtnVnoVw2HAMCABb9i/9BDSRkcXebPIHKXClOGFU=;
        b=k+dNFuLlfdvprj8gM4eRBgOQRMHYhsrIWb6NfwKcwAJkUTig4/Ishbipb2pNUKfNGF
         r2BIUxyg91OBLBDv1puBQ0utEYuylT01j8xGvIK7UMHuFx5+vr15zv/8eiimYgvQdbX2
         1yYx1+C9tuV2LqzxWHutgqJvouElnuYD9NnZNuyffmXNX0kuMeVtUsfsJcz0sS/mBI4h
         4EzZA8ErHtpwsDOt5yMcsxMN5Hglos/F85l2/0EQeU1+bZEQPi2vJ6WlcbtZ3O+YpG9M
         631xRn+RKakFWV4J5j51nhzxTy6clZH+Gqw2apJMUH0jeh0L4yEJH1cXBysQ7inmyVCb
         Ry+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745226; x=1790350026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnXYtnVnoVw2HAMCABb9i/9BDSRkcXebPIHKXClOGFU=;
        b=n0TSUwtYDdRrK64rp99vDxJR1qOY0ySF2RaJbIoaA4uvFP3u532pRN6UmhuYicudeC
         9KER6QHCUnRF2N6p1sC5DxWYGPs48kd51xonIYQ5iYnlIUrJBhk63Y2RYkzpvyMwj2xe
         V0fZTkG5MO3u+ZA3iIZFoHseCdcO37CO1EQFJiBzBAC2aFkU7PnVs0Svqabg9qcea3mt
         aABOwXx0y/iZjuxjR8XGgPwBk93fEVmvOd58Q7jnDpAXKGcP+aeaPv/SMycszL8xaerF
         FMvs+PgBkg9Oq+JwEZIM5NKBxzxMitU7C2yWhfYHkCwd97Db1yI5AfvqwnGafUuOgwVa
         Ynkg==
X-Forwarded-Encrypted: i=1; AKwUvBwASL2lvQePQxXp39VM7RezrelZOkrd0Xx8avIWEe8POC8TLIwu4W5f8G/vqXTnpW8mamSN/XZTpCPWt9c=@vger.kernel.org
X-Gm-Message-State: AFuF++lz6I7WbqsSgTklb1+P9pHrPcw+FoM9B0/WAwGDAhXrFDq8vUue
	OYyPmbX3FsKvl+rNbMQXSjIgv5hqyUOnYAZ2JorT/bSQdnWMLCVihlSCSHpgF6+KTZY=
X-Gm-Gg: AYBFou0OhNMQNPCT6jsIW1p2mDIhg1h5WfTIa1ZJJE9dgKHBDDnyklvlH7hPXyiUfdL
	otceXLfilimqrNtM1vYXN6MWQIr/ISf7+5n4mPpy64Q7gu1ax1wdc1uqXcmYAQW05h/6SxC2pMN
	W3MM4HwVvNl9QOX/pM/bbfd5IoILOE4sSg3veanOFvIeJ9EQfmb0js+1/Oze7544QoduN1pfxMP
	h7RczxgP8GrFmMGry9dbj+gqE4BCOsfDW/ySh8uFUQV3CCn3C35UwL0pGoTlM4zVZ1nK6tikPHL
	6l7GSO9axaL88XWPc3eYrudN17ZgWBzwdj3sC2+wowYkNCtNEKgKVrH5gW45wJJgwfqi22JT5Lh
	XeD+m82iZSHphSVmS9dLuSdCbunEXKXAmqRJWF4n0v5vacB9/sEXX30i8YRWLw+T+k6Cx2479By
	ehSYQpv4U/Fq0lmmlFyP8RFIjog71yIDRUCKZ8tmiVi/0lmWNp5CCgZVaRvsoXfr0cTxmUQWgrk
	3U=
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id af79cd13be357-93bdca433b5mr406199585a.70.1789745226375;
        Fri, 18 Sep 2026 08:27:06 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91257f326d8sm15099766d6.6.2026.09.18.08.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:27:06 -0700 (PDT)
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
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] misc: tc9564: introduce base PCI driver
Date: Fri, 18 Sep 2026 10:26:57 -0500
Message-ID: <20260918152659.413268-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918152659.413268-1-elder@riscstar.com>
References: <20260918152659.413268-1-elder@riscstar.com>
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
IP blocks to be bound to platform drivers that do MMIO via the PCI BARs.

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
v4: - Refined the definition of the TC9564_PCI Kconfig entry
    - Now use pci_enable_device() rather than pcim_enable_device()

 MAINTAINERS               |  1 +
 drivers/misc/Kconfig      | 15 +++++++
 drivers/misc/Makefile     |  1 +
 drivers/misc/tc9564-pci.c | 84 +++++++++++++++++++++++++++++++++++++++
 drivers/pci/quirks.c      |  1 +
 5 files changed, 102 insertions(+)
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
index 7364931dad3a1..9c5b1e9d672e8 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -568,6 +568,21 @@ config MCHP_LAN966X_PCI
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
 
+config TC9564_PCI
+	tristate "Toshiba TC9564 PCI function support"
+	depends on OF
+	depends on PCI
+	select PCI_DYNAMIC_OF_NODES
+	select PCI_QUIRKS
+	default m
+	help
+	  This enables support for two PCI functions implemented by the
+	  embedded PCIe endpoint in the Toshiba TC9564 SoC.  A platform
+	  driver uses a pci-ep-bus node in devicetree to provide MMIO
+	  access to other SoC devices through PCI function BARs.  A PCI
+	  quirk causes the ranges property in the endpoint's devicetree
+	  node to be updated dynamically.
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
index 0000000000000..e4d00dfecfca9
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
+ * endpoint which implements two PCIe functions.  Each PCIe function drives
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
+static void tc9564_function_remove(struct pci_dev *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+	pci_clear_master(pdev);
+	pci_disable_device(pdev);
+}
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
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable device\n");
+
+	pci_set_master(pdev);
+
+	/* Scan for pci-ep-bus (simple-bus) nodes and probe their sub-devices */
+	ret = of_platform_default_populate(np, NULL, dev);
+	if (ret)
+		goto err_depopulate;
+
+	return 0;
+
+err_depopulate:
+	tc9564_function_remove(pdev);
+
+	return dev_err_probe(dev, ret, "failed to populate platform bus\n");
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

