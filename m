Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35AD4A2E19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420220; cv=none; b=BsNHglgzEokG7B2ptO//OIkhFkFAjJVnqrXtVCu2ziHkocPuinAxW7cqZj/22p9DcC07hcQzaXXNBUvcUNr6aU2a8Gpa5XgVpZCTl/Gjcq45EX2UypkAE52keFW8U0n2IMxM73yRpHHOxtIlkF3QfEPrgPf9lR0ROkv0+D7Zqbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420220; c=relaxed/simple;
	bh=pkxkYvAECUM2dxAA9qSlcoZx37otQGFTR85S/Ac1keQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrYWvIoKBMu/6Z5BEZs/0Se6XEasmtFdwphxuQVu1PYBXACfFmWOdWvTob5t1mqCO93hIK1p9vXBMPrHlu5G4pcT7NTXfvdLckURuXuNztSkQ8GbYPUEqKS3UhDvMHu9lOmLgrpdWO6+oekbXobVs+PUfZi4I0yU0TCdZyhMntE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUbrTshp; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUbrTshp"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c24d19ebcfso1395793eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420213; x=1790025013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PM3/kqI6jzm2niMT/a23gQ0WVuxg3p+u/T3bZIK5RE8=;
        b=iUbrTshp++bGGEC0D6ArCJ9VtSxdZAvOjP/ZJLu/2NwTA74kfMtxTM6F0b/Udh+Y8t
         IrB36IeXoAi12hwTdxVrnA4g6mwiHu7FfmbzQLvwILqLWkUhbicCgBrnZZn4B4JuDcCQ
         Qw86fNNOt8Ne3GuMeRTB2R+MR6UWc0YDoLmoThL+RGfb/TG0GKw7nmT1kjH9scfdvECn
         VoixjET8NJPs2ygrbkoNfUmzhHnpGqyF1M4dVqpsUCryy/v7cpiZDdaBqvL51d1NchUx
         SVzhF11lFvy7rbtS9XAQXwyXN3s0p9o2rieR3Yx+lThlrsICqP8ib8w6Pk9G5SL/i4Z0
         D9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420213; x=1790025013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PM3/kqI6jzm2niMT/a23gQ0WVuxg3p+u/T3bZIK5RE8=;
        b=iShrHKZ0PVmSeDG5N19tp/6WXRIOT5Ki2sENaoNIYD9ykE2cSUUWI7gAO6ApL/oBz6
         49DOXX1TmyGr7xU1adsaecWvtDHEfYt6fNhhuyIIgx3Az68mCeB+gHfaQnW7XdJtVfoI
         zACv1X36tIn/r2bgzUF3b5pZZeS1LK3joDISq7eOgXcsojQh+DFeFN9Ga3Xn7epDCa4q
         rZR2xt5aWfEmr5iu4/fuLL3tgoeKrnVtMs384J6kEfqV+6TQx4dzArcC3G9bSaJy8qSQ
         zMzeAh7aPLiGpVFSkxY+kZhfSmpyhHP1M1+I4P1kowMPwGaQrtCucnaSJkkoXCABX19K
         f0aw==
X-Forwarded-Encrypted: i=1; AKwUvBzgzjj6xnX3qlfnmrdHGNylphpWhXnCrdcU55CTK/1GuiGixbL8rpuq1PblpbRmSzrqWEhHeXAFYGDty/k=@vger.kernel.org
X-Gm-Message-State: AFuF++n/dCII7bBKuKoansjjT+M+SLnVamGT0TQYQE8GqWhocWdF1pHj
	oVqKGSToX4/9mvbIsSK4nyFfGBQj4jTdvt8tbFYs5U+rdvK78WFLj4AU
