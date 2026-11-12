Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493876;
	b=UiAwJdcQ+JXhf4ujieBR6hy/n97PtRbJZq7EBgOC7I7aqVQK9p3YTcDSAmSVTAc7x5/2
	 YtLRAckO0ALDdgIMiOkPTJ4TYLjGG/FO+HGd1aQvClPMVTVLwQiElpHHcAzpSPTfnp4/o
	 j5RJdAb9uTp4KiUHeQbYpofARlwXXB5AM/3UZnB2CjNQSYWVZ/0CwHiiSxox+0yOlXkht
	 0nWU5KT/zVGGNfGYQBFJrRB6CYhWwy0K1b1GGrJJOm0BbNAgT8hDF1IIpHmJzrPikPiIC
	 /tksuEb+ISHd5lV2wnog0ylVbq2WrTgxjC/G05WxJk8CnboXvCju//E5Lbe0ynBopXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493876;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=+SXZLcvGD5dDIxm01jU+XYU++Y1nw8JzeylBsPqU9Ok=;
	b=lgCHQiZPArFA2KjKqsljsgHhyNtbLQXsesfaTKSaeKCpqEgFsmCLZ+1zcR7nuAWcRVYx
	 h222nK91EEICB0kT2md5fZvJwaTa9/9Fqiu2BM8rGrO/lzbr7qTe13us2cwZxQVUo7mnS
	 VZFlTNQnF489J7Ed2C37PViAs3Ijl+odB8Eub4mJU/5z4g8ANjl7+TxHuyh1oezuhf6BU
	 /7uIUjcrjC4baskFVn41xdwvslLPCjb7PJXrutsdoz57eJUxVY/T/QWPAgtEUHYBAHBCn
	 GbO76zp+oi47Zw8TZeZ5M3kM95DiU7SopNe3JFAb2mW27tyYkyjn+rkooHZaVC0fzbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GR22lAwk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B423A606A8B5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B423A606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GR22lAwk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C83A4E41591;
	Thu, 12 Nov 2026 14:31:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D64185FF85;
	Thu, 12 Nov 2026 14:31:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E60311BC076B;
	Thu, 12 Nov 2026 15:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794493872; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+SXZLcvGD5dDIxm01jU+XYU++Y1nw8JzeylBsPqU9Ok=;
	b=GR22lAwkuuQIX7K70Oi7dKnDvYWBWCO8dzQonGYOjBeWfDjCJ0dRol7mtkoPvrPkUWUJJ0
	VwRgGqHi9a7lJk6AM3mLJfDDZ2LLEH6Ijy07hoe+jvciUfpAjYq8Jcamyj10uCeSZCdsZS
	DG/cbE3Ix2Lnns+PPTo6HS+g9rXt3BT1loImhZ9envrkMv0xzrhUlLVYJI2MAn5T+FQZcd
	YyfheaqencGZtpoDK1P2cKb2EV6GgZrjZhU+IITHdr5KQRimYMf1uvfIjXq26BFua+SdpO
	qfooileOXmyx1bNv4M7LnO3KGeOaWL4rQhWe5Y0sb6T5BfbgsQHS6OKaRYhahQ==
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
	stable@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 1/6] spi: cadence-xspi: Properly handle errors in .transfer_one_message
Date: Thu, 12 Nov 2026 15:30:45 +0100
Message-ID: <20261112143050.53347-2-paul.cercueil@bootlin.com>
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

The cdns_xspi_transfer_one_message_b0() function was not setting
m->status on error, causing it to be stuck at -EINPROGRESS, confusing
the SPI core.

Fixes: 931e389ded0f ("spi: cadence: Add Marvell xfer operation support")
Cc: stable@vger.kernel.org
Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v2: New patch

v3: No change
---
 drivers/spi/spi-cadence-xspi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 3687853e4ce4..a584a3c395d0 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -1112,6 +1112,7 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 	int current_transfer_len;
 	int cs = spi_get_chipselect(spi, 0);
 	int cs_change = 0;
+	int ret = -EIO;
 
 	/* Enable xfer state machine */
 	if (!cdns_xspi->xfer_in_progress) {
@@ -1152,7 +1153,7 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 							  false, cmd_regs);
 				cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
 				if (!cdns_xspi_is_stig_ready(cdns_xspi, true))
-					return -EIO;
+					goto out;
 			} else {
 				cdns_xspi_prepare_generic(cs, txd, 1, true, cmd_regs);
 				cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
@@ -1161,11 +1162,11 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 				cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
 				cdns_xspi->sdma_xfer_len = current_transfer_len - 1;
 				if (!cdns_xspi_is_sdma_ready(cdns_xspi, true))
-					return -EIO;
+					goto out;
 				if (cdns_xspi->sdma_handler(cdns_xspi))
-					return -EIO;
+					goto out;
 				if (!cdns_xspi_is_stig_ready(cdns_xspi, true))
-					return -EIO;
+					goto out;
 
 				if (rxd)
 					cdns_xspi->in_buffer += current_transfer_len;
@@ -1202,10 +1203,15 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 		cdns_xspi->xfer_in_progress = false;
 	}
 
-	m->status = 0;
+	ret = 0;
+
+out:
+	if (m->status == -EINPROGRESS)
+		m->status = ret;
+
 	spi_finalize_current_message(controller);
 
-	return 0;
+	return ret;
 }
 #endif
 
-- 
2.47.3

