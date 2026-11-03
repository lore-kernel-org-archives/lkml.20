Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709446;
	b=EWxMFxnE3gkEoNBwikTGQD0PQaI9Melcc9TvXtw3fPYgkYywlJo/lHACiHV9ZZHbZosN
	 0jWgVsTdBAvd5rECKYeZrqJ2ndLqif/w9V1OFVFHiZDsBvbH6/FvkILiNCFdfQLFjJpgP
	 uK0wvrBSHKICfnvCh0/9FBcN0WVbLPVjsSi5ZWQ7K5546bqWHmnr5M9h1iiWxVdsg0I/4
	 34kEpgeBlbB2hI5Vr6skAXChWBG0Cb4NdlonHcQYnaqzotr/AB46a/Ox3IcgHRMLVWHv0
	 FYa7k1ho2XtUCIcUvUfGeUbK/6+iOBbx+MJ+Zzj7YWhMFHyBhHisBPHoLJHKB/X+jSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709446;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
	b=4I/TWk3Jaat6ZHSWSjvCOWvZbGqgAY/ENbnUb2fnNlhdz/vSaCsuB1dhAV5xw0rhkCtu
	 Udh49ynC72CvU7ieIVbZukr5hhxNCNIAmFkBQjlqx5t+OW3xhTxmciyhBeSzgZmX/k5h8
	 UiaciYl3Ir/xK+xk/iV2cg59xbMlvkzxD6k3M6cVdg1zKQ0eFsnazL+ua/S2xXphTrorM
	 iO3DPzh7RSIbZmDw2g/cMO5ik8sOUgPB47DMNwkdiAggaOXvjSHW3OkG8Z15CZz7oUm0A
	 2poxnAMCHYYJ/zywYdobNVWKdWBkoML9XDaKYMauyksH+6ygYnuKPyYp1a7HRlNyR9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VEidaUtV;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF27606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF27606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VEidaUtV
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso2374293a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709445; x=1794314245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
        b=Jcn/gmUNgDKWAIgNCrq2AB+vswP1ppGi32lHldSGjZzO4Bzgt2IyR+A4e85OqajjXC
         Bh+z1HYXXTn6Y856GGwU3M4Wss47v2pJH1yL73dzn3Wm8K2TEW7rAWmH0ObF4RZTBOlr
         2h0wnBWadxJmcSBIITHeQTSTId0TAHBvQDvPWFezvfEo/nuoJBODXThA36MG9mpBeywP
         F+Z5G6DL14ss9fbCu3eF10+FU6VEe/sXff2Cx2ux0iptmxhz16B/WFabSi7iC2Do43a+
         nuK/Fj4zpW18y1aHDPa9AsXq5JTA11GjN4aEejqGaNdAYaxqRVKv6uVsHrQOGSdHgDGi
         fsHw==
X-Forwarded-Encrypted: i=1; AKwUvBzA4DZGqek2SpBYz2SunNNRbMPWEOzu0FtahLfwksrKCisxoxp5wVdnpP4exqDRJ12Vn8X8uoLcuZQ/Jqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HyA79SwekHmb8vDIk61P8DNVecnkfYWSLDZ4pDUVPYNs2mVcV
	X4EqZsqr2I0ym2bMhRayxA1KPEIlWF9k7wa+0ohCIwRZgCeGfBhLBR6sNMc9YhrV8+uIR/imnUw
	Mbvr7SHyd7gTsBfJ5pV5TUc6QwzMmUj8Qb3msIlHdSyu2ZhsDFsZ2JU6109qYSawN4CS08L89/O
	KqnAFK0rQ6G9vcBOqz/QwgGBKLsfSDP29FAcAOdP20Rm8p+Yc0VZB6P4bO7KwLFpkl9VrPm/Q1N
	60KkCXYxXU30+HU8Q==
