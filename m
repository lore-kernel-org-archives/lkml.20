Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6B4A64EE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729491; cv=none; b=G9Wcb7csjqNrgq/dBfUTL0qzoAVOcwq4nL8PZYLoz57VBXHKmdD16Olb+KQoLvyUbxptMuqRPV5GyUiRnekuaeME2YyAytQ+UoEnhlim+EtIOHt60PhM/1OiQEgHIR2CsU1QRc7vVrMZRUXMLt22oCD2bKOcERAX4pG+ahhW0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729491; c=relaxed/simple;
	bh=q14v7R3EK3i7SDZaNs52rxEa4lQHtackk/2drf66XPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kiDRX2s1izbgw6H3YSA7SP8sAadwCoCUOyM0c9MvM3qJbQrryZDVkwX/fzR0usK5yNnbKPy0jukdMEPOq8vdCSzUlFFOn19oUJY6/jkH6ya97hV5dRnseAa+37MP43vTwZK7T9ay0fmnTL04xcC/86cd8Ba8U9qwgeMb0TIuaZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pn4y+s4t; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pn4y+s4t"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4926d058720so1285945e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729488; x=1790334288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsUUrhZxDXVLnpzzLxhn6wboqqmfaSeS/zWhQNNaxZY=;
        b=pn4y+s4t76zBfhjulOlDsawk1N9xo8OoiwzEFAoWLCg2G1qXgrwoKe5bwHPLpEZVXi
         pwYy+IMNjeb/wzAhVZfS2rmiD0kNHDEj0YX85B5nYwJZavSOakxp+xLkSRfJD+tK03RF
         1Hufs6a5aLjGqYoNv21c+WTet8Tn69ZFgU1CVloWlBE/az6XOvnJy+x9ovloQpRT1sd+
         pKemMwH2GE+i9zrXGpkva89Q5+UTK3DpOcQe6FLLWEjbsuQ8Cm9ZF8q8qbhxs5J4vym9
         AXL7mp8uf8IwsivzxiRed5mp5g4JjdPlPhkjlGt5efslIFt4SXDEBsSVcCNgVCu73f55
         q4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729488; x=1790334288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsUUrhZxDXVLnpzzLxhn6wboqqmfaSeS/zWhQNNaxZY=;
        b=CgGjEBcB8fV9cxWioRS2myikwLPrmE09o5Akh8r/zK2yEh9EcxpzIFejo8oMSIjsxJ
         MAAKmYILEnX97lxnK9jCBln32Jh+mAH+smUlfT4ikn1PzRUHFmf3Zqmms0RJL6vvFeR7
         iPfm4TXxPsJ5y8Q+5cCiMPEfh9PtKahsKPBGA5BE/YsgX6cnmzO8IFPQDq8vDaom/xia
         TM3+Y7qJtSGoNTWhHi8XVHU0c3eX3l4PUoR2cJimqUgMFvTs71uNCnM7SvVTAabgkhO2
         zm34dnibyjGwChBdpLF9H/i7HmK1rI/Fl1ERdRp0QOYjRRp0jz8cYaH787Phovd5OLRn
         Iw7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7Tdu+YEPhdh9EF0xWWtGSM+vo5M4AKKgVu9JFug79XoW3Aqq6vMpFlPv3uJwCaPGiyAHLbj/2n9qhBVs=@vger.kernel.org
X-Gm-Message-State: AFuF++mq0R3ns+NozbK+8okzH/KNDSz4cwGYea5ucsd01bYJoJ8zKqF3
	zq16yJfBhFufYFGLG7jSCWTtz7uXm47aqJvWuLM558uGfEDGqApzLaz6
