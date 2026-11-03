Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730656;
	b=2T6R3x+x/sJlp+1wxL8jb0MAgeXGaP/76jZDH0n8YxACZhMKLZqINNtLdynF6s3U7/Jm
	 1WRDjut0MI2yGbnL+QFoUCI4pt86tfnnnCk9UNUqGGwt12MPx3XSLOAx+VofPYFNOsA8X
	 iOCELrKG/OZfEMfzu6KFkygxIwkLGQYpF4iwnXCKP6Vx65JER2V6i9M4iYkHPflCOfUI1
	 iNZ+SCCA9dm2qGsQClY9asZjbhR2EA129dCF3YO6HoLe7HCfywuHn+thkWHFtdLpw4Vyn
	 jH5Er+8BpC8PNHsvHkgeCxWzoLNzQI+/xvV+VYwo4eC1An4eH+uBuoOM8ZA9mc0VNOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
	b=pRXepfOR12KsIYevaINsQHWLBrQxe4DXHWWA9fPPoCm5VlpYeEApK6JSUFFZOT/a13Se
	 8for21J9AhawPzVnRd3r1yKqpyryFSPfV8voS6JfooM7seSOdwqhh4men6zR4Pwe7tiik
	 7NXWraap+NjE40Q9VRGjdUfmUTwWcYQ6BZpd+yaxoEJrUzWJ+iXWKAPs7L8YxTpiB2yW+
	 LTgFHypC9cH5/tjS3W7mNnUvP8eDcV8XoOT8X9hqkhWCCtUJ9inVPasGrteSyE899v0A4
	 vPXxoBLJgugKmdvwjHHxVfNA+GU6aETOvHDB/lcHkseHlqH+KNkbet88+FsVT/ilR0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVZmUfFg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B13606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B13606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVZmUfFg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so40944735e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730654; x=1794335454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
        b=CVZmUfFgLXtSRJzMH98OfgikTs87Dlkg7bLFH0ntsmAPv1k4SezDKS2kINt9Vq++SK
         7bbZ/s37QXfui59bHjUcwoNF/sWQ1QVLXLA15/BGLFrWtxXYH5NGKnatFSijvejU0gVg
         9vUhefrzVc2x2CHVaDk/eTMt+CMTGytd9Aah095+odugYxu48IuRMBBUKJPxzxf0zSss
         tCJme8MH8C74vgC0Y5KXe+b5wHw4Q4ph7R9v4/qntUl9VRym3Zx4FmqMEP9R2iNtU/RP
         a97Jc+jY7nhx8JGA2bDBF2lwW7GhFCJvlgO+G/Voi4KD8RHf8liI66GnkinvLxPxRmVz
         zPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730654; x=1794335454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
        b=m479aTMEH/cF8FLpWgpEmr6fFAoxjaeq+0RN6Zi7RTorAtO+FbgoTYQ5LO0Q5vxIAN
         iuSI6E06gC99Xpcx4sovoPDxXN+eYiSTSAUpEUzDtBC0tJSQ7B2j2fl6s1cQEcQsXWUL
         6lilp0K8eRZugdTxQoG09+Xjtbc6xuLLg7KkiPBPedcn+iqqWIu4KDYpV6YQe/Vc9DGv
         7nG6XGaKsBHcRI5xOC2JRkSu0290OJYj4cGOKTlkmmJ6OBG/C1ltBAKG2Rm2u7CGQout
         Hu5VEkeoZfGvIJsvlacGYBIoKgEneIL6+7HahGqFyUXZy1e9Tvqg9g7m7E3SNMTgF2iY
         CUYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDH7uXweQSupHtq7f7f7KDSYbK00QBDBsxWWJ7IUyykGfMC2CUU4qjWcvfWhasUU6qBSdflvEOKf1A7q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7lyxVgAtAcdXwanzSvwG0qPNvd3Nkk6EBzmN8/lLbfD+1Rk2x
	Ol13qHpIjrlTOId/n9/Rbn7trm3K4Zp5XoOP/HUTLcrUEhv85xsCuzwX
