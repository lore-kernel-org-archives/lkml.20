Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D013DFC6D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149515; cv=none; b=PKM56MDS6iObzCR657+MKypKEbUL80fcjtiR4wBErkhzRxFVkHP0sUXFaUojKzRLc8kWxAKswYBAinR08aQqUeh+VY913mQmV3Ef4gTlXoMEGuglGq0PGZr/fiOoAvz98XjKZat+4NVJsPuGwTgCkQD6q+w+M+gpdoxwtrATImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149515; c=relaxed/simple;
	bh=WBwxbU/Uo1mo81DSNzVRXZNO+mHyfOlMBoDDahuEyRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvlxmULoJP7pj54HMesZfnJbKXZPF0TBdfsmQ4ppQue61UBLbG/L/jWwtVQMhJQw9JR9X1YEiQlo3aD53srq0UK3TgH5J9zvmUdc9AC653sUzeTn9DY5CXUdx1WoTo2TZWVd/KyGK6uZOZtedebRi34FWI9f8so5JRR65CXOq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l/YfZO/n; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l/YfZO/n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5A104E41169;
	Sun,  4 Oct 2026 21:31:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBC92604FE;
	Sun,  4 Oct 2026 21:31:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 953441032820F;
	Sun,  4 Oct 2026 23:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bn7MzMTlkcOXD7N3ZVZLc4yFMI6vN6F+0M97YqOBEZM=;
	b=l/YfZO/n51TiS08pZ0PL9HzMUBaBxsB6CKbaPeB0UFYLyBsSiWzxe6hOpFOGRVykBmM3gG
	xeqRpdf02eFK2AmW7gy/e1p+5yXcRY6z4fLP7efcDi8yQigK3bF0STHjTHGvSY6OayrUAu
	Q7B0+VGfv/wQazRgqvz51S77niTR3knpBmuBhaSnkSDNBevxwzAAyni3lcUb6R+3s4r92B
	BBprysG4BTWM84oqt7Wknl2iz9vUmsHJK+ajOd4A/yXqfCMiBKuAlb+xl+rkHM8ug53NM8
	inJ6mK75eKyvOfYLRlw821RM2e7IRwH6wvT+7Ej4GkjKES4wjfz5fXncJ9IsFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:22 +0200
Subject: [PATCH v2 08/17] mtd: spi-nor: Allow configuring the actual number
 of dummy cycles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-8-592f3300a70f@bootlin.com>
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
index 6e22342361c3..56d8f95da0d4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2993,6 +2993,20 @@ static int spi_nor_init_params(struct spi_nor *nor)
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
@@ -3016,7 +3030,11 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
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
@@ -3093,6 +3111,10 @@ static int spi_nor_init(struct spi_nor *nor)
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