X-Gm-Gg: AYBFou0oBIiSQuGzdG5xpBnGqt+U8FyvRjdLdLdmpe/mIwhaKMFdxNMVEk4fIg1ZtlQ
	D1cekojDc+ae4uq5Da+jKviIvQMS8r5NmZJ2ZgkxfEpf/qhVnY8csm/x9E2UfoV4qQiC3glHoDA
	wHlcVNJxlV9IwccE3eDON6UYcwFePDFpNBf1umGfopB5ti7IvoKoZGmPFHtGSVhkWAv0PlC5E04
	ixRHPcMOuO/MSx2yw7d3uiuhoqmto2uOPE3tTIXhC3XewYAQpJq2MNEIef7/qA89HzZOC2pB0R6
	ybxt+dvplyK/Qi7kVwA8RozAT97Uss26MGPrH6bL+flko7IVJh6skb0oOEEfARzjOxITNOCseBJ
	/ZHJXaxl75zesqpRcoAcPU7KByAqj3UICPPHJS70UKomy2ND0hUx9L7gyOnGMlJodtREc6RIvzC
	rQUsgSYH4VCyvXoBkXLK/aDxoxWs94VeSBKFQ7vZEUoBLiwy0/2P6YriMvu6FkCqc4gPUEuSCnw
	UJuQMvK6k2bmag=
X-Received: by 2002:a05:600c:a0a:b0:49e:84bf:6110 with SMTP id 5b1f17b1804b1-49fc56dbb49mr28248695e9.6.1789729488054;
        Fri, 18 Sep 2026 04:04:48 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc53b1b78sm34115545e9.3.2026.09.18.04.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:04:47 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: tatyana.e.nikolova@intel.com,
	jgg@ziepe.ca,
	leon@kernel.org
Cc: shiraz.saleem@intel.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/irdma: Free IRQ when CEQ vector mapping fails
Date: Fri, 18 Sep 2026 14:04:28 +0300
Message-ID: <20260918110428.36586-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irdma_cfg_ceq_vector() registers an IRQ handler before requesting the
CEQ-to-vector mapping through the virtual channel. If the mapping
fails, the function returns without releasing the IRQ resources.
The caller destroys the CEQ, leaving the IRQ handler registered
and potentially referencing freed memory.

Call irdma_destroy_irq() on mapping failure to release
the IRQ resources and drain the associated tasklet
before the caller destroys the CEQ. Use the same dev_id
passed to request_irq(), accounting for CEQ0 sharing
its interrupt vector with the AEQ.

Fixes: b800e82feba7 ("RDMA/irdma: Add GEN3 support for AEQ and CEQ")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
Assisted-by: Claude:claude-opus-5
---
Found by smatch:
.../drivers/infiniband/hw/irdma/hw.c:1261 irdma_cfg_ceq_vector() warn: 'msix_vec->irq' from request_irq() not released on lines: 1261.

I performed only compilation test, it hasn't been tested on hardware. 

 drivers/infiniband/hw/irdma/hw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/hw.c b/drivers/infiniband/hw/irdma/hw.c
index cae4f316def4..522a1685d400 100644
--- a/drivers/infiniband/hw/irdma/hw.c
+++ b/drivers/infiniband/hw/irdma/hw.c
@@ -1252,12 +1252,20 @@ static int irdma_cfg_ceq_vector(struct irdma_pci_f *rf, struct irdma_ceq *iwceq,
 	}
 
 	msix_vec->ceq_id = ceq_id;
-	if (rf->sc_dev.privileged)
+	if (rf->sc_dev.privileged) {
 		rf->sc_dev.irq_ops->irdma_cfg_ceq(&rf->sc_dev, ceq_id,
 						  msix_vec->idx, true);
-	else
+	} else {
 		status = irdma_vchnl_req_ceq_vec_map(&rf->sc_dev, ceq_id,
 						     msix_vec->idx);
+		if (status) {
+			void *dev_id = (rf->msix_shared && !ceq_id) ?
+				(void *)rf : (void *)iwceq;
+
+			irdma_destroy_irq(rf, msix_vec, dev_id);
+		}
+	}
+
 	return status;
 }
 
-- 
2.53.0