X-Gm-Gg: AYBFou0FbuZqWtsjktXZz2LKKEsCEJySIcgyx8sVjuNNjCGWfOdU4UOyXsGHx0KQFFk
	ujPMew5U6zmES2nnuAAaXA5GE23QZL+CwZ78NYJh1CAOEg5cCPRkSIQYFDusX93xDVw0IYG19ry
	skQrJCI7fBdtd2bcgunVMwcrd26PTx0oMkx7CkZ8O7dd0dfEqWFjHL5XXi6i+CPS+iyjyBYZR2m
	aD8/9zdNUwG4J2QreYI2EMIU1eTjGgppix3BIklLbY1O5WpTA3NUp0VTUMGUfNvIRWjJh0FJyf0
	zIGMqnlVQCK6LCO2nnbXTAHueiaIwoJLd1otTV2LrIhbeeoZLhu2i7oaDf5AVBBF/fkQz1mJVOf
	wnXCHEBtAhvqaFDISB1gRV8++IvPTE3Q0qywA4DETpTMfB0xI8AuG7FpXqUeEqrMPoGRu/EIwwq
	ZX/RyA6/USKyNNqEgMtvQyL+4LBOa1S6Xbg5W9sUGeK5HQ6iKBoifmsaIvMWUKpW37/Xt8Q5kV7
	5Z/8lv0ZS/YSqTasiKR+ipEiSD+/2RWr9T35v506HfKYn6fTJDQfP2CYP1X2jarIEN8PwwRm0Bm
	52QOkyQnZYZkzzBPgmyvf5THmQln/V6pNuS2hgOgoNBmP3IB/DEhIh2sUmEVAOSDEl3GMIYKSqS
	wg+Rj91GIaXoqo92XfCkBU05D3oC+
X-Received: by 2002:a05:6820:3091:b0:6c1:e01b:3b32 with SMTP id 006d021491bc7-6c541f45b17mr4443872eaf.33.1789420213021;
        Mon, 14 Sep 2026 14:10:13 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:59 -0600
Subject: [PATCH v6 13/18] mtd: rawnand: sunxi: support randomized OOB
 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-13-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The controller randomizer covers the bad block marker along with the
rest of the OOB data. The driver currently compensates the marker bytes
before writes and after reads so that they remain plain on flash.

Allwinner NAND firmware instead stores the marker through the
randomizer. Media using that format appears to contain bad blocks unless
the randomizer is enabled while reading the marker.

Honor the allwinner,randomized-oob property by marking the NAND as
requiring scrambling during normal hardware-ECC transfers and leaving
the marker in the randomizer data stream. Keep the existing plain marker
behavior when the property is absent. Reject the property with software
or disabled ECC because those paths do not operate the controller
randomizer.

Also reject an ECC step larger than the page so the NAND core cannot
fall back to software ECC after the driver's initial engine-type check.

Select the vendor's erased-spare predicate through the SoC capabilities
when the randomized format encounters an ECC error or physical pattern.
Older controllers require eight exact 0xff spare bytes, with the vendor
spare-scan shortcut for four exact bytes on the first page and pages 127
modulo 128 within each eraseblock. Apply that shortcut only with the
vendor's 1 KiB ECC steps. H616 requires byte zero and at least nine of ten
bytes to be 0xff.

Reconstruct the physical spare prefix from the protected user-data
registers, padding unavailable bytes with 0xff. Each ECC step restarts its
OOB randomizer; account for this when gathering the prefix from fixed
four-byte user-data fields. Accepted erased pages return all-0xff main
data and OOB without an ECC failure or a raw reread.

Also follow the vendor's all-zero-page override: when every ECC step
reports an all-zero physical pattern, return zeroed data and OOB with an
ECC failure, even if the hardware did not report one.

Keep ECC exception mode enabled for physical-pattern reporting, as in the
plain-marker format. Uniform physical steps can suppress hardware ECC
errors, so treat them as requiring page classification and do not use
their correction counters. Otherwise physically erased pages or mixed
uniform/encoded pages could incorrectly appear to have decoded
successfully.

Keep the original hardware-decoded main data and protected OOB on other
ECC failures, and report the failure through the ECC statistics. Bad-block
and BBT pattern scans inspect these buffers even after an ECC error; they
must not see the physical randomized representation. Preserve the normal
per-path representation of unprotected OOB bytes when they are requested.

