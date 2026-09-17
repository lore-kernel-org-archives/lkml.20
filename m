Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C544684C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627581; cv=none; b=o2VlSJ6SXQEXk5drW3B9V9UN6sYWeBTYfk4k1ia8rGMOune9qoRCZj73Lxd1DDEU4d50pl6+2IAz0hE02xQBzOY9rH9sY3Zl5TovEUqamjbeLRJHkx0vvMt5qQjTW92iF/D9FwWs+MIVYEmtfTeyjfgFgAK/ieVLe0SulBw+eLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627581; c=relaxed/simple;
	bh=tPVIJyBE0kdA0MLXZj/BFpPN6SlwlnuloPoD0XlP9No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkH3k9Kaaf4fAio4lo24pCzw1z7ETI8yXstuvmFfGxTD3JUNVpxkdkqJo34WC5kJZj7BaoxtTrIysSEl8dUHQJ6JCOW13a3vuPdHQGvyqDFwa4rqwobRwRHyVCi5IzTbu6DGwN4y6d6iRo2/YUOkFDZiiNp8sSfWTVLsUN9wnak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PWP1hbtE; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PWP1hbtE"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-939f5f82829so43634285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627578; x=1790232378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utj+LXach7A0wRbI7r1l5SQcV1AWLnk8cM4PUvzl2h8=;
        b=RiAJXSUQIpa+YVE4FTBRmJQIHPunGjHhutlOYoJAwi5Yj3d3MoVLSuqUh2nBIzyg42
         VPnTLIFos5WPpZKgqcJPQJaSF4vJKQYEBCI6r5NY/YgVogrtj6dpVduBBc34KcAaR4Pa
         hA+u8ELqVSvINYRTDOejnryrkmOCJ6ikGOjOLIRLv4yDfzU8Pm/YW3Alki9gDhF9TccX
         IT+91tVS3vUwJbaoQr28vOlPYllW7Mivs9oZMojOz2VKiikiHA72bwMCLM04ZPrheiXh
         YpQppuiKFb3P6e9edP24vVDJnywVdtej+jVZjT2nJqpG1dYFnjUPkT5ufm9pJd4SkqjP
         gl4g==
X-Forwarded-Encrypted: i=1; AKwUvBy9ML6L6YHvMw9vJHWwSb1Km2bHPfb7zHvtFV2b3CWsrMzk+R6zAF+rkHveUMvhxqxMq0n0bCoIGMzqkEI=@vger.kernel.org
X-Gm-Message-State: AFuF++lFvCg+0+jp2iQ/pf/nl/wFGoZNsyuxXt7sfGLpYL1mojvWTTvT
	I4UI2M0iG5Wxd/2AfrnmPiXgLz6if44JFBqcVmDvVAJyTB0e/snSZ0v1ZlNhOXwHLgEXymXlLOT
	jHWtZ7c8q/l0Nt3uRmLShht3Xk9IQMg6kaO0YI3Iz9ItFsLBJYLTLqs+u9C9CfbylZJMh0xM1RN
	lFZEo4fBK7HsMcDJW7+9mbNIT26Qv3n7Wk1aNLGEfn+tCn266QARHoELitvvA8QOioP+yrqNqD4
	mePGHOjH6qyGKoiFg==
X-Gm-Gg: AYBFou31RuhVNGVdBEs/p474m5kvg4ZDqtMhehidMTjQfOkr2ZfelOHjcpF7eUkTqPx
	Y1JX3K1SNfCFMah26wAMmdezx/caw1Vxem7oZfNMfa3nRrYLRy/CPirdHdDj/rlksZQUfm71Eg7
	Ua2AU4SGqvpcmvZy2+Rp5BTauhyCRRDC9pjoBsb26s6Gu1Ijhm795t15RJNKWHHPk/oTcG0S9ST
	mctgyqmtUC4sb0kGDc5/yNMjMQ4ucsCu5ZcrYJKm8yWP3xvUbj8coWZRNwVm+x6/EPawkzBV7iV
	YRavxq/k4ZZnYjDn21mPQzdIsrTrEuNN2mrw1ODgPr3tz6IW1W/xX/IlG8Ps58LeydIXTpHZRZR
	cnx9DjpX2QtHUpJ9RYQdo0j18iz2cVd6+GLGlxgNNNBnIm8nJ2MZ1iU+4JhJyeW3WqkAWV4noHG
	hkicNFt+xJavGQRq8VJ9L/putlelYbtjPN/+J3
