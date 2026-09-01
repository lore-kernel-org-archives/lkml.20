Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9CF4A2065
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290301; cv=none; b=ahrkY0vrRqfqNBUlh642CToBCTbI0rcAW5iuGph8pqkSgpHHdul1HCZQXxPKzaWAGyJnSSmuU2fIr1H596MF/KoWSjmOOZrxJe53s61p7ybxZxf6wPMGSDXHm+zqsn8b4vHd9z3Sbzg+CJ9RCLD63eNCMZ9Lc5jB2L2U3vcNUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290301; c=relaxed/simple;
	bh=oFPz7pp/mMILcTgKcPtfBr0KKYhYwd5s3DTyKq5yXs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpfOM2ZP0gQx4Euc2+oIlESY9aYWhsSGjsHe9MDuR1rvH3dDiUQ9v+O5p7jCx2EDnEWGDf+q3SHqdWRn3ISGGjrRy9qgLTYDdg8xdWAmYqntzJ9l3oOptQBKqGUFC2AYvL/JqqC9xC3CRCedLRC+i6WMihrDxKEmAImCRj2/+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=au4ctlrj; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="au4ctlrj"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso242206a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290298; x=1788895098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGqPXgPgllirzMXMpaUakGPcJZSVGhd46PFeQ76evwg=;
        b=q+rZwJGMummHdY9tcg8UAtzB9cYw4LqDzJhscpM3chjnR+wPM7Iy1338Pr/xiyuo4O
         mBUAc8YP0JAQygJ/C5BFDLEdkB+qstyO++vVRcd5Xfc3vUYcQpCeG5rl1LuJ2NP+veyk
         HAXRrCNYAybWnjrIfdAsWR3hrE1a5LzvS1pRQoHrqhFMyc3cVFqpC3xEK6S7t1DB6GHK
         wM9pMi7u2TBVEKxnhPuLzNb+ZoCPUF1CP/g5pRZPTDM8ZzGPrUAsXYBIUPZWw6bv1RKK
         aCJ5CvFuWGaEE/iSvF/uwLt68YKhqDA7xQpXyTZthjbQAGvoEsA28ZGEgGpVl2uhU9AM
         y+9w==
X-Forwarded-Encrypted: i=1; AKwUvBzKGjRHBrNf6O+xuy823fpVwYgYBWLjXymJ7vno7/X41w0XfHis+6JhaPxdjYbf2fhaFKgCLFMVKwWE/JI=@vger.kernel.org
X-Gm-Message-State: AFuF++kWEdBHPTwi6dofpr0pd707V8l2B1Y69ABNh06N8XbohmE1Pohi
	QG8qDXs9S0+AnVCuFH2ySUv/uWA2pDyvbphROdixCLVkRWqyI/6uoKyLlbFQwICfalRsLyEXkAd
	C5yjefpEAeYN7i1KUb96pCflxe7du6p23T2jFN4bhEffQSKYPqoxIRoB8Fy2ksfxajiQVYh0A00
	69sc95UZMV9P3iziMo+G+uBAAcZUHOro3eH4CkCbFag3VQ2kGzBM7smX/RppWRcT0wQOJvCMqvh
	xwDeR2A2crvBKGU41fo6R89dQ==
X-Gm-Gg: AYBFou36jLKY7KhsTRCZ4hoEZnBOFR1BWBwJHE2eIG06z/k13R+5nbgLZ7/xVVtxz/X
	NE58vKr7sZ8XSUVHpc4dOMTV8SQxxdJFYPqyH5IjQt+266DDLZbOrM4CoG6zZy26iQfZZ6E4dFv
	w55dnSHVubXGUtVtpOMlqRZwxV2Fp2HqXREZjfG8sl3a2BLNoGzdo4RFpO7qLmUQmn6OG6Dz8ro
	CA1qnd+zrsu0/PRz17dgJmsWUsjdylScMmpr7os6Czrva2lwkcJpgb1+fjN7o/IPQYQb4vjdtys
	qsnYg9PzxN3t0duB0oc5ORxhJBnpWDNERc27CelkuymxXoh67ndqUz8GCjuL4WvjxOMZyAhGEtd
	v4dLscrYPexytTmS7iKUKpvcnIkJimogDrlhIsZLEmWY+DZvJEnHSZ9EPzCbe97aZMK7/8T+Cfr
	BhmvjTW6HutvvDRgy6ePESIMf4QkRuEXVNwDfwuvLTFQ==
