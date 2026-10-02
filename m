Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ECF316905
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943704; cv=none; b=nfF+if1fw6TYblGLej2J/AMFQNA3w8S8kdh6zd86LRGUfMaLoeaUMalhfF5NEUbng3EtqL3xFdbpbT5p/2ENTDLVM3uxigStpbUhIpcRbZlDSc0+VxkD8zvXlHB6Jy2bSgPuqfmB72g1epOqhZNIKF2YQ/E5MatSmdZLI8p8ps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943704; c=relaxed/simple;
	bh=qSJAPdOkOuppuVc6pDyM3wTBSiX7NSGWjShV29p28PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUr32FPktB6WlZX5MS8ZwXkbXCt60/sBlNL6Jj7Q6EYSM2Uwq6TOpPbr66MBCbKAllMePDut4Eb1/Ex1O+XFPRAJUM3gcetVQwAOZF3HrcCen6wjvmYY7HHQfM+sgplxVsqDpP4aoZ7P2iKbDdPWVeEmy//R98mWva3Cpmy/kFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EwbizyCm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EwbizyCm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E80924E41110;
	Fri,  2 Oct 2026 12:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7E3E603DC;
	Fri,  2 Oct 2026 12:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0462103281F4;
	Fri,  2 Oct 2026 14:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+2pH0Z17Ub41pMWE4R8R4Z0EeQ0P/zy8pfaxz32ykdg=;
	b=EwbizyCmlOqkJoU8IePStuE+wdUZCplb8VZbR9wj2UpE+Ny5J9onfyUWYA3CUnhopHCjrx
	2yxfzzb4C9H4D8XeGXaLK72U5vUyQXGNzCeXmhEcL/dUe++fo/r4HJQyoHPcRrlJk0zyom
	TtyCFC8JQSZ49ROX7JuJBb0lFkWPtl5b7tR4Hc2o2l9la8XRFymNe2sZxbSxPqoZgr9Egd
	+2FkS7ktdFIvxq9DY10mpvTUWpwMU4U+OtlrWyL34S606WQdQt7L9EGYAaiJZJJnsQFctr
	49DwPNTvdoMd4Az1L1FAHjqdwyVzgNFKWwNA9U5eG2vrzgy2NMtfPdcoDUCJjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:19 +0200
Subject: [PATCH 06/15] mtd: spi-nor: Fix WRSR with ODTR chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
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

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2bbec3feda39..6e22342361c3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -791,6 +791,17 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_WRSR_OP(opcode,
 						       nor->bouncebuf, len);
+		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+			if (len != 1)
+				return -EOPNOTSUPP;
+
+			/*
+			 * We don't want to write only one byte in DTR mode. So,
+			 * duplicate the buffer and write 2.
+			 */
+			op.data.nbytes = 2;
+			nor->bouncebuf[1] = nor->bouncebuf[0];
+		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 

-- 
2.55.0

