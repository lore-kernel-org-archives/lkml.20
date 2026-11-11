Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398507;
	b=M3n/adAmnALS3CgcBJcl9hD+bPAnUHhDMK52PqcDlbZ74jtB2Z7vOXE84oTa7Xjf61CL
	 wdHazIbZ3fQfVyZIJK9HPCnkeNm08011HQLmH3DEx7PO933rCROG4KNOHzsbiZZZTdngN
	 mjZB88ApU5Ojzfl+zdM1CH7SQxtyMSBpTGj6r8w2z7/TxVN5lD64LQ71g17HR3DrphAlI
	 6bu9xmjnmeWmRfnvLwP2rqn70ZfUp8p4I0dTnJwhgBn8TCkailrZlb2DCkZoI9BYrqBq3
	 A03hrzhYw86fQUm4BEZeHZ3F++MzBBtNjHFWEEf3FJajJeDMDPV1nV7YkA6WicYoXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=8nvY7JSn0bN8QX79jYC7sODSOXhQKxMzBEiXosphON0=;
	b=x9cICImJQiQNid+qei6BS/Hvjppm+mT1YSnKnRkndUo5xcB3u7u6III1EEtUnXPuu/SF
	 yLTYSiw/0wgmp8BLhP2KxrzNZ5rKTGJW4t+2LaE3VR4Mbgaim954T/xAKrLe0o45EgzrW
	 Q1jmieofnjN14ClQ/kQ69Oe8ZV08MykAvryg9qmP5tIZ10NIJ2hQkkV2Dze36D4ZCdgfc
	 S+8wtn0BNe2uy9j7ywOjLCtjDmTdeIe8shG4qL80B1KrYz/V4bvGrUN8JxGefjt7kUB9k
	 ZtxLSz2hqk+eE6NEPBe6nmecFIu+n2HIwwA41C3eO+mq0F73/JqTTRakXgIOrOT0o/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Eip8SmAy;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C15606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C15606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Eip8SmAy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398507; x=1825934507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KTLjJ/O9RGML8gPs2j1q9JRI0snXsHLPfjX2nh5CoaE=;
  b=Eip8SmAyncWKNKaShlxZR9VOwg3S7ixYG7W7bH4h+aXb/kVCMTLMxt/j
   U6ee92zrVOtdauDSTt7QvEucwyKUpj3qS19eihxnXGHCyXU8e9UK5/6T0
   Mn242Aw7DjXQv6M63/sjleRc2WH+YMM+jJ4cuenPm5cIeIu0JUvjhcMAl
   n7mP2BDaOGk1g93P2+NMWZYiBDfSy76VhkXRAnIUxVJsPELPWBnnRjjfq
   XWM+JbZEZtLdGbt0T1DSAv4mM9UjaPDCF2cAVqwfiD/S/+Q2lJjwe+CqS
   LeREt38JIuQ4xrkFUP+aj30QjV1Tbdh0RIIvlA3FDYcB+WTiIa9IWlzH3
   A==;
X-CSE-ConnectionGUID: kEGzk551RXSGkOP0Z8YbkA==
X-CSE-MsgGUID: qmNVNd98THqoHMWeynT9Iw==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="66350402"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Nov 2026 05:01:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Nov 2026 05:01:45 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 05:01:42 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <srini@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: drop fw_devlink suppliers below a flash that failed to probe
Date: Wed, 11 Nov 2026 17:31:31 +0530
Message-ID: <7917c70c24cf072bb5f3bd0b2ef2c72e41b7c6e1.1794391847.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794391847.git.manikandan.m@microchip.com>
References: <cover.1794391847.git.manikandan.m@microchip.com>
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
Content-Type: text/plain

When a SPI NOR flash is not populated or not reachable, spi_nor_scan()
fails and nothing described below the flash node (the SFDP NVMEM device,
its nvmem-layout, partitions) is ever registered. fw_devlink still holds
links from consumers of those nodes, so a consumer such as an Ethernet
MAC whose "nvmem-cells" points at the SFDP EUI-48 cell waits for its
supplier forever and is never probed:

  platform f8008000.ethernet: deferred probe pending: platform: wait for
  supplier /ahb/apb/spi@f0024000/flash@0/sfdp/nvmem-layout/mac-address

On a permanent spi_nor_scan() failure, call
fw_devlink_purge_absent_suppliers() on each child of the flash node. It
marks the nodes that never became devices with FWNODE_FLAG_NOT_DEVICE
and drops their consumer links, so the consumer is probed.

The consumer then probes, but of_nvmem_cell_get() still returns
-EPROBE_DEFER because nvmem_device_match() does not find a device for
the SFDP node. When fw_devlink has marked that node FWNODE_FLAG_NOT_DEVICE,
it will never become a device, so return -ENOENT instead. The consumer
can then fall back, e.g. macb uses a random MAC address.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 26 +++++++++++++++++++++++++-
 drivers/nvmem/core.c       | 13 ++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a034dce7c839..57faab89f5af 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/fwnode.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
@@ -3624,6 +3625,25 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
 }
 
+/**
+ * spi_nor_purge_absent_suppliers() - drop fw_devlink links below a missing
+ * flash
+ * @dev:	pointer to the flash 'struct device'
+ *
+ * When the flash cannot be probed (e.g. it is not populated or not
+ * reachable), nothing described below its node, such as the SFDP NVMEM
+ * device or the partitions, is ever registered. Mark those nodes as never
+ * becoming devices and drop their consumer links, so that consumers such as
+ * an Ethernet MAC using an NVMEM cell are not deferred forever.
+ */
+static void spi_nor_purge_absent_suppliers(struct device *dev)
+{
+	struct fwnode_handle *child;
+
+	device_for_each_child_node(dev, child)
+		fw_devlink_purge_absent_suppliers(child);
+}
+
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
@@ -3672,8 +3692,12 @@ static int spi_nor_probe(struct spi_mem *spimem)
 		flash_name = spi->modalias;
 
 	ret = spi_nor_scan(nor, flash_name, &hwcaps);
-	if (ret)
+	if (ret) {
+		/* A deferred probe (e.g. on the reset GPIO) may still succeed. */
+		if (ret != -EPROBE_DEFER)
+			spi_nor_purge_absent_suppliers(dev);
 		return ret;
+	}
 
 	spi_nor_debugfs_register(nor);
 
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 2e07f95de7ff..be3a05150085 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/fs.h>
+#include <linux/fwnode.h>
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kref.h>
@@ -1458,11 +1459,21 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	}
 
 	nvmem = nvmem_device_match(nvmem_np, device_match_of_node);
-	of_node_put(nvmem_np);
 	if (IS_ERR(nvmem)) {
+		/*
+		 * fw_devlink marks a node that will never become a device,
+		 * either because its parent failed to probe or because the
+		 * parent bound without registering it. Don't defer for it.
+		 */
+		if (PTR_ERR(nvmem) == -EPROBE_DEFER &&
+		    fwnode_test_flag(of_fwnode_handle(nvmem_np),
+				     FWNODE_FLAG_NOT_DEVICE))
+			nvmem = ERR_PTR(-ENOENT);
+		of_node_put(nvmem_np);
 		of_node_put(cell_np);
 		return ERR_CAST(nvmem);
 	}
+	of_node_put(nvmem_np);
 
 	ret = nvmem_layout_module_get_optional(nvmem);
 	if (ret) {
-- 
2.43.0

