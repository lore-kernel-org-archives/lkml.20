Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE93B635B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788711180; cv=none; b=P33Drq06nr8A6iba0xpUUaCHpsOUI6FpNnGQs+frGbHCkAUNda24PUSQD5WnsIkLaKYPyUi7HQjaGvk17DAGufIKRjJuG8tXYAXJWemf6WgpHYxYFFhWzBKQtqu3vvKkvjz98Ec6TaNdQdeivfiLUxkVo8ABkMdlO2oqsjGodic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788711180; c=relaxed/simple;
	bh=GftIwP5iwVOeyqviW9xwLrjX0XV5WlAEqrTW9JBtUXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=beEr8kQNwS0tVL4VASE8bUnNb/MlNOn2WPbjjjIC0PxUQjTThxQ5yjmOh9XZFIQxfo0fN0INDGB/isRCM8FHqYbUrz0Ht5htshnwjTqLHoh0ieOCPHF5O4BGnVBlSTpD/eeppxJ9iGeGAY8SwVcnPY3m6kzXq8U23G+CL1HdUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpo1coIA; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpo1coIA"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso23568685e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788711175; x=1789315975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqJUb8o6LghJs4tiGtDYL2DiPBAWovlWYLkqnHN7qfA=;
        b=fpo1coIA5WUeZjAmBlZjdOqAynftbYlJvYYdqEcshKHDq4PeFP7LN4vQFEz/OyVRvW
         dho/U3Aw8s3PSJpf0LkzUyqz524wB2PTi4iMVz0bm4VuTqwbBKM+ixMA6xcYuyrfU5Gt
         KWGEgZ3BeGA9jF3XGwketh25ayDINeB1NvlRV/sFsS1LxtYJbKnlH/As50CV3XfW3J2l
         1Zn204EmmOKP/BPeF6aXZrBFG8G21zjDndWDSCfxcEx4Oic+TCR0jCEufOSiFQBx6Azo
         i79JEAnVjiQVOfZD20sQMLYtmy4TErMB4UghZEDYZQjpy8k944qH+W+61pLF3woJodf9
         F4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788711175; x=1789315975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqJUb8o6LghJs4tiGtDYL2DiPBAWovlWYLkqnHN7qfA=;
        b=j+NLvVy9nhs5O52A6yy8h/Ca95HnMfs9l0nfXvbhDMzDYvK+lQjZNfarFBTP9AnhUy
         Rx+CvKLsJM6Vj1MijUHEjYFYXDcYWY/c3T7mKf0UyA51V267VFlW2mTpOUGV03fk3AaD
         D8a5LoXqNb5XcgB9I2rXiicmaB2JfvE1uIAAhH/bGmHAiMxxWN55ZngtnbXXPay6VY9L
         vREh+LnpLee5QUO460KWEeQtWHCDPCvY7fZ6fAEAdhJQMFogHsTUgTfnB/F6DSTAMSUT
         n0eLZ7qMagm1uD7U05Gjbe0kSf/DKsHZOhIvkaAIyFcf7YhcrTXsShkZr47pdsc9cxwJ
         lo6Q==
X-Forwarded-Encrypted: i=1; AKwUvBybQ7Ijrf7AQ4n6xRb4HIax+OW2XoxXBZAgbdsoQj5sEAf25gI3lUMAYy1Y7LaPKDS9/gOVlhOa0aPVjFY=@vger.kernel.org
X-Gm-Message-State: AFuF++ng/XQVe6GYs1OgSNakbfat19VLfudAfngDozIzwBNRsvYlE6D2
	m/ll8TZ4ziRBlMISx2LL53ndFA4dpBLdAwIXlz5X8irSBvqWIhmgcK2SRG1xvz2Z1SQ=
