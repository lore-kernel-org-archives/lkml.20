Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384150;
	b=lG9Avz4vye9xgDyxuwyVndewYtum1QBhcKr3kV7DQ08W61iPXpDsLmSR20UzL1xGdS2+
	 dGIK2c7px5bPYyn2uXfTvV1lAO4wPBCUr7pcFpGLB0rCpMr9RiuGgJuK2fxPSXemJM5jx
	 vlAKIJKhXDcdRuJb+MEdnMxb6Xsso/QQ8/1RLoIXm5uppdy8xTRgrrr8pqsXCWWlKLEDR
	 RH8epgTtHeCSMGwtRwGmyKPFjfrM25iQ9uNuVm7apDSOARazRh0HlP9Ew+ajyJnV9cB9b
	 hiy7tf0w4YKtXEvQ0JvnbahGzxMZWHutxFf3vSV9d7ZxUxVWet2vHORZ5MYirPj/f4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zkionQZ0VbqPNgyFPnoBpRmBwDyjjH4K2FfrRrkvEio=;
	b=m8THR4RiKiWkZ6MI08wkxYc97nkkNp2sIVluL+ETOv8fq5+0XYz7uXWfp1eOxa+DHA/j
	 /5x3G6lxJRPrSCEZu/7tdiAfWDuyO4hRV0R28npg2ulK55XgyCmBZbLGeYMp17bg1lP3m
	 Wek0X+hwDmezNSON+dQx0no2NR/mqmPf9hRZjl75+CGxqfXky1MBuyp/lsmI3x27tFgsP
	 cRIZlvyesHWQeSewOnlQiXy5bn3/5IVaHf5fruuMUk106DlNqxKCqNk8OstSt/4yHJSrO
	 zBSzHvrc4Nk/aXvtdhfkZlF7ZkOnMyDbH87fR2K0pybI96yKiEFBSPoDOOy8BMM6E2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=aud992aq;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E89606A339
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E89606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=aud992aq
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9906870a9baso536584241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793384148; x=1793988948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkionQZ0VbqPNgyFPnoBpRmBwDyjjH4K2FfrRrkvEio=;
        b=aud992aq5AVt4ezoKSgxx3SFhCLwDj+0qCRkXHlM3mzifv2x0S7/IxlBIuG/QDBa7a
         +cqMYLSxurWNYKRlqgmyYckx6AlE9VjchPJef8lccJUFDN0V0+dGvvcdyBZDHJBHgeeE
         aha4vCvnT14gnAQWjyqOfn30Wmr72MDxS1Z+kzlCuidY3cZeIAmOtQ4hCkE7/FMQnwKi
         /jRgq9jkNkCGUoGeVJUhzpEBDUGMkPxoaYu2YZ0wP4jimQ4Y9M3yP5CG3XLu4elscFy0
         08V2LnI74d2XeCDEYMp74NJ/KaQC4TKMMjcLQIn3iIqVOfbm2YrDPyDFAcFRnO11ZWfo
         9weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384148; x=1793988948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zkionQZ0VbqPNgyFPnoBpRmBwDyjjH4K2FfrRrkvEio=;
        b=ovCWZksK5D9u8u8k+KX/4DfNgQNL9lZ9BawvSkhlVp3POK9XolV3f3ZyUEBTlPySWw
         bftnVHc6bAZFOTcAQuZKVbSOyJr0eDirsymSrcktbMi4ZejVVMhyGb/mAZqpjGC97TLy
         TFmFwiIoEGmwf/4u4NzljzrHLTZyVRuJJQQhAGvEhUIEnnhhMPSA9AT3EOW4Jzj8hXKO
         cJLeXTALcp/0r5xrhkJvO56BhkGxRORa1uT9YsjowYdC0WuX/OjezEkqeI/5h5hxkfJ/
         RA6iJgb15+CZjyP2W0am5T3uthkL+IR6VTFcZhFwXWERG4dIbMDIcrDwqkrheDgvJ7by
         ULUA==
X-Forwarded-Encrypted: i=1; AKwUvBy5bjsRGETMmdxqH0tK8XPef1mM/gVcfWmHGq1qyDsV9NhvYeGLBb1Bg69vMMgAQw91MyEwLgZrU8nIvWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGIM37Wrv3oLrZxHizlP9/uUA03FvwsQC7mlo/zTDxUtxvbE26
	7t7brizCsfVgDjewXkPfeCJlZK24Y8FWmJ2R92BsZBi/sgli4F8nvE3xx0Os4S+u6dyf
