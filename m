Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384152;
	b=08hc1OjqG51+e7dGvpMgcXKYA8Kisz8San2zvF6rVwkig6ybxqCNdoKoHHqWUuj6DnwS
	 cSJ/L/IH8WJRDuXe3iY40ffc2J7FU3+YifNFpErAYX7A7PEw2bFyCLZpdjtuekdroodk/
	 jcbc62r0b03Av8nOb0i3Mp7oA1XI2qC/Ee32b/8DV1jx/BzNwBT8GC3+X0Ys8C77fChvU
	 1nZdVnVGVieFbr4gOuREcs4W6HFJ9xUvDR6SUaMDspWaARUZL/K0n2zFVNmP7qeAwtpnz
	 k09TLAZeqVhcrB8yPAzj/HMUZnhLUpsV8qnAWmN482UtEepRaup0qSCwns34IsxLs+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knp/tm/TZZVuxSSAFhZ+sMDH3dqo4kKd8WvgszJHIrU=;
	b=IDfQtl3dwKkTayYO2/wTNnYwN7k/sZxuyT16ifARIpe72ePe6B+h5nlxhaWlA+6x86rA
	 EbSKdILSWDBjgIN2cY51I9qyaqDBBNGuDcwx36zwgQzO6/Q7h7EhL7W6yJTEhhP/x2kzu
	 F4CPzcKawZOOsoTPTQQ2ki1JCG6ScGCX5BMJrFubqXFw/t+N1NOsLnALFAnJP9mEzuGwP
	 NEQiQwQXW35OSKQ0Co1ZKBmbVxiSNTCIbEuIT6MaVjVGONooX/4IYTDpmkR6AdkmcefMH
	 JwXtN03j71fZjIa4eeoY3vnKODvagWmka01a+/2xzEdw8jbhRew5K+bSHQv04VoEExA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=ogLD6Tp+;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26660A2623
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F26660A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=ogLD6Tp+
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9912c47367cso837282241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793384151; x=1793988951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knp/tm/TZZVuxSSAFhZ+sMDH3dqo4kKd8WvgszJHIrU=;
        b=ogLD6Tp+YyMdz7wHpzk2XoQGinbHqKDrCMTIeQNH+D07GyBSjKeQ/u0XIWZApRyT6j
         EQfrmIMyjPJBtCK0yMOK9/T+WtXdMU7MctcxAuwaNxJGr8O4JXreQzoYo3XL4r6nt16Y
         Ty2/Xm8wPCi4SezydQGiQ9ZJA55gxRZKDqhpXsMiQwle70Z87cyPb3QVasZXmiq4TmGe
         Jjv7nPieKeELmlm2NfN7Oh8RCgwNcnnQ5SHigFASw/+maW6e5IMdwsZvw14S3rZreDvu
         1eA2PV2lvLkDH5tVHx5/vPtXxO9BYJjXB9Em7CURiMw+WZb/Hs13XZfUL1b3Yw7FXXlL
         19Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384151; x=1793988951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knp/tm/TZZVuxSSAFhZ+sMDH3dqo4kKd8WvgszJHIrU=;
        b=ywMeyPSekHoQV/dQOHhCv9nHRAtAs0fWBDmc/MtKswrbdbCBJuTa4+YsiQK4g5T3tz
         49Y2W/1y2FTVfQy0dQeim9VuL9VtzLkv2jDLlJeLJFhak56WfFMKxJ4OHXvbVrq5bMsV
         gQ2VCK5bW4kycyjMBq7wosMTjyJWX6MG5rMP/kUCahzssBF9S/NZJ/ThYy5765MVJl5/
         DsK9QwYo6BFcMakhbny8dvbAfkWDnigsPCtaoXIa7ClNFapH53qlGdqh0nGrbm2kWUWZ
         4gKRfC9+HrL3Jr6rPj4n5mJhJuvplTc7KuZpkI9N1QxD5XSdH2OzVvskl4EEDYpNc32v
         JK/A==
