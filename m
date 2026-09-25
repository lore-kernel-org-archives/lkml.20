Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449614B829D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358261; cv=none; b=IIZ4PVtCTZV/rVbt72X8oMgVj8AGl3TyLHWKvdD4aBK2nSqEgK3/LhlI3EkHG7C4UPLy38Bph6g+/1BWRPUNI8NygdatKFYf1qK3APFcef1agu3BOwkcfvg0B9rCB1EhnHgIsf+FHnA1bJ79NS8UCrXiB1DLQdNaZsqXsCWrz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358261; c=relaxed/simple;
	bh=hDeZDpXt7Qd3ewLZQaXtZTNS2tcL5f32WoyRjbCB3lY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2uYX7r1m8wNWXtu1N34e+zy1xYwWWHEExbqnubUb4/jNyNHsZmHA8SFW5P2EJQXoaWdv/mqpk33bED5OK1k8Yt2sybf7QPIMCWl97DGmB5Q57rtygbAA9NKdPMkjWcXlvdfOwTw5AE7mqDftyZqNlAP/utnlPk7E/u8GCUVZnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=dnjKEYAk; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="dnjKEYAk"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so442262a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790358256; x=1790963056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Pan17QKeVsXwKDSHJnonyzvxDz8QkwwCb7z5tPQ4IE=;
        b=dnjKEYAkLRhb/9NDgIIoWPSOXU9fmecGZdhJN+9wx8w+TbhT/+PF7BAgybJ9yAKzFy
         tHrukrlsdgwabKWYweSLFlSERfHTIs59lYjSwzIyhTSm7MlzIHGzFDNdnFvEYbEqSQTf
         cxkW9/Gxdg+qkGXcDVGQ0e/jJaMgGDzOqh+rTNLvfQdff9Glsb/ZdukTlZxot2sxhexZ
         Wk0cZJKutD28fy4l8qF1T+g9L72i8Lr21poBp7VgLd5qTiLO/+WDeG37gRZkuGHqbsOt
         Lrvud64RI+GZBbXYPpAQ67DPTVBxiFA4N17pYE/0FfJMwLEdxjUirI1yz5pIfpXGI3YP
         lEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790358256; x=1790963056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Pan17QKeVsXwKDSHJnonyzvxDz8QkwwCb7z5tPQ4IE=;
        b=0wWCgu/T8PDtZ+SJQvd/Nc9capdVsTzUDX9v0riVSCvG1eNeL3LDZYO11aGfV4l4EP
         P9FmMClaZJLeL7wpjTh50ilecYw4I77MqXogxiXFHb/32I+lJfa5tktsvI2GHyFQzpIQ
         SXj+kgCD07GNNO4Ac9EKlEjS5LQLTjGwo1HzpLCKDgZuqmFGwi8sFKKD0zhlIhDIRd3b
         fjU3R5Wmjnrg//bR2WBRQNJg3qqmfS4IV+6YZj819RCWPb9EvaLfSRvGp3j9bjJJ/jtj
         TK/K3gcaUC6mYhAXZztPXS0LZvykTGESLmNAIaA2BCl3zTMh9o5UyE9ML0ILcyQLidyz
         VVzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqZjNUg1lw4ncMvn7mzApSwK1fsRGJO6cqcFa4Xt3oIagFirTifKbh5MouDqDObCk0ykyHxy+rMtV9QiI=@vger.kernel.org
X-Gm-Message-State: AFuF++mhnsSmLxN0CiqLe+H1PT5bjsgTehox4k/PLK8CvHdKxs+MLGXp
	7+MQT42UB04yOPibwHRpInFQqcR7OGcWR5ntGn6/SvKVmbPdzZvPJZViI3B/mF0dO2Q=
X-Gm-Gg: AYBFou3xCM4UjQltsaiAyViORvVhRbNK5JurIuNY7M1qTsXQ2GVn0zyqXXkapJpq1kA
	lwHssVbdfa2wxCmYXDHbAI0Yk0DESrywSZR+BXiolODH5MGyQzW/bWhESUBp1iSBgLcnKmM8yOF
	EUFYvRH7KR0A7hx73DsWpRBI6m4ACY49AUvv2mUlD8U1FynEV9jAOXCIjaEWBSMuBp4HM+0/67q
	5RGc/W6Um6ZT1esj3A0YdFjaxeJBg6heUabH5R1DCd7otKpqWlh+y8UxGlPpveOo1PtjxQiPD8B
	CHZywMF+PNaF52Mh3kVkUy25c7cqiAPpspS94bJpf4+o7Z+I2WcbfOcoqEFWDbfLmplci164OEv
	mUg+nkhCPTWaiPhjSiUYY76EZ/nKw7fB+NSsh4veb3rlfy9GnkyCq09wslmLQ5EeDr0MmlYbt/H
	y8SqefgNnKGmeH1RtG36N6zvot+K3TWUHnUd2vgFPeeP8mQ1h6M2FofztTf7I7GhRZyiQIzq264
	cSedodPhV1C+S3/yspOHtGU
X-Received: by 2002:a17:90b:3e50:b0:3a0:c36b:f5c6 with SMTP id 98e67ed59e1d1-3a0c36bfc0fmr1114522a91.8.1790358256542;
        Fri, 25 Sep 2026 10:44:16 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589f7esm5563306a91.10.2026.09.25.10.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:44:16 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v4 3/4] bnxt_en: stop DMA before releasing rings the firmware did not free
Date: Fri, 25 Sep 2026 10:44:00 -0700
Message-ID: <20260925174404.2789072-4-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925174404.2789072-1-joe@dama.to>
References: <20260925174404.2789072-1-joe@dama.to>
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

The device stays unusable until the driver is rebound.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 48 +++++++++++++++++------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index a7f6facca7b4..33e9ce8eb449 100644
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
+		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
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

