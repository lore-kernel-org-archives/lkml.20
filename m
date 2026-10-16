Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2648DB32
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182587; cv=none; b=qwT2CmJeHQ/ARQhtFxOOR7TUt//5KfLMj39XeAuxyyCcLtO5nQsjALuw2CDFyBuvW2K3Jc2b7gj6DHkKsIBQzZLKgggT1U7U64SlM1Bd69k8/bhEpvrOe5zxt/kkXw0xhe5DyBN8uAXvx1vuC2yIbvxN7+5SsAw28aMcHy40UQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182587; c=relaxed/simple;
	bh=zuqsIDr02iUaNUf24uD9AuyNgKxsfF+SdmXBLhWQafI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOVWuYi5dbPTc5Im+qUZhG5d8pM1uj/m0w3BbgdpQ+VE0H4lgLmVkMmnG8pV5l1799il+K8IW433l/EFlGCmkJg4XXxlQcQAsvaO1/zlRKvs9hjpwqWsNOK8fqGf5qa3dwXPyh2s+ipTo8QCE2fXxTEDEzFKYfPL8Uh/0IF7G6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=MOtCKBtU; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="MOtCKBtU"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e519c39196so103385e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792182581; x=1792787381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gBm4eYWH8ADZOqk+02ZWT3WvoW2g25kohhyi8mFq8M=;
        b=MOtCKBtUyER/Gy+BEes9e1MsDQfrVlI6qkmpT6mBiv5CTpBEg8TELlmGpPZ9rJsi1j
         UIUr1orKWr0O79W1nstZ2H9cCRosIkULXa6lMCQo8w5DMMmgfG0UP+Bc8mWGjeHzFZsH
         yq1aIjsSK6mNPXbcFNyTkoQMIpBfF6cRx8Bgamuf9iI3EKxqSFXjHB1hmvuBxTEKe0tb
         C+xpcCYH+yPhPynNwz/crnvZO/mQZu8BO+ebPOboNaVDmm5t3dnfYl+3t/kB9G7HX4Xy
         b2LA7zy+oC6odicCe5UEBnKZwIXuVoVFauW0BxNVKTKW7Ab98A+jp/JUBoLBwm8fSkht
         jY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182581; x=1792787381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gBm4eYWH8ADZOqk+02ZWT3WvoW2g25kohhyi8mFq8M=;
        b=UeU1/IdXE1oSROP4ZCQF/1XpTd1fuOS08/nklE1FrwdLP4P1G3CWkcnlA8RR5wStDr
         /LxSioUQQd4IxqrS4o+mnvbGYGnnPXKHhMsRnlhgZjhsgMdwtwiQ5qIs9GVxAO6jkYsa
         q3qkHBoYy8L77I5nBxEfwrxmUkmr+oUsXgqhHZbF9YKLKax25moasiQjD+dtE3XBeaG1
         oF0h2tWi25ZsfwoD4KyudajTXGEXU2PEr4Sk7QkoHTlzXEkpu5oMk8TmXvJObrHsY/km
         xwnOyHVcVu3V03tmY6aPFwVIAuuTqQ2cBr4C6/Cl/Lqcm9483WRFjfLEOcijQN6Z+YZa
         BjpA==
X-Forwarded-Encrypted: i=1; AKwUvBxsLrg+38Z0XT78KxzY1BQeFc5x7S5x0Prdfym1p1KKxobx2F02AR5ip3P3Dpr7mPzx3sdjG8j95FDFaAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlApQDoQjhI1MuKey0oTSZM+vyMhkzCexQPAKKOjcpsSkPm4KS
	BYhE3Q78cedmZjQoznQ/BJQVyOazPw2afLD8SqWoMfGy/3aUP/YpLu6RssOZRDsSD2DL
X-Gm-Gg: AYBFou3tzHoFgRPdPUuaqTiIHdmpUuD+aNo80bbv8+AyJX7rdz34FS7pFAGxkYl271o
	VLHVvKYSCW2a8mCvJ96CMFRrGBQxOxbDECD1Qm2+P2AXV9KioXvoQr9pJd3sq+yQf2kt+x4BBX1
	up8RtmjIHPGGsSNu0bW6RzZkC1KG7Xou8/Y8kbjzTRd9zlJWWYRvS8C/4C+3Bs746Ud2msQpNM5
	/Iw1ydIP6yXqnEM4DGRj0dy2QLS9RNYrRKk8E8VfEY6+FlAaFlQC4JZ/x6F1Y7ja0+ji46m04SA
	xThzP1k+vCoEz0O875Uo9G/xvPZYVEpbpGpRc4qwxtlqm1SjaukG+7FkzynKpB7Me66iQi/iwAg
	6i8+/etCFLcDyYgs91tN3iSVlXMIex1QaSS5BbRNzoCUcSu03Le/TYQP2C1BOsMMpP2AP+NVtlE
	z1eQYsib3JisoQT6REVlyi1Bbqwz+5yn1vwlb35/vjfZTPtZTZCu0swRSFYhK3LDNWJPLtseVD/
	QI2TjxKL+IgBogmMapTOCvgv67yKmDggJ7mAfjN7lJ7tiSZzvrNyP+YvCxI4k+1G0/dkNQcfCVd
	B2Gwc5uZtQ==
X-Received: by 2002:a05:6122:c1c4:b0:5c9:e022:f642 with SMTP id 71dfb90a1353d-5eaa9ecd066mr465972e0c.0.1792182580691;
        Fri, 16 Oct 2026 13:29:40 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b5201b1sm2588281e0c.12.2026.10.16.13.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:29:40 -0700 (PDT)
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
Subject: [PATCH rdma-next v3 6/6] RDMA/irdma: Support UMEM attribute for SRQ creation
Date: Fri, 16 Oct 2026 20:29:09 +0000
Message-ID: <20261016202909.1289496-7-dhu@x6u.co>
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