Share page classification between PIO and DMA, including subpage reads.
Read the whole page for randomized-format subpage requests so that both
paths see the same spare prefix and all-zero-page status. Defer statistics
until OOB reads have succeeded, so a DMA-to-PIO retry is accounted once.
The plain-marker format keeps its existing physical erased-chunk check.

MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
randomization and expose the physical representation. This changes marker
handling on all supported controllers; the H6/H616 protected user-data
placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 280 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 270 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c55537bc71e1..42c5f782db40 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -266,6 +266,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -278,6 +279,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -329,6 +331,7 @@ struct sunxi_nfc_mdma_desc {
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
  * @timings:		Controller timing characteristics
+ * @spare_is_erased:	Vendor erased-page check on the physical spare prefix
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -357,6 +360,7 @@ struct sunxi_nfc_caps {
 	unsigned int max_ecc_steps;
 	int sram_size;
 	const struct sunxi_nfc_timings *timings;
+	bool (*spare_is_erased)(struct nand_chip *nand, const u8 *spare, int page);
 };
 
 /**
@@ -862,12 +866,18 @@ static void sunxi_nfc_randomizer_disable(struct nand_chip *nand)
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
-static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
+static void sunxi_nfc_randomize_buf(u16 state, u8 *buf, unsigned int len)
 {
-	u16 state = sunxi_nfc_randomizer_state(nand, page, true);
+	while (len--) {
+		*buf++ ^= state;
+		state = sunxi_nfc_randomizer_step(state, 8);
+	}
+}
 
-	bbm[0] ^= state;
-	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
+static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
+{
+	sunxi_nfc_randomize_buf(sunxi_nfc_randomizer_state(nand, page, true),
+				bbm, 2);
 }
 
 static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
@@ -968,6 +978,7 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
 	unsigned int i;
@@ -978,7 +989,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	}
 
 	/* Undo hardware de-randomization for a plain on-flash BBM. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1035,11 +1047,13 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 	unsigned int i;
 
 	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -1107,6 +1121,43 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	return ret >= 0;
 }
 
+/* Accumulate a whole randomized-OOB page before classifying its spare data. */
+struct sunxi_nfc_ecc_status {
+	u32 error_steps;
+	u32 zero_steps;
+	unsigned int corrected;
+	unsigned int max_bitflips;
+};
+
+static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
+					   struct sunxi_nfc_ecc_status *result,
+					   int logical_step, int hw_step, u32 status,
+					   u32 pattern_found)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 count;
+
+	if ((pattern_found & BIT(hw_step)) &&
+	    !(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))
+		result->zero_steps |= BIT(logical_step);
+
+	/*
+	 * Exception mode can suppress the ECC error for a physical pattern.
+	 * Classify these steps with the vendor page check too, and do not use
+	 * their correction counters. Keep their decoded data until then.
+	 */
+	if ((status & NFC_ECC_ERR(hw_step)) ||
+	    (pattern_found & BIT(hw_step))) {
+		result->error_steps |= BIT(logical_step);
+		return;
+	}
+
+	count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
+	count = NFC_ECC_ERR_CNT(hw_step, count);
+	result->corrected += count;
+	result->max_bitflips = max(result->max_bitflips, count);
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int hw_step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
@@ -1149,7 +1200,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       int logical_step, bool oob_required, int page)
+				       int logical_step, bool oob_required, int page,
+				       struct sunxi_nfc_ecc_status *result)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1198,6 +1250,16 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, hw_step,
+					       readl(nfc->regs + NFC_REG_ECC_ST),
+					       pattern_found);
+		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+		sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step, bbm,
+						    page, user_data_sz);
+		return 0;
+	}
+
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
 					    pattern_found, user_data_sz, &erased);
@@ -1298,9 +1360,156 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 	return 0;
 }
 
