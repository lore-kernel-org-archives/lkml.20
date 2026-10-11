Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25592D12EE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681087; cv=none; b=HedI0PqBSbpgg7FzltsibSeJGbqHLqgsKGfjK6jNCT9C9L1K7E3j6OCvpJGL6/z8z1OlOjyR3q33T7GNn7YBk9wwwowD3vYmiRH47d9oary1haE7jd310sgFHSnWJz50Got0lgbwLnaqhZ1RfUFizsGfrgYgiFskepvwcWgSfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681087; c=relaxed/simple;
	bh=4goITpC+hJeEoRY18xKASITy1Mh1QU58vYjek2AXJUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGsvZbylL7GG3wJLCNHwPkmClN16icF2u5fO0oYgUArnRzTxrUicJojhT/qU+YxEBKA7QswJMMJrRu/uT/XNxvFDsBsyNnk0Ceeax3NeCkCA72UK9d1XE6dcuTaAzZWX/77n8JvZd731t8cDYNOpQtxebAY479fWPCGMI7ccAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=FCNgxR4R; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="FCNgxR4R"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b056d58f2aso4681507b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1791681084; x=1792285884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdSUFoY6Y0fSzoD4LiGZ5RlgR+C+orQ2WYuanbz8+yA=;
        b=FCNgxR4RPWPnQJVHDxZ5oVbZCQA9Tt/HOTw84jD68Vf0UVPY8xBGDyk6pH9d5sXGM2
         wyqnONvu1FOApX3AfE+m7I23CvZBXmwRRqyEs+AUDWhb5qoKlu5ZBmER2v/j7pBWR67J
         U63MxMMSpQZ7DYALbseRCVnoLeQG6QOAWmtlt1znez0boegCgS0eyy1LRa2LT+4YJfnk
         sBc1/qtASS53zzEcgcSIacMWXEG2u17CVKtLU7sECqBuVHpyWIvoFG6ZL7ztCL/OVU2q
         u3g5zxEMFSy0hCCkc6gKZzHwRmj40pHS4GEXeEjSNQE4tZJ/KtmQoUL4FFnTzDFsA+zw
         wQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681084; x=1792285884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdSUFoY6Y0fSzoD4LiGZ5RlgR+C+orQ2WYuanbz8+yA=;
        b=ftGvf4chrD04jCIgtDP2Y03G4HosahaaI5T7FGDqgqiwx9ZQHJkuGtqQIo/tQdFaOH
         RrwrgFxReoyVrWCijuiMKOidbr8IcovNwAygfUXKBbNXm+0leIP3wvt+Cz4IUaLOvzr1
         Kqezl0MFxozygrr1sNj6ojJFP+wY2xY7/cEjylLM4FIYAlNqFcBSh2yFad1Q8u8xhvdC
         APdhERWd0p30NBtXOFCB2a+DfMMnXcgGAno690wAKUCQ9QTidIalPOl64bTSa03C9pN4
         8K+7tvD/9qsQS7KUu4UruIRhwxRCzshXQzIA8knqiqNvkwWBpZS+BQQguAX1i92DhXaj
         Af3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSt+AZrfN7m/k+KKeeV+eZqxUhpQPf1XleeDQCGnTqUIaJ49WZCEq9ACyzo7Mtv3udtJ9MBDQHQ2k53pM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItGwxXdXX1vJCDFEZbVMYOd/xdm0B7gnCDxF/XbnHEoS278Qwb
	x3eH5WCHBbs+7yo1FHpCL6W6stDduu5fnaQHRRIki113HlpsGfe1e3bgyTdRxwRZDaNn
X-Gm-Gg: AYBFou0Aq7Q5BRTuySmqU2STC7zqNO/mWcu9iJ+B9PyQiS8uu2FfPbc+IpgFZn78mJ4
	/oNUa1fSIPQudYzGJzbmMxUemzLNLwQCStXK8LDyJYHy0MoTp0CyEjn0UkJM8Yv+m1pX6iAzp/X
	sIJNoSxZc7monfEct7yzK8I6ZfDn73zdGHRoiaExplqPp4l8nM6Nnkq0utoHm0idbL/sk4/CxOJ
	dNm1FMlZC3jyZK3BkwABqqrqluIywMtxNFdXhQbDtwZlyR88p7LbTyXaNOeumNi15bXy10Vs1qs
	kEVC2S8oWOGoBbQSmP8ZdRcBSJF7MiazMQaZODliHSV6AjV1T049YJEbYIgOTDlKi9zUcYDKdc6
	P28mLW+9W0hiZUTVCVX5bjxsbDgbSSOwLMxoaZC2mJBGHuv9tnE2xrAAtVQzB6BvRNNrcygNKQf
	LIJt0U3IiXG/xeMD8lJuK74Z24Wut3r4jI8TwYeZc9uHSEj3InYDQvr6BTPue1A5lagRgD8NjnZ
	7MpC0xdswApiHw95t+zReOvvzVcebynVBpbftbz3sGmQTpVdZIs1LvI6XdVdMWSTJGE6g/b2Ksw
	996jTuyCPw==
