Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2168444E675
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921677; cv=none; b=BPTvwTstEd2VwBBMnKudea3xrBmUcd8Mx78pyYJzEgq8kq+qk1VkuF2salQu/JGBTgZO9OpFXqRH1t7YpJHryh5XYE/MXwFLbSA9Av/1PU3VOrytnVbpYMB9xOJo1y4uku25iKsWRHbw3zx8RM5WZqp3u81iSOqpTe+I6aS381M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921677; c=relaxed/simple;
	bh=cDjSIu32aBcSz8TdWp61j1qcW7QdeCw7abPmRtNMq4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lEOMlX+6OCJD6/tBGVzqj15Zu+FFkuswHDjqRxLPIQIlW8+sBDkVtA14RaMHC/CDApUewQdY9/3btKOD4cWZ3L95gRvL5PTopp3sYBHkfaBj2kk5HvVFV7wGsC8QEhCsxkBfeGLV60QG6ZLr05VDjwkrVsRkVf1MOe0lLRQ5TAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M2RSLXSm; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M2RSLXSm"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767b782so6665975e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921673; x=1788526473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecFwLqLiGFgZXlWDMNOiqsl5/zZT7jnAo8maGJSVqdA=;
        b=M2RSLXSmYjqKL6bwwqew9yOnh+wtvUlTXQUL1DIpXsPvMDe3l8HLsKGjAhLVRtLPPb
         0x4JABQia1dqW3sxmhqVaRySGoottzFNKCrNGRV+k7JgX+Rksb6dcWtkKYGbIWm32E31
         b9T5wu1zEhG3ypFAb6kY9O8Q6gUOqf3Uwq3+qPIme9zjKqHc8Tr7RpJlL6PTb+ZAKjre
         HlZpwIYYW+MbnHE6FZ3Uw4NT2eQMOiyrKpjCS1+DoORflSC0ooe2UuTKDq0jmIw7kwTw
         kRbMqDlnHiRODDpfeBItUPqlJGsuObxv7TRiFiAn9IEoOTOyV7BbKv/LwYvR1F9PgJnG
         9Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921673; x=1788526473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecFwLqLiGFgZXlWDMNOiqsl5/zZT7jnAo8maGJSVqdA=;
        b=YRhIRpRnanHRJ8R4omfJAEwEr2k5wAw1GxIXNkCs8RhtLPOELdG9coElkMhrrIsS9z
         eHWKAojS4486uWrQ/qt3KnwVIcatU4i0dlk2JRhZgQX3wKJU6wgYQ/MkhCi2E4HwI+tg
         o81UcFqAi8n2K85iZLcA5Eorw6TJv9rZ5G7G1DhoYq4nSSOUFvI/FCVNauoMItg4ApWj
         9LMR4iaG5nNPmOcOCxBjEW8KrX6fei5dg/+mbvSvOXq2qyrWirpL/C5eQJDEth1G58Vg
         46GRRpkh5ZGhEvToY777w5IEtaffmh3jL+gHvTAk6KxDH4Pmn6ZIhTNjmxjL7LTSMViH
         sR8A==
X-Gm-Message-State: AFuF++l9JkcVbqxYyDGGH3TyR3A/QDKXyVgo6NFhMyI+CaHHp63H0X6B
	IXsT+E2O29Fp7aOTAtOr9aDwomArwfUTY7NXfzgGy8MlhtpVM/RD7oypT2HVP1cuBNNHl/Cj0Cm
	GEbqRDceEjFbrOIYoUx0dFCjJLFHOUsb3n8eXmrdUEgrCeibRAr2SYQ7wDC9HgU/t3bGCdcHvf1
	QpA5cqlsBgzqEQkLeHAI/dL2Giwkf1Iro/fgHnjjfFfifY3mibG7cwMiU=
X-Received: from wmlv9.prod.google.com ([2002:a05:600c:2149:b0:49b:8f4c:fc2e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6088:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b91c433a4mr103156005e9.11.1787921672987;
 Fri, 28 Aug 2026 05:54:32 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:41 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-7-smostafa@google.com>
Subject: [PATCH 6/7] iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

arm_smmu_v3_invs_test_verify() validates the array bounds using
KUNIT_EXPECT_EQ(), which triggers a failure and continues execution.
If invs->num_invs was smaller than expected, the next loop over
num_invs would blindly read past the end of the invs->inv[] array.
Switch to KUNIT_ASSERT_EQ() to fail and stop the test on bound errors.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 366dcb2b5554..244cf34e5a0b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -643,7 +643,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
 					 const int *ids, const int *users,
 					 const int *ssids)
 {
-	KUNIT_EXPECT_EQ(test, invs->num_invs, num_invs);
+	KUNIT_ASSERT_EQ(test, invs->num_invs, num_invs);
 	KUNIT_EXPECT_EQ(test, invs->num_trashes, num_trashes);
 	while (num_invs--) {
 		KUNIT_EXPECT_EQ(test, invs->inv[num_invs].id, ids[num_invs]);
-- 
2.55.0.897.gb25b4bd76c-goog

