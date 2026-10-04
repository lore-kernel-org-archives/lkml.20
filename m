Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892A478865
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149503; cv=none; b=IgBrmJwlUHBwe6g2KziI0BS+hO8PiX0SYFkjeZ7MbK+FW+nH6cwMhM//m8HOL39mYM/UAoTkcVlvge5tC2jKW5q+vRWAAsyZVi2OMBqahyKhS2nKMspGyHnYq+P1kfPk9St+widQ8b+u2W4OMpMDvjohAEHGd4sT8hVnL6uAOBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149503; c=relaxed/simple;
	bh=gY/RLdCXN0j3cIaYxdQtTQefvP+o8DVmELIy6OZC+60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyePmja2FOT4CREHXOBHq2aBSa9jtQqCUeAj7lVu50lYsk+tb17Zfzu353fr1f2rvM9KnlQqfgFfeUM8gf1Sd6S2+acSj8m5wVmXqiB0zqT27JqlH1GsRMlXwKAlOjRH/UVLSYg1eUf/NC/vdEtQdubtBqzUELy8/GrUbx0dDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1gpn/J9q; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1gpn/J9q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F40BF1A113A;
	Sun,  4 Oct 2026 21:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C87C0604FE;
	Sun,  4 Oct 2026 21:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F48610328492;
	Sun,  4 Oct 2026 23:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ear8Ahh2j2AUiHu3vy3cVps1i5/MTD54IMpodJAajE0=;
	b=1gpn/J9qPSBCK7X/5gmL6+kKQo60dhjU1+rlT8AL7f4fKfZdlMabeTXi4bCNQ/OtOfeKr4
	icD5W9Lg3xRBJE/7MaOT+lqLG7FfZ8+sCS4QFYnAXzFHgNY5eAZbUJjY51DylrN4WA/uW1
	z7Z8fxAPzCH8b/15ggxA+Rpkdxg1fXK4Q4RE/kSjBDm33Kgp4NHGorz+QeUr4nC6nkQDgL
	PIevmOff2ZHTnlSuPBndtfL4IByAAL2LnBxkJ/gNf/zwWWlMiJl+QFIKHIk6d9qoa4ZgI4
	ItGPOtKW3igQOdaYqei+11nOLUjXXHgv+irkcsR2gZlHLLnlJwiTJiaSCvy9bA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:18 +0200
Subject: [PATCH v2 04/17] mtd: spi-nor: Fix comment indentation to clarify
 the intent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-4-592f3300a70f@bootlin.com>
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

The comment is misaligned with the content it describes and this kind of
bothered me when I first read that code. Move it to the correct
indentation level for the sake of clarity.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4b9e0410f2f5..2bbec3feda39 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2459,7 +2459,8 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 		 */
 		if (!erase && tested_erase->size)
 			erase = tested_erase;
-			/* keep iterating to find the wanted_size */
+
+		/* keep iterating to find the wanted_size */
 	}
 
 	if (!erase)

-- 
2.55.0

