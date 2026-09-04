Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB5947ECC2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519167; cv=none; b=CNwzwXUyc848EgwcU+2b1uwytEDqt50KH2HgzkPgi7D+TQQrI4rOdiN24MvsqEHxudbq4SiOkCODsYB56CuYHgbMbl0rJVd89spoZ0tTd36Rp8qj+d5rrj8C+TwQ/Xz0UTmcB2Syhx73ArNK9AtKEi/94Gj/M+IoaD24dP1ZZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519167; c=relaxed/simple;
	bh=RxhMhJPKVADd5X3+IjgiTXhFmFB/Yhus2DCtr6cfKPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPJY2B6FT/y/XO1UGQdeRKv9ij7AYcrG/v09UcJ7T7Je4+gnoTass9lgaoyyEpronuCI1w0BI3HzH6YNhFAXZsKO5DUANsL8hrmCWId9ZESnrs3Ftyhw5wfRZkm/YUZrkoWmd2Io4bNkPDV1pNtDMM0ISNQJdJnzbdL8tHCyJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QktqkmzJ; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QktqkmzJ"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so792231a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519158; x=1789123958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZ0587Ok2qEEzZmzTErQUMTvjkwPeP1KFphy75fRsIw=;
        b=NN/67W2x8QNLocUxvlIu6So6fyJG9vtOW5FynMNAuzV6Gi+GM1lhwRzcoIUwJT4n3f
         UnWNY1Ur4TlNO6GdLgiEjgX3eMlj/BY9mz8zohcU+MVEOlDLWcJuvqs0qaxF2Efj4KvL
         zocUJWCi3AZx2DOewEVLkH+uax/nlSRlvybxihwX75Lkro4LVnlbO8qB+0BhoezaHhld
         9MrWQdkDgpP8YUJMsXDvVoaLSzmPnhA3j7vmBdcdtcU+INBdj/Q4fkmydcm6Jp0gjZUk
         Id/LpdDLaMFrSqkl+PdGg6dhDx4xkk46whrCV+RteFSDrP0LhPXnx2/g3b/kVUQgnVND
         Jg9A==
X-Forwarded-Encrypted: i=1; AKwUvBz6UFZONvulVm9MGBQ02UWbTAKSk5dBPPi4K1V+LQMOG5M6E07lbH+Jebi8yj6SVodI53RW+L1p1r4HLWU=@vger.kernel.org
X-Gm-Message-State: AFuF++mf5p50dP4QaoS0r7PSR3+gzmidU28k4fsUMzMMT541a50qPVfJ
	/9/+zIWNIJpVjmsif1qQu46T6pE5FRx1/aFIKMxpRd+wemWNdOJtEfWJIqWdYH84NxfUnB8psEr
	7YnW2zOZiJqlwYtw/OZnpgYsabTh68FCDx+ApRMrw7KVsV61GZYc2Uw/BMitISdO21r36voCn6j
	GBQPXycDkaMLzWTShp5+NATLYCGhAQYTrR003nTeurf6mrN3Ahclc456L4QtJHSYmjewd05irQc
	CRbbhgSSGCM8lS+wvL8
X-Gm-Gg: AYBFou1dFsX1ZmEiv0eszHF+YdMy8JyIwGslCOXSGp+p1v4GtiRafL9GyxIx/ETqahx
	zSwl0Ku/HAPT4xQP+fsZbbvFiUOU80sls6EjO6QVYaMsNAggDfXLjrfvTp00oyjfHcvSkr+7TSQ
	uk3nZked2J8QVi9oBvQii4HZ+HXdQBm95ZH5OWbPPJaWzGe7mOX/MhhbGrY5AgEXdCJY6qsb3jK
	/nX/m5RBLl7LJHOJqJ8KDhO3rnKOFk4ktfgLUkTJjmBaNG/8NNVSZia34W1ZYjx11OpiCCHgzXT
	dqCdSF2p8FuacFOW0843iOqCYJ2mNvNueSWWGksGc5v+mtwk067j2BucRLvwydegTgNMjizDYjM
	PFsVBU8/gwV0KmhVIzjOCMG5ytgzDy14xZyP3BEfprdlY0VRv06VrQv4pfzD6d3bVNUySGqLnqw
	vNHKDY4KteOAcQUeItgwT/qCx6IzvaMc7daQ==
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39b260dd3efmr8133024a91.1.1788519157777;
        Fri, 04 Sep 2026 03:52:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b260deb5esm1229202a91.3.2026.09.04.03.52.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso11864915ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519156; x=1789123956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ0587Ok2qEEzZmzTErQUMTvjkwPeP1KFphy75fRsIw=;
        b=QktqkmzJBuFp/0Juw1oBWkFAKwxCRTGFzC0LuWvyfNmlve77qJutYxHlCSXalR0W4v
         j/TSoQgi7KmKvEsS/rQlc6XHKETRyFDE17lNINKX7SxLqb4ttj62VWFI+77t1a5uH9Sr
         2KSuof5SWK5bEbh92fGWfR/QcoWDJAxmtCM8I=
