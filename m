Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983939989D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272334; cv=none; b=n6LnZgr479/EU9hWVww6v8E0YdEgDrCEqcIQ2AcXpTg0ITJpeutFiitBTlPxOSZuadhq3GtPKB4wsijh4zQnjSCeNdkwcb4m2deXxj9ln9V9FPUm9L0XfeGbP/t7djxLtxM4hGHntr9RFg+thQV3WuENiTKnpfMVI5QlLXBS0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272334; c=relaxed/simple;
	bh=VjHE1JdFdVf9CJbf3YH4SKT7hC4rAP1wz6y0IHKu+vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryFfxuO1ettSd45Ky95U6ATGm4F5qh5gJITIiW+mHmU4lEw+dTNel8X06OkqzrnR1v/AOfvNytgWywomJ+M1rBeXtoYUx9/2PKJmRdyDZli/JgKGEqlb840ljtkHyZV5MD2EThF69pJw0wQ/EGozxwrEFTJNkpxpy0AJbp73BjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhuCgZIf; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhuCgZIf"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-80527255583so251258a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272331; x=1789877131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=;
        b=PhuCgZIfy3QoHTRgJEntStDefm36bnmjMfTjwcikIWyQ5FJQOvfYmr1X2sraGI9xue
         XOEqitkYPgH5v6naaeALZk4GUV1cdytiiQ45PP0LD98G8qnm57GEPfQhYRF8V8ApJyEB
         Mv5GohL+ERLS1jEOvMMYf69ra9dqIqp6d+AeSJtveJ2nyavD2EpiacguNPMIdYy/vam6
         KtZYMpEvE25RBP0qDci1yogxD3Uk0j+7zldQd5sWXvtOfyk7HPdIsdMrP1nnwUI/h878
         O6ZeC0iJTp90SjXKJqTSKkbbu6LxyYo3aWnncAKmwaFvy+SMI84PiliwFm/lNlEA/M0h
         HU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272331; x=1789877131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=;
        b=a0ei2bEKhVD5J+66UhGHHYwVJJJmpJdgh9rbWlCaO9UpA5D/C+Wce3i+90AbP8h6Q5
         SmOWO59x7OCs4Eb71JoYOErjBNS0IlhCQ2z/+udjBvBeDepeAGcy8yEXCEHMHIFeZpfA
         qpMfK31vCMD8h8E4LlIMCYthKQ5YOAcwcxJRR3vHMBK4MUPqI47BVjd4Gjg+6c3ZvOdt
         BgtXUNxfi+GSlZKx6gWimaiDBdmQxYhwkku0Tjg3PKXg/kXugxf8whe4fpk53rC904BG
         3H2UcmkoCWphc/DNNswwdKydkV2eF7mgQHI3EW4G2YLKwFOpjvoyPanGjQWzvxrTB4U1
         d4NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEd5hNlGBvxKluWtUXHTNb1C9NBpRxPskrC+IWyfP7apG/e243nkHkoDcOn859de+oqcdA0ZeijMOTPKI=@vger.kernel.org
X-Gm-Message-State: AFuF++lpOIz5wqusU0NW3qjbB2DrU51kWrxI9Ac2FoR6es/AxahvftpM
	OwwvwwhAR/UACzk51CmMwDLiSlanwtT6S9au5nrzuQ1Yz7UmH5OyQBGV
X-Gm-Gg: AYBFou1T2DtIjIsI6ayjA+BBYMx5rsy0888FhXq9JLtLw5qapj8ixRl/Z8UZPh/4sgj
	+5HzE3vKm4t9VguOs9lJQug7VrLYg7DSWEKp8A2inll2ugdUOHFXdJDWfHm1XBC0Cn1FMrzveap
	Q2LfrgPCtkPpNjgIBTgI71aPOLWj9PjhlmkA8sLjgbHYgolD2PcmW1RyP+UTiH/3jv8HP/LbJoR
	pPgvynyTcrJkcypXsPYaEFN8vJ2gAA+n6zntvdjWLTdRmlQexDA4hyqkH2s7Kn+lkwLb7iDabiR
	X1N/MaJwZn9I6qpuAIG8+1QjqpuP139RPu3s7DSyfsRHlYf9P7hR3bxJw3eH6Q/ti6RxCuQEkdw
	JWdwyjTd3n4czbsR2pNwdPkoXJtiimWRyqTI8bYSsq/5rfi8WP9RSVXlpmF1j22tRDrx6Ztpc6c
	JlfnqMGTDl325ezohb50pNeIYB0Ux64ltwoLEDn2/RMa+E3kfdDGlH7P8rN0LvzseRA/Z6SKKbV
	syrY1JNwFxw9qvNRtkPi8Ao265bhTltjgZio9qEHKwFDvr4/wpUY/rUut0xGB1aLdDac7/HxPSu
	/eqUFQxOoI4EGL+z5XU6nJpictHeAsi1oCkMXnYvtMoosmHk4MqpEDyM1WrirwcTfNsut4Z4I7i
	MHzlWbWL1oBNry4pUoIHa0LpYWkP3kg==
X-Received: by 2002:a05:6820:61e:b0:6b7:46e9:96f5 with SMTP id 006d021491bc7-6c24e672089mr2838753eaf.37.1789272329061;
        Sat, 12 Sep 2026 21:05:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:06 -0600
Subject: [PATCH v4 15/17] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-15-4a64bed94229@gmail.com>
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 84e1e04d0743..debef3f4f0dd 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1008,35 +1008,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1225,7 +1249,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1536,9 +1560,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1694,7 +1716,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1989,7 +2011,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1997,7 +2019,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

