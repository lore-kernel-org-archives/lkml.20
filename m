Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19854503E3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921675; cv=none; b=dz6agG3C1e+btC8NcWF2lg83bn1fUtReZLGMtflqeaRSag/jNafaSIV/fcgWc3r5Dese8/od4PWjlTZ1e3nnFXdtR1A8wnahCgZn3LlHiMDChlkfWC4CVbXeEU2OBX4hfuu9P9IVvJ/GziYe6/jAn/GE1KjiwMRn98e1g1Gs/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921675; c=relaxed/simple;
	bh=Y19wC9aROH0p2C0YhyoiBj7Iw1xMl80M5dB6Vw2JHjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HBj3wU08XaVsthHRTKQjqRh4j+hWWz6C0wsEwB9BZgyv7GEq7yYMYP0hTrLqa4ATyZWXWGXNXwjYROquvuuHt92mwS5WHFoQT24uN/oOaW9rtasORu2sofpL9tpXHoHUbFEf8JrNjUTg5iCiD2os6fPVSH2Q9o+n0RiRRkMxASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KB3FMHrF; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KB3FMHrF"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so6267325e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921672; x=1788526472; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3t59Cwp3hUZ2CzdmTE2YwsjNcWIkkKVh96IkZiq53c=;
        b=KB3FMHrFIYjsfaOXN+B/5JVcDtejppnkd8l8yKD67890c2U910C+9/Job2f9E9/uif
         ks+dOqtK/+MVuDhyYkY/oO4UmClRHERmkqyNkfJufXge64fZBJgSuqsLiwyeB5fpZWzn
         ppB15FAR2viwr28K56LTkdX2tZWPKCrRyo4kUAZE6f5AshB0Dg+UwI34LBBW7qojD/XD
         WqPyYvG8dQSt6qA31olUnAo42Cc/C2kWQewiCO2tpsfvm/Kt/y/WLSM8Sxi8KWhvDE9K
         u60DkZpRl+FDhs6eTMmh1+R8YWe3nTKglOSV8KHpuij2HUj+X2uHo2xXPCf5+yCXEEkD
         QWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921672; x=1788526472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3t59Cwp3hUZ2CzdmTE2YwsjNcWIkkKVh96IkZiq53c=;
        b=SOn9EjY3qaVSpwFI9QJJ6VqR5RGbsEz75nPgWW9zSd3BEknsqHo7I+12jM3g2wf4Js
         V71Kx7mFf/rrMV9MIly1Dpx8R0j2cbclpW6FQKOMdhggySTe5r3l33Ud2oF+yP8VMxgb
         Ob9w/p/28OlCWcm13u76N5qN7BuEtKY12/ubpvNrAgOLl3L6Dh97uBK0gdHiJXqP0o7v
         9C5kQB90z2kBhdu0jn1FBUbUzEv2szSzytACfN9dAiZhZrRKqDAR/R3m4Fg7n+94hV+w
         CBf68dCvUdSoWgf1JSvitRIyjUUJp6DCS4mVLqwG4EeGBh86sY5rQd5OX6oPvqUVb+9R
         5eMA==
X-Gm-Message-State: AFuF++mOVnl2SW969VtouHsAx63geZUJ9IxWOp5t6QQeiz6s5QFpmGhv
	qm0943f2AkoMuEXLFjinYzmOgofOZV+VCGVpkF38CmLhx33upACNMtJ6ObWWHgEqw63YDRSfOug
	ROxBwL0R6gc/H7q+O9zsNRvGcL9u3H3DDcooTtpOMsK3D+Mo9HV1L3fNsA7Jc/kFw5YAD8/yeOc
	Iejv1RBtqQ/S3gg6YqS6ouGW6AE05P7zVO3vzu8L+HqJC3r6ZVTFNHBPs=
X-Received: from wmsm23.prod.google.com ([2002:a05:600c:3b17:b0:495:6261:8954])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c02:b0:499:8ff5:8ec4 with SMTP id 5b1f17b1804b1-49b91c2e11dmr109166555e9.3.1787921671689;
 Fri, 28 Aug 2026 05:54:31 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:40 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-6-smostafa@google.com>
Subject: [PATCH 5/7] iommu/arm-smmu-v3-test: Add missing error checks for inv array
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

arm_smmu_invs_merge() and arm_smmu_invs_alloc() can return NULL or
errors which are checked by the driver but not the test.

Add KUNIT_ASSERT_NOT_ERR_OR_NULL() after calling them to fail the
test instead of accessing NULL or ERR pointers.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index eae08d4d77ec..366dcb2b5554 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -704,17 +704,20 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 
 	/* New array */
 	test_a = arm_smmu_invs_alloc(0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	KUNIT_EXPECT_EQ(test, test_a->num_invs, 0);
 
 	/* Test1: merge invs1 (new array) */
 	test_b = arm_smmu_invs_merge(test_a, &invs1);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results1[0]), 0,
 				     results1[0], results1[1], results1[2]);
 
 	/* Test2: merge invs2 (new array) */
 	test_a = arm_smmu_invs_merge(test_b, &invs2);
 	kfree(test_b);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results2[0]), 0,
 				     results2[0], results2[1], results2[2]);
 
@@ -726,6 +729,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test4: merge invs3 (new array) */
 	test_b = arm_smmu_invs_merge(test_a, &invs3);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results4[0]), 0,
 				     results4[0], results4[1], results4[2]);
 
@@ -737,6 +741,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test6: purge test_b (new array) */
 	test_a = arm_smmu_invs_purge(test_b);
 	kfree(test_b);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results6[0]), 0,
 				     results6[0], results6[1], results6[2]);
 
@@ -748,12 +753,14 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test8: merge invs4 (new array) */
 	test_b = arm_smmu_invs_merge(test_a, &invs4);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results7[0]), 0,
 				     results7[0], results7[1], results7[2]);
 
 	/* Test9: merge invs5 (new array) */
 	test_a = arm_smmu_invs_merge(test_b, &invs5);
 	kfree(test_b);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results8[0]), 0,
 				     results8[0], results8[1], results8[2]);
 
@@ -765,6 +772,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test11: purge test_a (new array) */
 	test_b = arm_smmu_invs_purge(test_a);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results10[0]), 0,
 				     results10[0], results10[1], results10[2]);
 
-- 
2.55.0.897.gb25b4bd76c-goog

