Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B8367F45
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354925; cv=none; b=NpH/cYcliunKOkRTnZw4ZiStzWGzuNaLMBnwvUfeo1diMR7wYbQgFaLaNXAoJEII4YxREs8XmYxvBpjN2GJk4IWNyjnEQJgW48WctroeSyK179+GU9a+oqRs20JPmWcq4x6fHGWJTEEelo2pWZQYQVeJiglVHSPkiiLRFUMZE/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354925; c=relaxed/simple;
	bh=NZw8JcFCedJgacAoPkTIc+LEMQt5mQHzie6HVHZKZUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlejboJqi5t1u2rk3bbSzaWKHfKIOkTLkaOqDKs7fXuruaypwiXOW4MRuqBgeMImpMnNImmKnsiYyCaJXqAf+E5xu933/F2/mso5C9++QuwXQMnQWoswUWqfcLRtvzz/LOJgH42zKw+9ItYLXNnbRiG+vB0KGHwK0/gO0E3rinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLF7stn3; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLF7stn3"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7fccba9c675so2923029a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354922; x=1789959722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=GLF7stn3uFUaxYF+6rQ++6ncVTH3tyEGVbMBWfAVz8eEpmRa5b00Tx3ZDHy0K5HEFw
         r5GlREbXNPJd6EuYcp88X6dhgwVmc2eOvGv6h0cFCInr7w8M2t9DFxcNsYAPXZT7f+TD
         HEUey1n4Ge+75lXcR12u7fP0aRZkrkBTgDK7/rq3LkJTw7/+rAp4BEwSv/mU3UY/DgGo
         RN77dEFlTKHVeZDKuooa2khyiQlYktGOrtmAHY18mkU1FLXO/abtFdwEpsEyT8/X2PBH
         o48EjoHT2zIr1M6jXm+4Ew7rgn+juo6v6x+TvBWqbvJDO0fTrQoEBsLEjlcVmr1UZZnE
         CjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354922; x=1789959722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=NFNKEJvmEXLzqcrDdYOYlXNBkd5Ch9kq7xCXSTaTEFEi9hRjONJaqJ7dZICTWnZ1Kg
         AxlP8e8cyto+yfzpGQzbfD5A6DRgZKcxS3/1/auGOX8Hb0a5Hrymlkqaw6RqCuMBZw2B
         dh2TYvydyrgLVa+gwQ5ZsiWE2cZ+l8fa5rQmTIkxfC+DkOGTTiU6si1Y12yeORHr/H8g
         X40Yw0/wwwPrHDSMgjyskXlRrL5cBC1/5xUKOjdj/mehwAib5HBUZxH6pagp/hoTO1F/
         +xm0wwjtQZTsZZRtJThhEJGjqXa9i0wpM129h7U0t8br/A6scTvR9pfi2UAHHGBzJo7p
         d4zw==
X-Forwarded-Encrypted: i=1; AKwUvByQE1DPwc/ftmOZVaJo8DCZ+Jt5syFCad3Cg5XwoefS7ZFAICwcV97Ugb1hSkmDquaL94IDocCbZ0Wm+9A=@vger.kernel.org
X-Gm-Message-State: AFuF++lthO9HEFcye7Wq2mId6xaDsnZEb9tXOAzOjy1m0p+VH8ZLPKq5
	rpXLUjcfkRL0V7aJyR1DBG57kg6UV8eQ2U4NyLen+8F3qxcXppd/dtNl
X-Gm-Gg: AYBFou2VZRL23zYN8zOllgUAeXwl9utp29+zXs4AGZw97HE9lB9Csq4TRuWk9cqB2qr
	qnhvwbU9/bmd+xEGZM1WrPSelD4Z6AohW/ICRYoCTuiatODVyjkl5NfMUoc9WBTZxPgHlCRdm9g
	gJrkhvLvjTTaO6U/aDH7Q3XAaXv9eWeABpSbSvwJgbUldGLVcsXMPp9C7wMc++oqjttE2BfcqoI
	CLVQOOdo3g7eOA7m2H1ExCDsBs63FId0+xylY54sg+NJs4kmZF9B2kgkbHDlRsB6sbBsM+moACS
	THoHdDBanck29xq0EBkvv4M0NZnYVYLmnvsz+xzIwv9pTS7U4UQiUK5G2j/tdOWEg7+4er64Ifi
	OAVbs9O6VVf/X2LTKurQNy57rdaMReiczshtHg0yUkeG26yH1j1sSRgOJyExS63fo9gURWrraoX
	w8d9bPOppIGpJ8cSNmYXfsnFJAObkyH9Ra5EO256M5DeQl0SnN8FqglVCUx98V0kJyA6cRzBG39
	F9rwtapo27uSuX6koJPfdQsu1itYn7CYwxA9EFUPVtkqCniZU1LJIp6g0fb7ql1TUw+rfd8JyF4
	PTbEeWYemZXpMQOugWDlVKrOgGbvxyfcszAmzVPvhrlv+v7HVczmDLfKMdL+jQg31mSRmqUp9vr
	8ywr4foE/n+4vwE1AbIorZAmTb0Bymg==
X-Received: by 2002:a05:6830:6d2a:b0:7de:9b99:a8ee with SMTP id 46e09a7af769-80719632b97mr1941438a34.9.1789354922030;
        Sun, 13 Sep 2026 20:02:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:22 -0600
Subject: [PATCH v5 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-16-7d711076a6f7@gmail.com>
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b7ac8d7b0301..4103337f6a07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1794,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1844,8 +1842,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1874,8 +1870,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1916,8 +1910,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1941,8 +1933,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1986,8 +1976,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