X-Forwarded-Encrypted: i=1; AKwUvBx/A27LS+3ozUeWQfTHAJUADz9OcoOkBZmYzOKt3PS9wMjCL2FCJHncGH5maBmoTMuyq+HqvXs89IMACBg=@vger.kernel.org
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr8717214a91.9.1788519156098;
        Fri, 04 Sep 2026 03:52:36 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr8717138a91.9.1788519155572;
        Fri, 04 Sep 2026 03:52:35 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:34 -0700 (PDT)
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
	Suresh Rupanagudi <suresh.rupanagudi@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [PATCH 08/15] RDMA/bng_re: Add PD verbs
Date: Fri,  4 Sep 2026 03:43:16 -0700
Message-ID: <20260904104328.763768-9-siva.kallam@broadcom.com>
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

From: Suresh Rupanagudi <suresh.rupanagudi@broadcom.com>

This patch adds below verbs.
- bng_re_alloc_pd
- bng_re_dealloc_pd

Signed-off-by: Suresh Rupanagudi <suresh.rupanagudi@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
---
 drivers/infiniband/hw/bng_re/bng_dev.c   |  3 ++
 drivers/infiniband/hw/bng_re/bng_res.c   | 38 +++++++++++++++++++++++-
 drivers/infiniband/hw/bng_re/bng_res.h   |  9 ++++++
 drivers/infiniband/hw/bng_re/bng_sp.c    | 36 ++++++++++++++++++++++
 drivers/infiniband/hw/bng_re/bng_sp.h    | 11 +++++++
 drivers/infiniband/hw/bng_re/bng_verbs.c | 34 +++++++++++++++++++++
 drivers/infiniband/hw/bng_re/bng_verbs.h |  8 +++++
 7 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/bng_re/bng_dev.c b/drivers/infiniband/hw/bng_re/bng_dev.c
index 9ce8e1bb420a..b8a50c8cd299 100644
--- a/drivers/infiniband/hw/bng_re/bng_dev.c
+++ b/drivers/infiniband/hw/bng_re/bng_dev.c
@@ -44,6 +44,9 @@ static const struct ib_device_ops bng_re_dev_ops = {
 	.query_gid		= bng_re_query_gid,
 	.add_gid		= bng_re_add_gid,
 	.del_gid		= bng_re_del_gid,
+	.alloc_pd		= bng_re_alloc_pd,
+	.dealloc_pd		= bng_re_dealloc_pd,
+	INIT_RDMA_OBJ_SIZE(ib_pd, bng_re_pd, ib_pd),
 	INIT_RDMA_OBJ_SIZE(ib_ucontext, bng_re_ucontext, ib_uctx),
 };
 
diff --git a/drivers/infiniband/hw/bng_re/bng_res.c b/drivers/infiniband/hw/bng_re/bng_res.c
index a169ed2bb16b..8bf6e8efa182 100644
--- a/drivers/infiniband/hw/bng_re/bng_res.c
+++ b/drivers/infiniband/hw/bng_re/bng_res.c
@@ -365,8 +365,38 @@ static int bng_res_alloc_dpi_tbl(struct bng_re_res *res,
 	return 0;
 }
 
+static void bng_res_free_pd_tbl(struct bng_re_pd_tbl *pdt)
+{
+	kfree(pdt->tbl);
+	pdt->tbl = NULL;
+	pdt->max = 0;
+}
+
+static int bng_res_alloc_pd_tbl(struct bng_re_res *res,
+				struct bng_re_dev_attr *dev_attr)
+{
+	struct bng_re_pd_tbl *pdt = &res->pd_tbl;
+	u32 max = dev_attr->max_pd;
+	u32 bytes;
+
+	max++; /* one extra slot, reserved so it's never allocated */
+	bytes = BITS_TO_LONGS(max) * sizeof(unsigned long);
+
+	pdt->tbl = kmalloc(bytes, GFP_KERNEL);
+	if (!pdt->tbl)
+		return -ENOMEM;
+
+	pdt->max = max;
+	memset(pdt->tbl, 0xFF, bytes); /* mark every pd id as available */
+	clear_bit(pdt->max - 1, pdt->tbl); /* reserve the last pd id */
+	mutex_init(&res->pd_tbl_lock);
+
+	return 0;
+}
+
 void bng_res_free_tbls(struct bng_re_res *res)
 {
+	bng_res_free_pd_tbl(&res->pd_tbl);
 	bng_res_free_dpi_tbl(&res->dpi_tbl);
 	bng_sp_free_sgid_tbl(&res->sgid_tbl);
 }