X-Received: by 2002:a05:690c:e1c2:10b0:8aa:3a3a:1fcb with SMTP id 00721157ae682-8b07ee2f72bmr11973327b3.67.1791681084619;
        Sat, 10 Oct 2026 18:11:24 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f263bc8sm21311817b3.45.2026.10.10.18.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:11:23 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jmoroni@google.com,
	eagleshaw@google.com,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next 1/5] RDMA/irdma: Plumb uverbs_attr_bundle for QP, SRQ
Date: Sun, 11 Oct 2026 01:10:18 +0000
Message-ID: <20261011011022.1445352-2-dhu@x6u.co>
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

In preparation to support modern UVERBS ioctl attributes
(such as UVERBS_ATTR_UMEM for CoCo DMA bounce buffers), we
pass down `uverbs_attr_bundle` for inner QP, SRQ routines.
Since standard uAPIs provide `ib_udata`, we derive it via
the helper macro, `rdma_udata_to_uverbs_attr_bundle`.
`irdma_create_cq()` supports `uverbs_attr_bundle` already,
therefore, this patch fills the gap for QP and SRQ.

QP, SRQ uAPI will now have `ib_udata`, and CQ uAPI has
`uverbs_attr_bundle` as a top level input. However, we think
it is a future project to unify them.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index 71d7ae7baa47..10c790fdfc57 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -637,13 +637,15 @@ static void irdma_setup_virt_qp(struct irdma_device *iwdev,
  * @iwqp: qp ptr (user or kernel)
  * @info: initialize info to return
  * @init_attr: Initial QP create attributes
+ * @attrs: uverbs attribute bundle
  */
 static int irdma_setup_umode_qp(struct irdma_ucontext *ucontext,
 				struct irdma_create_qp_req *req,
 				struct irdma_device *iwdev,
 				struct irdma_qp *iwqp,
 				struct irdma_qp_init_info *info,
-				struct ib_qp_init_attr *init_attr)
+				struct ib_qp_init_attr *init_attr,
+				struct uverbs_attr_bundle *attrs)
 {
 	struct irdma_qp_uk_init_info *ukinfo = &info->qp_uk_init_info;
 	unsigned long flags;
@@ -981,10 +983,14 @@ static int irdma_create_qp(struct ib_qp *ibqp,
 	struct irdma_qp_init_info init_info = {};
 	struct irdma_qp_host_ctx_info *ctx_info;
 	struct irdma_create_qp_req ureq = {};
+	struct uverbs_attr_bundle *attrs = NULL;
 	struct irdma_srq *iwsrq;
 	bool srq_valid = false;
 	u32 srq_id = 0;
 
+	if (udata)
+		attrs = rdma_udata_to_uverbs_attr_bundle(udata);
+
 	if (init_attr->srq) {
 		iwsrq = to_iwsrq(init_attr->srq);
 		srq_valid = true;
@@ -1071,7 +1077,7 @@ static int irdma_create_qp(struct ib_qp *ibqp,
 
 		init_info.qp_uk_init_info.abi_ver = iwpd->sc_pd.abi_ver;
 		err_code = irdma_setup_umode_qp(ucontext, &ureq, iwdev, iwqp,
-						&init_info, init_attr);
+						&init_info, init_attr, attrs);
 	} else {
 		INIT_DELAYED_WORK(&iwqp->dwork_flush, irdma_flush_worker);
 		init_info.qp_uk_init_info.abi_ver = IRDMA_ABI_VER;
@@ -2337,7 +2343,8 @@ static int irdma_modify_srq(struct ib_srq *ibsrq, struct ib_srq_attr *attr,
 static int irdma_setup_umode_srq(struct irdma_device *iwdev,
 				 struct irdma_srq *iwsrq,
 				 struct irdma_srq_init_info *info,
-				 struct ib_udata *udata)
+				 struct ib_udata *udata,
+				 struct uverbs_attr_bundle *attrs)
 {
 	struct irdma_create_srq_req req = {};
 	struct irdma_ucontext *ucontext;
@@ -2420,6 +2427,7 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	struct ib_srq_attr *attr = &initattrs->attr;
 	struct irdma_pd *iwpd = to_iwpd(ibsrq->pd);
 	struct irdma_srq *iwsrq = to_iwsrq(ibsrq);
+	struct uverbs_attr_bundle *attrs = NULL;
 	struct irdma_srq_uk_init_info *ukinfo;
 	struct irdma_cqp_request *cqp_request;
 	struct irdma_srq_init_info info = {};
@@ -2430,6 +2438,9 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	u32 depth;
 	u8 shift;
 
+	if (udata)
+		attrs = rdma_udata_to_uverbs_attr_bundle(udata);
+
 	uk_attrs = &rf->sc_dev.hw_attrs.uk_attrs;
 	ukinfo = &info.srq_uk_init_info;
 
@@ -2470,7 +2481,7 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	attr->max_wr = iwsrq->max_wr;
 
 	if (udata)
-		err_code = irdma_setup_umode_srq(iwdev, iwsrq, &info, udata);
+		err_code = irdma_setup_umode_srq(iwdev, iwsrq, &info, udata, attrs);
 	else
 		err_code = irdma_setup_kmode_srq(iwdev, iwsrq, &info, depth,
 						 shift);
-- 
2.56.0.385.gd3acb90ef8-goog