X-Received: by 2002:a17:90b:3c82:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39ae824fb5fmr469698a91.1.1788290298261;
        Tue, 01 Sep 2026 12:18:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39ae0f40e5asm215584a91.3.2026.09.01.12.18.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:18:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so2415665ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788290296; x=1788895096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGqPXgPgllirzMXMpaUakGPcJZSVGhd46PFeQ76evwg=;
        b=au4ctlrjYdSkorJD0eu0RYZFRvCqt5b4dgrxFAra4bLBEEHmcs+VIGOieAcg35NuQx
         odSCoHsrJJohycNPa5uGEajuPA5/TdkO/DgjDZhVY8qNWv+yCzoB8AvtjDEaoTN/2dZc
         Q5ZgamViCUhzYv2eUKifPoMWElrUIXiG6WgNg=
X-Forwarded-Encrypted: i=1; AKwUvByocB/L9IlZ4soEyQ3kpugh8nTz5SGKMjf1UwTbmXIS2K+K+YQOU5PnAFSnMlhgmqjFklNl5Z56072EbqQ=@vger.kernel.org
X-Received: by 2002:a17:903:22ca:b0:2d9:51db:7eaa with SMTP id d9443c01a7336-2dae5efaa55mr7201665ad.20.1788290296179;
        Tue, 01 Sep 2026 12:18:16 -0700 (PDT)
X-Received: by 2002:a17:903:22ca:b0:2d9:51db:7eaa with SMTP id d9443c01a7336-2dae5efaa55mr7200775ad.20.1788290295674;
        Tue, 01 Sep 2026 12:18:15 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm186440eec.18.2026.09.01.12.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:18:15 -0700 (PDT)
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
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Akhilesh Samineni <akhilesh.samineni@broadcom.com>
Subject: [PATCH net-next 2/7] bnge: Extract per-NQ ring allocation and init helpers
Date: Wed,  2 Sep 2026 00:47:23 +0530
Message-ID: <20260901191728.643212-3-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
References: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Factor the per-NQ loop body in bnge_hwrm_ring_alloc() and
bnge_init_ring_struct() into standalone bnge_hwrm_nq_ring_alloc() and
bnge_init_nq_ring_struct() helpers.

This is a pure refactor with no functional changes, preparing NQ0 setup
to run independently during probe rather than through the open path loop.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Akhilesh Samineni <akhilesh.samineni@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 56 +++++++++++--------
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    | 25 ++++++---
 .../net/ethernet/broadcom/bnge/bnge_rmem.h    |  4 +-
 3 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index dbadbf76a3a9..6c1cb3aab5a8 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1909,6 +1909,37 @@ static int bnge_hwrm_rx_ring_alloc(struct bnge_net *bn,
 	return 0;
 }
 
+static int bnge_hwrm_nq_ring_alloc(struct bnge_net *bn, int index)
+{
+	struct bnge_napi *bnapi = bn->bnapi[index];
+	struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
+	struct bnge_ring_struct *ring = &nqr->ring_struct;
+	u32 type = HWRM_RING_ALLOC_NQ;
+	struct bnge_dev *bd = bn->bd;
+	u32 map_idx = ring->map_idx;
+	unsigned int vector;
+	int rc;
+
+	vector = bd->irq_tbl[map_idx].vector;
+	disable_irq_nosync(vector);
+	rc = hwrm_ring_alloc_send_msg(bn, ring, type, map_idx);
+	if (rc) {
+		enable_irq(vector);
+		return rc;
+	}
+	bnge_set_db(bn, &nqr->nq_db, type, map_idx, ring->fw_ring_id);
+	bnge_db_nq(bn, &nqr->nq_db, nqr->nq_raw_cons);
+	enable_irq(vector);
+	bn->grp_info[index].nq_fw_ring_id = (u16)ring->fw_ring_id;
+	if (!index) {
+		rc = bnge_hwrm_set_async_event_cr(bd, ring->fw_ring_id);
+		if (rc)
+			netdev_warn(bn->netdev, "Failed to set async event completion ring.\n");
+	}
+
+	return 0;
+}
+
 static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
