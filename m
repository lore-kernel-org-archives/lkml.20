Received: from mail-oo2-f15.google.com (mail-oo2-f15.google.com [74.125.231.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C732496D4B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420207; cv=none; b=uwH6ZV6x4T8mH2DZdHru0+y4evj2p/HBm15Xm1kUavYY3wjBh5UCRJ7DCyLo707dMGfKbuuRq332kDRP7uUgpJggiX+w3/3LvqFB8+DhwJyVj+DfqN9YlrKz332/NOyLU4fl/Wivci494kmFkt+tmJaxyINfYJjfP8jEmqlDz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420207; c=relaxed/simple;
	bh=NlWMHvWo8eC8a5062ul0UGSwTs8Firq1Hsg3xcZzp2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjbwSwLH7NK4bnGyXG5mzmpGvnCTXtJLqGU9PccKg4ofoUENtKUWIdElpzaO3k5fWMs5aX92T/gN6n5bqnl7QplRlnXPqjvcOEeoZFH5pDYRdVnAOYarNLY7bTgIv+ukOPVmBkF1cuYgzTisCCPUKNP+IKy5iRgm5YHYvYUmaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLypV6bk; arc=none smtp.client-ip=74.125.231.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLypV6bk"
Received: by mail-oo2-f15.google.com with SMTP id 006d021491bc7-6b4bff33d18so1038091eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420201; x=1790025001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=QLypV6bkowW9b5a/idvjjP7Lmf1ME+qcN28u8bgC4qgZFtp2KLlz9JlqyCC/Itz6+x
         PuGHN8r8T2sBvogmsLHOqkWFWGHQXFxY+AHIkCdddqCCEz9xJgQxl0B62E20hDZe8PZM
         5vBau6l2gNKobuHMrBLjBkLFx9lN1MIncq6LHr+omG2r9NLaEA7cYU4DheoDmJbaVMal
         fYm+KoztogOV/PRmPzhTfSdyksYk6bDLooQqITK9S8J31C/lxmA6JoHFKFQ/TNO62hrB
         bawju7Gw/Pqg9yVwDMGf4vDCrmkCCUo4mwyVt+qfcsWOKQjSZefjeMUzp0mkrrpT/e58
         AUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420201; x=1790025001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=UhlnoPiEhlSlyeRORozB7s+IC0Oe6DgptptUx899aQ2BoQc31EsEW1fSxdtYfeo6/Y
         T6oUCcHjvzZ5oW4mgECKt339PXisGvVHRjWaE3mb5Pfu1/N1WH4or7UGhNSiM7LADibs
         cAfFzk6TcP4Fs7OMbX1w06WeXXAijv5PMJTdKUOhm8BKZD3mFDE2xAbjfoemkizRNKiM
         0sXxWcoLLn0M1UtB5iHJ717yX8X4DokqCpHhevUExx75n58MEJMtp2lrBL1eDfueqi9k
         AOqPZeO0qHCEqmF/ujHbVXb3xKi6061IptVWPUznSy9uOXddumovs3lISdEa2bWDX6NU
         AvDw==
X-Forwarded-Encrypted: i=1; AKwUvBxOI3ZJOuZZUb+yxl+sjI0EBwoXCmW8S08uhHjGB4XweTs67Z4CIcnNXRbkGA+M4Ys28Ug1njMn5oKtj9c=@vger.kernel.org
X-Gm-Message-State: AFuF++k+jugVqVHjSjYZ86gQ8rV1Sr9mFGeJ+QHKL8M2Qu4wXE6v19UN
	AWi8c2BCsjoZ8jNcetUY6/yHucmyAHdsnXhybpiXb1AaUx+kAOMgMaLU
X-Gm-Gg: AYBFou0xwXkdhTdOKWdTAAFLWAPYtpe4KvueUDCu1lDVXG+68OFv1mNsCaiFZnaSskd
	jVLKpj0vN0EXNtiKe282CfDAqPDW5XZzBNig+SKANhPUG+NM0TF2ryvCDtl6miVj9xbxQhfgzZk
	CHk0+aG5tz+Szm00cG8B37M04Nq1jAMHvh3PIPTk5rHERI8NZzSvklz0DMNd92H+UKtuXmX0OU6
	H1tKdoCVknWB0BvUmRR9TB7mt9CZPuMW7mNnD9hjXPJJHV/plckuygE00UuEEMmb5J73kfqQ7fv
	PrForSpOy9IJB6iP5lUtjD6Uda0NolNucJhAnSCoYr7KT40nKZ4hqdsjf/uW8/4UYP6l49wDwAY
	U18zCnLTeUz9GySjzXKMhgAMc2fzH/VQ1x7xm9SIEOO/TusO/LtRbrw074K0NvdU1uQ9KiPetGF
	b9Yn1YfwuPLZNyU5lsfEbwXfthi4qkZfpXoLkTirWxKwhi69lCJEIlD2tWRScl9VT4lS0bCI+o4
	bWINlAp+qzEj+ylBEzdi94ikKmhT2m3mGGAIhSxLHmB16vFk7gae4PPtTUkVXItecKDhMU1/Ik3
	Ot8OEi13RausTBDWRl1xzDiLAVPLKlqb5TJealPTwn0srsJ2w3QID7P1xhNDM72G1MSyO6DXP01
	ijME5CFNtw31ejYdiyGrSTMxLuqKR
X-Received: by 2002:a05:6820:217:b0:6aa:ed21:6c95 with SMTP id 006d021491bc7-6c53c6f60abmr2434425eaf.0.1789420200643;
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:50 -0600
Subject: [PATCH v6 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-4-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
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

