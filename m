Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08AC38E8A4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272329; cv=none; b=Co6oSDae5VOToPju/OvElbmzA+ILHRafSXAvZdYQSFLX4XTxKp74JiYOTQaOqDU3UgU0ymKFPBpJ4sVS8v8v3z9QQG6wpLeT7l0pRoX8xM1VQZk6tbY42kmk9LmqqORH/qQs1GbNNzQRQNd7ZoEkoYG0u0DJYcA3rCdIYLgqNLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272329; c=relaxed/simple;
	bh=ba/GKgzDDScyMYA9/+L/r9vJQ7auFMFBC5kuQrceT2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtHOROgIChtfAFpLmW2HMZcM0NJoO39jVFYSRDzB0Hm5/40obtcdgNn3InOqXwdY+4KoHQ2/TtP8wnPyaD46uUK5H3Zqn5izaiHG5SclPbInXxhc4nGqktVSF5dhlziwDaEaUhEFQDKh0RPTwOTxspbbvf/jI+rPqzC4dhO2+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjLembeA; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjLembeA"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b613d3e19dso1982842eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272324; x=1789877124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoqaJxRX3qT28aClhgaCfrfYghT7IZdjt0FxLg5X70U=;
        b=pjLembeAD97qbKETPVFjOJNtl00Rd5myhDAoay/6waCmm0uOOe8ZS5VYdn676wwqQy
         imbiA7w/o9BaeTT6kBSwFIPc4wP7Cz7EZosy3PIUvQMWjSMtGa1aMFA6oN0e2BBMIdOd
         Yd3KkF+oMbVyZnSwAReSPPp/39kYnDiVPW8oPp2bMAhfV8NvW1ZV+ZXoRuUma5c6wP3S
         0wYMHoBzLbqlWkFNWVyL1hV41jJ77zVydog8OXh9yGifiHWimZ324sQD8MhOQqyMJ5OZ
         r2MoSfJc2g9A7+Lr9K7B45ybR/gdjNiobAyRSpIayduoIa4RAXWT0AEk4ybjAJDvlKBd
         p8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272324; x=1789877124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoqaJxRX3qT28aClhgaCfrfYghT7IZdjt0FxLg5X70U=;
        b=sAWXePvpLCsc0Y5kC5swFChlaOWJ5Czp4M8bR82obBjCaLkw/VWFmk6A5nUQM61/g3
         mhO1RuP0KTX0o54N36lIat38FvKXlWKAHKTaN51TstmxUboxUOily1H8wByzGEumqI1x
         GYBdLWfAbwBJywqNWjdpgteJ0e64mgY5ZXMcUVacRyZm0xRRmrQAAxE7mucLuhMxIaJj
         sZOzmpnBMeS5fc0MiNjA9knHPYGyFCMDqDPseu6qV7BI1+EDwcGyRp6cutgV6Y2Qj5vk
         W7/Vy+3y9z2JKkB4tFcjpviXmW13ojQf2Asp3LFwkJEY1aK1rmoATtdh1q9eg5jObKgl
         CSmw==
X-Forwarded-Encrypted: i=1; AKwUvBwXksbJ6e4rpzd0DhL6FZ0whQK9Y2n76XHeHPK78rGbCz977QvwvNtcBQ5HJffJpB/aVGS4KwrVAI/4lQE=@vger.kernel.org
X-Gm-Message-State: AFuF++nCxYuz10ilqgUWBS2LKBg0I1Xg8peyLzk6LbikiQxUngLrM84F
	2h0+f+XvbHBzh6q9psiXTD41ZFys6zuIxMa0+ucpuX8g2naoW2bxhSmZ
X-Gm-Gg: AYBFou1Pb8KFvWvIrieN3wGviX6BEbIep44v4M7v4UV6MO9R0sdhI0g7L4yR7ixaAJh
	3Bq+tjxqfaVQX0zyVi+JBI/KCuXt2qPiDg6QwcLXotrFav5aJu2P987vV6Cv1nw7rQ4ESwkuZXp
	1Mc4+AmS3nguNOj5h0FVVwERxeAPjv4Z8HayECpREBW2AM7Id2QAHnVQRjMZ9NNx78EBXQcCJbT
	zswFmV9rIyPc3yK93czDyJRjI6B6YqZ/YNWDgAUTervO0UwRhVdnGN+x9HKnzD6z10LI4SFWTmM
	o+IEM75kK4F6j8S9+dOmg74UO0Rr8W8Gb24Sbjoz90VsGTbe1rTXP9rwDcqyHbzDPcSZlXznM16
	3YVwirHj792dD9hM5FPbAq5TZC7O3l0bCdCNqhPbbcbmewZxpRvCrhst4Ay6FhQWHwTnEo0fSzX
	ycGu3ATgOeS6ou1EBHNeB0CjnssUteeITcgHZ46nEonbQ39lkLafzOPkRhZOTsF9szFZyRuCyVo
	S8paHALRnDudiY8UoG95h7Se6QqLRTKJnCIvILBP7GDT4R9xhDzmZOGENht/rqMa7FKk5t/vPtP
	vY+41EbjBdjTbIG9xMSlpfr2VrRqbdZb45+IfINlhAPmMvg9FysGuNTy5e18PBI+iv4zcW47lp9
	UIRoTWw9i86bA/ZzVq2/hpRyxGFHtTQ==