@@ -375,10 +405,14 @@ int bng_res_alloc_init_tbls(struct bng_re_res *res)
 {
 	int rc;
 
-	rc = bng_res_alloc_dpi_tbl(res, res->dattr);
+	rc = bng_res_alloc_pd_tbl(res, res->dattr);
 	if (rc)
 		return rc;
 
+	rc = bng_res_alloc_dpi_tbl(res, res->dattr);
+	if (rc)
+		goto free_pd_tbl;
+
 	rc = bng_sp_alloc_sgid_tbl(&res->sgid_tbl,
 				   res->dattr->max_sgid);
 	if (rc)
@@ -388,6 +422,8 @@ int bng_res_alloc_init_tbls(struct bng_re_res *res)
 
 free_dpi_tbl:
 	bng_res_free_dpi_tbl(&res->dpi_tbl);
+free_pd_tbl:
+	bng_res_free_pd_tbl(&res->pd_tbl);
 
 	return rc;
 }
diff --git a/drivers/infiniband/hw/bng_re/bng_res.h b/drivers/infiniband/hw/bng_re/bng_res.h
index 58a6012998c1..72afe51c6bfa 100644
--- a/drivers/infiniband/hw/bng_re/bng_res.h
+++ b/drivers/infiniband/hw/bng_re/bng_res.h
@@ -196,6 +196,12 @@ struct bng_re_dpi_tbl {
 	void __iomem		*priv_db;
 };
 
+/* PD table */
+struct bng_re_pd_tbl {
+	unsigned long	*tbl;
+	u32		max;
+};
+
 struct bng_re_res {
 	struct pci_dev			*pdev;
 	struct bng_re_chip_ctx		*cctx;
@@ -207,6 +213,9 @@ struct bng_re_res {
 	struct xid_manager		*ah_xids;
 	struct bng_re_sgid_tbl		sgid_tbl;
 	bool				prio;
+	struct bng_re_pd_tbl		pd_tbl;
+	/* Serialize access to PD table */
+	struct mutex			pd_tbl_lock;
 };
 
 #define to_bng_re_res(ptr, member)	container_of(ptr, struct bng_re_res, member)
diff --git a/drivers/infiniband/hw/bng_re/bng_sp.c b/drivers/infiniband/hw/bng_re/bng_sp.c
index 8401d1a7ff28..97768a25c0e4 100644
--- a/drivers/infiniband/hw/bng_re/bng_sp.c
+++ b/drivers/infiniband/hw/bng_re/bng_sp.c
@@ -335,3 +335,39 @@ int bng_sp_del_sgid(struct bng_re_sgid_tbl *sgid_tbl, u32 index, bool update)
 	return 0;
 }
 
+/* PD allocation/de-allocation functions from Gerrit */
+int bng_sp_alloc_pd(struct bng_re_res *res, struct bng_sp_pd *pd)
+{
+	struct bng_re_pd_tbl *pdt = &res->pd_tbl;
+	u32 bit_num;
+
+	mutex_lock(&res->pd_tbl_lock);
+	bit_num = find_first_bit(pdt->tbl, pdt->max);
+	if (bit_num >= pdt->max - 1) {
+		mutex_unlock(&res->pd_tbl_lock);
+		return -ENOMEM;
+	}
+
+	/* Found unused PD - mark it as allocated */
+	clear_bit(bit_num, pdt->tbl);
+	pd->id = bit_num;
+
+	mutex_unlock(&res->pd_tbl_lock);
+	return 0;
+}
+
+int bng_sp_dealloc_pd(struct bng_re_res *res,
+		      struct bng_re_pd_tbl *pdt,
+		      struct bng_sp_pd *pd)
+{
+	mutex_lock(&res->pd_tbl_lock);
+	if (pd->id >= pdt->max - 1 || test_and_set_bit(pd->id, pdt->tbl)) {
+		dev_warn(&res->pdev->dev, "Freeing an unused PD? pdn = %d\n",
+			 pd->id);
+		mutex_unlock(&res->pd_tbl_lock);
+		return -EINVAL;
+	}
+	pd->id = pdt->max - 1;
+	mutex_unlock(&res->pd_tbl_lock);
+	return 0;
+}
diff --git a/drivers/infiniband/hw/bng_re/bng_sp.h b/drivers/infiniband/hw/bng_re/bng_sp.h
index 05c2749419d8..136703942e1f 100644
--- a/drivers/infiniband/hw/bng_re/bng_sp.h
+++ b/drivers/infiniband/hw/bng_re/bng_sp.h
@@ -53,6 +53,10 @@ struct bng_re_gid_info {
 	u16 vlan_id;
 };
 
