Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BBA38423B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055063; cv=none; b=rV75q9/5vVo8VJghX1a+l2txHzMSnt0uPUCOEqnvcrbFY7mBv8xDaZqfr84giOHAZOjQHwhrPSNyF3djMkUUYTfuyyOQnnS1B+36dvPFhEAxIbTvemD9HBBmcS1k8yZRdnPkGwWBcvg/4/LROVM2A8Z33ddzJHsJRwiiJNxFYKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055063; c=relaxed/simple;
	bh=R9W+C7rd8vsQ9s4brAJxxgTCT73+HardaBeiuIRGQm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeUm8IqC5N8y38bOeLqmbQb5HCUQg+tvi1mDZYoY/IVjLEdZjanD/x6vP9P2IEIWh3O4VLsEIlURyTIbxGBeA9TnvE9C+nUyL6Wj4THjWq7WwTn0C5xpKbGsT6tezvK7W7TanKqAWZNkVs+T7LLp4TfeqUyALQo0mwQYDf3dli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UtEikXG5; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UtEikXG5"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2dcff8f44f2so26769005ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055055; x=1790659855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VxH32e4VrZZVOWi9fyj9drLBeVlGptObkrNS0hqXwg=;
        b=MRwFk6TlqSjPSNCGhcLwa9eVQGVF7UymC6GOX9LMoWN6fQu3/c5oUrcqmNieB2h76f
         jabM3TqB0KN3jG3v6A/7Zugl2ikNtmiaO2EpZo7a1zhf83t1XFr9na9fzzUepSzJ5LDl
         dJ+b3Xkjgtqu1KJTjaMtu6657r6YlClfms2narSE0XewoSZJK4TD8yezBurXuKU6rzth
         0HOJVauxml7q2bnMk1cr3/t+bKJF0ZSsq/K33A4x0UNRPZqNtB3sChuA3I0z7gNmm9oe
         AR0o85qGxZfEqlzGk3ey+2ohbKrdCKjkg+/F+od7PTOhv9LEDbHcKFY+PdIi0YJDxfbO
         3BAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJTaNGaIYwThRww8qiBs5zxg+ibAJFm9ZNUex5relzlqPLwp9alJrvvCuhowYaCnp97jDIHvAx/RViKto=@vger.kernel.org
X-Gm-Message-State: AFuF++kebLGrwRw3nxwwOYRNtbdyo+cMmRSZxm3AGQyqi3o6YFuus7X6
	StQG+esfQbs6RZdYYTIGH+8z5UAm7gGOo3wuzJ4ii6OLZ+h6tvenTPpJ0C45+9VCkD/7e/XXaSO
	+GCwvnnj1FX1+ldhBaV6HcQCgJLDFvc4JcLYWDtXZeo3e8GU0zEO7HTXNKRf+kC6YVNXnANSMtH
	0p4i8iHX2Y2d8nsvW4v2keDzf6VwMtQoJ0ZlyYwQLwkhr2vPs57BvdCQuHedX12Eywy7/5YUg4h
	OG7RnIt5HbvC7YPfqERVr7ooA==
X-Gm-Gg: AYBFou17RTPxBohuS/d1nDgQSSrgly70YgNb7XIeb9vQp7Re2DRPl0mnhkFkD+2M1vZ
	Xz2v9D4bJtNivWnVHWHM4E3IGev+WAyKdwDRuWYAg7VjJ0aBwBr8Djpy0LzbzGyv5duv0Jd1M9x
	eoLgrGogd5dtfiyxssV9CW1QjO0YnmSJXHwT6C3q7YVMYa/4GajbQQweA5w7mvzKoW2brLmu0L+
	YsDlQQ+9uVEx+qkomHmfCh88nxtjTf2tIVWVYfLPp68vP3sfcf+630hxO6+nNgZy31wOeHKdwfS
	GgYNpE03C1fwcVCggbJhR02lC0SVSTJfaZsdQl752qb4dmVDs4gqq5mVV4agxP4uuKpt6sSc9y7
	ansQzHIhWMZRJ2NocMDcivhRszt54iiGJKPKSW0SI/1LesNNTM/Jkbz/d0MJHUbZikZXYKloOm8
	YuTL8Hc8KBHs04LlStJrXnE23TwiidXpXbuNAxLjLkow==