X-Gm-Gg: AYBFou3iaj6RBJC01zKjU7NTOmqmYJtCbZJUcf31d/CzLjkIwJLIfi+k9PenhT1GBUy
	OKQj+q1LBiPT7KbFwXkXX21q2ahHpcLS0+7bLSiHUI3iy/ydGaG/AZBmkCcIqtk8QZKffx+WbVO
	RGeapJ/aPVkhDsHIDDsvQ/BvPVU9QR0rSWqS0Meh0zpfhWL+IHpvzLH334s+uC4YFWAGP6iygrw
	l0wwvZ6gL0bvfwJvr1bYydhULYzoqXqrH5fUMJBCx6Mr+/UCT1TvYRAwIhn2RhuUrB8jF5i0b9G
	OthYpLIUFnLekdiFtKw10sGnGWBm5dtvXAsGIFfUdK8p8dtlMlpK5N72O/lzsz1XuXyWmZPOr+R
	0kV06suZH7oNoHMabi+KfLBT1hNm9MUsnduwy1s/yxJMtoQtl6QnlhHd5UMR+xjWh+6hbS1ujrI
	xj8TJkqXD8kPGK1j9HyNredGHiCKg9qnPbTQ==
X-Received: by 2002:a17:90b:4cd1:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ae895a56a3mr10775938a91.4.1793709445225;
        Tue, 03 Nov 2026 04:37:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae881b1b69sm3369378a91.4.2026.11.03.04.37.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:37:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e601800e58so63596845ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793709443; x=1794314243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
        b=VEidaUtVkYPyb0qcdcIbykJmwwxKwr6HsccVyO6n9aByEdM2+WNAQSxiCM0r7WDZuD
         lPm+bqYIRqPb/j/FyhascXqX1qR5QCVZJ7zYSTtSfJ8oLqHWfw7g8PUsMFWw1Bx4KVJh
         27/UzLNb8Vy8MogHcsPPJKFVq/Z7tteIh4BSU=
X-Forwarded-Encrypted: i=1; AKwUvByHb2Sb+9/ujRxaiuoaRbcOahcvzjG0FVEtFCO2nzwsShQhY/H2DOL8zdnn6Qtm7FtcRR2TSqCyUHELG58=@vger.kernel.org
X-Received: by 2002:a17:90b:33cb:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ae895a5c2fmr10662454a91.5.1793709443290;
        Tue, 03 Nov 2026 04:37:23 -0800 (PST)
X-Received: by 2002:a17:90b:33cb:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ae895a5c2fmr10662421a91.5.1793709442763;
        Tue, 03 Nov 2026 04:37:22 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm2131567a91.13.2026.11.03.04.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:37:22 -0800 (PST)
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
Subject: [PATCH net-next v5 03/10] bnge: add helper functions for multi RSS contexts
Date: Tue,  3 Nov 2026 18:06:43 +0530
Message-ID: <20261103123651.442893-4-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261103123651.442893-1-vikas.gupta@broadcom.com>
References: <20261103123651.442893-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add infrastructure for creating, modifying, and deleting user-defined
RSS contexts. This helps the next patch implement commands for ethtool.
For each user RSS context, a VNIC is allocated.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  14 +--
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 113 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  15 +++
 4 files changed, 132 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 3248aae88c8d..e81c7b8634c2 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1102,7 +1102,7 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_vnic_info *vnic;
-	int i, size;
+	int i;
 
 	for (i = 0; i < bn->nr_vnics; i++) {
 		vnic = &bn->vnic_info[i];
@@ -1127,18 +1127,8 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 		}
 
 		/* Allocate rss table and hash key */
-		size = L1_CACHE_ALIGN(BNGE_MAX_RSS_TABLE_SIZE);
-
-		vnic->rss_table_size = size + HW_HASH_KEY_SIZE;
-		vnic->rss_table = dma_alloc_coherent(bd->dev,
-						     vnic->rss_table_size,
-						     &vnic->rss_table_dma_addr,
-						     GFP_KERNEL);
-		if (!vnic->rss_table)
+		if (bnge_alloc_vnic_rss_table(bn, vnic))
 			goto err_free_vnic_attributes;
-
-		vnic->rss_hash_key = ((void *)vnic->rss_table) + size;
-		vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
 	}
 	return 0;
 
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
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index d98a6196c859..a44971a7c74d 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -129,3 +129,116 @@ int bnge_alloc_rfs_vnic(struct bnge_net *bn)
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
+	u32 tpa_flags = bn->priv_flags & BNGE_NET_EN_TPA;
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+		struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+
+		if (bnge_hwrm_vnic_alloc(bn->bd, vnic, bn->bd->rx_nr_rings) ||
+		    bnge_hwrm_vnic_set_tpa(bn->bd, vnic, tpa_flags) ||
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
index 72357e0b37ac..382df442789e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -58,10 +58,25 @@ struct bnge_vnic_info {
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
2.52.0

