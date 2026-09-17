Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED14457DF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627586; cv=none; b=etCjLeCfu002rpLF3nNCq5WcpPONb0LQuHwbLPSRbEePQPTPwWezWq3cfMRBjHIUuhmPYnWuAZrjMebgEGSlu2MAB9v1gPICkjF0OHH0Rc7O6T0f2pdriCS0bkx+j8hI+7spt0xaBJZjlz1ACiqEnzHdXzbMudYXBmdWFxAof94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627586; c=relaxed/simple;
	bh=Zpvdl/8Lw7viZFIGKdFkk6s8/B9GzaAAHMKKHgA/5AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCkeFM/jjBirzYQjKV7MeauAFqI48d789TBLPwy2ZUys6P8occqURwFnuMwVZVvvVIhSS51gn3V7lIJLDnkmSIAwraEQqYOa267V2z51klZ+koOdWbQwGTdIL1YCpzU3tF42hCLx4i9q0aLwX6h1q7zJGeV23ZD4j7+QcCcPulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KKvF6Skl; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KKvF6Skl"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-7f4b94d72acso149880a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627584; x=1790232384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JajMxo/krUHGWRtmYnpxnz/0vjg4QSBAOJSLqB1Atx8=;
        b=o/QeqCfTnp1PzB59CTbu5AulG6AF+j25LZrGNgVyFjRKLEbRgwqCiF6Sp3UaN3Eo0i
         vnzyKsrP86CKKVgmtxhD9eLYTRf4USxig4PaQufFkGB/MOvjd2QlgvTSSy3Ryn0oVpST
         BRjg2PnTzRKGle/bRnFc1DmMZrabwTvA2aji6zOkUD56uA3btkzHyi/Qy8opmqVGuxdX
         8yCGsa91NF8Zs/k1Q/1PPhq0wL8KjYzOKVS0KNZu/Q8wRNuyi6C7ADYdNiA2D5e0umSL
         3nuhH3CWKLQPyRnbpgJEt2BYS1YWWbWuJIoFfX1kNi52udFKKhj9CIuDeukVgsooQnyA
         80yg==
X-Forwarded-Encrypted: i=1; AKwUvBze1w2YFuDBVA6r/9GQp6TTxGLfO7lqs/4caPNt3KhhmMdjNfl4HUe+RVxHzNhboNfsF23xFOSSPyhtbJI=@vger.kernel.org
X-Gm-Message-State: AFuF++lrt1g4C5wdJDKyL+D0EaY8B0slAHBjPgSY3HbgD2A6DnvDaKgx
	5CVTZyE8E1QK4jDo6Dtv3fcPD2BEG2+CqRqfcqKmEGpfmFJYVKYdFxm+8wMRueR9t2Y1SsvlyVZ
	Wy5ue/j0pjZPkpZlQGTDd05MlFWKc6EIBRiAQvVSShPKKCFjO00Hi+jHpR+aq+2ewhZbnxqpj1J
	iwgXIC5RTF9Shkc34nYBB1oy0cTE4dmcKkIsA1mxB4EPWqVKDFrISih81qOith/RNbHKGXUF7lp
	y64lEghheMcT4MLJg==
X-Gm-Gg: AYBFou0kHb1VTy+26qYmhHWrA6S7XcuCUMhS36AwOMTz+Vzsn43HAe5hDyeP41vsUph
	TkKqrJpfYjn0x+Nz/gNiMXy4yUzWnEJ20Gn27Q1I3ploCov5oYPsK9zE1z25qGPLh9CqyPTUgCk
	hxMENH3Dr/s91aSKdF9PXppoh/gmJJCBPSVEuxHLYtGaD7bnTV7cTcfR4gAncUF0qb+idJP6UpE
	7NuE228NGHe+JV+tw+sraMof3vOnrU+oApoLAh95iKDmvHmUnTio0ZYmxxx9C6gXSkvLbK0NYDb
	3qDnCbB3HyBgRc0QH5oDN3scJaXXE+eng9eqlJJcrioOE6Kp8JKaRTXZYzLQlN81wvosaZ55X4i
	Bx9WgVs5FvfNPnzUWcQ/7+XoE6kuWmLSdhW3vGmK7w3ljESIQacNcL+foxTvXDvTwTycYO4KmcY
	6aOhlQhlnYoXXgM7esfL0NbPazvc4/aaRt+g==
X-Received: by 2002:a05:6830:83b9:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-80b2906b58bmr5947678a34.0.1789627584031;
        Wed, 16 Sep 2026 23:46:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c43e5d5e1sm1089394a34.1.2026.09.16.23.46.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:46:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so666562a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627582; x=1790232382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JajMxo/krUHGWRtmYnpxnz/0vjg4QSBAOJSLqB1Atx8=;
        b=KKvF6SklIxYNsxvVDHVlWYy8vpbprnCMKyxk9EQc5UlqMWGVbYxQzrx6h+wmRxWShs
         gUvvhGCO9HLFiVBmx61qpGtNmE7RemwV6QGDdEEIZK/ZkSyUKbkZzikuxeiiGEmvIsia
         Ib7Evxxnq16L6k1BRKGhhd6eqhhfceLzzSqyY=
X-Forwarded-Encrypted: i=1; AKwUvByZEFdOilbDnnDfheLH8tHCBMlaMotvhQar0B1PsuIogcx41hcCSAAheZIx1wP/A0zx+bjhdvq9JNKiuuU=@vger.kernel.org
X-Received: by 2002:a05:6a20:4327:b0:3d3:ae40:51e6 with SMTP id adf61e73a8af0-3dd5f78606dmr13217850637.26.1789627582414;
        Wed, 16 Sep 2026 23:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3d3:ae40:51e6 with SMTP id adf61e73a8af0-3dd5f78606dmr13217813637.26.1789627581979;
        Wed, 16 Sep 2026 23:46:21 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:46:21 -0700 (PDT)
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
Subject: [net-next, v3 04/11] bnge: add helper functions for multi RSS contexts
Date: Thu, 17 Sep 2026 12:15:41 +0530
Message-ID: <20260917064548.773334-5-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260917064548.773334-1-vikas.gupta@broadcom.com>
References: <20260917064548.773334-1-vikas.gupta@broadcom.com>
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
index 4c0cde30992c..b7a01cf885f2 100644
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
index 779780ab53d2..7857421cd672 100644
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
2.52.0

