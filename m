Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC83E4C66
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907223; cv=none; b=fYds5waBJvItjTXfpwn71gY45Nd3iSHUfOJHZ6ZjtNw4gP4ZzPJPP+JLyc+KG2shX74/FpsZrjWlsaJnlTlSKvfknCd1IbM6SQzU5/mYJqftDMZcsDzkalaxh3eAv/lPj0ovzBqmeDrZMH7ud3e5DmNKQgcwJQm3EbuZ3muz4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907223; c=relaxed/simple;
	bh=T1+Skzx1IVU5zGA17tPX08as1QCC9dQZUwacXH/Tvm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poHndI/IyPph7/VLVh59rXHIE9ajDRLQEhHKsNQ53l/HVJSsgoI0CBYxtrmUjoTSFywrkkH9Akr5hVLUzp8ibZoCQ7zLKFEiNptu1uPtgnUc2xM2tsnitGzaF7T7PkD2oI+wco9XsXufT++/e8WL/F7FoU3z7yGXMxSorXCkP1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNJ/Al80; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNJ/Al80"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e5733a5aso440812f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907219; x=1788512019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGhN+ilnc4OyW7fR3BEkzBzu80tMPaZCFmBpLkVQFp4=;
        b=eNJ/Al805AXVFnGFATdiL2GImeVtWpoQTdjsH2IDXZHHEsg/0INl0wDZOnuwavB/kz
         EoNLxd6IM3gWqpoPXjANGeeQ0HJZ+gCqStZHrhnZdh4cIKPkRT70KLVEkkX3T/bpIE/c
         RkmQW4wrOKtSxNuD+O6bRWi8oNN7SDTExkmn1Bn5O9wHX/IV4SO887rhbJeyQszqxQoO
         a4aKx9aAq/8aqgu4Xk3b1dfghEVhXNrrmVcYc5VcKIPX44SzcvYAXwmUcAqV3ggchVHC
         6560j9o3topWuHDwPCcoqP49Wz7smBoE/n8z7ni/bEloWgPpQYEQjAi1eaRWUn8bj2QA
         ++xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907219; x=1788512019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGhN+ilnc4OyW7fR3BEkzBzu80tMPaZCFmBpLkVQFp4=;
        b=K3HdYcyyPkQsu99+XpBelsswbf6ptNn4w5J3XVqK9Kry7w5M3MtQDVb8stY5aSvHuk
         UwxP6Y4OPC1X2XPMldUMAa+eWFKEsUbWRYC2EvURiMUdPsW52QETgQoyK+1bHWPxroFa
         tf7I03kljfN79qdRJyXTfMkS+tFVLt+1NndhFtzNvsOUdw3vtNUk5OV6Sej6q/e9neoF
         ASVHxUKSr5p11G/X/K/FnkQWpihn3DlpTzx4a9ORxjynJ5Mvkg1/McTtZf5atOKprnOR
         JoCECYxmaj+Nmxhd/XmDGh7RNLUK4+kxmEsMK54mNO+1zH/qXbjy6jYvKG+owiniAwby
         kZwA==
X-Forwarded-Encrypted: i=1; AHgh+RqMFGpBoqWKmmSjj9gw77oH8MJJhnCvD1FK9D9VcheQsSL1K9Qf2EATZZGPsrkwgg5a8eOk7E8yRBbso6w=@vger.kernel.org
X-Gm-Message-State: AFuF++n5oO1sl8FV85yf9dpZ+lCiiClghCHd6y6CpyQf31FWQVjNPXwt
	E61ePPFlP4SRBjh2R+r7cRSdi2lWRmzKgiljtKWroHv/h/HirDfoyjie
X-Gm-Gg: AR+sD103ZmSmHEkPKKqLp6PbPEyC5DuFcSVOtJ4CKEFe2oFdaiQlKkjLvRDhNgYY9dg
	yTX5L8ov/bVo1fOf70Bp+AhMg8Vdie6W0n29vNT+M1xyXRAGsSbuPpfoOZxahWJdgt9i5Xj3B7Q
	CQVydQbA3MLrbsftdFNMWxlPVaXWOYDV9Gefw3Euy25aefJKUhEyKHoZY4OrThxiS91eEXl+9el
	cPRnc4QY7I33Zbi6vm/FjsHWmNubMoRSSTs781N1yZLEIs4+lWXGIEZOjzTB4G2bpRRh3t86O4b
	wByEMqUI1nN5kj0m+Qpwl+rFVp4TLf5LCQCd5VkpOckghtAvpHvshrpftVuNZ/dqSL7kKxRo/Rv
	UT9oUEXRdXDkZq2OiL5FjFwMjU6i8uKYxmvJs9BdPRX68AcBuczbjPgAIWpqERlbAMbUXFiFKQQ
	oXDhuV3zaHCy0dZMqFKXizYpWHa9QfWB3nmOs+46Yl/pnc/9a1zxIjqmB2wIuJwt0Ouw==