X-Received: by 2002:a05:620a:600c:b0:939:f188:6d98 with SMTP id af79cd13be357-93bc62f5d25mr338422285a.10.1789627578230;
        Wed, 16 Sep 2026 23:46:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93b781bfc1asm51006085a.7.2026.09.16.23.46.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:46:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so484541a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627577; x=1790232377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utj+LXach7A0wRbI7r1l5SQcV1AWLnk8cM4PUvzl2h8=;
        b=PWP1hbtEXPjmVdpZcBfEycbTpRYzWsxAqblE9lUwpi7fTS3c3UYZQfCP/3Q0FX7hoo
         2vtMpGQMbY6I9i9ZFAcfn8jg3UHwb5ssxcvum5Y9jzikxG6ZdT35V92XaWr7DE0n5FVn
         byzp8mzx5YDqCyVsoS6kUPqQJjqQrcCblJYj4=
X-Forwarded-Encrypted: i=1; AKwUvBwh30HoyHgQJJLJrLoSiVbfXKgIF9x6gyDo7Zw4aFci6Fw2z8s2haZyBKNHW8EqpWiV6h6mfDXt/KffIxM=@vger.kernel.org
X-Received: by 2002:a05:6a20:2d2c:b0:3db:10ef:b389 with SMTP id adf61e73a8af0-3dd7255a694mr3868814637.6.1789627576887;
        Wed, 16 Sep 2026 23:46:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d2c:b0:3db:10ef:b389 with SMTP id adf61e73a8af0-3dd7255a694mr3868776637.6.1789627576321;
        Wed, 16 Sep 2026 23:46:16 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:46:16 -0700 (PDT)
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
Subject: [net-next, v3 03/11] bnge: add NTUPLE/ARFS VNIC
Date: Thu, 17 Sep 2026 12:15:40 +0530
Message-ID: <20260917064548.773334-4-vikas.gupta@broadcom.com>
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

Initialize the second VNIC, which is specifically used for the
NTUPLE/ARFS feature. This VNIC helps support the aRFS/NTUPLE
functionality. With this change, the total number of VNICs becomes 2.
Add bnge_set_dflt_rfs() to configure the default NTUPLE feature state
at netdev allocation time.

Also, allocate and configure the ARFS VNIC.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     | 11 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |  1 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 66 +++++++++++++++--
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  1 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 73 ++++++++++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |  1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 33 ++++++++-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  7 +-
 8 files changed, 181 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index bde54ba5d50f..fc2f45fa7712 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -63,9 +63,8 @@ enum {
 	BNGE_FW_CAP_THRESHOLD_TEMP_SUPPORTED		= BIT_ULL(21),
 	BNGE_FW_CAP_DFLT_VLAN_TPID_PCP			= BIT_ULL(22),
 	BNGE_FW_CAP_VNIC_TUNNEL_TPA			= BIT_ULL(23),
-	BNGE_FW_CAP_CFA_NTUPLE_RX_EXT_IP_PROTO		= BIT_ULL(24),
-	BNGE_FW_CAP_CFA_RFS_RING_TBL_IDX_V3		= BIT_ULL(25),
-	BNGE_FW_CAP_VNIC_RE_FLUSH			= BIT_ULL(26),
+	BNGE_FW_CAP_CFA_RFS_RING_TBL_IDX_V3		= BIT_ULL(24),
+	BNGE_FW_CAP_VNIC_RE_FLUSH			= BIT_ULL(25),
 };
 
 enum {
@@ -74,6 +73,7 @@ enum {
 	BNGE_EN_STRIP_VLAN				= BIT_ULL(2),
 	BNGE_EN_SHARED_CHNL				= BIT_ULL(3),
 	BNGE_EN_UDP_GSO_SUPP				= BIT_ULL(4),
+	BNGE_EN_ARFS_CAP				= BIT_ULL(5),
 };
 
 #define BNGE_EN_ROCE		(BNGE_EN_ROCE_V1 | BNGE_EN_ROCE_V2)
@@ -218,6 +218,11 @@ static inline bool bnge_is_roce_en(struct bnge_dev *bd)
 	return bd->flags & BNGE_EN_ROCE;
 }
 