X-Received: by 2002:a05:6820:2907:b0:6b5:ec2f:356a with SMTP id 006d021491bc7-6c3ce8c4c5emr400751eaf.27.1789272323609;
        Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:02 -0600
Subject: [PATCH v4 11/17] mtd: rawnand: sunxi: support randomized OOB
 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-11-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
when the randomized format encounters an ECC error. Older controllers
require eight exact 0xff spare bytes, with the vendor spare-scan shortcut
for four exact bytes on the first page and pages 127 modulo 128 within
each eraseblock. Apply that shortcut only with the vendor's 1 KiB ECC
steps. H616 requires byte zero and at least nine of ten bytes to be 0xff.

Reconstruct the physical spare prefix from the protected user-data
registers, padding unavailable bytes with 0xff. Each ECC step restarts its
OOB randomizer; account for this when gathering the prefix from fixed
four-byte user-data fields. Accepted erased pages return all-0xff main
data and OOB without an ECC failure or a raw reread.

Also follow the vendor's all-zero-page override: when every ECC step
reports an all-zero physical pattern, return zeroed data and OOB with an
ECC failure, even if the hardware did not report one. Keep the ECC
exception disabled in this mode so uniform data still undergoes decoding.

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
 drivers/mtd/nand/raw/sunxi_nand.c | 270 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 261 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 40746686142b..725cc302df9f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -265,6 +265,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -277,6 +278,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -328,6 +330,7 @@ struct sunxi_nfc_mdma_desc {
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
  * @timings:		Controller timing characteristics
+ * @spare_is_erased:	Vendor erased-page check on the physical spare prefix
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -356,6 +359,7 @@ struct sunxi_nfc_caps {
 	unsigned int max_ecc_steps;
 	int sram_size;
 	const struct sunxi_nfc_timings *timings;
+	bool (*spare_is_erased)(struct nand_chip *nand, const u8 *spare, int page);
 };
 
 /**
@@ -861,12 +865,18 @@ static void sunxi_nfc_randomizer_disable(struct nand_chip *nand)
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
@@ -974,7 +984,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	}
 
 	/* Undo hardware de-randomization for a plain on-flash BBM. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1035,7 +1046,8 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -1103,6 +1115,37 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
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
+	if (status & NFC_ECC_ERR(hw_step)) {
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
@@ -1145,7 +1188,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       int logical_step, bool oob_required, int page)
+				       int logical_step, bool oob_required, int page,
+				       struct sunxi_nfc_ecc_status *result)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1194,6 +1238,16 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
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
@@ -1295,6 +1349,153 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
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
+		ret = nand_change_read_column_op(nand, mtd->writesize + off,
+						 nand->oob_poi + off,
+						 ecc->bytes, false);
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
+		ret = nand_change_read_column_op(nand, mtd->writesize + off,
+						 nand->oob_poi + off, len, false);
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
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
 					    int oob_required, int page,
 					    int nchunks)
@@ -1304,6 +1505,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_status result = {};
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
@@ -1366,6 +1568,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		bool erased;
 		int bitflips;
 
+		if (sunxi_nand->randomized_oob) {
+			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, status,
+						       pattern_found);
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+							    page, user_data_sz);
+			continue;
+		}
+
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
 						    i, status, pattern_found,
@@ -1393,6 +1603,10 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							     oob_required, true, page);
+
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int data_off = i * ecc->size;
@@ -1524,6 +1738,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_status result = {};
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
@@ -1546,13 +1761,19 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
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
@@ -1598,6 +1819,10 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	int ret, i, cur_off = 0;
 	unsigned int max_bitflips = 0;
 
+	/* The vendor spare test and all-zero detection classify a whole page. */
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
+
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -1618,7 +1843,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 						  oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips, i,
-						  false, page);
+						  false, page, NULL);
 		if (ret < 0)
 			goto out;
 	}
@@ -1637,6 +1862,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
+	if (to_sunxi_nand(nand)->randomized_oob)
+		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
+
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -2249,6 +2477,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->strength *= 2;
 	}
 
+	/* This format requires an ECC step that fits in the page. */
+	if (sunxi_nand->randomized_oob && mtd->writesize < ecc->size)
+		return -EINVAL;
+
 	/* Add ECC info retrieval from DT */
 	for (ecc_mode = 0; ecc_mode < nfc->caps->nstrengths; ecc_mode++) {
 		if (ecc->strength <= strengths[ecc_mode]) {
@@ -2317,6 +2549,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, ecc_mode) | NFC_ECC_EXCEPTION |
 				  NFC_ECC_PIPELINE | NFC_ECC_EN;
 
+	/* Run ECC on uniform data too, so the randomized spare bytes are decoded. */
+	if (sunxi_nand->randomized_oob)
+		sunxi_nand->ecc.ecc_ctl &= ~NFC_ECC_EXCEPTION;
+
 	if (ecc->size == 512) {
 		if (nfc->caps->has_ecc_block_512) {
 			sunxi_nand->ecc.ecc_ctl |= NFC_ECC_BLOCK_512;
@@ -2331,6 +2567,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2340,6 +2578,14 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
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
 
@@ -2569,6 +2815,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {
@@ -2847,6 +3096,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2870,6 +3120,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2896,6 +3147,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
 	.timings = &sun50i_h616_nfc_timings,
+	.spare_is_erased = sun50i_h616_nfc_spare_is_erased,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0

