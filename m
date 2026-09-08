Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44A503BD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859900; cv=none; b=IgfqEwJripYhE5vfBgvozpFCt+QDiG9luzeJZVDwwMXiG7r8AQgK2Y9bOWnIakQI6u7wd8B6wy5HBhDUF/1iqVmMZ863TSS/otU7ZZeWzw57jm+2BaYg4nTLJylb/M4qIgztl4+JMR+JeqtkUMk0wIq9io1gzEtK0zckBSLXW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859900; c=relaxed/simple;
	bh=s1agvou5NBb/578tebT88UsNVS465oPsCZ25fX3W3+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nn1HDXhHr5WQIV5HZUKvmF5E5l8z/3ls2SIKpxTnmUNiENa2Rz7bzxkisL7BLr+7/Y6ZXJeTYKazIBzB2b1iHoOK+r0y+xxtbLbaQfUyWZseGr8PEel00VIeG6nL/fm532NjwIkTS4mx0mmB96ejU9IU1+KfdZulOqbPXFv5Bow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PhqIJjVJ; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PhqIJjVJ"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so3367997a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859898; x=1789464698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hj7mA1AQzMAhZ83VfP7TrgQzgwtZ7HtohWrNzl8QB50=;
        b=dQG+Pc6ncv5SmTk7DETa+A4NfHmrzfURkPFfQ5gX6paTbxKQ5l26aQdYYqYc1D7+XL
         x7ysaMatV1R6Nz0CA+siXOzPWGOrQ3arcoETZliL2P7fAVwseYw+AvXcnD5le4YvDW3x
         gwzc99zMXae+0SoV4nk9HDKaZgsP/BcAwVyj5x11GXdyqstWbJXTLOdTatPXJPuZu4jp
         nAWDZewp4TadZvUKKUCw8C/g0AHSZ1l9yti5M8NP+WNYVOjnIYJmF7oc5t8L/HDgANZO
         w8XhFlypStB+E7spPwZU9Bh+65tvrme/0rAiuZIkDnzdaR+gj7kxMEe0bGv95ohBXaih
         jgoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHYZU8Djb8FT/6v2gpZFxjyoqCn27PZU5MDZMYwaYeYAAsQJRM19s7qisis9TngeN8U3nHYL6RoOy9ToE=@vger.kernel.org
X-Gm-Message-State: AFuF++nRivaTw8J7FxaYBjitF7YCUAeM93y6FOCTCtGA5lb1uPAlvHMW
	zvyjIRoAEfiZLJ683Md4jN+JgLT3X4PFRLU9AEnq6wGfg2aW5iBhroPVt5TQH3EK2i11X26lRk9
	wA+zQ53uAifjJ2BcVOQcdYZQtT2Nd4efUl0QaKtzIzWDNDFkiFArtVzhA+DzlP/h8nQ973wgAaH
	t0QukElEtdD4drH085h6uWrjvR/lthrrWI2Pl47L1u2Pv6Rd5EeiETNLDeT6UE/MbJLKXdP6Qxn
	zH2fKr2TJ2np32QiA==