X-Gm-Gg: AYBFou0BvE1UTMFp8/xKW3hxGw8EnCMMzWj19rPXejyrESjOdh8s/zkJkZ/sRmy8QsA
	BxIMBSVIp0PlmlnvIK/y3OvQTSYJqZHWIeeLeRhy4xOj43YOvZqWWrTZCmwXkwPOi+V8tJ+jsUV
	pgQsKGxWByf4XtN90tulzwBJbSkWfHhZXaSg+R9H+Jn4TSRq6tZOe9KZMmgyWIywEhT+AG7G6aX
	VIQWIsXtHto2+O3aUxNqY6eB9o9nUYc7j/9gAg0RNNc3ziAY4g+3biqzKi0S1Ns05Po6kE0ndYR
	SLcmZq7/tCm+T36IXfhoWGwulC3H5G20Y+geD7s3efY8js8IGqGSS0ksEmzTikK4Hx5XZbmVkuv
	TNy//SovUW5o5dpYKZLhyQjqJi7jFJjlo/GDvZ4kFZOh1SriuYn1lXE/+vS9q/QE1gek3cRJDkB
	gx2LAMntnYMpJl6Junx7sMdku7NuMf15IuUlGoVrWsyPde+nrs+DXJZruAe2rzUmGd9YnefPT6Y
	FNhgOoKHVvWWnW0XuIDXrwYDLRd9yJl5p11ekBgJByw7L1x8wFE/qsMFvUnSRqSjLvReFLGsB1k
	mjnOzEVcxiOOLCt3CkC2r9ReSrqa7sp2KFb5AWhJPVxwRYLc1uXW91ipeeHI2fz3F7WSVQ6pcpk
	TxctomK+D3jLG5KHxhLiHiakVwUJmaL2Tik1a015Jl/JKZMO6fdwcQ6m1tJ8q2SpNq1auoAQsSX
	Q1IetxdJfQKAhmBR8NC5ltQ0qKyw48bcOPGDAmenT3Opdw1yRz9u81t/pfYvi2X5I6XUOdYTxbl
	hY5OoXx3AQWhbjQ/WHd21PD6g/cvsV3qntWmGwXz/KidNzRhQ==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr314872025e9.13.1793730654277;
        Tue, 03 Nov 2026 10:30:54 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/4] mmc: sunxi: Build IDMA descriptors from mapped SG list
Date: Tue,  3 Nov 2026 19:30:29 +0100
Message-ID: <20261103183030.81078-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_map_sg() may merge scatterlist entries and returns the number of
resulting DMA segments. The DMA API requires using only that many
segments, with sg_dma_address() and sg_dma_len() (see
Documentation/core-api/dma-api.rst).

The driver instead builds one descriptor per original entry and uses
its CPU side length. Build the descriptors from the mapped segments
instead, and split segments longer than one descriptor can handle.
This can't overflow the descriptor table, as each original entry fits
into a single descriptor.

Also check the alignment of the mapped segments, and unmap the
scatterlist when it is misaligned instead of leaking the mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 91 +++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 479420071c2d..b875ef4c2b79 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -356,36 +356,49 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
 }
 
 static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
-				    struct mmc_data *data)
+				     struct mmc_data *data, int nents)
 {
 	struct sunxi_idma_des *pdes = (struct sunxi_idma_des *)host->sg_cpu;
 	dma_addr_t next_desc = host->sg_dma;
-	int i, max_len = (1 << host->cfg->idma_des_size_bits);
-
-	for (i = 0; i < data->sg_len; i++) {
-		pdes[i].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
-					     SDXC_IDMAC_DES0_OWN |
-					     SDXC_IDMAC_DES0_DIC);
-
-		if (data->sg[i].length == max_len)
-			pdes[i].buf_size = 0; /* 0 == max_len */
-		else
-			pdes[i].buf_size = cpu_to_le32(data->sg[i].length);
-
-		next_desc += sizeof(struct sunxi_idma_des);
-		pdes[i].buf_addr_ptr1 =
-			cpu_to_le32(sg_dma_address(&data->sg[i]) >>
-				    host->cfg->idma_des_shift);
-		pdes[i].buf_addr_ptr2 =
-			cpu_to_le32(next_desc >>
-				    host->cfg->idma_des_shift);
+	unsigned int max_len = 1 << host->cfg->idma_des_size_bits;
+	unsigned int i, d = 0;
+	struct scatterlist *sg;
+
+	/* dma_map_sg() may merge entries beyond the descriptor size. */
+	for_each_sg(data->sg, sg, nents, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+		unsigned int len = sg_dma_len(sg);
+
+		while (len) {
+			unsigned int chunk = min(len, max_len);
+
+			pdes[d].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
+						     SDXC_IDMAC_DES0_OWN |
+						     SDXC_IDMAC_DES0_DIC);
+
+			if (chunk == max_len)
+				pdes[d].buf_size = 0; /* 0 == max_len */
+			else
+				pdes[d].buf_size = cpu_to_le32(chunk);
+
+			next_desc += sizeof(struct sunxi_idma_des);
+			pdes[d].buf_addr_ptr1 =
+				cpu_to_le32(addr >> host->cfg->idma_des_shift);
+			pdes[d].buf_addr_ptr2 =
+				cpu_to_le32(next_desc >>
+					    host->cfg->idma_des_shift);
+
+			addr += chunk;
+			len -= chunk;
+			d++;
+		}
 	}
 
 	pdes[0].config |= cpu_to_le32(SDXC_IDMAC_DES0_FD);
