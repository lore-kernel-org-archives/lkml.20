Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF64A2A51
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290317; cv=none; b=NJdUhlL+B9wZtBDNGtmAc7zkpByCb4NhKvprMWDhBwHlDq1SiwltkStNohn9wU4Ku2/cm3ZCJBySDEFl9j7qxFTO60zrsdwVJzLG7XZb4N0YSpJRRMULZnPgXApiJ/tQuBzPiaUbshqFqh3/IFoSnVSmqDwDlDm6Ny89abzfCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290317; c=relaxed/simple;
	bh=vtAHAKj1PeAwfUJZCfBl4/eYH2oejA8SvnXfwzx3s3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VM2NDWFJ0upNv6qeccUrkrB6zuIQ6W6/LjtV4tDcUgmrLVEuWx02JYC9px945MFcwHQWIq8rYfKwuolkd7hQXsU3xqzIIPxyueZRp5mvNT2t1CDXDpda57Z02JKYqF+0fkhNOsmsxc5F4JuY32DeczTqRXymRAZbOyYVuMrSsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IklVYuTt; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IklVYuTt"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so238246a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290314; x=1788895114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOaI+y6MhHla4FLXrbxJ4X/BF94hpA5tmvdB9YE3jGk=;
        b=okxlW23rKmwp2CldKhQ+Rcg8HkHgyaVjIKzPXmYC4PDqlUWMvacK21pgx8S/1wmkrH
         2qQ5QjXseJsz/YWzC56Bn8zJny/RsRrrc15eH9aLNMVfHi2uOkkpnIB1emiSNw5boi3O
         ZRB0kXkdejyq48vfWRdogzcSaE93vBXgm0GT66pKgLZ6Ts1+KdAcI/A7aU4fAQ2cdSQx
         uGZ1LnyrqgXbG/ELlz5Eay/5K+bTKGBSEboE7M4uhIPQ60x1Zf/RWwkIyApJWNX13A+g
         7MyEP6ZcB6VA/I6UOCXZnkdp8nXpXs1Y4zA4WcXL/yJivlDTMEFAG7ax60crZmb/GbtA
         R8vw==
X-Forwarded-Encrypted: i=1; AKwUvByrH7wkPuFRuueSlsMRxalpt5jfxsKvMHlbvXlqj1ag9kOO+NV5bq/gsbuMhRBBOKzgMeLx1sd/Ea3Cng4=@vger.kernel.org
X-Gm-Message-State: AFuF++lsXZR6VRT8gcy/ehsG9loY+PYs9uuvfF0A+wn49q7/Pe8Cejhd
	terVcyv7ptWpgUrLTUGDQTtwftjQ6B6Sjs5olDMNTt47N7e51e/p43LmgDvtAhJrHTVZF6/ie20
	q+Me4oyaQ+35CsVkPpcZfatZ8OEETCrBqwILqN+Kjt7MjO79pGt0pXpJUT3GlX12iBQKPIwhHbx
	X9MrUPB5bUp+f91GKweMNfXbkawqqX8nBFJ/mbBh5e3yWD9jIQTgiPRiBGsBkHrcFf1Msb9GNc/
	02VUb6pyp6cAAj5+/5rtpWa0A==
X-Gm-Gg: AYBFou2D1Jsdm01eqC9AkulxlJfkkiIX4aWrsZxxGoeVnEFQSiohIcf61c/klehtXf7
	h7Foc5HYspnpxJ+lJZWJEcg/gls+ZYygyeLcHfSvVScJxRUIBq29EDb48tK/TU6pymwgrJecTW2
	p8NoPWoGTzHb3MpMpN1deFVaYSR+to0dPuBNBjHOUzRcDf/wvURFothkXqxB1o9nNwg6vHZcnbk
	DDKEX3bPU5xMK6gasvEe2ZJXdt0wnnTFv7w7v7Xw6eSRtxmf6hpjiBJp5Zdxr7h912XP45pKQyR
	yJlMmUo9J8OgXxVNE2n21ftxuozH4qZ8oeBZ4F89f5cYKN/JTbhISmhcxwEbI5fVxeiGvjCCi70
	uKxIcJba5r1dDQMX8yXylk1I2H5nJloxHYcWWRKSLtUUxZNworjHY6+2Knj0EHiF4JYyCd1qjBS
	NN5hVe+NbS1klKGsxPssgFTirAcK2ik0Fb7w3hYweT1g==
