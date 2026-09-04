Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853D4756CA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519173; cv=none; b=VxnzavN/7BpHGInjaY6hg3fftcu29dYW40+veH4Ex7ZeMzeHJFu3z7FGdRscetkGIR0BwL9UOPsfYRZqgAkMehS88ekexKD7OLXeZMAkuOAS3MDLVQ3VJ127PoK3uu8vCH5cYQDtxT50+2tdIu+fkpBSwhp34uWhUjJgwM8I5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519173; c=relaxed/simple;
	bh=bUu38zGroNLvM5CQRYUfyGlQir7Q6zK3tKSrCPf9s84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuiglKDjQzFPcNpHTaVA8owiTFpJq2jH/0GOQ3dm1Zdz+/jar5ov2R8PgRCtcZi5ofzpkanFxfAqK7HQDGojvOYNPDQ8oAhtFcmj/q7RGqCDLYZ9Mxz6tiY5xlDNt8X+EO1eaNTxM8J386z6Q10qL2XJzQoJ8a6wuxkd6iA9Uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XWqQ4gAE; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XWqQ4gAE"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-90e9ad1a373so22513296d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519155; x=1789123955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q7S7hla65QC2jZ8AIBDUCQ598W60Rnpk/1gyZe4Z4o=;
        b=PADZ3WL1R0G0PbfOWQr6ru6HMuCD49a9Iqyzobx7eTuXtDttfII+v5gEAEd4ikPf+x
         SKQOD4SjRr/CrHnhWqfjNUNtAOIsBAqEi89fOwQ3wPAd78ViQ8Ranm+TlGTeBUPyCfUf
         FzCOBY6yVqwjS15SQ+JvIwGKE8uVTt/I4TbpxvyvenXOdgpBxTJuGdlQZcaB+3RYlrKG
         tspKFwjv43xS8Ubf2SEGsWUEkDbMymWBhmElosfX9vYPO+seaOPxMJhet9fPzS2GPGX+
         NUm71B6eonToUcFEDTiZg6NG0ESL41MyaYX6ioBhrcpakeYLVKPowRuZ4Tt1tGF0fJzT
         cySg==
X-Forwarded-Encrypted: i=1; AKwUvBwI895VawacuZznrvPlfRvFXZAm9CosNapb4LznSPSKxN0Yx3YTcDgsLkyYM56OVRAKkJWGl2y2gJs73co=@vger.kernel.org
X-Gm-Message-State: AFuF++mudbe61QR36FW9SJiC7QZNiWnQ8edV6lfo2UDXj09ylZsV2wXF
	hgR0W6WeDC4ZP77QLPG6XKRTMSI6/UHIXDAlxHoMNml6eGWdnZuBgrhxvTI4dPfSbUT8G9QMGkF
	evZxROX+JXlNCvuQv6+OdWKRHxQTtjNyQ/q3QfrkGihSRjiwZWjv1Zhp8TB+Fc7khIjwvNb7uWj
	Js6Wv2O6wa/yEzSCFuyLcPQ9JgyqQwIR3DWWNonLuUaxS6v0QRKCiVGDyN4KA9uHBN40eQPiCYE
	NpOhWcurQJAHKfGyBaY
X-Gm-Gg: AYBFou3IH1PXBF4c6JNWjtfmYNIFa79ip9e+Ew3vnEHSuls3SJ3mc0vXA+IeRYpCq0m
	ZEySOAli1CEUHVtdMpwMGEzsov2DeG3rL8WN81OlxOp1DDTVjyS3tHmj1emVqKz/TK1QrTiCV9S
	GFkX6tOSpNYPtkZxBuW9A+ejpIXKYraShZE3+dKBqfkJO6ScJc2hDqGcJz1wTUWFL/qcflR8z3N
	vQCtlAKhDcziaIESwS74VB1jc4p4c3dGB4gUiuNs+/ONrFBHHYDBY+ETUaTAjG89fa9MZPjGo0u
	zyiJo/vQ23AojmnHBYOwrQrbLCk5Jq4ygaHqJBkizihbRTRtxCDmPU2iFNvm9PTvmFQO+R+4wxo
	PQ5lewkDz67Dumtwt5AOcTC9TnT9BUYHLXHfNWl9laVtMab+dPoGpZi9uvxZ++vPJM5789/dFBi
	fbvcNRlcjbAHo/FxZg242K1oh+E2t3aKSiBQ==
