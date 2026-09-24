Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3BE41F5D1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240189; cv=none; b=X8NAJdr2+vzQ2m59sODNpVJLzw2+ThdNg1Km0RV29P745IFrX/PDBcjbzrYMYapnJQZfb8xiy45sNES8UiZdrHHjoZTVUsCvi68jXVnpDhG9DDXAoXQAWR+bYm04i+y6D0DkwbXPvhLHPWh9Powv9Zo0HeTyXgsC4pxxqoR8zxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240189; c=relaxed/simple;
	bh=bxdeOguzyBUWg5FmS/ooCmP0SBlbym7Li6q+GIcu2c0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XKRfwqtn4a62RCchW+iknC7uflj8rose997kNKEdqduDq4kHMj+D6SitREh6eFdmLXx2uCiwWquixoQ+is60qhA3r6Vjwb6/4TTvyGYy3OXJ4xbK5VEYTgpQ4rMDNufOFzp9iXo/3ZVXt+nVxdioWTarijTU3wxRaCdW/x79dy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xfc7BHUw; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xfc7BHUw"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-485866e0066so840231f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240186; x=1790844986; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvYNwuZspYmqJYkW4Kvv5dJobx9eOS6NsDNgvr2VGvU=;
        b=Xfc7BHUwUYhT/g69SAb3GujhYDAOJRD5mIk8Sjfv0BS9jJaFxhW8cDcRk09IuOg4A8
         o5bwe3waMj/fqEa4vz7d2S5JFcpqJs4FFBg+cMlPzOCT8besur7XB+BJR6zmnzEU9AJz
         hvNU2JFtRPglYnsXi66eyrU/0UCV8/SxuDpQaC1sK+bt8nCdGwH5Y6pMz8huP0j4rW0a
         BFixo7G0CMPgAmXSP4g+DiuEI6ZBgkF4LxhpR9MOw/oKPYaH6Y9SkK6kWObtyOsbS2aq
         I7KXVAtkZ8vf5GTjG9ozsYlKGTo6gPsAUH6I0RBRr6/HeCW9G43J43EbF6WTubI1cnxN
         et8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240186; x=1790844986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvYNwuZspYmqJYkW4Kvv5dJobx9eOS6NsDNgvr2VGvU=;
        b=t53mu200PIFQnr3wRmz1Uo/OWrWIDVwHQfJKUay0rmA4vfgNXYb9ccLOhA5SEL8FjM
         YWe2haY9XCinR6uWIoRqghaJHksj2JlibvdV3YhECrur8ar0BVPUHnc9YJzQPMzB4scx
         ppQp0W1Z56OyM8hqphUYCGeI3DC7kLeCARiSzJTwpZe30lqEUwpX7fCz4Qn99Y67G18f
         pzWrDx/TFt2/e5WJ6iopMg7gexZ7+W4/gfyiTaRb+qzdnxUU7h4pzGAD7py5Vy6KV5i+
         /JedVmt2Oo8juOeXMLIku6NzaU8IhTGOV3hP+pqv9kG/k18+4J9edJzMWtr3Az9It13L
         +RGg==
X-Gm-Message-State: AFuF++k88KIV4nJnRtkZzLE8+xE/mU+8LCtfYNbX4D1FdnrEIgsYPcRl
	CtWeAOACqWZicbxHmdz2G3AKDXcbkM2OZ6xZOvox8ScG9vpZf+2GU6Fpl4TeypP6VghNOxErUTO
	GhpZj6SM+ivpMZIJ8XqFJOdm0JzJtMZYlr6MPKjRrdStRRM/30SjlRtGcdsKbx1HXk0SsARMa79
	p5jYFBJ2izNk5Whpo6SWGVQqmQr4SFGhKNSXwJlKI9GPiyNkiZ+8kY3bI=
X-Received: from wrbft16.prod.google.com ([2002:a05:6000:2b10:b0:47f:74c9:84ee])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310a:b0:486:f980:2367 with SMTP id ffacd0b85a97d-488716aaa53mr3150067f8f.48.1790240185585;
 Thu, 24 Sep 2026 01:56:25 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:12 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-2-smostafa@google.com>
Subject: [PATCH v2 1/5] iommu/arm-smmu-v3: Ensure L2 tables are visible before
 L1 ptrs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
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
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