X-Received: by 2002:a17:903:2985:b0:2dd:c100:313f with SMTP id d9443c01a7336-2df60b93185mr402565ad.59.1790055055161;
        Mon, 21 Sep 2026 22:30:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2df5d02be81sm533815ad.26.2026.09.21.22.30.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:30:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so12158483a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790055053; x=1790659853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VxH32e4VrZZVOWi9fyj9drLBeVlGptObkrNS0hqXwg=;
        b=UtEikXG5ek0YYc9/cxEWV9lbhNexgc2m7kF/eNGCRXmwuG6RtjTG657xU5WTKJu/jl
         x03BdQ0yFTdbn+xcbOnK8yeg//qVgjllzTh7ow2jqZbz2L6zuEMsank4bdAvzjiznfV9
         WkgywtqGTlNSQAV1uV3sVOuqyQu073THdIDkM=
X-Forwarded-Encrypted: i=1; AKwUvBz86q7uY6SxncGI4aBQ4v6xVfHMgWjjFcvd/BIBMu6mRZ+r2krcK0loGYphWdGpgWthGVjZearkxVHryrw=@vger.kernel.org
X-Received: by 2002:a17:90b:4fd0:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a07322128bmr45364a91.46.1790055053169;
        Mon, 21 Sep 2026 22:30:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a07322128bmr45337a91.46.1790055052677;
        Mon, 21 Sep 2026 22:30:52 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm2029025c88.3.2026.09.21.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:30:52 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Kiran Kella <kiran.kella@broadcom.com>
Subject: [PATCH net-next v2 3/6] bnge: Move bnapi and ring_grp allocation to probe/remove
Date: Tue, 22 Sep 2026 10:59:01 +0530
Message-ID: <20260922052904.59237-4-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922052904.59237-1-bhargava.marreddy@broadcom.com>
References: <20260922052904.59237-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Allocate bn->bnapi and bn->grp_info during probe and free them during
remove instead of reallocating on every open/close.

To support this shift:
- Pass an irq_re_init flag to bnge_init_ring_grps() so open can reset
  per-group state without reallocating bn->grp_info.
- Have bnge_free_core() clear rx_ring/tx_ring back-pointers via the new
  bnge_clear_bnapi_queues() rather than freeing bn->bnapi.
