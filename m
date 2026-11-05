Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904966;
	b=B2BTd6EPygwOQdEDlSI5y8/V8IKUUfGQzxSi/oXl831vn4uEMdb7OOVnd3EyFd3+L6cM
	 L180vsJK29k8LqOkNPcfN9+2LxqetCripx06BYEbf99Sk+PsgJtnfeJZTMoNqnQRy4Utp
	 zFJEhEWiAljAXH5hFODu8hPbcdht6PiDmAJwNNduozSCKNuWdi2ESa+QJo1J56KqtAaGU
	 dLttfrS2I1obg1fODsBoOXvHgYHly5KEX00gJzj7clcr+hm1HblyMWTBdTT8kiIOGhNcT
	 Z4s6gAaz8xIHv2fMRQAPkOby7vQxgpRrjZqeMlevo5Vi79/aMRHQdPiTK4mi9Thz4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
	b=S8TKUP26WRwbEOi2seTWNoGnxUsTFLzrzNhmr5xaVY5pmPAdeXfRJz8qGMzEcqv4xqmN
	 0NmUIOI0MElrxOKAQPDuNZ748Pt4WXq1Tlo5CqVVjTmlNehF7SuPiyzqBfXtwWxNHElTo
	 NbfjYcj1JHFHVNfuZUL5JE4wVgp0kcyKfmkI3WanA0LwzxpNh58eB4ZW5jSdWixXtEg2u
	 mxuCyON6DI3F3k5j6kei83TkS2ou2dQP7iYS+tqiAvKC9cmwsGBQN1ifdYK+VRe5OYS8n
	 OoH/1noi7Xj0y6xeZlufRf6pf5jKHEz/p1/nn+QaQGn8ap0mxrkQCGEs4e7fCynJlyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3e5AYPZ;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554A606EEB3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E554A606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3e5AYPZ
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d68de53053so1245078eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904965; x=1794509765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
        b=x3e5AYPZX8UzQBEWmXVSoQy5JHsuQXKvXcZ3RxIZF4MNzqPwaz2aZOPo+jlV0JGC6N
         PR29VNggohtowiCe6kKxCTKmoxoycaPn1Z6HLLN0NO0eWp/CVwxRfGG/UGe2I643nvac
         Tz/8HB+ciBlnfnT6D1FboEjPkllMQGdGmPkM5qBQWfIuDuh3F5IZhkDc6PlOl9bTpv4h
         zB2ZTqOgH86+A0Q2kago5hbj4AIY6ex/OOacKeMjfjZnzJyti/ZX4UQM9+FxLp3YMuFV
         kGazplu9OuuaQ4v6mSATTJvQHv9pM+ZFh5p/kmJA/x8p5omWhGw/pb6zbpn/G2BaPxRu
         viQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904965; x=1794509765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
        b=JrXcKOixG9Ryu5hbW66zD+OfqFgsNDk+1aWvRo+yEFNG4ANCu4FjT7fQiZqkA2yrr/
         itKYwVrRrtl94qVz4I2UIJL/PyZeSI60xYMUGx0Ho0DVqirxz7FgvXRuu4Ac6mr8z1DR
         eGSWxVKGtkBblUWmkxOWBO1xuT7ztOfWohHBfb/xa5K4Ba/zzVa6wuMU0oVcCTrdeOKP
         Szx46v5mPQYYAj4+Fe+epbN5/GqH3kjdw5hzBzRPRCDzl33JTxH/oLMRLukIR/dmNx+A
         RtnSNRAQRdmfqg17GClheIP3Y/zU6f+Q+mW7xjqKASI9Hq2BnltLgQ69LzcP7jvTFdU/
         9qCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYAsHyEFS6MgAqTrd+Do1KlBjv6+VB/vjL18GbyM2Cn4IEoELzh9rQUg/CmvFwDFfsnSSKbwxhOyBXdU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JLF3eIYXpAC1qlDB42+f0H0D+m8mmlWThQHdsmnbLC2R8PsNt
	iThPYcY4cnLVCT6bbVBM24DsbNRQdQQwoBX3GPeaav0xIAKk81p/+7T7
X-Gm-Gg: AYBFou3+ex+5WlYkGrY/OsyppQNGNZYwfU1Li7gTJhb0ZsbnJ0XgjQcRChtystrLT6l
	ibuQ0efG+H8RLHVCwgskRfgzqHCi+LXYa6wsnDjCHGCiIB7qFYcEVFPjuNXeiUqOiSeqT0Xyr9V
	R5mqLmplU2Fi5/wI5YKFjf84GoNsx7CYn50cPt2GY1NLkA1DWl1vzxTmO/AZDUQXyP6FBinX/sM
	kV7wgpv84yDXqU/mfV/0R9J+j04toxYeU7Xln7CdCfeqbu9XhazazzpmyHEwh0HEOCypn3aIyhZ
	ubw82ZXtilgcOhb18L/Nf/XuZhCf6eN0OEx21rJawQmqA17FfA1ubPZcok4Rzp34n8nm4mJK2PP
	LD16mUVoW3qJ3G69+FDA7BIILScQx+CX77IUqYVKvxnRBsBTtcWu30S786g4mEQmlRDCCaUsMXF
	Jmis0FynPtiPMO7TlDRmGxeBkzFgsSxo7t1XBh6Q954giWG1wzZB4lY4mHlD9qRv3E2S3iiQxdq
	A78lpeaYaaEgxFQ8Rs0U4L0ctbgmJ6QCaqP/GnDLgI7jEZbgCA4ntRvlLfMkUQebt0ihuA7PYQp
	MRzwDZkGmjLZUpeSzpfetmZSJfIGQ5IQHfoV5BgfMPUayBxDVi1NxXu/YHFCaF8uisrBEAn3HSR
	+RQe2RWUXNdvXMi4ey+7NiAl8QPa8Px0WYuWtZEVHUjwEOu0wlRleD9BwI5cgga+TtmGcv17cZE
	ATcnJyPtD3zcmx562AsGI0bGXKqG63I1FxCzZHqRhM4Ild3Q6JymmP
