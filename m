Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299704A0EEF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420231; cv=none; b=NhQSX27Q6ELJO+FZ8a0KjKOvRavlVQgQlAMGzhL8IBHqpWO6/Jfdq1yuBPVWVGVtp6EdV6dO5t2oXSJJiX4UX+gsLKc5XfvZuFCK34BNo92/0Rl3HLm85/g8wZXoCKSjH1FF7lUOApD9yGmIwvClo2cFecVJGDXveH9zIEsJ2Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420231; c=relaxed/simple;
	bh=ZhwsgqB5mjFiVy7QQ4USypPx8q5jZF5EM5tixdJx7b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmiF75S+AY1DJuo7hmoPyj7YO/0NQT6ZO8qjRudWzjTR9FM9rTgxH0jqrqDOfpDKUZ7fH11Q8HPL06oqhPE1QEbbAXkOsaY3fSgoYPySyyBnp1ct3b3skSwF4C2aBkmi9xWjQBXjsl0+Rjf4Z4E7vu2EWQhOgPwSjUwOMVrRJ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdX4kHcQ; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdX4kHcQ"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae739df5so718599eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420217; x=1790025017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=XdX4kHcQtohdE3X3AuuhPGwwYmZ38YUCF1t8fH89MNMGQ5RPhYSd4eTz7IzaPWi/hm
         JxTUqdMpd1xbqwV4mIIW7SsBM77AEAnBVTwzTREWV87z5lLqQoAKjwPYol60iW5B8fcZ
         rpQ51CAAAMufECzX4/7Ib2Vl38IuPA+6YpuGC6El8VjgUToeDUCX1vFUPzBGKj6wjcBk
         w/K0CiyjYANDQFZFLohkks6BgXb77ElCC9wdaNMlCua73JmitCgSsTP6zoREsnqYLxc2
         v0C3P1mL4clfuShcgbm1lUF+AUvGbGN3HRvPw4UxFKA0EgLEz4tNaOAtYVR95PI/5dfh
         XFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420217; x=1790025017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=qkoOQuunvNtqE2jBcDiWaCvDAIRtatI3zsXMb7DNnen43+ZTxHvk1F5zQXUrZ2Ewwx
         D9UTx5kOIcAVq+8F0ezIXo0mt28UL+OR46LdoXX3AaVuWUv+MZN+Crbur5Tk2dhUOfZj
         PD/9ml8Fa1mgRIgqYxZVOd+15/F07uyM/4gKbglOU0o3V8SotJbufRiaG1ogl0M1BPJu
         BIIcXPr6AdnSzJAGlw6bH/ZoXAQmzDFtbaQNIx+V0swK7iIEAAMNt7cmO8b4/hmbuVR/
         MYyz0DNstWZazlqgyqAUom755A1mxYdOMcz5/T5fi3bLShsPW7hWTmoLRTd7x21zovvz
         7GlA==
X-Forwarded-Encrypted: i=1; AKwUvBytA9IZy++aTa1INOuzYxL7zI/sJmB2t1CeUsspGGclRy1ofvl0CT1jEJRNYKTA8IiBLisOo1K5qiFgdXY=@vger.kernel.org
X-Gm-Message-State: AFuF++lwnZxciXz4mdFFsxHDs38Vz43gDdNLwQkOLP2atyoIIGMV+EyE
	gp6ts+2nvM1TA+6HOkFhnkQjYpFACP1AigmiRCSbQkuJWr/8lZw0L9WX
X-Gm-Gg: AYBFou2ZjXV2BNH2D2A8+CnVzr9MAUP3NDXxLiuDRBpToRJGzaD+0OSjOcukLa+pZF0
	brs7/H3bvmH19lyCb5DTmaDuwr/gHUxgYOddpGC+fuOLdnu33+Cr7/bnijiH1lepeL8qRi/KjBm
	AtL+AT5OHKciGqzp12q7KZsDSBwHzAyWrg+06VeOM+BlXWbAUHb+ldW5NOQSmDk4dOIOp7Aexaq
	Q06mZHJ/4CvuZ3yWGhWLyfHkdx3c2FdkpTy0LWnkdOoTaPo6upJY5TLeFLqaLx/+p72PdsFdzvM
	QJFEfDZU7C7KNEcsiY/bzc70FsZYRPA3nN3BhkrSaEPoikB/raGhCMfTHF+6B9vw12pH1X4DJFe
	CxSsoMTw7ON6kGc/t1unA94wP+HnNZbjSzInQgYLQVa2LudYa9nn4wks0JqqSPFtsv1GF5e5N9o
	8n0mmdrY04U9W3UZaoU3udCdPEPORYlXGq82xM4gjC5z0RP62nMNV7V8j1iPHGKPIUUhbg3bwbf
	QAEsl1El0llOc2LSexEBKTQa4T3Tq2R4aiDdgJl1CNJcxg7RWo3J/eFaR2+iFbBpb+kTgVSOehg
	vvjnzapfqvAUMK5a7Nk4MVKsuoVvGqafwI0QuB0vwhxKmmU39i1yXkKs75Z/grZuPDqbsn59buJ
	ohOaewi5oUai1n6f8sDqxZ4EskFi/
X-Received: by 2002:a05:6820:1890:b0:6b5:ec3f:497b with SMTP id 006d021491bc7-6c639498c9bmr552266eaf.22.1789420217054;
        Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:02 -0600
Subject: [PATCH v6 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-16-2fb084fe0751@gmail.com>
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
index f3234d2831ea..773ba55ecc07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1808,8 +1808,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1858,8 +1856,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1888,8 +1884,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1930,8 +1924,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1955,8 +1947,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -2000,8 +1990,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

