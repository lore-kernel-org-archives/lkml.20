Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838086;
	b=FFJs97bly4EoocYKN9GdhXGl3SLGuiXcV8yuY8fn3g2SNByYX9SlRoxyoaiVRp6xgVqp
	 6nknmTPa+IS/Pv4l3P3gMD3jp0xs3pFU67vxYsTJ/JYh9FP7r2/pgSwS9MQ6CY8wtWzwx
	 bsYPmPx1NZHB2W+on1vX8xhMxxlR/2/05ouBIF368rD5aCUuAD5aje+qYp36r0rJOsEuM
	 4+ohqqe5TYUj1GmMQO6GG2nypj7Uq8+uZ8+NmabzWdI87OK1KhsQIh5fcVKhdeAbOAVFb
	 ySmSDRYFUhO9Dpk7lZKJuL5kUaJuI0nU78/kMOmHs1/AbAB8kFpO1pCi0k672R4B5rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838086;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=2zAZzlpLiyGcH0OjScl5bZT19hVmOhi2ztXZu5KB6W8=;
	b=5HVgO/skuD02OfAvN735/z8OEQBNCdEr9rnniEDVz1LpZ15wIUtNSMw04U7m7D6LPxab
	 n+pro+DekJTvBEn0zgbYFcL1HQoUClqkHWMohrvwuAJmXRzjNJXYv+hf7hqVm1juTmmnU
	 j4PQy1ZnHyrIlCLXBpG6FMa1Gm/5dyDkBcOe/djftFm2kK0w1NHSKNkMXM3owNF3x41F2
	 /CPCiCnaTTTngsG/2oJyCDEsstx5akUk0QtptcCz+lX2WPlwxopMRXyfbC9f7VScqd/zD
	 AfIn9NttPNFrgeLhEBaeoxMny+ftw74BLuJULNGr7DqStrVNbl30HvCrAxqSYR/DZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LlwJp5b2;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7486606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7486606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LlwJp5b2
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1802013a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838085; x=1795442885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zAZzlpLiyGcH0OjScl5bZT19hVmOhi2ztXZu5KB6W8=;
        b=OKU9JnQOojdsu2Bf/TLBflQkNqCT9Si5z3ciW9l+XvWVCZm35LDcPkTBW24rayjCFJ
         sfAkGTWertmbYm9wH5V95zFgS6GTpRNHcvXIAbREH3aY75HqA3H/cnEoEwOqjffg6OPT
         9TQ0Okt2tx4OUizPt0Ru0C6jdvfpXnNvmY4Vh920E/k+KEp+vqT0OyoSuxDyQmLj0210
         FYbE9TEjWr25b3ahsa8er0JBM6icfJmvzYxQ+YTDlJIxrTuInR2JbQCvOtYs+6tY8KGM
         87m6/lXKdxLk4f9YcTZsQiP/oc4HZdqRs1qmTSWhuvKu3dSS0FCBc9Q7SW9r8MDxnXw8
         pj6A==
X-Forwarded-Encrypted: i=1; AL+hErGTdniKClSzwkhd7uLSwuao6bypVGeuwAlTWyGGNAElY7g4lavfqIzNmH/LP7lAuvpbQ+Q9aSxNHPvmb6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S2665Lo4YJhaCfnQHGKOeiofEIxbzSk4YbeTNR8uRakVmm5xe
	N2bydefAQB4clIrPP947OimCSIDZPANb4T8baoiBtTyn6Rz6QYSQrnX/SHjz/BfmbVgdEROlUSX
	y1ybrAQpOGtgk3SH77hsCeVJAoBuGHyhxBEx9/Pobc+6+mAqGov2KbpFpVZItmH31c+ZftABiHb
	SIUj6CnODArg5m1mWrAUcWbQam/G/1e3GTl3qojsPqrMKQLnKvNkYlcY/VfALbp/WS7Jf/tttaa
	ouRLwVBZKv9YQAd0g==
X-Gm-Gg: AZFdTZfRKvOwGTMPETzJDF8Jm10fw3Cb1DcO5wRftXBxaeLmPubQIA11DKZOB6v5wWv
	Mge3UthvRlT+PkRbcaX8F7EUzsv8uq5zhir4V+yaXRwHPEr7monXOWlGYV05A6xqPyQt5E5cy5w
	NWXE7FPK6e6bXeN8dIqCqhUDOXD84YY+loPXctXYjw5Ngwq4K98gUZDrR7UG3+WFmXPhGSwDVYW
	5f4mNNLywHwv4sITMxed2RazN/9qQ2B2X9sImfkWqDg3hXelrN7wrr9NUDKFfA1TWl/RyucRsKs
	nPSHXt499eWwNtMJlhhCGjVdXz2QblGvFOJ2jd8vfhdwEFQiPzvXz+H0cCjaUoEkM95q7RoC3pi
	XmtazigC1lBISNvIxkomEbDKoex2D+N8krONsadiUZvdzHzA9NSBtnM9A7pBvl9zz7IWvCOZAGz
	fUQ8tSq94jZRcWKvce/hYCcV6WaPK2/Oadfw==
X-Received: by 2002:a17:90b:2cd0:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b1b0cabc39mr11357042a91.59.1794838084818;
        Mon, 16 Nov 2026 06:08:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3a176e429sm213531a91.0.2026.11.16.06.08.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so3076568c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838083; x=1795442883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zAZzlpLiyGcH0OjScl5bZT19hVmOhi2ztXZu5KB6W8=;
        b=LlwJp5b2vo5xa/DahplFhDW6oZ7FxF7nRy3nC7wr6rOS7hdA2kgJDbYOh+3UvFsh/O
         IMfoaWY1eXI0ftf/jNv50tyavCi3/PytaDwW9SJhueRwvtAlco1n3E6tfMxeq2RJ7FiO
         wpLbYMN2C1AnszJJIbcOUO+Fkf/lvPUJfmTBc=
X-Forwarded-Encrypted: i=1; AL+hErHY+VNKO5aCRPyFqbPyUL6zaYohd46anpRdBWbmd0FeVyLKfV8UAhtje7zWPTP7oJViJeptKHv2e1TE7JU=@vger.kernel.org
X-Received: by 2002:a05:7022:ea81:20b0:155:7721:3a4c with SMTP id a92af1059eb24-1b50312b26emr9845190c88.35.1794838082383;
        Mon, 16 Nov 2026 06:08:02 -0800 (PST)
X-Received: by 2002:a05:7022:ea81:20b0:155:7721:3a4c with SMTP id a92af1059eb24-1b50312b26emr9845151c88.35.1794838081542;
        Mon, 16 Nov 2026 06:08:01 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:07:59 -0800 (PST)
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
Subject: [PATCH net-next v8 03/10] bnge: add helper functions for multi RSS contexts
Date: Mon, 16 Nov 2026 19:36:46 +0530
Message-ID: <20261116140653.1685797-4-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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
index e79e05be25e1..3ef3eb99ad4e 100644
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

