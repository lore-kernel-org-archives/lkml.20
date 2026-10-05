Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDA4AC161
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211077; cv=none; b=Df6OIulj5lu2mX8OyO7TzAN3BKmjpd0QjX2NhmloL6TKCqO2M7VuZz+2993Uy6cQnabQU/V6cAbmXHPMSFqXqbDe0+OPqkRD9Shm2quLX/tUDxh5M0RsiaI5030OdDzmqjWGWxnBdYAxhvQt3HQxJMjuUH4pVwaTdy/4mEHQUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211077; c=relaxed/simple;
	bh=InKd0aGfeFCx3LdYyd/roSH5k1JSRlrS3BGElWrnj1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f65aQy4ILJIn4rjYzirrhrhOK3VvYtPmNtQflC/eRKyAZabB4cuR58JI/12P3FwMJw2ZJwhvUHR6fdZbm+4JV308b0nHGpFuh7OT9m689UzOC8OsaAX35aIp5Tf0eO74e3TG98Rvs1FcEmob3o4buqgIKKfy0DvVfPIV9kXwU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoMTDZf5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoMTDZf5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so24251595e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211065; x=1791815865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFDGRaN1e/ydGZumamNoz8kHvK8qVk3vu4oV3GD+iPM=;
        b=PoMTDZf5G0Pqub7sbiAeq4Y5CCarFK8wiWQrKSsryrMAjoRFOiNp/P8PyNp7X+ZqaM
         SH4MOV+sHEDYBPnTLepD8edpKByFPzRMgxdoatpgR1My87pAq28jkaiH89JdnjZB53C+
         SbtOT7EWGSae4Drna8P7e0qXKl07YU1zv6LE9Ya+f1yUkbwGB51qwMbLpt9e7t/hlhAN
         UqlF5HP6SHGQw2TrYgDf4U30x4WJx+HvDTq/QtSjmBp/7UHlZc3YbA+JSgFw3k9xQSCc
         r0GndNLVrBTaRLFGiJR1vrtfeNhNIi2DnC1RAJoQCz28cW7ZrbQA2Q1KC0/AT7BJN/Z6
         c7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211065; x=1791815865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFDGRaN1e/ydGZumamNoz8kHvK8qVk3vu4oV3GD+iPM=;
        b=Z8byRfkMpFuIyaczLvhIT5eLeBxJtMYi+J2G0u9retOXBkd7Kya2Ufa+XVGWVebEEO
         b+F7ZKbSHZPYHMTahyr12U9xjEhzpfFcksGhKZqSdJNiyrr68mJp13H8QRUKq3LR9EYt
         G9sFMnab4a0ZpVZHLBOoxqUF8Dlr4ij3qKl6N+3nCwTLYUniLkJaD/C0lzNbqORhpb7T
         vBhJuDrAt4SyqFUupZkUbV8WarCt2rzbk3NuUEt8Pr4rdWP77LOysN6MrovYmfNzc0Ee
         LN4/EfM+6Ve1OlTq5naxX1xKchUXCIHzY1WbkQ7yLpvm5jC9oAnRQM2uSuBWbXKPCse6
         yswg==
X-Forwarded-Encrypted: i=1; AKwUvBxWiX1JkFBF6fOSysIbPrSq8YYH4aBsPMWJLmU+eRJ5pK5K/gg0mkduG3XjaHYg2i+lj7KoS3YT/nuoSr8=@vger.kernel.org
X-Gm-Message-State: AFuF++n91kvOHk9cv3DAlvcbL6E65PHP+9S03uomKPQi/PP+LLXrlv4d
	5O/RUUphBjGfZEC5ban9WSpkuTyUU8b78QAjnTZbKKhcX1kDDxyFCQTh
X-Gm-Gg: AYBFou2s5m1aCwLB7KhegvdZbBQfbxCCS2vxcrlOy61s9rdnoxFPHicwPLAc4xcv+ZB
	REmU2LEeTlziZtkoVEYPBDzZQ3Ed807RHyZQ1G9OsZbgIhFhoDA6DqfKZLTSEGWLtnISubG5L3v
	xCutOFjLsEVx72ZituE3NbDm+J6PwDCgVT0XnTv3ZtKuw3IRhS7sADmJcXvzm5t2qh9pcslwskI
	fLDbHb3vsCONHq4PUf3iejqnI/caFEcMjnsuZ5eeuSPbHNyQsXL8oUbO2+z9kdJRlbHbDK+9q15
	RsWMCiQ9xWNvEXPklWXFr9rWc1KRG2xni6IuX0wbFfGfTmLtOHgXDe/lWqqMx+0qzQH3O6nLLY6
	fSb1RGrHn/ImCfUCsnhhF5+lUVQEjfq5/F9srHjMEKtU9Arm5XX+Ac2i06j8Le02WFyrBQMYt74
	uFthZidv5KuX5fFOwE8rZmU/Ys3pfoEc2uLz05OxdAmqUGYQtf7GiSdemiY8ZHxvA4kY3wcbYba
	2VRKnC+EgFd9VyTm+gYoEp/o6A9aiGcxeP+pa4v54NcunyW
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr178833835e9.16.1791211064403;
        Mon, 05 Oct 2026 07:37:44 -0700 (PDT)
Received: from andreayoga.localdomain ([80.188.242.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm348555785e9.3.2026.10.05.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:37:44 -0700 (PDT)
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
Subject: [PATCH 1/2] iommufd: Keep dmabuf PFNs MMIO when filling another domain
Date: Mon,  5 Oct 2026 16:37:35 +0200
Message-ID: <20261005143737.2915-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005143737.2915-1-parri.andrea@gmail.com>
References: <20261005143737.2915-1-parri.andrea@gmail.com>
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