+static bool sun4i_a10_nfc_spare_is_erased(struct nand_chip *nand,
+					  const u8 *spare, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	unsigned int block_page = page % mtd_div_by_ws(mtd->erasesize, mtd);
+
+	/*
+	 * The older vendor spare scans recognize exact four-byte erased
+	 * signatures on page zero and pages 127 modulo 128. With their
+	 * 1 KiB ECC steps these correspond to four physical 0xff bytes.
+	 * Other pages require all eight spare bytes to be 0xff.
+	 */
+	if (nand->ecc.size == 1024 &&
+	    (!block_page || block_page % 128 == 127) &&
+	    !memchr_inv(spare, 0xff, USER_DATA_SZ))
+		return true;
+
+	return !memchr_inv(spare, 0xff, 8);
+}
+
+static bool sun50i_h616_nfc_spare_is_erased(struct nand_chip *nand,
+					    const u8 *spare, int page)
+{
+	unsigned int erased = 0;
+	int i;
+
+	/* Byte zero and at least nine of ten bytes must be 0xff. */
+	for (i = 0; i < 10; i++)
+		erased += spare[i] == 0xff;
+
+	return spare[0] == 0xff && erased >= 9;
+}
+
+static bool sunxi_nfc_hw_ecc_spare_is_erased(struct nand_chip *nand, int page)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	u16 state = sunxi_nfc_randomizer_state(nand, page, true);
+	u8 spare[10];
+	unsigned int len, pos = 0;
+	int i, off;
+
+	/*
+	 * Reconstruct the physical spare prefix from the hardware's decoded
+	 * user data. Each ECC step restarts the OOB randomizer; H6/H616 pack
+	 * the entire prefix in step zero. Pad unavailable bytes with 0xff.
+	 */
+	memset(spare, 0xff, sizeof(spare));
+	for (i = 0; i < ecc->steps && pos < sizeof(spare); i++) {
+		len = min_t(unsigned int, sunxi_nfc_user_data_sz(sunxi_nand, i),
+			    sizeof(spare) - pos);
+		off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+		memcpy(spare + pos, nand->oob_poi + off, len);
+		sunxi_nfc_randomize_buf(state, spare + pos, len);
+		pos += len;
+	}
+
+	return nfc->caps->spare_is_erased(nand, spare, page);
+}
+
+static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
+						 bool dma, int page)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int len, off;
+	u16 state;
+	int ret, i;
+
+	for (i = 0; i < ecc->steps; i++) {
+		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
+					    nand->oob_poi + off, ecc->bytes);
+		if (ret)
+			return ret;
+		/* Preserve each path's normal representation of ECC bytes. */
+		if (!dma) {
+			state = sunxi_nfc_randomizer_state(nand, page, true);
+			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
+			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
+						ecc->bytes);
+		}
+	}
+
+	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
+	len = mtd->oobsize - off;
+	if (len) {
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
+					    nand->oob_poi + off, len);
+		if (ret)
+			return ret;
+		/* The unprotected tail uses the page seed and its 15-bit advance. */
+		state = sunxi_nfc_randomizer_state(nand, page, false);
+		state = sunxi_nfc_randomizer_step(state, 15);
+		sunxi_nfc_randomize_buf(state, nand->oob_poi + off, len);
+	}
+
+	return 0;
+}
+
+static int
+sunxi_nfc_hw_ecc_finish_randomized_read(struct nand_chip *nand, u8 *buf,
+					struct sunxi_nfc_ecc_status *result,
+					bool oob_required, bool dma, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int ret;
+
+	/*
+	 * The vendor treats an all-zero physical page as bad, even without
+	 * ECC errors. This takes precedence over the spare-byte heuristic.
+	 */
+	if (result->zero_steps == GENMASK(ecc->steps - 1, 0)) {
+		memset(buf, 0, mtd->writesize);
+		memset(nand->oob_poi, 0, mtd->oobsize);
+		mtd->ecc_stats.failed += ecc->steps;
+		return 0;
+	}
+
+	if (result->error_steps && sunxi_nfc_hw_ecc_spare_is_erased(nand, page)) {
+		memset(buf, 0xff, mtd->writesize);
+		memset(nand->oob_poi, 0xff, mtd->oobsize);
+		return 0;
+	}
+
+	/*
+	 * Keep the original decoded main and protected OOB bytes on ECC failure.
+	 * BBT pattern scans inspect them even when an ECC error is reported.
+	 * Read the remaining OOB only when requested, not to classify the page.
+	 */
+	if (oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_unprotected_oob(nand, dma, page);
+		if (ret)
+			return ret;
+	}
+
+	mtd->ecc_stats.corrected += result->corrected;
+	mtd->ecc_stats.failed += hweight32(result->error_steps);
+
+	return result->max_bitflips;
+}
+
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 					   int oob_required, int page,
 					   int first_step, int nchunks,
