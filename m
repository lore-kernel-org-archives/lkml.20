Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3F49F107
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463947; cv=none; b=eUY/LrXKl8e3R6AdRLdXLFQuT5xeASHvKETpGeNBs/2BQC4FKpUnXZUBJOWL2KCl0XozRe4ONjyxFb92aiUWK4BIFPQTQaaCdz9moQw/AD4Hn4awJ9byj1bObk/0+C+ohqWWoxKoV2HKgZr7a1VtE6D/Rag4tdjLL8I3Qc9lM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463947; c=relaxed/simple;
	bh=InKd0aGfeFCx3LdYyd/roSH5k1JSRlrS3BGElWrnj1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ma0alPzOvIr6+N3m8YW82fpE+eGu1bPI9SntzDPvKQm7/SzChYiqjAsdPk8C5hCLefWEDbdCDVXN+CnYg5uAxIOHroCRzE6A+RW4Z2Pqnt30ilq20BpHBs2ylLbL8lrdZ5FXCczC2jI/VvRmtTg2Eg5oNxKmEjXvfvKjSg9RDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4iJo2XV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4iJo2XV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so21436875e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791463943; x=1792068743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFDGRaN1e/ydGZumamNoz8kHvK8qVk3vu4oV3GD+iPM=;
        b=g4iJo2XVdAOKu/5cplw4x7xD7zypKqgEZNUVuOgWzVf/XBw/3mCuaN+PLQFqWbh47T
         NGqg7uuMY/WqBuj+ZY+huwxSgFotsme7Cbf/hjp6ED96GYl9S4HbF9itaQ7+oXO9nhQw
         05BDGOQeEW1JAwEXlPIHAuLHoGfhDpUAhs09ac7Ob/Tu1MPwIz3NhYVeOOTTthaLqxMd
         Td7ATOewgJHs95sOpAbHevuqfUfdT4djiPRCbHLgZiWdLm0W6T/yHjLZ8I+n9oX9aCvM
         4fBa2Q2qr99f/4kOGdccQF6t9vKHah9+tSbDjcPfVNR57X4Ms3vMIcvg9P2bpym2hhAp
         TxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463943; x=1792068743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFDGRaN1e/ydGZumamNoz8kHvK8qVk3vu4oV3GD+iPM=;
        b=waIVpPa3y1K7T33YnCLRIehP3eawttzm7UzLMMxkuo3y6W7t4sbbpsgIGfOycfdIvb
         qxXqyYnkY106lZYV6hwjl3IcnoUZNqWTCDqaOwx8l20dmmx2ENMy+WvtvQQ0bSiQHmxA
         m7RAb7wg9xORScEKeReS6iw+f1wDKd4Ww6hfUSxYtBR5vDfJRNXf73RR1Lssr3ZGKtY4
         rGU6j/XuwS3u33AGuK+I4sVbDJCPkaneRQqdPUpYFKXWcKO194zoqcNm7Xocbse083iY
         QjOuxJWYWR6Ky8zEE00R8hUEMFaK9dgU1jVz/l7U5l4YwxjhN/EZw8XnMhKGhczudJ5Q
         zRmg==
X-Forwarded-Encrypted: i=1; AKwUvBxQDX2mCM+Me2vOL2t0Pz5HWS87a/f1TPDGDNvdyIUgGZLpO2VtUDJz0RFE90w4OuMY1CarvEhGo7nlJ3U=@vger.kernel.org
X-Gm-Message-State: AFuF++m/E2w2/V8/bTgDYZ+b0alMDdhaZziGFIShrgfrWoChyQxqMgGP
	ONRbhc15B38MZlqedt7ezLXRSMhv0tk5WtrLGV2C9CrB6PM2Q0nlpxzYyLWaFDo1
