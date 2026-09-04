Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4436606B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519161; cv=none; b=jisSr3F+TNFSeqD5eBZblohmFmVAwCL8IS9H7DF8xg7tmvbYpEll2cihDBQI0QugxmEXk4+5pdNYQ0G+/TTz+gf1jc4aZMkTZPi7k4XRrAqD+jHJiBoTUygAASWsRPiq/Y2Bqm1Ym2iYeg4dQN6LdGY4HHlrmGy/a8dcmij9DIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519161; c=relaxed/simple;
	bh=2dAVE2WXxdp3tSOy4jTPwVNOPawnbbsPYUBg0SPl3rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgQQxmdQG14TDE4O2if9UeyXeY/HfnirgA0NQqL9WzTkxMsy7Bq6zVRO2OXWqEx3SEXKZ869QSHwjEUB+Bg2ZvIuOrB3MqsdG+l7nkrdQ+UJUql6CZy7QF7LYli6JRy8im7uG7RqqkNvbMi8K5w11/AIZWmKtghfR5Ml9rvXzgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hi8OTwB1; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hi8OTwB1"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1027016a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519153; x=1789123953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/Zg63IszZY5r+Rmhw5XRHAGIcwwHdwISEBxawedkp4=;
        b=U0/f3RLjFp5uyJDiy+a2LMOmFN84x+MMFU6P2KQbMxIlRXqRYTawcUI1GLo9hzrM+g
         o6K1yp6sd61cntreSqdYqbAVNZgvX93fqVLgUA9HgjvbCRx6rcssxYpkDEHIWHYAuL2Q
         9dw+eZxaa1ibGZQhuZJIwB1DVHPuEw/yzLpn8gU7+BS4kK+TC19Okg2jVjn+5sWPsmXc
         NWHj7Kph7F2LGebCBNU2/NPulBxLckROkb8i1E1C/FRq8Ekd7rsyhu/D8g+OyVGovg1p
         c1Sr+19rghL8lXFrZJIiEupkc4tVB+8vx9+Y/9DdxiMPX7FkDEjRkhYOLZ84fUlMFPbv
         dxPw==
X-Forwarded-Encrypted: i=1; AKwUvBweLFhGWCtmEc+tMXGxoQKOLn802NbYnXBp9kQJEJsbLOoP42NAsHLAaL45ckaxPNJal5QNbF1pFfxZ06M=@vger.kernel.org
X-Gm-Message-State: AFuF++kkhxB1UOsvG65Edt9iqO0Hedmq7AT0Mqg5MpjBeaQKwf1WoA9S
	aCbyZ80Ouq3SWT3KdeKAFmRn/y3yyJrW35VE+4AVq7ELxtJGhorB9trWjK+2AydmaeqFykVjZWK
	WAAWGSQU05d7xtWzhtUIlPuu6Gv56I22nWAD0RdwfF5ELGIezasMSBGisXkSKtXiQPpMmiSQBid
	LIhXi8UjnegBfhdBJ5JZAHbE7BL8dPhMT/wBO0y127e/nuhYa49VHD7LI+O2lYixtxAQqZLvE7I
	W26+FpOLLcgcrLuaoIF
X-Gm-Gg: AYBFou2Xb/4yxml/DNhhd4R7s3GzUlJhfUXvagzQSDRiNtqO7DzTAtuQAtdZA0uWbbs
	FzmdhSiTPjEFFAh9qOVnsxJtch45Og/GwVIjsxf9vE+LJVldXrRdWdDIlthtq6P6b7oizDiCv2h
	ItN5ZosnRjstR4wTbETgjWXIYovyeuYO+eKRyrm4SWsyxCSHwHO29eazo1HM3+0b1e+qvcWJ3OY
	J5iaHs3tFVaOh1m48bwXhxGqFwmvikmPh+tNGMpXyfqzT9bRQBeTi3dSd+Uyi/IQEeqauKHzR+1
	6v4K1TZI+ykrdjDax5/m3YfSAX7scRlaCk5NlMwWEU9Qqp7ZlDVL7N27dRQDQn5lpY+2cchNU4u
	bOUTfWcy5xXsRu5fN4lJ/BfwgfJ08ODD3n6RklrZm/VLyGQfsx8OmVr5/R7zwfsuSn/i3oUXbXI
	5n+zVGqAgw4DYSpmFFecEIuFbvYJzsl3DWlA==