X-Received: by 2002:a05:6214:3198:b0:90a:5779:d30a with SMTP id 6a1803df08f44-910401ceb90mr35837436d6.6.1788519154714;
        Fri, 04 Sep 2026 03:52:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91040730d98sm338166d6.17.2026.09.04.03.52.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso2029591a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519153; x=1789123953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q7S7hla65QC2jZ8AIBDUCQ598W60Rnpk/1gyZe4Z4o=;
        b=XWqQ4gAEmUL5SfNQS5PeG7ZX8nugnoFoOQZySziW3SOoRKFmVFH2CBSfvy7MnoX7p5
         htPQ4tnDwD3fSU33VYHJKzJT1sPIPv8eVdUZuOHk1haCACXR3lJ+hSaZEMFHNN7upHA7
         NadMvLk4lUm+oUsGVfae5Dk9davtH7jz76epY=
X-Forwarded-Encrypted: i=1; AKwUvBwJ1kwYw2p59B86SRMv1h9QNEkDYcGI1odY3C1VNqkllYISR4St2P5RLI48UC8aiDXUg/ZUyAYwySqs8rI=@vger.kernel.org
X-Received: by 2002:a17:90b:2741:b0:398:9beb:a2b7 with SMTP id 98e67ed59e1d1-39b087f4ceamr12562350a91.25.1788519153288;
        Fri, 04 Sep 2026 03:52:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2741:b0:398:9beb:a2b7 with SMTP id 98e67ed59e1d1-39b087f4ceamr12562295a91.25.1788519152668;
        Fri, 04 Sep 2026 03:52:32 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:32 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Sachin Holla <sachin.holla@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [PATCH 07/15] RDMA/bng_re: Add GID verbs
Date: Fri,  4 Sep 2026 03:43:15 -0700
Message-ID: <20260904104328.763768-8-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260904104328.763768-1-siva.kallam@broadcom.com>
References: <20260904104328.763768-1-siva.kallam@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Sachin Holla <sachin.holla@broadcom.com>

This patch adds below verbs.
- bng_re_query_gid
- bng_re_add_gid
- bng_re_del_gid

Signed-off-by: Sachin Holla <sachin.holla@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
---
 drivers/infiniband/hw/bng_re/bng_dev.c   |  10 ++
 drivers/infiniband/hw/bng_re/bng_re.h    |   2 +
 drivers/infiniband/hw/bng_re/bng_res.c   |  13 +-
 drivers/infiniband/hw/bng_re/bng_res.h   |  16 ++
 drivers/infiniband/hw/bng_re/bng_sp.c    | 206 +++++++++++++++++++++++
 drivers/infiniband/hw/bng_re/bng_sp.h    |  16 ++
 drivers/infiniband/hw/bng_re/bng_verbs.c | 109 ++++++++++++
 drivers/infiniband/hw/bng_re/bng_verbs.h |  10 +-
 8 files changed, 380 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/bng_re/bng_dev.c b/drivers/infiniband/hw/bng_re/bng_dev.c
index 401c7a0ddb85..9ce8e1bb420a 100644
--- a/drivers/infiniband/hw/bng_re/bng_dev.c
+++ b/drivers/infiniband/hw/bng_re/bng_dev.c
@@ -41,6 +41,9 @@ static const struct ib_device_ops bng_re_dev_ops = {
 	.disassociate_ucontext	= bng_re_disassociate_ucontext,
 	.mmap			= bng_re_mmap,
 	.mmap_free		= bng_re_mmap_free,
+	.query_gid		= bng_re_query_gid,
+	.add_gid		= bng_re_add_gid,
+	.del_gid		= bng_re_del_gid,
 	INIT_RDMA_OBJ_SIZE(ib_ucontext, bng_re_ucontext, ib_uctx),
 };
 
@@ -296,6 +299,11 @@ static int bng_re_query_hwrm_version(struct bng_re_dev *rdev)
 	return 0;
 }
 
