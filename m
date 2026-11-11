Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367004;
	b=GKTPrwnJJzUbLPA294X9Sn36Ic9ymsvyj3B6DrKlwNj2vJ39MLlnVR2L2NEaty+5lhEz
	 9wJAfmup0KIQkRERdGWJQObeMMbSV65C7ob6KsO/GqRlbspITyvm0laFn+OXXaNPbewac
	 q2PTqlOt25CNyD9/VwdlorsojFxgLOah4UGHomNGfjBG0VDIVf2FqMaD4FckxGkl8Txhj
	 5S5WQPKdls38r8OfA7wvKIso9KIBNGyjLdPIxZk/uCFmIEA715wbDK6UU27Mvmkr1J0bx
	 AWH5Ho3uTyFTP74BRBbTVRyrOoSob1/XGk8SLDbQuMAR+QqvZl2RdddO4FPvwOcMvFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367004;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QFpGYDFuAve0mJDexc+jDpWWXx/HSO8P2PL6X/pDSEI=;
	b=HXYMEfYYUNNBO76AeUyyg0CljL8EaIMp2RK4/sN/xPgsdAjXfnDEMnxj/rSGmBPoBJKc
	 wNnKHLGMSanEtLHFQZtD4KGsulXTWrZQz7d5eS6tx17tmMqdqIw7TregkNQzbKUNyvDKK
	 MZgcXDuqtb+zFZXQ2cc8sZs8Rvbm5awH4MQXsqBpHaUzkav7hjlhw/t28R1aRmHpfZNum
	 /17wEqb732rI5C6dYxA7+3gQgegsXp0GDQkeKnGjq77HwxkRphq100nFbSGBYBhfxucxf
	 qs3b0NvOZmQOC3ihPRJJkpVX0WqNIBUzsriH35vJLrdShTGroTchduAne4upPp/kDUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF53606A331;
	Wed, 11 Nov 2026 03:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF53606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:32 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:32 +0800
Subject: [PATCH v2 4/9] i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA
 addressing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-4-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=2366;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=7ZpEhZCLKG0PKVq19jZjqW8c3T+nRcKqcvBoQPjHL+E=;
 b=7P761tJtEbJGJL1WEdKOYKsqMISd8ViZWMPlkRmnEpwu/lbtUOQXzPpLB55keyjd4IxymYKJY
 hsKbMEQeUtDDhp5VW4Zluve7FO7+RUBjH3q4Yr1nR/hMIBdjcxmxtUP
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
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 4 ++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b8f8254ed19c..25d0aba6b300 100644
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
@@ -1231,6 +1232,9 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
+	if (hci->quirks & HCI_QUIRK_DMA_64BIT)
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+
 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 2e610373600e..18a28360c728 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -179,6 +179,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
 #define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 #define HCI_QUIRK_DAT_INDEX_IS_ADDR	BIT(10)  /* DAT entries are indexed by device address */
+#define HCI_QUIRK_DMA_64BIT		BIT(11)  /* Controller DMA supports 64-bit addressing */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);

-- 
2.34.1

