Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C2449B1C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501335; cv=none; b=ccW0ursn8l4m6+XShdSF0EsGhS4mTriXMmNiV8ax8OMQmz0z8qoiqpxfq1ngRdq/1BCVdhZ6BBddSSQxOF5YYLC5d8f0bPleLhSLl7e5s5nmzWCCZlt/X5lm39rnMWAu11CAWp7KQ9BultgjCc44o9sAdDZtoKSGdYE6bgNmews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501335; c=relaxed/simple;
	bh=w/pHJ5c8QmhzPeq/ip8dRuB1hNjFGP9nAGhciLQqwqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zwqx1PD9MxaQeeo07xSFPhWeg6axhcswDwhfvjktqaVzKi1mEfyvwRwZ+sYsRlu6TDfpz1qMxx4JjgNYHoIALXPua/yqZgZbFy838LDB5DeUikensO5T5ZoavxdvM7bx7wa9HAWfhfFv4kax4ioJz846VAgT1W9hxiHsB3bFaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMpAiatR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMpAiatR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEB41F000FF;
	Tue, 15 Sep 2026 19:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789501334;
	bh=lRO8Hk7d0Iglr71vivK2TJOxKQ4BfQZPY0f0uOCf70A=;
	h=From:To:Cc:Subject:Date;
	b=OMpAiatROL25mc3V5Oa3jASlu12n9NRTmK8khclYKmw7Q/qhhd3StaLKttvbOsUjL
	 ON9rV35hqshOLynoAmZ7P+w0hH3mWng57BYZ/RNQVrWFnZDVbFJrRLc+N/UCJ1b/R/
	 sI7JJMcR0dvKx1V8/x6dBB70O0Atr5AINdUCh+oMGdrWlgNr3EujPnv63OQduhE066
	 rKniqi4N3bGXOtFESjWV0iGrfyLS7OMK5ENKdZ4vvv0jL1I68lnJtiMXJlfoYlOyNi
	 3i8SqCR9HhZdFTJQsPVT5AI1gB7Im7ifgF0qlPGjtgeohc4UqCc1bDmLodSJRnnu6V
	 j1UZ8nkzLqMEA==
From: Arnd Bergmann <arnd@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: reduce stack usage in spi_nor_parse_sfdp()
Date: Tue, 15 Sep 2026 21:40:31 +0200
Message-ID: <20260915194203.3511147-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Two large spi_nor_flash_parameter structures on a function stack
is really too much, and this can exceed an otherwise reasonable
frame limit:

drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Change one of them to a dynamic allocation to make this more reasonable.

Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..5d0901074f50 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1520,7 +1520,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
-	struct spi_nor_flash_parameter params, params2;
+	struct spi_nor_flash_parameter __free(kfree) *params = NULL;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1532,7 +1532,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 * Get a backup of all the parameter to roll back to in case of an
 	 * error.
 	 */
-	memcpy(&params, nor->params, sizeof(params));
+	params = kmemdup(nor->params, sizeof(*params), GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1652,6 +1654,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
+		struct spi_nor_flash_parameter params2;
+
 		memcpy(&params2, nor->params, sizeof(params2));
 		param_header = &param_headers[i];
 
@@ -1711,7 +1715,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
 	kfree(param_headers);
 	if (err)
-		memcpy(nor->params, &params, sizeof(*nor->params));
+		memcpy(nor->params, params, sizeof(*nor->params));
 
 	return err;
 }
-- 
2.53.0

