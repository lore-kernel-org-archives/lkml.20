Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06081582B80
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967589; cv=none; b=pu/6+iEWRlfjam/ZtmUghW++dEZ5yFPW03cp7w52AwiiSx8nP/6FSBQLi3/X4bafrSdDS9clRENMB/ToM8UN9haBpJZZUNv9yeQ0j+xUGV3jjJRABOG86ees6QmrZ/b3OO5Lbp+mZQDo86cKXPOqOdh7Stw+bK2/UbJsblTi3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967589; c=relaxed/simple;
	bh=fWQjL4FWmjdp3YPX2CjTxnjIuHTolbxA0ppq4e6heqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HoU3+WSwVpMCQ3rhBiF+k+lc+NLnj85SA6ShkKDUqyMJk8D3Ew7BsEFCkVl4C+Tp1U4VdfLGxyjTQOXuJ0gG4aoDON96nnra+0HNFHjgPhz/kbJFFIaBW+dKKnWpmF4itiA1W3RE2wK6HAlMWlbCI92HZfj02TlIkHRq37yJgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YgRUT/JF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YgRUT/JF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B43F34E415B7;
	Wed,  9 Sep 2026 15:26:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 890ED60448;
	Wed,  9 Sep 2026 15:26:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01E3911C7AF8A;
	Wed,  9 Sep 2026 17:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/Puf14zHoNpcu2IaP2+O1o5VBQxr0Rjc1CtPnytDAI=;
	b=YgRUT/JFvwCrHXknDgbsOVCdLlcw/PCX9tCFiCigZ3gat7DbzKBcpOcF7+Ru+qIbBAuyNz
	RnX7uSF++VFRCdFc6TyDJfI1Mn9KhDWfYDuo7uYNbq8IVbMyhLVk3HTB5qx0VRtmFEkKtN
	8s9HTXHFTaGN5MociM/dwMxwjV64RmmJk7I2cVdhFD3CMAjtGoqlcr7h17af+qmtAkG3XF
	EMAnkEvKqgirtBtED8hOwf0v45yOXlD/Fo4Y/L203UxV0YLY6JqTNUTIQxKcTa1ghFtj+d
	rGeriUOs7b9X+2wjNx2VjqRnrqi2JUGZHd34UsOuNkPshIdHe3T1b/xIMK+GWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:52 +0200
Subject: [PATCH 21/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-M parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-21-c1b20c39dd1f@bootlin.com>
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
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9f6eeaf0c32d..0c5c195ad472 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -684,6 +684,10 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x80), .match = winbond_pw_with_ecc_match,
+	  .fixups = &winbond_nor_ecc_configuration_fixups },
+	{ .id = SNOR_ID(0xef, 0x80), .match = winbond_pw_match,
+	  .fixups = &winbond_nor_partname_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {

-- 
2.54.0

