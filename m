Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B93E580384
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967582; cv=none; b=gkU1yU7kXJxkGmWBs75YAZBHGP1tf8Tl0N5sNuEIHpzw6T1zI/0Qsm2Nnf0zv+HByiGmwZnAi/O4po52+le8iogSeeD+iqvarMbf01cxGfJrbuypnR32MgHo9T/D3DpAlOTayT3LTFYTmjGznRbg92lVydlK95L6+UCjirEpj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967582; c=relaxed/simple;
	bh=dvHHmUXizKL0L38DHbJVQRbZ4G0pyvQKKaAzAa0mw7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP7OK0lPdr6EW3rBiEtgNqBOEbZKFi4d2oqYkz8MMBWSxryLTjTt7pzrdZqd9nd/YODwmfBAzVV+E+F6o4F1ob+J2DrWfhzkr10RA0R1TPEq2cYp/gS0qJRluDQtFe4sJu/wJs89unG3+LAlLiClLglcmZhL1DVt0+zWIFbM6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G4mb/zJV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G4mb/zJV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E5BE1A1A80;
	Wed,  9 Sep 2026 15:26:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 035FC60448;
	Wed,  9 Sep 2026 15:26:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F5AB11C7AF6A;
	Wed,  9 Sep 2026 17:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GuYAXiy3LBztdF+Jzrk+5NdkWxmQ+Bvx8fCXxOiYco8=;
	b=G4mb/zJVbafSlVsi5kML4ob500HkZXqCV8CWPUaqVdTrCNAnCEzuH2aNk8ZJ6tUeOIpQmX
	TOqKYgLU4BR9uLztqhZ4GUyzERhGB4BR1zHWjCxAg6ib9PabD5BL3ASNiwy5SCrEukskFE
	Py/Sy+WSOzEpqWKOZeZZ7V2DhlhQxDGk/mMPGmklCI7sB8S/juZIekEEsRkVi7xmWQQOQc
	DrAQJxnDRqMRg556MOCELed7MB3cnUr/+wZ2m+Dy5y8ZhMu0RU6DmeBNn5amjT75GPpVk/
	7nPgTMqJGONW6uhOBPlc/QHHyMvyBwSgcPezb6Okhi3aYVqA9e/sLN2EVHSQZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:47 +0200
Subject: [PATCH 16/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-Q/N parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision between chips of same density from the JW
family (which it self conflicted with yet another family) with new PW
parts. Chips are very similar in practice, it is mostly a matter of
electrical differences (mostly power consumption being lower) as well as
the addition of inline ECC capability for the higher devices (> 32Mb).

Chips with ECC capability protect 16 bytes chunks are against single
errors. In case a non-aligned write happens, ECC is locally disabled
until the next erase.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 55 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fbad9e408d7a..efa9de1f0f66 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -71,6 +71,41 @@ static bool winbond_rv_match(const struct spi_nor *nor)
 	return nor->sfdp && is_w25qxxrv(nor);
 }
 
+static bool is_w25qxxpw(const struct spi_nor *nor)
+{
+	struct sfdp_header *sfdp_h = spi_nor_sfdp_get_header(nor);
+
+	/*
+	 * W25QxxPW chips re-use the same ID as the W25QxxJW/NW family.
+	 *
+	 * Chips are very similar, W25QxxPW brings mostly performance and power
+	 * consumption improvements. One key difference in behaviour is the
+	 * automatic 16-byte based error correction.
+	 *
+	 * They can be distinguished based on their SFDP minor revision:
+	 * W25QxxJW:       JESD216B, minor revision == 06h
+	 * W25Q51/01/02NW: JESD216B, minor revision == 06h
+	 * W25QxxPW:       JESD216F, minor revision >= 0Ah
+	 */
+	return sfdp_h->minor >= SFDP_JESD216F_MINOR;
+}
+
+static bool winbond_pw_match(const struct spi_nor *nor)
+{
+	return nor->sfdp && is_w25qxxpw(nor);
+}
+
+static bool winbond_pw_with_ecc_match(const struct spi_nor *nor)
+{
+	const struct spi_nor_id *id = nor->info->id;
+
+	if (!winbond_pw_match(nor))
+		return false;
+
+	/* W25Q33PW chips (id[2] == 0x16) do not have built-in ECC support */
+	return id->len == 3 && id->bytes[2] >= 0x17;
+}
+
 static int
 w25q128_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -201,6 +236,22 @@ static const struct spi_nor_fixups winbond_nor_partname_fixups = {
 	.post_sfdp = winbond_nor_partname_post_sfdp_fixups,
 };
 
+static int winbond_nor_ecc_configuration_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * PW chips feature automatic error correction. Non 16-byte aligned
+	 * writes work, but disable error correction on the region until next erase.
+	 */
+	nor->params->writesize = 16;
+	nor->params->flags |= SNOR_F_ECC;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_ecc_configuration_fixups = {
+	.post_sfdp = winbond_nor_ecc_configuration_post_sfdp_fixups,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -622,6 +673,10 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x60), .match = winbond_pw_with_ecc_match,
+	  .fixups = &winbond_nor_ecc_configuration_fixups },
+	{ .id = SNOR_ID(0xef, 0x60), .match = winbond_pw_match,
+	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70), .match = winbond_rv_match,
 	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x18), .fixups = &w25q128_fixups },

-- 
2.54.0

