Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F723F1066
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149510; cv=none; b=PaBdVajd85B02J6kHZw5K9CpqIGmRxRLhq++EqQogieWRK1/SWMOSC/vGukE0WVmgoE8ZHEbjY3mRoe1pt5+e9zEW8A/2BRQ45bqwH9W8vPtKWIIUcl55oRwRYYTjGYzsIhXCJN9cDzZMBoJXdNC40W2tPfXgl+xfeBJj3pzTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149510; c=relaxed/simple;
	bh=qSJAPdOkOuppuVc6pDyM3wTBSiX7NSGWjShV29p28PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5OMKN+R8dZJ+T9dzVEd51B8HutamzU060jnyj/OcFhPAfkQ+SVDX0qbfJGIPc7x9v/o5emI8RPHDwxPThbQv4g2GGWVj+7KB24GFAFHT9PNMH6QYFsch/COtd70LWe7yiaL5l24MpMWY73riNF4YnjyZIsu0pGQ6fdqfNfNESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JRlBRsTF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JRlBRsTF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F41FF4E4116B;
	Sun,  4 Oct 2026 21:31:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C87C9604FE;
	Sun,  4 Oct 2026 21:31:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A3C8103284F3;
	Sun,  4 Oct 2026 23:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+2pH0Z17Ub41pMWE4R8R4Z0EeQ0P/zy8pfaxz32ykdg=;
	b=JRlBRsTFgUldBxDm5UNb3SWM9p0XWIJ2qyAv1lc9L4wovvYh/C2pejUxp0phIXjzqxbmss
	73IAifAgfG82z468Huo5xhILGIk+EzycOb+MRZQ8e5mKF6t+V8StoAxc0+yQjii1nZHiZg
	L6KTP6BrfEmW8bpsjbcSgfBjPCpqFaUc52EuiQW14XTDxheboB4v6zNFpPxuI9h5E7rPsZ
	DOy/wfF5B0VapszMwghijfRWJ/2gAR8xhKEasCyFoI3h1Uq4v/1k+7lLMBDADKxObqo0G/
	NzGRlNISQfebc3EKIfqaB8x8qGTKhkTre4s6wwrwMa6IQk9nWpseY/13mdahCg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:21 +0200
Subject: [PATCH v2 07/17] mtd: spi-nor: Fix WRSR with ODTR chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-7-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
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

