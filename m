Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493890;
	b=YqaLW6kBzaIP0gbz3YBzD7s24SUi68om0zJuI09G5+L1yMzepZglBbvGXgb8GngVHbuP
	 UuFsU0wwUU6WzV7cZhfAgdSrR2gMUSTIJjHBxCGs0ZpKMjAdULpjfiGfn3rdNl1T8v508
	 BUpVZ35GBoafGu5/DyiXe6/JQ7mp/6n8iEX/H6pOOfwH9bKdOvSudJrjY+11wj1d8u4hh
	 Cq+RBl0MMBnDPg/gBEMl7E96+O7x36R1CJBL3zdV2N/GtNHcIg3hksIL8J4ylVvNRAyuI
	 lAAzX+PM4rqL3Sz63ujZL2jtdmhuc5Mr3XNpZY2WZkA+w0NU+TdI67iqQRDBYquNzqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493890;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=zu5B4S0lovcQqT/hWGdiWSTz3HzO1JMOVGp9bq353iw=;
	b=P530R646yioI7MmNaIK/GVlLudYYQHFW5X3WA/083s1X6b41KxWLFrCoi8nPGV1kVKv6
	 liYMQFgef/clUgSrshP3EH+4MmrBano+mDmts0WBgYTJKvUcgooOPcpYSPCKO144UviNU
	 tjGIxj5iTeEFrhj355+nBblu+cltURC5B6wHPVj/hqaWnSbYDuqPXSvjzBpjiBSsJFHhv
	 xq1Wet3lr4XCJJFFEmbVypq5AfIu6ydRUbSwqIswUsZeWhZoA9FX+YTigIAfmCLMKK1Dl
	 wZBaIQvNgudUX9IrY6f4UuoRNwA7QwXzY8Xq5CvoxxTZowYQl/9QBaYUuthL+KQPg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eKIZFDfu;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871EB60A382B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871EB60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eKIZFDfu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3AFC81A1629;
	Thu, 12 Nov 2026 14:31:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 081215FF85;
	Thu, 12 Nov 2026 14:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D63EF11BC07CF;
	Thu, 12 Nov 2026 15:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794493883; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zu5B4S0lovcQqT/hWGdiWSTz3HzO1JMOVGp9bq353iw=;
	b=eKIZFDfuUFiTZLvcmWgWMQDXXHlJ88oUKkqEatAdGAaJJcJTE8UX54wLYIKMe+C0GeF8WM
	CK1t6EQ11CJOHQy8dzI9bF0/4KLbvLwREfFBLyxsR0hnrQWkDEbToNdOlMiJ1kqOpdhSF1
	rmWIz6KK8zZrw/aqQR4KdWUPuQiyTrJeRuVIKZPnfYiu5BncjQhZP2MsnLltYpPmaj5Ycy
	CFNAyftCeKGEuwrVTDIFs2wQY6aCEAhe7vqseCfzT5IMRZDQGjZD8/6OD+XXv/w8ea0Yq4
	X/MBu/uQiniKl21bK2oLDIXldrtu6tCur1+AJDpgHIvPGct6cYCdbZ02qxInUQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	George Cherian <gcherian@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 4/6] spi: cadence-xspi: Drop useless cdns_xspi->cur_cs
Date: Thu, 12 Nov 2026 15:30:48 +0100
Message-ID: <20261112143050.53347-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112143050.53347-1-paul.cercueil@bootlin.com>
References: <20261112143050.53347-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Tanmay Jagdale <tanmay@marvell.com>

Make the code simpler by just passing down a 'cs' variable as argument
to the cdns_xspi_send_stig_command() function.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v2-v3: No change
---
 drivers/spi/spi-cadence-xspi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 189f87321777..f4ce4820b08f 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -331,7 +331,6 @@ struct cdns_xspi_dev {
 	void __iomem *xferbase;
 
 	int irq;
-	int cur_cs;
 	unsigned int sdmasize;
 	unsigned int sdma_xfer_len;
 
@@ -543,7 +542,7 @@ static int cdns_xspi_sdma_handle(struct cdns_xspi_dev *cdns_xspi)
 
 static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
 				       const struct spi_mem_op *op,
-				       bool data_phase)
+				       int cs, bool data_phase)
 {
 	u32 cmd_regs[6];
 	u32 cmd_status;
@@ -566,8 +565,7 @@ static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
 	} else {
 		cmd_regs[3] = CDNS_XSPI_CMD_FLD_P1_INSTR_CMD_3(op, 0);
 	}
-	cmd_regs[4] = CDNS_XSPI_CMD_FLD_P1_INSTR_CMD_4(op,
-						       cdns_xspi->cur_cs);
+	cmd_regs[4] = CDNS_XSPI_CMD_FLD_P1_INSTR_CMD_4(op, cs);
 
 	cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
 
@@ -576,8 +574,7 @@ static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
 		cmd_regs[1] = CDNS_XSPI_CMD_FLD_DSEQ_CMD_1(op);
 		cmd_regs[2] = CDNS_XSPI_CMD_FLD_DSEQ_CMD_2(op);
 		cmd_regs[3] = CDNS_XSPI_CMD_FLD_DSEQ_CMD_3(op, dummybytes);
-		cmd_regs[4] = CDNS_XSPI_CMD_FLD_DSEQ_CMD_4(op,
-							   cdns_xspi->cur_cs);
+		cmd_regs[4] = CDNS_XSPI_CMD_FLD_DSEQ_CMD_4(op, cs);
 
 		cdns_xspi->in_buffer = op->data.buf.in;
 		cdns_xspi->out_buffer = op->data.buf.out;
@@ -612,11 +609,9 @@ static int cdns_xspi_mem_op(struct cdns_xspi_dev *cdns_xspi,
 			    const struct spi_mem_op *op)
 {
 	enum spi_mem_data_dir dir = op->data.dir;
+	int cs = spi_get_chipselect(mem->spi, 0);
 
-	if (cdns_xspi->cur_cs != spi_get_chipselect(mem->spi, 0))
-		cdns_xspi->cur_cs = spi_get_chipselect(mem->spi, 0);
-
-	return cdns_xspi_send_stig_command(cdns_xspi, op,
+	return cdns_xspi_send_stig_command(cdns_xspi, op, cs,
 					   (dir != SPI_MEM_NO_DATA));
 }
 
@@ -1272,7 +1267,6 @@ static int cdns_xspi_probe(struct platform_device *pdev)
 	cdns_xspi->pdev = pdev;
 	cdns_xspi->host = host;
 	cdns_xspi->dev = &pdev->dev;
-	cdns_xspi->cur_cs = 0;
 
 	init_completion(&cdns_xspi->cmd_complete);
 	init_completion(&cdns_xspi->auto_cmd_complete);
-- 
2.47.3

