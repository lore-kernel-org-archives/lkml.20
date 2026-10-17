Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C47D48F03C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266387; cv=none; b=YniPZos6NGnLjQ6hxATlLfUSvmmzHJU5ejEX8PClDy4JR0o/zRelaYwvlddqjyn7XuHOQXOt5Mh4rOKjAGHBF6ODhPUvFNK1zDW80fUi0FH1V6hnUJWZckNQk07wRBhKu4RV1HhQLmqhSmV5Iai/MNhH3p9DxjOEod3bBGVwuDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266387; c=relaxed/simple;
	bh=a9bbrlPbxY2D97Or1Weh83hc/hd1sg2iaNGPjE+jr64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uH8ZaMaY1VisOKxvUjnN+rrs9FpPZ9mnA6MOCGV4Qc8fnhlr9cIKcPZtbsFAPHW+BvPeD0JduwlUTvmAa9k+GDRzVZqcKeMFz/pyAfvOzrPiqcTjjyADoW/0f/Vgkq7bvC73vjHcC8JcAIcithu5mfe5gUdZ04SIKCKA61cf3JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMiAuBbG; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMiAuBbG"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-84621d8c7aaso208246a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266382; x=1792871182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9jTHHCWKanN7K8lakzXwANno/EOLzQpBktQemhjHz4=;
        b=lMiAuBbG91EIUtGsIHONhB0w6Bp3fLl6NSPiZg9/3mK52hMufyEGeQK1VYwCtSRHsh
         5WoAwQL6vSlRpP/FcYjZg6Puag9YTGBLETLrqeDBGxm+EHf8hTPVzKxqGBWSsL+eTpmc
         MSb7s/B4Znm8xjnu8CLDbsWpq8SsTqkDvfyHtTB3dFepgOoFHNAcVSvwAScru4Vu0F/3
         6Kc2yl119VoKSpOyOmx88pETSlhszUrjJDnBms4qEgZMrHq2gkHM6OGnAXWPiNMpHIZ4
         x5q9cV6JZHMrkPfsiZstJVDf101HMh3a43g2fXL/T9PsrvlT5LK6nNX7PsLizBdrzzqe
         r7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266382; x=1792871182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9jTHHCWKanN7K8lakzXwANno/EOLzQpBktQemhjHz4=;
        b=iVCHhZRQbsE0QCR3p21bc/QZvGC/neEjCTiRuSq/9GbYC57aA3XQQBTtB9Ih7Cnup5
         yTNo8Z+NblB+XxS49wMl8IvXvEoFhV0YT3qtnm270GoeZwS4i0HrBiiKYLccwU3CjZD5
         Qm7BQ8VORb9jR/BzvrLgWyS9TJwmkRreHbTKquIqcqr0Q2s0m04Aa2n74fhaEmvsNbV8
         LeGKe7hmbEH/tIE24XslxuPAc484lnPdFdXsnYMAhB99OcMC+twWVRv7W60ycs3Yo0ix
         7cK5Logg0aiFbix7Sp6EykDN5J0jN4CK9r1l/nG4++ci3rkEQvAmXWk7Q8uukAdmXMrn
         mBFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeombAAAD5WFZtfhkLCI/PckV84sBGA4pKUsLXjQOj/BCUIexQ2/nWanIg45yyzJCNj/pVU6uvJGjoTQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUzU9yyVmp/8jSCISUnXnDfGmHdUBxPKXnAgGn+4L0WDsIZ/Qz
	XNxwBp01uKd4jBn+Xy5niT25010/CNcFym59OTO/Lq6sbXnGY82QMza9
X-Gm-Gg: AYBFou3TdK8Hu+rvWfG07AhagoWodHPXceRkz3lubramVuRlZsPsRyCtlW4wB/G6W1n
	thuavT+BGjuz46em9zPseeyMXncZEMif6GNSKHpSJQKotOxJMqQER+r83tLIENt6Y6wZb+ZEeaw
	e3fUXN8ZAzi72Yaphdz4/cUuj2h1sAy60i2OZOIuvmX1i2Fj8m8Goo01vGXQG+s2s0z7icx6f4v
	EoG7rT8j1gXzxRnoRTrFvl+aDWDVKKxa4bU3XQDs0Unixmiyn4+jFJx1KWyLLn1PaUcAO2z+9p2
	iISzZ3Tnr9mX2ByxOzvwWaVGJhYTtS3NVsCiErY16coXY1mJrvCarA33VPsfHlIG17qsQGuYtfJ
	fgZ/7IhK5JG+T06wnDVFIl4cyVwAcNwiArVX1edtgVXp2fOaBZitJpxEHwtRv1SzHkBhFKJrQdL
	5dSYfpT52JYaDuVFjqLQaNlnaGP13Azs2Q1sGTCO7dcA3vgkmRXUI/RkBz1R3kxtpksNOvarwGv
	wvQ+qSQahm5Wx2QN2b1RfrE+3QPWFkAUsRcQrsr7rqLEyQIoZ9tQVXYeqsFpPtGfQpS7lNsyYvs
	hKBKfn1J/0WMfZ0O5RnSgWpn3FCFr261IJteUHBWKn8Kbux2CZRxu3Cc5MhoU/0MAK+L2SJhqVI
	VmM84PlyBrGc3A8r/034i
X-Received: by 2002:a05:6808:3086:b0:4c0:89e5:da46 with SMTP id 5614622812f47-53ccdca9f83mr2990622b6e.32.1792266381790;
        Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:01 -0600
Subject: [PATCH v9 06/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-6-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A page program has three stages: send the setup command and address,
transfer the data with ECC, then send PAGEPROG to commit it and check
the NAND status. The PIO page/subpage and DMA page writers ignore the
return from nand_prog_page_begin_op(). A FIFO or command-completion
timeout can therefore be followed by data transfers and PAGEPROG, with a
later success hiding the original setup failure.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.
Keep the successful setup/transfer/confirm sequence unchanged; this
patch does not add a new controller-reset or NAND-abort policy.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5b736a4a7fe9..1db6ee18594a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1614,11 +1614,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1633,14 +1635,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1654,11 +1659,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1674,10 +1681,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1718,7 +1728,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

