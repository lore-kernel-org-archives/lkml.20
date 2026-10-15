Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4714DD3B7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055130; cv=none; b=SiUXTZ2LL2eZfJoGinvLI8QI49c78m6cSaVyxsAfCziTRQWUVtvk40eiFf81HhgHOaa8zzeSlCOdoSPXuewyBQCJ/s2+ychHdpSRqO5lucY6Rv2mySMell9qttwb9RLh+TUWETAsc/7quT0kzFfmwtVvYXU8DY8ZSqob9R6vFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055130; c=relaxed/simple;
	bh=kAFt08Apr/uOudwsprYUZF48EunqqD3S/1hAH/L5jRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oc6shm+LYaJzZ2+40Mbg0OjPGqzONPfzP0LBE53vhQt7PTjKniJ1SIQupoPyopwEdBkA9cqhc6D8MPj3p1REralppqktU/GtUH+/zZeADQftA3IwtT5RYcBAQpvmb+KHOyDJebFboZOyWaSoQ6iATKl+5pLzobsbEbTtdnV87Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbVUxeKI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbVUxeKI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FB41F000C4;
	Thu, 15 Oct 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055129;
	bh=47/p8YmQs+5a2RqOu3MNEr5/73AtKBVmpsZc2mAhwlE=;
	h=From:To:Cc:Subject:Date;
	b=GbVUxeKItyZs5BqitpaPbAi07yjmNB8r8R3QyYSL0J4yNcxYnXAzy+z/WQwXuoCTh
	 /P7C/t/tznqE6So+VI2sw3PmFClQDsAXERCW8B3n24ertx/vMadQNo9jZOZ6o6YN8E
	 86DwMfqkCQvzdPYu0J82/pbBC3ZWSb+gGtbXbJLTZwAa4jhEn4G+pKjJdpy40uWxle
	 XTR634UlOIq2qAkvVKicMmX8jQWenFrC4qupR6MuZOY2UV3mBImXAgEZ0Pt1eSub6s
	 0dc+9J968qprjlrccgjAi6MfY5OgWs/yk2JbESxvMpU+k/qK/hTFcTwUVrVdIupwfP
	 U2/B3tR0yOr7A==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Laight <david.laight.linux@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()
Date: Thu, 15 Oct 2026 11:01:28 +0200
Message-ID: <20261015090516.924703-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two large spi_nor_flash_parameter structures on a function stack
are really too much, and this can exceed an otherwise reasonable
frame limit:

drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Allocate both rollback copies on the heap and use structure copies
for type safety.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/sfdp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index beb0f5c66212..e30cdb5b18ed 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1535,9 +1535,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *save_params __free(kfree) = kmalloc_objs(*save_params, 2);
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
-	struct spi_nor_flash_parameter params, params2;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1549,7 +1549,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 * Get a backup of all the parameter to roll back to in case of an
 	 * error.
 	 */
-	memcpy(&params, nor->params, sizeof(params));
+	if (!save_params)
+		return -ENOMEM;
+	save_params[0] = *nor->params;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1665,7 +1667,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
-		memcpy(&params2, nor->params, sizeof(params2));
+		save_params[1] = *nor->params;
 		param_header = &param_headers[i];
 
 		switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1703,7 +1705,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			 * spi_nor_flash_parameter data.
 			 */
 			err = 0;
-			memcpy(nor->params, &params2, sizeof(*nor->params));
+			*nor->params = save_params[1];
 		}
 	}
 
@@ -1724,7 +1726,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
 	kfree(param_headers);
 	if (err)
-		memcpy(nor->params, &params, sizeof(*nor->params));
+		*nor->params = save_params[0];
 
 	return err;
 }
-- 
2.47.3

