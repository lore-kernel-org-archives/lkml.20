Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B51E8826
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943709; cv=none; b=irVQo7W8EJfLUQkLVpAKj2GGtoWGZyVJBO2kcuABX7wqCBUlb0WL28Ii51QfIkiDPW4zbUakfLpUmpMcpeZerXYVo27kHnlmw7+60+jTaVUU8WzoRlAv7yfzdDwp56iV8kHBdp7ptHIiJpJgef22/fsw8/OddEpjFvjKaykinZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943709; c=relaxed/simple;
	bh=+wDh1Vii3svGvvs2QcujKXIPX9tgkElIKV9lyGw1VEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSmESdf/IhNUncUXgiqtrbHoWd5fcIkdzxJy4QhIDLyNCLHg8daQKKN0mBcGxjVAoU7aMGSCc1uBiWYJ4Q121D0IPjseFRUQBPBkOKY5b4bj9LApb5yvw2lqHwcESSYEMQFes2sYz0mHWQ2QPPR+lOmGqiW3r3efWYHjaQr9bh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gwd9QoEi; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gwd9QoEi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D5BE64E41111;
	Fri,  2 Oct 2026 12:21:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A93A0603DC;
	Fri,  2 Oct 2026 12:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A05410328202;
	Fri,  2 Oct 2026 14:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F8+VMoBjhGxFp/mfYKvgpqrWwYN/RkzKCtwvFsghv/g=;
	b=Gwd9QoEiWi/DLuC6TdElzWMrlgBHKwbOMKCLV4qysf/HWdAR9Nnm4X0atyotrJ9NWaOx+Q
	OccTtP5MubVlm/Rg6TWn21k5hNGYHl+ROgFd7FiRo9qBo9XQmzfaD7tGil2QbTbe6KhTtd
	9ErJ5UBYTthT2n3SkLyFMQ6M4W23tHkW3z4fYw2qgmBmIEsQ233+bpwFRaJj89ZUO45Vb9
	f9ByQ42wxwv9RwKsMUDppftCb+ooI83TchM6K3BJcz/2YDcv1U96gMHk2fX49Oo1d/0m8t
	EMtQv5vO7H1Y8GjsFxxgWFpw/14K3upzWPn8Ybd031/d1PRQWyC9f397CJjn+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:20 +0200
Subject: [PATCH 07/15] mtd: spi-nor: Allow configuring the actual number of
 dummy cycles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-7-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
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

Crete a callback to configure the chip for expecting a specific number
of dummy cycles.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 12 +++++++++++-
 drivers/mtd/spi-nor/core.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6e22342361c3..152add3834fc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2627,7 +2627,17 @@ static int spi_nor_setup(struct spi_nor *nor,
 		return err;
 	}
 
-	return spi_nor_set_addr_nbytes(nor);
+	err = spi_nor_set_addr_nbytes(nor);
+	if (err)
+		return err;
+
+	if (nor->params->set_dummy) {
+		err = nor->params->set_dummy(nor, nor->read_dummy);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 bool spi_nor_fixup_match(const struct spi_nor *nor,
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