X-Forwarded-Encrypted: i=1; AKwUvBzkWwW3bvf/hmykDYxiNCpbVhVCMZoC3oUFpgnA4qVKPTGfDINgFXoMpmQ5x+AGe+hpTzYfLWCh7C/P1KY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHZ9PVQk9l3fK8ytzMGyoAeFnCayONS5Xrbee3dVUpNz+gcZev
	//fyZC5UKP08uPArkx0yjxzfe49qLI64OYjZNoDGwJuL1iq1XYF5tYAmhPNrjnGqSJO8
X-Gm-Gg: AYBFou162zj/l7RsKk/OReC9bSn86cx1rZMHpvyLReyL6c0fMmrifAv1QXFz/1QcFK5
	bF98RPmeco5O/sUG6SfTDd5oSuBpvH+m6iZuH7moF9IbVyyxhfNquKPasSHW9fu9T170sA1BfNn
	TWPkDywuKpin4+JRgRyRgy30kE+RWix91YHAM98yvNqGBd643wEnSIDxlrv8Aj+gaR5zojLC1TL
	/e9kHp4bMKvIEoTDN1c+1M8i77T1rxq/qpyj4pgfE/Qrzj/nYJpV65rlcSXXK+7uxmaBl2yDgTp
	xkl+2AmDzA5pcTtrWshdOWs+4nAf3E9zdsuPzujN5w+pEn4I94zoSx7KSVRuVyWuNdymaKntDSF
	Hz+edgZqXcbndKNTD337BG4OMlyvw0+ZvvsjWBKzFIIMUwK4fZiTQ5GcrfSqOfAv2O2p22BdG+v
	5JwHhZmcfj6lBAJmtQWMN47Xn1lEHhMV7rTBStRjUiNMFijOM0Anyk1b5mwCp/70pi4TDN3Fezr
	Ubjd3ne8qOT6Nj1Mxp4FcW9clHEctOQEuU0U3gWUdhzFmJ1wJs1r8HkoNyZg9IFR6//OYiVTI5s
	FKKKulF/M8Y9BVbm0kcJMirnzgq3ISgfpIRClUqqipvOHC/2d7UPi+3b3CO8asVtGt2wy20nnG0
	uxSI00rOmV5flRq+dB7mCMUzrh+I6DRA/LlEtAA312jk2
X-Received: by 2002:a05:6102:5106:b0:7c1:e804:3c91 with SMTP id ada2fe7eead31-7d072c398bdmr931456137.8.1793384151354;
        Fri, 30 Oct 2026 11:15:51 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm3077931137.3.2026.10.30.11.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:15:50 -0700 (PDT)
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
Subject: [PATCH rdma-next v4 5/6] RDMA/irdma: Support UMEM attribute for CQ creation
Date: Fri, 30 Oct 2026 18:15:11 +0000
Message-ID: <20261030181512.2056056-6-dhu@x6u.co>
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

Support the standard 1-step queue buffer creation model for CQ by
`UVERBS_ATTR_CREATE_CQ_BUF_UMEM`, `IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM`
via `ib_umem_get_attr()`.

Set up hardware pble directly from the pinned CQ and shadow umems via
`irdma_setup_q_pbl_from_umem()`.

Proper umem and pble cleanup are added into existing `irdma_cq_free_rsrc()`
upon CQ destruction.

We maintain backward compatibility for legacy 2-step registration if UMEM
attributes are not provided.

`irdma_resize_cq()` will have a possibility to deal with a pble/mr that
is created via one-step logic, after this change. Therefore, a proper
cleanup is added.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 132 +++++++++++++++++++++++-----
 1 file changed, 111 insertions(+), 21 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index 9f4905fdb791..41e56ab8aa6d 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -2028,13 +2028,24 @@ static void irdma_cq_free_rsrc(struct irdma_pci_f *rf, struct irdma_cq *iwcq)
 		if (iwcq->iwpbl) {
 			iwmr = iwcq->iwpbl->iwmr;
 
-			refcount_dec(&iwmr->user_ring_refs);
+			if (iwmr && refcount_dec_and_test(&iwmr->user_ring_refs)) {
+				ib_umem_release(iwmr->region);
+				if (iwcq->iwpbl->pbl_allocated)
+					irdma_free_pble(rf->pble_rsrc, &iwcq->iwpbl->pble_alloc);
+				kfree(iwmr);
+			}
 		}
 
 		if (iwcq->iwpbl_shadow) {
 			iwmr = iwcq->iwpbl_shadow->iwmr;
 
-			refcount_dec(&iwmr->user_ring_refs);
+			if (iwmr && refcount_dec_and_test(&iwmr->user_ring_refs)) {
+				ib_umem_release(iwmr->region);
+				if (iwcq->iwpbl_shadow->pbl_allocated)
+					irdma_free_pble(rf->pble_rsrc,
+							&iwcq->iwpbl_shadow->pble_alloc);
+				kfree(iwmr);
+			}
 		}
 	}
 
