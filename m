Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393363;
	b=dDWLn86TS1S0eC/ZFzZWrQRd0F0wdOWZDQTP6sHsvUkUR9ihxtJYO2/kS2wle2sK4/9e
	 NlWrtdOzVrgR2lQpiFsSZsEzfF0AjhJfOFWjE0h5kebGtr7jirL9iQAFFofexuwOwhp4F
	 N9PETDhnWpLKu80S3+5gRpuymmtHkNRY+5ZTHgA83pnBBEEpFmPHpHe3c6w0EdWBdrHyh
	 C1tSI5WBtrYiFt2QJheLrzfVHEXIS7w2bTAAszk06wfGkRWzNDbb5/GUKbed8oj1ybSQv
	 hlCfQvWJ6nRFQovxkhVChJuEUIsS0gm83SWC8YDUGxtFg8EkZ93+DyFIhSH1FIRei1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393363;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=l2hpXxfdL/TeBJ0+DqklJDpQyDRLnORte7BddmR/USU=;
	b=1oJS4LA1ybYJAkuTvoE7wMHLHcf/1WpTIQ8HsHxJ+N2fKiGTNnkph7lL2M5mUOoy3379
	 VZxw8hkLHI2f4ltGjR1uVkhE4GMkW4zOJ6fRA/uOYT7+CZhuhhZ+6U3BEmNFE6DpXZlAq
	 0+8rYpFW35JTfogfnYboSixOYVeF8qHQhAqrotcAJPvBNW6eRPQfjmTFiIKpNL8fnnPBe
	 D0u8AT7Bru7GqLYGzKQSQvME/Mpi8HqpGZN6aOLfXflf0AFKHns8Y8LRoBdX2zZ05KTk0
	 wBaQyJDLqxkpjiXb0JmJpwXAQvIwryJY2c86Rs4gPH6ECF1omOlP1h95VUoq/smujzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=L4M36k8m;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25EC606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25EC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=L4M36k8m
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 828E24E41574;
	Wed, 11 Nov 2026 10:36:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 594F66017E;
	Wed, 11 Nov 2026 10:36:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EA4B11BC10EE;
	Wed, 11 Nov 2026 11:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794393360; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=l2hpXxfdL/TeBJ0+DqklJDpQyDRLnORte7BddmR/USU=;
	b=L4M36k8m6L4c46bf1U4xJPTefezTrGIY17KqYgyjugcJnHRvVO8WZELE9kaoEkWMc1mSTT
	VPj+p2GW4OtYnQF68bfmgc3qNIPl82fsTJtPhTAVbAJ+l68FV/iB4DvUxNMlSKc0Mj3CsU
	ntba4lPKwA/K3G10welYmOsZXzBiiRmXmLD3ZXUAZ72nyHYliUH0YkVFzSqZ1e1lGapr8b
	p62lZE8yX+dCcRzbOgYd5zXVEdQuvdm9YiUXQ4WRlQsrqsDbXvZecEY3sFdGKYp+5n6xbd
	ddlXHM9QalYKw7avRbaYw04tXmG6udzZs8XMcQBfiMvlL2k3unFRueo03cm1dg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 4/6] spi: cadence-xspi: Drop useless cdns_xspi->cur_cs
Date: Wed, 11 Nov 2026 11:35:39 +0100
Message-ID: <20261111103541.100848-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111103541.100848-1-paul.cercueil@bootlin.com>
References: <20261111103541.100848-1-paul.cercueil@bootlin.com>
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

v2: No change
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

