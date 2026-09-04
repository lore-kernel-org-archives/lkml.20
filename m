Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DD3C109F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557021; cv=none; b=nO1FmCdOkK4bkJ0qiARvLqHwzhppsMTtZCBMmfUhXywPPEHShWOz5MQQMpj5HTXSyuwHGFpaNdkIBGtLfB1iYCqts5/CWyWbXYLAgl0g+ZxzCDtaGKK/lSgWwpvJTQV4jNZ/f81htc74ck4UZLwjl4j9KuA2Bn2eUGdjRhINSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557021; c=relaxed/simple;
	bh=F/EHqkFfSe/60Ki8YqKwL1Qg0R+is8WeugnWTveWoZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buUqJox7eiMtNHnS9rHA1yPGVPvk50MtyjR8FFGt+mZ3SDCgSKePKYLgBKjDklWiLZF6gS66MD0XMU0e/hfp1idO4g0T2SjLwSAUQrxAx2CjeeDrucLi8lJB0kqxBiI5pp9GF8vysRMqZWwNUGLlv7tCpv8Of1JtY8gSHQg7nsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmtpDxQC; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmtpDxQC"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f4e6b5bd30so2055672a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557017; x=1789161817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=;
        b=YmtpDxQCiDkqgNNf/ib/cWMLw0/2y9ZWc0OynjJJs0vZcz54JRtWkDHWb4ASbfbvsN
         kiR12mPUN+nSFT3k2F2RGGB+Vjr+UjPsiTT8D0jsUCpU/YY09FlcPDWUq/7PwG39rM9o
         fbyUFf36Llpqx5dLPOn9X+sgn9kp6i/TePbvs0QZ0qYhj9AV3LlGhZYRzfiPQIDW4u6F
         l5pVXqkbco8g/dcZyLGdm/Fx6zQEgmfltq5yk2kCaTrCnw1p9rKM6dVnOKKJjkruopAD
         V3nOOcUKWCbjv/jpfcAwTBCzravJOY62e6kT1CQQcLXV1rctQ5aiTsC2mgCpWVooV6is
         zl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557017; x=1789161817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=;
        b=S7WsgSKoF7DkV6JiHX6KBxn2w+NDb31ZlwOAfUAGKxZ7tnIfXTW1oQ344jIvIw05LG
         wASghSrgK2rCXFGlGK+daSIpR/WIoWjRoR9/aLPyuoHUi228bXpSx+CuNFOXl/PLz/4r
         dgzXo6+Yg+ITAOhaV+VAqBTY45EcwOgqttbfIxbBiYtXRmwZR6VHVxzt90L84N0cMFy2
         B+EKZ/j40B/sOVbTq83PXOI6PwO/fn2ZTTJPPNqBDxeagMCR12pm3lu5sQSXzHHq1S3Q
         nSBvIGxpGkFxOdLRB9BGqKq2HgQv2gJoMXFzBWbMa1qx0ZRU3xtl4E+kuzkxpy/RfEm3
         9QCw==
X-Forwarded-Encrypted: i=1; AKwUvBzD19xFG4FBMjz3G5+8juvhqrUQUzKPuQ8G1LjcAl5YkNAXAFbZ67Yt09hzPlyKdaa0cC9dsl0hoT1B6MA=@vger.kernel.org
X-Gm-Message-State: AFuF++ni9Bi5B8K+ae0xZ81W3KWfIzu7Bka4bOqCcRNC9hfSOwXmmlIQ
	um/BUyR6Br2TKN96kbObrwSH2EjnbJMNFu6qSCNHRHRunTVD4MT5EA0c
X-Gm-Gg: AYBFou0tIXe1GrpUdZZv3je41n6VjZJiOl+Vu7qFOSQ+k3ctYpzz7pa4TY5VS1syMup
	OQ5l1tzcJx/qcnCE/QrZA++ONmLpgcNBrjnfO3DVFycA0HF+jT/hlBfkdDwooRwyDbaE82G41DA
	hr0N1Go9SxNocbinPxGqMQm3gacsXyS0lKryBCOQ9yAWzRtySxzsI+unzwB8pP/3ngv8nbTvoDP
	bhreoBtRaaF0r7B+lKkoCBz5Edgrz2cxKgJ0BeFLEjjWvOpNH1u7BcGw79O5qwNM0G4w4uGuNfW
	98z20aACzxChU7Gs9IkIr26WKv0VmaE0FPI9uAD8BYprrEJnGHaMVxrF3YqrcfB9/MXlVGgGfcn
	Us/yJrukiaqMBAYrdxDVMqCbm7z87kP1lqlYHc8vQ0dUlKfv8h1gOismVxkJbO7dScHmxdaWuyG
	qt0equX8s3EG9p7g++e/aA4jteWJ2REq40LWiq9L8MUSQmtGL0r27tjfhjckdw8IxI9RVSZnNeH
	R2tB/f/HFNlia2K7H6xwuJNZxuQqBjN1nf2dv1t8NGaU3iiP/0t90h2xT3xWJkAAIEDOKXBJ2mf
	HQP2f30t8AjiISMTJVHsBd80B+/iX4Z7lYL71V3w8lSrb+CdvlIxXXrBOi1/z7RWB2h20TxrjQt
	NarOSQkF8xDRAGJhAGdc=
X-Received: by 2002:a05:6820:60b:b0:6b5:ec3f:4988 with SMTP id 006d021491bc7-6b72054580dmr2866500eaf.35.1788557017178;
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:12 -0600
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
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

MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
randomization and expose the physical representation. The raw-NAND
core's bad-block and flash-BBT paths use decoded accesses and therefore
continue through the hardware-ECC/randomizer path.

This changes marker handling on all supported controllers; the H6/H616
protected user-data placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c1246a9268ca 100644
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
@@ -945,8 +947,9 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		}
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1006,8 +1009,9 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -2229,6 +2233,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2238,6 +2244,14 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
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
 
@@ -2467,6 +2481,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {

-- 
2.53.0