X-Received: by 2002:a05:6a21:46c9:b0:3d3:aec2:4dcb with SMTP id adf61e73a8af0-3da3a0fd0a6mr8749949637.23.1788519152893;
        Fri, 04 Sep 2026 03:52:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc45a6abaaesm190995a12.2.2026.09.04.03.52.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1717274a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519151; x=1789123951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/Zg63IszZY5r+Rmhw5XRHAGIcwwHdwISEBxawedkp4=;
        b=hi8OTwB12RrJu3fDGHQsdCOiumk07dIeo1n4hVmlv/NsQuSdXRtM//8ANefIEZnw2B
         gX/zSVVw3Ib5tqvETShYdugLnhdGo6U5SZdNVfYsC/cTFKpsj5kyLFqHSsyfboWux6RX
         Kv8pLjzcpFWTlvj9Dp1GCFRG9OaApePay9hwI=
X-Forwarded-Encrypted: i=1; AKwUvByGX1mqKKHoCSnhYbV82ntoTzwPZIYi7eUSAXm87veYv3ectbSSbprf4AIu9kaH7G+u3xvWlqtr82E95FQ=@vger.kernel.org
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr7691616a91.9.1788519150491;
        Fri, 04 Sep 2026 03:52:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr7691538a91.9.1788519149926;
        Fri, 04 Sep 2026 03:52:29 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:29 -0700 (PDT)
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
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [PATCH 06/15] RDMA/bng_re: Add ucontext/mmap verbs
Date: Fri,  4 Sep 2026 03:43:14 -0700
Message-ID: <20260904104328.763768-7-siva.kallam@broadcom.com>
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

This patch adds below verbs.
- bng_re_alloc_ucontext
- bng_re_dealloc_ucontext
- bng_re_disassociate_ucontext
- bng_re_mmap
- bng_re_mmap_free

Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
---
 drivers/infiniband/hw/bng_re/bng_dev.c   |   9 +
 drivers/infiniband/hw/bng_re/bng_re.h    |  32 ++++
 drivers/infiniband/hw/bng_re/bng_res.c   |  94 ++++++++++
 drivers/infiniband/hw/bng_re/bng_res.h   |  25 +++
 drivers/infiniband/hw/bng_re/bng_verbs.c | 219 +++++++++++++++++++++++
 drivers/infiniband/hw/bng_re/bng_verbs.h |  22 +++
 include/uapi/rdma/bng_re-abi.h           |  31 ++++
 7 files changed, 432 insertions(+)

diff --git a/drivers/infiniband/hw/bng_re/bng_dev.c b/drivers/infiniband/hw/bng_re/bng_dev.c
index 05665c82b4e1..401c7a0ddb85 100644
--- a/drivers/infiniband/hw/bng_re/bng_dev.c
+++ b/drivers/infiniband/hw/bng_re/bng_dev.c
@@ -36,6 +36,12 @@ static const struct ib_device_ops bng_re_dev_ops = {
 	.get_port_immutable	= bng_re_get_port_immutable,
 	.process_mad		= bng_re_process_mad,
 	.query_pkey		= bng_re_query_pkey,
+	.alloc_ucontext		= bng_re_alloc_ucontext,
+	.dealloc_ucontext	= bng_re_dealloc_ucontext,
+	.disassociate_ucontext	= bng_re_disassociate_ucontext,
+	.mmap			= bng_re_mmap,
+	.mmap_free		= bng_re_mmap_free,
+	INIT_RDMA_OBJ_SIZE(ib_ucontext, bng_re_ucontext, ib_uctx),
 };
 
 static struct bng_re_dev *bng_re_dev_add(struct auxiliary_device *adev,
@@ -284,6 +290,9 @@ static int bng_re_query_hwrm_version(struct bng_re_dev *rdev)
 	if (!cctx->hwrm_cmd_max_timeout)
 		cctx->hwrm_cmd_max_timeout = BNG_ROCE_FW_MAX_TIMEOUT;
 
+	cctx->chip_rev = ver_get_resp.chip_rev;
+	cctx->chip_metal = ver_get_resp.chip_metal;
+
 	return 0;
 }
 
