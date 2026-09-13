Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805FC39099B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272329; cv=none; b=T+JMsnpbvZ7X1MZCPMgsmvej/jmDJqDJtgbw2NVnuUrdedUFiOJ+dTx1NT4wmsts3MuBdOm3F2VzqZJYx6hgNVfzN5jIRQFdolhsKW9UG7o6jSg2FNzhtwVdCJG0FWwMZySIyBxZPbJ3alMf3MYHMOnU61Au+F32sZ96kVAcjqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272329; c=relaxed/simple;
	bh=z2BPI/pmixq5cvuOueHRhY4+nASimyd7pRom7zs4YWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hztKR4nB8p16WJ2RH9yP0W6luKF3+CuWGWkcDe+zjYdSliDrGhS67lmtYTkFOHvsJXe198RfkizBJUAwwnoYR2sop1tnT1k+2HZl0vMzWtGWgDm3bkMhsbNosgBbqvmbYskPtohPwlRO+9JdxPDzLg9YgqXvkmGyuAQQAzwxXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0mC7oVB; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0mC7oVB"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4c6006e2428so358178b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272326; x=1789877126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=G0mC7oVB97qiFJZshq1cbmBnqqgxl09weKf82hbCoFvDr4a8AO8brwNLKvbTEaAcl0
         BROANUkR8412GPBf4RRHiROm0M/g/+vvLjziMqUBlcaNRNbi9tHs+NC7YWXxKaWE4YiU
         7oFXHUSufFCFJSNlVCz6+QKJd8/v/a91Tcl+X8h0mYb3ot4yKQKQrlPt8owfOEWXolX4
         vET6kzzpkU2wKs4p319zgraQuMXt9z1F9i7yMeFokFcomrHmCvtgOlzh7Oe61G4speot
         nHopnHSody4rky8dgN8z1+CTXOD2nNvDuEyEHQlAlcALO6bi6/ltEUt4qzbiSaA6bCng
         LD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272326; x=1789877126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=dXsFWgMWh/QzaoRKPL+jIIZ7l8VMXjXuNNNOEl7sJCubsK6BADIM9w7j1hKwGGe8ir
         M+OAUdGA5sVr9xJ3OzJHaQlzKOsGZWnV6jU0EyiQ1EvuQ04EyIZn9rsw/40506ZhzrFx
         NrTyNJny+60BzWXSou7EpXkeig/d83HlETRV7Ew9lKDKT+5lDsbRof5gIWAwBg5JEzOX
         hcKPk5IrKdau6f1Qf16l3gIlKEMbxyZoJdPt2OE9dcdbb+0SCzef0ZEv7Zk1fHjPu1Wh
         u/n+TYIT5EqRjWPnpHB8dFmxNejyGspFoeyTPGvVktQD1ogfolvb3xrjpBy4ouGx7JQg
         K50Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIsQsqbO0Lju7sIT8feFG79Ae9lq2z1Uz5XA8NH0Sp7pfwkDoSNVtbMcI0+BxfwWClTE6kqJDfLQeGdvw=@vger.kernel.org
X-Gm-Message-State: AFuF++kpvaiuOUXcRHTpeP2Avt/EEo55XtzdpSduACAKoLebfghDZJBy
	HRJUEldUNFc+WoB2F7hPX8wSdrRYicwosLAkMltNzViNTePwbscPq6Km
X-Gm-Gg: AYBFou3xEVHSUTB5X1+FO1u1Ai3ivygvtvBbCN98qhdEs1Z6vbWQ9J5ueWYmcFbeeLN
	BMJ3RIiOmg2WLZdmiOXJE/ylTruhSsuGMmBPWd3+kuz5H3u3WYvdyBD/BIJw6ymzGo0QvNhpS1x
	b6sWthAUgZYAcgNK5sy2nNYWjQYMAGizqirroDHNAdu24VKZt9F8FzLTtUtw9O8tAXzr4dvGmir
	VQ3/iIzt9ihUWJcPBNpfaXGRP6SnSIpmDSa6SDmicwqkL1rk3N7bctPYEAWI/t+kPVutpw8nvvE
	l7ovqFpp5mASDOhJFvGhRC3aarliu0zzRLDoMIDWIH70akBfoZGbTMDY8cboJgGfuk+rc64Dab7
	l8RmB3t5MA7htiEzWTYG/rVtJA/z33mIZMH2NcnoXV+E0Ve8dxRd84MsFqP/ZTbkR5HrMD5X5g6
	nUdi0wM5zu/cEyEZtIjQbPOBi6lAtG+It8J/LVskR50mtDSugRZZmUVkj8M5BAjo71R3miXNWx3
	NsTaYU5KVJATXKSewZVc2JFug2ARUyB5l9S+RVpWnT3W/hxnwUk87kw0rbImCRV1V9eXukcuuB+
	Ny5q7hWC/gdxFq8cazMLY/Q5Qv4IOmzqeJ6lkkU3A38+/uKt9IY8YTnmq+SgfQ7T0Zm35R3KTMC
	w9r1YIpxKnEK08nMhz4veeEHlop/Xsw==
X-Received: by 2002:a05:6871:4082:b0:479:a30d:60e5 with SMTP id 586e51a60fabf-47deb6b21a2mr8028318fac.37.1789272326342;
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:04 -0600
Subject: [PATCH v4 13/17] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-13-4a64bed94229@gmail.com>
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 97a4b4470dad..5fba3c111a4b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1424,15 +1424,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1443,10 +1456,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

