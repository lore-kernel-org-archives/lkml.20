Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B2443AAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240193; cv=none; b=XDVigkD57TyL97Pyy+Q6PF6twUBy2FvZ38T8Ork2HXeMexyvrHBG4iclOjq5r9bcmhVhgDpCJ2My6RDt4HVx/mur4LZTkZHMCNYlkI9NOB6QoVwGDbuBAIQkfJMGI1jI+6pHZiPhWlj5ckrjI3p1AlaXgbStgLqPHbYCPpvq3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240193; c=relaxed/simple;
	bh=KeDy4IrcG1e2xwDfz722ZsSdT3LmASiGfQOxY9XlU70=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QG2ym8ELnF6f3l3EXdrM47ofrYA//g8C4Z56VTWUhtoLPUpYaADEpn91EqTRmMUKisk642u3xuZrQJ98QsHrj79Np49jf4O3lrFtUUzceyIHRU7725bi63wsbYia56sfd6T5/DT+j8XBA8cXw33FqCkVw47ZQlk1L1vxGmXBlpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJ+G4W/O; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJ+G4W/O"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c29452ecadeso189080466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240188; x=1790844988; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vg0s5N/57YDwzYIoROOFrmDFDxGbcQ0sOsS1KaKDkg=;
        b=PJ+G4W/OHiT+uKfny7mPf7qCnuwekSGprLsvb8OcKZYQdv+V0GmwzjkqR3MvweLitN
         8hYFJfDc/g6jWJjqa0f7lhVeVgzyBg0FwbjIUrZ8HU1gvwNkHOjm9T1WE9dpejpFwF59
         4SGZi6u8vi8axZ8j/MDxRPZa7UnN2ZWkvMWK1RTm73Emnfe82wr6yeqSzkGPjAikKkxT
         ZvzqR9hta09LAtj81gVBGxo/AokuREqbjUYUjZMX/j8r4zlSVny/HG0C+PCWXFwVjefJ
         zTHnIfzt+TIqgClAfSOBNVRl+Ap9R7h2t5SXFPLf2Li2INTagZrunYD7zh7IBBjyfxA2
         DIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240188; x=1790844988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vg0s5N/57YDwzYIoROOFrmDFDxGbcQ0sOsS1KaKDkg=;
        b=fkQO3WYveZuecM86SIpAnALQMyz7d4B/r3pdV1JXQjLacu48OaDbvawgRY+iFvhknD
         Rd/hk7XD56YPJ2Zb72U5xeJEjFT1WpJRTPDTr+dOUoJ/wr5qArgAcsZHcCdO6ndeYMHF
         J7NBAEdhdlwFSnYP6OFq/oDzdQksVhsPiP8B4D9dw1yFqigglOPHHnzmEp4EHW6/TDHp
         kyJ9K4xrjiBpWSSJTCLeKHMODHOCqUF2dPZPE5bCdZWce9tCXKBP3laHBTwY1ZxJ1dz6
         S06+hP0aBzxZViVT64fVlWyFzGFsRyMqJe+SNYXH/uu3H++Ekpoth0FDrlYQeXYTpaQh
         KtHg==
X-Gm-Message-State: AFuF++nwLAQDdo6pcV+enjeotu4JZcamlBTYBxW1vNlgxtLH04Kh+X6C
	VIvLiyfwZwwYvKF/hdJLYRoW04aWqcOdS+iD1L1VJX58jU8nB/t7GJ2dwmoRJt8EhOQZvhBhur8
	h0qL7zJqi1ZdzbiYMYN2AcpnB8QuI+kdRD6ak0bySz2ZCmZwqsZdRMRaE/exotQDeJxoc5fflzm
	EEl2W5S/eHqTlc4RFnHr58Y7aYqtlR6RH3xjv0wQOh/oS0X744psvXVkM=
X-Received: from ejcgj35.prod.google.com ([2002:a17:907:7423:b0:c16:9d46:17a4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d409:b0:c26:1648:a069 with SMTP id a640c23a62f3a-c2ac24f9cabmr130143366b.36.1790240188197;
 Thu, 24 Sep 2026 01:56:28 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:14 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-4-smostafa@google.com>
Subject: [PATCH v2 3/5] iommu/arm-smmu-v3-test: Add missing error checks for
 inv array
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
2.56.0.rc1.315.gc6ed9934b7-goog

