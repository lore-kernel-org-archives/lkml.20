Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2039D3FC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197684; cv=none; b=qiK0gkcoZgVJJ+LPbm8jk/TmIKdGFA7SGD29GW5VYFWfA8Qxh4IoGKhaSVrSLQuJtKNkEsesvGmdTDNqOX61awPMF8+h95aDc53poFIOa7i1Cbp/VnIa2amubaKa0rRcEYoD/JmRz2g73GJjuZl7fszGCOLhs1Zjg3K/p6EodJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197684; c=relaxed/simple;
	bh=etG2eVx3hAues7xCNYUP+hsrRAg5kIKuKmPWZ/y655k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcF24X9H6PFmcgoLRrOTeb1n98pgJBjo3uiMyF4qziB3fMy4afk6CejXoUYElqJEf3DIJ2t2YgOLWIeXjdz2LaGX5ewk6WaVsdcLk7FipoJluDT8+UcLwOtA9wGlXU2H4elg+yqYOluVxV5ySlA8TlA+bm3w3ViSQZh1Ek7zKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=zXe7/lPm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="zXe7/lPm"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1064786a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790197678; x=1790802478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTfCkaT/O6XE7Szpivk/4PcLQiXftxMknWcst8LU/Z0=;
        b=zXe7/lPmay8ocyRg1ZzZCX6phcuCHho/Zf4qKmzp30/s6Ru5CMWhEvB+Yw2TUq68ZK
         aijLH/YV9H1K+OWqdHK4zNqxkX3wQ36I1BDWo7maHfd7/i5dH4/15AyZq1WbrcEn9fRu
         XTRskXiXSULFJICtf2KwsuLkWBta+vnaTb+wQDgLjHQ5XwebmZ5YxGKdicSNBCoJOzuk
         jzDxPGvFTo31YXGKu+JqBm3IzDFSEgKtF6EHJTQgv1rg6anILl3IIBjiz2pIukkzcbJm
         s9V9bjpkS8v59fZ8o5XdH9Eta9RxkLRJ4oeliRCtW6H5fdX3DXYgbhE2CfVZmbytr+ZG
         5N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197678; x=1790802478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTfCkaT/O6XE7Szpivk/4PcLQiXftxMknWcst8LU/Z0=;
        b=KZTVtbKETrl8nt7ilGfGv4IuW32xOODcd472aeHty+F9VQTzgPD4vtiiB8kCThRBLD
         y+0qRRirLRNTEDTSgQMhdlcx0yUduKD6cb6ac6RTjxHHpLZR1I+FHD1SQQHzPt0nv4qU
         iFWst7+OADCKJFD3OK/oOrb9moT6pvptrbhywlfD+6Kr2NXCPh8thAMAYrsI0I3/98Pk
         C9d98mnyCxwyREHRpTc+ob06Dkh5kJ/HeDy67sIOIM45smjsvlafp2Wqu2a5pXbHOz6a
         3qjesLkBI2vu1ts9217KTz6Iscj4PyMAPbhYDbGODrTuVuZszaK0GynEwtnbHuyOevEj
         Ykxg==
X-Forwarded-Encrypted: i=1; AKwUvBxUh1bJfyRe6zR6rQSSwssDSYey91p+RweXVsMKVRU+lAeJXRuhOodpz3AbElc4XcCpBofFdv4JpYUejRo=@vger.kernel.org
X-Gm-Message-State: AFuF++nkwD8yocWCv8Pu+WND0llaUYyqCtE+M9M5ADd2cG6E+5X23XNn
	9QpQO+icnKKgoLyBJwTH/E9PrXdxAC6t4SiZDpcjSSH418m9nO3yqFR2pOKoM1mzxY4=
X-Gm-Gg: AYBFou03/58ckfuXbw6Wrtx93X9Zr8rLb0d3AdWs7ZTEP6yQa5xQ6BFsJ79b0DF3fz8
	tHDYJaNyxOBo/7cqTKu/2Uce9EWJNkML7SeLScRJ+pVXzYsIgv+6u6Pc1fQM2E8i3FIi+fD6XJ1
	4qa6s6KTQRvb2zGr6ZdZrMHRqJ/Gm9IZVkgsx72dWYQXnsZiUNhBX7649no2QpZDOz4irYrwycd
	h4VQMSrzAWpe+FGamOAAnS2Q/xKC6g1Yp25W85iMU0y5Z+PY4T7iezqct1lAxdJL5lY9hQ9ifhp
	HsemZizYfKEmDgoNIeH1O+DX2yrKE3EUixsTJHK/BV2S/N4WDFq7iDGQJk5XJRgFLRv+LBUA0fx
	Dm+fnIWYnsO2bBNU4P1QNY9o1afOGILAhi1j37xhWl2tSjHRGzCs9mMRo/CCFaOMUKJ2kcjO2yj
	52ahGO85WYty1O9/KbVypqykHwlNqZ3eKy7mrWdRvHdryi7B1k1oV9WLHdDNu1A/Q=
X-Received: by 2002:a17:90b:4b83:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-3a0986ed065mr287752a91.9.1790197678171;
        Wed, 23 Sep 2026 14:07:58 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm829146a91.11.2026.09.23.14.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:07:57 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v3 3/3] bnxt_en: stop DMA before releasing rings the firmware did not free
