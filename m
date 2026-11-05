Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904947;
	b=cnqwqgLAbdU8q3QtnPdIGYCCVdyUsR15g3wKMbJc/fF+fdifuvmgyj0k0czOIBy2Z+pO
	 RCkrdamZloZ6iCOsVjv/oEL3nCFkILJms3VESnEiARlcl2Ql//P1rwDluMZeDVCCwXR7f
	 HEgKT58J/K4iVdxGAYrKGl1O2Aj8++c9p8uFoAZrTzy3ArHSDp8RTQYFJgnEq3moPx2zA
	 ikC48wZEwc9+i82Va8bxPS3oTexm8Zu1VijjPpslbFKpHjSgqoQD7zTNlKNm1M2kBjEBv
	 j3SVynEf0KDEQ6QLpc/qMFXfb1DhtDj3+kN7XmmqOpl7oRBFh2bx6hv4/c87Me8ryaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
	b=eTxsc6stKpIR48ksBP1QmNOZ7RhEwoYrGohpG3dAu+H6f7BgJzjhY3Uqc3roa6b4N4DN
	 1m4maEFjYOJsVQImENkxw7GmYJS5xtwMVyVa5P0t3XPF0y4uEPJX9wJmBcLrucQ1vLsK/
	 PYK61xgAm4Hz6lVJq6n6Ktcyd4+6Tq6+cJ2yorJnjRDPhEnHVUlI+JYRmNvf2gaoQ3IpE
	 KfK5JrvrhR3uB16MnS5rY2t3tU1NPFa3RaUO87UEp/LIlbcZ8CaMtY2USXLonuoHWSF4g
	 VshkmRqbpGNs/f7sEajEuefQoa6/0SwAhDvXGK5aE8LfeQiGBp++W8AI8fbwV/tWCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mD1J6SxN;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC5606EE8D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BC5606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mD1J6SxN
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df5e315bd1so1891443eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904946; x=1794509746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
        b=mD1J6SxNV2U1XHayCaxbeXKlLablODse+M4pLgQrTlgr1Pek2CTlEvU0y7fvsjldZA
         7LW52xfotoPZEN1fSKUL6FvZ7BcDsY06chcEYNqNxOuPjDj833H5z9uglVfl22qjLs11
         HHU7V7Djy30ndJfC2PRolarUP5eMqv1tiarNVgUSykn4BiPqEuM27w8w/qqKcVsuLVpg
         Un+jsWjTTrBLQzyiVyP/sXMNk2/RozW8MbV82Avx9hjNGq1muwdUmQodOSYb+1JVa0ui
         RoRTjoYLNFCGCYuTAWgE8wCLxRpfisDZkxIQKdM9fy+rF+895srsS6dVDnfcMpOSH6fV
         nGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904946; x=1794509746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
        b=UD2yHfkQaK57htmlN7XfI9ee0xw7Rr9t7vJZc4tnoeRQjTa108CXuZEofEYn2aMVZs
         iEgPkPF8nR3p072y75WLR9oIhrfCgcQHxRKUNrpLkyfjnqqGrYjJ9PZ6sE3yD7RYcf67
         EqWJCQlDKwhOJsf+yrOdyzu4Plvjauq+54SFJ7bstQOiz+AV0yPyfF9K0vdNZ8A6F+N2
         6HtSwwX9e+t7iUzTZncPinsPsZNZrHqsfs1qnBbRl7zkzp4jruLyPEJ8cyKr0wvZ6o1z
         w/xBG85mvldLChRiDLRx2AyOun/Q+xY/Hf1IuL4k1fqrRQom2n8MdC6V+9qftLnCujn5
         xXNw==
X-Forwarded-Encrypted: i=1; AKwUvBxDHO6XaYz+KXU2r4eptzDzzwsoXarcn77PRhvNeMJzRj5F1HhOJVBPpP+ORzQR1iXfcEbxDd5yXp2LjEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PZElFzsRKAsYEJIbH5XwHnlbV4kQycy0UQaKqo3vWmyNpLfry
	sTpJtMKxXZGWPprZyJTcQdTpsVk5f6Si05VsHlk62hTvkCp1BWKx0257
X-Gm-Gg: AYBFou0iVxk+SZPjQ84Nojwxx8G31QYC5mKpMJp5jW99B/LN86f0lJbvxfUlXXiatU3
	AkcfnPW9QqC68cjLgbPS6h7pjch5Urk/Xriurq1g3kGKy1QGYZK59huJHQU6mXkMJ+NFcnUPaL1
	DYVTP97Y/jGT4Gt2f9zwL1FPWRwqou60iPdDWpCWmyZQYmdR0j5fltAs1MRvN9bb0v3Ym19uk0n
	4Gas1zeNrRapCc0V1OwpFhlM828aKEuBzPB1vB/9xhTt2uJi/Lo44onkI7Wq9ir1ZRRyOl8AcJp
	3rpYDhxa2gG/l/LPXatkiynYcMkbvb+2yBoTRO8OK/pncSKkWdYGnmUmD54poUViYQdYjUSsE6j
	bJg4O2jY4MAHt7EeEosLyMwgLDcQi8nHgEYzSTAkS/p1NhyNgiGbU6kou4rGGmnrD+/e9lEfLh6
	UaErvHEepscFki1Jj9vboMAX6aYyTC+X25LSI26547BmwqonjoOZ2QIgabE+dxJHWGVOyAB17p5
	AbEeiqqRm0Gs/LOCdIU7YDn8I6qsB8d+p7VQUosrZC8LEp3drd/u+Toc6e33ljwos/8SGu2CXCY
	1nR3dEDvSH5S2US8Gb9OU+xWe+c7TvMAUyObN3hczfVs3UJkAlKTeaks92+vqIAh+2aP4YvP1km
	Yqdot6Mi0HmWzteEisaGBy2+3/3qlrSkcw6Pa0Y7mX4q56ZPZczj+soILzyJeIoLEX3qZ/+wnia
	UeKMyQOy4MaQsyfMNqexB6LT/j0gskkVcQsmdGhW0KHv45XsJxLeqi
X-Received: by 2002:a05:6820:2d04:b0:716:cbdc:4fa8 with SMTP id 006d021491bc7-716e796f91fmr333364eaf.41.1793904946065;
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:24 -0700
Subject: [PATCH v10 08/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-8-dca1f6ed29a8@gmail.com>
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
index 111094b1c64c..02aa02d2cdb9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1611,9 +1611,11 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1628,14 +1630,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1649,9 +1654,11 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1667,10 +1674,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1711,7 +1721,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

