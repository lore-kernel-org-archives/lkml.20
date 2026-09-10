Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F55A0ABA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069414; cv=none; b=LiKH4oPbSPZx3D0TBNDh1Fxr4y5tRZjGn/XfiokNlKzYUx4xcVc0YFF4mJxhKVRStfdsJJmO++MFJKram9lDPV+/Av4qpF9K5fR7qhe3GAZ8eABCextgadSrHoRDJrX6yrtgw72MtWpRnPw7ghEasVed0OcEfkUJqqC70/G6lNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069414; c=relaxed/simple;
	bh=Sp8gG2vlOGXtsjCYlvwHWPR+QaRAqVPPCEHp04Izc/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGC+ubPzs0Y/TwKWJ2Pq/uQ0TsS45FTkGkrdjDuqqTWVI172dj5mLGANOftl0TYsXpuVTgiU8Bf/2ozsa8tjPB/WviVWmDs8lTQmLH7nlXL2RHLRBG0JwBMqrlR4ZCzd8zr8Wk6iFtTA+TP0i3efS5c+fBUx8gl2VWE9gtqw/dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOanRM7/; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOanRM7/"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53016020b2fso2503781cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069411; x=1789674211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aei3ERTJbJiVkzOQ138W6pWKQKh4OREM0CyTUlBnrDc=;
        b=JOanRM7/hlZh2RL256r4mEBQn3Neibi9K1iFamYZmLs+yItYW1O1AMXXid4SW4EZHu
         y1Pll+zdVxPXyJzwIMG4fP77OKPnmTWe+Rgqdajj87yIwOMaJpok7osnJgrPn05bdm10
         9RHlIqUICtM1hLAzBfGqRxjCsTu4xFr2b2prYNh9IRH86VsNnAK4eMIV5gU4eS+hQCBq
         hd1/cePuIhrKj6LDuEi8SARQy3XLj4Yxoqv20v9XxRrq5fIN7JdVT2RdVmIPBEFiI/iN
         5NmQRzYrEPIp9BRNTIBJklqnls6d255Zb2Z4TGvP9dba3KYAzYjKgqbcrGi/m8hBF4Ww
         dx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069411; x=1789674211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aei3ERTJbJiVkzOQ138W6pWKQKh4OREM0CyTUlBnrDc=;
        b=JGUHdhO9NS4ZRz5xn6xpN0XCOB1MLfvvyWaFzYS7k+g5N2ubQTvb9vryxeSRLUXhGD
         M/9BwchxTLhBVS/yA0tFnMe9p1OnreBLHf3WC/zrQkCP2ak3JqjR8lIJBJrd+4hu5s13
         IpuxFB6b0QpoNJdfEmb5BkBPzifqdOyewKIFxSZj5odmVYqlXYuVUeAUqXW9bY36jCRQ
         liTeEe+BZ7f5DrM+GIMla1zuRvEoEh3TNzcRQ5spPeGYdtYWmYWclc8TwCtUxASVpa/F
         3A4bi5KG1eoFXb/xJXCy/ubTPfN8BGFs441b+blaTKHHumjc5G158BoZeELehdaE+eNp
         c9Ng==
X-Forwarded-Encrypted: i=1; AKwUvByqcHe6QIQwbosNtXzN61PnAF+JcdF36rj4T14iIXCKoVa6IUbdiexkfY37vWUlEqIRBdOgZfnjl9ajqJI=@vger.kernel.org
X-Gm-Message-State: AFuF++kPOx/84ZTwPtXM8howiG7ceNFGv5R7Jo2VaGaKO2fpnvRURzZ/
	w87+lfPI1TNS7aG1jogOdt1T0NbPfokigUl1Z6hqkgNhOoUXMKhekg4O
X-Gm-Gg: AYBFou3aNiSq+3j2bYf8l3cFS81/dutAveVYSUCCs3dC/HxohKlKPte4ByPyX2IiVk4
	gmvY0LrBBeks1nO8YDavtOPCtLNWj+vwMoonyruD+7Vt0icS2w8GV11uspqzM9SIqZKxabgi9BI
	EfK9AnUaERntbi4i4MB3rlzpW587ufqXateHHp2/+FVde+C08F4vjgdQ16H2BAoWzBJivCpbMFJ
	1iqBcwZMOMOIsg1p8Us98ntFGtVdccAAwKS4u/9wMnEz541r557m+VnXHJX5dQZ3f3Rk/gqL3Dn
	+zzm/v4gtHT6Hs0EI/moebbamESrEwqie63cJy+HGbmazUqBt7Yrp0C4gQ4J9jFYl8M2oY2zwhw
	FjY55OZWiV+o1Z101oSv3rcmQIxVX5DV4yk9yZ4iljSdB0ruKSvv1L2ymx44Y7GTRzVnFAeslmG
	DzjaRzFeD1CtuB+Dv+/baSByuM4CFF3V8vl9YzsFaQ44nzL96emzXmbDq9DGN3r//Vj1JJ/c4op
	ZoFkDMwKqLFeQgpRMaYTBdy7bvg1mFVg+Ij0v5hFilOb4tCgoEeFe3B/XsNVpCWtLobIUKco1gC
	Nrcn1McojnQEL9jaeBnxHGTnxdkr8x8in4lw36BFyChKtQfW
X-Received: by 2002:a05:622a:301:b0:530:4155:1935 with SMTP id d75a77b69052e-530c8565ee3mr15509471cf.15.1789069406721;
        Thu, 10 Sep 2026 12:43:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm3573726d6.27.2026.09.10.12.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:43:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: byte-swap cdb32 when programming CDBs
Date: Thu, 10 Sep 2026 12:43:24 -0700
Message-ID: <20260910194324.33697-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three prep functions write the first word of the command descriptor
block (cdb32) with a plain u32 assignment, while every other CDB/CF
descriptor field is written with cpu_to_be32(). The RAID Engine expects
big-endian descriptors, so the plain assignment produces a corrupted CDB
on little-endian hosts. Use cpu_to_be32() for cdb32 to match the
surrounding code.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index befb4bb69d54..9cc289f7129e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -361,7 +361,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
 	cdb |= FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
 	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
 	xor = desc->cdb_addr;
-	xor->cdb32 = cdb;
+	xor->cdb32 = cpu_to_be32(cdb);
 
 	if (scf) {
 		/* compute q = src0*coef0^src1*coef1^..., * is GF(8) mult */
@@ -481,7 +481,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
 	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
 
 	pq = desc->cdb_addr;
-	pq->cdb32 = cdb;
+	pq->cdb32 = cpu_to_be32(cdb);
 
 	p = pq->gfm_q1;
 	/* Init gfm_q1[] */
@@ -564,7 +564,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
 	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
 
 	move = desc->cdb_addr;
-	move->cdb32 = cdb;
+	move->cdb32 = cpu_to_be32(cdb);
 
 	/* Filling frame 0 of CFD with move CDB */
 	cf = desc->cf_addr;
-- 
2.55.0

