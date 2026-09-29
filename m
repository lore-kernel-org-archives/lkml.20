Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF84A3DA5DC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653529; cv=none; b=d9Qnau2WrchVEaX3IQaoN+nbarTIjIe780Rf3xUrkSLgb4nGczJASIF3ge/N+I3fm+Vsbzck6hluCxYfMrM9t0Jesy0ISWjoKX1p74zJp23PmkuRisHpRluYeaL1gGiILA5d2jb1uX6cCw5SAXJkzOLMudRlmG7SBn+qt0HpOcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653529; c=relaxed/simple;
	bh=SuJ0VJDw+vh7P8OkJfHaGZVisnLRpOyIShpAsEtDHfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzftI2zN4ek7nZC1jjolIUcczHjY9dTMoJ1EzzKa/KepDUShl0p++gMLS3WNj6rlhF/n7qMM4YqPhnJNe+pjdoQsjTMj86+F0sg/aDQIFgnwFHGtHiS/IBZ9iRA36HN7IrYKxGtmj9IcnjmckTv8XKMMd8dbC4bER9l3DF2GzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZsLWGb5; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZsLWGb5"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88078ca8725so1205920b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653527; x=1791258327; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=;
        b=fZsLWGb5SBP3xAu9tjSlON5tTjrRkj4mas9H5VKQCwHws7Kb1tWZb9Z1Lozbk6KP8s
         33mWk17vfpGbR1RHieD0ZdTg2uf6uzHyekyuT0POSYlY0MmzwGFpo02Tln9wfPCirwiN
         n9+VnwAl7OA6DfJLDqVJhtSmME70onKsPHjmugT+hKFqLZL4my+TrDHEMeNzZ040dugh
         r6Ixt9MI+mksc/OsyDUsreQvVnGqHQAKOlzOKNKNQJLhSFr5jJmY033bsEv1S3avTIID
         03figFsCbBLoK929huNVgWkjYlmwH4PECQZB1z9gcQt29WhsX8oXRBlk3Faxy7U+ACLv
         xxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653527; x=1791258327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=;
        b=0XuZX7DNBZTE0S7Un4+/1XCyn03rI8BMmORbfKwNHPK/ZlcFh7UmtFjBjLZntrCKhI
         dOJqjP0I4r38YMzw6p3mjTb/fCKQ7Z4YS7mvg4yQow+GM84lyqufsfH+XoA3MIdSSoW2
         9hWkGXYQg43NEoRURk2xtlycfFUz+8tNMyDKhC85TyzMu563KBi/ABDfxClPT8vv4PhW
         tB9gUh+qOLKOvLneQqA8SB/VQjDZABOSxZMz5FR19AEOrV84W5bxB3Dafr4BT6usQgDU
         NvTjYQcHsXCWrd59hhNhIAqFS99ENqdIqXoNJ+iLb8FvJ54sos43dTtBvzEOv2Jj3cd8
         m4KA==
X-Forwarded-Encrypted: i=1; AKwUvBxxf0ZVnF5GcOXx+3ZxhWG7hjYR7yDGWOSr9tbEkbjRt8zqlWwRUyRndWlFILSiGgEyy3Wo23nMSpwbV4A=@vger.kernel.org
X-Gm-Message-State: AFuF++mNN1lFF5DllpylWus1bIODNusHaWMHNXkz+KMtUCtImLoBCDUZ
	rmK5zdqpqnRcBJMNwzHvI+kH2EtZnIYG5GNiXbMLZD+EHX0uh1iFtc3vqv/Xyux7zcDNVyrQrsv
	VMA==
X-Received: from pgdh4.prod.google.com ([2002:a05:6a02:5184:b0:cc7:b470:94ff])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2583:b0:3dd:85a9:55b8
 with SMTP id adf61e73a8af0-3de0e8b481emr12791744637.35.1790653526784; Mon, 28
 Sep 2026 20:45:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:59 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-6-praan@google.com>
Subject: [PATCH v11 05/16] iommu/arm-smmu-v3: Add a helper to drain cmd queues
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
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Before we suspend SMMU, we want to ensure that all commands (especially
ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.
Add arm_smmu_drain_cmdqs() that drains the command queue using the
arm_smmu_drain_queue() helper.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d809b625f7fb..dc2fc02b5163 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1028,6 +1028,33 @@ int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
 	return -ETIMEDOUT;
 }
 
+/*
+ * Lockless, the caller must ensure that no concurrent command submissions
+ * can happen (such as during suspend where clients are already quiesced).
+ * Polling until PROD == CONS ensures all pending commands in the queue have
+ * been consumed by the hardware.
+ */
+static int __maybe_unused arm_smmu_drain_cmdqs(struct arm_smmu_device *smmu)
+{
+	int ret, err;
+
+	/*
+	 * We skip cmdq locking here since this helper is only called
+	 * from contexts (like suspend) where the caller has already
+	 * ensured that new command submissions are fully closed.
+	 */
+	ret = arm_smmu_drain_queue(smmu, &smmu->cmdq.q, true);
+
+	/* Drain all implementation-specific queues */
+	if (smmu->impl_ops && smmu->impl_ops->drain_queues) {
+		err = smmu->impl_ops->drain_queues(smmu);
+		if (err)
+			ret = err;
+	}
+
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

