Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44990363C5E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354922; cv=none; b=Yrxp2qFXHvfIpJMWQMAZxc1NCfW1uCQF8OnY5oPpIdA6bbkSN+DlZFcYRaMXyedISYmO3ki6cuo/rIrwtL9cLBEHp00eknoq5LYZyQKIUvXg+TmfWPWRRHIUlcNWSWCgJX4mBMEe7d+x9dIv4Zttwa9rGtZK0qcZuRIaDWFazOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354922; c=relaxed/simple;
	bh=InyBxnnGJUHrfGks0KD/ITzfsd5gn5CTfPJ5EvLq/i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKtxXM+LtscGnUU4BVSdKrh8FycKaweLeNZsJs85KEX0FHZcoSDhOePlyPv7JLaGwppLO5+EIx0O399nGkZj7p2BIJT34WHIinnGR6Qtt3A/4wnkf0IjpgGKjKDWWm02ifJJmloYPeQofQI50cDNmKIrWL+hjR0wXTTchwK4Vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfJsYctc; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfJsYctc"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-804f7045f3eso379800a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354919; x=1789959719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=kfJsYctcxo/x0PXZmO37cKtYMundVPFy8+eLFK4gf33alvh86B23jLjv44D62J1ahr
         5fFrvB5DKR1bPlntgBtLeNqtSApWqonRxhPDcMnm5fzmMHF4opfolhil2FqXlrJgEVAR
         VkQrRaGTU2YTB9bSimYQWll1i4g3q5SGaPw0N8OebKK8deKnW+c8tUvE/vqsToOtELm9
         VroKiUGoBHvLEf7pGqrtrBc+k3GHDdkpFqK+egYrNWlujCPe3c/M3EiTQcmqez6RAjjt
         p4UKAGXgcFFZZV6VPd8X2gzKsjRRM6OmfJWUdACS9AnYUFNmIhE6wlLS/ujn6ZO4gIP/
         XwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354919; x=1789959719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=IE8Upm0qxe6mJng8i8PgyXYYNN832SzEa4p2ljvSBA9OYYA6L2uqS19DiOsNxqy1jX
         zCZzdthaP/Xcrjmm0S0TFBTQbiMFcbdZgvE75Yh6bXGj4duTV987+T+VdLdQ5Ves9bmA
         GNh1A+axZbHzlEB6kikQEF7QIyPGmGFGV2DNL0EvLrKyCsjmswb/AMwsqpV1yO5IJJzL
         jSpz99Jns3trKqwWhsC1HHxgRrwsv+dOHlDlVs8+AQVs4Sa6XZerG2iqd4yOM6OibTSL
         t63vcBoO+33OVwzbHgbpkCv7BjIHqNyWWUpFiwHHyzNRnlTlXl2gTv707jgIP8TkyruG
         UpMQ==
X-Forwarded-Encrypted: i=1; AKwUvByY6PMdkX6SdIVYXuDdhIO1VqsSx8Iv8GgnXLG5bJzVUVwyWsDr95KMS04YkivAA2G0U21m7VO4Kg6u1Zg=@vger.kernel.org
X-Gm-Message-State: AFuF++kW/veq+GImfWavoVSuulogV5CiTC+Mn1AmiZ/uUK2WPmkzm9T4
	s0M6KOfwlS+q7avvkUf3Q5WnzZVCiRHiNOzAZJzGfTTn4laTPybLPcp7
X-Gm-Gg: AYBFou0ntmca99/33SO45tV/mQ8u2YrUWdzHrAXzoWlyw/QVt0i2bzutGKiWjDthn9W
	1OQRwHfDV4bwS1exfoLMlwGnj07SzfoaT9BUkkyWrQfYWtw1Guqd2DICOosAMXG0RoRK5jinBnA
	dCKIazq80k+tBomgszpWP3VCFhF7wnRkzPE8r5SDqjHIdtdtw+qk7pjgwtC4Fyc5a9eHvGsJ1mA
	CWswXsfI1+4oyJbo9rkZ+EhmWeIxeZVgNYLCSBYBBNQmHjklmHaAuuklHKSlqavbMLq8DZmDg4Q
	E+wulV/m2adVQK+teXKAw2i5K2IXrHJpmZhUNXqq8SjC54iQUyjbk4HImrXh6fJkULWAvmTbFm7
	rrr8pNr6rXcwNliYjmK6n0IVTGwTHrINDFJQRgyhJiNg+WBL9pwNQ32rLmxX3cSHfMl4us9dKn6
	dp5UZ2pL3hBCdlIyAUURLo44mRTY2DU0L12w/H+e7rWPpJm6N5FIehmtr6pQ/HP2ScGk0iykCFc
	N7vBnrrUroxOFnL4MJ9Zy10A/iEmsLQbS+kC814/wYWuE0nOgqzH/lXqUBX3HhSL+d91SBIqTkl
	bXMafx5GL/FB+a/5+O5n2GicEBgocKlVpi0Azh6liBi+lSrEx2vnLuoFq5NUbVVtL1b0+WmfBCA
	DQG2bTHJJTvieSwvELVEJgoF2yX30Xg==
X-Received: by 2002:a05:6830:67ca:b0:800:bca4:5626 with SMTP id 46e09a7af769-80899266b51mr285872a34.19.1789354919239;
        Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:20 -0600
Subject: [PATCH v5 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-14-7d711076a6f7@gmail.com>
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

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0375930042ef..3fb61a10a441 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -225,6 +225,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2417,8 +2420,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2434,6 +2443,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2494,6 +2509,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2564,12 +2583,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0

