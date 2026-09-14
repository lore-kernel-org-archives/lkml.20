Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143B30D406
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354909; cv=none; b=jWh5NO9blEXmogYWZwhX8/4gGEiqBmJVwSvYkRYGPn+NJR2ePoQznXiwu6QcGx+dKdR1VUhl2DfIOh1StKl6e3bvVITHrsi52dHzPoRQwyawQVsXyvuIWojpJosBUG/5VDBLoB0VGiOYOBV9ui5V3XiTluISMXfZ0KQ2GOehUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354909; c=relaxed/simple;
	bh=+EYozN7O+JBkDeCx/hgJ+s4q3FbwEjbXAk835pOjKgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poKE8MYrW+yhqDCfz4pwov/piSZhSj3QeyYQilUF/SqQdh3asq73KgqqH/0cn/0/G/l65EAgVk2bDUYW4WbS6ao5wI+jZI+yR6q8wyTgmArwrr9DNzHL6GLw/MImmL7bF/jfE+922xySZaO49pcqviBZimFLSTfO32Z7dHyHxN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQaKRqXb; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQaKRqXb"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-80527255583so409293a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354904; x=1789959704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=nQaKRqXbxKrCQc5ucgj4RBajMhwEyd4ArqWujybyPQ/fOBf9SN8nXpEYDHp/B37Nh1
         bagLBQRdqh60nS4c00hAkfKsBnjyynpSSqEOzh1wLOF9630KkPodJzMnYnRRxQe0lg1E
         /S07zC+83w1TieKGxLd+o1VBrYUCrfhO6ed82VlGNxepGHrgDtU8QcAoHekjJQ/ZE7eO
         ilrBPF9JB6GyhLT5iM2WV/wrfMT9EtBJVVbsKGxH/C4E145OtiDh2beJFQllTrq0/jD4
         nG0GNCvpw3Ou8rFk+sLiq7Nss7H6NT76pdl8BN9LrhHLXz9n6C4fVRI92WuOFK+gPYqT
         VKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354904; x=1789959704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=OO8ZuZG/MIYjca9EbuA0zSuECdr6nqYJL6ivro3lP0/kySjAk/dyrFygnNNQQLetPc
         AT2WApsrbkQaQYFaLCyH2jya+MQkmBJUXPH4bHgqBcMOU3eBMNLxPRBTYSy4hWK+zoSz
         qNP/IM8OmwOfUcTsWkOh9dBkEFTxJYHPKUhv0et8/Cc+hqbhYVHaNyZbuGrkJBqNAGnB
         daMjhqij6NVMqHFy344CCd++hc/ocm0dyAerShN7gJaJbde0JSxWJQ5FMxWPeXFtqTnf
         4mj1fhvhw2AqeFvnVUQZdcnyIWVpMCpV+sChVWTCZBNQigCFJlzv8ENLo2eVPq68U3AP
         aSvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAIpRhLGWOfGHHDtnxJ1hfyXTa3hueQ8N4CN3rIarlWY1tMx3Ird540t2Vn0tniLhSy/1eGo1zVNX4Ms4=@vger.kernel.org
X-Gm-Message-State: AFuF++k1I9qSuXIBaeh5yOi6gtMlJ0g5/EGEQooSuBO2RHU1yG5Hnp1j
	EDuVzRZw0wYXrt6Uw6LPJ8dbS2OxFuEkIrB9HhjJHlo0Yx7AhTK84dCx
X-Gm-Gg: AYBFou2TqWb8Z81NPy5y9WXd+6JYCTWTIHO/7Tl34zEaJz9avJ3M6+PqfMos3SyPMQg
	Y3O+E2cN1w4ZjCZp/8ChmkJSda/BfycmFYLTWZJ9YA/R+YPkaQB0yyzrm10YabDkVImFE7y/H+e
	xpkvK6dhEAc49QqSYJQFexackks4mVaOx86A+C1xMR7D+lnccWSsvBSlgr413lThk8c5e1IZfuU
	B6jEIk4+JH9ga1RLGRu9M0WykTgXxezgLX07BnvwzU4T7G/sFAGxeJ5wq1Qiabrr6R1BuCcSEKs
	t4NUen083NdLAOxT1Xzt5slPhp1VwMR4tVcPelAkZ0p+6F3wi4QxFdNFLmgezRg34HnmXDqfZS1
	FDnJrj9onOSF1twfXg/DcX9h6xb/rOxRVGt28Pd8MbFvpumVdot87JVRAduh9lJOkSRK9a4HeRR
	1+N6OdThuFxAklAfxpEeNHhzHZwvxR6hVqgEbBreohqec/1Y2zd+Nhv6NxPV4VIYvjJkfTjn8a9
	cech7hGlV0gi+KPalQC/V3m+GCG9+FPHvWIDugHMEHMlOhwfVrU3GP7ws6Dp0HKZ4myv62mOfUW
	t3++wuIq6yg/KgbQHslTC6j+dPSK7q6YrDBXdlRm77Eqf4cDz8LAZMTSMpeOSa0xiFQ+RkOlvZR
	/uyBw67HBN2gYKd2I6SO2u1JWWOygfg==
X-Received: by 2002:a05:6830:67d9:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-80897e81b85mr306525a34.13.1789354904353;
        Sun, 13 Sep 2026 20:01:44 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:11 -0600
Subject: [PATCH v5 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-5-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

