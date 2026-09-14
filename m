Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA783655FA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354923; cv=none; b=VonmB/tcBvv0qrmFdzd56qXWGGDisjagHlOUvVY3+kTVgDxEgNlzi0kY9T4iHp8AGiND+Y4rlOcgFOXHCzFpIy8sBiV3J9vGKo1nRX6KEE4wBRQiPI8yfHPPExD5K1S1duijqltDpTCnrn7tSgn5aYw7LQJQSHEDxWCGc6Ox/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354923; c=relaxed/simple;
	bh=9yChzot1ui7noQKhTCzhe1/zvJdG1xELLE60VMQMFlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQQhN2xA+34CeqZ+IyTXUrfR0ngv8ITQvsnZEcgxkKkNXUV4wsMP/gisacWzDzpWDaXcJZloTx/VcbWpjWG08ov9sjlPDvl1YzCMS+V0ZwlHNZ/vzd8hKwcet20ZMeWSvK927ExuBoG1itafznkrG/mLPGc61l84EXSDuCLaDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T12uBWq5; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T12uBWq5"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-8050801d337so1103288a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354921; x=1789959721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=T12uBWq5gfywAqFjPOno9Szyor5FeGw5rajKxKOqXylGoxWBadMR5DI5bcIazkk/8y
         kapDCyBrW+iNRgkgJ4KBtVbnNoFR7w4nqzAyHat+rGvV3MRAuQvlpVPTGAJ87HAvX+0O
         O1g+l2B1k53ouQA3XzZaGamXKmtJ8hMFg0ePUpobSqBMW4wmr8jRvfUqir2rplTdIXMW
         VVg0taukSAsSQsyJpCLHhppvz7TB2N1XZn0OmTr6e8qmY0A3zqqEs1h0zRi/Dm72IKPQ
         dkhZq8u5Vv0TAkuV22QMUOyrPP2DLmxf54TVRJya23WhDY5ZV/te2PiDkOb2qgPO6BXe
         Qsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354921; x=1789959721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=k+4D8vwrrJehkAaESVoR/tPa3UP1wfhGWeIKQByN0z5GXYUQen6URrNwMimSotfKnN
         nUx94ese4N2aqQaZcineDJFbmzbrJM3Z1a+Jvl/eSPF5cjNHyv1jLgOVDDKf9Tio8nQf
         /ysr+ms/f/6vwaCwnYiNcj3TA8m4Zp8QirPpnuBW268j8uPktJcCKD2mm9F37nNEMLdV
         YUIHsMHcbYMs/XTCmNUCxxK3B1pytKEu8hsdopobJU3oVoJfO+WGi8a/hCX6T7RkWfMH
         9KQNILDk1ZfwoqqaejwF1hzV6GL3NSH8sNyI1eqA4ArK4NwRelLylL2mxV/4nxOh2D+A
         M6CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgzbcaCCRdfNysv2pvuBNjK7l5e7YwDNoqPcQggYrjVlyLsF7Kqw8ddWIKA51ASKo8K7GsuZwVpMbOwTU=@vger.kernel.org
X-Gm-Message-State: AFuF++mM9zKjY8cMq1nmEOuK7Ojyfo5h4ui8JMhU8MLay3+rOPCLwybf
	9wLBo3m4jK4sNx36oT7WP6TVd/fzzrgmMvM+F8MtHzgI7R8AtSJ2ZtVR
X-Gm-Gg: AYBFou1P392mGB5ESohh/B+o0Wkw3DO/T9qcKhv4T9Bg0hhXW8tJm9fjwaUspIs498S
	CmU8lmYQzb8KGjXBXecNTGyXeczNAHmdlAOD7WfWsu6pnQaL5XrdzxG+9Og04LdsenDo8IN4LWP
	85dxNW60rZ9aP2LcKNQqE0DprXwSrLOpdxgQ8i7ftuBseelDRALrguJYPGM4GkMHu3WmJDCwYOq
	QBYCl4FuPfUjz4Dol6XrquCZE4LoV7wuLKOHcvouwJrl7HjfIuslg6puaQfLNCE7sqq8io1MWtd
	DfNWBeXtKjDc2hO61Rq8V+dHqir0ZoRQDUuieNZuYPN+9V1QuXD2i5wL7Y3MJ2/VWA6mzjLz/aS
	9hJuNQ7UiWIfkzCXcyrQlIY04ipZiuSQNO5bxZ+42Xjk4I0Yz8l/mSz159kmzznGuL3/GnS4RvQ
	Cowd8fMLbnImlIt6HvvxqD5k4Lz5vftQ1re2ySq1ClDbjSUqftYMScoPA0byi0XgiZcRBa6wyFt
	mccqoM9G4AndXmTjIIgMCmWnGW5beIOhFv967K/w2pS00aEDS5h6FwVUyLrrtGVV8vMY3Bimzg8
	18FXz4hzWJjJc2LW3wQwEEmNpGPBDVmJhMTZqseHL0zEWYu5hPTWjdXKX86sKVoGgSownwFNmaU
	HJ7H+SXa5vv8p3Rz/VaCzO2oR5F4ixA==
X-Received: by 2002:a05:6830:81fb:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-80897097a7cmr492616a34.2.1789354920841;
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:21 -0600
Subject: [PATCH v5 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-15-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3fb61a10a441..b7ac8d7b0301 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1421,14 +1421,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
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
@@ -1439,10 +1453,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

