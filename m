Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79584AA1CD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149551; cv=none; b=CifitHpQkoPTUATk+Qeac43clSsA3iZFam4rI0trIpmSpAKiV0wlGkKcBmrXRm+jdbQiKwuJfRAy8byl7buXWGJjQRqLKjvLN9dcxuVEFcveNSctl7yeVoT7ekfOdI8VnSptSQxvfShwbdn3QCki0miHP+Ti5fDERS47lURrpNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149551; c=relaxed/simple;
	bh=hgAFdyBnNWu94Bags/IDMaztaz33mQkg0UprSHL4XEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6E85DtSUgvWZfVVa19VnsPaNUFd26LFGUEV4ygwucyPW7c0u4Z4PBnrudJgHR7qa0M/PPtBEUmaUS6puqi5QmK3kex5FnStG45tt5R/7TWryY6CO7q/z3TYSfrXSVtroWswAl4vixDNUlk8JkBRu0JhL5R6TAv9OdHjcBfQUtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dVkkSnHA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dVkkSnHA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8A5781A113B;
	Sun,  4 Oct 2026 21:32:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF98604FE;
	Sun,  4 Oct 2026 21:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6925D1032820F;
	Sun,  4 Oct 2026 23:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZJCKkWbeln3YHmeF1SG+wIijA+DDLjizdoj1hpcvd6M=;
	b=dVkkSnHAA0/ikyFqeoKppjiRAwjVv6oHqCoO5o7PqVCW66vLotlbiDv13D0Npfhl9YvVg7
	LlyWtFxKqhAjRCsV6k2wgQwbsuw04ZrlwwpkJ2rn//g76kkcCADXSqq+dfvzYwRgVNIBth
	v879ajZFURCdbFMlAtH/MnJRLQcISC2dClpavsFieWCHG0xwq2ldL917vTMN1ZSdg4zDu/
	a+a99OvuPNfmVOU/aJ9OXX7lqk+N/EVNphfKWuSJ/8eGu8IG3CEnlJVMoVLieoi930iEUs
	bIrri5LkD8wV4/JErCkBF/xQA78w3jK1jj4d53VWLxdzaUb2Mi0kt8me5UQVxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:31 +0200
Subject: [PATCH v2 17/17] mtd: spi-nor: Fix the meaning of a comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-17-592f3300a70f@bootlin.com>
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

I got mislead by the comment above spi_nor_setup() which implies that we
program a specific configuration into the device. spi_nor_setup() is
pure software, it is the step where the core configures itself for
dealing with the device. spi_nor_init() is where we tell the device how
to communicate with us based on all the knowledge we gathered from its
SFDP table and the DT.

Improve the comment a bit to reflect the fact that one should not write
volatile configurations in spi_nor_setup(). spi_nor_init() should be
used for that instead (since it is called at resume time).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0757e5a7cf2b..bcbce84c1163 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3491,7 +3491,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		init_waitqueue_head(&nor->rww.wait);
 
 	/*
-	 * Configure the SPI memory:
+	 * Decide how we will deal with the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.

-- 
2.55.0