+static inline bool bnge_is_arfs_cap(struct bnge_dev *bd)
+{
+	return bd->flags & BNGE_EN_ARFS_CAP;
+}
+
 static inline bool bnge_is_agg_reqd(struct bnge_dev *bd)
 {
 	if (bd->netdev) {
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
index ae03041c36ac..2ae8ec9f33d3 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
@@ -67,4 +67,5 @@ int bnge_hwrm_shutdown_link(struct bnge_dev *bd);
 int bnge_hwrm_port_qstats(struct bnge_dev *bd, u8 flags);
 int bnge_hwrm_port_qstats_ext(struct bnge_dev *bd, u8 flags);
 int bnge_hwrm_func_qstat_ext(struct bnge_dev *bd, struct bnge_stats_mem *stats);
+int bnge_hwrm_cfa_adv_flow_mgnt_qcaps(struct bnge_dev *bd);
 #endif /* _BNGE_HWRM_LIB_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 9e64b1933c02..bab706cb969f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1149,12 +1149,10 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 
 static int bnge_alloc_vnics(struct bnge_net *bn)
 {
-	int num_vnics;
+	int num_vnics = 1;
 
-	/* Allocate only 1 VNIC for now
-	 * Additional VNICs will be added based on RFS/NTUPLE in future patches
-	 */
-	num_vnics = 1;
+	if (bn->priv_flags & BNGE_NET_EN_NTUPLE)
+		num_vnics++;
 
 	bn->vnic_info = kzalloc_objs(struct bnge_vnic_info, num_vnics);
 	if (!bn->vnic_info)
@@ -1320,6 +1318,10 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	bn->vnic_info[BNGE_VNIC_DEFAULT].flags |= BNGE_VNIC_RSS_FLAG |
 						  BNGE_VNIC_MCAST_FLAG |
 						  BNGE_VNIC_UCAST_FLAG;
+	if (bn->priv_flags & BNGE_NET_EN_NTUPLE)
+		bn->vnic_info[BNGE_VNIC_NTUPLE].flags |= BNGE_VNIC_RSS_FLAG |
+							 BNGE_VNIC_NTUPLE_FLAG;
+
 	rc = bnge_alloc_vnic_attributes(bn);
 	if (rc)
 		goto err_free_core;
@@ -2546,6 +2548,12 @@ static int bnge_init_chip(struct bnge_net *bn)
 	if (rc)
 		goto err_out;
 
+	if (bn->priv_flags & BNGE_NET_EN_NTUPLE) {
+		rc = bnge_alloc_rfs_vnic(bn);
+		if (rc)
+			goto err_out;
+	}
+
 	if (bd->rss_cap & BNGE_RSS_CAP_RSS_HASH_TYPE_DELTA)
 		bnge_hwrm_update_rss_hash_cfg(bn);
 
@@ -3019,6 +3027,8 @@ static int bnge_close(struct net_device *dev)
 	bnge_hwrm_if_change(bn->bd, false);
 	bn->sp_event = 0;
 
+	netdev_update_features(dev);
+
 	return 0;
 }
 
@@ -3101,6 +3111,36 @@ static const struct netdev_stat_ops bnge_stat_ops = {
 	.get_base_stats		= bnge_get_base_stats,
 };
 
+static netdev_features_t bnge_fix_features(struct net_device *dev,
+					   netdev_features_t features)
+{
+	/* NTUPLE can only be changed while the interface is down. */
+	if (netif_running(dev)) {
+		if (dev->features & NETIF_F_NTUPLE)
+			features |= NETIF_F_NTUPLE;
+		else
+			features &= ~NETIF_F_NTUPLE;
+	}
+	return features;
+}
+
+static int bnge_set_features(struct net_device *dev, netdev_features_t features)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	u32 flags = bn->priv_flags;
+
+	flags &= ~BNGE_NET_EN_NTUPLE;
+	if (features & NETIF_F_NTUPLE)
+		flags |= BNGE_NET_EN_NTUPLE;
+
+	if (flags == bn->priv_flags)
+		return 0;
+
+	bn->priv_flags = flags;
+
+	return 0;
+}
+
 static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_open		= bnge_open,
 	.ndo_stop		= bnge_close,
@@ -3108,6 +3148,8 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_get_stats64	= bnge_get_stats64,
 	.ndo_set_rx_mode_async	= bnge_set_rx_mode,
 	.ndo_features_check	= bnge_features_check,
+	.ndo_fix_features	= bnge_fix_features,
+	.ndo_set_features	= bnge_set_features,
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
@@ -3233,6 +3275,18 @@ static void bnge_init_ring_params(struct bnge_net *bn)
 	bn->netdev->cfg->hds_thresh = max(BNGE_DEFAULT_RX_COPYBREAK, rx_size);
 }
 