+					   struct sunxi_nfc_ecc_status *result,
 					   bool *erased_chunk_found)
 {
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
@@ -1383,6 +1592,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 
+		if (sunxi_nand->randomized_oob) {
+			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i, status,
+						       pattern_found);
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
+							    page, user_data_sz);
+			continue;
+		}
+
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
 						    i, status, pattern_found,
@@ -1409,6 +1626,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
+	if (sunxi_nand->randomized_oob)
+		return 0;
+
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int logical_step = first_step + i;
@@ -1438,7 +1658,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 					    int oob_required, int page, int nchunks)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct sunxi_nfc_ecc_status result = {};
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
@@ -1448,13 +1670,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
 		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, buf, oob_required, page,
-						      first_step, batch_steps,
+						      first_step, batch_steps, &result,
 						      &erased_chunk_found);
 		if (ret < 0)
 			goto err_stats;
 		max_bitflips = max_t(unsigned int, max_bitflips, ret);
 	}
 
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							     oob_required, true, page);
+
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
 						      NULL, !erased_chunk_found, page);
@@ -1564,6 +1790,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_status result = {};
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
@@ -1586,13 +1813,19 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips,
-						  i, oob_required, page);
+						  i, oob_required, page, &result);
 		if (ret < 0)
 			goto out;
 		else if (ret)
 			erased_chunk_found = true;
 	}
 
+	if (sunxi_nand->randomized_oob) {
+		ret = sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							      oob_required, false, page);
+		goto out;
+	}
+
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
 						      !erased_chunk_found, page);
@@ -1638,6 +1871,10 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	int ret, i, cur_off = 0;
 	unsigned int max_bitflips = 0;
 
+	/* The vendor spare test and all-zero detection classify a whole page. */
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
+
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -1658,7 +1895,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 						  oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips, i,
-						  false, page);
+						  false, page, NULL);
 		if (ret < 0)
 			goto out;
 	}
@@ -1677,6 +1914,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
+	if (to_sunxi_nand(nand)->randomized_oob)
+		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
+
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -2308,6 +2548,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->strength *= 2;
 	}
 
+	/* This format requires an ECC step that fits in the page. */
+	if (sunxi_nand->randomized_oob && mtd->writesize < ecc->size)
+		return -EINVAL;
+
 	/* Add ECC info retrieval from DT */
 	for (ecc_mode = 0; ecc_mode < nfc->caps->nstrengths; ecc_mode++) {
 		if (ecc->strength <= strengths[ecc_mode]) {
@@ -2391,6 +2635,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2400,6 +2646,14 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (sunxi_nand->randomized_oob &&
+	    ecc->engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return dev_err_probe(nfc->dev, -EINVAL,
+				     "Allwinner OOB format requires controller ECC\n");
+
+	if (sunxi_nand->randomized_oob)
+		nand->options |= NAND_NEED_SCRAMBLING;
+
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		nand->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -2629,6 +2883,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {
@@ -2907,6 +3164,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2930,6 +3188,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2956,6 +3215,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
 	.timings = &sun50i_h616_nfc_timings,
+	.spare_is_erased = sun50i_h616_nfc_spare_is_erased,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0

