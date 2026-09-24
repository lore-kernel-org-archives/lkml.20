Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA351442B15
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240194; cv=none; b=jzb/MjEH89E4fOe3PNV4DAjsDtZc0MamkqkmwwdlJpEBmsS0ZgMPF7Xhzqas7OhfYZnnQeGIsZW3uNAxNFKpcCXPKq4EkYTFMz0DdZJEgPRlQ3Tj4a0XyTicN/l9QHSSc9LOrugSHLKYxFLtV0taCP2uMqy59MqRHOTqWSqt+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240194; c=relaxed/simple;
	bh=7iMQOQ5HcgSI/XCHP/GEjkexPkCe2PLzf76QDMbSjrI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JmPIwT9ihx7aEC9AoaHzI3EXMt/2dMcMIhsOKHJMiHeWESTehD4gPNOA0tGioTAMRNqO3UAM9b1dz6kMmFkk5kpx0MbM502iYkANdf2XjPqXc1sKDqz8Al/jbZEn5wFSxdvhZxdat++XhYklJXItXLWMsyv1GJQ3A2TfGTYs9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LOhAIcto; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LOhAIcto"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6aaa4535b3bso2109337a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240190; x=1790844990; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeCtBbQ7yt7z6sBbxQb9QyYhXFA8zToXd2a7O4Dja9Q=;
        b=LOhAIctoJ4nhd+4bTrSZxZSwyKgOPjkq/GyqYJD+laxwQu/qrUr8/Fox1lnAHoGUIF
         vxCjrgoNPdvFd0ae6l04X40WNWjpWhuEnCZ27ShjA95AbIiRt5+N7V69zF9OqrP+9iA5
         mAN6clYKC6aIRER5wTq+uOI2OOloD4y2C5CsACEN1U+lN93vBH0DzPRe6BJtgc73jZ4u
         ykWP/4WcRjFfrciiUd8CiSDsOg5DJKlDUra3hNs0BsdXSdGF9H0i7aFspA2HIYumKVy7
         BL0W1vxESXtEczG/O4A7zYJHfXzHq5wfPBzTMl0DBEiTuBj2kM/8jucEiwihWbEliE/m
         /11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240190; x=1790844990;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WeCtBbQ7yt7z6sBbxQb9QyYhXFA8zToXd2a7O4Dja9Q=;
        b=U7ZKH1obKx6iBWROil+P0TFI5byzPoJcKmT6yeIt+i5K+4LUXm2P/QwEjM26y1V/HY
         iICZAIJheCJIf5YpkDz5weq3zODaRpKtteOE2XfU+WCmmoAxEC4FsiIg+4vcyQD5NiHP
         YRbWtDVF72QqlkqpFe7sKqCwc7+5+ezPs+2wUK6rLsbHiVzWmQkEQ0e68f4Q0iNqWo/g
         WVb6vV2jHP0PghiHgwc1OB/4cFjoCRpV3rftg0GeB+8YnLc9MBshQrOnW4t2eLOY9Zg2
         QH9ArlpnJclXahrY+3aoJumoiW8ENnGuJqJsXTkRkuD5gGfuVPCbDYtUul9VxDxw0KPT
         4sZg==
X-Gm-Message-State: AFuF++mxKbeCndr8EPCbf4rE57oAgE2o77VUJl8Y1iOJf9GcrcD6iXgI
	xrQw1enlYD3ZbHcZr5vT2m+EDJhODODwIx+RdHHbIy9DCv5iso89hMRXjMY5+BL5CwHbfiZTcAm
	icwakZ8X9saYHWHSv0ovi4UMy/RRM5wBLf7FjnPMKahcqDa/3Q9/ENoUozcceaSkgq5jeQ99GgK
	Az/uR+1ENpewF29r79nlOhEJognr+dAeXuETpjm3Fh3Xld3sGCHnQFSF0=
X-Received: from ejcet6.prod.google.com ([2002:a17:907:2946:b0:c25:2d7f:4eee])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7a8b:b0:c29:3b7e:3a94 with SMTP id a640c23a62f3a-c2ac53d2785mr104883766b.38.1790240189335;
 Thu, 24 Sep 2026 01:56:29 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:15 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-5-smostafa@google.com>
Subject: [PATCH v2 4/5] iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

arm_smmu_v3_invs_test_verify() validates the array bounds using
KUNIT_EXPECT_EQ(), which triggers a failure and continues execution.
If invs->num_invs was smaller than expected, the next loop over
num_invs would blindly read past the end of the invs->inv[] array.
Switch to KUNIT_ASSERT_EQ() to fail and stop the test on bound errors.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reported-by: Sashiko <>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