+static void bng_re_free_res(struct bng_re_dev *rdev)
+{
+	bng_sp_cleanup_sgid_tbl(&rdev->bng_res.sgid_tbl);
+}
+
 static void bng_re_dev_uninit(struct bng_re_dev *rdev)
 {
 	int rc;
@@ -305,6 +313,8 @@ static void bng_re_dev_uninit(struct bng_re_dev *rdev)
 
 	bng_re_debugfs_rem_pdev(rdev);
 
+	bng_re_free_res(rdev);
+
 	if (test_and_clear_bit(BNG_RE_FLAG_TBLS_ALLOC_INITED, &rdev->flags))
 		bng_res_free_tbls(&rdev->bng_res);
 
diff --git a/drivers/infiniband/hw/bng_re/bng_re.h b/drivers/infiniband/hw/bng_re/bng_re.h
index 19b1e69dfb1e..0c0e362164d7 100644
--- a/drivers/infiniband/hw/bng_re/bng_re.h
+++ b/drivers/infiniband/hw/bng_re/bng_re.h
@@ -62,6 +62,8 @@ enum {
 #define ROCE_MPC_MAX_LATENCY_SEC_SLAB_INDEX	BNG_RE_MPC_MAX_LATENCY_SEC_SLAB_INDEX
 #define ROCE_MPC_MAX_LATENCY_MSEC_SLAB_INDEX	BNG_RE_MPC_MAX_LATENCY_MSEC_SLAB_INDEX
 
+typedef u32 PORT_NUM;
+
 struct bng_re_mpc_poll_info {
 	u64 bm_last_poll_work_poll_jiffies_start;
 	u64 bm_last_poll_work_poll_jiffies_end;
diff --git a/drivers/infiniband/hw/bng_re/bng_res.c b/drivers/infiniband/hw/bng_re/bng_res.c
index fe261354c4cb..a169ed2bb16b 100644
--- a/drivers/infiniband/hw/bng_re/bng_res.c
+++ b/drivers/infiniband/hw/bng_re/bng_res.c
@@ -368,6 +368,7 @@ static int bng_res_alloc_dpi_tbl(struct bng_re_res *res,
 void bng_res_free_tbls(struct bng_re_res *res)
 {
 	bng_res_free_dpi_tbl(&res->dpi_tbl);
+	bng_sp_free_sgid_tbl(&res->sgid_tbl);
 }
 
 int bng_res_alloc_init_tbls(struct bng_re_res *res)
@@ -376,7 +377,17 @@ int bng_res_alloc_init_tbls(struct bng_re_res *res)
 
 	rc = bng_res_alloc_dpi_tbl(res, res->dattr);
 	if (rc)
-		dev_err(&res->pdev->dev, "DPI tbl alloc failed\n");
+		return rc;
+
+	rc = bng_sp_alloc_sgid_tbl(&res->sgid_tbl,
+				   res->dattr->max_sgid);
+	if (rc)
+		goto free_dpi_tbl;
+
+	return 0;
+
+free_dpi_tbl:
+	bng_res_free_dpi_tbl(&res->dpi_tbl);
 
 	return rc;
 }
diff --git a/drivers/infiniband/hw/bng_re/bng_res.h b/drivers/infiniband/hw/bng_re/bng_res.h
index 11e453d4db36..58a6012998c1 100644
--- a/drivers/infiniband/hw/bng_re/bng_res.h
+++ b/drivers/infiniband/hw/bng_re/bng_res.h
@@ -38,6 +38,18 @@
 
 #define RCFW_DBR_PCI_BAR_REGION		2
 
+struct bng_re_gid {
+	u8 data[16];
+};
+
+struct bng_re_sgid_tbl {
+	u16			active;
+	u16			max;    /* number of entries */
+	struct bng_re_gid_info	*tbl;   /* array gid entries */
+	u16			*hw_id; /* array of hw gid indices */
+	void			*ctx;   /* array of IB context pointers */
+};
+
 struct bng_re_reg_desc {
 	u8		bar_id;
 	resource_size_t	bar_base;
@@ -193,8 +205,12 @@ struct bng_re_res {
 	struct mutex			dpi_tbl_lock;
 	struct xid_manager		*qp_xids;
 	struct xid_manager		*ah_xids;
+	struct bng_re_sgid_tbl		sgid_tbl;
+	bool				prio;
 };
 
+#define to_bng_re_res(ptr, member)	container_of(ptr, struct bng_re_res, member)
+
 static inline void *bng_re_get_qe(struct bng_re_hwq *hwq,
 				  u32 indx, u64 *pg)
 {
diff --git a/drivers/infiniband/hw/bng_re/bng_sp.c b/drivers/infiniband/hw/bng_re/bng_sp.c
index 83099e05328d..8401d1a7ff28 100644
--- a/drivers/infiniband/hw/bng_re/bng_sp.c
+++ b/drivers/infiniband/hw/bng_re/bng_sp.c
@@ -7,6 +7,15 @@
 #include "bng_fw.h"
 #include "bng_sp.h"
 #include "bng_tlv.h"
+#include "bng_re.h"
+
+const struct bng_re_gid bng_re_gid_zero = {{0,}};
+
+static inline bool is_zero_gid(struct bng_re_gid *gid)
+{
+	return !memcmp(gid, &bng_re_gid_zero, sizeof(bng_re_gid_zero));
+}
+
 
 static bool bng_re_is_atomic_cap(struct bng_re_rcfw *rcfw)
 {
@@ -129,3 +138,200 @@ int bng_re_get_dev_attr(struct bng_re_rcfw *rcfw)
 			  sbuf.sb, sbuf.dma_addr);
 	return rc;
 }
+
+int bng_sp_alloc_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl, u16 size)
+{
+	u16 i;
+
+	sgid_tbl->tbl = kcalloc(size, sizeof(*sgid_tbl->tbl), GFP_KERNEL);
+	if (!sgid_tbl->tbl)
+		return -ENOMEM;
+
+	sgid_tbl->hw_id = kcalloc(size, sizeof(u16), GFP_KERNEL);
+	if (!sgid_tbl->hw_id)
+		goto free_tbl;
+
+	sgid_tbl->ctx = kcalloc(size, sizeof(void *), GFP_KERNEL);
+	if (!sgid_tbl->ctx)
+		goto free_hwid;
+
+	for (i = 0; i < size; i++)
+		sgid_tbl->tbl[i].vlan_id = 0xFFFF;
+	sgid_tbl->max = size;
+	memset(sgid_tbl->hw_id, -1, sizeof(u16) * sgid_tbl->max);
+
+	return 0;
+
+free_hwid:
+	kfree(sgid_tbl->hw_id);
+	sgid_tbl->hw_id = NULL;
+free_tbl:
+	kfree(sgid_tbl->tbl);
+	sgid_tbl->tbl = NULL;
+	return -ENOMEM;
+}
+
+void bng_sp_free_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl)
+{
+	kfree(sgid_tbl->tbl);
+	kfree(sgid_tbl->hw_id);
+	kfree(sgid_tbl->ctx);
+	memset(sgid_tbl, 0, sizeof(*sgid_tbl));
+}
+
+void bng_sp_cleanup_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl)
+{
+	void **ctx_tbl = sgid_tbl->ctx;
+	u16 i;
+
+	for (i = 0; i < sgid_tbl->max; i++) {
+		if (!is_zero_gid(&sgid_tbl->tbl[i].gid))
+			bng_sp_del_sgid(sgid_tbl, i, true);
+		kfree(ctx_tbl[i]);
+	}
+
+	memset(sgid_tbl->tbl, 0, sizeof(*sgid_tbl->tbl) * sgid_tbl->max);
+	memset(sgid_tbl->hw_id, -1, sizeof(u16) * sgid_tbl->max);
+	memset(sgid_tbl->ctx, 0, sizeof(void *) * sgid_tbl->max);
+	sgid_tbl->active = 0;
+}
+
+int bng_sp_add_sgid(struct bng_re_sgid_tbl *sgid_tbl,
+		    struct bng_re_gid *gid, const u8 *smac, u16 vlan_id,
+		    bool update, u32 *index, bool is_ugid, u32 stats_ctx_id)
+{
+	struct bng_re_res *res = to_bng_re_res(sgid_tbl, sgid_tbl);
+	struct bng_re_dev *rdev = to_bng_re_dev(res, bng_res);
+	int i, free_idx;
+
+	if (sgid_tbl->active == sgid_tbl->max) {
+		dev_err(&res->pdev->dev, "SGID table is full");
+		return -ENOMEM;
+	}
+
+	free_idx = sgid_tbl->max;
+	for (i = 0; i < sgid_tbl->max; i++) {
+		if (!memcmp(&sgid_tbl->tbl[i].gid, gid, sizeof(*gid)) &&
+		    sgid_tbl->tbl[i].vlan_id == vlan_id) {
+			dev_dbg(&res->pdev->dev,
+				"SGID entry already exist in entry %d!",
+				i);
+			*index = i;
+			return -EALREADY;
+		}
+		if (free_idx == sgid_tbl->max &&
+		    is_zero_gid(&sgid_tbl->tbl[i].gid))
+			free_idx = i;
+	}
+
+	if (free_idx == sgid_tbl->max) {
+		dev_dbg(&res->pdev->dev,
+			"SGID table is FULL but count is not MAX!");
+		return -ENOMEM;
+	}
+
+	if (update) {
+		struct creq_add_gid_resp resp = {};
+		struct bng_re_cmdqmsg msg = {};
+		struct cmdq_add_gid req = {};
+		int rc;
+
+		bng_re_rcfw_cmd_prep((struct cmdq_base *)&req,
+				     CMDQ_BASE_OPCODE_ADD_GID, sizeof(req));
+
+		req.host_gid_index = cpu_to_le16(free_idx);
+		req.gid[0] = cpu_to_be32(((u32 *)gid->data)[3]);
+		req.gid[1] = cpu_to_be32(((u32 *)gid->data)[2]);
+		req.gid[2] = cpu_to_be32(((u32 *)gid->data)[1]);
+		req.gid[3] = cpu_to_be32(((u32 *)gid->data)[0]);
+
+		if (vlan_id != 0xFFFF || res->prio) {
+			if (vlan_id != 0xFFFF)
+				req.vlan = cpu_to_le16(vlan_id &
+						CMDQ_ADD_GID_VLAN_VLAN_ID_MASK);
+			req.vlan |=
+				cpu_to_le16(CMDQ_ADD_GID_VLAN_TPID_TPID_8100 |
+					    CMDQ_ADD_GID_VLAN_VLAN_EN);
+		}
+
+		/* MAC in network format */
+		req.src_mac[0] = cpu_to_be16(((u16 *)smac)[0]);
+		req.src_mac[1] = cpu_to_be16(((u16 *)smac)[1]);
+		req.src_mac[2] = cpu_to_be16(((u16 *)smac)[2]);
+
+		if (is_ugid)
+			req.stats_ctx = cpu_to_le16(CMDQ_ADD_GID_STATS_CTX_STATS_CTX_VALID |
+						    (u16)stats_ctx_id);
+
+		bng_re_fill_cmdqmsg(&msg, &req, &resp, NULL,
+				    sizeof(req), sizeof(resp), 0);
+		rc = bng_re_rcfw_send_message(&rdev->rcfw, &msg);
+		if (rc)
+			return rc;
+		sgid_tbl->hw_id[free_idx] = le32_to_cpu(resp.xid);
+	}
+
+	/* Add GID to the sgid_tbl */
+	memcpy(&sgid_tbl->tbl[free_idx].gid, gid, sizeof(*gid));
+	sgid_tbl->tbl[free_idx].vlan_id = vlan_id;
+	sgid_tbl->active++;
+
+	dev_dbg(&res->pdev->dev,
+		"SGID added hw_id[0x%x] = 0x%x active = 0x%x",
+		free_idx, sgid_tbl->hw_id[free_idx], sgid_tbl->active);
+
+	*index = free_idx;
+	return 0;
+}
+
+int bng_sp_del_sgid(struct bng_re_sgid_tbl *sgid_tbl, u32 index, bool update)
+{
+	struct bng_re_res *res = to_bng_re_res(sgid_tbl, sgid_tbl);
+	u16 hw_id;
+
+	if (!sgid_tbl->active) {
+		dev_err(&res->pdev->dev, "SGID table has no active entries");
+		return -EINVAL;
+	}
+	if (index >= sgid_tbl->max) {
+		dev_err(&res->pdev->dev, "Invalid index: %d", index);
+		return -EINVAL;
+	}
+
+	/* Remove GID from the SGID table */
+	hw_id = sgid_tbl->hw_id[index];
+	if (update) {
+		struct bng_re_dev *rdev = to_bng_re_dev(res, bng_res);
+		struct creq_delete_gid_resp resp = {};
+		struct cmdq_delete_gid req = {};
+		struct bng_re_cmdqmsg msg = {};
+		int rc;
+
+		if (hw_id == 0xFFFF) {
+			dev_err(&res->pdev->dev,
+				"GID entry contains an invalid HW id\n");
+			return -EINVAL;
+		}
+
+		bng_re_rcfw_cmd_prep((struct cmdq_base *)&req,
+				     CMDQ_BASE_OPCODE_DELETE_GID, sizeof(req));
+		req.gid_index = cpu_to_le16(hw_id);
+		bng_re_fill_cmdqmsg(&msg, &req, &resp, NULL,
+				    sizeof(req), sizeof(resp), 0);
+		rc = bng_re_rcfw_send_message(&rdev->rcfw, &msg);
+		if (rc)
+			return rc;
+	}
+
+	memcpy(&sgid_tbl->tbl[index].gid, &bng_re_gid_zero,
+	       sizeof(bng_re_gid_zero));
+	sgid_tbl->tbl[index].vlan_id = 0xFFFF;
+	sgid_tbl->hw_id[index] = 0xFFFF;
+	sgid_tbl->active--;
+
+	dev_dbg(&res->pdev->dev,
+		"SGID deleted hw_id[0x%x] = 0x%x active = 0x%x\n",
+		index, hw_id, sgid_tbl->active);
+	return 0;
+}
+
diff --git a/drivers/infiniband/hw/bng_re/bng_sp.h b/drivers/infiniband/hw/bng_re/bng_sp.h
index 4dac43540f54..05c2749419d8 100644
--- a/drivers/infiniband/hw/bng_re/bng_sp.h
+++ b/drivers/infiniband/hw/bng_re/bng_sp.h
@@ -48,5 +48,21 @@ struct bng_re_dev_attr {
 	u32                             max_dpi;
 };
 
+struct bng_re_gid_info {
+	struct bng_re_gid gid;
+	u16 vlan_id;
+};
+
 int bng_re_get_dev_attr(struct bng_re_rcfw *rcfw);
+int bng_sp_alloc_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl, u16 size);
+
+void bng_sp_free_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl);
+
+void bng_sp_cleanup_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl);
+
+int bng_sp_add_sgid(struct bng_re_sgid_tbl *sgid_tbl,
+		    struct bng_re_gid *gid, const u8 *smac, u16 vlan_id,
+		    bool update, u32 *index, bool is_ugid, u32 stats_ctx_id);
+
+int bng_sp_del_sgid(struct bng_re_sgid_tbl *sgid_tbl, u32 index, bool update);
 #endif
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.c b/drivers/infiniband/hw/bng_re/bng_verbs.c
index ef2b5bd65e54..59c7d95830f4 100644
--- a/drivers/infiniband/hw/bng_re/bng_verbs.c
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.c
@@ -417,3 +417,112 @@ void bng_re_mmap_free(struct rdma_user_mmap_entry *rdma_entry)
 
 	kfree(bng_entry);
 }
