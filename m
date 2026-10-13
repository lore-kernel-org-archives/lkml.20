Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5851DB15
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909289; cv=none; b=D68Hwnqv2ceFDBKHGqqKylnQvx0S0OwRsUmXgIJ2nusXiGjcXW9ZZ4jlhAFXam1aC1MU/0kUqr3jk1lDAMxoTfiQGVEWx69KwE7vcBVrodmKQodgqsknFsJ5csp/L7eYQaH69exl7Nj66Pvj+5nCH4I/pGuQCrijXK8R2STJS0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909289; c=relaxed/simple;
	bh=3eKE/weKYK0hZCM8VMUWGBEWOlJ9RUr7TALMWA7SMsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N6eUcE1CKnkK20p4DppmpiAW6D4IOR2A3+56QAoX7S2e6s2PtkMTLT4hW46uHQuZUHoJnV1Aw/+4mTgS05i+jYnWeEFxWtlQTkUH/QCEKJVEA0RPXyuN2ZgW3eF7H90BcOX7NJ72xu5yruEtwSqszWoWIj+1DyQCXW/8z5s6cf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NwTPnb1y; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NwTPnb1y"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C13EB1A121A;
	Tue, 13 Oct 2026 16:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FD3060362;
	Tue, 13 Oct 2026 16:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE31711D71811;
	Tue, 13 Oct 2026 18:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+GgPuz0YdNsBR/myCURF0hQWe66/L4vrv2i9zi9lDVI=;
	b=NwTPnb1yLc/+fK+cLp2lTxgVPx8+RXEyadr6RTM/km/O/ljp6rsc9pjFmy1znk9QMAM18t
	MV2WngDrOtS+cOVTI6WifHq87xZ0fG2ri3sTR1KBz4e+ZB7C4trd6ztlKZgv5RxHyoVuGH
	GRYg4I777XnmX1Jhb3Is3IZE613FxGCealV6RhLv4Hggh/STnqsQpYv682b3APdPMy1CdW
	J+rFsYN1QRaDOf/qv96ElXW7THDHQrny4m5+e2bM7XN9quhss1SPsozuXsuSI1Hhq637Mt
	1x9rS7zzqUzRA9KbHN/Uls6HLX+Q6XMkiTKpb+M9kS3A4jVTS1dHpFtud233fQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:58 +0200
Subject: [PATCH v3 08/17] mtd: spi-nor: Fix WRSR with ODTR chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-8-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The ODTR interface requires an even number of bytes in each section of
the operation. spi_nor_spimem_setup_op() takes care of the opcode phase,
but we have to adapt the rest of the operation ourself.

Inspiration comes from the spi_nor_read_sr_ll() helper which faces a
similar case.

Make sure we don't face the sr1_and_sr2 case, which does not exist with
ODTR devices (this is a legacy behaviour on certain quad capable chips).

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bc11c8cbb234..8e55f12161d1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -778,7 +778,8 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 {
 	int ret, i;
 
-	if (len > 2)
+	/* There is no sr1_and_sr2 in ODTR mode: this is a quad-only corner case */
+	if (len > 2  || (nor->reg_proto == SNOR_PROTO_8_8_8_DTR && len > 1))
 		return -EINVAL;
 
 	ret = spi_nor_write_enable(nor);
@@ -791,6 +792,14 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_WRSR_OP(opcode,
 						       nor->bouncebuf, len);
+		/*
+		 * We don't want to write only one byte in DTR mode, so
+		 * duplicate the buffer and write 2.
+		 */
+		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+			op.data.nbytes = 2;
+			nor->bouncebuf[1] = nor->bouncebuf[0];
+		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 

-- 
2.55.0

