Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9644238A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240191; cv=none; b=JSZkWqBbYIjBvV7cDQjvTTfWjOGtkfZwTuTrte0nHsM+zhSLNJ33JuX6AjzouKY2ndbP3EFeHPtBu6edOOa+nv62DasRcLGq/Qkk4yOuY93zXlQ6HSkIyjOVBbBbEdA1tCjUrgvqgHRlXuPGYXezIvqZBLscCoevqKhs6lDt+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240191; c=relaxed/simple;
	bh=Cj4FjSHKBjv54u3XmmA+qTyMekhASSwlkn3EL5F2Ass=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CTKBETwl7zq5e5Soc9CpFPJfpZEjw3QB1Lp4R63gMu/zOeKWDTtrDMk6DWEY7gd1KT9BOKfEOIQ/2wspOy+G9VeW55WE2XJWb/HWK7XRjrx+tyWMUfeydYuvngqkv+m1fP1yjG4ak36o3INqLeitqXqKUTiofpLL6+bQfQ0Vj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bxaWazuW; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bxaWazuW"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6aa734a721dso2604074a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240187; x=1790844987; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyisHEHOouXDnRhVknZZL0KL1V1yIbby3bAAKhAOqX0=;
        b=bxaWazuW9mrwZd6IDy3qDKBCZJPyjAqzVEnTFTxZyVFXuzxRIL8Cz66jl/4c9GY5IK
         thYuysKyxJvD+8HmXc8VVVtHKnH7i9Oe+vkfDkR4irgawp9mTHm7bkOdZxonY64ojBe9
         WhxGFlyUXC11HE8y0ese9aqZRGJv82HuxzRK1kM544Kako7/1I7nmXMT0JwZAqvNYA+L
         MnwknhXNdCQ6Iix1uk1NrOHLrS/FPSmtFCVJjK7ZPXYoLM9sWRD10LzS43dB3XiKjtmK
         IGsp6DeiSusj2+4e1NSkam9CAkv3iPraClkf22ZiMOIwPY0R3HuJjv4tgiuO86FDCJdU
         /wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240187; x=1790844987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyisHEHOouXDnRhVknZZL0KL1V1yIbby3bAAKhAOqX0=;
        b=d1zZMnJLCB5U5h83gknqbjYPbRkdPFe/vmKffJ9XZ18WwIZpAYQD9uflYrGw6rIYke
         IQ7ysVPxKuwhFv4bMdTQcGOe54Fy2HYUGSgDr5Xd+0qUhmY3iTyR35I6mTleNphb5xMw
         nfUHuxpazTK3bxYd5w7j3cjklClRd+lhxXtpe3Ah91pQSFRy0pHLzpcY7iZgeZXdOWw7
         XAG1i12qm76OjqRor1GYD4S1nrGj1ZiH2JR3H/T1HCWY3ImcxWHhl1y8SlDaoZZ7Ux+9
         KdyU2sU+NSfl2+FcCi3pqW2RE4TbFgh7XW7D4kSF/04QGesKTLfuUMAOXO970QYt5vTq
         sWdA==
X-Gm-Message-State: AFuF++lsjJKyyBydS+nTfGwtqydUnhyHsvFeq5bG2TyGguhZ+RGtlgMn
	hMPL0WXxKx8zlzrD3kWIzxoE9RNjXJm99wjMWz31m91a40lzsh/Q894Xs/2MiYcpwRtqrE9D27N
	U6sMJeL1Qi8vU/ia0eWH/Zn/GMVnVE6fmkEu/DopmGyCk/R+Bv5CqDH9MI43o8jt5LMXZC81eme
	j2tkxvfSzKyVvH8dALsEvKTaof3FBXn+NOJEprstjIUBnrF8jC3C+rT0w=
X-Received: from edb11.prod.google.com ([2002:a05:6402:238b:b0:699:e9c8:2d72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5186:b0:6aa:a7f:d584 with SMTP id 4fb4d7f45d1cf-6aac90949demr1600686a12.42.1790240186819;
 Thu, 24 Sep 2026 01:56:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:13 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-3-smostafa@google.com>
Subject: [PATCH v2 2/5] iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

arm_smmu_v3_test_debug_print_used_bits() hardcodes arm_smmu_get_ste_used()
instead of using the provided writer->ops->get_used() callback.
This caused Context Descriptors to be incorrectly parsed as STEs.

Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
Reported-by: Sashiko <>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..eae08d4d77ec 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -125,8 +125,8 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
 {
 	__le64 used_bits[NUM_ENTRY_QWORDS] = {};
 
-	arm_smmu_get_ste_used(ste, used_bits);
-	pr_debug("STE used bits: ");
+	writer->ops->get_used(ste, used_bits);
+	pr_debug("Entry used bits: ");
 	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8, used_bits,
 			     sizeof(used_bits), false);
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

