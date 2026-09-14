Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1079476CDD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420204; cv=none; b=qdechiRdt0Wfe40ohHrlXrQBG+EcYte138SR4zck0gGtaLYEblubc7GRW6qVtR05VPc+4oUL/1WR8u5qtbSYV6GfdP1IRbwiEwfmLXgkMcnffCeP33xC6PbUeeb0iDXHAyflKkrbWsP0r77i36ESqcbihufIaLUhY+yZPm0X4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420204; c=relaxed/simple;
	bh=QNBt+pFeHHzCr6qyz6aRzEV+o3fccMFb5SqOxfos0lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu26hQfM7+X904ViL4AzGnJWG1dDungmXn+TdNsy2e2YLLFxD3VEzjkfTnyNItryNJ2fICLKEAW+BimM7eBkRnvW8qo/Dim9oHCIlm3dq1nn+WOcXxya0s2CoqaFfEhIF030ATh7+FoSK5vCfgSluCG4NGzBdQ8Ojiv+eCQ61EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozvgo8/9; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozvgo8/9"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0c89e34so1834157a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420198; x=1790024998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=ozvgo8/97agg2f1pieCOMOFS3cyzv5+2CQ9bwTeqh7vDYNxYf5xo7fTZCoEH4eyZkc
         26ZF3+Z4efP5Q8DLAvi1S5teGYgdtJkbXfF3zqmaNYXW+bE9iucmcZxpvBLCEIymtb5E
         gL2bfwtUF1Z7mUpvylcCe8/WEOGzN2JZLJChQmO78rTVwpZlQuskKEA7++yPeX4JwKcA
         0ah/JaSZc6OGfkHhcnKpH6RspBJiY1rFKaGvHdqyR4Ru9Fe5QYhRds1uQYnbx9wIKRK3
         RlPsMQ9ECiHfpLXwwNUXL92jOVLYGe6GDSKD9kQ714t9LkhVHC5BbyN+o3b9SmU0Bt1H
         9ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420198; x=1790024998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=gHzgr9CLfV1pOudPerd8g6j+A413UYOpr6CncXxZ+aENl0vMQKjd9kc4R5XxHwjJPF
         lnP0ozmgINfPAKmp1tTx5vpPF0ssv173db4YzyaUt1HzG7wLvrLGJ/TnGT2WaqBDx4Mm
         ToAQAzCW8VKFkwCu2HoCex4iRtwQ2Hi5e9rU/5GDcOnOpDYllOn9yDTmzS7ki27sLRAC
         fz7ycvnKpAuSswXPb2ZfnDUdSrwjz5wC7VBAgA7fJ1pNRt6gQJ1+53jt15GvZm+zVroC
         /3TbWakSStjQVlG5VHYpqyy/hnvOQaE1VtSZ186nMyIyB8Hsty9hnr2DQN6j6UgPZ29U
         VThQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWwityESHCe9p4zz/CvSEUWasuE5Qiwg6e7kkd/FfjqJhSKu1OS8T0ojRMk885L2T4MPtFULI3yC3iR5g=@vger.kernel.org
X-Gm-Message-State: AFuF++komZgQwtzowStmPPWxBe6gPOuAqHhKQBp3hHnFbO57MKJmXfZP
	oeyzlbfIseBRvAhZxjT3d8WkUbxUUr3mpua+dB8+fHbqjASeDkk55eUO
X-Gm-Gg: AYBFou3qBUBW0gOUMUhpIGFGm/PhGka0M5Lsj+tb4CQn8OJMpTDDjr1hRogwW30CbER
	gH28SGmpw5lNQqwZL5MinCp/KmMczmFxGTGCJaoAA9V4U732osnqOobZwVr/IAxT/CSN7sbqmio
	TSPAiru8bxhVaphjPhIygl5ZBLF66ISBAdYF1z6eKLd7LLT4YwcKHh700vKKz0vqwhsZ6u5Dr2S
	YSoYbYzyVkRlN0JATleFDSDT19LjrvdlNqcXLL3cmdUKgVZo5i//djriVBfVQFoOQznMi4fQLPG
	PsxjGhoVmQgasPjG8GOZxDyLvZVV80Ze1uGnoKgh2C7WTN3u8nj+5fp41tjR1OntLcuyQtXb6TS
	eIymE/dJhSDHeN47SV25Fd3q15MPq1HneC8D2eJqKseL+LZNIyJF/f8bAypA7gDOFKA78SgR5nb
	Df/+EYPGVQwej/qsYFgVI0RI2VvbUIO74+WVv1zAQJVq5EcrsQU8gsSLTHk8YUS8mxytFUGarbK
	fayTVafrXZvyC9Fa32s6klImSqQdIUcyT+iRlzWCgqQ1QZvydcCnxW7axtBY1tH9wLyH7sbZyGZ
	PJZJlzHbx2Gf8SF0+MXTG0TSH2jExNCwU+qq0BZw9W7mtBvsrH4rRf4tgyADcbghfzfcdlMFia8
	oofAcXGPVWBFMGnI3tBqXmNSFrlAb
X-Received: by 2002:a05:6820:98e:b0:6c1:c628:b0bf with SMTP id 006d021491bc7-6c53f44bc19mr2434309eaf.13.1789420197732;
        Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:48 -0600
Subject: [PATCH v6 02/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-2-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
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
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0

