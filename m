Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486BA3AF65C;
	Tue,  1 Sep 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262858; cv=none; b=qSForSA3GXn5pouPupbG+tmHt7oFj1VteiHGnB6P7nn1/pPJILZ5Xg2S6Qa5O1JMV4cXI85wCssByHYk0CGJqAjvXte0XBKszeCex/BGkBYZajcsGuW5EsdTpNtzqqn1JhitVFXO73vw8jlwk+rGAG792o105vSR7c42CQxIFv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262858; c=relaxed/simple;
	bh=w8DwWiTyjCgKHUh3jNegniNOD5FFOdIu9HTX8Den63I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fwTZM/CHUyxM29ax3+pWfbxKNJq/2Ws3L5qhjfpqPxA40NT5rbnTwqLCTR5gs18cJ0EZvTpm7Xd3HMYxV4iYv3Za1jh5OslZFN4B0+8r4bdDzjckGYabo/BWw1wAHhZCcFDdQlrlIHzSoM5xyui4UDXuxY/B1TRO2Qx53xoCpwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Sep
 2026 19:35:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 1 Sep 2026 19:35:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 1 Sep 2026 19:35:30 +0800
Subject: [PATCH 3/8] i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA
 addressing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-b4-i3c-hci-ast2700-v1-3-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788262538; l=2535;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=w8DwWiTyjCgKHUh3jNegniNOD5FFOdIu9HTX8Den63I=;
 b=zakcGFU95zIF9c596EWGOrqXlXM4wUfpzGev03srlA/CbJygcFlzgNMnkc2Q3kd0uBFwf9HFP
 5576jPxF/gFAjNsiAAYqwNub4CH4bWgjn3W7UY6ik5cId2GXEvjb1vU
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The HCI ring base registers are 64 bits wide by specification, but not
every implementation wires the upper half, so the driver leaves the
platform device at the default 32-bit DMA mask unless told otherwise.
ASPEED platforms place all of DRAM above the 32-bit boundary
(0x4_00000000), so under the default mask every dma_alloc_coherent()
call for the DMA rings fails.

Add HCI_QUIRK_DMA_64BIT for controllers whose DMA engine drives the
full address width, and declare a 64-bit streaming and coherent DMA
mask for them before the rings are allocated.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Assisted-by: Claude:claude-fable-5
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 +++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a624e3c40484..c03c3a9cbe4f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/interrupt.h>
@@ -1167,6 +1168,12 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
+	if (hci->quirks & HCI_QUIRK_DMA_64BIT) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "cannot set DMA mask\n");
+	}
 
 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
 	if (ret < 0)
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f50fc1e22a85..2110f806a53c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -178,6 +178,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
 #define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 #define HCI_QUIRK_DAT_INDEX_IS_ADDR	BIT(10)  /* DAT entries are indexed by device address */
+#define HCI_QUIRK_DMA_64BIT		BIT(11)  /* Controller DMA supports 64-bit addressing */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);

-- 
2.34.1

