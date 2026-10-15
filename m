Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CEF51C332
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063943; cv=none; b=crxat3QIarOAnSaVkYRbb3qAgp1XifE/KfrmxTXpxZaM+IKuGFd8ST6PuHD3m4ttdkHuqkUl8jf6rP6dFzDqZW15MkC3cCe/H3WJXc2G/pAQ27U3qRq53hQR+mCRICZlsVhH2GWvP0nbL+gQtwHrRV60mMb17zsnCisBJp5Rnp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063943; c=relaxed/simple;
	bh=zBXgxPfV74T6SEhDPKAbeGSzaXJJq1UVywUZjWSFyoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAsEWfaiJCAXBFymrZ8ql8ZsnLAN+M/+zV5gd1ivdOjBn8hIVH79tJbwdNGOjYh7Eg2hHnk3IdYsugaLEPKVcl8JUqRu/k5xTSwxt7htgihzkNqO15v9yUwyRe+CIj/Ss/c/zqnZgmTWKtUTtLVVMrRyQqh1nMNW+9X/uqangXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMjNmyAe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMjNmyAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3174C1F000C4;
	Thu, 15 Oct 2026 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792063938;
	bh=QD82TOQ9OGxgrllEERAIi/zP33vRrwNqhrzU5axxFWY=;
	h=From:To:Cc:Subject:Date;
	b=ZMjNmyAecradzBaB+dthqM1md27KcWUj0cFPv9GPYutzs4i4D4Zw8c9Q5/xq9Kf2H
	 yIHNSr1tkmTnU2MnPf3HAQI0GMYVTuRGkhDvMs+rSnlvZodHtEl/A+MAAI0BUNHc0v
	 IGa3ZcQ5JRw+SJVYER+9nUAaQWKxQ1f8opRPmKViT/4MbwZfKdYL8mxSu4kHtAePrk
	 azNTZEBLk2lzUha6JaavOpacASDfx/qNVLyiXahbKRBFaYDwkc3pzs15sAarEv9Xl6
	 t21PwN8FN/IiH/XbCpl9siJOerbqwPTESmcgcKdvQcmnahbY7j3d6reIWhHbpGKuzF
	 NUr7gxhTTHmqQ==
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
Subject: [PATCH v2] mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()
Date: Thu, 15 Oct 2026 13:31:52 +0200
Message-ID: <20261015113209.975641-1-mwalle@kernel.org>
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
v2:
 - don't use the cleanup helpers to not mix them with gotos as
   suggested by Miquel. I didn't carry your Rb over because there
   is quite a bit more code change.

 drivers/mtd/spi-nor/sfdp.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index beb0f5c66212..2c96f7820188 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1537,7 +1537,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
-	struct spi_nor_flash_parameter params, params2;
+	struct spi_nor_flash_parameter *save_params;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1549,17 +1549,22 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 * Get a backup of all the parameter to roll back to in case of an
 	 * error.
 	 */
-	memcpy(&params, nor->params, sizeof(params));
+	save_params = kmalloc_objs(*save_params, 2);
+	if (!save_params)
+		return -ENOMEM;
+	save_params[0] = *nor->params;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
 	if (err < 0)
-		return err;
+		goto free_save_params;
 
 	/* Check the SFDP header version. */
 	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
-	    header.major != SFDP_JESD216_MAJOR)
-		return -EINVAL;
+	    header.major != SFDP_JESD216_MAJOR) {
+		err = -EINVAL;
+		goto free_save_params;
+	}
 
 	/*
 	 * Verify that the first and only mandatory parameter header is a
@@ -1567,8 +1572,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 */
 	bfpt_header = &header.bfpt_header;
 	if (SFDP_PARAM_HEADER_ID(bfpt_header) != SFDP_BFPT_ID ||
-	    bfpt_header->major != SFDP_JESD216_MAJOR)
-		return -EINVAL;
+	    bfpt_header->major != SFDP_JESD216_MAJOR) {
+		err = -EINVAL;
+		goto free_save_params;
+	}
 
 	sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
 		    SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
@@ -1588,8 +1595,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		psize = header.nph * sizeof(*param_headers);
 
 		param_headers = kmalloc(psize, GFP_KERNEL);
-		if (!param_headers)
-			return -ENOMEM;
+		if (!param_headers) {
+			err = -ENOMEM;
+			goto free_save_params;
+		}
 
 		err = spi_nor_read_sfdp(nor, sizeof(header),
 					psize, param_headers);
@@ -1665,7 +1674,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
-		memcpy(&params2, nor->params, sizeof(params2));
+		save_params[1] = *nor->params;
 		param_header = &param_headers[i];
 
 		switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1703,7 +1712,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			 * spi_nor_flash_parameter data.
 			 */
 			err = 0;
-			memcpy(nor->params, &params2, sizeof(*nor->params));
+			*nor->params = save_params[1];
 		}
 	}
 
@@ -1712,6 +1721,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		goto clear_sfdp_ptr;
 
 	kfree(param_headers);
+	kfree(save_params);
 
 	return 0;
 
@@ -1724,7 +1734,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
 	kfree(param_headers);
 	if (err)
-		memcpy(nor->params, &params, sizeof(*nor->params));
+		*nor->params = save_params[0];
+free_save_params:
+	kfree(save_params);
 
 	return err;
 }
-- 
2.47.3

