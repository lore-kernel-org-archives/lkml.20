Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452841;
	b=rm9j9s0y3QtkvK4ArhlW0X9ZpVuESlG0UlXWjWry7tbeehE6snYEVKk0Wc8F+n17fFJO
	 BzAxggHNz6H9YzIzoS697cP+4l+WemEIHcIBDgbjFAkKRBeCQb6Cayx4UsX8NCyjFH8Sf
	 Wr5st4pzoPrk3UlFTDgB4sTPgHA5hz8QN02cDhxax21rXs62zpXplgU/ZSAYEI4EfQaar
	 nnVOa2WqdIOX2ILh9e/bC8lIe7196KDJwX9ulJ4EO0tl322tTEVQSwOaBGBxN5FkNCIWQ
	 9d/JqHOJWeeRRthgW00pPVhRHybY1L32R9LKPWx2V5zS4uWsA8hG8uG5n5nGbcIjjGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452841;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ptqTEKaa/wQCxX5FQBv36t/SEDmI+dFQJlctOlurQO0=;
	b=GUE5kRCVNS7vtUCrmdmCfTqpzJD+eC5dWGd5gvsnmvVxbFl32Jv7reZxFI+85LtfM1T9
	 tPjDTAF8UxWv9nd+q4+7dReCI70zGIKzS3hiCuTBIGA551XEYQjGeLIIkRVmv4wvCHu5K
	 QAMs9BPyEK1j5rjkqQzN4qPqdBbMqheVQ6r6tNzTY29qNO9w4rojd0uJpEsxFC5+DiB8q
	 hiE5VDDcc8Ub1I50IqBQfk6GfJera4MetXklksC0saGyUU8azYVIdWqMqolG/GHjDk2Ar
	 VPke0tWWiCfkJnw6oVGVIGGUu35+AZ2KoyV2949Uf9VcF+/0QA8ij///L62/0BQzhKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IGRfpG9W;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B33A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IGRfpG9W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794452841; x=1825988841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ptqTEKaa/wQCxX5FQBv36t/SEDmI+dFQJlctOlurQO0=;
  b=IGRfpG9WjpbYEtoDxGB/sH9QIs1jIedJGRAO7e4HX4aO3AVfZDGwUxcv
   4EdJU1xyLMuygCKipU5UyGUrr5C/Yg23k5+ELjWNIle/dyu+WooIShR4x
   Hx651mcbsHSoB9Wce3Cv16z2fWdJWavkFBwLvVP/eFQgQ+nexlbtX2/EW
   mklGckL8RDrtiCBMyW5/BszTIG7XszpI0fLNYI9WTgyW4kIH6OcBBVdAG
   YgT8PE86BrKaXFVvaJEM8PiM87+ioSnpF2hsetlgfhSQoqHJUedZCLI8f
   VapOn58Bu12kLAyj3esXCbJvwcjtoTXzNVg9I8iQCM1RgFXVxFqGl4YkT
   g==;
X-CSE-ConnectionGUID: t84JfkZRT5qoVkqkr8JN6w==
X-CSE-MsgGUID: 8NIr0k5VS+WynXbp0R/VSA==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33546894"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:07:18 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:24529]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id 4cf5e5c8-93b3-4b54-b719-798688cbffaa; Thu, 12 Nov 2026 03:07:18 +0000 (UTC)
X-Farcaster-Flow-ID: 4cf5e5c8-93b3-4b54-b719-798688cbffaa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:07:18 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:07:16 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 08/19] nitro_enclaves: Let the region tracking arrays fall back to vmalloc
Date: Thu, 12 Nov 2026 03:07:04 +0000
Message-ID: <0b291c97efac8ddf131faf84495a8407d5ffcd4d.1794393487.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

NE_SET_USER_MEMORY_REGION allocates two tracking arrays that grow with
the region, and for a large region kzalloc_objs() fails with a WARN.
Neither needs physically contiguous memory, so allocate both with
kvzalloc_objs(), with __GFP_NOWARN since a region can push even
kvmalloc() past its limit.

Fixes: 7dc9d4309fdb ("nitro_enclaves: Add logic for setting an enclave memory region")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 821624c93795b..ac33fbcd41f35 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -938,15 +938,17 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 
 	max_nr_pages = mem_region.memory_size / NE_MIN_MEM_REGION_SIZE;
 
-	ne_mem_region->pages = kzalloc_objs(*ne_mem_region->pages, max_nr_pages);
+	ne_mem_region->pages = kvzalloc_objs(*ne_mem_region->pages, max_nr_pages,
+					     GFP_KERNEL | __GFP_NOWARN);
 	if (!ne_mem_region->pages) {
 		rc = -ENOMEM;
 
 		goto free_mem_region;
 	}
 
-	phys_contig_mem_regions.regions = kzalloc_objs(*phys_contig_mem_regions.regions,
-						       max_nr_pages);
+	phys_contig_mem_regions.regions = kvzalloc_objs(*phys_contig_mem_regions.regions,
+							max_nr_pages,
+							GFP_KERNEL | __GFP_NOWARN);
 	if (!phys_contig_mem_regions.regions) {
 		rc = -ENOMEM;
 
@@ -1036,7 +1038,7 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 			dev_err_ratelimited(ne_misc_dev.this_device,
 					    "Error in slot add mem [rc=%d]\n", rc);
 
-			kfree(phys_contig_mem_regions.regions);
+			kvfree(phys_contig_mem_regions.regions);
 
 			/*
 			 * Exit here without put pages as memory regions may
@@ -1049,7 +1051,7 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 		ne_enclave->nr_mem_regions++;
 	}
 
-	kfree(phys_contig_mem_regions.regions);
+	kvfree(phys_contig_mem_regions.regions);
 
 	return 0;
 
@@ -1057,8 +1059,8 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 	for (i = 0; i < ne_mem_region->nr_pages; i++)
 		put_page(ne_mem_region->pages[i]);
 free_mem_region:
-	kfree(phys_contig_mem_regions.regions);
-	kfree(ne_mem_region->pages);
+	kvfree(phys_contig_mem_regions.regions);
+	kvfree(ne_mem_region->pages);
 	kfree(ne_mem_region);
 
 	return rc;
@@ -1448,7 +1450,7 @@ static void ne_enclave_remove_all_mem_region_entries(struct ne_enclave *ne_encla
 		for (i = 0; i < ne_mem_region->nr_pages; i++)
 			put_page(ne_mem_region->pages[i]);
 
-		kfree(ne_mem_region->pages);
+		kvfree(ne_mem_region->pages);
 
 		kfree(ne_mem_region);
 	}
-- 
2.47.1

