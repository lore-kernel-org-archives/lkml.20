Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB48487CCB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182582; cv=none; b=lAL5fHzPHG3ikJ3NKNUq3TVmbTASOzXGOCBf5sfb7Gr30lnQNsHfOA5lrCTqTVr5Qv2kCLBdUj5mQh5rqUJTk198cf1HSF2CDGN9v/390FP19DhgzV/8FVeUmJykR+Z9X1kRgmmJaCtZFMOBxXVsxD7ahJO3hrkrTMi3BPbJr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182582; c=relaxed/simple;
	bh=TlP0wOVMOXo/UIn1d4sHog6HFQRotbChqrMb0P8a9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8aHz750p6OpERml2dtHAF6s55VI+xKIzNTDBTs6pGfenH2t2pPHzuPw87m6ynIq7B6L8glNXJ6JFF6qs1oiDwKScXBFM2JKtn5FDApucdW9bYLF7N+nvqINmHzi1OwAk5NLyHsvrFAZZMdHO6h2DtztdcSf9fj1BFDfO93cmc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=msiVIqG/; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="msiVIqG/"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e67a6b3633so95085e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792182577; x=1792787377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuCfj3iMbghDhwY21WNaRDWTcHAAIvp5T80dk46fqZs=;
        b=msiVIqG/umHI0Bqg7AIioRoQYL3yxbHSvM5ltQumfwxVV3DEqCeg+DVYKYpoxNiWBH
         MFvjPjHXyTq4pAj0b6gsvZW8/OhbeqkLZjBHe4JMseOlDUbkgKTSlf1ukJNgXFbzrc0q
         AQbwjDhtEFcqm74LnA3gZtn0/o19wcAI88G5gVnmD2/QIPZB3VhkzFqVnX6Z6DLitqZF
         J9piS6BuvtVVonbmjUr1dhvuPpEEA2f7k2wuZi27ZGpcGggdqapTceLI066KxPcEzBUH
         kbVUPTw7GOEZsaiJWSkHOfp+jEfJirHzLv2Xz3iDS4wx3ydT0Cc55vlkmS3xwqQU9DAD
         xQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182577; x=1792787377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fuCfj3iMbghDhwY21WNaRDWTcHAAIvp5T80dk46fqZs=;
        b=QnZrNLiRm/V4yumZrwEEE34jQPLvV00zcxoozZaJ1jFnNTHHZ53KbMuYV1gedfYwPr
         sy4Oj0UNbyY8tfwfuozZfBMvonPjOMnaun4KNjC8RA1sPkHWQ6OQm3LsMXlFB1fNYh64
         YSK7CBARR6k8qlUSe/a8UCUopjHfxv6lzClhP5h7mHcBSaa/sxrHgt4wj6Nr0jbYm6L+
         YloZ3h5IzkqPKAdgDOsgkNfLAgn6IzPkymalgNcdvAKnamvgwLVJoaOprMcCk4OM7J4s
         bQphLBr/OXVcZJba4agtY/wWnEiSu4hsKExNsqmweaNxRQt2/OGnB8wtaFgzJ0LJEMQL
         uIVw==
X-Forwarded-Encrypted: i=1; AKwUvByyBsu8ovTzoRNbaYbt36JqEbkF9M1rXKekUxPR+7xTWWe3GvH2FlXBuibMkY7hwzC/IsoxAhSf94UDF9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7OcM3lq5rZQdtWicLU78Y3lGEz7RacoKla1pbZPJ7wGgnZ02F
	rpPmZrpW3AsW2OfIYcvKWIKiquCWI/WGvHbEEtDOjNwGBDY0El/CjTPzdGL5EWYhmbuuA1CuIjp
	lFmJc6A==