X-Gm-Gg: AYBFou0pGPhUfB/Zv2aW9lZeIYNt1+JF3wSJhHoMck2E1kSzJcjQADkY9tGJTH4U8N4
	ekVU0/ANPKyhGBP+95B+qQ+F1OTzSLw27ZUlqLgDZw5WF9fspsw//AnNPfgeLioyXX91/RjjSc/
	ccDjywKeVz0twWNQn2JTT2nNuUvNYLzAb4wMn6YjxSiFsnHpEBfiN5xyn+Y3dNZtLn/6X/XGx0/
	/UuQGs/2DkQiKaeydZDIAFI+eA/9iisabcCCHelFAB0A28Ro5a7R2DtYUEWqywfwrv/d8Nzzft4
	aypQZNatpsIgwWQ5OCU5eEzf424RxP3aEn07BBCXldQj/06D8zE0LxzC51mbtMIenAFkKfctBN6
	V0dUQb9fJjD9po1SaW4gOpF4cDGhZGJ/hf2++a7I1uBug/JweTMgsroG0I3iAe7YGemGNdKZhEQ
	M+PnwWoJCruV/Me2P3WeanV+DejS/BuR7lWJH/p1TSbmfbsFKH88Z9IMsKHsAvLwZnMknjd/G2J
	zuey53s2rPo/MUQpSZRMDQH3icEi7VLoFr/QOjL0L/KZuYkyaploZjONcnGNW1n6ChrBi14A/Xs
	JrdbNZZeJ2gttVaQO+vSJhKMwCuzJyaLOC9v1Im0+0DjMPz6Wl4ok3dE6r9s9bVr6qL3MkOJMGT
	/+u7by1KNMnrkPu4HvAJN9+sA8q9BlbTO+KXKKDrVYB0=
X-Received: by 2002:a05:6102:2906:b0:7d0:57e3:d480 with SMTP id ada2fe7eead31-7d072bc7545mr1865185137.11.1793384148439;
        Fri, 30 Oct 2026 11:15:48 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm3077931137.3.2026.10.30.11.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:15:47 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Moroni <jmoroni@google.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v4 3/6] RDMA/irdma: Support UMEM attribute for QP creation
Date: Fri, 30 Oct 2026 18:15:09 +0000
Message-ID: <20261030181512.2056056-4-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030181512.2056056-1-dhu@x6u.co>
References: <20261030181512.2056056-1-dhu@x6u.co>
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

From: David Hu <xuehaohu@google.com>

Support the standard 1-step queue buffer creation model for QP by using
`UVERBS_ATTR_CREATE_QP_BUF_UMEM` and `ib_umem_get_attr()`.

Add `irdma_setup_q_pbl_from_umem()` to allocate the backing MR and program
hardware pble directly from the pinned umem. Proper umem and pble cleanup
is added to `irdma_free_qp_rsrc()` upon QP destruction.

We retain backward compatibility for legacy 2-step registration if the
UMEM attribute is not provided.

`irdma_alloc_iwmr()` assumed there is always a valid PD, which is valid
for regular MR, and QP. That is not the case for CQ. This modernization
fixes `irdma_alloc_iwmr()` to take in an `ibdev` to avoid a potential
NULL dereference.

Note for MR teardown: This patch unifies the teardown of legacy 2-step
queue MR and modern 1-step dummy MR via,

`refcount_dec_and_test(&iwmr->user_ring_refs)`

For legacy queue MR, ref count starts at 2 (one by queue, and one by
`ib_mr`), it goes to 1 during queue teardown, while deferring memory
teardown to `irdma_dereg_mr`.

For 1-step dummy MR, ref count starts at 1, and teardown happens cleanly
here.

The teardown sequence (`ib_umem_release`, `irdma_free_pble`, `kfree`) is
inlined in `utils.c` here because `irdma_free_iwmr` is statically scoped
in `verbs.c`. Combining was considered, and we think it belongs to a
future project.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/utils.c |  12 ++-
 drivers/infiniband/hw/irdma/verbs.c | 132 +++++++++++++++++++++++++---
 2 files changed, 127 insertions(+), 17 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/utils.c b/drivers/infiniband/hw/irdma/utils.c
index 290ad02ed657..1e5694a4fd91 100644
--- a/drivers/infiniband/hw/irdma/utils.c
+++ b/drivers/infiniband/hw/irdma/utils.c
@@ -1170,9 +1170,15 @@ void irdma_free_qp_rsrc(struct irdma_qp *iwqp)
 	kfree(iwqp->kqp.rq_wrid_mem);
 
 	if (iwqp->user_mode && iwqp->iwpbl) {
-		struct irdma_mr *iwmr = iwqp->iwpbl->iwmr;
-
-		refcount_dec(&iwmr->user_ring_refs);
+		struct irdma_pbl *iwpbl = iwqp->iwpbl;
+		struct irdma_mr *iwmr = iwpbl->iwmr;
+
+		if (iwmr && refcount_dec_and_test(&iwmr->user_ring_refs)) {
+			ib_umem_release(iwmr->region);
+			if (iwpbl->pbl_allocated)
+				irdma_free_pble(rf->pble_rsrc, &iwpbl->pble_alloc);
+			kfree(iwmr);
+		}
 	}
 }
 
diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index dd824720671c..578c2d4b4d3c 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -18,6 +18,12 @@ static const struct uapi_definition irdma_uapi_defs[] = {
 	{}
 };
 
+static struct irdma_pbl *irdma_setup_q_pbl_from_umem(struct irdma_device *iwdev,
+						     struct ib_umem *region,
+						     struct ib_pd *pd,
+						     enum irdma_memreg_type reg_type,
+						     struct irdma_mem_reg_req *req);
+
 /**
  * irdma_query_device - get device attributes
  * @ibdev: device pointer from stack
@@ -670,17 +676,6 @@ static int irdma_setup_umode_qp(struct irdma_ucontext *ucontext,
 	iwqp->ctx_info.qp_compl_ctx = req->user_compl_ctx;
 	iwqp->user_mode = 1;
 
-	spin_lock_irqsave(&ucontext->qp_reg_mem_list_lock, flags);
-	iwqp->iwpbl = irdma_get_pbl((unsigned long)req->user_wqe_bufs,
-				    &ucontext->qp_reg_mem_list);
-	spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
-
-	if (!iwqp->iwpbl) {
-		ret = -ENODATA;
-		ibdev_dbg(&iwdev->ibdev, "VERBS: no pbl info\n");
-		return ret;
-	}
-
 	if (!ucontext->use_raw_attrs) {
 		/**
 		 * Maintain backward compat with older ABI which passes sq and
@@ -713,6 +708,52 @@ static int irdma_setup_umode_qp(struct irdma_ucontext *ucontext,
 		ukinfo->rq_size = ukinfo->rq_depth >> ukinfo->rq_shift;
 	}
 
+	if (attrs && uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_QP_BUF_UMEM)) {
+		struct irdma_mem_reg_req qp_req = {};
+		struct ib_umem *umem;
+		u32 total;
+
+		/* Legacy context does not provide depth info */
+		if (!ucontext->use_raw_attrs)
+			return -EOPNOTSUPP;
+
+		qp_req.sq_pages = DIV_ROUND_UP(ukinfo->sq_depth * IRDMA_QP_WQE_MIN_SIZE,
+					       IRDMA_HW_PAGE_SIZE);
+		/* In case srq is used, this will be a single page */
+		qp_req.rq_pages = DIV_ROUND_UP(ukinfo->rq_depth * IRDMA_QP_WQE_MIN_SIZE,
+					       IRDMA_HW_PAGE_SIZE);
+		total = qp_req.sq_pages + qp_req.rq_pages + IRDMA_SHADOW_PGCNT;
+
+		umem = ib_umem_get_attr(&iwdev->ibdev, attrs,
+					UVERBS_ATTR_CREATE_QP_BUF_UMEM,
+					total << IRDMA_HW_PAGE_SHIFT,
+					IB_ACCESS_LOCAL_WRITE);
+		if (IS_ERR(umem))
+			return PTR_ERR(umem);
+
+		iwqp->iwpbl = irdma_setup_q_pbl_from_umem(iwdev, umem,
+							  iwqp->ibqp.pd,
+							  IRDMA_MEMREG_TYPE_QP,
+							  &qp_req);
+		if (IS_ERR(iwqp->iwpbl)) {
+			ret = PTR_ERR(iwqp->iwpbl);
+			iwqp->iwpbl = NULL;
+			ib_umem_release(umem);
+			return ret;
+		}
+	} else {
+		spin_lock_irqsave(&ucontext->qp_reg_mem_list_lock, flags);
+		iwqp->iwpbl = irdma_get_pbl((unsigned long)req->user_wqe_bufs,
+					    &ucontext->qp_reg_mem_list);
+		spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
+
+		if (!iwqp->iwpbl) {
+			ret = -ENODATA;
+			ibdev_dbg(&iwdev->ibdev, "VERBS: no pbl info\n");
+			return ret;
+		}
+	}
+
 	irdma_setup_virt_qp(iwdev, iwqp, info);
 
 	return 0;
