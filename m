Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384154;
	b=XIGOdiBTWqvxY7I9bzGqhtmx9A2jmiNh9dmfi+etVRCUd6pkdXjPmt+KuLt4WfAiWQKN
	 zzr74jQpL2KwTOygt7doMUF7HwebnvNC+F4ou1Ez35pv5bcqbt3hz57B7JRyytNdAAIf5
	 eP/RzF4Kph96WIuZjcylViu3iuPaMHowra8icoGbmCArsrMoZWfePo8crHpbSIycP/8Ri
	 GXyHapBq64EhnMLiJjyLBju5/1pXQJuvT2BaCq69myjxXQDBtP96LzqU0QLe6QnML35yJ
	 p3o5FJoJMze2Rst0/RpwLhtnp3gknzgE/Y7VNdIVC8GTcA8w51OJJqKc8tw9ljzn10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7ar4WAN3UXBnRdyQx7m5lT8b0DpMHKQHo9PR1aXr18=;
	b=U7BF2KtO3p/y9mzTbr72AwQAZG1kL44rYKYhwWNKSNo/hQctkyrDW4NNHSnZqKi+U5HS
	 5Dq6OuAklQdVXOCXKWCSBvdnNsQZIl1vYWEvMDClm58DKQq1J8ju7bZoK21HtTWYByUJT
	 7ubUEEir7Ggq/wVo7ahVFDj15Z00Rtms+mhm4lgSgrPfUoHLpvvEzPAqP8x+ll9FJ0pyT
	 ineJ+3sa/hjjx3NBjNhz9MxvOytOSQGMHhRRUMO5rEBY2uUfsbSI79cP4w3/5y1a8sKfg
	 8RAx0VXvfmgpEb9dVxIcIHbKJSL6u23YBfpsz7gF8rDZkze7lHu7cRuICPA88LR1rMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=hbxUTMQ7;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302C60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C302C60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=hbxUTMQ7
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9851592ada1so276276241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793384153; x=1793988953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7ar4WAN3UXBnRdyQx7m5lT8b0DpMHKQHo9PR1aXr18=;
        b=hbxUTMQ7hWfx+LOb8VX+BpQxWFc9WMPuPr93teTZjtIPrghQ9fo/HVj4pzgvEGrpNa
         qQLmXqS72FYsC5SPNH7DP4kzffMykrnk+kQ2sb5H5kFGlepFdG94xSkVjBKbrop8L0+1
         TJxxJx/7DTFigUsdYRAuqZGkCKG0ndRWQ0CTXkA5vmxi1bPWjo+P3T2zdoauYMNwOLKt
         BSjhRco7jMLjsfdMcc2KQpnHoBoofmIucIqNqkKH25YG7fzi8QIt4EDeBccAOFXrnlDy
         MafdUwezpfrimWYlklzLz8q9SIezWc42ltyZ3YA0Ihn8AGiVr9pnZIxxbv+zTxFTHJaJ
         aZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384153; x=1793988953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7ar4WAN3UXBnRdyQx7m5lT8b0DpMHKQHo9PR1aXr18=;
        b=BDliv7VrluwTrnuP319AHmX4m9HMw4R0zUSR5EGCKtR1mEzQQDZKtDu+n0C6taSbWd
         Lrclpa8P+ZivAO4//dA3+MZ4MxuwrBvoQUDF/0Fk2GWN3l57garefKxOr18eISoYjUa/
         xt1Hi/52JjR5ppeW+7gTLf40WqUa9hoxMgQ6VOjo39W2NxytUaclp9xWL64JtmF710cA
         D1XvCNUZ0QinqrxpLj4Zowqqob+1Ws9BHIOZh8bZgHKJ8xzzuvXlhuu/Snlk43YqTv06
         zky4jtZhIkyKS7oYjoVO+qmoJmvDR5eecU++qNKvhvYrP1qgGS4ByBh53JY8JbSwJcgF
         PwiA==
X-Forwarded-Encrypted: i=1; AKwUvBzxJxxLi/+9qK1JngB3XnMl0BebhtP9eHMN3Km2y6a4088ya5G/4d2BJyVaUEPiRDke9fcwKw8OiI15R5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcg0zEIHJdNSFfh7IYPOffo/zDqpjEy1cH1zmFTghNvzb6dhDF
	tUzMSK00Y4IwoBHWAManqtiDPRgUNQ5XODWoqgTHbhjD5VyOWorExejO26P1hSSJMpzX
X-Gm-Gg: AYBFou3sg0PwFL+kKlzkG9N0J/+890eQ9q957pCpgRaJPvCOlCQYOpuaOWaykZUFpRh
	P2V9GcEAtLOa2kXHtnC3o4GpNK5H8BhnuX4Bk5qVOzzuS4XYBY1dyRkQa5mFUdXlnRYA5MUWZeF
	+PKAh9mumIN1aQBx0Q5hjuxiQM6nJ0E+rZOU1GCIwI8U6Z6UNFrB7MM6W0qfx6bdjJ6zIKwaZzF
	iP48MvGOom2qLN21GyeUB1I3BNumoQmS1nLP9oNqK6ugQCMj90SqHOkyLE7xl0SzSCvfAH75h0j
	NwxKk2GBsXVB8sh1JrHcVhdwRSHC09TRwK2djCt6/s8uQRxoMzkbQ9wh0oJh3zR5gHxJaDQ12jb
	UACU6HXNM1RdHNn3TVReYO0N94qAkv0DD7Q44iDX0iJHOK5R48RFHtbuaqtov6F6PCqZeMr9qXd
	E3pOY7Uc9z83kDD9gs+zbsvAt8lzV6yJmomqHTKW63KJqyn1Qb0BMvtM6+WHjt54tqWfMJroxUB
	e97dD8TKYtd6+fNXU7s8WAVq6+MHxspqAuRnMP/XjoKst2xKUQwjsQXG+epgteLY1neo6ho1wkr
	m1QhsaZLJaIA5t21IbZOq+00k3AzJk7hsfSOi791gxd9dv8jED/595odnbqCM/4s7kLSbdYusQR
	WUrA4zFgAPB2OaRD/nRJzDfGLDbr3chhmwbtS1eE9k+c=
X-Received: by 2002:a05:6102:8097:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7d0725cfd65mr1551425137.6.1793384152685;
        Fri, 30 Oct 2026 11:15:52 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm3077931137.3.2026.10.30.11.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:15:52 -0700 (PDT)
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
Subject: [PATCH rdma-next v4 6/6] RDMA/irdma: Support UMEM attribute for SRQ creation
Date: Fri, 30 Oct 2026 18:15:12 +0000
Message-ID: <20261030181512.2056056-7-dhu@x6u.co>
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
index 41e56ab8aa6d..7e8a5e481730 100644
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
2.56.0.317.g454f8302e1-goog