X-Gm-Gg: AYBFou16tQO5OTbcaFPhzWZXn2Lj4sG6xEoarhZdtXM7Yib/jt8BQAa9x9x9BxJkXQh
	57vHqucrBLUCcRPnyyiBlSQisy8agoSsEg7eN5SyOQNBpm0JimThHsogH//UpqMZjwAUhp6AOTF
	18rQ7LbOF8hNJWhwFiakgOOWafGf7BzSOGny3B/cvUwVL0oe62fMXMDwWGz/cSwlu//vBAICDLb
	UJuRYEEDODDIuQCbRPOOfSNBUvRvFsgR9e2KmYEuGKcu9M9iaFgaL98GxH8hPVOsOXwnxxjZEFa
	tJQ4EJ7oqPqWX7lQlI7lLYQSrVDUTfUYUbOvy7Kzzn2v0Ay6FQiTssAMJLJfTqKBge2i8lfdF2o
	wEQd4k8pOMIV9FQR6ElG16EOHcz1yyllR3omDMnlKNekD5BhUknSlSdmm7vWALoXhUvr1GtXWpv
	YtLCf3+Z5UxPllJpUw6Tr6GU6iMnS13gSyWpFCD1xDUvgw0bRgtj2YETY72XrsiX8z8QAthF0S7
	S2eTjtnArGmdXOurlnxqXfziFNZmDAhztzeAG4eoacy
X-Received: by 2002:a05:600c:524c:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a1802f632bmr93922995e9.14.1791463943266;
        Thu, 08 Oct 2026 05:52:23 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.41.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm10584338f8f.45.2026.10.08.05.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:52:22 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] iommufd: Keep dmabuf PFNs MMIO when filling another domain
Date: Thu,  8 Oct 2026 14:52:03 +0200
Message-ID: <20261008125206.11990-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008125206.11990-1-parri.andrea@gmail.com>
References: <20261008125206.11990-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A VFIO PCI dmabuf mapped into an IOAS is mapped with IOMMU_MMIO only in
the domains present when it is mapped. A domain added later, or a copy
of the area into another IOAS, maps the same BAR as cacheable CPU
memory: IOMMU_CACHE set and IOMMU_MMIO clear.

Once the area is in pages->domains_itree, pfn_reader_fill_span() reads
its PFNs back from the storage domain through batch_from_domain(), which
adds them with batch_add_pfn() as BATCH_CPU_MEMORY. Only a hole in the
span reaches pfn_reader_fill_dmabuf() and gets BATCH_MMIO, so
batch_to_domain() programs the later domain with the wrong prot.

The effect depends on the page table format. io-pgtable-arm maps the BAR
as Normal cacheable instead of Device memory, the AMDv1 and x86_64
generic_pt formats set the SME C-bit on it when the tables are encrypted,
and the RISC-V format with Svpbmt maps it as normal memory instead of IO.

Read dmabuf PFNs from the recorded phys for every span, before the
xarray and domain paths. The phys range is always available, and the
read-back from a domain only serves to avoid re-pinning user pages.

Sashiko pointed this out while reviewing an RFC that plumbs the dma-buf
memory type through pfn_reader_fill_dmabuf().

Fixes: 74014a4b55f5 ("iommufd: Have pfn_reader process DMABUF iopt_pages")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260716154123.32DC01F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 404f31d8f7291..2f6153108add7 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1178,6 +1178,15 @@ static int pfn_reader_fill_span(struct pfn_reader *pfns)
 	    WARN_ON(span->last_used < start_index))
 		return -EINVAL;
 
+	/*
+	 * Always read a dmabuf from its phys, even where a domain already
+	 * maps it: a domain can only report CPU memory PFNs, losing
+	 * BATCH_MMIO. last_hole aliases last_used, so this covers any span.
+	 */
+	if (iopt_is_dmabuf(pfns->pages))
+		return pfn_reader_fill_dmabuf(&pfns->dmabuf, &pfns->batch,
+					      start_index, span->last_hole);
+
 	if (span->is_used == 1) {
 		batch_from_xarray(&pfns->batch, &pfns->pages->pinned_pfns,
 				  start_index, span->last_used);
@@ -1201,10 +1210,6 @@ static int pfn_reader_fill_span(struct pfn_reader *pfns)
 		return 0;
 	}
 
-	if (iopt_is_dmabuf(pfns->pages))
-		return pfn_reader_fill_dmabuf(&pfns->dmabuf, &pfns->batch,
-					      start_index, span->last_hole);
-
 	user = &pfns->user;
 	if (start_index >= user->upages_end) {
 		rc = pfn_reader_user_pin(user, pfns->pages, start_index,
-- 
2.53.0