@@ -1917,30 +1948,9 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 
 	agg_rings = !!(bnge_is_agg_reqd(bd));
 	for (i = 0; i < bd->nq_nr_rings; i++) {
-		struct bnge_napi *bnapi = bn->bnapi[i];
-		struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
-		struct bnge_ring_struct *ring = &nqr->ring_struct;
-		u32 type = HWRM_RING_ALLOC_NQ;
-		u32 map_idx = ring->map_idx;
-		unsigned int vector;
-
-		vector = bd->irq_tbl[map_idx].vector;
-		disable_irq_nosync(vector);
-		rc = hwrm_ring_alloc_send_msg(bn, ring, type, map_idx);
-		if (rc) {
-			enable_irq(vector);
+		rc = bnge_hwrm_nq_ring_alloc(bn, i);
+		if (rc)
 			goto err_out;
-		}
-		bnge_set_db(bn, &nqr->nq_db, type, map_idx, ring->fw_ring_id);
-		bnge_db_nq(bn, &nqr->nq_db, nqr->nq_raw_cons);
-		enable_irq(vector);
-		bn->grp_info[i].nq_fw_ring_id = (u16)ring->fw_ring_id;
-
-		if (!i) {
-			rc = bnge_hwrm_set_async_event_cr(bd, ring->fw_ring_id);
-			if (rc)
-				netdev_warn(bn->netdev, "Failed to set async event completion ring.\n");
-		}
 	}
 
 	for (i = 0; i < bd->tx_nr_rings; i++) {
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
index b066ee887a09..e0ddb2800c54 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
@@ -423,6 +423,21 @@ int bnge_alloc_ctx_mem(struct bnge_dev *bd)
 	return 0;
 }
 
+void bnge_init_nq_ring_struct(struct bnge_net *bn,
+			      struct bnge_nq_ring_info *nqr)
+{
+	struct bnge_ring_mem_info *rmem;
+	struct bnge_ring_struct *ring;
+
+	ring = &nqr->ring_struct;
+	rmem = &ring->ring_mem;
+	rmem->nr_pages = bn->cp_nr_pages;
+	rmem->page_size = HW_CMPD_RING_SIZE;
+	rmem->pg_arr = (void **)nqr->desc_ring;
+	rmem->dma_arr = nqr->desc_mapping;
+	rmem->vmem_size = 0;
+}
+
 void bnge_init_ring_struct(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
@@ -431,19 +446,11 @@ void bnge_init_ring_struct(struct bnge_net *bn)
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_ring_mem_info *rmem;
-		struct bnge_nq_ring_info *nqr;
 		struct bnge_rx_ring_info *rxr;
 		struct bnge_tx_ring_info *txr;
 		struct bnge_ring_struct *ring;
 
-		nqr = &bnapi->nq_ring;
-		ring = &nqr->ring_struct;
-		rmem = &ring->ring_mem;
-		rmem->nr_pages = bn->cp_nr_pages;
-		rmem->page_size = HW_CMPD_RING_SIZE;
-		rmem->pg_arr = (void **)nqr->desc_ring;
-		rmem->dma_arr = nqr->desc_mapping;
-		rmem->vmem_size = 0;
+		bnge_init_nq_ring_struct(bn, &bnapi->nq_ring);
 
 		rxr = bnapi->rx_ring;
 		if (!rxr)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h
index bb0c79a1ee60..a5a1d346ac93 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h
@@ -7,6 +7,7 @@
 struct bnge_ctx_mem_type;
 struct bnge_dev;
 struct bnge_net;
+struct bnge_nq_ring_info;
 
 #define PTU_PTE_VALID             0x1UL
 #define PTU_PTE_LAST              0x2UL
@@ -198,5 +199,6 @@ void bnge_free_ring(struct bnge_dev *bd, struct bnge_ring_mem_info *rmem);
 int bnge_alloc_ctx_mem(struct bnge_dev *bd);
 void bnge_free_ctx_mem(struct bnge_dev *bd);
 void bnge_init_ring_struct(struct bnge_net *bn);
-
+void bnge_init_nq_ring_struct(struct bnge_net *bn,
+			      struct bnge_nq_ring_info *nqr);
 #endif /* _BNGE_RMEM_H_ */
-- 
2.47.3