X-Received: by 2002:a17:90b:4b82:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39907d1cad8mr15637591a91.11.1788290313716;
        Tue, 01 Sep 2026 12:18:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39ae05fb03fsm217318a91.0.2026.09.01.12.18.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:18:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so338281a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788290312; x=1788895112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOaI+y6MhHla4FLXrbxJ4X/BF94hpA5tmvdB9YE3jGk=;
        b=IklVYuTtTVGCU64ZPj8obgyQpdItEyYTNuLKFuCff6Xt7dbGmn5qRp0fGVMasNAqh1
         WSH0KqrKoOuTM7QrDpxCp2htqS2x09YzBnbhsBL+rLEdy5XKR3TPKT1ReCeqnU4MKAGT
         cQJSWMGSWvSJAYLwdFIgNOFvSGJVjEeVShya4=
X-Forwarded-Encrypted: i=1; AKwUvBzIEPrEYywCTwGv2a/CIvhqphUaAaw3hGASack3nbArFeTBCubz/j/w4A7TeYeNVckoXy0p62Jryrbe6HU=@vger.kernel.org
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr15354899a91.13.1788290311971;
        Tue, 01 Sep 2026 12:18:31 -0700 (PDT)
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr15354829a91.13.1788290311499;
        Tue, 01 Sep 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm186440eec.18.2026.09.01.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:18:30 -0700 (PDT)
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
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [PATCH net-next 5/7] bnge: Quiesce NQ0 around ring teardown in bnge_free_core()
Date: Wed,  2 Sep 2026 00:47:26 +0530
Message-ID: <20260901191728.643212-6-bhargava.marreddy@broadcom.com>
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

Add bnge_quiesce_nq0() and bnge_resume_nq0() helpers to temporarily disable
and re-enable NQ0 NAPI. Use these helpers to bracket ring teardown in
bnge_free_core() and ring rebuild in bnge_alloc_core().

Both helpers currently no-op, since no bnge_napi has BNGE_NAPI_FLAG_NQ0 set
yet. The next patch creates NQ0 during probe and sets this flag, at which
point these helpers become load-bearing: because NQ0 will remain active
while administratively down, its NAPI is not disabled by the standard close
paths, so temporarily quiescing it during core resource free/rebuild windows
is required to prevent stray completions from accessing uninitialized or
freed memory.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 70 ++++++++++++++-----
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  | 10 +++
 2 files changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index dc3d51f31e5e..10d54568f2c5 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -442,6 +442,25 @@ static void bnge_sp_task(struct work_struct *work)
 	netdev_unlock(bn->netdev);
 }
 
+static void bnge_db_nq_arm(struct bnge_net *bn,
+			   struct bnge_db_info *db, u32 idx)
+{
+	bnge_writeq(bn->bd, db->db_key64 | DBR_TYPE_NQ_ARM |
+		    DB_RING_IDX(db, idx), db->doorbell);
+}
+
+static void bnge_db_nq(struct bnge_net *bn, struct bnge_db_info *db, u32 idx)
+{
+	bnge_writeq(bn->bd, db->db_key64 | DBR_TYPE_NQ_MASK |
+		    DB_RING_IDX(db, idx), db->doorbell);
+}
+
+static void bnge_db_cq(struct bnge_net *bn, struct bnge_db_info *db, u32 idx)
+{
+	bnge_writeq(bn->bd, db->db_key64 | DBR_TYPE_CQ_ARMALL |
+		    DB_RING_IDX(db, idx), db->doorbell);
+}
+
 static void bnge_free_nq_desc_arr(struct bnge_nq_ring_info *nqr)
 {
 	struct bnge_ring_struct *ring = &nqr->ring_struct;
@@ -563,6 +582,34 @@ static void bnge_free_nq_tree(struct bnge_net *bn)
 	}
 }
 
