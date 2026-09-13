Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005238F630
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272323; cv=none; b=f9H1xT7XE3juJM1CC4O9DPn0+iC/FXlfIUEJ61qOTU0LlAPoJPmaVT8SwWZ6wjqKvZApC0ymAiMllNKJY8wV0JrbJ8L1HpcmqAivu0uKNqTOYxl+fol3M2XO/inSujqS68kP2u75bObyu3x0BKsnKQ/0uLZXUBdEw41lM8cbDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272323; c=relaxed/simple;
	bh=ZVisc35YlAHASgRL9Dg/dczoW+VnaymOjG/nj+ZynBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUPSwpl0fehXls7HAyCTBvz4wvABK0TvcUfdQW3Y1T+9Q3Xm7up2ONBR4dxdil7HVzsNChVklhB/j3bQXLRCmQWgIqDvhthoTnKiPcdiuOjqkPbUJ01d3MtruPall00EkesjwlZJQHM2EZPt9MBWEt0ip4JoQ4Nv5IbMSpYjcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM2FXVbJ; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM2FXVbJ"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4af173320f9so1657270b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272315; x=1789877115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=MM2FXVbJasFx45zvbhckhYsR37nQ008G57Sag+vXx8WNk1TCYS1pUJ5cFJqJ7/LqtJ
         QNbVb22LwNitmLHesFmdpuHYGNEetnA0/GxCOvSSqFaunOokmRLoU4NqRRqrvjDXXi7p
         k50lIuvbwWJ/7pBL5oJvjix91HDMb7KVvvBRbT88KsaZUnHsdbVmNG+c3xGIdsVi6+ND
         gjWwgcHP8eFLxKgCLYlyqOwtfZpkSNK+4oFbtDs5ALZG0i7yLBRx2Tsdpvk5MRynNhwD
         1B/XFdgB5T7CX/VNc1wwAUsr4At6Bly81hYMXdXjMWwDeddGCRyk1KCQEGvCr1EL+CtM
         6UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272315; x=1789877115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=ki/p4d7gpFplWfpKkdcGO/TvSHAF5/Q7MObIayomzmWBtxW1jDwfCa8Nx5Q4dP/anO
         NZotmRp/rhZlpyITTMiafx8lLDgPlowC/W7pwqjGhwkiaqxiDJrasoHkXbQUWEGgTkZy
         6LAzAF+scMNhQ5EQ0WtbtDtWRXt/QCXphWZKYphq0UWCjMy/g3zAoBNNUquvoM6zNN9s
         S7y/8+9W4xWK1ur3GaaoAhz6YIikB9n9B6YCa3IWsjtz5xr7D6l5VKDvNAWjokroFab4
         MuP9evAff5NedXoaP+wgorUUUqF8gb2TabhD6czFXs8HqXZGwBy4r0pJx8pJ+Q7Z6Yrr
         OVAg==
X-Forwarded-Encrypted: i=1; AKwUvBwK3/uEg3hWPu6s1ROBZ4lA16nCgIw/wL2B7rFU7sqgDv9czach13SH/HA8WR17omnqilWGgFdIgY9i54g=@vger.kernel.org
X-Gm-Message-State: AFuF++ndfwxe3RqXsjhCR36nN4ABqkNYkrVpNkVmUizRUhFCJtr140L1
	g7p+R9u7tx/rx6k0WliNEbroisY1AntaE09bPiuSigYVSr8hhhh56fxm
X-Gm-Gg: AYBFou1dZDNSvwzCYlw4y2wKqx4CegJiMVRBhkDwnys0F9HsIWa/ABrGQg49QdB8a7O
	nvaIgr5oeOqDKQmI90hfC5cqebkeXWigmQKfyB+rKhOSj1W6A90X8c0rolAWyTTgutEi73kmwOv
	RC17alE1olXD0K7Bzgo1F4N5UQXm4bgkllR5rmIC0iKqWMSWQfPdlBfWixsUa5CG1A68KRf15hh
	tCXSuvun/65hBRfUqK8cSwhX1Odg0qh3u4IukfwZqcY54yEByAr5RsSK8btaNEUHG3MZioFIj30
	lVdoqlzai1oimGIHMMyjrSQi8/ULTaCdCIa93w04C6DgDCoBeXqyvTKiTi+CBOLn5B1sJgmXNo3
	zvjabYcSA2C3ATkbF9UU9SzwsTRmbW3ldNq+ynWWwqj+/WJj3ZDCCktcAiiGwlsNSmeL/t0fusq
	dD6+cZacDQJPOVnxtS7RJzDYJsgNU6Xo85L0yW0Gg2RTPkklxxZ6z+NRxOKVK8zRDK42jCKR6I1
	+RE5/rqz5zvRdlCzo9CrJ1XEvAHRI08ywWkyaYeTxBbB6RkTRsS4fsd3NsO0q9B2snD6ofAhApt
	ztfqVHb+8oHtjktCJd/47cIBDNw/RP0oRl7Tq+0lYU5IGmhs+/dT8Q11tNat9LlVZxbFx41b8V5
	lPGut7QkKU5jfY5EzXJQDKq0JG+Ndkw==
X-Received: by 2002:a05:6808:d4c:b0:4b9:e5fa:8907 with SMTP id 5614622812f47-4c31b4c5e8amr7737916b6e.26.1789272314888;
        Sat, 12 Sep 2026 21:05:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:56 -0600
Subject: [PATCH v4 05/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-5-4a64bed94229@gmail.com>
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

