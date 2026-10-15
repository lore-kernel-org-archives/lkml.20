Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB57347BDB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028078; cv=none; b=s0G2OZfYRvjh2IIV0JawJu8ZKF9vl7O9sbcU/BDNAdR8xB5pOwOng+KuEa+3lPiErKMRLXTumyUjGFup3G+oOtr34CtX3qHyfvY4t5R0CMkD3V+tu+raBKiMA0dhjAfURCGOmm6PEF3gXinEZkZcYxYPbPArKN1L+aA6+IRdCTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028078; c=relaxed/simple;
	bh=0kxWl9QWVm1G3QyRQQoFBKdw9ex2r5DsXOknVXwQkMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duRazK35GRxNwCQbnU7hp9KPlIIouPPyeA9zUCYyRrNKjPqKph/3uz6t56urICVCVLwpBSBAmb/u8eWcw3ALVydD5ut7zp5rkFlJ8wxtoJs48vntGgUtGxiYpNsRUvfmcQ79Z7OXv0ceTUsmkBv/h5Wlr+CkNSwnxPBK23aerdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyS7iliq; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyS7iliq"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-483c607ccb4so623016fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028076; x=1792632876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=TyS7iliq7RGyoFcSfiuQMLejmIgwF82naohc27C6GPTpRLa9YBgWWwVPjtNsdfj11q
         vR7ABMNYaaObWfxYvyrfvCxeIWi910HNzpXS4FAp532bJ9wXgh1j6QuWn9QmjlVKGH/l
         qlc0n27QH8qYnciMxBK1VPG6wkEp70dnlMWtnowOi+/eITUcliSmE2buMWzYaXNgha6V
         k8MbQcmDsQe2ErdumQvo7opI3UlYKc7lLP9P1mrEoyckligfss4w/4bLcxVPPu24WfJh
         Rl+tRstRWv3a1wO6jbvUB4SdGm4/ngPMBGv+RUQYjDRpMvivpohC7rtPtMZJmmVxAmvk
         55lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028076; x=1792632876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=2Ff72VFp578iev6avxl0jh1Pz8gkUrR/xVJElKVEifRu4d9UmZrQh0CnTuMcyvzNGS
         goevtXlwFfaReKKescBx8SItjyVpIsd0Dik6ET4wpK7O+1IUmesmfMFqahgoCgLP0Fv5
         NysKb43CumuFzPx9i/f7SZse24zUDXJLwvHsdYioLg5Xp/qaPM+xwPNlAQ+teuc59zzm
         uCYLCrhs5cuBQDb4OQMufyW1z6ulpqI2BjeFmNrSqlJNnJG1PGoKWMvDN6koMkmSVojG
         DBF5qfbG3evELoX6uKhV4zEKuRm/XlQrNEQgCaPtAL1RYZHHBUXp+VGZ+iy9UgAtyLb9
         B4pw==
X-Forwarded-Encrypted: i=1; AKwUvBwkZUABD4DBTabsJUBiT/4LhyWyF7TVD0J0HJ41ODaXcUXYepBvBLKQls5Nj3JfNyrYZEF5JHCPIfs4Mlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYQZOErjp4J0WDUbd9UnVfx/MdXBRXy9sqPHzK4zkyahbTvC+t
	GeGsyej/WXkoG0nfOQMaeRZHB2gTvWwFBNhFKJK7YREzddME7LfDDkng+0G5Tpsn
X-Gm-Gg: AYBFou0vYP/ydiLJVIwVmI0m27kutirOt1pyGL4C1FDg67fGLjePImxSOy1s6FYZCE2
	CjSIRZ/9+pfPAJ5d3j50h+Ebkm8cyl5RXWrEqo0dvIHC4AC8sJ+7d3WqKtcVAiAL5TaxtJ6ocB2
	bCc3vJXIJibUZBcrltU6iZamkkvtPbhYhPeOYOEPBlTlLGokRuUxe7B8hV5G6sSsN6dQzid1IbY
	8cGg3QSRwV4soScO61fkL1c1vlwZf1FoR3heY6ZO3euful56bMqCHh26ziHQ9Xs3DSsY+5Ar0zW
	eYD0PKC+J3w2Lnc30A9Ju6o+ezFfAx9jFtTL5uxQAHnFwuuGoxKwIbkNQB727YPamAWXLrcnilT
	WdgNt4+Jo//O59VxVJF//HmDpneEpq/rfYo6qfF7Bxm49GffUu1f8xqprqOUVgwHdgb/yOR58oh
	o+N4LJdIKnjr0TTT2OPHHUR8BuKPGo7/ySoibdunJFDh0+y5vivP7JWTow/bf8b77qbdm+W6BZ/
	sz3LRau2g0yzDy/feouypsjx43FgHf2MgWU6iQnjkP6pYJb+gWpl5lQG8+RuysF6uleEVfNnmct
	vlclDgH0cPAYVmoVMZTGonw45rVH/CS0IxerbaXItZyt5k7lxHvDYwGKbl+enp+XtMvtGIu1diH
	/4ERXKqlMWGhBngbcViiM
X-Received: by 2002:a05:6871:722:b0:48f:e0f6:bd5f with SMTP id 586e51a60fabf-4a2a8b0964amr15694991fac.48.1792028075784;
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:00 -0600
Subject: [PATCH v7 13/16] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-13-5d3fc6ad2da1@gmail.com>
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
index 74fdca27ba10..4e6fcf1e7aaf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1642,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1669,8 +1667,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1696,8 +1692,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1726,8 +1720,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1751,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1796,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

