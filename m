Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8443DCD85
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653521; cv=none; b=iaHTCq3CpZGXONXUd5e8LCLSsCAZGEQFwtQd0rUkvdRzcirQLypMRSqzC/x0ga3z4hAo8uMw9t2w3j/S+E8Hh13UNXBDHsErkHWUo+JBACNDDYtf6J/+cG4/iI0sCDANBNyaYUl9bzcsAN4l/zu8k3hFd6b184fR8rJAjaoOT/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653521; c=relaxed/simple;
	bh=pE26nF1O+gywfS7XBjjrgnl7qbj8WmsIYOvIg08cyIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s8AErPvXt/5vrNb3PwoN27yTviZpndIDf2QQtLBrkncO+pZgqCaCwvzqcbMnDly0JwgwnjDO5zyoi9Rs9EJ0VdjHhYbhBYQ/ad0wJ3g5ky92hmL39OFnnOHvYc3riO0fElFsmk6AJo3YHjQtyvsGmb++StH0bwVHRHF/fuPP3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VBFr4Lm6; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VBFr4Lm6"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a43fc3527so487498b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653519; x=1791258319; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TURFZphfVPL8QZrp+2aK2dezkQwEA5VMpCPWip8CV2s=;
        b=VBFr4Lm60mo8UabCUn9vejRqP15NLo2fTM/A958L/OAb6mL978cTy7SvKneByOCanw
         ItWefagrXPVKVCGmOUeJX2BtwuY2WbFGvOz7Hlkn+I6+lqLy6yA/CbgtRksGB5aoYUjr
         4CnIenNlKBAtlZ36bXN7UFUug+gptq/IPkvRAuU5KfYPxsXD0Q3kUTIot6EIPCsrTWba
         n9P0ufOBSK8KWVmSTeRSz9O4/2xPAF1h4vDwwdbRRumn1XEM1HcfWaCVruwdC9/yJ/nw
         Ul2EU073J/gTjhNPn3dJkYrA5MOHHrQODD/62PK5xGre9DPHmZyo1BRkXPqaLl5S3hBC
         d55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653519; x=1791258319;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TURFZphfVPL8QZrp+2aK2dezkQwEA5VMpCPWip8CV2s=;
        b=dK7jMFmcRDQ9y5FiDP2cNry0ihWr4eBP7+/rt9t9mmnOqSlr6ADLsO/9JZYtP0p4gE
         qSNuLOSezfw31VSSCGBGDTvUCo8qwDAMZZNaBv5CUohwDlyV5UMvx5yvsbArJnPwqvKh
         t1UsSP5mIKafGI8tUDOY4R/HJ5+UuIQ3O475yVYKWb8sgvYgIRA3t0C7fhtfgsfyxjzv
         AaHix36JFWZtkSBcUTIg+SN0EHxsN6Asb2bS5jw5ooi4TDUJSgVchbDq8TdX7GU7vSbF
         ooSZHXttWHw7xAgpb7Wi3eSq2+Ik80PlUSxls3JPSBz10clF4rHry3/dl3SwOWNN2Ycw
         n6Sw==
X-Forwarded-Encrypted: i=1; AKwUvBx0kjZEM+6G/ythpwsPeKynj/CWIqHWOoBCjvDXOwVO91Nz0KziofrJNprCwM0lfUHyb0ZoctHsPr1fEOM=@vger.kernel.org
X-Gm-Message-State: AFuF++lpXQTylg/F6gHONXwChJcqsKS9Jv173uX79rYrCWpprxzrf3vw
	nO5XcrBJUVQisLZogAGONfeYiVqrtZEpMUMnBQVm7huKijrGrKU30daU4/huKmcO88zAltCqeyW
	19Q==
X-Received: from pgut3.prod.google.com ([2002:a65:6083:0:b0:cc7:85b1:2114])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1a:b0:3dd:a9a9:3967
 with SMTP id adf61e73a8af0-3de7cf9d001mr1160408637.43.1790653518920; Mon, 28
 Sep 2026 20:45:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:56 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-3-praan@google.com>
Subject: [PATCH v11 02/16] iommu/arm-smmu-v3: Add Q_POS() macro
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Nicolin Chen <nicolinc@nvidia.com>

A queue position, the wrap bit combined with the index, is Q_WRP | Q_IDX.
It is a (max_n_shift + 1)-bit value that wraps at twice the queue capacity.
queue_inc_cons(), queue_sync_cons_ovf(), and queue_inc_prod_n() currently
compute such positions by open-coding the two macros at each call site.

Add a Q_POS() macro and switch the open-coded sites to it.

A subsequent change will apply Q_POS() to a position difference, to count
the entries that a queue pointer moved past.

No functional change intended.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 270e6617a19a..06b7de2e6e4b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -181,8 +181,8 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 
 static void queue_inc_cons(struct arm_smmu_ll_queue *q)
 {
-	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
-	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+	u32 cons = Q_POS(q, q->cons) + 1;
+	q->cons = Q_OVF(q->cons) | Q_POS(q, cons);
 }
 
 static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
@@ -192,8 +192,7 @@ static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
 	if (likely(Q_OVF(llq->prod) == Q_OVF(llq->cons)))
 		return;
 
-	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
-		      Q_IDX(llq, llq->cons);
+	llq->cons = Q_OVF(llq->prod) | Q_POS(llq, llq->cons);
 	queue_sync_cons_out(q);
 }
 
@@ -218,8 +217,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 
 static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
 {
-	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
-	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+	u32 prod = Q_POS(q, q->prod) + n;
+	return Q_OVF(q->prod) | Q_POS(q, prod);
 }
 
 static void queue_poll_init(struct arm_smmu_device *smmu,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd2fee2f560e..84e618a7fa9e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -187,6 +187,8 @@ struct arm_vsmmu;
 
 #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
 #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
+/* A position is Q_WRP | Q_IDX, wrapping at twice the queue capacity */
+#define Q_POS(llq, p)			(Q_WRP(llq, p) | Q_IDX(llq, p))
 #define Q_OVERFLOW_FLAG			(1U << 31)
 #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
 #define Q_ENT(q, p)			((q)->base +			\
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