diff --git a/drivers/infiniband/hw/bng_re/bng_re.h b/drivers/infiniband/hw/bng_re/bng_re.h
index 4fa5db15625f..19b1e69dfb1e 100644
--- a/drivers/infiniband/hw/bng_re/bng_re.h
+++ b/drivers/infiniband/hw/bng_re/bng_re.h
@@ -172,6 +172,38 @@ struct bng_mpc_db {
 	struct bng_re_db_info	dbinfo;
 };
 
+enum bng_re_mmap_flag {
+	BNG_RE_MMAP_WC_DB,
+	BNG_RE_MMAP_DBR_PAGE,
+	BNG_RE_MMAP_DB_RECOVERY_PAGE,
+	BNG_RE_MMAP_DBR_PACING_BAR,
+	BNG_RE_MMAP_UC_DB,
+	BNG_RE_MMAP_TOGGLE_PAGE,
+	BNG_RE_MMAP_HDBR_BASE,
+};
+
+static inline char *bng_re_mmap_str(enum bng_re_mmap_flag mmap_flag)
+{
+	switch (mmap_flag) {
+	case BNG_RE_MMAP_WC_DB:
+		return "BNG_RE_MMAP_WC_DB";
+	case BNG_RE_MMAP_DBR_PAGE:
+		return "BNG_RE_MMAP_DBR_PAGE";
+	case BNG_RE_MMAP_DB_RECOVERY_PAGE:
+		return "BNG_RE_MMAP_DB_RECOVERY_PAGE";
+	case BNG_RE_MMAP_DBR_PACING_BAR:
+		return "BNG_RE_MMAP_DBR_PACING_BAR";
+	case BNG_RE_MMAP_UC_DB:
+		return "BNG_RE_MMAP_UC_DB";
+	case BNG_RE_MMAP_HDBR_BASE:
+		return "BNG_RE_MMAP_HDBR_BASE";
+	case BNG_RE_MMAP_TOGGLE_PAGE:
+		return "BNG_RE_MMAP_TOGGLE_PAGE";
+	default:
+		return "Unknown";
+	}
+}
+
 /* NQ specific structures  */
 struct bng_re_nq_db {
 	struct bng_re_reg_desc	reg;
diff --git a/drivers/infiniband/hw/bng_re/bng_res.c b/drivers/infiniband/hw/bng_re/bng_res.c
index be6d5099aa35..fe261354c4cb 100644
--- a/drivers/infiniband/hw/bng_re/bng_res.c
+++ b/drivers/infiniband/hw/bng_re/bng_res.c
@@ -360,6 +360,7 @@ static int bng_res_alloc_dpi_tbl(struct bng_re_res *res,
 	}
 
 	memset((u8 *)dpit->tbl, 0xFF, bytes);
+	mutex_init(&res->dpi_tbl_lock);
 	dpit->priv_db = dpit->ucreg.bar_reg + dpit->ucreg.offset;
 	return 0;
 }
@@ -379,3 +380,96 @@ int bng_res_alloc_init_tbls(struct bng_re_res *res)
 
 	return rc;
 }