Date: Wed, 23 Sep 2026 14:07:42 -0700
Message-ID: <20260923210744.3406861-4-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923210744.3406861-1-joe@dama.to>
References: <20260923210744.3406861-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HWRM_RING_FREE is not answered, bnxt_hwrm_ring_free() clears
fw_ring_id and __bnxt_close_nic() goes on to call bnxt_free_mem(), which
unmaps the ring memory and the RX buffers that the FW may still be
using.

This is reachable in production. On a BCM57504 the first sign is the TX
watchdog; the close that follows times out a subset of its RING_FREEs and
the driver releases those rings anyway:

  05:30:12  NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
  05:30:12  Resp cmpl intr err msg: 0x51                  x20
  05:30:12  hwrm_ring_free type 1 failed                  x12
  05:30:12  hwrm_ring_free type 2 failed                  x8
  05:30:12  AMD-Vi: IO_PAGE_FAULT  x3

Count the rings the firmware did not free and report that to the caller
so it can decide what to do. bnxt_hwrm_resource_free() still frees the
remaining firmware resources before returning the error, so the shutdown
can send every message it needs to before the device is stopped.

The device stays unusable until a firmware reset.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 48 +++++++++++++++++------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index a7f6facca7b4..332fb374db5e 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7754,21 +7754,25 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
 			memset(cpr->cp_desc_ring[i], 0, size);
 }
 
-static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
+static int bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 {
+	int stuck = 0;
 	u32 type;
 	int i;
 
 	if (!bp->bnapi)
-		return;
+		return 0;
 
 	for (i = 0; i < bp->tx_nr_rings; i++)
-		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
+		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path))
+			stuck++;
 
 	bnxt_cancel_dim(bp);
 	for (i = 0; i < bp->rx_nr_rings; i++) {
-		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
-		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
+		if (bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path))
+			stuck++;
+		if (bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path))
+			stuck++;
 	}
 
 	/* The completion rings are about to be freed.  After that the
@@ -7798,6 +7802,19 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 			bp->grp_info[i].cp_fw_ring_id = INVALID_HW_RING_ID;
 		}
 	}
+
+	if (!stuck)
+		return 0;
+
+	netdev_err(bp->dev, "Firmware did not free %d ring(s)\n", stuck);
+	return -EIO;
+}
+
+static void bnxt_stop_dma(struct bnxt *bp)
+{
+	netdev_err(bp->dev,
+		   "Disabling DMA before releasing ring memory, a firmware reset is required\n");
+	pci_clear_master(bp->pdev);
 }
 
 static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
@@ -10832,16 +10849,19 @@ static void bnxt_clear_vnic(struct bnxt *bp)
 		bnxt_hwrm_vnic_ctx_free(bp);
 }
 
-static void bnxt_hwrm_resource_free(struct bnxt *bp, bool close_path,
-				    bool irq_re_init)
+static int bnxt_hwrm_resource_free(struct bnxt *bp, bool close_path,
+				   bool irq_re_init)
 {
+	int rc;
+
 	bnxt_clear_vnic(bp);
-	bnxt_hwrm_ring_free(bp, close_path);
+	rc = bnxt_hwrm_ring_free(bp, close_path);
 	bnxt_hwrm_ring_grp_free(bp);
 	if (irq_re_init) {
 		bnxt_hwrm_stat_ctx_free(bp);
 		bnxt_hwrm_free_tunnel_ports(bp);
 	}
+	return rc;
 }
 
 static int bnxt_hwrm_set_br_mode(struct bnxt *bp, u16 br_mode)
@@ -11363,15 +11383,15 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
 	return 0;
 
 err_out:
-	bnxt_hwrm_resource_free(bp, 0, true);
+	if (bnxt_hwrm_resource_free(bp, 0, true))
+		bnxt_stop_dma(bp);
 
 	return rc;
 }
 
 static int bnxt_shutdown_nic(struct bnxt *bp, bool irq_re_init)
 {
-	bnxt_hwrm_resource_free(bp, 1, irq_re_init);
-	return 0;
+	return bnxt_hwrm_resource_free(bp, 1, irq_re_init);
 }
 
 static int bnxt_init_nic(struct bnxt *bp, bool irq_re_init)
@@ -13422,7 +13442,8 @@ int bnxt_half_open_nic(struct bnxt *bp)
  */
 void bnxt_half_close_nic(struct bnxt *bp)
 {
-	bnxt_hwrm_resource_free(bp, false, true);
+	if (bnxt_hwrm_resource_free(bp, false, true))
+		bnxt_stop_dma(bp);
 	bnxt_del_napi(bp);
 	bnxt_free_skbs(bp);
 	bnxt_free_mem(bp, true);
@@ -13501,7 +13522,8 @@ static void __bnxt_close_nic(struct bnxt *bp, bool irq_re_init,
 	if (BNXT_SUPPORTS_MULTI_RSS_CTX(bp))
 		bnxt_clear_rss_ctxs(bp);
 	/* Flush rings and disable interrupts */
-	bnxt_shutdown_nic(bp, irq_re_init);
+	if (bnxt_shutdown_nic(bp, irq_re_init))
+		bnxt_stop_dma(bp);
 
 	/* TODO CHIMP_FW: Link/PHY related cleanup if (link_re_init) */
 
-- 
2.53.0-Meta

