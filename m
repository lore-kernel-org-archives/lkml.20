Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992486;
	b=ND9rCaF41+aIRBfjS1RJ8Zbqw0kBH8WxHFnL7jXiEze97FUegenA3HwmVlh3FTLpxMTF
	 /M8Ssm/0SV0c4/GS0wXnT9qQdLLHenPufhZFreCgaHIl9pG5Mh3NT5UHUw2VpO0Bzp4Ha
	 JQVp2wSAjIBSYXUhfU0S6wnKEzsY2mBrldIK2/FxVlz309Dy8yk9ppKybxDWHwAqlFVLc
	 IaR5UGsmcJya1M2I9WegMKxxAiPL6dwqgM/WC6+/zoC9r7lSEzBNgl5CQuylU0JZRadu1
	 HvHiBZZh852FlzZdYPGGm+1RdtOrpN5G59N0Ply1pwC/KVbNIhURKi0088KF07IMgAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GZytUPiv2e4WSZ94rSI3nMfLrUeBBSwxjoxGIAO9Nx8=;
	b=UUCXfgGw1BiXFRyvouhNQTHYVaoanlkkZfRqClvTBftEzsXWQyRVKkIYGIXvlCRj4ZNk
	 BXVUDyb3+ycEyKb2HQgBJPhE9LktF6HUxuhslsgUdR4AU2kynwACSrBUsDDB2QGXKNft8
	 KsREO4E3Gqzr70t4MTAY0GN8PQdln5H8B3RS4imzklKG11pSjRgGGsv33faRNfXqdGG/3
	 ZfxbZ8W8Hla7gPQm2OLuKRx9cy5w7G/2XoPe3dBRTkNaiE66cpGvSYFm7rFppGZBmLEPu
	 MAEnkiyXm8ecbDCeYvv8eqI7ILnYRZsWcA2Cp8nEVXjIiQ9N8mrOR8oMSZwOvX/BIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AvrI+74D;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA94606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA94606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AvrI+74D
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso586293a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793992485; x=1794597285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZytUPiv2e4WSZ94rSI3nMfLrUeBBSwxjoxGIAO9Nx8=;
        b=AvrI+74DuMkM9CG+0PgbSrncJJMG1FFJpx2k8JhRLeN8ZCcapOQJeZvALXyMPEkjlO
         4QQ0EFDuHKyRhHT89uSCQ/efyMb1RRj/be7olHC8FLIjAcxsx+rQcQyIlB2ZixByEH7g
         xwjkT/DEMS/9sSb9Ccw78m5uGNXfnhc87BuRKBy2gIAPOSr0iM+sZ1i066G66TQKfMK9
         MBJLLKwi6h9KqAkXl3JvQ2Sf5ZUjo7U3Elg0gMDKOoIUFETi03qorF712vbLiUzms/Ai
         r/ZebbKNGy6jwlTwWwTyQkxiKxDxFj+vNMV3byllaPSpJJLrHpmibJ76Cx7J9MJC+aen
         6RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992485; x=1794597285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZytUPiv2e4WSZ94rSI3nMfLrUeBBSwxjoxGIAO9Nx8=;
        b=AyAUARSvIPt4oXHkoL49kGIfcTX2bG2aBEQLiSV5/i760Ji2ozsKE9KtfSDjYq/AHL
         Kyx6l4FgoJLuGWB13AtWgwwsidsDYcM/uaXkMgCqJIlWTKo5jWfXRI+AqNecp8CYRY/C
         O1TcY4iPAA4ggs/kieklw7ZGj/gF0O6zL0bstnzsb4crKuTT+xizZ84Zwe4gIw5MtxLW
         ufrMYPa4j7XiC2NNetfEsnGg5wqrm0Wx2Y8kY7CLEvq/6yB5aLyhMXZA+bbifDrk4hqs
         WFAArGIJg2Bf54bmE7sx6u99TSyLaJR0WR/d0VzI+xmFmD8pERRZ0z84zBTfd/GWmr4x
         ajoA==