+
+int bng_re_alloc_dpi(struct bng_re_res *res,
+		     struct bng_re_dpi *dpi,
+		     void *app, enum bng_re_dpi_type type)
+{
+	struct bng_re_dpi_tbl *dpit = &res->dpi_tbl;
+	struct bng_re_reg_desc *reg;
+	u32 bit_num;
+	u64 umaddr;
+	int rc = 0;
+
+	reg = &dpit->wcreg;
+	mutex_lock(&res->dpi_tbl_lock);
+	if (!dpit->tbl) {
+		rc = -ENOMEM;
+		goto unlock;
+	}
+	bit_num = find_first_bit(dpit->tbl, dpit->max);
+	if (bit_num >= dpit->max) {
+		rc = -ENOMEM;
+		goto unlock;
+	}
+	clear_bit(bit_num, dpit->tbl);
+	dpit->app_tbl[bit_num] = app;
+	dpi->bit = bit_num;
+	dpi->dpi = bit_num + (reg->offset - dpit->ucreg.offset) / PAGE_SIZE;
+	umaddr = reg->bar_base + reg->offset + bit_num * PAGE_SIZE;
+	dpi->umdbr = umaddr;
+	switch (type) {
+	case BNG_RE_DPI_TYPE_KERNEL:
+		dpi->umdbr = dpit->ucreg.bar_base +
+			     dpit->ucreg.offset + bit_num * PAGE_SIZE;
+		dpi->dbr = dpit->priv_db;
+		dpi->dpi = dpi->bit;
+		break;
+	case BNG_RE_DPI_TYPE_WC:
+		dpi->dbr = ioremap_wc(umaddr, PAGE_SIZE);
+		break;
+	default:
+		dpi->dbr = ioremap(umaddr, PAGE_SIZE);
+		break;
+	}
+
+	if (!dpi->dbr) {
+		dev_err(&res->pdev->dev, "DB remap failed, type = %d\n",
+			type);
+		rc = -ENOMEM;
+		set_bit(bit_num, dpit->tbl);
+		dpit->app_tbl[bit_num] = NULL;
+		goto unlock;
+	}
+	dpi->type = type;
+unlock:
+	mutex_unlock(&res->dpi_tbl_lock);
+	return rc;
+}
+
+int bng_re_dealloc_dpi(struct bng_re_res *res,
+		       struct bng_re_dpi *dpi)
+{
+	struct bng_re_dpi_tbl *dpit = &res->dpi_tbl;
+	int rc = 0;
+
+	mutex_lock(&res->dpi_tbl_lock);
+	if (dpi->bit >= dpit->max) {
+		dev_warn(&res->pdev->dev,
+			 "Invalid DPI? dpi = %d, bit = %d\n",
+			 dpi->dpi, dpi->bit);
+		rc = -EINVAL;
+		goto unlock;
+	}
+	if (dpi->dpi && dpi->type != BNG_RE_DPI_TYPE_KERNEL)
+		pci_iounmap(res->pdev, dpi->dbr);
+	if (test_and_set_bit(dpi->bit, dpit->tbl)) {
+		dev_warn(&res->pdev->dev,
+			 "Freeing an unused DPI? dpi = %d, bit = %d\n",
+			 dpi->dpi, dpi->bit);
+		dev_warn(&res->pdev->dev,
+			 "umdbr = %lld, dbr = %p, type = %d\n",
+			 dpi->umdbr, dpi->dbr, dpi->type);
+		dev_warn(&res->pdev->dev,
+			 "dpit max = %d, priv_db = %p\n",
+			 dpit->max, dpit->priv_db);
+		rc = -EINVAL;
+		goto unlock;
+	}
+	if (dpit->app_tbl)
+		dpit->app_tbl[dpi->bit] = NULL;
+	memset(dpi, 0, sizeof(*dpi));
+unlock:
+	mutex_unlock(&res->dpi_tbl_lock);
+	return rc;
+}
diff --git a/drivers/infiniband/hw/bng_re/bng_res.h b/drivers/infiniband/hw/bng_re/bng_res.h
index 9745609190d9..11e453d4db36 100644
--- a/drivers/infiniband/hw/bng_re/bng_res.h
+++ b/drivers/infiniband/hw/bng_re/bng_res.h
@@ -91,6 +91,8 @@ struct bng_re_chip_ctx {
 	u64	hwrm_intf_ver;
 	u16	hwrm_cmd_max_timeout;
 	struct bng_re_drv_modes modes;
+	u8	chip_rev;
+	u8	chip_metal;
 };
 
 struct bng_re_pbl {
@@ -156,6 +158,22 @@ struct bng_re_stats {
 	u32				fw_id;
 };
 
+/* DPI types */
+enum bng_re_dpi_type {
+	BNG_RE_DPI_TYPE_KERNEL	= 0,
+	BNG_RE_DPI_TYPE_UC	= 1,
+	BNG_RE_DPI_TYPE_WC	= 2
+};
+
+/* DPI structure */
+struct bng_re_dpi {
+	u32			dpi;
+	u32			bit;
+	u64			umdbr;
+	void __iomem		*dbr;
+	enum bng_re_dpi_type	type;
+};
+
 /* DPI table */
 struct bng_re_dpi_tbl {
 	void			**app_tbl;
@@ -171,6 +189,8 @@ struct bng_re_res {
 	struct bng_re_chip_ctx		*cctx;
 	struct bng_re_dev_attr		*dattr;
 	struct bng_re_dpi_tbl		dpi_tbl;
+	/* Serialize access to DPI table */
+	struct mutex			dpi_tbl_lock;
 	struct xid_manager		*qp_xids;
 	struct xid_manager		*ah_xids;
 };
@@ -282,4 +302,9 @@ void bng_res_unmap_db_bar(struct bng_re_res *res);
 int bng_res_map_db_bar(struct bng_re_res *res);
 void bng_res_free_tbls(struct bng_re_res *res);
 int bng_res_alloc_init_tbls(struct bng_re_res *res);
+int bng_re_alloc_dpi(struct bng_re_res *res,
+		   struct bng_re_dpi *dpi,
+		   void *app, enum bng_re_dpi_type type);
+int bng_re_dealloc_dpi(struct bng_re_res *res,
+		     struct bng_re_dpi *dpi);
 #endif
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.c b/drivers/infiniband/hw/bng_re/bng_verbs.c
index 25996133c83d..ef2b5bd65e54 100644
--- a/drivers/infiniband/hw/bng_re/bng_verbs.c
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.c
@@ -198,3 +198,222 @@ int bng_re_process_mad(struct ib_device *ibdev, int process_mad_flags,
 {
 	return IB_MAD_RESULT_FAILURE;
 }
+
+static struct bng_re_user_mmap_entry*
+bng_re_mmap_entry_insert(struct bng_re_ucontext *uctx, u64 cpu_addr,
+			 dma_addr_t dma_addr, u8 user_mmap_hint, u64 *offset)
+{
+	struct bng_re_user_mmap_entry *entry;
+	int ret;
+
+	entry = kzalloc_obj(*entry, GFP_KERNEL);
+	if (!entry)
+		return NULL;
+
+	entry->cpu_addr = cpu_addr;
+	entry->dma_addr = dma_addr;
+	entry->uctx	= uctx;
+	entry->mmap_flag = user_mmap_hint;
+
+	switch (user_mmap_hint) {
+	case BNG_RE_MMAP_UC_DB:
+		ret = rdma_user_mmap_entry_insert_range(&uctx->ib_uctx,
+							&entry->rdma_entry,
+							PAGE_SIZE, 0xF, U32_MAX);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		kfree(entry);
+		return NULL;
+	}
+
+	dev_dbg(rdev_to_dev(uctx->rdev),
+		"%s %d uctx->ib_uctx 0x%lx cpu 0x%lx dma 0x%lx mmap hint %s offset 0x%lx\n",
+		__func__, __LINE__, (unsigned long)&uctx->ib_uctx,
+		(unsigned long)entry->cpu_addr, (unsigned long)entry->dma_addr,
+		bng_re_mmap_str(user_mmap_hint),
+		(unsigned long)rdma_user_mmap_get_offset(&entry->rdma_entry));
+
+	if (offset)
+		*offset = rdma_user_mmap_get_offset(&entry->rdma_entry);
+
+	return entry;
+}
+
+static int bng_re_get_user_dpi(struct bng_re_dev *rdev,
+			       struct bng_re_ucontext *cntx)
+{
+	int ret = 0;
+	u8 type;
+
+	type = BNG_RE_DPI_TYPE_UC;
+	ret = bng_re_alloc_dpi(&rdev->bng_res, &cntx->dpi, cntx, type);
+	if (ret)
+		dev_err(rdev_to_dev(rdev), "Alloc doorbell page failed!");
+
+	return ret;
+}
+
+int bng_re_alloc_ucontext(struct ib_ucontext *ctx, struct ib_udata *udata)
+{
+	struct ib_device *ibdev = ctx->device;
+	struct bng_re_ucontext *uctx =
+		container_of(ctx, struct bng_re_ucontext, ib_uctx);
+	struct bng_re_dev *rdev = to_bng_re_dev(ibdev, ibdev);
+	struct bng_re_dev_attr *dev_attr = rdev->dev_attr;
+	struct bng_re_user_mmap_entry *is_entry;
+	struct bng_re_uctx_resp resp = {};
+	struct bng_re_uctx_req ureq = {};
+	u32 chip_met_rev_num = 0;
+	int rc;
+
+	ibdev_dbg(ibdev, "ABI version requested %u", ibdev->ops.uverbs_abi_ver);
+
+	if (ibdev->ops.uverbs_abi_ver != BNG_RE_ABI_VERSION) {
+		ibdev_dbg(ibdev, " is different from the device %d ",
+			  BNG_RE_ABI_VERSION);
+		return -EPERM;
+	}
+
+	uctx->rdev = rdev;
+
+	rc = bng_re_get_user_dpi(rdev, uctx);
+	if (rc) {
+		ibdev_dbg(ibdev, "user DPI alloc failed");
+		return rc;
+	}
+
+	resp.dpi = uctx->dpi.dpi;
+	is_entry = bng_re_mmap_entry_insert(uctx,
+					    (u64)uctx->dpi.umdbr, 0,
+					    BNG_RE_MMAP_UC_DB,
+					    &resp.uc_db_mmap_key);
+	if (!is_entry) {
+		rc = -ENOMEM;
+		goto err_entry_insert;
+	}
+	uctx->uc_db_mmap = &is_entry->rdma_entry;
+
+	resp.comp_mask = BNG_RE_UCNTX_CMASK_HAVE_CCTX;
+	chip_met_rev_num = rdev->chip_ctx->chip_num;
+	chip_met_rev_num |= ((u32)rdev->chip_ctx->chip_rev & 0xFF) <<
+			     BNG_RE_CHIP_REV_SFT;
+	chip_met_rev_num |= ((u32)rdev->chip_ctx->chip_metal & 0xFF) <<
+			     BNG_RE_CHIP_MET_SFT;
+	resp.chip_id = chip_met_rev_num;
+	resp.dev_id = rdev->aux_dev->pdev->devfn;
+	resp.max_qp = rdev->dev_attr->max_qp;
+	resp.cqe_sz = sizeof(struct cq_base);
+	resp.max_cqd = dev_attr->max_cq_wqes;
+
+	if (udata->inlen >= sizeof(ureq)) {
+		rc = ib_copy_from_udata(&ureq, udata, min(udata->inlen, sizeof(ureq)));
+		if (rc)
+			goto copy_udata_fail;
+		if (ureq.comp_mask & BNG_RE_COMP_MASK_REQ_UCNTX_POW2_SUPPORT)
+			resp.comp_mask |= BNG_RE_UCNTX_CMASK_POW2_DISABLED;
+
+		if (ureq.comp_mask & BNG_RE_COMP_MASK_REQ_UCNTX_RSVD_WQE)
+			resp.comp_mask |= BNG_RE_UCNTX_CMASK_RSVD_WQE_DISABLED;
+	}
+
+	uctx->cmask = (uint64_t)resp.comp_mask;
+
+	rc = ib_copy_to_udata(udata, &resp, min(udata->outlen, sizeof(resp)));
+	if (rc) {
+		ibdev_err(ibdev, "Failed to copy user context");
+		rc = -EFAULT;
+		goto copy_udata_fail;
+	}
+
+	return 0;
+
+copy_udata_fail:
+	rdma_user_mmap_entry_remove(uctx->uc_db_mmap);
+	uctx->uc_db_mmap = NULL;
+err_entry_insert:
+	bng_re_dealloc_dpi(&rdev->bng_res, &uctx->dpi);
+	return rc;
+}
+
+void bng_re_disassociate_ucontext(struct ib_ucontext *ibcontext)
+{
+}
+
+void bng_re_dealloc_ucontext(struct ib_ucontext *ib_uctx)
+{
+	struct bng_re_ucontext *uctx = container_of(ib_uctx,
+						    struct bng_re_ucontext,
+						    ib_uctx);
+	struct bng_re_dev *rdev = uctx->rdev;
+	int rc;
+
+	rdma_user_mmap_entry_remove(uctx->uc_db_mmap);
+	uctx->uc_db_mmap = NULL;
+	rc = bng_re_dealloc_dpi(&rdev->bng_res, &uctx->dpi);
+	if (rc)
+		dev_err(rdev_to_dev(rdev), "Deallocate DPI failed");
+	uctx->dpi.dbr = NULL;
+}
+
+int bng_re_mmap(struct ib_ucontext *ib_uctx, struct vm_area_struct *vma)
+{
+	struct bng_re_user_mmap_entry *bng_entry;
+	struct rdma_user_mmap_entry *rdma_entry;
+	int ret = 0;
+	u64 pfn;
+
+	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
+		return -EINVAL;
+
+	rdma_entry = rdma_user_mmap_entry_get(ib_uctx, vma);
+	if (!rdma_entry)
+		return -EINVAL;
+
+	bng_entry = container_of(rdma_entry, struct bng_re_user_mmap_entry,
+				  rdma_entry);
+
+	switch (bng_entry->mmap_flag) {
+	case BNG_RE_MMAP_WC_DB:
+		pfn = bng_entry->cpu_addr >> PAGE_SHIFT;
+		ret = rdma_user_mmap_io(ib_uctx, vma, pfn, PAGE_SIZE,
+					pgprot_writecombine(vma->vm_page_prot),
+					rdma_entry);
+		break;
+	case BNG_RE_MMAP_UC_DB:
+		pfn = bng_entry->cpu_addr >> PAGE_SHIFT;
+		ret = rdma_user_mmap_io(ib_uctx, vma, pfn, PAGE_SIZE,
+					pgprot_noncached(vma->vm_page_prot),
+					rdma_entry);
+		break;
+	case BNG_RE_MMAP_DBR_PAGE:
+	case BNG_RE_MMAP_TOGGLE_PAGE:
+		/* Driver doesn't expect write access for user space */
+		if (vma->vm_flags & VM_WRITE)
+			ret = -EFAULT;
+		else
+			ret = vm_insert_page(vma, vma->vm_start,
+					     virt_to_page((void *)bng_entry->cpu_addr));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	rdma_user_mmap_entry_put(rdma_entry);
+	return ret;
+}
+
+void bng_re_mmap_free(struct rdma_user_mmap_entry *rdma_entry)
+{
+	struct bng_re_user_mmap_entry *bng_entry;
+
+	bng_entry = container_of(rdma_entry, struct bng_re_user_mmap_entry,
+				  rdma_entry);
+
+	kfree(bng_entry);
+}
diff --git a/drivers/infiniband/hw/bng_re/bng_verbs.h b/drivers/infiniband/hw/bng_re/bng_verbs.h
index 5875ec565ea4..565571b2f1fe 100644
--- a/drivers/infiniband/hw/bng_re/bng_verbs.h
+++ b/drivers/infiniband/hw/bng_re/bng_verbs.h
@@ -10,6 +10,22 @@
 #include "bng_sp.h"
 #include "bng_re.h"
 
+struct bng_re_ucontext {
+	struct ib_ucontext      ib_uctx;
+	struct bng_re_dev	*rdev;
+	struct bng_re_dpi	dpi;
+	struct rdma_user_mmap_entry *uc_db_mmap;
+	u64			cmask;
+};
+
+struct bng_re_user_mmap_entry {
+	struct rdma_user_mmap_entry rdma_entry;
+	struct bng_re_ucontext *uctx;
+	dma_addr_t dma_addr;
+	u64 cpu_addr;
+	u8 mmap_flag;
+};
+
 int bng_re_query_device(struct ib_device *ibdev, struct ib_device_attr *ib_attr,
 			struct ib_udata *udata);
 int bng_re_modify_device(struct ib_device *ibdev, int device_modify_mask,
@@ -26,5 +42,11 @@ int bng_re_process_mad(struct ib_device *ibdev, int mad_flags,
 		       const struct ib_grh *in_grh,
 		       const struct ib_mad *in_mad, struct ib_mad *out_mad,
 		       size_t *out_mad_size, u16 *out_mad_pkey_index);
+int bng_re_alloc_ucontext(struct ib_ucontext *ctx, struct ib_udata *udata);
+void bng_re_dealloc_ucontext(struct ib_ucontext *context);
+void bng_re_disassociate_ucontext(struct ib_ucontext *ibcontext);
+int bng_re_mmap(struct ib_ucontext *context, struct vm_area_struct *vma);
+void bng_re_mmap_free(struct rdma_user_mmap_entry *rdma_entry);
+
 #endif /* __BNG_RE_VERBS_H__ */
 
diff --git a/include/uapi/rdma/bng_re-abi.h b/include/uapi/rdma/bng_re-abi.h
index cea056dc8610..14d56a88def4 100644
--- a/include/uapi/rdma/bng_re-abi.h
+++ b/include/uapi/rdma/bng_re-abi.h
@@ -9,4 +9,35 @@
 
 #define BNG_RE_ABI_VERSION	1
 
+#define BNG_RE_CHIP_NUM_SFT		0x00
+#define BNG_RE_CHIP_REV_SFT		0x10
+#define BNG_RE_CHIP_MET_SFT		0x18
+
+enum {
+	BNG_RE_UCNTX_CMASK_HAVE_CCTX = 0x1ULL,
+	BNG_RE_UCNTX_CMASK_POW2_DISABLED = 0x02ULL,
+	BNG_RE_UCNTX_CMASK_RSVD_WQE_DISABLED = 0x04ULL,
+	BNG_RE_UCNTX_CMASK_INTERNAL_QUEUE_MEMORY = 0x08ULL,
+};
+
+enum {
+	BNG_RE_COMP_MASK_REQ_UCNTX_POW2_SUPPORT = 0x01,
+	BNG_RE_COMP_MASK_REQ_UCNTX_RSVD_WQE = 0x02,
+};
+
+struct bng_re_uctx_req {
+	__aligned_u64 comp_mask;
+};
+
+struct bng_re_uctx_resp {
+	__u32 dev_id;
+	__u32 max_qp;
+	__u32 cqe_sz;
+	__u32 max_cqd;
+	__aligned_u64 comp_mask;
+	__u32 chip_id;
+	__u32 dpi;
+	__u64 uc_db_mmap_key;
+};
+
 #endif /* __BNG_RE_UVERBS_ABI_H__*/
-- 
2.43.5

