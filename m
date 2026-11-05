Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904939;
	b=0Koc0vYs78GccxWfGOJ0lsLaDxsEgrS3apkKAwhd9fiMlNNhBnszeIHsEuazrYFRvKZn
	 +YhK/tK567oTrX71Z4XuQrgzRFvmqNg+PqMdknulaD4siwPpErrC0RrMUA849/Bdw6Y8T
	 4iNtlih5R7NNH3C4aMzDMe1kLh72dDBe60681YF1nBqPKGQWK2f4hR6rraeXwVJg2/QPv
	 i/jVrZDHLb5T9xGl3dPgHipFEEtuo8wbRiCwbAUmZHsStWeGC4AbrzcJU7t79TSqhaLTo
	 9Ly01bBhf6FyGivTEjBpD60inihUyxifOhiMIdUwlokHCi/CRJXWmZZeohXX4h1dlXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
	b=hbFY2J4A5oWwJUkUrDvXMgqL91iJTSREU3KOnzFzcDPUxd+WUorGGSfvkVt6hDX0Cu+E
	 yyDwraCjLi3svctUtArDCJH3UU2a14BvDsl1lqDqkNhwC4wQ+1hiGlaT5mmiZmyxocMub
	 rWe4qe4Qq7sa3Ijn2+ZniAnHKHcJCCJSdUu99IliTnC7Wh1nlcB6394vuRUrdvqZX2ZjN
	 1uceaVgIQRkgzFy7+QIffeVDOD8QRxwdCPE+k45er3BFYBuyhYkhN0wfx9iAcZw6fMJBq
	 EipHABMqtWWQ2LoQjbOsC3pe2gDk3vsm89hmGb3E5hrinOLqKWkOMQNUvlI0iQQC9yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E9mA/Qi5";
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F98606D810
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F98606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9mA/Qi5
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b19e291cc6so1958336eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904933; x=1794509733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=E9mA/Qi50Yh252C3sQFw0oB36KjF12g4wiG58NPgxE6CGKp3W4iXLmEdVPgKhAYj1/
         UL3vEX/70hHZ9dV5QWOEiuzD/3Q0ijN5x31MeLN6T/u+IHis512XjT8HnlPqEH+yERyX
         k3BEYgsyu9iUXJJIFUNMV8AHZfVDG3emRP0Zn8GzdHUJDyVjwOFipYTGowceDmWM7nlG
         4mM2fC/tdu14eyoH2kH7XpsTKmq9MtKogkRgf4DIeqJ/dE1Rzjj8/vWZMxm3IUEHZ4NI
         syVGeAUicyQmRqC+KSuonkJHIlVaqkFSgKzJw0zcFoGAQ+Pc+OQafwj84+Ppm6OAmJZz
         mgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904933; x=1794509733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=p2OycN4yDzPxFk9uq+QlTvcEeeZhuOuUZ2dqwHnf61WrmgHDptiXRnIdjlBKUF49Ds
         JiSU51qMfwlW22gKp5ZuOi7Vk7w5momD0x/4zn6Uybpx2XXXlMURoPODduCrjNF+OoNn
         JFaplzK2JSci9AQWbOztpWd83wzDbchLbFS+umh1u//xn/+zCAmAXKVQMsECrDZBlZQM
         Lso2zXGNw7vSucw5kyPS0f5/zuaD+zLbAVfcXnP2rWba3nJeLD+b4qeoDRmIEd4807MZ
         ebBATV5Tg8HhdweHJPzwYqPFY28E97BVB+H1OH6uTBbka6biReXAslKIUR8XMLAnnvEY
         HN8A==
X-Forwarded-Encrypted: i=1; AKwUvBxcrOagadFEzhX7vC4E87iztNA8UdWvCYFhFRBKyXhbWi8YVXq282Snb4DuwxiAECqxb1+6ZBfP1968RPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nAGo0Kc5zJ3jtVwG7/crrN65Pi7oYO5OsKm6m9qmHdnYtxiuf
	TWcGf2HjIbik2gz21ewQ12c5+bQoJQgk6AWnFkcjHtWhg+9WwbK78EpB
X-Gm-Gg: AYBFou21wvwVCGtOi8OdW3XyxFJOhLfdGV/36O3siU1H/uMgNP9FI8/0G58R7wsizKk
	s6M4gibLd1gxU463ISrckEkpk6nXzMHe2pm+x0fyteuQn5cj9u3m0MwfWCve5sKe4L92IS2V1o3
	1Bq6clHTNJWCyVPgdLOqchFDXAELKxHn7+XKL4+K6tIb3sV6fUa+gQ1lc7rXq7XISw9ZKO5DFuR
	EKY8Hse2479zk2wiekS41nY8oqtnQtre+8Rd5v7E87sqJSrskYmGgGGc5xkHYmAdLeRXl8SD7LP
	Y8mADfpvH+DBBQuSc8zppLRXWuCloPEFygwv6pstcOYAhHOkjp+0AKHfDf6XhMyAESwtqDg+cnP
	eEHUsEHM2rORXoOBBVgZJhGVfMKr/tMP1af6+I7xfa1f0fpygUR03qWHnokzCCzV/STIRSeQ3ar
	ybQD3aR/0DEy6T9ETMz3ZBTWAHwED60QWLKOsrGiOorPD5lfRmJhZFhHeZhV+AQ/5Vs1MzbtG3J
	jctlw1v8bISmTBeHhnXac1z34k23kQ9ar3v+qiAvGZXdiq8/9KV0N9S6n/ZM3KGaj2CYLwEzKo8
	A0mPUoMgrIQ+NTLB5Tm+Zh+2WbipTiSkm6fJVVGl5htwqFzHnop9w6YyTqTDvuoQwzKVHKiv4Hy
	aqtEqElKu8ozw7rWhdf5tqoDWl8VQ6Jo0lzGh3ZrvxQKiPYAr8qkE/kSYrYP578/d53CKOBlLDb
	ZPt50WvgOM+ATMgazs0DTDQ4YWhOmAxiyfMoMge1q0woP0MKPZYfgxV59akfEmd25s0BkM8lczW
	g==
X-Received: by 2002:a05:6820:7048:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-716e73a98famr324182eaf.13.1793904933325;
        Thu, 05 Nov 2026 10:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:19 -0700
Subject: [PATCH v10 03/26] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-3-dca1f6ed29a8@gmail.com>
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

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b75984961699..662d96fc2535 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1513,8 +1513,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1537,8 +1535,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
@@ -1562,8 +1558,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1589,8 +1583,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
@@ -1612,8 +1604,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1652,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);

-- 
2.53.0