+static void bnge_set_dflt_rfs(struct bnge_net *bn)
+{
+	bn->netdev->hw_features &= ~NETIF_F_NTUPLE;
+	bn->netdev->features &= ~NETIF_F_NTUPLE;
+	bn->priv_flags &= ~BNGE_NET_EN_NTUPLE;
+	if (bnge_is_arfs_cap(bn->bd)) {
+		bn->netdev->hw_features |= NETIF_F_NTUPLE;
+		bn->netdev->features |= NETIF_F_NTUPLE;
+		bn->priv_flags |= BNGE_NET_EN_NTUPLE;
+	}
+}
+
 int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 {
 	struct net_device *netdev;
@@ -3339,6 +3393,8 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	bnge_set_ring_params(bd);
 
 	bnge_init_l2_fltr_tbl(bn);
+	bnge_set_dflt_rfs(bn);
+
 	bnge_init_mac_addr(bd);
 
 	rc = bnge_probe_phy(bn, true);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index ee649cc644db..c47a874df4ba 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -152,6 +152,7 @@ enum {
 	BNGE_NET_EN_GRO		= BIT(0),
 	BNGE_NET_EN_LRO		= BIT(1),
 	BNGE_NET_EN_JUMBO	= BIT(2),
+	BNGE_NET_EN_NTUPLE	= BIT(3),
 };
 
 #define BNGE_NET_EN_TPA		(BNGE_NET_EN_GRO | BNGE_NET_EN_LRO)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 69a894b52485..4c0cde30992c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -178,6 +178,16 @@ static int bnge_adjust_rings(struct bnge_dev *bd, u16 *rx,
 	return bnge_fix_rings_count(rx, tx, max_nq, sh);
 }
 
+static unsigned int bnge_get_max_func_rss_ctxs(struct bnge_dev *bd)
+{
+	return bd->hw_resc.max_rsscos_ctxs;
+}
+
+static unsigned int bnge_get_max_func_vnics(struct bnge_dev *bd)
+{
+	return bd->hw_resc.max_vnics;
+}
+
 int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 {
 	if (!rx_rings)
@@ -190,11 +200,24 @@ int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 static u16 bnge_get_total_rss_ctxs(struct bnge_dev *bd,
 				   struct bnge_hw_rings *hwr)
 {
-	return bnge_cal_nr_rss_ctxs(hwr->grp);
+	u16 rss_ctx = bnge_cal_nr_rss_ctxs(hwr->grp);
+
+	rss_ctx *= hwr->vnic;
+
+	return rss_ctx;
 }
 
 static u16 bnge_get_total_vnics(struct bnge_dev *bd)
 {
+	if (bd->netdev) {
+		struct bnge_net *bn = netdev_priv(bd->netdev);
+
+		if (bn->priv_flags & BNGE_NET_EN_NTUPLE)
+			return 2;
+	} else if (bnge_is_arfs_cap(bd)) {
+		return 2;
+	}
+
 	return 1;
 }
 
@@ -563,6 +586,51 @@ static int bnge_alloc_rss_indir_tbl(struct bnge_dev *bd)
 	return 0;
 }
 