X-Forwarded-Encrypted: i=1; AL+hErHP+EitU45JDgXL7Bpr2IlWgS5QC5gwOsLQabD1nq37Z2mb8KOpH6Q3qmfpuCfbKDPey42X9p3a9gTNZSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xxGhtn9xWG9oUMVGD1Xv8MDlb+g3z/Qiuusbsl5RNYKvgs0f3
	aAePBr8xlj1ewuNjTsCbqXejp5thE2aHBcgW90fwhBmccgWB9mHL/nLZcAJdOFFu4ns=
X-Gm-Gg: AYBFou0pc2LzM+qe44cqDRkB7msgqx9wnqX2ddscaTRxDc9CJ+pvQG74dLQrohqadvf
	2gdTb/fGBcYfPVLdS1cj7fmBUeHpwYUhpJRP1O7lJG1iVtNWbRMuWjM93RGHUbFnBEpkzZKAtj8
	o2m55eDZ+hIq2zBnliLJUI6LN43ynXZ4S8ji3lyNm0k0RprS1Xyf4KmQLQOMAfz9LZ8Gg35DtBa
	r3UptukNkvgHiMto76M6UlacOqKJz4yrr/0tvsO4Akj+DrsKc3b/JFGDZv3Fn1dAKqm3oe9jt3e
	MdqIFcEkG+S3JSJ2aHM6xBJPPdMYldbPR+T9/22K+J3ZZxqj4V9Xi1+RdLPlGCYnTO7E8seEK0d
	Tko8dF5FcUHo70eAKK/gYa8R3jKusSFzATVZre5jVD276/BAOKAj9g/R2MhrWuGtbCwb+RLcgay
	c7cl7hcXep3vWCMTxsGvgFme+VbK/QbSFp1xDn6UnwBTH+RAYyPl8WsSAvs7m0GuUKXxfxpVaqO
	3TR3lpyIh3ERNVGmFBIRRFPLgcExKKBlq/3ccGLykIT3R2Y5izfk/4aEdIwaGKWmV9niPIUUItT
	nvFQPXOmRSiMEenAHkdsygXRRNsjzDLFO+E9EeAdDw==
X-Received: by 2002:a17:90b:4c8f:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3b0db6fd4dfmr3631101a91.59.1793992485635;
        Fri, 06 Nov 2026 11:14:45 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:9::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105904951sm42781a91.16.2026.11.06.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:14:43 -0800 (PST)
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
Subject: [PATCH net v5 3/4] bnxt_en: stop DMA before releasing rings the firmware did not free
Date: Fri,  6 Nov 2026 11:14:19 -0800
Message-ID: <20261106191423.4194081-4-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106191423.4194081-1-joe@dama.to>
References: <20261106191423.4194081-1-joe@dama.to>
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
index ea8529c78994..b5ef86bf92bf 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7773,21 +7773,25 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
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
@@ -7817,6 +7821,19 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
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
@@ -10851,16 +10868,19 @@ static void bnxt_clear_vnic(struct bnxt *bp)
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
@@ -11382,15 +11402,15 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
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
@@ -13461,7 +13481,8 @@ int bnxt_half_open_nic(struct bnxt *bp)
  */
 void bnxt_half_close_nic(struct bnxt *bp)
 {
-	bnxt_hwrm_resource_free(bp, false, true);
+	if (bnxt_hwrm_resource_free(bp, false, true))
+		bnxt_stop_dma(bp);
 	bnxt_del_napi(bp);
 	bnxt_free_skbs(bp);
 	bnxt_free_mem(bp, true);
@@ -13540,7 +13561,8 @@ static void __bnxt_close_nic(struct bnxt *bp, bool irq_re_init,
 	if (BNXT_SUPPORTS_MULTI_RSS_CTX(bp))
 		bnxt_clear_rss_ctxs(bp);
 	/* Flush rings and disable interrupts */
-	bnxt_shutdown_nic(bp, irq_re_init);
+	if (bnxt_shutdown_nic(bp, irq_re_init))
+		bnxt_stop_dma(bp);
 
 	/* TODO CHIMP_FW: Link/PHY related cleanup if (link_re_init) */
 
-- 
2.53.0-Meta

