Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083713DA7C8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886106; cv=none; b=ZWnCuB31shO1njkoWnxQJkNHFdC/SEaoGzYixJlYiIZn4AOPy5JaC4ctxLMYfxnBkbhVevAZq/Ww6PtWc0YGNoLOTL4nOGWmAyUAHLTIUfGG4X5nz1GRFK9fK8u29Zm951kBmuCp72ndcA17z3/58r3vTsQOj9++L8MyTAxHEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886106; c=relaxed/simple;
	bh=BkjCl9PTzmvibgyTAzSEgHagAdnS6n+z9kSRa9z/IJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n24S7yox6PpgjYnlcLd+Vap9cOC6ilz8GTGkHqcAHo2YdBYD1m6cBbDL4135MhACxRoRJBjn14tDUG2fNEGpShrR3lMC++CHuiJxkR1CzRQk4NUoTGm4aw8nXqDxniWw+e5elFhUGkwcFAXb9V5BHEAPrIU2lFwK/Pfh4yVvLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4HWaiaH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4HWaiaH"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so627631a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886104; x=1790490904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mSNs6gpwDbZo1OHe4Pclodm2onA21KdKi2Jq9VQVaA=;
        b=Y4HWaiaHdhc8jyGzDCHbftM0vp1Eq2jjWDXJWgw6Gj2c0E2BA9S88ygsYF14DrZIy4
         ACZ8jlQjKDp2VFR0dR7Jy9jAIYwS7qEZk4YZbiWHi5Za+EJt110hZWt7R7Ucc0Pg/CV5
         VISeGOJmJ4qzVDjLVDPhZNQdhF5YkVH2CPoO+xTg6URDlOhlaaHc/aAO2SKHFQ9JWAV/
         163TEahcNmQeF76vlgxZ/XvJb1MzJueJqMjQ7FjIfqBFJs0pwmrmPggGImWLrj3UOEEY
         l3SdQoIMthJVVwY8iLho0EZ2JJ/OwgF8pNUY5u5zfjrNGIuP95GxoFq/Esok1qON6zPa
         b9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886104; x=1790490904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mSNs6gpwDbZo1OHe4Pclodm2onA21KdKi2Jq9VQVaA=;
        b=O/VXm0GTmoBTb2ulAdKWLPtPV6/QKrTe7K6cA28936oXeiZVcUzmiEVPHkr25S69GN
         swrWSxvtgY+SvRJStOzLkmzFXcODduhu6+Ndm5uQ6QfWpMPpeEfc7Afy3/kPHTNlGEUg
         2+eTDeX0bxmsUUJpvGNk1p5cP8p5qWa3jK2Be2bvNzzE/bXc5Un5TrlH57sxx9VYGVgX
         cmmlxaZL8noytyWFFrdrEFrmhb/Rxb4fJpmHAcd+jwUCiyTUg9DwvskfZGhDMbOSfGd0
         IupSN2SIOiCotxEbmP+VXCw1JLCrTuVq088WMFjJAYWiD5czdkEjb6a+n9CnmfWOhsNB
         rBqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZu7jt/5QJ2zWQBzELKF3vehPpLAGvPdKfzxgwqKscVOGRC4SW11cCNFxhr5GqE8EfyDdeEMgaAciyVp8=@vger.kernel.org
X-Gm-Message-State: AFuF++n9NIPS24jPK+ZtbgxCuxyL++Uvm3mw3HQkcqmLf2u5yZ23oRB6
	fVkFTzGexbMPsMtwxg14IMgeXYsGNMnPgPMwBtnv3RkDSC8v5LcSZw+J
