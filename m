Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB34457D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385426; cv=none; b=HtNmWNwx0J7BXLWx5NGxZDCxV99FtunK31d4wO4v8m1pCtsNF2glCON5wQ7TxEu13JHR9SnVzPsyoFqZQUrkt7++bLHerfoP2/0tbt4VB12/WCVFF/qegsff1UmvWHko8BRKbwsS0zGNaXjSOd2mzTgEeOTC8mVEaC/CuEZcLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385426; c=relaxed/simple;
	bh=ddAFF0Uq46JynfQOfZekH3N4tbsuH/HF3GW5ce2DZJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZ4AfnlR/8hbhf2LHacyBL9kO3sENuv2VwptwJmzVoHRcvibR0/VL/HUTkCFlnpqOQZ1q+2LjqM5QqLIOsKIpLIECUf88ZEka2aIyT+6V1l0mrKeXA18EZGjAX1QsFZWRrsMG64jTveevStlCzB0c1ka4tfeqqQ77TFCD3NCU9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TV2t5YRa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV2t5YRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385424; x=1820921424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ddAFF0Uq46JynfQOfZekH3N4tbsuH/HF3GW5ce2DZJo=;
  b=TV2t5YRa/drJfB2wGR5mk99VurdjQMtELC6Kq0atUkvqm70UfhYWzzzb
   E9imZ+2IWyOAyRxqXOQNtOncp2CpDw0S0Q0vVob7170y8vQY7h/yNBZMe
   1oxUDoFQ7asRnDaRSN8GjkjI1smjHamvlUpvMk6nPZvSZEPXRf9UAww8u
   fWv91Ao7ySAPGwlNjJQc4XAYTe5RXoxbPEyBJV1weus2DWVggUdPqJvVD
   bkKjm5Om7D8zFxMDpQREXx1OqBVeW+btnVEzsXgGgH8v+E4toCUgYn3cV
   oOT9hM5Qrf1TNv95bCs7NDYP7RiML7Z5xN0mg/Yv7ey3k00n7aqtfeRm1
   Q==;
X-CSE-ConnectionGUID: IxESWhnATriDUbB0Ft1bZQ==
X-CSE-MsgGUID: bxxxaDYOSYuipgJbRe/NQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864429"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:24 -0700
X-CSE-ConnectionGUID: /Bd0C5kBQiqnrZptJkGqbg==
X-CSE-MsgGUID: Tigk/AWNQPqMBDDz6bFtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133094"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:23 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/17] i3c: master: Match ACPI targets to the correct bus controller instance
Date: Mon, 14 Sep 2026 14:29:50 +0300
Message-ID: <20260914113003.183150-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

For ACPI-enumerated I3C targets, _ADR encodes both the zero-based bus
controller instance number in bits 51:48 and the Provisioned ID (PID)
in bits 47:0, as defined by ACPI 6.6 Table 6.2 and MIPI DisCo for I3C
v1.1 section 5.2.

However, i3c_master_add_acpi_dev() treats the entire _ADR value as the
PID. On multi-instance controllers this folds the instance number into
the PID, causing i3c_master_add_i3c_boardinfo() to reject devices on
instance 1 and above with -EINVAL.

The problem is exposed by the MIPI I3C HCI PCI driver, which creates one
MFD child device per bus controller instance. Since the child devices do
not have their own ACPI companions, they all inherit the parent's ACPI
node and therefore enumerate the same set of child devices. As a result,
a target belonging to any instance other than 0 prevents registration of
all controller instances.

Add an instance number to struct i3c_master_controller, propagate it
from the HCI PCI driver, extract the PID from bits 47:0 of _ADR, and
ignore ACPI child nodes that belong to a different controller instance.

ACPI-enumerated I2C devices are unaffected. Their controller instance is
encoded in the Resource Source Index of the I2cSerialBusV2 descriptor
rather than in _ADR and will require separate handling.

