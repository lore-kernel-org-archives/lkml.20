Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4993C81BE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266819; cv=none; b=irhcsRqKMt8rR/GSu9l6SVM/Hx1WJdji+gyCN2id6MViM13mZwJJfQXHleCZL+fLPgQmgIWhoXsCk6Qt9MQSwtjwOee7onD2ykTuHwW9twjS9soPmSJ/6oIJqXPF/SMhFNIYkbg059IRKf6SjObEVnuwoDCKmIMxlOY5Hc2HStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266819; c=relaxed/simple;
	bh=xZ0mPLMCwDzY8Ny6l4vz2klxVY5qj+EkWBSLeSH6W5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUX5qxwG4DfMBjBKORDoFr5m0C+YnZPUosJ0V1QmNeQDu6LEpnSpb4PvSsy886fl3Hd61AawiNNJ0JGHiOWj7F1zpww0vArRAOwfMsEWbMnHRj4p8vJbWkjW0scdC7k9LXBZWY+oyUiIZkTEOQdHSruSTQlL1H/CRfLcqTs1cWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f65ByNgI; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f65ByNgI"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8256106635eso324294a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266816; x=1792871616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=f65ByNgIfIleIx42TUxXKQ3kbznOH5PUQYcrPtMS3Nzi+/Z9sQ5x5E09cqlluKbzZL
         mz9mpjaTxnZnrzW7I8zIuV5GNlsb+3wn/KaQahLYS/ZnFlw54C7o7qk/3g8fU+9eMSuK
         Bg4r+j4ONZDuTw7EPZ3tParsLZwAWbRf3hUUupAfWIp+TMH2svKwH5l/JWuLL88HaOJJ
         OCkOXgJ7D002XANkNFOVvZsVnzgz6pCF4MeEke2s19FJMx989Un6b2JaiH6vg/TdArhT
         DMG8wBTZ3VXZumZn3YcMdjjlbX84U0TLHGP7pN6IhXIn/rAvE5+dJYJ9lYBiHWPtMRTW
         B2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266816; x=1792871616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=u8fdschTJLGu3Nm5YGOmFHFflIDWuK6CbgT7yKhXGwqPBk0cvE68xiciIE7Az4FVwF
         JBx/X+e9TemdM0cHj9FITI0DeK0QE+0r+ntp5pIt4q1p9ByWlHKKDRqn4cMqPkLLMo4g
         5kOHA2gE7X6cNyDwdC4jIlw/XoRmhOCPN6CVqwZqH6P11EFFlk7xH8Rex2prVoueVjm3
         ogFDoM3yGOyDjYOha9qIyLqlk8wPMrz9qIoOaN2LC7re9mDbcSDR6Suaub/xYH3B1MzP
         7c3W3beWHNHDvXLi/qdTe1/TRFWexdopVzEHIzew7NRLYHHcDx42ZwnRqhSdbVuCsKxU
         oIMw==
X-Forwarded-Encrypted: i=1; AKwUvBy4ZkDkkvKGCT/RDbFA8Uu6UvLwYIX3//KBhix08D1mi8GUslG13w6t1mEff5uPIs4xy3xKDsZgouIFFyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQaeTySqUpBClV0hfkh1pMu6UmTJ+TAAf8QKLkgZ5KzQ/WDi9F
	jjvidwAzwXv+HZRsP45vy2dsgqogsFLXvwH3Fz8cz4JuIsV7S0UEnNjb
X-Gm-Gg: AYBFou0gcKGfgygrORL6GQj/EuesJnoQePj2Wd+icMmfCkiuw3cBYvJxRLTSBIY6J9K
	Haaud9UQC9qKelC+29HgDr5pfGIQRkZ9Hydt7kamYV3kfBhwLf8YPRKM0eSQk5z+acqKKqqt2qq
	0PpzYu5h3Vou6LFn+yfqoqUmHaKEs7tzpeXi0rF1z4jUJMSNLDEBv4ip+QbdHfbBn+ssbaMVVfI
	IpVV+1uzaj+4RywkIKAH4u/KAiCfQID1T312+LRmVTr5w7MzYMmxmqLguiBfUBKTgS11WBdDrV1
	Rq+9YQN8Qm88/BXh/2SzzYKqmgmdFwW3lZ5JCrIbpdg6VbkuUPnq/GzTl9zBejOdmrQ5L7BNV6y
	mXxmnmOz9nsY+w7DRvztVuBlhT0rjzrOivTkg9Ls/22Kzypmgsgwk32H6gJeiBmkX0tCX+y6Agl
	RpKc5qiPRbSsC5JBz15+7xwJSBXe1fJq3IOvIXskdc0Wko2MJuCluzMtYNMKEmdncdxa95huCTX
	zDZv8EBGnvXJy2sFUqEXG3Fq9s53/UskGTBWOmvmaXfinHE42GVUFO03cw/UMMf9+J0UO/06nvW
	EvJf/qEJVbIMlMF3XAuAllx3NwAd7raG2FNmtX8tkGFWrP4bHC5KDw5lm6kg0lniqp9IyQIlJG5
	RAdJwhE5jcAIoG7mq2yfxspgVahTzi5kYA8IQdilvB1g5jVyIDlJSwQ==
X-Received: by 2002:a05:6830:4129:b0:83c:2a05:c65d with SMTP id 46e09a7af769-844ff4249d6mr3801148a34.18.1792266816507;
        Sat, 17 Oct 2026 12:53:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 15/18] mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
Date: Sat, 17 Oct 2026 13:53:04 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-15-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit

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
index 993e2efcee04..45172175d4e6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1685,8 +1685,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1712,8 +1710,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1739,8 +1735,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1769,8 +1763,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1794,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1839,8 +1829,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