X-Gm-Gg: AYBFou3gs4Dnglc8ZOcEKR5ra+1ujpI10TbN1gTibDYsNx20VZPXepOxDjOZBSvJ1MA
	L3MurcScCjL0y3gHDP8wqMnwiPYJjGMcVDzF46NeUAg5aaV3/oF31bdqbaIIEXIHFNham4jiDyA
	5aWbCxFN+O/ty+wmT1Lc7QXzZ2O0opNNxQRIIyRTH+2X1DS2VIpVGK1z9Ak7ZqzTBiyBqPqV0k5
	AIxqdJ8lN4TPfjw4gFPCh0zzZwOGRr8PF2qnJNt1/wS6WOHtR34banlPWWZroiu6IEIA1UAx/eI
	OBkSt6lj8yovmdrc2h/z62By0ffQIEfiPYnBZYKtNUbrwKiLLlrBimeK7VSbbXRStj/krgEbTq6
	Vsc7tbTZxrLmJ8g/i/9wm0RwPnvcB+kAZmfipWTTrYi1QnQJBPgNQHc4Ippwcq3jFBMPLecjVKC
	g2dM8cAmOkGEh9vfmwRBrXX4fI1CC+syEpUBAuxGOzbkbqRp4H81xkQ/hxYAgbf83aEPY0gc799
	vMY
X-Received: by 2002:a05:600c:600b:b0:49b:90bc:d4f3 with SMTP id 5b1f17b1804b1-49cee5d6287mr202278725e9.4.1788711174609;
        Sun, 06 Sep 2026 09:12:54 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.216.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm23709512f8f.24.2026.09.06.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:12:52 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH v3] RDMA/srpt: Clamp the CQ size request to max_cqe
Date: Sun,  6 Sep 2026 19:12:35 +0300
Message-ID: <20260906161235.8563-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

srpt_create_ch_ib() asks ib_cq_pool_get() for ch->rq_size + sq_size
completion queue entries. rq_size is bounded by max_qp_wr, but sq_size
comes from the per-port srp_sq_size configfs attribute, which is only
validated against MAX_SRPT_SRQ_SIZE (65535) and never compared with
dev->attrs.max_cqe. The largest configuration srpt accepts therefore
asks for 128 + 65535 = 65663 entries, while rxe caps max_cqe at 32767
and cxgb4 and ionic are in the same range.

Such a request cannot be met, and ib_cq_pool_get() does not reject it.
It clamps every CQ it creates to max_cqe, so no CQ it adds to the pool
can ever fit the request, and it keeps allocating batches until the
allocation fails. A single SRP login against such a target exhausts
memory:

  Out of memory and no killable processes...
  Kernel panic - not syncing: System is deadlocked on memory
  Workqueue: ib_cm cm_work_handler
  Call Trace:
   __vmalloc_node_range_noprof
   vmalloc_user_noprof
   rxe_queue_init
   rxe_cq_from_init
   rxe_create_cq
   __ib_alloc_cq
   ib_cq_pool_get
   srpt_cm_req_recv.cold

Before commit c804af2c1d31 ("IB/srpt: use new shared CQ mechanism") the
same request went to ib_alloc_cq_any(), which rejected it with -EINVAL.

The existing backoff, which halves sq_size when queue pair creation
fails, only runs after ib_cq_pool_get() has returned, so shrink sq_size
before asking for the CQ. With the clamp the same login proceeds exactly
like a correctly sized target.

Fixes: c804af2c1d31 ("IB/srpt: use new shared CQ mechanism")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
Changes since v2:
- Add a WARN_ON_ONCE().

Changes since v1:
- Move the fix from the RDMA core to ib_srpt, as requested by Leon
  Romanovsky.
- Clamp sq_size before the CQ request instead of rejecting oversized
  requests in ib_cq_pool_get().

v1: https://lore.kernel.org/linux-rdma/20260831171354.72140-1-serhatkumral1@gmail.com/
v2: https://lore.kernel.org/linux-rdma/20260904200240.48976-1-serhatkumral1@gmail.com/

 drivers/infiniband/ulp/srpt/ib_srpt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 7197d95f2216..7ac526e3d2c2 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -1867,6 +1867,15 @@ static int srpt_create_ch_ib(struct srpt_rdma_ch *ch)
 	if (!qp_init)
 		goto out;
 
+	/* The send and receive queues share a single CQ. */
+	if (ch->rq_size + sq_size > attrs->max_cqe) {
+		/* Catch drivers that incorrectly set ch->rq_size */
+		WARN_ON_ONCE(ch->rq_size > attrs->max_cqe);
+		sq_size = attrs->max_cqe - ch->rq_size;
+		pr_debug("reduced sq_size to %u because max_cqe is %u\n",
+			 sq_size, attrs->max_cqe);
+	}
+
 retry:
 	ch->cq = ib_cq_pool_get(sdev->device, ch->rq_size + sq_size, -1,
 				 IB_POLL_WORKQUEUE);

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