+struct bng_sp_pd {
+	u32	id;
+};
+
 int bng_re_get_dev_attr(struct bng_re_rcfw *rcfw);
 int bng_sp_alloc_sgid_tbl(struct bng_re_sgid_tbl *sgid_tbl, u16 size);
 
@@ -65,4 +69,11 @@ int bng_sp_add_sgid(struct bng_re_sgid_tbl *sgid_tbl,
 		    bool update, u32 *index, bool is_ugid, u32 stats_ctx_id);
 
 int bng_sp_del_sgid(struct bng_re_sgid_tbl *sgid_tbl, u32 index, bool update);
+
+int bng_sp_alloc_pd(struct bng_re_res *res, struct bng_sp_pd *pd);
+
+int bng_sp_dealloc_pd(struct bng_re_res *res,
+		      struct bng_re_pd_tbl *pdt,
+		      struct bng_sp_pd *pd);
+
 #endif
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.c b/drivers/infiniband/hw/bng_re/bng_verbs.c
index 59c7d95830f4..140a972a0316 100644
--- a/drivers/infiniband/hw/bng_re/bng_verbs.c
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.c
@@ -526,3 +526,37 @@ int bng_re_del_gid(const struct ib_gid_attr *attr, void **context)
 	return rc;
 }
 
+int bng_re_alloc_pd(struct ib_pd *ib_pd, struct ib_udata *udata)
+{
+	struct bng_re_pd *pd = container_of(ib_pd, struct bng_re_pd, ib_pd);
+	struct ib_device *ibdev = ib_pd->device;
+	struct bng_re_dev *rdev = container_of(ibdev, struct bng_re_dev, ibdev);
+	int rc;
+
+	pd->rdev = rdev;
+
+	rc = bng_sp_alloc_pd(&rdev->bng_res, &pd->sp_pd);
+	if (rc) {
+		ibdev_err(&rdev->ibdev,
+			  "Failed to allocate HW PD\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+int bng_re_dealloc_pd(struct ib_pd *ib_pd, struct ib_udata *udata)
+{
+	struct bng_re_pd *pd = container_of(ib_pd, struct bng_re_pd, ib_pd);
+	struct bng_re_dev *rdev = pd->rdev;
+	int rc;
+
+	rc = bng_sp_dealloc_pd(&rdev->bng_res, &rdev->bng_res.pd_tbl,
+			       &pd->sp_pd);
+	if (rc) {
+		ibdev_err(&rdev->ibdev,
+			  "Dealloc PD failed: pdid=%u, rc=%d\n",
+			  pd->sp_pd.id, rc);
+	}
+	return 0;
+}
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.h b/drivers/infiniband/hw/bng_re/bng_verbs.h
index eba56cf42672..ea017f70142e 100644
--- a/drivers/infiniband/hw/bng_re/bng_verbs.h
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.h
@@ -31,6 +31,12 @@ struct bng_re_gid_ctx {
 	u32			refcnt;
 };
 
+struct bng_re_pd {
+	struct ib_pd		ib_pd;
+	struct bng_re_dev	*rdev;
+	struct bng_sp_pd	sp_pd;
+};
+
 int bng_re_query_device(struct ib_device *ibdev, struct ib_device_attr *ib_attr,
 			struct ib_udata *udata);
 int bng_re_modify_device(struct ib_device *ibdev, int device_modify_mask,
@@ -56,5 +62,7 @@ int bng_re_query_gid(struct ib_device *ibdev, u32 port_num, int index,
 		     union ib_gid *gid);
 int bng_re_add_gid(const struct ib_gid_attr *attr, void **context);
 int bng_re_del_gid(const struct ib_gid_attr *attr, void **context);
+int bng_re_alloc_pd(struct ib_pd *ib_pd, struct ib_udata *udata);
+int bng_re_dealloc_pd(struct ib_pd *ib_pd, struct ib_udata *udata);
 #endif /* __BNG_RE_VERBS_H__ */
 
-- 
2.43.5

