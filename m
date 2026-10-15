Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22183446A7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028068; cv=none; b=YWOku2VXEDj/+ORanl9Oouyx9wAitmTeNvtcjNqQPqjWiT4KwJ5EmY8q9P8cx2WV8bWl+2hqHrzH1cFcUyTuNZnOjZexDY21zRs6uI+Vh+/CN+SO9Nu2+b1NKfG5GUTxIu/Iamn23YCDLp0ys2XIpIKaKvgjxiAjwSodVyAx4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028068; c=relaxed/simple;
	bh=UsPtr5D7TcSTYM7m33I6oYw05r53iguxnK0xi3GQO2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sv9RhYPyaatkcELWFrTiiu06Juxn4fZAj/NNiSBSlylYl0XdGfwPNcUL6fZ/utRLHg+EZ50UKCpWf5bt5qNFJhCAaF+Ftj63X4TiqABd1oS6WVHwL3N8aECyxn3Gb6iNm3hFpSsTTWzPffWG/6te3KBypb4rpO75d0WvgtgeCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efzaYlIH; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efzaYlIH"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49429181ce9so2674882fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028065; x=1792632865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=efzaYlIH1RwfcnQGypMF+ceytPys8Hw7LX0a860IhdfYIeh0MdfLujmybd+77h8E7t
         VYT+EKGwDCFNd49hfX8+eLoGzyr0l4Ds3OpnGeplCuOOfSOcg5Z5wDV9rHyY/aaGbPmS
         v3RDsOizqdSywxxzSHQSRDYe315lRmnv49VLb1PbbXxm8AUhaLWLa1XFm2cvlkimz07w
         iBudC/HbQ7YistOZXitM8nykKyILzsfxsdy9lFUbBC4RfpxTMpH8mGYV1KJTxlav0+aJ
         u8TMRSORqlTAnBlI13azP9ci5OAvVkCFGlIC1wM5A4pJJHX0GizrZn7HX2xlfqPtUmaL
         GM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028065; x=1792632865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=KooR7Hybrlgd5e6H+5boe1Ah/JkFcF8QnXhG1KTKEU536USkJvV+P6x3WrcdTDSmle
         +Q0PF5uvMbZcd9VNtM681cJT63wipEvjPGBsxOtbO+UysjkOMwyUMzH6o1aXn/5d5YH6
         JV3Dlon507gH3H2CtF2bM4c8LW4sK5l7439bNKYx5IL0OxblgU7n1hsUINdEKv73fWDh
         t79Oj8pPiCUPYSRnmi3wSTPq9zLhT0W+G/ZQZ80NxCbLl2VxPCOENIfY2fom8P9s1d6a
         ock+6NWcc1RGzOebLmtPbBUuuTQqX+bcnAO7x4ql5I8k8YKv5B8u0PYGc4GvNvOnvqg1
         z/8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx98RflYNpPpYWidC/k5QKKWvyjCqvxQaSu3/L8WM+xrY1xC07eWI/5ypU0nQaBnVPHLU7PY6TXIgvoyh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeQ2BWK5cJHN1f5aDDAKewZjQRRvIF0w2FooqH5Uu4TlmIyWj2
	oY6mIIZcV1Degx7T8EYKGz+VoYiJErMbgdHd4qmwMUdKOwBerx1VQcR92uYpIfDd
X-Gm-Gg: AYBFou1+SySwA7obt57ElCTF/3Cd0FdzJPeeyeEwD72qJsX+Gd7If+ZeVeld+TmX3Cy
	UvTCgI6VgdesdlzCi3pRGpQiKO+Nk1sw8M9C74dVsQ2CnYD8xvXCt5l4DJixbPz1V/83A62nwKK
	cw93HJqZLBEYkV72J5cxOANn1gEzGF/I3+3XoTiTUzLjCIdZQv30Zd+/T+SyVkI1q9As19jPkpU
	XBXNGCTgXXCTszZXeuIukkUSv76BnOSyJv1AWqwstzGty/cpL4Ns29umjkZdVUudTXS3MrzHoDV
	ccsiiC5EjZro9OTVtTlH9jCdg8MMMp59Y+40mUp36B25EEUoeYcpTpO2kqzDraCVz3mKC8vWvQl
	SXNo0b9xHLjZNnxS6d/I/4a3pWr3yr8ICvaa7CyQun8L0EsxHZrNG3FdtqAwnfhry5Lig3mR95W
	wQnJXafLVJX4dkMR59YDeNH4x8a4Dzqgw375GXuKZq2Q1iaiFcN+CciYPSOrxym3LpbPjVp/pvi
	wkBVJF9t21FLHyuX6yPX1YZH8983iXDSOK5edyjiJORy/5iSHB/37zVMsoKpz6NA9ieNm2Jted0
	YnZdtoOcNREHWnfhjalAuQ4WkFB6Lul31udQPOaXVidiTGlHYirObZ+XNBX76wK5AXfMHB7Zjr6
	Y1z/SLpVU0EsgH5rQpgKm
X-Received: by 2002:a05:6870:4066:b0:4a6:c1cc:e1 with SMTP id 586e51a60fabf-4a6c1cc0336mr6240528fac.5.1792028065404;
        Wed, 14 Oct 2026 18:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:55 -0600
Subject: [PATCH v7 08/16] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-8-5d3fc6ad2da1@gmail.com>
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
index dfdd8d8aaa6f..6c4e1740a245 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1824,15 +1824,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