X-Received: by 2002:a05:6820:340b:10b0:716:d710:3f2f with SMTP id 006d021491bc7-716e79b789cmr261602eaf.64.1793904964805;
        Thu, 05 Nov 2026 10:56:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:38 -0700
Subject: [PATCH v10 22/26] mtd: rawnand: sunxi: reuse ECC status within
 each transfer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-22-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

A completed DMA batch leaves one ECC status bitmap and one pattern
bitmap for all its steps. Four consecutive steps also share a packed
correction-counter register. Reading the pattern ID for every matching
step and the counter word for every corrected step repeats MMIO accesses
to the same completed result.

Snapshot status and pattern information once per completed transfer.
Reuse the status read when the controller places pattern-found bits in
the same register, and read the pattern ID only when a non-error step
needs it. Use a cached accessor so a reader can request pattern IDs
without knowing whether the initial snapshot already fetched them.
Cache each packed counter word while consuming its steps.

Keep the snapshot local to a single transfer and invalidate the cached
counter before processing it. Consume lazily read fields before starting
another ECC transfer; each PIO step and DMA batch gets a fresh snapshot.
The ECC decisions and returned correction counts are unchanged, as is
the page layout; only redundant register reads are removed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 108 ++++++++++++++++++++++++++++----------
 1 file changed, 80 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e8286dc360ac..11fdc10c7f14 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -261,6 +261,7 @@ struct sunxi_nfc_timings {
 };
 
 struct sunxi_nfc_ecc_read;
+struct sunxi_nfc_ecc_snapshot;
 
 /* OOB geometry and interpretation; callbacks may issue supplementary reads. */
 struct sunxi_nfc_oob_ops {
@@ -276,7 +277,7 @@ struct sunxi_nfc_oob_ops {
 	 * Return zero on success or a negative I/O error.
 	 */
 	int (*read_batch)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
-			  u32 status, u32 pattern_found, int first_step, int nsteps);
+			  struct sunxi_nfc_ecc_snapshot *snapshot, int first_step, int nsteps);
 	/*
 	 * Finish remaining OOB; return max bitflips or a negative I/O error.
 	 * cur_off is an absolute NAND column, or NULL if unknown.
@@ -1212,23 +1213,82 @@ struct sunxi_nfc_ecc_read {
 	bool has_erased_chunk;
 };
 
+/*
+ * Transfer-local ECC result cache. Pattern IDs and correction counts may be
+ * read lazily, so finish consuming them before the next ECC transfer.
+ */
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+	bool pattern_id_valid;
+};
+
+static void sunxi_nfc_hw_ecc_read_pattern_id(struct nand_chip *nand,
+					     struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	/* Zero is a valid pattern ID, so track whether it has been read. */
+	if (snapshot->pattern_id_valid)
+		return;
+
+	snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	snapshot->pattern_id_valid = true;
+}
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	snapshot->pattern_id_valid = false;
+	if (snapshot->pattern_found & ~snapshot->status)
+		sunxi_nfc_hw_ecc_read_pattern_id(nand, snapshot);
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(step, snapshot->count);
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (snapshot->status & NFC_ECC_ERR(step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (snapshot->pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1244,9 +1304,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
-
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, step);
 }
 
 /*
@@ -1315,7 +1373,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1338,8 +1396,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found,
-						    user_data_sz, &erased);
+						    i, snapshot, user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1348,7 +1405,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		}
 
 		/* Both patterns are already filled; only all-ones is erased. */
-		if (pattern_found & BIT(i)) {
+		if (snapshot->pattern_found & BIT(i)) {
 			read->has_erased_chunk |= erased;
 			continue;
 		}
@@ -1384,7 +1441,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
@@ -1392,7 +1449,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int step = first_step + i;
 		int data_off, oob_off;
 
-		if (!(status & NFC_ECC_ERR(i)))
+		if (!(snapshot->status & NFC_ECC_ERR(i)))
 			continue;
 
 		data_off = step * ecc->size;
@@ -1434,10 +1491,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	int data_off = step * ecc->size;
 	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
 	int page = read->page;
-	u32 pattern_found;
 	int ret;
 
 	if (*cur_off != data_off) {
@@ -1473,12 +1530,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read,
-					     readl(nfc->regs + NFC_REG_ECC_ST),
-					     pattern_found, step, 1);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1489,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
 	int ret, i;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1554,12 +1609,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read, status, pattern_found,
-					     first_step, nchunks);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0

