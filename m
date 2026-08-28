Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1F4519A6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921663; cv=none; b=fG2UuaErw6iIPFeiIHHqN5cq3RqPKJCSq8EPqjHt9eZMm9j7mytxs0Xx+bkaRKoSu7qKeb2PZJ1B5TwKuLDZfpHtzGFCuxthfnW9TrKV2cSDhjCTTsrbLZipf3VhImH1rkxWvBar5GoPse8YqHMIFbAEE1/Llmb/kix701wzLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921663; c=relaxed/simple;
	bh=oK0J178nG2/SnhSd8NbdANj5bxRiyctq80z3lFJEcFk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MZEj5nQKfVMtifI4l/+S7k+da5q0efkVIlo2sT/e5IDqKaACsIU3dmU5QegCkqtY3trPES7A7VuHWx+RzkUtuv/Ql0A5u2/vpNdrZjHLiOAhSZCiv4ehUDoF2pEPIRccyd8vFayc4TOYMcvJOmzxR7XH36DH3pRdlnQ8ZlrN5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mXKOf0od; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mXKOf0od"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso7800045e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921660; x=1788526460; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAMHtBFkdmGbuLyv/P0Pos4ZoeExbNjIBs0ygiScewk=;
        b=mXKOf0odwCt39nUsMqBgUiVCuCf5MSa6up04tS/3X14hAs7PU1GQ+0C4PUPtqlQKcZ
         XJvs+CcAsyRZxHH119nXPiKweJEiiwre6bG3nBJIaeq/LhWe/7fq1kBMNVKW9L8HhTWL
         4vddLS+JWGWbn+pPw7YqfbxFM8C029l8kfwNJTlztnAGiYfjOKA5VYyiSUtVdc9ahvgR
         I0fStlWb5k9ih1dRnJG2o+Yoj+aQakUlmLQnOs7lwqPuGTISIdxfHxgZqKOSHzp7+Vrw
         qDg9lTOLbI3OVXwmIK56uDFWJlzr6urrlGDiA3cik8/aiDRo+smCeBuqBIVHjdVMKljy
         Va6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921660; x=1788526460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAMHtBFkdmGbuLyv/P0Pos4ZoeExbNjIBs0ygiScewk=;
        b=EKWZT7ZJ5SWjQEYihjAP9iTmKl+syHRfsL7iMJdsq3xZ4BDtXzqJKCoAqOk2A5iBz6
         Ij8vkWOkyF3ScHP5KjHO4hbUkZM8eyVHdJ4n4LW+kyb6wBErTepaOepIhy2cTEG+2cbI
         BuooqNGxv6iM9jnWzh/sdd0E4qYxDsWbU8zRjPiMpu/MDSOjS0h/U/EBJlzCyjVFmqst
         x9dRrFzrm/mmPyo+MIDPdkN3SpOea15Cg5F2sLEifOt1R5MYdQgGfaIy4b9y0mhZ3aFe
         uP8ADoYK/udSQTILOeWv62xyH122XJT6+uDkAagZNaGzDP75c3erZvgtMzJR14x4gjt2
         e4nQ==
X-Gm-Message-State: AFuF++kbzGLz/JeKadIVUcyx5qzwGBYpnmc19aX2FHPaN6KWokUQOwua
	FCotYXuph8wolqcZ309McwwUlXfijqaPwcMt+Oro1v/WsZ2yphSwt9m7Rkqy61+vtQOHj18JOtw
	UZo2JOn0f1vGyk+jVa2znZF6pcLPMO9P4RkcwqmOSxZh50hQTV408V7we2fqHjv9AhW8zDfp9bX
	VGM2J93lkY9igTngkOQF/dpolXle9IHrn5qELdH1D2E3E34pFm4QC0mD8=
X-Received: from wmbe18.prod.google.com ([2002:a05:600c:5912:b0:495:5edc:795b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6b:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49b91bd99b7mr113262645e9.0.1787921659759;
 Fri, 28 Aug 2026 05:54:19 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:38 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-4-smostafa@google.com>
Subject: [PATCH 3/7] iommu/arm-smmu-v3-iommufd: Fix error path in arm_vsmmu_cache_invalidate()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

arm_vsmmu_cache_invalidate() issues commands in batch size.
However, if arm_vsmmu_convert_user_cmd() fails, it will return to the
user that it processed "cur - cmds" which may be part of a batch not
issued yet.

Fix this by calculating the returned entry_num solely based on the
"last" that tracks the last batch that was successfully issued.

Also, fix the number of commands for early failing condition.

Fixes: d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 25982bdbcbd9..91776c555f0e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -379,10 +379,13 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 	int ret;
 
 	cmds = kzalloc_objs(*cmds, array->entry_num);
-	if (!cmds)
+	if (!cmds) {
+		array->entry_num = 0;
 		return -ENOMEM;
+	}
 	cur = cmds;
 	end = cmds + array->entry_num;
+	last = cmds;
 
 	static_assert(sizeof(*cmds) == 2 * sizeof(u64));
 	ret = iommu_copy_struct_from_full_user_array(
@@ -391,7 +394,6 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 	if (ret)
 		goto out;
 
-	last = cmds;
 	while (cur != end) {
 		ret = arm_vsmmu_convert_user_cmd(vsmmu, cur);
 		if (ret)
@@ -405,14 +407,12 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 		/* FIXME always uses the main cmdq rather than trying to group by type */
 		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
 						    cur - last, true);
-		if (ret) {
-			cur--;
+		if (ret)
 			goto out;
-		}
 		last = cur;
 	}
 out:
-	array->entry_num = cur - cmds;
+	array->entry_num = last - cmds;
 	kfree(cmds);
 	return ret;
 }
-- 
2.55.0.897.gb25b4bd76c-goog