Support the standard 1-step queue buffer creation for SRQ by
`UVERBS_ATTR_CREATE_SRQ_BUF_UMEM` via `ib_umem_get_attr()`.

Set up hardware pble directly from the pinned SRQ umem via
`irdma_setup_q_pbl_from_umem()`.

Proper umem and pble cleanup, and error unwind are added into existing
`irdma_srq_free_rsrc()` upon SRQ destruction.

We maintain backward compatibility for the legacy 2-step registration if
the UMEM attribute is not provided.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 68 ++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index 02ed7ab99e48..d8f4358e5486 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -1996,9 +1996,16 @@ static void irdma_srq_free_rsrc(struct irdma_pci_f *rf, struct irdma_srq *iwsrq)
 		iwsrq->kmem.va = NULL;
 	} else {
 		/* Not called in any failure path, so iwpbl is valid. */
-		struct irdma_mr *iwmr = iwsrq->iwpbl->iwmr;
+		if (iwsrq->iwpbl) {
+			struct irdma_mr *iwmr = iwsrq->iwpbl->iwmr;
 
-		refcount_dec(&iwmr->user_ring_refs);
+			if (iwmr && refcount_dec_and_test(&iwmr->user_ring_refs)) {
+				ib_umem_release(iwmr->region);
+				if (iwsrq->iwpbl->pbl_allocated)
+					irdma_free_pble(rf->pble_rsrc, &iwsrq->iwpbl->pble_alloc);
+				kfree(iwmr);
+			}
+		}
 	}
 
 	irdma_free_rsrc(rf, rf->allocated_srqs, srq->srq_uk.srq_id);
@@ -2425,6 +2432,7 @@ static int irdma_setup_umode_srq(struct irdma_device *iwdev,
 				 struct ib_udata *udata,
 				 struct uverbs_attr_bundle *attrs)
 {
+	struct irdma_srq_uk_init_info *ukinfo = &info->srq_uk_init_info;
 	struct irdma_create_srq_req req = {};
 	struct irdma_ucontext *ucontext;
 	struct irdma_srq_mr *srqmr;
@@ -2440,14 +2448,49 @@ static int irdma_setup_umode_srq(struct irdma_device *iwdev,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&ucontext->srq_reg_mem_list_lock, flags);
-	iwpbl = irdma_get_pbl((unsigned long)req.user_srq_buf,
-			      &ucontext->srq_reg_mem_list);
-	spin_unlock_irqrestore(&ucontext->srq_reg_mem_list_lock, flags);
-	if (!iwpbl)
-		return -EPROTO;
+	if (attrs && uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_SRQ_BUF_UMEM)) {
+		struct irdma_mem_reg_req srq_req = {};
+		struct ib_umem *umem;
+		u32 total;
+		u8 shift;
 
-	iwsrq->iwpbl = iwpbl;
+		irdma_get_wqe_shift(ukinfo->uk_attrs, ukinfo->max_srq_frag_cnt, 0, &shift);
+		srq_req.rq_pages =
+			DIV_ROUND_UP((ukinfo->srq_size << shift) * IRDMA_QP_WQE_MIN_SIZE,
+				     IRDMA_HW_PAGE_SIZE);
+		total = srq_req.rq_pages + IRDMA_SHADOW_PGCNT;
+
+		umem = ib_umem_get_attr(&iwdev->ibdev, attrs,
+					UVERBS_ATTR_CREATE_SRQ_BUF_UMEM,
+					total << IRDMA_HW_PAGE_SHIFT,
+					IB_ACCESS_LOCAL_WRITE);
+		if (IS_ERR(umem))
+			return PTR_ERR(umem);
+
+		iwsrq->iwpbl = irdma_setup_q_pbl_from_umem(iwdev, umem,
+							   iwsrq->ibsrq.pd,
+							   IRDMA_MEMREG_TYPE_SRQ,
+							   &srq_req);
+		if (IS_ERR(iwsrq->iwpbl)) {
+			ret = PTR_ERR(iwsrq->iwpbl);
+			iwsrq->iwpbl = NULL;
+			ib_umem_release(umem);
+			return ret;
+		}
+		iwpbl = iwsrq->iwpbl;
+	} else {
+		if (!req.user_srq_buf)
+			return -EINVAL;
+
+		spin_lock_irqsave(&ucontext->srq_reg_mem_list_lock, flags);
+		iwpbl = irdma_get_pbl((unsigned long)req.user_srq_buf,
+				      &ucontext->srq_reg_mem_list);
+		spin_unlock_irqrestore(&ucontext->srq_reg_mem_list_lock, flags);
+		if (!iwpbl)
+			return -EPROTO;
+
+		iwsrq->iwpbl = iwpbl;
+	}
 	srqmr = &iwpbl->srq_mr;
 
 	if (iwpbl->pbl_allocated) {
@@ -2615,7 +2658,12 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	if (iwsrq->user_mode && iwsrq->iwpbl) {
 		struct irdma_mr *iwmr = iwsrq->iwpbl->iwmr;
 
-		refcount_dec(&iwmr->user_ring_refs);
+		if (iwmr && refcount_dec_and_test(&iwmr->user_ring_refs)) {
+			ib_umem_release(iwmr->region);
+			if (iwsrq->iwpbl->pbl_allocated)
+				irdma_free_pble(rf->pble_rsrc, &iwsrq->iwpbl->pble_alloc);
+			kfree(iwmr);
+		}
 	}
 	irdma_free_rsrc(rf, rf->allocated_srqs, iwsrq->srq_num);
 	return err_code;
-- 
2.56.0.176.g3575e65682-goog

