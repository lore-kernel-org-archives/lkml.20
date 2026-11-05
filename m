Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904933;
	b=4CsEgYEj4v3yPFszUw09w2mXGTzQPbMQyDuEqSsjUlNpWl9aO4aC679BimDhmwRN1fOu
	 Z/NkNKArF90cfrq4Ds2YVGf28cJbdnaMUAT1YyZhWNOrUmCBw0SjBiH3CNa0r6iPhDyUS
	 F4ignCLYKKTS8PhH7af564orWusgB34bdNWrRZb7CAlaJo8JWyBFZXGSFMFKjHbiYVI+L
	 A1hPhiRZM4ML/YMBssUnU5++PXK3NQX3Kt0iUdWJn9l/q/LNDmlRhPtNNRrC8DIcIZjhh
	 Id/hZjWmS10ud7pLZFk1V0wy3fCD5uuKu0PNox0B9GfR+cjuevq8+4dsih66hujyGew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
	b=hG3+FcCZ/i2IA0xO93mT0ii6l1DnKGBbRqxzt+UM/apiNOEyRROsFwrZlDpZACFu6oDO
	 91w/eDiKIeeU4sUK4xNhVV/vJWilEBbaz0WeaIHpYx0LYGTa5xPaW0fwMaL4N6jLUPZXx
	 VFo35pa44w7qYz+bI90PbKIECJJYmspIT55OGNWNt9/WmdOPIZFzun5v2mJWxGaG8550U
	 M/7xtDrJU68hsA5iC5m/263Pp12C/ycYfdoa1yrjjxNhv7IP1UsLGkY54/UlEUoROgKKy
	 3hVBt/RANm6L7AZM6HCfUKLR6B8z1o98Fp33hy+xNdy769QiEM5AVnafVf5DkGs9JwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xce7ppmN;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9241606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9241606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xce7ppmN
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-703be215729so1031749eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904932; x=1794509732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=xce7ppmNcoED3tCdkzSqrRF0Wjb7ajno18o3EIxBFPj2iOob112Fyp/U60NWNB8YYr
         koXyLtGb5zjxsDiRdRIMFIvyfAScoPiVJB2mRNJfEwYZUwDCnRsXp8mq21PnSdBaEC8h
         t78E6WclojIGuSK1VLqf12YE64GKuY4/2b1PW//s9/OqeKe/nIegQJlQ2EHqBcZFsrk0
         6fDNE1Jk/K+GdzwwXwoZY6XpmnWraD4YszepKzbuhzGRJP7mZptKBqphbUbuy+6dLGzb
         9h8PO9QU+lT3EK9+yYNudXKZvitcRL8zh6Ip/yBz4peIl5BO/DTSoX2J2i0gNE4FxFdQ
         98zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904932; x=1794509732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=dtHLm21RA2sX8cC5zSKeDYPYv8qVLC5X7Kd0Ry4fW/IglzV40g9hrfTQcJe3TeycKI
         NWJiNDRl/ybS8ocSlthPS2tI3aQIG73SIOqEDHdmFV59cO7zBUhb+y/8UvxvX/cUlDSM
         oImViQ6aPQRwq9JMIa8kIX0zcURwfT6OSP5uvIfSgI0sW71nSpcJSS4DmCH2IUgxnYFe
         3H2XK2Cq7CTraDZGOzyRAhJ6t4u6IpwSwCsQEJxJycNOsuWyqKuqM1QlWZcDAZWAGZ8v
         cvVh/B+Ii9Q17ARoWICPd8llpQa8Lcub5yzebs4Od50sZ218A0Ztt4sOp3qKjJMkNn7u
         Ro2w==
X-Forwarded-Encrypted: i=1; AKwUvBxEKmspXwp16jkL0IDXp/cfDOlcmNNAqiV2F/VEnaLiqn/lVCgqSRSoOqRCv4xKfIaLXr70seaEw0ZAm40=@vger.kernel.org
X-Gm-Message-State: APuU4Z95/jT/XWVmLvg0kIvk33FgVe4Jh5L6LgTQtAPzc0FyP3BG2Hzv
	PsbqSrdJmhpQLov50x4D+F4ET75ZuMLR2gtIum4Mx58nDvIvXk6k/pvi
X-Gm-Gg: AYBFou3itLk+1q7r54P6eE1MfzU1ecRa2rqece28cJv4fGy3tymdtDXPrUxGGhOsp4D
	mwKo3Z+aWKZeboGoLogyf88vft2BVlX/HK5dwatpEAE4g8R0ZClN5KfNA5z7zHg6Uut9TQeFD60
	eoW5HLv9Fxo1Zfnq+hfJ3ZdF6hfZsWGrofRtSScXQzEHfw22Wh3tXYEsBewYEPdxXnKaB9xoUSP
	jaOCb4nEDfyVH7WyhQjEwQ/WNChVUBUxo2CILdWAbX3m0NA4FBKGObg+akaZ9lmAnCNQaCrpe5s
	JcB+2gslYIftwQ1OdJiX+IXGpUvkpw9g/QbgnCBhPMgbkeimARrkPFXfCD6cBli8cByih5/qN2+
	4s2URREf6yW8jVCsccdxeClT4HCiHSbY3wGKpn+kkaQ9rS8W+xstSKECE/TOwLRXJ3UEQFecUQo
	Sjc/16WVcBUrFnyTBzX5G3pL4+61KOBDPkdJItXksopyoK5knJ+NuJb1cN+SDwV24SB+ibpSE7x
	8tzDjdsEQA0RWz838xUA408yx8RjZ062oBq7z64WzRax0x2/LZKbS3B+Wrcmxwj9iNndO6E7Xmw
	TUzgGyPkaJk3gDR2ntAIEMzMkZVzvuSs85t45LNlXbTWjuFukdJ6kxd44msOuVepsM6lhKdt/Lw
	+rgVV8qjS7BWrKnrDXLnCCBMo8TBcVwYe2/I9t4GNJSAJjAPIz1z/1SHQb7pxi0cI9lSX+UqKuu
	uft92sKkfXkDYe0o9EVTS8IS7Hx1n8LYSzpRvs2B31tDNKj8msGCd6qj4BHo0JedVS6dG+qb4Cs
	g==
X-Received: by 2002:a05:6820:2484:b0:6dd:bc51:888d with SMTP id 006d021491bc7-716e79f15c7mr263473eaf.87.1793904931737;
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:18 -0700
Subject: [PATCH v10 02/26] mtd: rawnand: sunxi: share the buffer transfer
 chunk size
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-2-dca1f6ed29a8@gmail.com>
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

Use one helper to determine how many bytes a buffer read or write can
transfer in a single normal command. Keep the existing SRAM-size limit
and command sequencing unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..b75984961699 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -659,6 +659,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
+static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
+{
+	return min(len, nfc->caps->sram_size);
+}
+
 static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -671,7 +676,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -709,7 +714,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)

-- 
2.53.0