@@ -3460,6 +3501,7 @@ static int irdma_reg_user_mr_type_mem(struct irdma_mr *iwmr, int access,
 }
 
 static struct irdma_mr *irdma_alloc_iwmr(struct ib_umem *region,
+					 struct ib_device *ibdev,
 					 struct ib_pd *pd, u64 virt,
 					 enum irdma_memreg_type reg_type)
 {
@@ -3475,7 +3517,7 @@ static struct irdma_mr *irdma_alloc_iwmr(struct ib_umem *region,
 	iwpbl->iwmr = iwmr;
 	iwmr->region = region;
 	iwmr->ibmr.pd = pd;
-	iwmr->ibmr.device = pd->device;
+	iwmr->ibmr.device = ibdev;
 	iwmr->ibmr.iova = virt;
 	iwmr->type = reg_type;
 	iwmr->len = region->length;
@@ -3503,6 +3545,68 @@ static void irdma_free_iwmr(struct irdma_mr *iwmr)
 	kfree(iwmr);
 }
 
+static struct irdma_pbl *irdma_setup_q_pbl_from_umem(struct irdma_device *iwdev,
+						     struct ib_umem *region,
+						     struct ib_pd *pd,
+						     enum irdma_memreg_type reg_type,
+						     struct irdma_mem_reg_req *req)
+{
+	struct irdma_pbl *iwpbl;
+	struct irdma_mr *iwmr;
+	u32 total;
+	u8 lvl;
+	int err;
+
+	/* Catch page not starting on OS page boundary */
+	if (ib_umem_offset(region))
+		return ERR_PTR(-EINVAL);
+
+	/* iWarp: Reject queue dma-buf as it is not supported */
+	if (!rdma_protocol_roce(&iwdev->ibdev, 1) && region->is_dmabuf)
+		return ERR_PTR(-EINVAL);
+
+	iwmr = irdma_alloc_iwmr(region, &iwdev->ibdev, pd, region->address, reg_type);
+	if (IS_ERR(iwmr))
+		return ERR_CAST(iwmr);
+
+	iwpbl = &iwmr->iwpbl;
+
+	switch (reg_type) {
+	case IRDMA_MEMREG_TYPE_QP:
+		total = req->sq_pages + req->rq_pages + IRDMA_SHADOW_PGCNT;
+		lvl = (req->sq_pages + req->rq_pages) > 2 ? PBLE_LEVEL_1 : PBLE_LEVEL_0;
+		break;
+	case IRDMA_MEMREG_TYPE_CQ:
+		total = req->cq_pages +
+			((iwdev->rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
+			  IRDMA_FEATURE_CQ_RESIZE) ? 0 : IRDMA_SHADOW_PGCNT);
+		lvl = req->cq_pages > 1 ? PBLE_LEVEL_1 : PBLE_LEVEL_0;
+		break;
+	case IRDMA_MEMREG_TYPE_SRQ:
+		total = req->rq_pages + IRDMA_SHADOW_PGCNT;
+		lvl = req->rq_pages > 1 ? PBLE_LEVEL_1 : PBLE_LEVEL_0;
+		break;
+	default:
+		err = -EINVAL;
+		goto err_free_mr;
+	}
+
+	if (total > iwmr->page_cnt) {
+		err = -EINVAL;
+		goto err_free_mr;
+	}
+
+	err = irdma_handle_q_mem(iwdev, req, iwpbl, lvl);
+	if (err)
+		goto err_free_mr;
+
+	return iwpbl;
+
+err_free_mr:
+	irdma_free_iwmr(iwmr);
+	return ERR_PTR(err);
+}
+
 static int irdma_reg_user_mr_type_qp(struct irdma_mem_reg_req req,
 				     struct ib_udata *udata,
 				     struct irdma_mr *iwmr)
@@ -3648,7 +3752,7 @@ static struct ib_mr *irdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 len,
 		return (struct ib_mr *)region;
 	}
 
-	iwmr = irdma_alloc_iwmr(region, pd, virt, req.reg_type);
+	iwmr = irdma_alloc_iwmr(region, pd->device, pd, virt, req.reg_type);
 	if (IS_ERR(iwmr)) {
 		ib_umem_release(region);
 		return (struct ib_mr *)iwmr;
@@ -3747,7 +3851,7 @@ static struct ib_mr *irdma_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
 		return ERR_CAST(umem_dmabuf);
 	}
 
-	iwmr = irdma_alloc_iwmr(&umem_dmabuf->umem, pd, virt, IRDMA_MEMREG_TYPE_MEM);
+	iwmr = irdma_alloc_iwmr(&umem_dmabuf->umem, pd->device, pd, virt, IRDMA_MEMREG_TYPE_MEM);
 	if (IS_ERR(iwmr)) {
 		err = PTR_ERR(iwmr);
 		goto err_release;
-- 
2.56.0.317.g454f8302e1-goog