X-Gm-Gg: AYBFou0H+UPjO0kesDiUGuhoQ7GnnlbnN8g3diG5TfiuElNh0u6gGBlI8cMMgRgEYF8
	mqBQDbcs2zybQtDqlkU9N1SsaIHYMtCnmm1ZXXWmuvDkEIvVqAPlM9RITEuHqm7wPCRmV2mWXTy
	az0P2fKv3GCDTvJ1sHDpuYnfSsoxI3Idydw4Lmtyo86OJErNNdP47VWUYgGL0+T4nvyeTnUGm+D
	0YiUAysj9G/Eo5Jmq3G4B4IgGNDoiUbEaowVif+woTrh8uZPh+q+DOqO5GKvPynCTsDGPLEXxFn
	ct6VlsF/QtZOyuHnL3/6bIBv9BxcwIKLetnXP0yCSkBEloOgHy2d/7P/3y6FWvBPymKfN8IfcnB
	hvMQcpSxYulrb2lPQ3C79Y9tXV+5iVNh1lJJxVxhZvP5Nbu2edzVfCk2nRBIA0AECSYVqKeYK2i
	erDqWjhZYVORkqyFGGcWec2wdAhBiilfMPLkPtTWaJRGBK0RndaFk5/QnbHbgADQPcar6GGmG7H
	lliY/muuIzkt+U0riAiMCje+FgN6OR7iDfUMmxM2xR9PHtSz9p2x0nxUP+rWDUmkkdnXLFFmXkx
	3R3thBcElP0laKC0YzFe
X-Received: by 2002:a05:6122:c1c4:b0:5c9:a60b:e5c9 with SMTP id 71dfb90a1353d-5eaaa4181a4mr428285e0c.12.1792182577017;
        Fri, 16 Oct 2026 13:29:37 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b5201b1sm2588281e0c.12.2026.10.16.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:29:35 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v3 4/6] RDMA/irdma: Split CQ setup to umode and kmode
Date: Fri, 16 Oct 2026 20:29:07 +0000
Message-ID: <20261016202909.1289496-5-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016202909.1289496-1-dhu@x6u.co>
References: <20261016202909.1289496-1-dhu@x6u.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

Add user mode cq callback `irdma_create_user_cq()` to separate out user
mode creation logic from kernel mode cq.

Original common setup logic is broken into shared helper routines, so
duplicate code can be avoided. Core creation logic is preserved to be
identical to original routine, however.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 416 +++++++++++++++++-----------
 1 file changed, 252 insertions(+), 164 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index ab25445f3828..4b7e9c2d9cff 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -2624,41 +2624,198 @@ static inline int cq_validate_flags(u32 flags, u8 hw_rev)
 	return flags & ~IB_UVERBS_CQ_FLAGS_TIMESTAMP_COMPLETION ? -EOPNOTSUPP : 0;
 }
 