Fixes: b46a4b3c5d1e ("i3c: master: Support ACPI enumeration of child devices")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c                          | 19 +++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/core.c        |  4 +++-
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  1 +
 include/linux/i3c/master.h                    |  3 +++
 include/linux/platform_data/mipi-i3c-hci.h    |  4 ++++
 5 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f9a6c8560fab..215a22f2c7b6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/i3c/i3c.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bug.h>
 #include <linux/delay.h>
@@ -3076,6 +3077,13 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
+#define I3C_ACPI_ADR_PID GENMASK_U64(47, 0)
+/*
+ * Zero-based instance number of the Bus Controller to which the Target is
+ * connected.
+ */
+#define I3C_ACPI_ADR_INSTANCE GENMASK_U64(51, 48)
+
 #ifdef CONFIG_ACPI
 static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
 				   struct fwnode_handle *fwnode)
@@ -3083,6 +3091,7 @@ static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
 	struct acpi_device *adev = to_acpi_device_node(fwnode);
 	acpi_bus_address adr;
 	u32 reg[3] = { 0 };
+	u64 pid;
 	int ret;
 
 	/*
@@ -3100,9 +3109,15 @@ static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
 
 	adr = acpi_device_adr(adev);
 
+	/* Match the multi-bus instance number */
+	if (FIELD_GET(I3C_ACPI_ADR_INSTANCE, adr) != master->instance)
+		return 0;
+
 	/* For I3C devices, _ADR will have the 48 bit PID of the device  */
-	reg[1] = upper_32_bits(adr);
-	reg[2] = lower_32_bits(adr);
+	pid = FIELD_GET(I3C_ACPI_ADR_PID, adr);
+
+	reg[1] = upper_32_bits(pid);
+	reg[2] = lower_32_bits(pid);
 
 	fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dadf049bd4b5..8b3a87d8a8bb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1142,8 +1142,10 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
 	 * mappings, provide base_regs from the parent mapping.
 	 */
-	if (pdata)
+	if (pdata) {
 		hci->base_regs = pdata->base_regs;
+		hci->master.instance = pdata->instance;
+	}
 
 	if (!hci->base_regs) {
 		hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index af9595009b03..5b8e10d05cee 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -390,6 +390,7 @@ static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
 					struct mfd_cell *cell)
 {
 	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
+	data->pdata.instance = idx;
 
 	data->res = DEFINE_RES_IRQ(0);
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f7ceec2b4477..72065715feee 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -536,6 +536,8 @@ struct i3c_master_controller_ops {
  *		 Bit 0: SETDASA
  *		 Bit 1: SETAASA
  *		 All other bits are reserved.
+ * @instance: Zero-based instance number of the Bus Controller as defined by the
+ *            DisCo specification I3C Target Address (_ADR) Encoding
  * @wq: freezable workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
@@ -573,6 +575,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	u8 addr_method;
+	u8 instance;
 	struct workqueue_struct *wq;
 	struct work_struct hj_work;
 	struct work_struct reg_work;
diff --git a/include/linux/platform_data/mipi-i3c-hci.h b/include/linux/platform_data/mipi-i3c-hci.h
index ab7395f455f9..6f61d8a02378 100644
--- a/include/linux/platform_data/mipi-i3c-hci.h
+++ b/include/linux/platform_data/mipi-i3c-hci.h
@@ -3,13 +3,17 @@
 #define INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
 
 #include <linux/compiler_types.h>
+#include <linux/types.h>
 
 /**
  * struct mipi_i3c_hci_platform_data - Platform-dependent data for mipi_i3c_hci
  * @base_regs: Register set base address (to support multi-bus instances)
+ * @instance: Zero-based instance number of the Bus Controller as defined by the
+ *            DisCo specification I3C Target Address (_ADR) Encoding
  */
 struct mipi_i3c_hci_platform_data {
 	void __iomem *base_regs;
+	u8 instance;
 };
 
 #endif
-- 
2.53.0