X-Gm-Gg: AYBFou0DeNKDZ0ufDHFC2gW1+3bzIv1gKxugYbErafxRrAZM9FNmJWzybsc9/6TFYth
	Ch0wJKb8PJ6vT0wFL/qPq3nAcSKo0319f3nr1R4CIXjwtSNmbUHW9cqcS4DTsWcq+2mWZm3Q7ds
	kAzI/9wORiBH69VqIuJIbRv6yuL13BwPVefaPB/5Qgf1hUtPiOoLow427RmDeaO/rP4TU5J7Wzr
	Z8sWAvrX+wQRD+yo3rLv34tpn/+YVyNQAg9R77cdhE4QbGBuP0EYxei1Rwlr7P8kcBnxmn2xT7Z
	Yu5yImIRE/VdLT/zY94tW9k89i3Wuiv4YRn7MPlh5Wf38q08L0UdBbedAFcuW3HBRwG7UnKK/RS
	6AoEU1qqHSHzXyBO4AEiy4FZNPwzpCnoP++/P1OGfUES1dp4Zj8cCTEU8zS+AN/8f0KoAV44svN
	sUDQ3D+qxSG7QqVbfJVLItdKsfZVLOkSPkWDAjFhRHQXJFmzOibIAGVY+Zk07QgFHxO3J/ZqDn9
	DfuY5ABZ9PkzX+9aLHdL9cRlj8j+v75/Ac=
X-Received: by 2002:a05:6a00:3a0d:b0:878:3704:e0ee with SMTP id d2e1a72fcca58-8783704f6efmr2520416b3a.20.1789886104157;
        Sat, 19 Sep 2026 23:35:04 -0700 (PDT)
Received: from localhost.localdomain ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe20dsm1711604b3a.19.2026.09.19.23.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:35:03 -0700 (PDT)
From: Dongliang Qin <cccccccccccc777777@gmail.com>
To: netdev@vger.kernel.org
Cc: achender@kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Dongliang Qin <cccccccccccc777777@gmail.com>
Subject: [PATCH net] rds: ib: Clear the sg list when mapping an MR fails
Date: Sun, 20 Sep 2026 14:34:49 +0800
Message-ID: <20260920063449.1594203-1-cccccccccccc777777@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rds_ib_map_frmr() stores the caller's scatterlist in the MR before DMA
mapping and registration can fail. On failure, __rds_rdma_map() unpins
the pages and frees the scatterlist, but rds_ib_free_frmr() can still
return the MR to the pool with the stale pointer set.

This leaves the pool with a dangling scatterlist and can lead to local
privilege escalation. KASAN detects the resulting use-after-free when the
MR is later torn down:

BUG: KASAN: slab-use-after-free in __rds_ib_teardown_mr
Read of size 8

Call Trace:
 __rds_ib_teardown_mr
 rds_ib_unreg_frmr
 rds_ib_flush_mr_pool
 rds_ib_flush_mrs
 rds_free_mr
 rds_setsockopt

Clear the scatterlist fields before returning an error so the caller
retains sole ownership of the scatterlist and its pinned pages. Route a
zero-length DMA mapping through the same cleanup path, and skip unmap
when no mapping was created.

Fixes: 1659185fb4d0 ("RDS: IB: Support Fastreg MR (FRMR) memory registration mode")
Cc: stable@vger.kernel.org
Signed-off-by: Dongliang Qin <cccccccccccc777777@gmail.com>
---
 net/rds/ib_frmr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/rds/ib_frmr.c b/net/rds/ib_frmr.c
index bd8611911..fea387952 100644
--- a/net/rds/ib_frmr.c
+++ b/net/rds/ib_frmr.c
@@ -213,7 +213,8 @@ static int rds_ib_map_frmr(struct rds_ib_device *rds_ibdev,
 					 DMA_BIDIRECTIONAL);
 	if (unlikely(!ibmr->sg_dma_len)) {
 		pr_warn("RDS/IB: %s failed!\n", __func__);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out_unmap;
 	}
 
 	frmr->sg_byte_len = 0;
@@ -261,9 +262,13 @@ static int rds_ib_map_frmr(struct rds_ib_device *rds_ibdev,
 	return ret;
 
 out_unmap:
-	ib_dma_unmap_sg(rds_ibdev->dev, ibmr->sg, ibmr->sg_len,
-			DMA_BIDIRECTIONAL);
-	ibmr->sg_dma_len = 0;
+	if (ibmr->sg_dma_len) {
+		ib_dma_unmap_sg(rds_ibdev->dev, ibmr->sg, ibmr->sg_len,
+				DMA_BIDIRECTIONAL);
+		ibmr->sg_dma_len = 0;
+	}
+	ibmr->sg = NULL;
+	ibmr->sg_len = 0;
 	return ret;
 }
 
-- 
2.43.0