X-Gm-Gg: AYBFou2ugnLKV6q3lHu+UMHhCImm9QaedJxL3aGDPpNaKyelQM/c/KxlszvX7dyaLaw
	1uVszgrGsBAw4FajTFWVag7y8RHZ0TBgmo0CCqnQlWI9WK2DhGNh5eBHf0a02wmPT9nZTCK7H5R
	KOPYM6f/wX8gRxD8Gy+JtPq86kcgKYU4m4J4A3K/yL1UuH519fdQ+YXwN5em1aVTo1sMuxyX0AW
	yqH5JHKUa7Shbm8rLMl/MNkX5weA1zvInKQNLT8/+c6y25MvKtapHQIoFs9u8/3DHAA/y1wVvDD
	NE3dDHfQSw9aolu+Cbp5xsOnGsPfAxL+SnSBDN5A69ZcbMMfguZYWLecS+J7Q0PtBel0iHfrxW9
	ZhXuIQtC/fJxQTixDX78p64vYLIBsbjT4XK0VLZKaR8WlZB7l8wDBBisZgdyjTpXBFd2XpRfHoV
	zpWK9OHd3c1vshbf3VTU7C3StSLkRfHUg=
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr39215174a91.3.1788859897630;
        Tue, 08 Sep 2026 02:31:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b160990basm9640608a91.8.2026.09.08.02.31.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:31:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so5563499a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788859895; x=1789464695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hj7mA1AQzMAhZ83VfP7TrgQzgwtZ7HtohWrNzl8QB50=;
        b=PhqIJjVJuzTTR7kfGeckVr+pwG6hziZAD/g1RQ4cZ3ANVNgXJukWmuSGPRW1Au3FKb
         WAYxVE7zTkS/mOtrR6z9pp+iLCzx6CsJ29wB9z0ZBVeV6gX3A0yWFJNIshGaDSuqUgNR
         8Fd4MpSyfMO/G2k9mBoWg3RWVeaai10IMcXh8=
X-Forwarded-Encrypted: i=1; AKwUvBzOcggWJmiqcLvMSSZF4axia31J0kEZV9Nf0ck4rX6OX4CWJPwUMkxpcDspSeB5EbftJKMB12ly7AOv+vQ=@vger.kernel.org
X-Received: by 2002:a17:90a:750:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39b92bbac84mr3810192a91.22.1788859895252;
        Tue, 08 Sep 2026 02:31:35 -0700 (PDT)
X-Received: by 2002:a17:90a:750:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39b92bbac84mr3810151a91.22.1788859894684;
        Tue, 08 Sep 2026 02:31:34 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm31493316a91.11.2026.09.08.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:31:33 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [net-next, v2 04/11] bnge: add helper functions for multi RSS contexts
Date: Tue,  8 Sep 2026 15:00:46 +0530
Message-ID: <20260908093053.2596020-5-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
References: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add infrastructure for creating, modifying, and deleting user-defined
RSS contexts. This helps the next patch implement commands for ethtool.
For each user RSS context, a VNIC is allocated.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |   2 +-
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 113 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  15 +++
 4 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index c47a874df4ba..3c0fea0a7608 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -371,6 +371,8 @@ struct bnge_net {
 
 	u8			pri2cos_idx[8];
 	bool			pri2cos_valid;
+
+	u16			num_rss_ctx;
 };
 
 #define BNGE_DEFAULT_RX_RING_SIZE	511
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 19d7f1e2b74b..2823be44a7ed 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -213,7 +213,7 @@ static u16 bnge_get_total_vnics(struct bnge_dev *bd)
 		struct bnge_net *bn = netdev_priv(bd->netdev);
 
 		if (bn->priv_flags & BNGE_NET_EN_NTUPLE)
-			return 2;
+			return 2 + bn->num_rss_ctx;
 	} else if (bnge_is_arfs_cap(bd)) {
 		return 2;
 	}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index c79eb403844a..417abc7e8c74 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -125,3 +125,116 @@ int bnge_alloc_rfs_vnic(struct bnge_net *bn)
 	vnic = &bn->vnic_info[BNGE_VNIC_NTUPLE];
 	return bnge_alloc_and_setup_vnic(bn, vnic, bn->bd->rx_nr_rings);
 }
