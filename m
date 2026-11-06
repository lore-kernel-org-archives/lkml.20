Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957752;
	b=DVyK02SltqVDgsdWjDfehfYQxCR9oIq37tSRryfQJZn4/jCAZJs7lj+CL6pmiO4qq/sa
	 bm2izhbbRzEIGnCUw+4jllS6QYMvJNKLxOlQY8uGUlryDR/x1lOlaB9J8xuXsY3z79K5o
	 9DpPqjqdL7lGN11BqRVgDjnFMYkKZOS+bHeYLQsjM5VCVf7hPhVQfV8F6/WKNii6nVY3e
	 jneN83q3XoF0XxgLP0ZF3TQ2ZylEg8pkaArb7v7dWSlJ6msNjqQueN2k+Zg+7o2Troc6w
	 RD5AtC7GtdkHpGACMdOvEiZ0kcC0SscyIHXGOCz3WNQLwc18dSAXCYuq1TGZeMePexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957752;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
	b=v/1kbQVlql4Lys6UIZ7xwqPeXLs18Hl1B77fzYvNtNKb5x551eNMpxJRuSIEy57NuCnj
	 fzqPFcUaw0KrbZAPoDehzGFmlHFMNQ++AtZfs1LbXh1hOnejYoMYZwnj+Be5NF4A+j747
	 bf2e0viOWMF+mb5SGkDOTy51d5pDGLZiHRkrdwDK9yUWGBCJBC3gxS6Z17BwA4kmap+u+
	 esJEz/c0evhFrZhw3BmUg/ZUKo5SivEHp/9JdQb3WO5tJRxnTgWxLg8PJJ2X1k7JZC5OR
	 +BFghY2Mr12L0xmceC2GfGEhlDJLvcLZjSdIn55SAH4ccSzDEi1jcUEfintjzUOEMmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LGNohDq8;
	arc=none smtp.remote-ip=209.85.217.98
Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F5606D83A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8F5606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LGNohDq8
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-7c33cc572e6so361052137.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957751; x=1794562551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
        b=gc8dqXwWglF6pAk7WzNQPR2zHkLm4skXjICprBOJt3WNwM/PKsdDud86F9vbsxU6AW
         +9IUQuCTmbQ1OnJBvUEOEv99aYZmVG3n3a2hvi3Z+R4EGtLxCLSxRo4sWHL+nc1nidNQ
         jV656L0jjy0PMUo0px+QLtlXXchTDmuTBqGa3dPTrl2pviqQWcxaAxrhaULIR9etFaKb
         BfIDgBIfxkbjWb4cK0ucGZ/hSB5WN9jkUrbyvFo2zoMz+m1SKEPx5bn58KMCH3vTvX/U
         seQEJzrBwku4ju4DHq0OS1pgXpZM7cDCJTqKXvuylycyxtChNQry9Jk9smnVAyOG4iJU
         bheg==
X-Forwarded-Encrypted: i=1; AKwUvBxoAhXPxQNi9qI4oOp8OtqaVGnR3ABdhR7t981GHUWWWquSbNWMKoHm1uKVZcSy+QvqHO2fAsG0opF5r2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oHDluLFekFP2AnCW4u09G6DuiG5emSrzz8I7C0TBIVq7DsiqT
	QNxG4Jr11h3AUP1zDj9WeLfJ+hxX3BXhGcThcKt/v3/2UtaMm9HtxuaO0KcvmshCMm6+hzgOdCy
	WklgHPO78eIM2AxqEt9SI/rm3SlOjyXAAVRFJyU4S6HBqOLNayTGGS1MMkV1ovnU4q8WZGggQfL
	LFl6lN29jv1nROFVwxohzgfA9gF4XRg45xOqTP7n9RK9oaYrl71iWNQGQDCRKwA/6GRAZS7JKyg
	UijWx6NTlkGVhfDRA==
X-Gm-Gg: AYBFou2d8vHXbx+xGRU8c36O2ecGwyPtA2/ah6FVhO/5ChaCVtHRrsepjK6BWlt3yz4
	wsxQ+ieq9zc6KGIVcqWr5HfCN71G2DPuYTKJsetBeyhWXOPi37PdyhoO5dKtv31XQJ81JxiilXD
	o16uvk8o3NAPMj9T1+kByFqJgHxXGyVil9uoilRkKoVQzZpcSmdlPvf6ZBOO/1wa5mL9bzBhcxU
	E5UK+CpxuZA6R5yj4ZtY0laCvkbgkZAztYj+8Af6SVuiiAHaP/aRGXL+dJV+ZkFB9W439ymaUS+
	GxiEAj694LdSiLw1QMzRfvbNnXLwoog6PXJSfw6iIftFiMEuuE9mIwgxA625plkR7zPTx1ddzTh
	QpPBHCpvOGmsHme1u5uURq5upDxF/jcludeVFTDcrDowo7lni8ZXZYLiEZA6iXyGZ7ytkjiuwdr
	uOtvN7fyrD8ByrKAYCTgekR7RMm1V+t4s0zg==
X-Received: by 2002:a05:6102:1481:b0:7b4:db17:bca4 with SMTP id ada2fe7eead31-7d2a155a9d5mr866780137.9.1793957751132;
        Fri, 06 Nov 2026 01:35:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d2a855ee87sm15234137.1.2026.11.06.01.35.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:35:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36cec75d8caso660239eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793957750; x=1794562550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
        b=LGNohDq8dPlB/yNH/M/nDnI/3RvH6rYvhVajDHBsD77DfaI1KNczwfqwQ3tGDFZyRK
         1/UcVw2HIfCwyMDUFN/0JhwJNRtnvrC96vTaBYCRfx0IqFlsvRJ/fcj+XxK7ACfwJ+Y5
         QKS8w05D3P3yvVP32atdH8MmIYY3Eqq26XM5Q=
X-Forwarded-Encrypted: i=1; AL+hErFGY+4ABkTOi48HsrZ+evYI73PHVf19K5egTz7P3h8iE7nLrJphG43agBod4dNDiSqAkmx0PQ6XoTMrT0g=@vger.kernel.org
X-Received: by 2002:a05:7301:460f:b0:36a:15ba:43ea with SMTP id 5a478bee46e88-36f76d177bdmr2560055eec.5.1793957749945;
        Fri, 06 Nov 2026 01:35:49 -0800 (PST)
X-Received: by 2002:a05:7301:460f:b0:36a:15ba:43ea with SMTP id 5a478bee46e88-36f76d177bdmr2560018eec.5.1793957749226;
        Fri, 06 Nov 2026 01:35:49 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm6447726eec.19.2026.11.06.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:35:48 -0800 (PST)
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
Subject: [PATCH net-next v6 03/10] bnge: add helper functions for multi RSS contexts
Date: Fri,  6 Nov 2026 15:05:17 +0530
Message-ID: <20261106093524.838341-4-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106093524.838341-1-vikas.gupta@broadcom.com>
References: <20261106093524.838341-1-vikas.gupta@broadcom.com>
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

