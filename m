Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F05111B2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909280; cv=none; b=XQLqm4hWnbHiX703NFALfxFCSEEvYRcC6rrHLJ12bp7QPbEd//YlHp1uvQwnN33rClS1aMxTc2IuaGQpSchao0C3aJ39uEkhL+r10B1oWkYYZr7rkhXYhXyT+DfQ8ChOu0gp/SBO4hH5Z1iD4ssiebK9nw19/dsPAOCMjOUZh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909280; c=relaxed/simple;
	bh=fztX0WZeE8mFS148QRpdBMYp/aS421RjFwxd2+o+52M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gc3XJEsh/xe5g3MuwS/GfG7hrw4hfFk2YID2fDduOORLM1AYecTEm9KN3t9asFFqYzz9Z+Ex2hccLzArkv5FSWvs5rLkwLj2/uIKnHj5jMQJsoOOV/s7zZlaSYV6tWAmMKNiAKRSCriKlRUWU/Xce6irj2QB0JH6tWL5hzRZu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FYAL9Ftv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FYAL9Ftv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 318201A1216;
	Tue, 13 Oct 2026 16:34:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0069560362;
	Tue, 13 Oct 2026 16:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F31611D7180C;
	Tue, 13 Oct 2026 18:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rH+xtaEE72c/dMWl13TrWCqgtJCjAS6ZGNblkbLQAU=;
	b=FYAL9FtvXVAnibUXGPptNV1yQxRNmOeHHxs+yr3QPcKuL8/D5V4jHaRvmXzWUkAXPuR/+q
	TdVq/Sui6GUDp+kFtgpalF7WzJ9RLBj9dVK0e7sRu7eTZ/w2EFQUF5HuO/i2PCpj21Chol
	DSyJWKwVsBlkwZLPiAuGMsb61hcHUNE4QFw0ygfHxkT1RDAXms08DmsyZ11YUPq4bckGUd
	EUBlcyzwI4J2BjcJH8ZCG2Ub3OoXWSH6r+6HhBhsxiNRAUBcIny3we151xHf9HzKTMnDCW
	jmmgCN2tHoYBTb9RhNfSSRethozrh9V7DvBaU22f+woEbELBuYeGHIM0mNvOuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:53 +0200
Subject: [PATCH v3 03/17] mtd: spi-nor: Fix spacing between arguments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-3-6dde1d513df8@bootlin.com>
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

A spurious tab got inserted there.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9c61ff4b93c3..4b9e0410f2f5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -773,7 +773,7 @@ int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode,	const u8 *sr,
+static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 			       unsigned int len)
 {
 	int ret, i;

-- 
2.55.0

