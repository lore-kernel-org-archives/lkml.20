Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F492C15A0
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681097; cv=none; b=K70a4AEIN5OECB84CVLRDmj2/S0uX41WRiCk575zWUfLQuKxEaljCgzMkxrpa8/rI+7PZTaF53KLNK6lvKJvbxHkDBsU9VPcfnGAyzxGMmdtCHlk19Ed1lhRADIJ7tAT9Vgc3TDjOfKo/YGIaEh/zrDOTmsLPpOz5SBONmh6Iwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681097; c=relaxed/simple;
	bh=Bq/JDgsRpPGSVnR+z41DzQ7/6gL3O7A5AJaPCZIrUP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJ+DA8Tyh39rt+sV9/o7n4LLxed91I9oW4NtN4GFOHiqy2xR/NIbvKfGGTEVOC77tahvixXxfrTo2yIavKvS9aIEP7LzF1SJPQ0c9FsQKwvJKOaGWWdMSKn2wKhw919lAAM+N41GnfFldm6sj/XGmYifTCPfKJnFq7XMn0l3tag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=fTB9BpdD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="fTB9BpdD"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8a83d2706fdso4844037b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1791681094; x=1792285894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3+Ks7Dnr+fzspomvSsIPmb9ncq8pl9ifk4GvJv0xfk=;
        b=fTB9BpdDXH4AIHCNRkvYdIQhMbRJCIrv5CnKCdStyYT7x35CnbAZIoarzbGqpU+t2g
         wpDS+meVyWCel/xY9q6yso+Bxt9bkph5qZ1ro85QcORCSP7aNqxbaS/28zI/34/qZ87Y
         7KOM9iIOzLo63M/UX2ZSk7cEQwoJ/qk3jAf7Bs7z50mw0mhPs+ca718dpJFsS426x8qG
         rDpRX2zx5rrLib9d+2I+9vNUkdJdbsdp8gCcb9Ey4qnn2W0iqVeoN9Z86nAJhaLBeO+X
         pABL7Bi+B+sqAdLEaIuIrXEntg+3qvxAAKpfsixyIeSg9ig5FdsvqDE53ixEBSgC3+f3
         1dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681094; x=1792285894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3+Ks7Dnr+fzspomvSsIPmb9ncq8pl9ifk4GvJv0xfk=;
        b=2NOkoMKsUaLX3XIxxtZbj3HZbkWmKf0oN57mXk6X+efboR1ECyB0OoQ79VJfSqqj38
         +sEHSEqgk+bxNbOjpFVn20C0Rf6hcJtD1vk6QfwZzzyH/lahoMGxiUsZAF9v3L/Ow42O
         ASDkz+Pc6BIWv4hPrP8XTtySVTBTI30n/VqmZ/RL7z5IN3UGWT+5pblL23HQ1gs3Y9vF
         OsvMwWkxGTeIE98eo/EUoseVLQR7CeLQlM7SFeeJD41CkiUVEnk9XlYcbDfpSAQCK8WV
         LX1Jp41sxsSS/v6CEkyFNc13vKo8yr5z10sXsDNohoeglXExl6UBOU/B8VPOXeeCUwgI
         /EFw==
X-Forwarded-Encrypted: i=1; AKwUvBw97bCHHQXnKtcvwpDwa31H2DaZvH3uQNYI2wihoS/OTH5uDkGZOxSIQI4UGPiohR3EshdkrKcZUIW/hhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLkew5fEUQq8ys/J+XWe7eKWfKksqItNylnY0O1RanmHjfyqOd
	seMFRXEPYsKfP6LGCw01oX1ASvAj0vkPm2m495myaV0dp1XV+H+j76JTMF5GdtS2MzVz
X-Gm-Gg: AYBFou0pvghMSo/GtYyuFjD49nJ7cUsJHrE27sPWN24oVNgG/bj9cBNqkAgtrnzCgBM
	M20nBxLRSgoTYh55tp1OWUWm32MMgDYFPXAVeUEf+bkK98DvPpdpzOolKVpRZqaSqFO/Z4bWnoo
	ifhh4H9T9LEn0Uw12Px6faPeTCekUOKJTr8y8bpsCxit5SrPbIxY5vLTAEaeRe6rfYKg/zxkIb+
	Yx3HTHMto6iAvJpD/FOchD3xYfS++xBSL6VmzbPGERUyJxroslBa5g/GkZo+UQvALxRlOblGxoW
	1vZ04o4bfcTI36g1Lz88YXXWIX+T8AO/+nA/ICFJ1Qibfh6B2yHPXkZBBLmq1jamEd6tm7gsZPY
	sVvwS/m2r6oduH2NQRBQMsW7qJ3TRHA+hMJ54Jm+F3JP3Iw0VdH7Pyo/yXJ0nt3ay+aLl4Mg//j
	sxGY5mZkGbgT07kMnOQKnWLud5IcLk5lvSceQf5WskuDbSUIOIa9Rc3sqxnq4FjEi8aoIzl/Y3Y
	3h4MFcYpp6a6u09q8dO/SCAEOh1nsVw55u0PiP99BCZZKJgS3iVA4AtaqMTedflpoBAi8ePXhep
	gL6hz+lfCQ==
X-Received: by 2002:a05:690c:385:b0:8a8:6fac:217d with SMTP id 00721157ae682-8b07ee95c2fmr21120677b3.95.1791681094660;
        Sat, 10 Oct 2026 18:11:34 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f263bc8sm21311817b3.45.2026.10.10.18.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:11:33 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jmoroni@google.com,
	eagleshaw@google.com,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next 4/5] RDMA/irdma: Support UMEM attribute for CQ creation