-/**
- * irdma_create_cq - create cq
- * @ibcq: CQ allocated
- * @attr: attributes for cq
- * @attrs: uverbs attribute bundle
- */
-static int irdma_create_cq(struct ib_cq *ibcq,
-			   const struct ib_cq_init_attr *attr,
-			   struct uverbs_attr_bundle *attrs)
+static int __irdma_create_cq(struct irdma_device *iwdev,
+			     struct irdma_cq *iwcq,
+			     struct irdma_cq_init_info *info,
+			     struct ib_udata *udata)
 {
-#define IRDMA_CREATE_CQ_MIN_RESP_LEN offsetofend(struct irdma_create_cq_resp, cq_size)
-	struct ib_udata *udata = &attrs->driver_udata;
-	struct ib_device *ibdev = ibcq->device;
-	struct irdma_device *iwdev = to_iwdev(ibdev);
 	struct irdma_pci_f *rf = iwdev->rf;
-	struct irdma_cq *iwcq = to_iwcq(ibcq);
-	u32 cq_num = 0;
-	struct irdma_sc_cq *cq;
-	struct irdma_sc_dev *dev = &rf->sc_dev;
-	struct irdma_cq_init_info info = {};
 	struct irdma_cqp_request *cqp_request;
+	struct irdma_sc_cq *cq = &iwcq->sc_cq;
 	struct cqp_cmds_info *cqp_info;
-	struct irdma_cq_uk_init_info *ukinfo = &info.cq_uk_init_info;
-	unsigned long flags;
 	int err_code;
+
+	info->shadow_read_threshold = min(info->cq_uk_init_info.cq_size / 2,
+					  (u32)IRDMA_MAX_CQ_READ_THRESH);
+
+	if (irdma_sc_cq_init(cq, info)) {
+		ibdev_dbg(&iwdev->ibdev, "VERBS: init cq fail\n");
+		err_code = -EPROTO;
+		goto cq_free_rsrc;
+	}
+
+	cqp_request = irdma_alloc_and_get_cqp_request(&rf->cqp, true);
+	if (!cqp_request) {
+		err_code = -ENOMEM;
+		goto cq_free_rsrc;
+	}
+
+	cqp_info = &cqp_request->info;
+	cqp_info->cqp_cmd = IRDMA_OP_CQ_CREATE;
+	cqp_info->post_sq = 1;
+	cqp_info->in.u.cq_create.cq = cq;
+	cqp_info->in.u.cq_create.check_overflow = true;
+	cqp_info->in.u.cq_create.scratch = (uintptr_t)cqp_request;
+	err_code = irdma_handle_cqp_op(rf, cqp_request);
+	irdma_put_cqp_request(&rf->cqp, cqp_request);
+	if (err_code)
+		goto cq_free_rsrc;
+
+	if (udata) {
+		struct irdma_create_cq_resp resp = {};
+
+		resp.cq_id = info->cq_uk_init_info.cq_id;
+		resp.cq_size = info->cq_uk_init_info.cq_size;
+		err_code = ib_respond_udata(udata, resp);
+		if (err_code)
+			goto cq_destroy;
+	}
+
+	init_completion(&iwcq->free_cq);
+
+	/* Populate table entry after CQ is fully created. */
+	smp_store_release(&rf->cq_table[iwcq->cq_num], iwcq);
+
+	return 0;
+cq_destroy:
+	irdma_cq_wq_destroy(rf, cq);
+cq_free_rsrc:
+	irdma_cq_free_rsrc(rf, iwcq);
+
+	return err_code;
+}
+
+static int irdma_setup_kmode_cq(struct irdma_device *iwdev,
+				struct irdma_cq *iwcq,
+				struct irdma_cq_init_info *info,
+				const struct ib_cq_init_attr *attr)
+{
+	struct irdma_cq_uk_init_info *ukinfo = &info->cq_uk_init_info;
+	struct irdma_pci_f *rf = iwdev->rf;
+	struct irdma_sc_dev *dev = &rf->sc_dev;
 	int entries = attr->cqe;
 	bool cqe_64byte_ena;
 	u8 cqe_size;
+	int rsize;
 
-	err_code = cq_validate_flags(attr->flags, dev->hw_attrs.uk_attrs.hw_rev);
+	cqe_64byte_ena = dev->hw_attrs.uk_attrs.feature_flags & IRDMA_FEATURE_64_BYTE_CQE ?
+			 true : false;
+	cqe_size = cqe_64byte_ena ? 64 : 32;
+
+	entries += 2;
+	if (!cqe_64byte_ena && dev->hw_attrs.uk_attrs.hw_rev >= IRDMA_GEN_2)
+		entries *= 2;
+
+	if (entries & 1)
+		entries += 1; /* cq size must be an even number */
+
+	if (entries * cqe_size == IRDMA_HW_PAGE_SIZE)
+		entries += 2;
+
+	ukinfo->cq_size = entries;
+
+	if (cqe_64byte_ena)
+		rsize = ukinfo->cq_size * sizeof(struct irdma_extended_cqe);
+	else
+		rsize = ukinfo->cq_size * sizeof(struct irdma_cqe);
+	iwcq->kmem.size = ALIGN(round_up(rsize, 256), 256);
+	iwcq->kmem.va = dma_alloc_coherent(dev->hw->device,
+					   iwcq->kmem.size,
+					   &iwcq->kmem.pa, GFP_KERNEL);
+	if (!iwcq->kmem.va)
+		return -ENOMEM;
+
+	iwcq->kmem_shadow.size = ALIGN(IRDMA_SHADOW_AREA_SIZE << 3, 64);
+	iwcq->kmem_shadow.va = dma_alloc_coherent(dev->hw->device,
+						  iwcq->kmem_shadow.size,
+						  &iwcq->kmem_shadow.pa,
+						  GFP_KERNEL);
+	if (!iwcq->kmem_shadow.va)
+		return -ENOMEM;
+
+	info->shadow_area_pa = iwcq->kmem_shadow.pa;
+	ukinfo->shadow_area = iwcq->kmem_shadow.va;
+	ukinfo->cq_base = iwcq->kmem.va;
+	info->cq_base_pa = iwcq->kmem.pa;
+
+	return 0;
+}
+
+static int irdma_setup_umode_cq(struct irdma_device *iwdev,
+				struct irdma_cq *iwcq,
+				struct irdma_cq_init_info *info,
+				struct uverbs_attr_bundle *attrs)
+{
+	struct ib_udata *udata = &attrs->driver_udata;
+	struct irdma_create_cq_req req = {};
+	struct irdma_pci_f *rf = iwdev->rf;
+	struct irdma_ucontext *ucontext;
+	struct irdma_cq_mr *cqmr_shadow;
+	struct irdma_cq_mr *cqmr;
+	unsigned long flags;
+	int err_code;
+
+	iwcq->user_mode = true;
+	ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
+					     ibucontext);
+	/* Even though the last member of struct irdma_create_cq_req
+	 * was always user_shadow_area, we need backwards compat with
+	 * the legacy i40iw struct i40iw_ucreate_cq which stopped
+	 * at user_cq_buffer.
+	 */
+	err_code = ib_copy_validate_udata_in(udata, req, user_cq_buf);
 	if (err_code)
 		return err_code;
 
