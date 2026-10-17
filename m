Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BF6495038
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266398; cv=none; b=IRRbuEgICBQVz+Jc7MlYUp3G/7/TD0h1axTuX7c4xt4Wh/cSFgE63RErNeYQep9SKuQxAeYQp/cFRAf85TJNkcEhykFSYa3awfShT9doYMV8EXPqnBlDIFc1xsdtR+DP7twfYKN3yeVtSsFZTPtnpPWW0zEP49YNgThbyVhzbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266398; c=relaxed/simple;
	bh=m1ZuakMOOcoJ2UTtQA9uEqk1ka8SS9czOwQlxYyqTGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ig12L0PbDKUgMxuBZrFS0PMb0F+AiOoNtxQ3HdSfx1rh3gvftAEVUamuBcaIfytoda33dC4ylMvusYaGExeuQqJeCHkaa8iM63ssPydaPcTclSes2T8Ny03Rf/8bH2Cp6DtKHU7W2e745lkqKZhp1L56hQJvZcPWjKL/5kaPNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LENaPMTw; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LENaPMTw"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a451915d8aso616876b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266395; x=1792871195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=LENaPMTwigPBAQZiUhLTwvE6M75HoHwXawicYRk8vS62r9I0wREFF3xBlL1BhGKOmC
         OYKSa+tUqMy9Af0l3enaIZkTwyokBER7dnhfZyf00d4AdjV28JlgLCVxmCHSmWMgJW5b
         OWvRTGEgyJZeT8CQqbcbem1/RRMoeLMDrPyyS8cKRRrxCzSsUc9dy8sxItQ15XLVkaHt
         KVYfzlDXhxj2ZBxC6KwDV8s1vjEqW0J/J+dF+04JWvaO9L6Xf0nfeXQMT2bc1sgS5gZ2
         VNouVQch2YnKn+NKr4l3Pi6mLbqzhiKqPAO19yaDwN2KRP1KqJrH/uGbCaYFutjHkzwn
         qwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266395; x=1792871195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=rT7jExd3EoNAixt8WJm3RTtJlXSWELEYrSsJqaKgqSdPPZpV/nF3dhqnhRYUt8uMO2
         vdxWx1U6HBvlinQUTVJkzYnAhAOS/Mz/DuhVJl/fjmecyzoIC1jVr8mtGdX7e+aoe3dw
         vffIVvAHJGnp13k7s8u1q2HVOjyPyhXuswjHDyAdDJQMwXrhfbECUu7sCdn6Bdbf/f9Q
         moon8ESEdBf0TaZi4vAdP0OgIf9O9PdgLz27cU+uJQFg2LJAtYqt7gSCYqaonfaRxFPu
         ofoTH2//a5Sd2rdwqIhZS6KQrZgYwLFOU3XPr1VJUywBgRXCeTTLKVhVgy2OVbBYoy0P
         0SJw==
X-Forwarded-Encrypted: i=1; AKwUvBxDPKalr9P3a+w4HikQblS/Ol6Z4zMVrGbE4hzRmx8mUKu1sFpaKlhCCIit4RVO2585m2Puiv6QnXL97y0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrbDt/Q3OXzzExTfkbmpjHNUY5Ys2PkUMZknb6Rg76CF97Ipqw
	6HL5UblsNT4aIjONUlLs17utx7Q9jGM1r1y88IRvmVOZv74Fyek3o3Kh
X-Gm-Gg: AYBFou1UhPXOBKxKnGPmQeDczfTURsOYh9l34wIZUb9jG/MQyba3oBXozPz4BGdWMKH
	9YOP4K1uaxAUe5ns9r0ub0ENKhvfiFK9inTowcMFXy5MmFgAuht5uPl6gl3DHnw7qLj+awwId2D
	En2M84KESMZRxFCciW1cll7iTQdhmPk7Pb91yTSaGyFdM6tOIyTcRtkH3GLkaNRgGb03nJdR0Ye
	kc28aHMSoZ2BVSv0e9hB5EebddZsR5GIxqr2h89uznRKXBGPtZdHY0PnUJcBpejil7q179cr7JO
	gCh6tKgLb0nTo3aSc6qQJwKS794rYGJBJHeWiVr40l0wGU88PTI92gpVJxtU0xlm2Cg9KKUyPig
	+jNvJgESHC5bPoE0W3yUfqj0YwMsEXmxOBH9qQxLqyKic/jsbXiw2B0h1YQoQoJtMh8E9fS9Fns
	a7IK7pn8TKg/KoRFDcBKN2tRFnFXi4fhWF2bgM+XHHf5ifiW1KL2eNeGD2QWd2o8hgoqwSeXPc7
	m+tn219LqPA4DKo171QZr+8Dl/zVkYFea3QbeBqRLLCD8qW1RmcbQZciU4ri3KnAOOUhYT6EaN3
	/coS2ZtyClJ1l36BCmL3bop5MchCkV14d8KDkDEKJhDZml6XGi+OLwKbsfCghz7e41Z9G/xkSkG
	rY6lAi8bwgB9AiHebIoXn
X-Received: by 2002:a05:6808:238a:b0:4c3:9892:96c3 with SMTP id 5614622812f47-53ccb300dfamr2614650b6e.22.1792266394712;
        Sat, 17 Oct 2026 12:46:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:05 -0600
Subject: [PATCH v9 10/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-10-b624c09e3ee5@gmail.com>
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
index b79a20158cd4..f00f9a8ff66b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1848,15 +1848,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