- Replace "!bn->bnapi" checks in bnge_get_queue_stats_rx() and
  bnge_get_ethtool_stats() with !netif_running(dev) checks to avoid
  reading sw_stats memory freed on close.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Kiran Kella <kiran.kella@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |   2 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 107 ++++++++++++------
 2 files changed, 71 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 2467e44de291..ad9956bc4408 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -346,7 +346,7 @@ static void bnge_get_ethtool_stats(struct net_device *dev,
 	u32 tpa_stats;
 	u32 i, j = 0;
 
-	if (!bn->bnapi) {
+	if (!netif_running(dev)) {
 		j += bnge_get_num_ring_stats(bd);
 		goto skip_ring_stats;
 	}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index dfd68b830ded..367109dad496 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1185,14 +1185,18 @@ static void bnge_free_ring_grps(struct bnge_net *bn)
 	bn->grp_info = NULL;
 }
 
-static int bnge_init_ring_grps(struct bnge_net *bn)
+static int bnge_init_ring_grps(struct bnge_net *bn, bool irq_re_init)
 {
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	bn->grp_info = kzalloc_objs(struct bnge_ring_grp_info, bd->nq_nr_rings);
-	if (!bn->grp_info)
-		return -ENOMEM;
+	if (irq_re_init) {
+		bn->grp_info = kzalloc_objs(struct bnge_ring_grp_info,
+					    bd->nq_nr_rings);
+		if (!bn->grp_info)
+			return -ENOMEM;
+	}
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		bn->grp_info[i].fw_stats_ctx = INVALID_HW_RING_ID;
 		bn->grp_info[i].fw_grp_id = INVALID_HW_RING_ID;
@@ -1210,25 +1214,6 @@ static void bnge_free_bnapi_mem(struct bnge_net *bn)
 	bn->bnapi = NULL;
 }
 
-static void bnge_free_core(struct bnge_net *bn)
-{
-	bnge_free_vnic_attributes(bn);
-	bnge_free_tx_rings(bn);
-	bnge_free_rx_rings(bn);
-	bnge_free_nq_tree(bn);
-	bnge_free_nq_arrays(bn);
-	bnge_free_ring_stats(bn);
-	bnge_free_ring_grps(bn);
-	bnge_free_vnics(bn);
-	kfree(bn->tx_ring_map);
-	bn->tx_ring_map = NULL;
-	kfree(bn->tx_ring);
-	bn->tx_ring = NULL;
-	kfree(bn->rx_ring);
-	bn->rx_ring = NULL;
-	bnge_free_bnapi_mem(bn);
-}
-
 static int bnge_alloc_bnapi_mem(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
@@ -1257,16 +1242,52 @@ static int bnge_alloc_bnapi_mem(struct bnge_net *bn)
 	return 0;
 }
 
-static int bnge_alloc_core(struct bnge_net *bn)
+static void bnge_clear_bnapi_queues(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
-	int i, j, rc;
+	int i;
 
-	rc = bnge_alloc_bnapi_mem(bn);
-	if (rc)
-		return rc;
+	if (!bn->bnapi)
+		return;
+
+	for (i = 0; i < bd->nq_nr_rings; i++) {
+		struct bnge_napi *bnapi = bn->bnapi[i];
+		int j;
+
+		if (!bnapi)
+			continue;
+
+		bnapi->rx_ring = NULL;
+		for (j = 0; j < BNGE_MAX_TXR_PER_NAPI; j++)
+			bnapi->tx_ring[j] = NULL;
+	}
+}
+
+static void bnge_free_core(struct bnge_net *bn)
+{
+	bnge_free_vnic_attributes(bn);
+	bnge_free_tx_rings(bn);
+	bnge_free_rx_rings(bn);
+	bnge_free_nq_tree(bn);
+	bnge_free_nq_arrays(bn);
+	bnge_free_ring_stats(bn);
+	bnge_free_vnics(bn);
+
+	kfree(bn->tx_ring_map);
+	bn->tx_ring_map = NULL;
+	kfree(bn->tx_ring);
+	bn->tx_ring = NULL;
+	kfree(bn->rx_ring);
+	bn->rx_ring = NULL;
+
+	bnge_clear_bnapi_queues(bn);
+}
+
+static int bnge_alloc_core(struct bnge_net *bn)
+{
+	struct bnge_dev *bd = bn->bd;
+	int i, j, rc = -ENOMEM;
 
-	rc = -ENOMEM;
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
 	if (!bn->rx_ring)
 		goto err_free_core;
@@ -1402,6 +1423,7 @@ static void bnge_init_nq_tree(struct bnge_net *bn)
 		struct bnge_nq_ring_info *nqr = &bn->bnapi[i]->nq_ring;
 		struct bnge_ring_struct *ring = &nqr->ring_struct;
 
+		nqr->nq_raw_cons = 0;
 		ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
 		for (j = 0; j < nqr->cp_ring_count; j++) {
 			struct bnge_cp_ring_info *cpr = &nqr->cp_ring_arr[j];
@@ -2847,19 +2869,15 @@ static int bnge_init_nic(struct bnge_net *bn)
 
 	bnge_init_tx_rings(bn);
 
-	rc = bnge_init_ring_grps(bn);
-	if (rc)
-		goto err_free_rx_ring_pair_bufs;
+	bnge_init_ring_grps(bn, false);
 
 	bnge_init_vnics(bn);
 
 	rc = bnge_init_chip(bn);
 	if (rc)
-		goto err_free_ring_grps;
+		goto err_free_rx_ring_pair_bufs;
 	return rc;
 
-err_free_ring_grps:
-	bnge_free_ring_grps(bn);
 err_free_rx_ring_pair_bufs:
 	bnge_free_rx_ring_pair_bufs(bn);
 	return rc;
@@ -3235,7 +3253,7 @@ static void bnge_get_queue_stats_rx(struct net_device *dev, int i,
 	struct bnge_nq_ring_info *nqr;
 	u64 *sw;
 
-	if (!bn->bnapi)
+	if (!netif_running(dev))
 		return;
 
 	nqr = &bn->bnapi[i]->nq_ring;
@@ -3557,14 +3575,27 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	spin_lock_init(&bn->stats_lock);
 
 	netdev->request_ops_lock = true;
+
+	rc = bnge_alloc_bnapi_mem(bn);
+	if (rc)
+		goto err_free_port_stats;
+
+	rc = bnge_init_ring_grps(bn, true);
+	if (rc)
+		goto err_free_bnapi_mem;
+
 	rc = register_netdev(netdev);
 	if (rc) {
 		dev_err(bd->dev, "Register netdev failed rc: %d\n", rc);
-		goto err_free_port_stats;
+		goto err_free_ring_grps;
 	}
 
 	return 0;
 
+err_free_ring_grps:
+	bnge_free_ring_grps(bn);
+err_free_bnapi_mem:
+	bnge_free_bnapi_mem(bn);
 err_free_port_stats:
 	bnge_free_port_stats(bn);
 err_free_workq:
@@ -3589,6 +3620,8 @@ void bnge_netdev_free(struct bnge_dev *bd)
 	destroy_workqueue(bn->bnge_pf_wq);
 
 	bnge_free_port_stats(bn);
+	bnge_free_ring_grps(bn);
+	bnge_free_bnapi_mem(bn);
 
 	free_netdev(netdev);
 	bd->netdev = NULL;
-- 
2.47.3

