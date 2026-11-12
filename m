Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513439;
	b=asFyrSqpSzsFkVNQ+APjoUEc01wmH+rRG6EBpd6KWBugpYTZ6KgfF8Usbaa1A6+sqVli
	 oVAAHM563KxJtzKgEhaivB7ViBNGmWJanU46PzOuof/yJoLccyLfCzJGLkoisVRcDEtEN
	 k27sYnpiPLGGOrUhipDrWkkNvjpUv9a1qgolSbMIP0vt/m8AmgT0NqhaqgaM4zigGVyL5
	 /YxXgg72cdzFpFmJX6AB7RonN3BoYiGsTbAKHizOYMkzkz3LFIbMfcEsd7Gx61V+MHc0P
	 6kHnkhoqiyAki8JT7OiusuNUdHEpj2/uc76tDseB20kPGWJ/TIhFDhEMnX+Dli9KI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=muUL/i0pK+uF2VtOqzLp+1QKzl/yRdA7lx+xaRgrey0=;
	b=phmwuUod/xQLTDqcvpxMSIaQpFWaS25O5SPm2Wu7Dvq1MYNpeq6rkxWVMjQ4icnL/uLi
	 a6PToK6T1WWhQz7YkN3734q9YDFx2TLPtLEoRp0V5Wzlq9ECKZICWNkww0TnDt1OTFEgx
	 JxJ/FVs08u9SOXpqZC4TkxptVQW60vDSIheNaTHwtrUNxdVNdbKUH+1aqLkSVJTURed/Z
	 /cNa7GnrDj+Aa7O0WMMDdlvIIExIR79z0bIm0JNY6EbVBS3k47GxdsQ44/LVdaNXoXiEY
	 12p1Hjx8+YcVJT6ivGnrTOQmMX6SOKZy4Py+IH6JcuRSTzo5KKQJFTBZHEB4MvYaeJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJHbQD98;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFAE606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFAE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJHbQD98
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-536c8f958d7so790711cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513438; x=1795118238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muUL/i0pK+uF2VtOqzLp+1QKzl/yRdA7lx+xaRgrey0=;
        b=TJHbQD98Scgj5MnwplzoUAe+Pm6QLJPSwjhQxUSqVdcuGVc0fDfrO4++n7mQrY2SIU
         ygD5g27+z77qGwHw4d1B3G/oFawhAqkQxK8cxzPOfXrY5xqlXNmSoOTt8VihqSLiBri9
         JD18Av+FkKv5dQ5rTtG+PPCRHyIGXT78rMUEvSf2mQnlgXRoEXPaJI36L8nerdgzKbwp
         4X8nHx8DbQQmpzm2tU75PD7dGAJdRxUaY3vUY/2y4y8tOqYdw/JxlhjMn7EXNcxnM8EE
         TBCLzSunPVyB6erq1E+TLpTtrUR9z7Rk074P+XveRIZAdEhq1WkGkN9hw72ZpQ37TlA7
         RePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513438; x=1795118238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=muUL/i0pK+uF2VtOqzLp+1QKzl/yRdA7lx+xaRgrey0=;
        b=dAdlX/Ejpt6/sk0O8FXPUx5ZsOWGhnOiFhru2kTw5T7CZUomGYcOb07lejCX69ZTvH
         1E0Ex0OAY/381sZFY6ubGpVg+Gln1dkOwQxPNh+ESOEExCMlhT5sDpPbI+hfKVrDDaag
         dQhzz5SgjoYJnUORn6rYeZvli6/sPgfE86Kcnjpp3MHC+mzHzfjFifrQ58wQXKZtAE3f
         U/OZwS2tZ5vhpsaFyR8LZoITUjz2uUWgj0n52l7kDHSJj49A7BVZYni+sVjzEyXxaS78
         Txdo0J/0Z1wG3E+BHoxvzR5/RlyG1Km6GZ7aTqsd9BUCc+VY025KVd1cElMTEnid4TWF
         Sjtg==
X-Forwarded-Encrypted: i=1; AL+hErGbHBfNju6NF7VSkGuZNnIaDVYybVbxCu3I7FWG+m8GJXROPUvoBg0cowbjutfcFWQV73KzQreq6K+oU0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f1bYHvUl/u321LMrOKiIxTbZ2ioGL684+U6sBp8Zad3JJkhvm
	aZfP7I0k72eZBCXB4vjgzw8Ote+/HmQkUf3hBobWvdJViKnVgJuYGKcS
