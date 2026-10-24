Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792801028;
	b=5qWcTb+SQHdpqHV5blHQkjJ7YdqDF9o/2W0hJ0gxUY6GODnXw1WWg23iKaX5OHOJISh2
	 3gd37k2yUBzzm3V22QmdAb0pUNhF5SEuQ/b2duZlyxTSI2SOY2t1x/5BZuEbYMRLU4JW1
	 19yrSkofa4Ek0I+ZHk8ZCPqzLVKmSTPaqWBF37lr36IM5mTzIOiERQ2J+w6Mx7hEUmkgQ
	 L+UctAH/brlpANnqlnpeZYsNdWGV8mMhXf/nGrasRKJCm9qPLcjTcesvbMz75+xUYXHTs
	 VkzBDve95mqrUXFF3WnsLbhEfG5SkbTMbdASbBZ9ISY6qYlKZgYCkihcYnVgJ1mSU3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792801028;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=j0wUcle1npmkLK5Xk/xsqVEnA1MWnCFJaMlzInyzSwY=;
	b=I9rVsFJWJMemtkJ42iviMWrtoNKCOD8b805W6NC9pCGigbRuB2Nx96iLP2/7VUO/5DWS
	 2PgsDmhUu1At7OQ91J/FS4O2QX4LSAfS6s+NPRKPqUQ/rgb5nFbNrdKNBSdHRyNHOjd3U
	 BbGsnny/r4a73t0U/KHPMv4V247XNDkihkSkW8lAzLFe5O8hOAv6hcoSNJq2fCtSP6dd8
	 1EyseV2gGhzKfbul9h7rdzjzuNsdlz6P7a54JXsKukPJkHWwzk7QMIBNbSSz1nlS1XcKk
	 BHBdTG4koqID6Gs/3IjnZzwHzctfQ/vNx8fvfkHyIwNb2Nekwatpm/WO3H2Eqlh+G3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KMEqnWLT;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D5B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KMEqnWLT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBFAC1081B2;
	Sat, 24 Oct 2026 02:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792801022; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=j0wUcle1npmkLK5Xk/xsqVEnA1MWnCFJaMlzInyzSwY=;
	b=KMEqnWLTNF0iOTvV4SFEffEcIHTV9VMXGV8arzUHTrDoJ47xWbFhkJLdqwR0+PELEoE1IT
	t4mgTF/EPmIwW6ZoXrDxIzaJq2W8yKHrdMHM6f2LCh13Kf0FJRfFLs5caWOQQW4TTXztrS
	B4WDb23qgF5VDFQ16xRTuqCUhOUqnxv90u6mJZadiCjvujBEY60v9Huug37/ul6tXTGsU0
	eaXW9pIa2VPYhIFX45poBPBmwpBeIPcJ/MF6qGuG1BqvrVwnPoCs9Ol6kaCB9g4Uz8axhx
	3IrvrPlE8/RWuE3YYGgRW3MNnQsDFNbF3CTcVJqlfKeWLgcr+b6ioro07YGVCg==
From: Marek Vasut <marex@nabladev.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
Date: Sat, 24 Oct 2026 02:16:17 +0200
Message-ID: <20261024001658.222147-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The MX25L51245G part has similar 4-BP locking mechanism as MX25L12805D,
however, the TB bit on this part is OTP. Introduce support for Top-only
locking in case the TB bit is not set, and disable locking in case the
TB bit is fused i.e. set to Bottom mode.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
V2: Introduce .late_init callback which enables locking only in case
    the TB bit is not set
---
 drivers/mtd/spi-nor/macronix.c | 53 +++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1ca..11e71e254a54a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,9 @@
 #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
 #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
 
+#define MX25L51245G_OP_RDCR	0x15
+#define MX25L51245G_CR_TB	BIT(3)
+
 /* Convert dummy cycles to bit pattern */
 #define MXIC_NOR_REG_DC(p) \
 	((20 - (p)) >> 1)
@@ -25,6 +28,49 @@
 		   SPI_MEM_OP_NO_DUMMY,				\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+static int mx25l51245_read_cr(struct spi_nor *nor, u8 *cr)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(MX25L51245G_OP_RDCR, 0),
+						  SPI_MEM_OP_NO_ADDR, SPI_MEM_OP_NO_DUMMY,
+						  SPI_MEM_OP_DATA_IN(1, cr, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_read_reg(nor, MX25L51245G_OP_RDCR, cr, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading CR\n", ret);
+
+	return ret;
+}
+
+static int mx25l51245_late_init_fixups(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = mx25l51245_read_cr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	/*
+	 * MX25L51245G supports locking, but the CR register TB bit is OTP.
+	 * Enable locking only in case the TB bit is not programmed, or set
+	 * to 0.
+	 */
+	if (nor->bouncebuf[0] & MX25L51245G_CR_TB)
+		dev_dbg(nor->dev, "CR TB is set, bottom protection not supported\n");
+	else
+		nor->params->flags |= SNOR_F_HAS_LOCK | SNOR_F_HAS_4BIT_BP;
+
+	return 0;
+}
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -108,6 +154,11 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
+static const struct spi_nor_fixups mx25l51245_fixups = {
+	.late_init = mx25l51245_late_init_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
 static const struct spi_nor_fixups macronix_qpp4b_fixups = {
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
@@ -353,7 +404,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .fixups = &macronix_nor_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &mx25l51245_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },
-- 
2.53.0

