Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367004;
	b=wNl7qMyt1camru5ibgaTYgPMgGUMKy7fLbIKVpFwkUGwrjr0ycRKSkz1WfSIIjVlxUUi
	 dYsKe3lMAAxpxlCW8wQyvsGacoXbjJv+H6OeTKrWqV6OhH5G0TCSO72MrbhKQLpQg/bHX
	 /J7dgFV06jrVQfRKt50nhDA4OxmNgWZwQ/0rjmgo/fqAC+hE+CgmnNstzXz7nLVTWxXn5
	 qYRMXBYGsfi+p+tN5D6ER1sjgaZ+7iXCDY9YYaPaEUmGOaD4M42yWD42PZTbSHmJbHj4F
	 aR3gfueRcdMG4NuW8JTPX4CijNd3arOEV5MbzEQTLvypsysVfayYmp9hH0mU/DTAKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367004;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YsJez8/6/UAAho31rhpZBuRlFrlIaf+pv4nkj8vhW7g=;
	b=mF2guxG/7Yksvz58Sw1V21VUsVEi/LPUDN7428wRujJ6VXcxfUrP0ZHk83P42UkAh42Y
	 lsvUXWhXlIrVDJJFM8wB5VEKObdHnv5wXGHdM1sfVPLo3FYCPK5bEsr2GHn/BIRNp+ue1
	 MkAie27RYjc8lwsMkVUmTWoyoyvanES2FoZ8yN5RumujKmwXtcdxqiBxgNk+Mh+o7IkJG
	 CF7jiywIz7jFz9UfcAIJ/fZrRUAaHHA8MKHSLLn3Mb9p3cJ1VGuXk2yUX2mxWjbbuM5kq
	 YWCvOQceWktvVZRL8G9A9c+lfJnROQfyLKYe8EbZirMlum/ucwDJff6XXdaXlv7li6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CAA60A2614;
	Wed, 11 Nov 2026 03:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CAA60A2614
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
Date: Wed, 11 Nov 2026 11:16:33 +0800
Subject: [PATCH v2 5/9] i3c: mipi-i3c-hci: Add a quirk to clear the TX
 start threshold
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
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-5-4d8fff5c5196@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=3959;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=TT6DVgROupJj3o1NofDpSO7UhBTyX4AHTZoi/iJQSlA=;
 b=Ai9LkrYBBUliNFI6XRcHiqNjuuOuxzu0ReD+CeYTqZcZPRadOkfpPA5WVlazABTdEQH5uCIOe
 95HgtWJm3REBMstuKUB5zKwf2uRcfR46y43Sggk/6MS3afRxcrd3rRu
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The DATA_TX_START_THLD field of the PIO data buffer threshold register
holds off the start of a TX transfer until the FIFO holds a set amount
of data, which in PIO mode cuts down on the number of software writes.
The field resets to 0x1, requiring at least (2 ^ 2) DWORDs (16 bytes)
in the FIFO before transmission starts.

HCI controllers that support both PIO and DMA can expose the two as
separate register blocks; nothing in the specification says selecting
DMA mode disables the PIO block's own gating logic. On ASPEED
platforms it doesn't: DATA_TX_START_THLD still holds up transfer
start regardless of which mode feeds the FIFO, and in DMA mode that
threshold is never satisfied for some transfer sizes:

 - 1-4 bytes: uses the Immediate Data Transfer Command.
 - 13+ bytes: since the hardware fetches data in 4-byte chunks, a
   13-byte transfer fetches 16 bytes into the FIFO and reaches the
   threshold.
 - 5-12 bytes: the threshold is never reached and the transfer stalls.

Add HCI_QUIRK_TX_START_THLD to clear the field whenever DMA mode is
selected. The clear lives in i3c_hci_set_io_mode() rather than in
probe so the reset-and-restore recovery path also reapplies it after
a controller soft reset.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 2 ++
 drivers/i3c/master/mipi-i3c-hci/pio.c  | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 25d0aba6b300..da77384e985c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -884,6 +884,14 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
 	else
 		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
 
+	/*
+	 * On the ASPEED AST2700 the TX start threshold gates transfer start
+	 * even in DMA mode. Clear it so DMA transfers are not held back
+	 * waiting for a PIO FIFO level that will never be reached.
+	 */
+	if (dma && (hci->quirks & HCI_QUIRK_TX_START_THLD) && hci->PIO_regs)
+		mipi_i3c_hci_pio_clr_tx_start_thld(hci);
+
 	if (!is_version_1_1_or_newer(hci))
 		return 0;
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 18a28360c728..3f28f821bf0d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -180,12 +180,14 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 #define HCI_QUIRK_DAT_INDEX_IS_ADDR	BIT(10)  /* DAT entries are indexed by device address */
 #define HCI_QUIRK_DMA_64BIT		BIT(11)  /* Controller DMA supports 64-bit addressing */
+#define HCI_QUIRK_TX_START_THLD		BIT(12)  /* Clear TX start threshold in DMA mode */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_abort(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
+void mipi_i3c_hci_pio_clr_tx_start_thld(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 439578a6eb54..a95ef7fc351c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -118,6 +118,13 @@
 					 STAT_LATENCY_ERRORS | \
 					 STAT_PROG_ERRORS)
 
+void mipi_i3c_hci_pio_clr_tx_start_thld(struct i3c_hci *hci)
+{
+	u32 val = pio_reg_read(DATA_BUFFER_THLD_CTRL);
+
+	pio_reg_write(DATA_BUFFER_THLD_CTRL, val & ~DATA_TX_START_THLD);
+}
+
 struct hci_pio_dev_ibi_data {
 	struct i3c_generic_ibi_pool *pool;
 	unsigned int max_len;

-- 
2.34.1