X-Received: by 2002:a5d:5d0f:0:b0:481:5ba5:994c with SMTP id ffacd0b85a97d-482f7a281c3mr7817532f8f.20.1787907219377;
        Fri, 28 Aug 2026 01:53:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm2921103f8f.26.2026.08.28.01.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:38 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Fri, 28 Aug 2026 10:53:36 +0200
Message-ID: <20260828085337.3916199-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085337.3916199-1-mehmet.fide@gmail.com>
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The controller transfers 64 spare bytes per page and the driver only
implements the matching 64-byte ECC layout, so attach_chip() shrinks
mtd->oobsize when the chip provides more. That clamp does not survive:
nand_scan_tail() runs nanddev_init() after ->attach_chip(), and it
restores mtd->oobsize from the memory organization, which still holds
the value detected from the chip. The driver then transfers writesize
plus the chip's full OOB size, the hardware ECC parity ends up at a
different offset than the layout the controller was set up for, and
every ECC-protected read fails with -EBADMSG.

Measured on a Colibri VF61 (MX30LF4G28AC, 2048-byte pages, 112 bytes of
OOB): with the clamp lost, UBI cannot read the erase counter headers of
the pages U-Boot has just written, and the on-flash bad block table
written by an older kernel reads back with ECC errors, so the board
does not boot. Kernels before commit a7ab085d7c16 ("mtd: rawnand:
Initialize the nand_device object") are not affected because nothing
overwrote the clamp there, which is why the same chip works with a v4.4
kernel and with U-Boot, whose copy of this driver has no memory
organization to restore the value from. Edward Karpicz reported that
the clamp no longer takes effect on this chip; see the link below.

Instead of modifying the memory organization, keep the detected OOB
size and give the driver its own mtd_ooblayout_ops: the same layout the
NAND core uses for large pages, but computed on the first 64 OOB bytes
instead of the whole OOB, so the ECC bytes stay where U-Boot and the
old kernels put them. The data paths transfer writesize plus those 64
bytes, as the controller always has.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - keep the detected OOB size and add driver ooblayout_ops computed on
   the first 64 OOB bytes instead of clamping the memory organization
   (Miquel)
 - clamp the spare transfer size in the data paths so the controller
   keeps reading and writing 64 spare bytes
 - drop the truncation dev_info() and with it the %d format for a u32
   (Sashiko report)

 drivers/mtd/nand/raw/vf610_nfc.c | 59 ++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..9104db19dd29 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -505,6 +505,12 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
 				      check_only);
 }
 
+/* The controller transfers 64 spare bytes; larger OOBs keep using the first 64 */
+static inline unsigned int vf610_nfc_spare_size(struct mtd_info *mtd)
+{
+	return min_t(unsigned int, mtd->oobsize, 64);
+}
+
 static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 					 uint8_t *oob, int page)
 {
@@ -522,7 +528,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 		return ecc_count;
 
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
+	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
 	nfc->data_access = false;
 
 	/*
@@ -530,7 +536,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	 * at least less then half of the ECC strength.
 	 */
 	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
-					   mtd->oobsize, NULL, 0,
+					   vf610_nfc_spare_size(mtd), NULL, 0,
 					   flips_threshold);
 }
 
@@ -551,7 +557,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 {
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int trfr_sz = mtd->writesize + mtd->oobsize;
+	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	int stat;
 
@@ -581,7 +587,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 		vf610_nfc_rd_from_sram(chip->oob_poi,
 				       nfc->regs + NFC_MAIN_AREA(0) +
 						   mtd->writesize,
-				       mtd->oobsize, false);
+				       vf610_nfc_spare_size(mtd), false);
 
 	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
 
@@ -599,7 +605,7 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 {
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int trfr_sz = mtd->writesize + mtd->oobsize;
+	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	u8 status;
 	int ret;
@@ -740,6 +746,42 @@ static void vf610_nfc_init_controller(struct vf610_nfc *nfc)
 	}
 }
 
+/* The default large page layout, clamped to the 64 transferred bytes */
+static int vf610_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+
+	if (section || !total_ecc_bytes)
+		return -ERANGE;
+
+	oobregion->length = total_ecc_bytes;
+	oobregion->offset = vf610_nfc_spare_size(mtd) - oobregion->length;
+
+	return 0;
+}
+
+static int vf610_nfc_ooblayout_free(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = vf610_nfc_spare_size(mtd) - total_ecc_bytes - 2;
+	oobregion->offset = 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops vf610_nfc_ooblayout_ops = {
+	.ecc = vf610_nfc_ooblayout_ecc,
+	.free = vf610_nfc_ooblayout_free,
+};
+
 static int vf610_nfc_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -770,12 +812,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
 		return -ENXIO;
 	}
 
-	/* Only 64 byte ECC layouts known */
-	if (mtd->oobsize > 64)
-		mtd->oobsize = 64;
-
-	/* Use default large page ECC layout defined in NAND core */
-	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
+	mtd_set_ooblayout(mtd, &vf610_nfc_ooblayout_ops);
 	if (chip->ecc.strength == 32) {
 		nfc->ecc_mode = ECC_60_BYTE;
 		chip->ecc.bytes = 60;
-- 
2.54.0

