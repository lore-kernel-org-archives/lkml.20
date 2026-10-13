Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6451DDF4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909289; cv=none; b=ExvPKMNBpwylceFh3fRQktY3N6xedORbSR6jSvRksF2+7HgFMnvnYO+RF4oqdUSFfr98JzC3XcHEbhlXxH1BhcKBQDVc5bS6slKzfEhGUyyCYRXlSxCBAdbaTh+7HGovxoCsZ5sLimsbgZbSpUQ3kfB9+uc98QjxhBcakjJQEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909289; c=relaxed/simple;
	bh=LQ/l4+Nd+Cz7IV10k2jaTcKtxDJdLahF4h6Gt8FSeM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgZGZzuJ9U0tWC68I+CM0HSwrdKznoq6aRZ5vJTQo5DR0dAv56yM8jz7wJ0QPmihzjYdzoRitC3vAfGiVJqgU7U7VcFnoAGd2qZgWup9bhrF/SugJnu8ibAEV7v3zzuwXlCIBg5HW7JOCpU7feefs82wXoggCCkQJKZrwFGoaVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JcEcMAQq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JcEcMAQq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D1DEC653F6;
	Tue, 13 Oct 2026 16:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1D1460362;
	Tue, 13 Oct 2026 16:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3167711D71810;
	Tue, 13 Oct 2026 18:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QKQ0m9xvm4tAOTCHQDD54jlJu0ye7Cl8MkYNQVNaAaI=;
	b=JcEcMAQqDjWeHuix36AtDDJNinMmjsSNENLvEHBKaH+yVts1a6pQ5tqE9ktX0xqzsqgODd
	6IUBECQFuJ+gRly3v3ApImDWkisQUfKa9HR/xNE4rYFXerHdtFqvWf/hMraspbWvrSQNxT
	8er+gfmLxeWfHPZ3auKeQKyOi7Rvrh3pwN2+L5fh6xbMW2OuubovT8IegxdrI1mo+YbFm/
	Mjuj1sfgwfqMBREVl60whClhtv4sryMsdx4P85nWYNhFSMKgHSpQXhS6EeGaaIMpV67XqB
	xQv3tidOsqFMX3zd2LFr44kJP2IX6n3akZytQBGY+gaCry7bHRqgs943rO0B8g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:59 +0200
Subject: [PATCH v3 09/17] mtd: spi-nor: Allow configuring the actual number
 of dummy cycles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-9-6dde1d513df8@bootlin.com>
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

The SPI NOR core selects the fastest read variant advertised by the SFDP
tables. This may or may not be a wise choice but at least it is simpler
as any bus frequency will just work. There is however a downside: the
number of dummy cycles is maximized (in case the bus frequency is really
fast, this is how the chip enforces a sufficient delay). Maximizing the
number of dummy cycles means that, if the amount of cycles is
configurable in the chip, we might not take its default value. When this
happens, we need to make sure that the chip is configured accordingly.

Create a callback to configure the chip for a specific number of dummy
cycles. This callback is used:
- after deciding how to communicate with the device,
- in case of error when switching into ODTR mode, we shall negociate
  another configuration,
- upon resume.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 24 +++++++++++++++++++++++-
 drivers/mtd/spi-nor/core.h |  2 ++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8e55f12161d1..07364b0a742a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2991,6 +2991,20 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * spi_nor_set_dummy() - configure chip for a given number of dummy cycles
+ * @nor:                pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_set_dummy(struct spi_nor *nor)
+{
+	if (!nor->params->set_dummy)
+		return 0;
+
+	return nor->params->set_dummy(nor, nor->read_dummy);
+}
+
 /** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
  * @nor:                 pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
@@ -3014,7 +3028,11 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 		hwcaps.mask &= ~(SNOR_HWCAPS_READ_8_8_8_DTR |
 				 SNOR_HWCAPS_PP_8_8_8_DTR);
 
-		return spi_nor_setup(nor, &hwcaps);
+		ret = spi_nor_setup(nor, &hwcaps);
+		if (ret)
+			return ret;
+
+		return spi_nor_set_dummy(nor);
 	}
 
 	ret = nor->params->set_octal_dtr(nor, enable);
@@ -3091,6 +3109,10 @@ static int spi_nor_init(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 	int err;
 
+	err = spi_nor_set_dummy(nor);
+	if (err)
+		return err;
+
 	err = spi_nor_set_octal_dtr(nor, true);
 	if (err) {
 		dev_dbg(nor->dev, "octal mode not supported\n");
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 670182b3c2ad..b64f26b69c05 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -377,6 +377,7 @@ struct spi_nor_opcodes {
  *                      Table.
  * @otp:		SPI NOR OTP info.
  * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
+ * @set_dummy:		configure the number of read dummy cycles.
  * @quad_enable:	enables SPI NOR quad mode.
  * @qe_mask:		two bytes mask used to set/clear the QE bit
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
@@ -410,6 +411,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_otp		otp;
 
 	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
+	int (*set_dummy)(struct spi_nor *nor, u8 dummy_cycles);
 	int (*quad_enable)(struct spi_nor *nor);
 	u8				qe_mask[2];
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);

-- 
2.55.0