@@ -2161,6 +2172,7 @@ static int irdma_resize_cq(struct ib_cq *ibcq, unsigned int entries,
 	struct irdma_dma_mem kmem_buf;
 	struct irdma_cq_mr *cqmr_buf;
 	struct irdma_pbl *iwpbl_buf = NULL;
+	struct irdma_pbl *old_iwpbl = NULL;
 	struct irdma_device *iwdev;
 	struct irdma_pci_f *rf;
 	struct irdma_cq_buf *cq_buf = NULL;
@@ -2273,17 +2285,12 @@ static int irdma_resize_cq(struct ib_cq *ibcq, unsigned int entries,
 
 	spin_lock_irqsave(&iwcq->lock, flags);
 	if (udata) {
-		struct irdma_pbl *old_iwpbl = iwcq->iwpbl;
+		old_iwpbl = iwcq->iwpbl;
 
 		/* Only update if the resize was successful. Otherwise, HW is
 		 * still pointing to the old PBL.
 		 */
 		iwcq->iwpbl = iwpbl_buf;
-		if (old_iwpbl) {
-			struct irdma_mr *old_iwmr = old_iwpbl->iwmr;
-
-			refcount_dec(&old_iwmr->user_ring_refs);
-		}
 	}
 	if (cq_buf) {
 		cq_buf->kmem_buf = iwcq->kmem;
@@ -2298,6 +2305,21 @@ static int irdma_resize_cq(struct ib_cq *ibcq, unsigned int entries,
 	ibcq->cqe = info.cq_size - 1;
 	spin_unlock_irqrestore(&iwcq->lock, flags);
 
+	/* Old pble/umem is cleaned up outside spinlock's atomic context
+	 * since both of them take sleepable lock.
+	 */
+	if (old_iwpbl) {
+		struct irdma_mr *old_iwmr = old_iwpbl->iwmr;
+
+		if (old_iwmr && refcount_dec_and_test(&old_iwmr->user_ring_refs)) {
+			ib_umem_release(old_iwmr->region);
+			if (old_iwpbl->pbl_allocated)
+				irdma_free_pble(rf->pble_rsrc,
+						&old_iwpbl->pble_alloc);
+			kfree(old_iwmr);
+		}
+	}
+
 	return 0;
 error:
 	if (iwpbl_buf) {
@@ -2746,14 +2768,18 @@ static int irdma_setup_umode_cq(struct irdma_device *iwdev,
 				struct irdma_cq_init_info *info,
 				struct uverbs_attr_bundle *attrs)
 {
+	struct irdma_cq_uk_init_info *ukinfo = &info->cq_uk_init_info;
 	struct ib_udata *udata = &attrs->driver_udata;
 	struct irdma_create_cq_req req = {};
 	struct irdma_pci_f *rf = iwdev->rf;
+	struct irdma_sc_dev *dev = &rf->sc_dev;
 	struct irdma_ucontext *ucontext;
 	struct irdma_cq_mr *cqmr_shadow;
 	struct irdma_cq_mr *cqmr;
 	unsigned long flags;
+	bool cqe_64byte_ena;
 	int err_code;
+	u8 cqe_size;
 
 	iwcq->user_mode = true;
 	ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
@@ -2767,26 +2793,87 @@ static int irdma_setup_umode_cq(struct irdma_device *iwdev,
 	if (err_code)
 		return err_code;
 
-	spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
-	iwcq->iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
-				    &ucontext->cq_reg_mem_list);
-	spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
-	if (!iwcq->iwpbl)
-		return -EPROTO;
+	cqe_64byte_ena = dev->hw_attrs.uk_attrs.feature_flags & IRDMA_FEATURE_64_BYTE_CQE ?
+			 true : false;
+	cqe_size = cqe_64byte_ena ? 64 : 32;
+
+	if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUF_UMEM)) {
+		struct ib_umem *umem;
+		struct irdma_mem_reg_req cq_req = {};
+		u8 shadow_pgcnt = (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
+				   IRDMA_FEATURE_CQ_RESIZE) ? 0 : IRDMA_SHADOW_PGCNT;
+		u32 min_size;
+
+		cq_req.cq_pages = DIV_ROUND_UP(ukinfo->cq_size * cqe_size,
+					       IRDMA_HW_PAGE_SIZE);
+		min_size = (cq_req.cq_pages + shadow_pgcnt) << IRDMA_HW_PAGE_SHIFT;
+
+		umem = ib_umem_get_cq_buf(&iwdev->ibdev, attrs, min_size,
+					  IB_ACCESS_LOCAL_WRITE);
+		if (IS_ERR(umem))
+			return PTR_ERR(umem);
+
+		iwcq->iwpbl = irdma_setup_q_pbl_from_umem(iwdev, umem, NULL,
+							  IRDMA_MEMREG_TYPE_CQ, &cq_req);
+		if (IS_ERR(iwcq->iwpbl)) {
+			err_code = PTR_ERR(iwcq->iwpbl);
+			iwcq->iwpbl = NULL;
+			ib_umem_release(umem);
+			return err_code;
+		}
+	} else {
+		if (!req.user_cq_buf)
+			return -EINVAL;
+
+		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
+		iwcq->iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
+					    &ucontext->cq_reg_mem_list);
+		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+		if (!iwcq->iwpbl)
+			return -EPROTO;
+	}
 
 	cqmr = &iwcq->iwpbl->cq_mr;
 
 	if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
 	    IRDMA_FEATURE_CQ_RESIZE) {
-		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
-		iwcq->iwpbl_shadow =
-			irdma_get_pbl((unsigned long)req.user_shadow_area,
-				      &ucontext->cq_reg_mem_list);
-		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+		if (uverbs_attr_is_valid(attrs, IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM)) {
+			struct ib_umem *shadow_umem;
+			struct irdma_mem_reg_req shadow_req = {
+				.cq_pages = IRDMA_SHADOW_PGCNT,
+			};
+
+			shadow_umem =
+				ib_umem_get_attr(&iwdev->ibdev, attrs,
+						 IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM,
+						 IRDMA_SHADOW_AREA_SIZE << 3,
+						 IB_ACCESS_LOCAL_WRITE);
+			if (IS_ERR(shadow_umem))
+				return PTR_ERR(shadow_umem);
+
+			iwcq->iwpbl_shadow =
+				irdma_setup_q_pbl_from_umem(iwdev, shadow_umem, NULL,
+							    IRDMA_MEMREG_TYPE_CQ,
+							    &shadow_req);
+			if (IS_ERR(iwcq->iwpbl_shadow)) {
+				err_code = PTR_ERR(iwcq->iwpbl_shadow);
+				iwcq->iwpbl_shadow = NULL;
+				ib_umem_release(shadow_umem);
+				return err_code;
+			}
+		} else {
+			if (!req.user_shadow_area)
+				return -EINVAL;
 
-		if (!iwcq->iwpbl_shadow)
-			return -EPROTO;
+			spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
+			iwcq->iwpbl_shadow =
+				irdma_get_pbl((unsigned long)req.user_shadow_area,
+					      &ucontext->cq_reg_mem_list);
+			spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
 
+			if (!iwcq->iwpbl_shadow)
+				return -EPROTO;
+		}
 		cqmr_shadow = &iwcq->iwpbl_shadow->cq_mr;
 		info->shadow_area_pa = cqmr_shadow->cq_pbl.addr;
 	} else {
@@ -2872,6 +2959,9 @@ static int irdma_create_user_cq(struct ib_cq *ibcq,
 	if (err_code)
 		return err_code;
 
+	if (attr->cqe > rf->max_cqe * 2)
+		return -EINVAL;
+
 	if (udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN)
 		return -EINVAL;
 
-- 
2.56.0.317.g454f8302e1-goog