+/* If runtime conditions support RFS */
+bool bnge_arfs_capable(struct bnge_dev *bd, bool new_rss_ctx)
+{
+	struct bnge_hw_rings hwr = {};
+	int max_vnics, max_rss_ctxs;
+
+	hwr.grp = bd->rx_nr_rings;
+	hwr.vnic = bnge_get_total_vnics(bd);
+
+	if (!bnge_is_arfs_cap(bd))
+		hwr.vnic++;
+
+	if (new_rss_ctx)
+		hwr.vnic++;
+	hwr.rss_ctx = bnge_get_total_rss_ctxs(bd, &hwr);
+	max_vnics = bnge_get_max_func_vnics(bd);
+	max_rss_ctxs = bnge_get_max_func_rss_ctxs(bd);
+
+	if (hwr.vnic > max_vnics || hwr.rss_ctx > max_rss_ctxs) {
+		if (bd->rx_nr_rings > 1)
+			dev_warn(bd->dev,
+				 "Not enough resources to support NTUPLE filters\n");
+		return false;
+	}
+
+	/* Do not reduce VNIC and RSS ctx reservations. There is a FW
+	 * issue that will mess up the default VNIC if we reduce the
+	 * reservations.
+	 */
+	if (hwr.vnic <= bd->hw_resc.resv_vnics &&
+	    hwr.rss_ctx <= bd->hw_resc.resv_rsscos_ctxs)
+		return true;
+
+	bnge_hwrm_reserve_rings(bd, &hwr);
+	if (hwr.vnic <= bd->hw_resc.resv_vnics &&
+	    hwr.rss_ctx <= bd->hw_resc.resv_rsscos_ctxs)
+		return true;
+
+	dev_warn(bd->dev, "Unable to reserve resources to support NTUPLE filters\n");
+	hwr.vnic = 1;
+	hwr.rss_ctx = 0;
+	bnge_hwrm_reserve_rings(bd, &hwr);
+	return false;
+}
+
 int bnge_net_init_dflt_config(struct bnge_dev *bd)
 {
 	struct bnge_hw_resc *hw_resc;
@@ -576,6 +644,9 @@ int bnge_net_init_dflt_config(struct bnge_dev *bd)
 	if (rc)
 		goto err_free_tbl;
 
+	if (bnge_arfs_capable(bd, false))
+		bd->flags |= BNGE_EN_ARFS_CAP;
+
 	hw_resc = &bd->hw_resc;
 	bd->max_fltr = hw_resc->max_rx_em_flows + hw_resc->max_rx_wm_flows +
 		       BNGE_L2_FLTR_MAX_FLTR;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index b62a634669f6..1e55fbe6985b 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -75,6 +75,7 @@ void bnge_aux_init_dflt_config(struct bnge_dev *bd);
 u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd);
 int bnge_cal_nr_rss_ctxs(u16 rx_rings);
 bool bnge_aux_has_enough_resources(struct bnge_dev *bd);
+bool bnge_arfs_capable(struct bnge_dev *bd, bool new_rss_ctx);
 
 static inline u32
 bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index 80b4ad77c659..779780ab53d2 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -42,7 +42,11 @@ void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	for (i = 0; i < tbl_size; i++) {
 		u16 ring_id, j;
 
-		j = bd->rss_indir_tbl[i];
+		if (vnic->flags & BNGE_VNIC_NTUPLE_FLAG)
+			j = ethtool_rxfh_indir_default(i, bd->rx_nr_rings);
+		else
+			j = bd->rss_indir_tbl[i];
+
 		rxr = &bn->rx_ring[j];
 
 		ring_id = rxr->rx_ring_struct.fw_ring_id;
@@ -98,3 +102,30 @@ int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	}
 	return rc;
 }
+
+static int bnge_alloc_and_setup_vnic(struct bnge_net *bn,
+				     struct bnge_vnic_info *vnic,
+				     u16 rx_rings)
+{
+	int rc;
+
+	rc = bnge_hwrm_vnic_alloc(bn->bd, vnic, rx_rings);
+	if (rc) {
+		netdev_err(bn->netdev, "hwrm vnic %u alloc failure rc: %d\n",
+			   vnic->vnic_id, rc);
+		return rc;
+	}
+
+	/* If bnge_setup_vnic() fails, the VNIC allocated above is not freed
+	 * here; the caller (bnge_open_core) unwinds via its err_out path,
+	 */
+	return bnge_setup_vnic(bn, vnic);
+}
+
+int bnge_alloc_rfs_vnic(struct bnge_net *bn)
+{
+	struct bnge_vnic_info *vnic;
+
+	vnic = &bn->vnic_info[BNGE_VNIC_NTUPLE];
+	return bnge_alloc_and_setup_vnic(bn, vnic, bn->bd->rx_nr_rings);
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index 30281e26f39f..93c6d736cbeb 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -21,13 +21,15 @@ struct bnge_l2_filter;
 #define BNGE_MAX_UC_ADDRS	4
 
 enum {
-	BNGE_VNIC_DEFAULT	= 0
+	BNGE_VNIC_DEFAULT	= 0,
+	BNGE_VNIC_NTUPLE	= 1
 };
 
 enum {
 	BNGE_VNIC_RSS_FLAG	= BIT(0),
 	BNGE_VNIC_MCAST_FLAG	= BIT(1),
-	BNGE_VNIC_UCAST_FLAG	= BIT(2)
+	BNGE_VNIC_UCAST_FLAG	= BIT(2),
+	BNGE_VNIC_NTUPLE_FLAG	= BIT(3)
 };
 
 struct bnge_vnic_info {
@@ -59,4 +61,5 @@ int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic);
 int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
+int bnge_alloc_rfs_vnic(struct bnge_net *bn);
 #endif /* _BNGE_VNIC_H_ */
-- 
2.52.0