-	if (udata && udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN)
-		return -EINVAL;
+	spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
+	iwcq->iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
+				    &ucontext->cq_reg_mem_list);
+	spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+	if (!iwcq->iwpbl)
+		return -EPROTO;
+
+	cqmr = &iwcq->iwpbl->cq_mr;
+
+	if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
+	    IRDMA_FEATURE_CQ_RESIZE) {
+		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
+		iwcq->iwpbl_shadow =
+			irdma_get_pbl((unsigned long)req.user_shadow_area,
+				      &ucontext->cq_reg_mem_list);
+		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+
+		if (!iwcq->iwpbl_shadow)
+			return -EPROTO;
+
+		cqmr_shadow = &iwcq->iwpbl_shadow->cq_mr;
+		info->shadow_area_pa = cqmr_shadow->cq_pbl.addr;
+	} else {
+		info->shadow_area_pa = cqmr->shadow;
+	}
+	if (iwcq->iwpbl->pbl_allocated) {
+		info->virtual_map = true;
+		info->pbl_chunk_size = 1;
+		info->first_pm_pbl_idx = cqmr->cq_pbl.idx;
+	} else {
+		info->cq_base_pa = cqmr->cq_pbl.addr;
+	}
+
+	return 0;
+}
+
+static int irdma_alloc_cq(struct irdma_device *iwdev,
+			  struct irdma_cq *iwcq,
+			  const struct ib_cq_init_attr *attr,
+			  struct irdma_cq_init_info *info)
+{
+	struct irdma_cq_uk_init_info *ukinfo = &info->cq_uk_init_info;
+	struct irdma_pci_f *rf = iwdev->rf;
+	struct irdma_sc_dev *dev = &rf->sc_dev;
+	int entries = attr->cqe;
+	struct irdma_sc_cq *cq;
+	bool cqe_64byte_ena;
+	u32 cq_num = 0;
+	int err_code;
 
 	err_code = irdma_alloc_rsrc(rf, rf->allocated_cqs, rf->max_cq, &cq_num,
 				    &rf->next_cq);
@@ -2674,169 +2831,99 @@ static int irdma_create_cq(struct ib_cq *ibcq,
 	iwcq->cq_num = cq_num;
 	iwcq->iwpbl = NULL;
 	iwcq->iwpbl_shadow = NULL;
-	info.dev = dev;
+	info->dev = dev;
 	ukinfo->cq_size = max(entries, 4);
 	ukinfo->cq_id = cq_num;
 	cqe_64byte_ena = dev->hw_attrs.uk_attrs.feature_flags & IRDMA_FEATURE_64_BYTE_CQE ?
 			 true : false;
-	cqe_size = cqe_64byte_ena ? 64 : 32;
 	ukinfo->avoid_mem_cflct = cqe_64byte_ena;
-	iwcq->ibcq.cqe = info.cq_uk_init_info.cq_size;
+	iwcq->ibcq.cqe = ukinfo->cq_size;
 	if (attr->comp_vector < rf->ceqs_count)
-		info.ceq_id = attr->comp_vector;
-	info.ceq_id_valid = true;
-	info.ceqe_mask = 1;
-	info.type = IRDMA_CQ_TYPE_IWARP;
-	info.vsi = &iwdev->vsi;
-
-	if (udata) {
-		struct irdma_ucontext *ucontext;
-		struct irdma_create_cq_req req = {};
-		struct irdma_cq_mr *cqmr;
-		struct irdma_cq_mr *cqmr_shadow;
-
-		iwcq->user_mode = true;
-		ucontext =
-			rdma_udata_to_drv_context(udata, struct irdma_ucontext,
-						  ibucontext);
-		/* Even though the last member of struct irdma_create_cq_req
-		 * was always user_shadow_area, we need backwards compat with
-		 * the legacy i40iw struct i40iw_ucreate_cq which stopped
-		 * at user_cq_buffer.
-		 */
-		err_code = ib_copy_validate_udata_in(udata, req, user_cq_buf);
-		if (err_code)
-			goto cq_free_rsrc;
-
-		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
-		iwcq->iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
-					    &ucontext->cq_reg_mem_list);
-		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
-		if (!iwcq->iwpbl) {
-			err_code = -EPROTO;
-			goto cq_free_rsrc;
-		}
+		info->ceq_id = attr->comp_vector;
+	info->ceq_id_valid = true;
+	info->ceqe_mask = 1;
+	info->type = IRDMA_CQ_TYPE_IWARP;
+	info->vsi = &iwdev->vsi;
 
-		cqmr = &iwcq->iwpbl->cq_mr;
-
-		if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
-		    IRDMA_FEATURE_CQ_RESIZE) {
-			spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
-			iwcq->iwpbl_shadow = irdma_get_pbl(
-					(unsigned long)req.user_shadow_area,
-					&ucontext->cq_reg_mem_list);
-			spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+	return 0;
+}
 
-			if (!iwcq->iwpbl_shadow) {
-				err_code = -EPROTO;
-				goto cq_free_rsrc;
-			}
-			cqmr_shadow = &iwcq->iwpbl_shadow->cq_mr;
-			info.shadow_area_pa = cqmr_shadow->cq_pbl.addr;
-		} else {
-			info.shadow_area_pa = cqmr->shadow;
-		}
-		if (iwcq->iwpbl->pbl_allocated) {
-			info.virtual_map = true;
-			info.pbl_chunk_size = 1;
-			info.first_pm_pbl_idx = cqmr->cq_pbl.idx;
-		} else {
-			info.cq_base_pa = cqmr->cq_pbl.addr;
-		}
-	} else {
-		/* Kmode allocations */
-		int rsize;
+/**
+ * irdma_create_user_cq - create user cq
+ * @ibcq: CQ allocated
+ * @attr: attributes for cq
+ * @attrs: uverbs attribute bundle
+ */
+static int irdma_create_user_cq(struct ib_cq *ibcq,
+				const struct ib_cq_init_attr *attr,
+				struct uverbs_attr_bundle *attrs)
+{
+#define IRDMA_CREATE_CQ_MIN_RESP_LEN offsetofend(struct irdma_create_cq_resp, cq_size)
+	struct ib_udata *udata = &attrs->driver_udata;
+	struct ib_device *ibdev = ibcq->device;
+	struct irdma_device *iwdev = to_iwdev(ibdev);
+	struct irdma_pci_f *rf = iwdev->rf;
+	struct irdma_cq *iwcq = to_iwcq(ibcq);
+	struct irdma_sc_dev *dev = &rf->sc_dev;
+	struct irdma_cq_init_info info = {};
+	int err_code;
 
-		if (entries < 1 || entries > rf->max_cqe) {
-			err_code = -EINVAL;
-			goto cq_free_rsrc;
-		}
+	err_code = cq_validate_flags(attr->flags, dev->hw_attrs.uk_attrs.hw_rev);
+	if (err_code)
+		return err_code;
 
-		entries += 2;
-		if (!cqe_64byte_ena && dev->hw_attrs.uk_attrs.hw_rev >= IRDMA_GEN_2)
-			entries *= 2;
+	if (udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN)
+		return -EINVAL;
 
-		if (entries & 1)
-			entries += 1; /* cq size must be an even number */
+	err_code = irdma_alloc_cq(iwdev, iwcq, attr, &info);
+	if (err_code)
+		return err_code;
 
-		if (entries * cqe_size == IRDMA_HW_PAGE_SIZE)
-			entries += 2;
+	err_code = irdma_setup_umode_cq(iwdev, iwcq, &info, attrs);
+	if (err_code)
+		goto cq_free_rsrc;
 
-		ukinfo->cq_size = entries;
+	return __irdma_create_cq(iwdev, iwcq, &info, udata);
+cq_free_rsrc:
+	irdma_cq_free_rsrc(rf, iwcq);
 
-		if (cqe_64byte_ena)
-			rsize = info.cq_uk_init_info.cq_size * sizeof(struct irdma_extended_cqe);
-		else
-			rsize = info.cq_uk_init_info.cq_size * sizeof(struct irdma_cqe);
-		iwcq->kmem.size = ALIGN(round_up(rsize, 256), 256);
-		iwcq->kmem.va = dma_alloc_coherent(dev->hw->device,
-						   iwcq->kmem.size,
-						   &iwcq->kmem.pa, GFP_KERNEL);
-		if (!iwcq->kmem.va) {
-			err_code = -ENOMEM;
-			goto cq_free_rsrc;
-		}
+	return err_code;
+}
 
-		iwcq->kmem_shadow.size = ALIGN(IRDMA_SHADOW_AREA_SIZE << 3,
-					       64);
-		iwcq->kmem_shadow.va = dma_alloc_coherent(dev->hw->device,
-							  iwcq->kmem_shadow.size,
-							  &iwcq->kmem_shadow.pa,
-							  GFP_KERNEL);
-		if (!iwcq->kmem_shadow.va) {
-			err_code = -ENOMEM;
-			goto cq_free_rsrc;
-		}
-		info.shadow_area_pa = iwcq->kmem_shadow.pa;
-		ukinfo->shadow_area = iwcq->kmem_shadow.va;
-		ukinfo->cq_base = iwcq->kmem.va;
-		info.cq_base_pa = iwcq->kmem.pa;
-	}
+/**
+ * irdma_create_cq - create kmode cq
+ * @ibcq: CQ allocated
+ * @attr: attributes for cq
+ * @attrs: uverbs attribute bundle
+ */
+static int irdma_create_cq(struct ib_cq *ibcq,
+			   const struct ib_cq_init_attr *attr,
+			   struct uverbs_attr_bundle *attrs)
+{
+	struct ib_device *ibdev = ibcq->device;
+	struct irdma_device *iwdev = to_iwdev(ibdev);
+	struct irdma_pci_f *rf = iwdev->rf;
+	struct irdma_cq *iwcq = to_iwcq(ibcq);
+	struct irdma_sc_dev *dev = &rf->sc_dev;
+	struct irdma_cq_init_info info = {};
+	int err_code;
 
-	info.shadow_read_threshold = min(info.cq_uk_init_info.cq_size / 2,
-					 (u32)IRDMA_MAX_CQ_READ_THRESH);
+	err_code = cq_validate_flags(attr->flags, dev->hw_attrs.uk_attrs.hw_rev);
+	if (err_code)
+		return err_code;
 
-	if (irdma_sc_cq_init(cq, &info)) {
-		ibdev_dbg(&iwdev->ibdev, "VERBS: init cq fail\n");
-		err_code = -EPROTO;
-		goto cq_free_rsrc;
-	}
+	if (attr->cqe > rf->max_cqe)
+		return -EINVAL;
 
-	cqp_request = irdma_alloc_and_get_cqp_request(&rf->cqp, true);
-	if (!cqp_request) {
-		err_code = -ENOMEM;
-		goto cq_free_rsrc;
-	}
+	err_code = irdma_alloc_cq(iwdev, iwcq, attr, &info);
+	if (err_code)
+		return err_code;
 
-	cqp_info = &cqp_request->info;
-	cqp_info->cqp_cmd = IRDMA_OP_CQ_CREATE;
-	cqp_info->post_sq = 1;
-	cqp_info->in.u.cq_create.cq = cq;
-	cqp_info->in.u.cq_create.check_overflow = true;
-	cqp_info->in.u.cq_create.scratch = (uintptr_t)cqp_request;
-	err_code = irdma_handle_cqp_op(rf, cqp_request);
-	irdma_put_cqp_request(&rf->cqp, cqp_request);
+	err_code = irdma_setup_kmode_cq(iwdev, iwcq, &info, attr);
 	if (err_code)
 		goto cq_free_rsrc;
 
-	if (udata) {
-		struct irdma_create_cq_resp resp = {};
-
-		resp.cq_id = info.cq_uk_init_info.cq_id;
-		resp.cq_size = info.cq_uk_init_info.cq_size;
-		err_code = ib_respond_udata(udata, resp);
-		if (err_code)
-			goto cq_destroy;
-	}
-
-	init_completion(&iwcq->free_cq);
-
-	/* Populate table entry after CQ is fully created. */
-	smp_store_release(&rf->cq_table[cq_num], iwcq);
-
-	return 0;
-cq_destroy:
-	irdma_cq_wq_destroy(rf, cq);
+	return __irdma_create_cq(iwdev, iwcq, &info, NULL);
 cq_free_rsrc:
 	irdma_cq_free_rsrc(rf, iwcq);
 
@@ -5666,6 +5753,7 @@ static const struct ib_device_ops irdma_dev_ops = {
 	.alloc_pd = irdma_alloc_pd,
 	.alloc_ucontext = irdma_alloc_ucontext,
 	.create_cq = irdma_create_cq,
+	.create_user_cq = irdma_create_user_cq,
 	.create_qp = irdma_create_qp,
 	.dealloc_driver = irdma_ib_dealloc_device,
 	.dealloc_mw = irdma_dealloc_mw,
-- 
2.56.0.176.g3575e65682-goog

