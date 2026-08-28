Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D737B453A22
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921666; cv=none; b=JH6CKhWIwJWsY2ry9CgMo93m3xdWI+DKrzxQQF5+ikJgnI4KKGHXNveLasGRe/yiuon75h9/1XLbiK4QrF8QAeyTCPW5brFBnsU3/ZcUXUk0+e4bqzIfPihrmX24IpEBMvzv6+IVNeR0Bnj0qICH8KtSxOCadUQJncutVxrAvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921666; c=relaxed/simple;
	bh=mQ3kcP+CyWgZPZ1iBtlnF8x6qcpBHJaX3wA7zCjENuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=djLeSTw3sQ1LfOdHin5/a6JsMpBDlo56H4/feJ5ogQz1C7STE6tRqAuyLC6dyvowdf7qhGdnUJ0gJrjPspjOmnPsU2Orr66XYhnZhsupRSq2xbBdxxpg4/r+Ke5YfI1etd6Q5fChjUS4kf7JVgJIkt1/+moz5HyKGonquNlFkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aeM6ha1i; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aeM6ha1i"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f835ac1aeso543773f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921663; x=1788526463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfku0lPz7WJB8aIdUHoXK+mnPfY4Qn0hLLaeSPnv6F8=;
        b=aeM6ha1ieERoKvzzs5OwR2Urym8ymZzDeN+srtTZNn9P/mnLDeDfSPw0ePwkkfzBO9
         F91VLN2M44wDw0gu/WOk2sCTWDsgVMAifqHl3rnPRteZSoGWAUarDWUymiOadDEETaBz
         e/IYRI8xdBLggxC28VNwTDgZNFKG1XYlLKvJHsNv08Q5OXmSn0ZbsZLLI+6VriOoN/6F
         N3SkRad+e5jAlDF6qF0MSyvqEt75EUiHn5Y5xxrQRlwlWgYzY+eVQm0o4t1qXWzblkRt
         JEVpRwe/OQ0YWYl8DUzz7+SqYjuDH9OAwXwrQQKkUJDXrbY6Cg82eg0CTVSbX4CMYObb
         mAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921663; x=1788526463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfku0lPz7WJB8aIdUHoXK+mnPfY4Qn0hLLaeSPnv6F8=;
        b=A4p7ADCVDDv3Gr/oDorpPQeB5ymliPsWkRR5L9EsXpLZmcYV0T0kk2TLTby2PRRzUt
         2NflrOpKraCO0d0j3GlSSCX8R8DWC0Rxt0dticUYzIcOhbr7NV5xYezt0G86g+8PPar0
         oV0p3uBGR1gzfP3OvcXWY0nbz5gsGK5IrULzdTnaTmHdj/fikgHIbcyF+dKCdNStEaYV
         dlnHb/Cf7k2W82G3AIqPKSOPCVQjyO+TvHyZRNm31STF9gIB1onrJbb2UrLlZ3GD44rg
         CCz/DIWJSiqA6sv+sUrJP3X+otK3/lrbSsnbcCBp3ESdc2q05aOWRgMxAFgDWVN9l69T
         xNjA==
X-Gm-Message-State: AFuF++nK3cBqQopk6YZd5Lv87rxRJ/yQvdPkU5VtweUweReVSr7Ec5XR
	wSElJ/5u9kjxQ8zTXAff9DcG8s2LVoruFvH2ccpoCB4DWnGJO2ghx69+WTNj7ZaFEInCsASchHF
	TJfZt8GHYcE1RNB8wKwXcDM6e9XBda+0hAMgznYWyNaeJNj+6wBT4oEhwKJl+VgXiGl/LHK67le
	2Aue61sQELjjoFtZqioznnad/TH35XCW/dqFsxmGWijN61FeOpWdXqRjw=
X-Received: from wmqt17.prod.google.com ([2002:a05:600c:1991:b0:49b:8f1d:7d3a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e86:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49b91bd43a7mr86485665e9.0.1787921662708;
 Fri, 28 Aug 2026 05:54:22 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:39 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-5-smostafa@google.com>
Subject: [PATCH 4/7] iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

arm_smmu_v3_test_debug_print_used_bits() hardcodes arm_smmu_get_ste_used()
instead of using the provided writer->ops->get_used() callback.
This caused Context Descriptors to be incorrectly parsed as STEs.

Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
Reported-by: Sashiko <>
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
2.55.0.897.gb25b4bd76c-goog

