Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6143149CF36
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637172; cv=none; b=s7atW5gZ2nY4ZA6ncHbi3AxO403IXdsNGJncWJYqvRxbqMXeY/utKMZWDphbiPxrrjo+gfdNA+6k850GPO8k9/v6iGhoJY5QlvMpybJRTO6F+gk44xkB0G4GALCb/sh+wsgic3E6omKIhrFTzdoFTRVdM7nCwabdCvCFnABT3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637172; c=relaxed/simple;
	bh=5gghVqivD3mQxCRfgxbnZf2SmeBfu7BRuoL1SSSOy/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHtoy83TEgU2IUxrVk/39anITF/0cFTo8BKQn01kOGHOPOYQaV6dpQLRAAe0FvPvSGI0r3EuBcab5uYSLW8b+IsVpqi8qgVCfo6ag5m6kpKqCiYT1HUyCiJIYZOuhgPDa2yFhaNJHfyCbZpJgYN2AcRcg/V5vKtsSF6NxXeZ+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZikxuJvA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZikxuJvA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so4606955e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637169; x=1792241969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8FC7nJBpqq+qPZdfw+GCth6LuM5q+W9nKyNGFLLPQk=;
        b=ZikxuJvAaoKrXd8n0URpgCT2Y8/7uVCSu6LGbmEM+85uf6ppZKfSPYX+XiaqC+D0cz
         Z2xo4j4W6eWAnFIECHd+26A0ZiTnj3vY/rNvcPldvWLLIg2BaRt5R3eGfZcO6ptPWpAA
         3ycb9ctChnFvw/O3Az2idgG+uANDQ75qmBcuqyOiiMsoaig4xdGAa0dTXY1TJ0htQmaA
         0Yk8HDO1FoPMF5FWw2f5e+puE+RuokHeVxyMMAfEQ+/A+1i25fGo2EozOHdSiBSzY7zm
         XMZj+pwEW1pyxV/omd7v3erwiu9CDRzXfjtaVAlU6WU4rzUupSK8o6an4mnOT0Ds8GFO
         CzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637169; x=1792241969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8FC7nJBpqq+qPZdfw+GCth6LuM5q+W9nKyNGFLLPQk=;
        b=XMLoBSPjnKFCzsTpWLkwEFVa1AOQk0bWJ+L8OixS2KI7+IjE7sC9zjTr7NtD15YGxI
         C8HLA2hqIfXcxu3lX0fd5D/kQtsNwxuvodaKx2QEodMdslU18hPFnvgbrO4X19DRtu+U
         O71M+zFUamx3ZvyilSrNZV+C86fFIbQFL2rrda66SNW30CPtdfvyJTfCxW/QxXazXpoa
         /NQ6sc2HaE96URYTRygXp2Jz0MHZqcGar4Rv3kxKmHQeBwcSqAEpwi9ldB7Mldi660QX
         fNxeXH9zcvSAC5ODOJSlvDO3byxnntSRRgD3vkadAnlJL8Ncl2fGG3yrFHSk3tOTUsip
         UF2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9v568sq5W68yGzkz5dVBEFiE9s+4pqqLlsDsWK3gIqswbxNz1MQNllbQjWPD/JM2059toR1+ikEKBrzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKP/r9uZ2wal7rdJfRoMbwe4mhBb2A/rWru+lKBpCzHlBhZivh
	0Fsqxk1v85tzESipEkG9JyXrFTDsphOHq6YJhtz6va43h+Bse8RhDfyx
X-Gm-Gg: AYBFou0smkf92dNFOX8XF6z/ZSTKRcJOBBFoBGuiAB7XjJw3LiaACOPDBEUrIPr65h7
	b6lkwlQzOXSYi9BuKLy3rECsiWR5jwTI0r2KWa9ywiH3Lhr55IV811h/kfcbdZmChILxbymCJ8v
	fdXy3LtgLp6Wbxj6xSYaguEIXgMiAVdP1jVymZL0U+TJyreKi1iTe7lisoiB5opkZgO6TzI5x6U
	2b7e2RRkvDmzirqdQlMRj8OMxHpsZcnZxOXpFqmOj8IpJm7kVzMCJYzf8zhvDB+hZBc5lzyDSuk
	sua1OStjpsoWIKMhDup7ZcYGPaHQdrqofZ7rJvcZAKq90lux39Xcp0gKCFrCgbswM6qfkqUfSkP
	F5Ea+I2me79k7jV9eVDe+Yi6J0TmqmpAdecQl+eAxDZ1oQ94N3E1u2InMK7mcXidzMDA6OUAR+T
	y+wqSya+uSCAvOGbUSz6Ai5mgbo1AR8f3pVHUSyO4d2qMSDl9BjEwgFwKJAOdv5iZQwsH4+x+Is
	2F2kQZL4Gtpf7WXrm2sILpIm3xQrhnmbrzrt9lOgIs++69nupQNxqnSyCBJBWq9DDhewTogHRF3
	DlQW0Qa4XwRIir0F8HeKsVZL4a6Dd3oRYH765FBJlDSMbV9EAHnja+f6a1BviQ==
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr88426475e9.33.1791637169221;
        Sat, 10 Oct 2026 05:59:29 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18d12fe04sm82048945e9.4.2026.10.10.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:59:28 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH] mtd: spinand: heyangtek: Reserve both bad block marker bytes
Date: Sat, 10 Oct 2026 13:59:25 +0100
Message-ID: <20261010125925.175440-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the two bytes read by the SPI-NAND bad-block check out of the free
OOB region. This is a separate MTD fix, compiled but not exercised
through OOB writes on hardware.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/mtd/nand/spi/heyangtek.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/heyangtek.c b/drivers/mtd/nand/spi/heyangtek.c
index 7fc50fd3de..76d97ae970 100644
--- a/drivers/mtd/nand/spi/heyangtek.c
+++ b/drivers/mtd/nand/spi/heyangtek.c
@@ -35,8 +35,8 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 /*
  * HYF1GQ4UDACAE is a GD5F1GQ4-compatible die, so the OOB layout is taken
  * from gd5fxgq4xa: the on-die ECC parity occupies bytes 8..15 of each
- * 16-byte section, the bad block marker sits in byte 0 and the remaining
- * bytes are exposed as free.
+ * 16-byte section, and the remaining bytes are exposed as free, except the
+ * two bytes that spinand_isbad() reads as the bad block marker.
  */
 static int hyf1gq4_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *region)
@@ -60,9 +60,9 @@ static int hyf1gq4_ooblayout_free(struct mtd_info *mtd, int section,
 		region->offset = 16 * section;
 		region->length = 8;
 	} else {
-		/* section 0 has one byte reserved for the bad block marker */
-		region->offset = 1;
-		region->length = 7;
+		/* section 0 has two bytes reserved for the bad block marker */
+		region->offset = 2;
+		region->length = 6;
 	}
 
 	return 0;
-- 
2.55.0

