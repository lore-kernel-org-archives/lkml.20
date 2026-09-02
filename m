Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722533F5B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314246; cv=none; b=Z4i0Moe8YwZtrUHDCFzJPhRB0fnGYOevbJNyaEiusCAA0I+ZLDDU63aiUa99l8govSCbunmMOLstZvHDPfzjA/cUABzm53suF1z8gQSsSvghtXF4DFFXo806/QbKyg6SdUCXcWzWYXnK80X//J26DEblX6QPgCfJudcO1j/QRpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314246; c=relaxed/simple;
	bh=bMFLT2hd1hgF7+PT38bLPmDwKJnBhytafbJhxitvRbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+EJq9jTXvhmGrmlGS8+xfxVdetdAZom8rXBeEz741t9eR57KZHUuCwjRuOLskKQsvpctS8MOnUM7s8sQf/5+AAWYONnqYL+sX6gjpggaZc/fDS2RFEuoho8LI8MbSJJBtdNFKahAw/xwvrMHMdpXeIUttIm5mVqFV0QqFakUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=hnlTxdUa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="hnlTxdUa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d01663d816so4117795ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788314237; x=1788919037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24B4a/9ThhnK86I6tiKZdFQ0uGyx0+7AN1IThAG1aFQ=;
        b=hnlTxdUaTABgt+Dr91k5xaxbTnzqZ8WafnMaUN5j3D3qizjd31MAQm/cw9uxXbxZr9
         Dv4pc4BmOA6csckTPVE3NnGxDZlMuG1kPiJhto7zK6f6YBfDmMcJZk494afI4uMtuX4o
         JH00h785k62lgBIG+IpZwFLZ2tfkfgefsvqPCUUjj8nRLOapdFWTumTHctueqhk4kWgz
         uaL0V/46xdxs0Ia6jp3Z+zPhT+atgmyn0sovgZA8lhCxjlx6cDWcKeATaQ2lt5XEAwAX
         cbBQ4jty4Vq3HjI4s6ArUCZuOXLgIzM+DVpY5XcG0bXAB5CF06Jn6WIZO5UPbBz7O7ej
         gjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314237; x=1788919037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24B4a/9ThhnK86I6tiKZdFQ0uGyx0+7AN1IThAG1aFQ=;
        b=cOhDBEqLHszWUF7Z2+qtYpPeIxX5vXnUeOgymSbtfjQp8SgJCClpfJevEt4WMTR7p5
         nNlHKGGFfFQN76WUHkGUYvrS+ZViIxAXjozgqJsftSX1/tAtRa6DM7g8QNzQ6WaZYD21
         BObZLLNS23on14FSybpZougiI1gBIVwm9mzvgsFiLMeu7JD5kO93AHjLvMRBr1jLcaLC
         IgPZHXGc4UrsjkYQvSZroykALrkwdqmLsY6YL3VOONUvpSj0niSf4jmzGSuUfYrJ4cNn
         JvEQn90+d4YhFwWpxTdCemwa6hVmSDmYHSJdcFb6h+Y8U16haBGlNwaZIrDzUt+79kFd
         f40g==
X-Forwarded-Encrypted: i=1; AKwUvBwnEWyIK+jFiIb253UKHExv5IWQwfx7KvY7/gsov8fplIOHL+oIHNcysKT7uRrsIOhIGo6BxPcRrx8CXac=@vger.kernel.org
X-Gm-Message-State: AFuF++mhVnlUbaCMojmjoxtVfuPQ+sKKc/7f2aN7XxaYvnBNFHmYAw5a
	b+LW1mnWzpcqv0mZrD5NNcv2x+hYUtMUEh+bUwV69prclm6a3AM9r3B6PL2tg/8liU4=
X-Gm-Gg: AYBFou2IWHIA88fh0lxyNGVGesgMG00h8RZ14QjRrx/uix3oz3QVtEZC4joT8yV/Bth
	t+MR5bhzlKOf1UXeKHRHpxcWI62bbPWouyTddUnSQbYA3b6vcyZCftAd3P+lF65fS+TlsPkcQT1
	FO/ZA75ZelYLVd9uxNefRLra8AkedcOiWrcFEHBI4JhmsYs5+Cwneo+eHwuRH11yN/sZJQGYNuG
	P5+Z1+Kgmrh1XRZhqd8f0U09aOuno/sNNeNa3Zk9bsNkJdPAsYSB5fJODetJWpGqgUkj+77y9OJ
	aTukpL9yPA9R/+fHctSvskxixYJdd6i49IW7V71H3XLP1nBODkmllf/mDdSZcPCR7arN+OcfmT8
	TnFJ1eIBXD8D/Ssu61NkMro/jX5Ikqp/QDTe2OH130Ng9RAVierI9XCaU9AUe3nwb1s1jKtpIOt
	4aK8IQx1aS4JaR11jnQ28f8EJbPjlFi0cKq999KdNjOg==
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr1643584a91.18.1788314237407;
        Tue, 01 Sep 2026 18:57:17 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfeff4sm2473024a91.4.2026.09.01.18.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:57:16 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>
Cc: horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com,
	colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	Sashiko <sashiko-bot+sashiko@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net v5 3/6] bnxt_en: Propagate TPA buffer allocation failures in bnxt_queue_mem_alloc()
Date: Tue,  1 Sep 2026 18:56:46 -0700
Message-ID: <20260902015652.2421609-4-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902015652.2421609-1-joe@dama.to>
References: <20260902015652.2421609-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bnxt_alloc_one_tpa_info_data() returns -ENOMEM as soon as one allocation
fails. This leaves the remaining rxr->rx_tpa[] entries zeroed.

bnxt_queue_mem_alloc() discards that return value, so the partially
initialized ring is installed by bnxt_queue_start().

Since the agg_id is picked by the hardware and bnxt_alloc_agg_idx maps
it to a SW index in rxr->rx_tpa[], it is possible that an uninitialized
slot can be chosen which would hand a zero DMA address to the device.

Fix this by checking the return value of bnxt_alloc_one_tpa_info_data
and unwinding, freeing the ring buffers.

Fixes: bd649c5cc958 ("bnxt_en: handle tpa_info in queue API implementation")
Reported-by: Sashiko <sashiko-bot+sashiko@kernel.org>
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index f44a23c8a590..3755a30f8d40 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -16378,11 +16378,16 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	bnxt_alloc_one_rx_ring_skb(bp, clone, idx);
 	if (bp->flags & BNXT_FLAG_AGG_RINGS)
 		bnxt_alloc_one_rx_ring_netmem(bp, clone, idx);
-	if (bp->flags & BNXT_FLAG_TPA)
-		bnxt_alloc_one_tpa_info_data(bp, clone);
+	if (bp->flags & BNXT_FLAG_TPA) {
+		rc = bnxt_alloc_one_tpa_info_data(bp, clone);
+		if (rc)
+			goto err_free_rx_ring_skbs;
+	}
 
 	return 0;
 
+err_free_rx_ring_skbs:
+	bnxt_free_one_rx_ring_skbs(bp, clone);
 err_free_tpa_info:
 	bnxt_free_one_tpa_info(bp, clone);
 err_free_rx_agg_ring:
-- 
2.53.0-Meta