+
+static int bng_get_sgid(struct bng_re_res *res,
+			struct bng_re_sgid_tbl *sgid_tbl, int index,
+			struct bng_re_gid *gid)
+{
+	if (index > sgid_tbl->max) {
+		dev_err(&res->pdev->dev,
+			"Index %d exceeded SGID table max (%d)",
+			index, sgid_tbl->max);
+		return -EINVAL;
+	}
+	memcpy(gid, &sgid_tbl->tbl[index].gid, sizeof(*gid));
+	return 0;
+}
+
+int bng_re_query_gid(struct ib_device *ibdev, PORT_NUM port_num,
+		     int index, union ib_gid *gid)
+{
+	struct bng_re_dev *rdev = to_bng_re_dev(ibdev, ibdev);
+	int rc = 0;
+
+	memset(gid, 0, sizeof(*gid));
+	rc = bng_get_sgid(&rdev->bng_res,
+			  &rdev->bng_res.sgid_tbl, index,
+			  (struct bng_re_gid *)gid);
+
+	return rc;
+}
+
+int bng_re_add_gid(const struct ib_gid_attr *attr, void **context)
+{
+	struct bng_re_dev *rdev = to_bng_re_dev(attr->device, ibdev);
+	struct bng_re_sgid_tbl *sgid_tbl = &rdev->bng_res.sgid_tbl;
+	struct bng_re_gid *gid = (struct bng_re_gid *)&attr->gid;
+	struct bng_re_gid_ctx *ctx, **ctx_tbl;
+	u8 mac[ETH_ALEN] = {0};
+	u16 vlan_id = 0xFFFF;
+	u32 tbl_idx = 0;
+	int rc;
+
+	rc = rdma_read_gid_l2_fields(attr, &vlan_id, mac);
+	if (rc)
+		return rc;
+
+	rc = bng_sp_add_sgid(sgid_tbl, gid, mac, vlan_id,
+			     true, &tbl_idx, false, 0);
+	if (rc == -EALREADY) {
+		ctx_tbl = sgid_tbl->ctx;
+		ctx_tbl[tbl_idx]->refcnt++;
+		*context = ctx_tbl[tbl_idx];
+		return 0;
+	}
+
+	if (rc < 0) {
+		dev_err(rdev_to_dev(rdev), "Failed to add GID: rc=%#x", rc);
+		return rc;
+	}
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx_tbl = sgid_tbl->ctx;
+	ctx->idx = tbl_idx;
+	ctx->refcnt = 1;
+	ctx_tbl[tbl_idx] = ctx;
+	*context = ctx;
+
+	return 0;
+}
+
+int bng_re_del_gid(const struct ib_gid_attr *attr, void **context)
+{
+	struct bng_re_dev *rdev = to_bng_re_dev(attr->device, ibdev);
+	struct bng_re_sgid_tbl *sgid_tbl = &rdev->bng_res.sgid_tbl;
+	struct bng_re_gid_ctx *ctx, **ctx_tbl;
+	int rc = 0;
+
+	ctx_tbl = sgid_tbl->ctx;
+	ctx = *context;
+	if (!ctx) {
+		dev_err(rdev_to_dev(rdev), "GID entry has no ctx");
+		return -EINVAL;
+	}
+	if (!sgid_tbl->active) {
+		dev_err(rdev_to_dev(rdev), "SGID table has no active entries");
+		return -EINVAL;
+	}
+	if (ctx->idx >= sgid_tbl->max || ctx != ctx_tbl[ctx->idx]) {
+		dev_err(rdev_to_dev(rdev), "GID entry is invalid ctx");
+		return -EINVAL;
+	}
+
+	/* Delete the entry from the hardware */
+	ctx->refcnt--;
+	if (!ctx->refcnt) {
+		rc = bng_sp_del_sgid(sgid_tbl, ctx->idx, true);
+		if (rc) {
+			dev_err(rdev_to_dev(rdev),
+				"Failed to remove GID: %#x", rc);
+		} else {
+			ctx_tbl[ctx->idx] = NULL;
+			kfree(ctx);
+		}
+	}
+
+	return rc;
+}
+
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.h b/drivers/infiniband/hw/bng_re/bng_verbs.h
index 565571b2f1fe..eba56cf42672 100644
--- a/drivers/infiniband/hw/bng_re/bng_verbs.h
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.h
@@ -26,6 +26,11 @@ struct bng_re_user_mmap_entry {
 	u8 mmap_flag;
 };
 
+struct bng_re_gid_ctx {
+	u32			idx;
+	u32			refcnt;
+};
+
 int bng_re_query_device(struct ib_device *ibdev, struct ib_device_attr *ib_attr,
 			struct ib_udata *udata);
 int bng_re_modify_device(struct ib_device *ibdev, int device_modify_mask,
@@ -47,6 +52,9 @@ void bng_re_dealloc_ucontext(struct ib_ucontext *context);
 void bng_re_disassociate_ucontext(struct ib_ucontext *ibcontext);
 int bng_re_mmap(struct ib_ucontext *context, struct vm_area_struct *vma);
 void bng_re_mmap_free(struct rdma_user_mmap_entry *rdma_entry);
-
+int bng_re_query_gid(struct ib_device *ibdev, u32 port_num, int index,
+		     union ib_gid *gid);
+int bng_re_add_gid(const struct ib_gid_attr *attr, void **context);
+int bng_re_del_gid(const struct ib_gid_attr *attr, void **context);
 #endif /* __BNG_RE_VERBS_H__ */
 
-- 
2.43.5

