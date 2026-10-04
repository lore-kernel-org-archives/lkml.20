Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805C4156CE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149505; cv=none; b=ubCvB9CE4bCTy9BQvu12EbnVoFjo4EqkheurJXhQvzsN8fFYwCC5LN74UDB5rPJf5QTmvTvwVFL3rELcETPiWuy4TLQ//0MlexKrSkGYwAiA840IRbV0l58U0RItbccKEMJGAluSk9V//SfEEzMO4Z0KUQpXuvrQOKOv7qbG6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149505; c=relaxed/simple;
	bh=ks1s9uCqto7Lqve/BjLdcGtkzfISPmYXHcTZS0ODYlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KasBSudvymLEO4V1MUGecGHAom81yQtDrbVB/14D8eSQ8knL1p5pGFW3YJRVbkmJuGcmdi+Cnk39KlOY3KapnIKL1SDgmLCiUPTG5T/vDPFcBFnA8SuZY7Rc4CYLhM1feJPu0iVNOYX3yePN8J7xNjgm+3Flk2LwR8Kmk5Yxbbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fCDgzRr9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fCDgzRr9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A21B04E41169;
	Sun,  4 Oct 2026 21:31:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7680B604FE;
	Sun,  4 Oct 2026 21:31:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6E7710328444;
	Sun,  4 Oct 2026 23:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149501; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKU3bfFA3TBWByBniXLhckIqiCwee1j7ncswMHgAQeQ=;
	b=fCDgzRr9gStZPWsPjk/3pJYhBwQg5FDIirJYQs4cn+EedsyYpuKTazvcM7TxCeOkr9SjVG
	y9nWfpE5ScCiKugjzjnYH/xpJWENsRpOPKM6pq0PbBzdeWmEBxW+z1jXa4UfkTrlg7m/ng
	4aYHQ0sdt6hrm1DJy4EePolqyE7b1DU9KNTJqiHJ4lD7oNktEuCuTGCOmTmyLldTJhSAYP
	FZeBrPVfTb9LVwfMOwubbY29sBcWVANzUNd1nOlzpVo6MXjE46G2+6kjoRtzkbKrdKgKpZ
	4IYvCldHdwgE6QId7pxYkgGt6WLeLVP3HvTBibbQn76jgqV0bp/R9Mu488fqcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:19 +0200
Subject: [PATCH v2 05/17] mtd: spi-nor: sfdp: Enhance a comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-5-592f3300a70f@bootlin.com>
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

While working in spi_nor_parse_sccr_mc(), the actual meaning of the
comment was not obvious to me. Not sure my proposal greatly improves it,
but at a first glane it feels clearer to me.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..9d5c0bbb53ae 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1417,8 +1417,8 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, sccr_mc_header->length);
 
 	/*
-	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
-	 * additional die. Hence, length = 2 * (number of additional dice).
+	 * There is a pair of DWORDs (volatile and non-volatile register offsets)
+	 * per additional die. Hence, length = 2 * (number of additional dice).
 	 */
 	n_dice = 1 + sccr_mc_header->length / 2;
 

-- 
2.55.0

