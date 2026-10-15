Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E632D0EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028067; cv=none; b=StTt/9UY5OHRh8W8uwdfjzu2zQqLGHS+RJFV9XTgJ8msk0ytH8bgbZKVOGq7rQ5XEptqMzO29KLJvhiY0xs7gFtETqZx9KXVjo5xi9Rr6nVnr8Mjp1YmsFK01fHJXi/RfSWSGNARB+4/VlNA/s/tKe0PJSplqh/7O0Kh/3afoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028067; c=relaxed/simple;
	bh=JonTCMkfo5CDzyNZ0Z71f8IamWNK7BpOBHaurYUB32M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmBwV33ArLrdmomnEzCf2Ocrz8F2hTdi9PQyIe8Gh8sPfKM10v0ICQJjjThP7sUO8ea2j1bJ5IrUTvHdSvc3CJueNSzto0S1LgATWdUeMTTE94jq/r5e5G4fAfbQsU5OSvwXr1rH4ecTDQVG683IxNYtFp6Gh6OxwDzrP+9htaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIoejT+a; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIoejT+a"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so4367723eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028060; x=1792632860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=TIoejT+acZtGozJhbfqiOg9l9wydjd49pnsfdTJ2OjuvTgEzlem8hKascL5382n/Yb
         QaOIApVDpH3SKQiQgbsbqKfcUBquPu6cvjLzDtpH48Bau3VoP7rGHyT54wK3Xjv+5lwy
         obgkq8SaUIDMsJeRDkAM533V557t16N2ZZOXz0jge/bTJv6QofCC7diBV3KKs0CLcnNp
         dn/cx5sBKQ8aXs91MfW8Ph0uz8GMQj1/LzH31V2YpOUEWzThBYdXc5xFgQLhleKE3iK0
         DZtk76Bs37RhOx8rreTS7a8ZtEIl37m8l4Rt7QJtjncmFUiR10Cz9kjLAs5WG3+AItVv
         +iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028060; x=1792632860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=pveR0JXckgu7qryJ4ieoslTTeMLIID9C6UvZ6iIt6eM1c+3mTt0V2LxBCA5Be6dAlA
         rCe/T/fbUg1mxCR1yQFm/5sHClhVEL2RxKWkpxVmF1TePPZc1HCbhaZvWxSmRLZc8LQN
         RdvuXgrDlx7048tRZ7Acm9baqyoOnxeZz9Qa/TtkFTGM8jbEqRMKNkwHiN3HUfm3asCY
         5FfWQ9MIqxFG/+8HAe5WsOh6DoXtao4lGpRyqmRBhZ98dzGnzEuSAh7wTqMjs19H6zB4
         067r+7+tNLR/Xjjz+1mUIZUk0Z+xTWqEz+st53pOBmXhNv1YbautxXSan2j2XcjtkOg8
         d95w==
X-Forwarded-Encrypted: i=1; AKwUvBzg107z2Xg5/WoqQhjucZBe0mugwJ4pW/fCd9KDLqepX1jj1Ck/bklrJZXDnEesZ2waitQK/3F8DgalULY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKSdWjpdvUVvcCaftW7FcVLIzRCPmrX7DaL6Fd4o0k2QCDPnmM
	LHyiHAI0+Ez31N1HLVmRt5fQnWflzt+EXWoH9GWvYZ1DSupFOKQiOAVuBjN4dGyX
X-Gm-Gg: AYBFou0PvnaonkiiOMV/guPbqQUkA5nZJ0bqbu4ZLzK2yiOnCFDWohJ3E43YYv9268Q
	W1EdzC5ulZLVODY5XNYL7wGsjqS8OJrNIHKcOkVNkry9fz4CEjvLzO7dqcjf91Zt71x/+x++PLn
	pPson/F7q7AF9EFfglaxzhopwvUpt4U0JBL7BJgiuwKiud6gZRODlTrqYEr9oVrzvWMylkmtXtu
	GznyrVEB80q363kA0GpvvgHdRu/dAbemPpCvdXkrgx1f02QRUFh/9CFc8G96eiu6Etook1NsXNE
	XQWkoqXShx/ZgMiBZI+7VlgMszNzRTJ0HNnwyv3eGJJCN1M+LtJj4ZhBjNG8vGaylZNYdR/bXIN
	NERW9lyojwzrtLE8jeni8zRQvlT/BOyr4jBgr8oK4keYGViK7xiIjISAtuvyru63EVB6hdVMYLw
	mwOZ9Bv/XXnPTS2C/vqkabAD+p/h71R7b1bEhQf1Kp1ZGe8e1Go0GF1A45O6MTVJ8DEwBT7ZsTG
	ceHLsWo201ldyOAqcoPZhuZMfExTxAUUpuX7/0P6JL9IxnEg6xS5OCsH4IzQetN6K76WUAoEcxN
	+9U0HOmP9BQhW5MlLm0w1VlgM2QL7tX9BHSFk/dzEuvrJviTPyyW3MXhagdf47vhzimu9wTXYRc
	DdnqtMdLWn2zr1lW9T010
X-Received: by 2002:a05:6820:4d07:b0:6cd:3fdc:6001 with SMTP id 006d021491bc7-6ef115523a1mr12486639eaf.82.1792028059992;
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:52 -0600
Subject: [PATCH v7 05/16] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-5-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
index bc38330c0e36..57df88099206 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1595,11 +1595,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1614,14 +1616,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1635,11 +1640,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1655,10 +1662,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1699,7 +1709,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

