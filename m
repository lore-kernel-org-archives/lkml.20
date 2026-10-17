Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B548383C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266379; cv=none; b=dWMCLdzdUU1HeO9O4zq1ouSJlH/NUFD8pEnEJv/8oqsuKPWkIln435tEYa9Fl5pqNSaYJ0ZUccrunpOlzHrWw5/kgfoJARM6Y+ovLWslb1ZFjaTw6nFc+D69sJDmwEeNaJgqVKoNCMRpLZwAV5kdMY0GkhvXdvQNTySUBZsCf2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266379; c=relaxed/simple;
	bh=PJq0iEolMY6uVtFxaIfsS4AZnFgRVydGROpNIIiX3+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDT+1+FCq20kNj/dKkGmjhzm3blSUWI572w2w4YD8NK9rLDvFDfMxUy0p4UP+X+854JU42lEV2om49eLibogKAKBPwGo2N2PjIMcUWq3l0R+ijkIS9ibFwHDxid4pg74xP/4fXbu/4rcjAkRHrCFpQ/uZxvHakvvdPnRcKgZJzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URGvIRVi; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URGvIRVi"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b28d7c729fso502705b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266376; x=1792871176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiS913ksGIJSVrc+zKFDmT0Cphd5sQs3qd5ybGaSzjA=;
        b=URGvIRViSFlkzbDJxRMG+GTUpkIKZywZlulW1WDTz2OCmOqhRHIXTvh0pSnf8KBFub
         d65JLmDN4E+hh+/dhmSBx6TRigFbTjqn01tENT6K6rMnGiYVX+uykVO15+7Mk/mOCaQ6
         zHBVzKgrps0a5FeWc8TQyMFp2FVa5rz1Nl4BExzcKFSnTQTT0PYcXFs4ZmSyv/h8QbzA
         uxV4LM4RJJW2yN+qhTR/Tds90J+u0CfOfJ9hpYlzupU+20ZKAdN0h2ynlCc5o2/Bi48i
         r2eMHXeEAz02o2XyKK3cI/JcukBBa+eqzGFpfTy03Aq6kOTBOHeBzoICF166wzfq89zf
         nHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266376; x=1792871176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiS913ksGIJSVrc+zKFDmT0Cphd5sQs3qd5ybGaSzjA=;
        b=zj6zYPQLAbOIZ0sUCcd2Ya1VttRlW48zk3urDS8VBz2tPj2HPe2pd6tienzUXsrUm+
         kXXf96gChA2nuQFI2ujtlo/tZfZf2YUL/iUKFLCc30zLxOB0qzW5leDtBm6ueOpcKUBa
         mKUGqlmPHtfXK7QVNVwjd/HcsW+MNlaTKGqixj3TKMAHCU7ZphZUX0+s88J8SNV2Em3t
         PWUwpXIahi3cbxfPdr9voRsBbVnG3vPzJ1aGIqvmOmwLjdJlhQR0rHa04eykofl018ot
         YgpNcHRdpcpNcfxfv4gyP3TvUiHsiykQBAxDcWCS/U2ID3mf4K2LYXnb2IjBeHu+lswK
         cdZw==
X-Forwarded-Encrypted: i=1; AKwUvBxIzEloyQJ32yBNHbBsAFJWuhUjeZCUP/qFOiRClCAsecKt7lHfQXfRN2Gqkklf7PU3R7vAFwObgz3Wf9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY7znuInUWMeoOkOpviIDBvc+VEi7ouEt+PADr9JfsVM9XKVOr
	THMvuL8i/4k9Z+lPHtO8tVMu9F7rBqD1JJ4VxFLXMULCxARO1zwri/NO
X-Gm-Gg: AYBFou3RolWlIpu+yIkiUvOrGbtEz1wHWdwayHAazzUrYpfPBvG9MTTPmk4WqIslSnL
	eQweB/sH2pC/7o+64cDrE3NCU+BzW1eiT3oBHYGaYyVrYJK8tWKUaWROurfQ89b495GmbogyvyI
	N8+wqZCK24yLXFr/di/Wh4553d8KAFyYmGHM7z4AZ9shuOxQjVrzkO1KrD0H33eHtrAZ+85y9mu
	LQ+O1yBH7MN/NlTB9GUTbdlTCNA+5lqjVfkbsZ61grYIXfngZGikLU1NVm2Xl842t0IHhH0cPx5
	UahSir5KTI+7PphfkK6ioPv6TiB/sNiBjNNil0SIKyBqi/xTBt1BBzVqdG1zR1y+NxQXWbcJNhO
	4iTYOR9Aobf76DP/rkpQWLZWMM8O+Psm1xebVzUJApvtQe5rRcByx+m1Rn50LRiDCVbXD8VFkzg
	3Zvyd0uCTIINfrTMG2XV8P3q8PzqzjiHmvhxmZPnnbbOJLihL8OYzE7pBkHKinjtUA2jmW/Awf+
	J6WLXa1FlrZX3h3cH23pRbLHDGJQA0q4fTydT2326ZAmAFI4n4/QcFwggNlKC81Hm5VXtUCuef4
	FSz05sByA8gLmd5zibnXr9GNbnkR7qRyCSTvoTGZG6wezLxuP+0NJkcc+7etcJQ2/uzumctSyhr
	byz1UfRtfXxjcf0MAjzye
X-Received: by 2002:a05:6808:c20f:b0:4f7:1e2:e79d with SMTP id 5614622812f47-53ccf2f073emr2926874b6e.40.1792266375636;
        Sat, 17 Oct 2026 12:46:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:58 -0600
Subject: [PATCH v9 03/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-3-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

PIO transfers each logical ECC step through hardware slot zero. On
H6/H616, user-data lengths can differ between logical steps: step zero
can have 32 bytes while a later step has only 16 or none.

sunxi_nfc_hw_ecc_correct() uses the hardware slot to select that length
when filling pattern data. A pattern detected in a later PIO step can
therefore overwrite the following OOB region with step zero's longer
length. The protected-OOB write helper makes the same mistake when
loading slot zero, reading bytes beyond the current step's user data.

Pass the logical step's user-data length explicitly to both helpers.
Separate that length from the user-data register offset: PIO always
starts at register zero, while DMA advances by each preceding step's
length in four-byte words. Update both DMA callers with the helper
contract so variable-length steps continue to use the same registers.
Fixed four-byte layouts and the on-flash geometry are unchanged.

The mismatched logical and hardware indices were found by code inspection
while consolidating the PIO and DMA OOB paths.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 106 ++++++++++++--------------------------
 1 file changed, 32 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index bd2193d7259d..4ff19da8b98d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -937,45 +937,22 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm)
-		sunxi_nand->oob_ops->transform_bbm(nand, page, oob);
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
+	if (bbm && ops->transform_bbm)
+		ops->transform_bbm(nand, page, oob);
 }
 
 /*
@@ -1026,48 +1003,26 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm) {
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
+	if (bbm && ops->transform_bbm) {
 		memcpy(user_data, oob, user_data_sz);
-		sunxi_nand->oob_ops->transform_bbm(nand, page, user_data);
+		ops->transform_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1120,11 +1075,9 @@ struct sunxi_nfc_ecc_read {
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1223,10 +1176,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
-	unsigned int user_data_sz;
+	unsigned int reg_index = 0, user_data_sz;
 	int i, ret;
 
-	for (i = 0; i < nsteps; i++) {
+	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
 		int step = first_step + i;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
@@ -1238,7 +1191,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1267,7 +1221,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1456,7 +1410,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1682,6 +1637,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1702,8 +1658,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
+		reg_index += user_data_sz / 4;
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

