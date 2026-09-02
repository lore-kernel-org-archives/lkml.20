Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEDA4AE108
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368397; cv=none; b=P7X8Xs08Z6jC54EQbpwMvo1SJzHpM2fPu0e40R7vYUur9Ry0x0xFH/V6oNbXQ1G/urcPC47lnzXjLStevKt/SQvRGYda2lLn8BSoKSvl7bN9iHUDsg4RCFukgUHfXCfW7fG+7okFTbs/JGe2nvMeSmP5QQWP6MIKo9RmFpjUR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368397; c=relaxed/simple;
	bh=W1S9/hT1zGUS1zo9daSE2Bsn/9v9eP9/RmkgnRVj8EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q//EgHg1Bd6LIvfOawmLqxP+o9IwjgD0sQEZ+vprhX6dFD9hU4R2GukgXJ4it4sWiX6tqo+Ejg8OlTV0mF6TmgnXdv5qFoIwCcxKm0Wp80AuJbm1WOzVf9LdSZUwD5MDC7JuohwL2SnL7Q2HMAYhOcLYGTBWUDhCeIaJRQM5Wvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1hm5qy2h; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1hm5qy2h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23B104E414EA;
	Wed,  2 Sep 2026 16:59:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6CD36053C;
	Wed,  2 Sep 2026 16:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 493A411C79B6F;
	Wed,  2 Sep 2026 18:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PmjfDcV9O1lYxa99SNyUi2V7hvGHYcd8gRD3JAlLYbs=;
	b=1hm5qy2haXjcd4HJ5xAz3ALLinTY4Zqf0suU2dC2tKF9iZiY5MnVgphYYBr746xMIr7Gio
	QF6rI63NkZlLRY7r+t5tG+W3ZSXoSUaf/PootbjVQSyKmJqGkGfN61opgtyGqnPki5mwVK
	oAvP5VG4gRTVptEIGbKW0ueth1RuUelRQuNTfxzWLLhh8J8bsyicE8SvRpbCQwMVP8SrJr
	PN5nwHG5DDMMddOBO+gvwIWupyidbPeiL6ym3kZgsRJS0XdQCeTdHhPHrrRDQNK6YPrj/1
	74nU4PuO92rLTWH+KSA8OYvCjCX8edCB3l/ILi39utAEpPx81mvjqz4FZI2saA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:18 +0200
Subject: [PATCH v4 04/25] mtd: spi-nor: Add support for the new JESD216 rev
 F QER field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-4-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
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
index 1d799f02b8e5..285ac781fba8 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -618,6 +618,12 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
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
index f0b5a1989881..3a55d76ea77d 100644
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