+
+void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
+		     struct bnge_rss_ctx *rss_ctx,
+		     const struct ethtool_rxfh_param *rxfh)
+{
+	struct bnge_dev *bd = bn->bd;
+
+	if (rxfh->key) {
+		if (rss_ctx) {
+			memcpy(rss_ctx->vnic.rss_hash_key, rxfh->key,
+			       HW_HASH_KEY_SIZE);
+		} else {
+			memcpy(bn->rss_hash_key, rxfh->key, HW_HASH_KEY_SIZE);
+			bn->rss_hash_key_updated = true;
+		}
+	}
+
+	if (rxfh->indir) {
+		u32 i, pad, tbl_size = bnge_get_rxfh_indir_size(bd);
+		u32 *indir_tbl = bd->rss_indir_tbl;
+
+		if (rss_ctx)
+			indir_tbl = ethtool_rxfh_context_indir(ctx);
+		for (i = 0; i < tbl_size; i++)
+			indir_tbl[i] = rxfh->indir[i];
+		pad = bd->rss_indir_tbl_entries - tbl_size;
+		if (pad)
+			memset(&indir_tbl[i], 0, pad * sizeof(*indir_tbl));
+	}
+}
+
+void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
+			  bool all)
+{
+	struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+	int i;
+
+	bnge_hwrm_vnic_free_one(bn->bd, &rss_ctx->vnic);
+	for (i = 0; i < BNGE_MAX_CTX_PER_VNIC; i++) {
+		if (vnic->fw_rss_cos_lb_ctx[i] != INVALID_HW_RING_ID)
+			bnge_hwrm_vnic_ctx_free_one(bn->bd, vnic, i);
+	}
+
+	if (!all)
+		return;
+
+	if (vnic->rss_table)
+		dma_free_coherent(bn->bd->dev, vnic->rss_table_size,
+				  vnic->rss_table,
+				  vnic->rss_table_dma_addr);
+	bn->num_rss_ctx--;
+}
+
+void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)
+{
+	bool set_tpa = !!(bn->priv_flags & BNGE_NET_EN_TPA);
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+		struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+
+		if (bnge_hwrm_vnic_alloc(bn->bd, vnic, bn->bd->rx_nr_rings) ||
+		    bnge_hwrm_vnic_set_tpa(bn->bd, vnic, set_tpa) ||
+		    bnge_setup_vnic(bn, vnic)) {
+			netdev_err(bn->netdev, "Failed to restore RSS ctx %d\n",
+				   rss_ctx->index);
+			bnge_del_one_rss_ctx(bn, rss_ctx, true);
+			ethtool_rxfh_context_lost(bn->netdev, rss_ctx->index);
+		}
+	}
+}
+
+void bnge_clear_rss_ctxs(struct bnge_net *bn)
+{
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+
+		bnge_del_one_rss_ctx(bn, rss_ctx, false);
+	}
+}
+
+struct bnge_rss_ctx *bnge_get_rss_ctx_from_index(struct bnge_net *bn, u32 idx)
+{
+	struct ethtool_rxfh_context *ctx;
+
+	ctx = xa_load(&bn->netdev->ethtool->rss_ctx, idx);
+	if (!ctx)
+		return NULL;
+	return ethtool_rxfh_context_priv(ctx);
+}
+
+int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
+			      struct bnge_vnic_info *vnic)
+{
+	unsigned int size = L1_CACHE_ALIGN(BNGE_MAX_RSS_TABLE_SIZE);
+
+	vnic->rss_table_size = size + HW_HASH_KEY_SIZE;
+	vnic->rss_table = dma_alloc_coherent(bn->bd->dev,
+					     vnic->rss_table_size,
+					     &vnic->rss_table_dma_addr,
+					     GFP_KERNEL);
+	if (!vnic->rss_table)
+		return -ENOMEM;
+
+	vnic->rss_hash_key = ((void *)vnic->rss_table) + size;
+	vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
+	return 0;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index 93c6d736cbeb..af066d8ff156 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -56,10 +56,25 @@ struct bnge_vnic_info {
 	u32		vnic_id;
 };
 
+struct bnge_rss_ctx {
+	struct bnge_vnic_info vnic;
+	u32 index;
+};
+
 void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic);
 int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
 int bnge_alloc_rfs_vnic(struct bnge_net *bn);
+int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
+			      struct bnge_vnic_info *vnic);
+struct bnge_rss_ctx *bnge_get_rss_ctx_from_index(struct bnge_net *bn, u32 idx);
+void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
+		     struct bnge_rss_ctx *rss_ctx,
+		     const struct ethtool_rxfh_param *rxfh);
+void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
+			  bool all);
+void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn);
+void bnge_clear_rss_ctxs(struct bnge_net *bn);
 #endif /* _BNGE_VNIC_H_ */
-- 
2.47.1

