Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904953;
	b=txD6MOiQOAAiUE9eojRzQjN8Dq/q2wWnisA/9pUEi/L44sahi5ufO31nqZ6Gkqs1guy5
	 sBXueeAI0zA+PiHKCzQTG82CszY5RNvTKts8GFwOCsrrBluenCrlpZa3dkza9v3sFTqGs
	 a0BJN0pPqHerR+6k6SRiPN+BW54dn1TxS812XFPu+UGe6ycykY8PqWLXwxE+GsMfRQm3f
	 Of+en8IwikTJCeouYiQ2aGsnv3DIFq3S/si5F61KxYHhlaPn8cjO1xNV9N73x27x4bcvT
	 Cg/jYzpbAtpMhc6ia1yRaszFVRw6wCdZplKxVfITiKS2SggAraF12h/JTAhC2dNVUGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
	b=DAS2hbtHtgLxMWleE3D7T7nvahzIr3/dupT7R54+E0gJ/Eh4StJ6TyXlc+02SPtPIISf
	 wwjUuutV49FAvvjPJLx5N+kyJaPTm9dk4Hshx7FNo8UOte5/PihF/Tt/g8GOiK0AQGDHV
	 vTd+3B+sMjHa8TCc7Ksq+8gPddM+sQwOdkkc4BmRmXbd3qQejm5jIyc1Y1QO31zktO8Mg
	 dUZP4q9SHWxC2Ntlt9czY6ok9zdki+/DambLYMYAXNmtGDI29r6S+b9Q+B5WSaIdfmb4V
	 QiloShi+beN/Jt/GXV21kHVgRJB6QWRuW3E3HQmdIb7ycS0sx1ocpmElBTvD4PiXmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwZvZ94a;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE19606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE19606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwZvZ94a
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493576eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904952; x=1794509752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=CwZvZ94ar1CR+3U7q1Mi7xxnxliKIJcxFb2hHKiFu/l78SIWAH2Vwl7iGoGrNjyKU/
         fWJpBBmlkFm6aC9zLjF1X8ciznnsb6x0Q6TPNC7Oz9+re9UQ82mq/MibxlktIM45n/wc
         Om0cx019lLOmsVbpurX3nQRN7fCE3cppw/aKRofJxIvMS5Ir4pdhu0GNNOGjkg8OLLtI
         88rQZwf9BY74o9fa/zxWxXSmPPhY/ZUY+2Mv9y28FmgaYvM2XPgUv7xPCw2jJGq4sJEY
         l9KaYzs3VxgoI5+2Calr6i+r73WoBalbFdE94w1FfG1mhvLwA1R0J/OpM6SfPoT3jdbI
         53Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904952; x=1794509752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=Lp4SNoLD5++Kt0MlhqSS/aeoz38DOIrmKfTzk8mEN6OC7YLcZ5D2gn8KqLZXCxg8aC
         PrcAhYRqodUh1aAFK8X6VnOKg41u/xOkRmHFilA1akMROK/CiTLE1TwhuAFGhZyf3QmL
         BmCx6Ryv45KMTDs7RdY0M7CZKlTlOk9TNz+hTgaXb0/jVACU40sMddlih7qMUlCwjuSw
         4lzHEveg2GiaN5czzymfCQyKX+GSaE29cJsW7fdsyljlvbhLZAT57exmRVjWwk5otSRL
         8PCY8SRcwa2cpP1K61rdV2AmQOKTLqpiBeHHdJJS7J5CCd0R8DT3Gr9NungvmzMYqd6H
         tTlg==
X-Forwarded-Encrypted: i=1; AKwUvByKPs5X5kj88nb9QEavaFdXGebYjvnydyH+50R24td6hi/8GcPJ3+6LSgOqInXQa91/rWWKR+2rDD6moqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aSrylP0M4owpfijq/JDvv7MSgwydczOI0wP2/HyB0KN80upE3
	M9B2XnCtd0jjMccdWHI+/bBGdnSfa6d5VvtVI/7G73xIWdYWAhyEcN2c
X-Gm-Gg: AYBFou0IAZG8bvLh5PLENnXMkVMMLHZUt6CvB9wZGXyemXjN4sVFf9yaVsBq+6uL1eu
	+lenwV0UtWIC8P3343cLo58S4QaFek8gCkXBbnUK+f/MaAi/G4s7RHooFVBM3/+XfCw+BLwEIoZ
	XbgU4b+P3q+dzGbyK4CSVDrJtOPgB2P8adEQyw3DFJ2GeFIGHLHe7r8EffZ4VJ83JsLtBZxRJ81
	DBCdRSmsRnSdBbGMAhQ1ZifN6d+LZhLRP51Xg8j7bbqSTda2kp/I+Mst1SddtLdtHGGjBeZN/sw
	CKFXBruvKB3Vk79ZfUlooenalCMohjymvJT6aQfkXfsxr/9vAX5E7P0GyipxbGkJPzliuEWvU29
	N4XY1d1ejlYlm9GtaAzFHCG1Yb74yR1msjp4sZdVdbN5P2hzUDkxTqrNymaP9+8lv6N9TAztJnV
	cDX3AvLAH70iFHJivdcXd4fdO+2pVrtjYq95MlL/RTnx6NGwxfUKvSFM7obxakNiypz2idafh3O
	QfXOttjaJAC/KIkPsOyezKTgjB+hWfwEIEzi8XluUdLS0ldmdQxc7WU+9TKPtfxWt2LWnv9iYSc
	0JgFXYZxanlMfOlU2CMlCAg2kRO/obYxELeDHEDlK5pQt/jTJ1o/nJbZyKN2Tmb6CKo7zhHbYOl
	cyCediozLG5oYQ9/ZPsJW+3PWBkzAoWgJpb5Mb4FIuzgWLGiKlICTxrnG+6it0Pxuh25XXonzzI
	wDF/3vvHUtPCV9pcT0UefXHvuyTybXg3xgnjmgfTIPt/t3uxVKelSkAw==
X-Received: by 2002:a05:6820:c30b:b0:716:deda:97a4 with SMTP id 006d021491bc7-716e790f945mr252144eaf.48.1793904951958;
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:28 -0700
Subject: [PATCH v10 12/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-12-dca1f6ed29a8@gmail.com>
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f003da59cbe7..5f57c5998f03 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1841,15 +1841,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