Date: Sun, 11 Oct 2026 01:10:21 +0000
Message-ID: <20261011011022.1445352-5-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261011011022.1445352-1-dhu@x6u.co>
References: <20261011011022.1445352-1-dhu@x6u.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

Support the standard 1-step queue buffer creation
model for CQ by `UVERBS_ATTR_CREATE_CQ_BUF_UMEM`,
`IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM` via
`ib_umem_get_attr()`.

Set up hardware pble directly from the pinned CQ and
shadow umems via `irdma_setup_q_pbl_from_umem()`.

Proper umem and pble cleanup are added into existing
`irdma_cq_free_rsrc()` upon CQ destruction.

We maintain backward compatibility for
legacy 2-step registration if UMEM attributes are
not provided.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 110 +++++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 17 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index ab25445f3828..e4a02a6b2a11 100644
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
 
@@ -2708,29 +2719,94 @@ static int irdma_create_cq(struct ib_cq *ibcq,
 		if (err_code)
 			goto cq_free_rsrc;
 
-		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
-		iwcq->iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
-					    &ucontext->cq_reg_mem_list);
-		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
-		if (!iwcq->iwpbl) {
-			err_code = -EPROTO;
-			goto cq_free_rsrc;
-		}
+		if (attrs && uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUF_UMEM)) {
+			struct ib_umem *umem;
+			struct irdma_mem_reg_req cq_req = {};
+			u8 shadow_pgcnt = (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
+					   IRDMA_FEATURE_CQ_RESIZE) ? 0 : IRDMA_SHADOW_PGCNT;
+			u32 min_size;
+
+			cq_req.cq_pages = DIV_ROUND_UP(ukinfo->cq_size * cqe_size,
+						       IRDMA_HW_PAGE_SIZE);
+			min_size = (cq_req.cq_pages + shadow_pgcnt) << IRDMA_HW_PAGE_SHIFT;
+
+			umem = ib_umem_get_cq_buf(&iwdev->ibdev, attrs, min_size,
+						  IB_ACCESS_LOCAL_WRITE);
+			if (IS_ERR(umem)) {
+				err_code = PTR_ERR(umem);
+				goto cq_free_rsrc;
+			}
 
-		cqmr = &iwcq->iwpbl->cq_mr;
+			iwcq->iwpbl = irdma_setup_q_pbl_from_umem(iwdev, umem, NULL,
+								  IRDMA_MEMREG_TYPE_CQ, &cq_req);
+			if (IS_ERR(iwcq->iwpbl)) {
+				err_code = PTR_ERR(iwcq->iwpbl);
+				iwcq->iwpbl = NULL;
+				ib_umem_release(umem);
+				goto cq_free_rsrc;
+			}
+		} else {
+			if (!req.user_cq_buf) {
+				err_code = -EINVAL;
+				goto cq_free_rsrc;
+			}
 
-		if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
-		    IRDMA_FEATURE_CQ_RESIZE) {
 			spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
-			iwcq->iwpbl_shadow = irdma_get_pbl(
-					(unsigned long)req.user_shadow_area,
-					&ucontext->cq_reg_mem_list);
+			iwcq->iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
+						    &ucontext->cq_reg_mem_list);
 			spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
 
-			if (!iwcq->iwpbl_shadow) {
+			if (!iwcq->iwpbl) {
 				err_code = -EPROTO;
 				goto cq_free_rsrc;
 			}
+		}
+
+		cqmr = &iwcq->iwpbl->cq_mr;
+
+		if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
+		    IRDMA_FEATURE_CQ_RESIZE) {
+			if (attrs &&
+			    uverbs_attr_is_valid(attrs, IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM)) {
+				struct ib_umem *shadow_umem;
+				struct irdma_mem_reg_req shadow_req = {
+					.cq_pages = IRDMA_SHADOW_PGCNT,
+				};
+				shadow_umem =
+					ib_umem_get_attr(&iwdev->ibdev, attrs,
+							 IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM,
+							 IRDMA_SHADOW_AREA_SIZE << 3,
+							 IB_ACCESS_LOCAL_WRITE);
+				if (IS_ERR(shadow_umem)) {
+					err_code = PTR_ERR(shadow_umem);
+					goto cq_free_rsrc;
+				}
+				iwcq->iwpbl_shadow =
+					irdma_setup_q_pbl_from_umem(iwdev, shadow_umem, NULL,
+								    IRDMA_MEMREG_TYPE_CQ,
+								    &shadow_req);
+				if (IS_ERR(iwcq->iwpbl_shadow)) {
+					err_code = PTR_ERR(iwcq->iwpbl_shadow);
+					iwcq->iwpbl_shadow = NULL;
+					ib_umem_release(shadow_umem);
+					goto cq_free_rsrc;
+				}
+			} else {
+				if (!req.user_shadow_area) {
+					err_code = -EINVAL;
+					goto cq_free_rsrc;
+				}
+				spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
+				iwcq->iwpbl_shadow =
+					irdma_get_pbl((unsigned long)req.user_shadow_area,
+						      &ucontext->cq_reg_mem_list);
+				spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+
+				if (!iwcq->iwpbl_shadow) {
+					err_code = -EPROTO;
+					goto cq_free_rsrc;
+				}
+			}
 			cqmr_shadow = &iwcq->iwpbl_shadow->cq_mr;
 			info.shadow_area_pa = cqmr_shadow->cq_pbl.addr;
 		} else {
-- 
2.56.0.385.gd3acb90ef8-goog

