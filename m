Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF12D8796
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921659; cv=none; b=hvKRDBPfD8gOIPcIpddNf3NvNhlyEIBodlpDpJYc6r3+otWg3D0BILhoS2ZG9e5vzapMN/cOpoeV8DiDxifvAwZPvOtzT55OnYSeXJxcousN2uWCt+iealETqeXWs70d432NSpLvmdgt/e8Hpuw9LwhvVp4D+utAAf/wtbsf/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921659; c=relaxed/simple;
	bh=upXdKvag3PQjFo+u20Yny7ckLbyRjOxAi0c3fKM7W+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HyQFgVAIMQrQBh5J8EfWt+eIGr5wzgFJwbloG8tI2+/Ctmt8JzI0aldpBfvhBUuqfX8793zt1WcWRy9k0OyjqpDHpqRrEupoTOETWjWDezTnZj7FXWK8reBotUbbShB9P+Ltqi3xb4aDRpHfz2K8cvLAzUxyyN/iBIF4qMi2ZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X/gZX8Ag; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X/gZX8Ag"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-499a7993a9bso8290405e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921656; x=1788526456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIbaVf3ZrMQ638kyQmo2xKF0JXdpiB0/s407XZc/gcU=;
        b=X/gZX8AgbW93lkHaHVcDwj2PGU4Qkfek7QcVUaR/i7HjV4AULTG54/BKK3gmJetOZk
         8Oq/1hxVwizgg3vvq0g3wBUN8rGrg+o5Gehdyo6sB/IJdQBJ6e/AqiXseTbFsnOnZNRq
         n+CINrCwhiEw/XGYSMJsqDu5E4mjzK4iWr3/ljhZsddMr4Noz9YdCeatAB/0NP5Jnon+
         BbODFwBAo9v6jBflH+k/tyr/+jtIn9K1tx3R89+YyR/ddzC6RNv04fuLtIT56bEDfNUy
         AobAjMLnpvp9G1XL44SjHJ8ZCyes0fMBG7lVAB1kcMght9yHlhIi7JFBLqemutGvFuR+
         Oq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921656; x=1788526456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIbaVf3ZrMQ638kyQmo2xKF0JXdpiB0/s407XZc/gcU=;
        b=RsLPiTufZKBSlpvxxZAKfdfivo1ohpaWzHXhj6gd9xFMEhYJvLGY+GJiRDb7Xr/36m
         paixl/xZfrwuIg3M96AiV+U9qrKMzFZovDdWuZ3AhugaqcxTio0lDwkTn7ReWTsx3pCY
         NZKgs+512muozj9KXzST3+tvcxy+wKUMuNRsoapKSy28jUW0t64Rd4ZLIftC1/kAUwNI
         M//yNXDUybRP+YbUltcVizHjkzVkj+K/O6jPC0BgnwWiWLQfEv5OE8V405yff+Ar60nD
         jIBGeGU5NXg74RQFi23gDQuy35C98rhA8U/GE1YjEEy5AVPo0mJL0Oc9n8tvBClLQWSq
         f4Ww==
X-Gm-Message-State: AFuF++mlVwTreYaAJCEKLpjr5cVqcYHs2wjOdyqjjghHxzfOOmyyGRCQ
	BQ9Yj1WuyOVsEkdCCo1Cdm4mz++yK/tTjG+OeE2jr8xIoiul6Z66j/jHLmJFtbAk8TiwlddJuy8
	D1gpHL1pb8lxsJ8OhGzyd/63jgZmjTkli4oeABGCj1zvKBWlVAljymajlOt12gvbhtjhLb5kdGB
	kHokzBoBE+Gbc+GGbt5qQ2BwmMHTKpWHR0QML0l1Bkfyx7L2v8Q5s5PnI=
X-Received: from wmof19.prod.google.com ([2002:a05:600c:44d3:b0:493:beda:c864])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr88157945e9.12.1787921655833;
 Fri, 28 Aug 2026 05:54:15 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:36 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-2-smostafa@google.com>
Subject: [PATCH 1/7] iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 6fabce53f6b9 ("iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update")
adds a dma_wmb() to arm_smmu_write_entry() to make sure stream tables
and context descriptors are observed first.

However, STE L1 table descriptors are configured directly
via WRITE_ONCE(), where before that they were zeroed with memset()
inside dma_direct_alloc() then written to abort in via memset() also
in arm_smmu_init_initial_stes() without a barrier in both cases which
means that the SMMUv3 can observe the allocated table before the
written descriptors causing it to fetch random data.

Similarly in arm_smmu_write_cd_l1_desc() where the L1 CD is written
after dma_alloc_coherent() with no barriers.

Add dma_wmb() in both cases.

Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..494bbfd2869f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1515,6 +1515,9 @@ static void arm_smmu_write_cd_l1_desc(struct arm_smmu_cdtab_l1 *dst,
 {
 	u64 val = (l2ptr_dma & CTXDESC_L1_DESC_L2PTR_MASK) | CTXDESC_L1_DESC_V;
 
+	/* Ensure the zero-cleared L2 table is fully visible. */
+	dma_wmb();
+
 	/* The HW has 64 bit atomicity with stores to the L2 CD table */
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
@@ -1804,6 +1807,9 @@ static void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
 	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
 
+	/* Ensure the new L2 table is fully visible. */
+	dma_wmb();
+
 	/* The HW has 64 bit atomicity with stores to the L2 STE table */
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
-- 
2.55.0.897.gb25b4bd76c-goog

