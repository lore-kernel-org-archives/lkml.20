Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011813D904C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997610; cv=none; b=MovDfzHFsj4t5gZMo38vJKGTwGXi+Ka+w4OdCwjEtfEwhgmgC1iOou33OxniXpzF3dDaxHo85XX/6LqPkVURDTdXyzeQByzwuFk4B/MMgnqjG2WQkcfTL37Zhy+UvI3we8CmFag/bfztZHxZUJBw10m09dC04fI+USYM22goKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997610; c=relaxed/simple;
	bh=Sscmd3mS4LasaTyJ4M41HjM04N+ZXT2HpQr3bsigrUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4FIPBAxAk4VusSMqWY7LaLWRp3zk89Ds0UWcyhHiYJdtxWWfzVAnbyqYc9BJZgnFog1X9EbW8yTpQonAMcdZx7PB2o36WpZP6u81pmy+E9prhI2BCM6hJ2WkqPXBvSm8tujy45Ptv0X8/IvKQJWFJQW/glxSK0DNTNw5sIrKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYkZqpcR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYkZqpcR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so6310965ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997608; x=1789602408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JUqDOxqGhCJmzOn0HWNBT33LeSwOGc990LCLjInaIo=;
        b=FYkZqpcRQ/HimpdS/vP5PFXtv5f9GLv9v+CbaHRrObxaNbkToX3kw2Z4p4F9wb64AH
         cDoEIHui6odtW/e+V+OICl88vMd5qurGk+dP3SxDNEEuimN6fKo59C7GsH0QVduaxm+H
         omxGGkPw1ivZd5T4gbyi5kRs6ZQ7oGbh9ynJX2LDPkqapUSU+ouIvi50Ps/SZS6Z7ksW
         MS55PW5q8/yHXJVbXH6ttKX3BJHy4QmCJj2tC0bGYs358czGhMA+di4kVQzK1k3VNcWv
         HTxLgWi4x43FELUKpEQEd+9Vjny63uI+Zdt/fvfpcQ6JxXbEfCL652nIJyynjsD87DFT
         cegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997608; x=1789602408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JUqDOxqGhCJmzOn0HWNBT33LeSwOGc990LCLjInaIo=;
        b=QZ+3nFdqjKNtELb5QyNsLTOQ0ZfaEK1eCBqL+ay6rQej2JGrISLaj2IA4XbD6IEos6
         ggjRRHwPrf+msWXXcyKq1PMprwF1UGKdlSz9k7h6GQLICUH5uYOAt07J9tHzcdhBn/zq
         gkgxOjpJnwCtZCClY08zTqncF2pkWIfrfv/eON4JGTifdDzDF4pGIIXtUDxygcjHwVIT
         Ewt4PjwfM8DC5WW4hlzTqWP6Bi11pU5furXSCHvTt1GOs3ZA71Tbw4lsumMUelEsanbk
         j0qdDN9XWMYfXR6jWqyNYU7QrIw64M2pjz+s6EtNMGElGpr29GkPQufmbH25inQN4VOL
         WJWA==
X-Forwarded-Encrypted: i=1; AKwUvByVPPhxFQHnoZP4bRYFYnDuv/T9YvABaoinb/iozw2G2T5rK2mjceK1KRgvXp/CeLGn2FOe1LIKRglsAr4=@vger.kernel.org
X-Gm-Message-State: AFuF++kPwfozCgqQvUgC9z40l3YkxJTnUCyjkU4K8XiMTYTVO6GDAPUK
	mHSyzosX7/OeRTrZeAPM8OespHQxBr58sBcOFC6/eBUyy+LYNCMzD6r7
X-Gm-Gg: AYBFou1hcpKS2ATYUFldCZf+TScWegYmPXcgzfmUGG4HOuFabDwTVfb2qeg6uUfbBZt
	Hhc4O7YvsKyRMZIXuu6FVt22L4C5HG85KhEHRsay6ZcuQMzzP7tnqmbRwVzK1fGj4zVUiWy9/LM
	+U9YGTYpHifEx1PyBDklf1mwf2UKEX7JECEbRCa6MW/mk/9RyGn/hTEcToZ5yHyXKbf6lNQqjBF
	8+Hh3J8Fo65zEqQ8S8/WlVUpRPQHRk3lexXamZTOD/NU3nB+Lyj2/hX+Xu7yhYso2C2s4+x/WVc
	LBxwmDY/+2OrAysxKa0t6zvCOV8vfAax0XvtUI7+XQlMlwKlqyoOXPtUzdArv3Mb+XV5dg0m+gM
	C1JtKEjwaZyDMQkZMI3XD12/cyseuCZIHi0bKzLme98LEh2npPu1OQ/jofh0IT0naGATBCejGo1
	7PK3Swx+b46bQs9Y8MsUsZNQDdZxr6AGxp18talmUq8SD/0rXUZWkzutRyWbD9Y8L5APesgaH2h
	yYI1LisNmfpniUG4reLkVeBz3z/UMt3Bo5tb5g+aQav8DUfv2kHHVJuYfYTVnRIuh7eXMTIlDma
	64Uc2okALtQd7msokAs5vE3lniyO+scEHqp7j4RZ1vVOiRaf
X-Received: by 2002:a17:90b:3c06:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39d70b4a2b6mr6049609a91.15.1788997608266;
        Wed, 09 Sep 2026 16:46:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e92b776sm512885a91.17.2026.09.09.16.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:46:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Dan Williams <djbw@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	Nicolas Pitre <nico@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: add missing dma_wmb() barriers before descriptor chain start
Date: Wed,  9 Sep 2026 16:46:46 -0700
Message-ID: <20260909234646.102344-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The descriptor data written to coherent memory must be visible to the
DMA engine before the HW registers that trigger processing are written.

Add a dma_wmb() before mv_chan_set_next_descriptor() in
mv_chan_start_new_chain() to order descriptor fields before the
descriptor-pointer write.

Add a dma_wmb() after mv_desc_set_next_desc() in
mv_chan_handle_chain_append() to order the chain link write before
the subsequent check of the current-descriptor register. Without the
barrier the hardware may observe stale descriptor data.

Fixes: ff7b04796d98 ("DMA engine driver for Marvell XOR engine")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 24f22db5dfa1..6db7dafac9c8 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -181,6 +181,7 @@ static void mv_chan_start_new_chain(struct mv_xor_chan *mv_chan,
 	dev_dbg(mv_chan_to_devp(mv_chan), "%s %d: sw_desc %p\n",
 		__func__, __LINE__, sw_desc);
 
+	dma_wmb();
 	/* set the hardware chain */
 	mv_chan_set_next_descriptor(mv_chan, sw_desc->async_tx.phys);
 
@@ -409,6 +410,7 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
 
 		/* fix up the hardware chain */
 		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
+		dma_wmb();
 
 		/* if the channel is not busy */
 		if (!mv_chan_is_busy(mv_chan)) {
-- 
2.55.0

