Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB144A3EC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942673; cv=none; b=GF90G1KRJDMBv03zXIJzqSWmTDG2paa/52ujoXtzl35Vnl+kiLjH7OTjRneXxbo/ogDzOucticSexq74cXfT1/LGEOPyvxSvqBT36lVqyJJk3XeDba0JQ2kgpNYanxBMJncz8g6V7qEL9mw6tnnQG4EoR5V8TZ/DEHnA9+ZR2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942673; c=relaxed/simple;
	bh=RUHviMp2AdO1fknBD6KbHrx/oNzHzFuAjPBWy7z+Mks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOIkbNL9wyn73okkScj+pRkasWqb27syG/e9s/rcf1uaWorNLyR0ZKRzfbu8/TawaCJP8i1rIsCVtfjeJVCLQK46l+/RTP+uHfspTPQAO1/1LzFYgTgMDW9xjkUXR5ElnTVKj9vi3YnLR4llzM5yYdBVPB42l4uySnShYL0vvmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p50A2s6u; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p50A2s6u"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-801b48c329eso140458a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942669; x=1789547469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=p50A2s6u2ink9vDXarvSc8lHvku/hkF2YGPkQq9pialR66XgKhLsUA16hd6SPnzamA
         9G14UJcHoHIe6dibUvldi7WRJCbBWp4DD6TLBK+HkVEajQwr9Zff5MhDacxU7NYb49JD
         ysjuz3ps1FLVKGa1aquEDcWn7iEV2RchqS/Gsy73ME4pnK6CzVD6I/OnD1/sxKVDQhFs
         3wSBBHOoupDEAMCkiILokCcIzWFa4hNZer0KIpZXDj0aqV2JnAuUjwsDcFFPclYlUiEw
         j8eZWyuG89GJlmnY+S31H2DFczipPoMgj+AQjKSdMdeYutUvGZI4XwHK/0DcIeDcqViF
         Al1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942669; x=1789547469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=YIx8iH/PCANI1VC+aAvhc148M5sgxImekKUyCBEfQJZVoGjFWqVjdHgcpu8CGMnuVD
         7X4ci2vFI3sgkZN5gF3lhsY0FRY/gpovtQG4kG42trSBJzuztjjHmxn4mZtPFw4oKQoH
         5MkTmS5bC6ZzvlA7/d0iz57AsWXQt1+3i8oY3tkTiAopXX7+yboCmZGr481gynHPQ6tw
         +EIIyXZLnK9hS/wW1aZKHB0Zx1njF3sn76uuHmZ/8B+TFTH7+Ij/H0/LTZADpgzdNriS
         YvICU0VJGvm6AU5ldkwBG6s/fXVb/wb95fiBSv13WaQ+eOpsD/+IDQ30y2bNpaljDkzU
         sduQ==
X-Forwarded-Encrypted: i=1; AKwUvBy13wJNhzX3ZJJWsbFoejibf+H4ngPSyoOAQxWKkc8loQrWiL/DlpNjSqXUJj7Aoq9spx8FVSGkqLLAyFw=@vger.kernel.org
X-Gm-Message-State: AFuF++nSwOn9KrKffkYQTzsL/SVpTqogU1nCdHN3RoZX+nn9BeaVIzId
	c0yZISmLvSf9jDWH6afg5KRxU/N+NEg3uPaM2f4ubVTEhATip/7cgAJ2
X-Gm-Gg: AYBFou2xa5qKV/107y25xBAaIeoQUCE+YJ49D/LoCH9BOvo4NIVsac3mQ/F/zb8h7NY
	4hSZydLRV4m32u0ZGHxuQJTC2CHWQQScOdREhPcvhlU2EgVHbUspBL6NEsn4vrWnAgo02PvH9Wh
	DGauIKUKc8pg4bfuphy3DeDgj0umwoRBdnZD9W48auXediqPuZ43NX3Z+E2xJ+IZKEy4sPJ9LtC
	BTCKacEQa8Y+iceN3k2uAL2Px9Qx+20gLLprCEGzDlX4SoIbt7RM4oCrlgxkM1oYkePyN6g14X7
	NvOONOm6tU+x7Mzcp1p4liSx13VRHhEL0605qzvSJQ155hNWPcjIQkhnjUniezeOzA5raEe3dL4
	GcacPwuaDkfBCoAmm6zmpiCczbb43cRyiTHr9odsBWvK8XdEppRhsOwbTOLoeVMDv5R6DFl9sgk
	HP4ULdGriGXcL61ujo1gZmLpZMG94zSlWQoZyhBtQk9ozCTq7c/Z1uqKzwane3SVmNy7HxH+Uga
	Dr7JjRhefV4/rUM3Tjb9Lt4lxnq6jil/KqnlomiSmceSaGAdwQyklpGIhw+QE1KPml8lFCQc2kx
	+l69pOOyjNztfFpezfBQYqc4lPMOUkwrBnuH/Er794rrvoqhV3xt1Pxb1arImZg5U4qWClQJXND
	bZvRDSyY/OS3JHlXOnDb9YIOrPi4Y
X-Received: by 2002:a4a:e909:0:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-6b6fcfd90e3mr19776294eaf.24.1788942668737;
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:44 -0600
Subject: [PATCH v3 11/15] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-11-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
index 75515ad276e7..6e54d3a92219 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2348,8 +2351,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2365,6 +2374,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2425,6 +2440,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2495,12 +2514,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