-	pdes[i - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
+	pdes[d - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
 					  SDXC_IDMAC_DES0_ER);
-	pdes[i - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
-	pdes[i - 1].buf_addr_ptr2 = 0;
+	pdes[d - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
+	pdes[d - 1].buf_addr_ptr2 = 0;
 
 	/*
 	 * Avoid the io-store starting the idmac hitting io-mem before the
@@ -397,7 +410,7 @@ static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
 static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 			     struct mmc_data *data)
 {
-	u32 i, dma_len;
+	int i, dma_len;
 	struct scatterlist *sg;
 
 	dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
@@ -407,24 +420,28 @@ static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 		return -ENOMEM;
 	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i) {
-		if (sg->offset & 3 || sg->length & 3) {
+	for_each_sg(data->sg, sg, dma_len, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (addr & 3 || sg_dma_len(sg) & 3) {
 			dev_err(mmc_dev(host->mmc),
-				"unaligned scatterlist: os %x length %d\n",
-				sg->offset, sg->length);
+				"unaligned DMA segment: address %pad length %u\n",
+				&addr, sg_dma_len(sg));
+			dma_unmap_sg(mmc_dev(host->mmc), data->sg,
+				     data->sg_len, mmc_get_dma_dir(data));
 			return -EINVAL;
 		}
 	}
 
-	return 0;
+	return dma_len;
 }
 
 static void sunxi_mmc_start_dma(struct sunxi_mmc_host *host,
-				struct mmc_data *data)
+				struct mmc_data *data, int nents)
 {
 	u32 rval;
 
-	sunxi_mmc_init_idma_des(host, data);
+	sunxi_mmc_init_idma_des(host, data, nents);
 
 	rval = mmc_readl(host, REG_GCTRL);
 	rval |= SDXC_DMA_ENABLE_BIT;
@@ -1016,7 +1033,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	u32 imask = SDXC_INTERRUPT_ERROR_BIT;
 	u32 cmd_val = SDXC_START | (cmd->opcode & 0x3f);
 	bool wait_dma = host->wait_dma;
-	int ret;
+	int nents = 0;
 
 	/* Check for set_ios errors (should never happen) */
 	if (host->ferror) {
@@ -1026,11 +1043,11 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	if (data) {
-		ret = sunxi_mmc_map_dma(host, data);
-		if (ret < 0) {
+		nents = sunxi_mmc_map_dma(host, data);
+		if (nents < 0) {
 			dev_err(mmc_dev(mmc), "map DMA failed\n");
-			cmd->error = ret;
-			data->error = ret;
+			cmd->error = nents;
+			data->error = nents;
 			mmc_request_done(mmc, mrq);
 			return;
 		}
@@ -1091,7 +1108,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (data) {
 		mmc_writel(host, REG_BLKSZ, data->blksz);
 		mmc_writel(host, REG_BCNTR, data->blksz * data->blocks);
-		sunxi_mmc_start_dma(host, data);
+		sunxi_mmc_start_dma(host, data, nents);
 	}
 
 	host->mrq = mrq;
-- 
2.43.0