+static void bnge_quiesce_nq0(struct bnge_net *bn)
+{
+	struct bnge_napi *bnapi = bn->bnapi[BNGE_NQ0_NAPI_IDX];
+	struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
+	struct bnge_ring_struct *ring;
+	struct bnge_dev *bd = bn->bd;
+
+	if (!BNGE_NQ0_NAPI(bnapi))
+		return;
+
+	ring = &nqr->ring_struct;
+	bnge_db_nq(bn, &nqr->nq_db, nqr->nq_raw_cons);
+	synchronize_irq(bd->irq_tbl[ring->map_idx].vector);
+	napi_disable_locked(&bnapi->napi);
+}
+
+static void bnge_resume_nq0(struct bnge_net *bn)
+{
+	struct bnge_napi *bnapi = bn->bnapi[BNGE_NQ0_NAPI_IDX];
+	struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
+
+	if (!BNGE_NQ0_NAPI(bnapi))
+		return;
+
+	napi_enable_locked(&bnapi->napi);
+	bnge_db_nq_arm(bn, &nqr->nq_db, nqr->nq_raw_cons);
+}
+
 static int alloc_one_cp_ring(struct bnge_net *bn,
 			     struct bnge_cp_ring_info *cpr)
 {
@@ -1253,6 +1300,7 @@ static void bnge_clear_bnapi_queues(struct bnge_net *bn)
 static void bnge_free_core(struct bnge_net *bn)
 {
 	bnge_free_vnic_attributes(bn);
+	bnge_quiesce_nq0(bn);
 	bnge_free_tx_rings(bn);
 	bnge_free_rx_rings(bn);
 	bnge_free_nq_tree(bn);
@@ -1268,6 +1316,7 @@ static void bnge_free_core(struct bnge_net *bn)
 	bn->rx_ring = NULL;
 
 	bnge_clear_bnapi_queues(bn);
+	bnge_resume_nq0(bn);
 }
 
 static int bnge_alloc_core(struct bnge_net *bn)
@@ -1345,7 +1394,9 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	if (rc)
 		goto err_free_core;
 
+	bnge_quiesce_nq0(bn);
 	rc = bnge_alloc_nq_tree(bn);
+	bnge_resume_nq0(bn);
 	if (rc)
 		goto err_free_core;
 
@@ -1372,25 +1423,6 @@ u32 bnge_cp_ring_for_tx(struct bnge_tx_ring_info *txr)
 	return txr->tx_cpr->ring_struct.fw_ring_id;
 }
 
-static void bnge_db_nq_arm(struct bnge_net *bn,
-			   struct bnge_db_info *db, u32 idx)
-{
-	bnge_writeq(bn->bd, db->db_key64 | DBR_TYPE_NQ_ARM |
-		    DB_RING_IDX(db, idx), db->doorbell);
-}
-
-static void bnge_db_nq(struct bnge_net *bn, struct bnge_db_info *db, u32 idx)
-{
-	bnge_writeq(bn->bd, db->db_key64 | DBR_TYPE_NQ_MASK |
-		    DB_RING_IDX(db, idx), db->doorbell);
-}
-
-static void bnge_db_cq(struct bnge_net *bn, struct bnge_db_info *db, u32 idx)
-{
-	bnge_writeq(bn->bd, db->db_key64 | DBR_TYPE_CQ_ARMALL |
-		    DB_RING_IDX(db, idx), db->doorbell);
-}
-
 static int bnge_cp_num_to_irq_num(struct bnge_net *bn, int n)
 {
 	struct bnge_napi *bnapi = bn->bnapi[n];
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 476b5bab96fe..4d84f109ad5f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -539,6 +539,14 @@ struct bnge_tx_ring_info {
 	struct bnge_ring_struct	tx_ring_struct;
 };
 
+#define BNGE_NQ0_NAPI_IDX	0
+
+enum bnge_napi_flag {
+	BNGE_NAPI_FLAG_NQ0,
+};
+
+#define BNGE_NQ0_NAPI(bnapi)	(test_bit(BNGE_NAPI_FLAG_NQ0, &(bnapi)->flags))
+
 struct bnge_napi {
 	struct napi_struct		napi;
 	struct bnge_net			*bn;
@@ -555,6 +563,8 @@ struct bnge_napi {
 #define BNGE_TX_CMP_EVENT		0x10
 	bool				in_reset;
 	bool				tx_fault;
+
+	unsigned long			flags;
 };
 
 #define INVALID_STATS_CTX_ID	-1
-- 
2.47.3