X-Gm-Gg: AYBFou1M7lnwtAMctEDwdFY5fEeUgMQ7amEJQEkZA4VBOwbwVEvPzrS4H9XktYWSGAJ
	ujIWANcEEx7AKpTvxb9sRIRgg73lzSLpdMnTNl3aBvuB/yI4zOH3fCEIqmvYh/12DSTlODe4h8j
	4QtmFKp7UTzlqkX2sSDKAFSZxWIEZl68+fnDop1Cu6SCFtg2UfW+08Hv1Sc26F5OlrZdaTvTVXH
	n8BSjMv6ghqLZ1sjfodmZxZ+8dcKweSn3Tn5O+qFsggfU54n4RO/7F6DdU9PIV3N/3OhQj5KNjf
	m7ZAF08eKipG1wguI7SjDJmH7fbm5a/OxE8oi7AN0CXFsAA++cCckdMcw3DVDXlKYLmWHOYOSr1
	cqlw3kBvvBei0/7tf5bzMI+QlFqWccvo6XA3bELbx8e68ONgrCDrpOjWEvrJgUsCqw3x9clKN9c
	rcf4jdKVRXdgMnu46ywdXeKbD/Vr6yrrTuKrtzYSbruyhPHqO+uUSJ6QYCPlyp08DNAP/6vnu7D
	PyuYy8NJRMWezxYG+DJuupoulrk4FLMqcj8TMX+6PVFIfYpmWjKluihfd9NclE/3KPIqM10dN9f
	qXhiJzA0G6cf540RUC8mXiEA1JQ9FMaYaFvoetm6Sd/1VwIyoJ/2
X-Received: by 2002:ac8:610a:0:b0:537:6f12:69 with SMTP id d75a77b69052e-55ac888b9a3mr8854161cf.45.1794513437993;
        Thu, 12 Nov 2026 11:57:17 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad034918fsm2504851cf.4.2026.11.12.11.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:57:16 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 1/2] iommu/hyperv: Don't free a paging domain the hypervisor did not delete
Date: Thu, 12 Nov 2026 14:56:59 -0500
Message-ID: <20261112195710.1417744-5-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112195710.1417744-4-oss.patchbox@gmail.com>
References: <20261112195710.1417744-4-oss.patchbox@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hv_iommu_paging_domain_free() frees all page-table pages with
pt_iommu_deinit() and only then asks the hypervisor to delete the
device domain that points at them. If HVCALL_DELETE_DEVICE_DOMAIN
fails, hv_delete_device_domain() only logs the error, returns the
domain ID to the IDA, and the domain is freed anyway.

The hypervisor then keeps a device domain whose page tables have been
freed and can be reused for anything. The ID is also handed out again
by the next paging domain allocation, while the hypervisor still has a
domain with that ID.

Delete the domain before freeing its page tables, and keep the ID, the
page tables and the domain if the hypervisor fails to delete it. WARN
when the delete fails, as the domain is then leaked.

Fixes: 2690d4156b51 ("iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest")
Reviewed-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/iommu/hyperv/hv-iommu-guest.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/hyperv/hv-iommu-guest.c b/drivers/iommu/hyperv/hv-iommu-guest.c
index 9f4fa4315091..aa1db9db1e97 100644
--- a/drivers/iommu/hyperv/hv-iommu-guest.c
+++ b/drivers/iommu/hyperv/hv-iommu-guest.c
@@ -107,7 +107,7 @@ static int hv_create_device_domain(struct hv_iommu_domain *hv_domain)
 	return hv_result_to_errno(status);
 }
 
-static void hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
+static int hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
 {
 	u64 status;
 	unsigned long flags;
@@ -122,11 +122,15 @@ static void hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
 
 	local_irq_restore(flags);
 
-	if (!hv_result_success(status))
-		hv_status_err(status, "HVCALL_DELETE_DEVICE_DOMAIN failed\n");
+	/* If the domain still exists, its ID cannot be reused */
+	if (WARN(!hv_result_success(status),
+		 "HVCALL_DELETE_DEVICE_DOMAIN failed: %#llx (%s)\n",
+		 status, hv_result_to_string(status)))
+		return hv_result_to_errno(status);
 
 	ida_free(&hv_domain->hv_iommu->domain_ids,
 		 hv_domain->device_domain.domain_id.id);
+	return 0;
 }
 
 static int
@@ -466,11 +470,16 @@ static void hv_iommu_paging_domain_free(struct iommu_domain *domain)
 {
 	struct hv_iommu_domain *hv_domain = to_hv_iommu_domain(domain);
 
+	/*
+	 * If the hypervisor still has the domain, it may still use its page
+	 * tables, so leak them.
+	 */
+	if (hv_delete_device_domain(hv_domain))
+		return;
+
 	/* Free all remaining mappings */
 	pt_iommu_deinit(&hv_domain->pt_iommu);
 
-	hv_delete_device_domain(hv_domain);
-
 	kfree(hv_domain);
 }
 
-- 
2.43.0

