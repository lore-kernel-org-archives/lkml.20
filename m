Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0D253B73
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122337; cv=none; b=Fkq1HfMOracU/x9xi9Oahy8uXPs/4sYbhy9wDI7NszkqzbW++XswI8BHHa8xj7v7uhXjhWu+Sp8gttbvK3cU4WumZMwMWAtmCNAB8zZVAg90+WUm0CyFkAF/BXOPYd6JQc0Sx68ta3KCbVT9F5aPff8T+3/1Q5aXKXLbtuK6srk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122337; c=relaxed/simple;
	bh=QP1mT8TLRuJ9xSIvxqSG9BInMHYpQcC5zhAAnQdC80g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsfNUmeAAc3ZNxLpFngS+UsQVk8GqMfk4woesaaqTNeL0XaGHMVFqIzcgkWFy3RY7DthGEewwiwR6K+oJfezkp3v/RdOLaKqf0CRt+BqlSf/gtYJxTwuSWNWMVV9aQBobB1FK0VcJpj/4xnOKRucZWzwwOMI+iOTE64xuKtAEAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzvBUbSN; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzvBUbSN"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-823545ce223so2086372a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122335; x=1792727135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=HzvBUbSN2MbNcWNWNIPWj/piK2ZBkqSqBnLaNUlVCETNDjS/mRs7iVIRvCFvcT054M
         gvqJj63drR97r3rdKg+C4q6eSIFgV6p0NulPe7ssHzZ0rXKHNm9zFi40M2xNFWByRPTm
         LfpGoyC5MCxewKglxmo6839sFFRUU/m2BksjsOXoX9btG22Km3zYxMD/BJOXR10LcJat
         kpUdNx3s3yVoCXn8mhvxjK5SnqAUMhKsYs82+P7sVK6HK55LfDd4KsCyMDksrpRMrQH4
         J6f3+UcELS1RfwdjByMmvGlRtQtQXEcAqoxGrGEnYFEMtYYVbQk3PU6NtcwybSaJdRvv
         cIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122335; x=1792727135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=B7U4Uki5D6+7ZBBaYJIjoC/RR+cttB27OWgU9FLbJ6PQHeKj9EZ46UYCMAPBHqFrtU
         mffSK1V0mKzPjbZ3YaQMUENEiFrw2ygiolA2lTW+jjcnO0cQ3pOecaMpPriSoNwc5rAD
         b3J2C8EjQuaFqltDz+mZmS0/Wn8nf3Oax5sWCgjtXZH0yftT12b1dhdAtflxk771i+ye
         KCVKdVbpzq90Mc098oxe08ab1+d3rHBPFCyPuTLlj6xL93SprD3VVUHq+QMIP6UiVjYe
         Ek0OqGapVyV/tATK0bjG5HYMnAjiQT353VYsLXY8Ge7sjmHNw1zr67QF/b+z7uzr1tBE
         hnrg==
X-Forwarded-Encrypted: i=1; AKwUvBza2bUahBo4DP4BSGkM1zpbvCk68YCcWOTzyTP4d54loktNQwvcD+RSToHoNKg20kffsw88osVFrivVbs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgLMqDDKsv1//kf/9mi5muXLi+6+2eo/4gz0Xe7O+RXPfMkym7
	eDWcozK48XiIh0+9KSb/D2I74Ce0jHRGEvyVFXdzPu6cElzLhbHP8Hfj
X-Gm-Gg: AYBFou1WwapF7T/JMPAP8kG0MIMvzTk8QhW8IvHe7QRQY3jHU9AYzmuq8igcFEF+fyH
	ka+IRA42FMfVjAhFg7CO7DyFVjLjRiDjSgqw1F4LkdWxuszsiSIZlVs7PPm1L6P4mfT3h6j0m9T
	fAOvbVX3mSkp7oNnwy1jlwzv2lkipInzqDrEla86ADK6M5c/WJ+ynldDBSX9iFRDFrFooc3so4Z
	poJBabRUseG6mNg4CP8A1QLIelfeywe/Zj+wGd+glfFZDKRV6t33Z/EkNPKyAgwNFG6i8LZLkyS
	UxeKmEtGxT146ON92g0SQ2Q34mlithYPUAh3+7DDv6A7rKCLUq1fFiBKxZ3YyA+Q9Ziyl+fW0qk
	ZeCsYA27AewZBVrSScT4U7dgTiXI+XHmaFYX+kTgf0OP/19MFFE9DqVzm1U7M7IZJy2eYxh5OSQ
	bY+iBcpHfbqgtt4FJjWepeWXk/twgA/uRZu6fknWXKqxl+ug9b22GyPsn79QUBfPRs20a8d7b8E
	gKUGzTr7N7xW187pRo/A+BKxgWLReJI9lKjRW+Aev+qcR+JXcaNsPFONHN6CGus5Ih+Z3ev/NmI
	wMi4lPIguVIjREld0iAE39SUgboPgmQ9X3wC+GTm7t3v6hp7YMOOElI8g4NAPopoOW3ki22pzNj
	ud8YjWu/DU2U70lQewqSiCw==
X-Received: by 2002:a05:6830:4394:b0:81b:9d18:75e with SMTP id 46e09a7af769-83090e15541mr22707196a34.4.1792122334840;
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:20 -0600
Subject: [PATCH v8 05/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-5-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
index f7ddd4116bf4..d71b980ababb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1602,11 +1602,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1621,14 +1623,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1642,11 +1647,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1662,10 +1669,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1706,7 +1716,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

