Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490B51C344;
	Fri,  4 Sep 2026 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545603; cv=none; b=Lh9SzOforfzNfx0toVlSjZZG8Xlh/Hsp5UbNK/rwwOXzeDZSKIF0Jor2GIavhyqW67wbZFxSI7lXO+hM/XjO4KQ88MNPh3MCUF+ItMZ9hEuoDEu+P1i+lgCowtCN/39VfTbfBjnpxpNBs9MJ5XfQgxbZTxzSfHRWtSe3GVFBq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545603; c=relaxed/simple;
	bh=Cx90LmcZjOdDyZXkcegzQNj5f17y4JENdDvZUnOO1/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l05KnEbhtO6Mw6iddS/Ww7s/bpqDxl8TxYEttpAMH4F156lc7LwCDP775O2vgJA7p3G0InbyebydhfQNrCz9Z21GP4AyRbWSxwO2Sbqla+0JzX5XS4hfx/OvrNXbC5pTC3TTyXh8Yb+hrPfAgZ6khISvuCXoZdjklkIZcyRU/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZN24nX9r; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZN24nX9r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C75824E41523;
	Fri,  4 Sep 2026 18:13:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B8746057F;
	Fri,  4 Sep 2026 18:13:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7AA811C79351;
	Fri,  4 Sep 2026 20:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545598; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nqp2rAsZbBi3yuJ+oYFg/H+DOQXz2fdcMr31I5bTzJ8=;
	b=ZN24nX9rb8sAqbrENBPPkEzGfmHX3WoAv221OJhyM3Jijj7/nN71ZBxR/NoB82JVCEUevI
	UpqejHIgP8uWCKr5knymuafexYhGkwIrvvZe/Mt9y54PAohwydBFl+W1JZKm7VcOiVNcwd
	YZXmvJYKMmXSiXw789two+rYSPqc218goti6BpQRmyviAo+abaZNqYM3pg8pvI990M0oUG
	6D5JCfBWLliCl8ZVMWG7SeMk3vNY+cGYJ0Hct1ttK5304CsoSnPkNe1ksosGWgXFZKeg0V
	U8bTDox4VcT/aVZklu373zKz3tjY2ABu2MySVxkKqVQG6jah3Ja0PHeTBBLhwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:41 +0200
Subject: [PATCH v5 04/25] mtd: spi-nor: Add support for the new JESD216 rev
 F QER field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-4-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Revision F of the JEDEC JESD216 standard includes yet another
supported setting in the QER 3-bit bitfield: 110b.

This setting implies that the QE bit is bit 1 of SR2 (which is an
already supported case) but this time it makes it very clear that both
reading and writing to SR2 is supported, but not with the usual
opcodes. The write operation uses an alternate WRSR2 opcode:
0x31 (instead of 0x3E) and both the reads and writes manipulate a single
register at a time.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c  | 6 ++++++
 drivers/mtd/spi-nor/sfdp.h  | 8 ++++++++
 include/linux/mtd/spi-nor.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 20156914e254..23c11fbc68c3 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -649,6 +649,12 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->qe_mask[1] = BIT(1);
 		break;
 
+	case BFPT_DWORD15_QER_SR2_BIT1_1B:
+		params->qe_mask[1] = BIT(1);
+		params->opcodes.write_sr1_and_sr2 = 0;
+		params->opcodes.write_sr2 = SPINOR_OP_WRSR2_ALT;
+		break;
+
 	default:
 		dev_dbg(nor->dev, "BFPT QER reserved value used\n");
 		break;
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index d976c6c9a4ad..e8ed814c6530 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -12,6 +12,7 @@
 #define SFDP_JESD216_MINOR	0
 #define SFDP_JESD216A_MINOR	5
 #define SFDP_JESD216B_MINOR	6
+#define SFDP_JESD216F_MINOR	10
 
 /* SFDP DWORDS are indexed from 1 but C arrays are indexed from 0. */
 #define SFDP_DWORD(i)		((i) - 1)
@@ -81,6 +82,12 @@ struct sfdp_bfpt {
  *         instruction 35h. QE is set via Write Status instruction 01h with
  *         two data bytes where bit 1 of the second byte is one.
  *         [...]
+ * (from JESD216 rev F)
+ * - 110b: QE is bit 1 of status register 2. Status register 1 is read using
+ *         Read Status instruction 05h. Status register2 is read using
+ *         instruction 35h, and status register 3 is read using instruction 15h.
+ *         QE is set via Write Status Register instruction 31h with one data
+ *         byte.
  */
 #define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
 #define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
@@ -89,6 +96,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
+#define BFPT_DWORD15_QER_SR2_BIT1_1B		(0x6UL << 20) /* Winbond */
 
 #define BFPT_DWORD16_EN4B_MASK			GENMASK(31, 24)
 #define BFPT_DWORD16_EN4B_ALWAYS_4B		BIT(30)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a901ddfac405..539eb514588c 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -25,6 +25,7 @@
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 */
 #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
 #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
+#define SPINOR_OP_WRSR2_ALT	0x31	/* Write status register 2 (alternative) */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
 #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual Output SPI) */

-- 
2.54.0

