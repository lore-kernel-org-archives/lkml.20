Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.34.181.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405018;
	b=Kh1u2IQI+iOf166s9ZKjblHsm0nnOpVHiV0yWmYtzUosUcssDSiD1sB3YjX9WbCD2tib
	 P7k7Ox7krs3sWsjTmUqTTOFfqsfjkkqYdL+HsDog6xj7rFtaPmCxEEgQ/jjMvRnG9bqVH
	 WcO2YI+zK1yMt2TgdFCaPw+GfFN1I/mYNopFGXsld16dQm5RKy2MKiZos9UobHIONPGdp
	 gEbXCQxOhUaji1elfBdl+7cyHMgb8icRK/8otjPIgAmMwHesUHgiLST/BNi4H/08tO7pc
	 gWaTkOcaleaw+G9ekNh5iaHQaXcEGlbByLJLjB2yTSsi8+lhCWZZpyUIgLAt1H903zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405018;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zrHTcQlV4AyVqIqroeNGeen426XVcR1UEvzisJZZJLE=;
	b=sR0rHUoluXhPqtlb+3ezj+p5eB8xWYr4+F+jND5rCJWHrQQv1RdqmX6d1KybOwJesXE4
	 DPD8+fvcQfeSzBnKO6Kv+2xw7pnbVOG8MTO4QcqTo24gOqMpIxvUR6cJfJuuLy2oU34ij
	 wU50EWYtq4NKtnW6e4PVgwbVbDEt6H0DX3MBmji5/hWLnRllZddhqyumWqPkzhgw6E8XM
	 Y4IkmDGRtEMXizWsAczivD7KvUghi8XmAM1ABdUQ4vHtuhHaXYfZCwJCAhRh5HzA6higV
	 QWBHThQ4IpqqiH5ri/vpI3fDbNvnE8xEIxNgsTLETPfN48znSHP8fx1B+FtsBS/5gNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jlXIe5XT;
	arc=none smtp.remote-ip=52.34.181.151
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819D606A88B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8819D606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jlXIe5XT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405015; x=1825941015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zrHTcQlV4AyVqIqroeNGeen426XVcR1UEvzisJZZJLE=;
  b=jlXIe5XTfQ1xhsZCPWkQNyOmSIgQAM2BmBW+nilQqj/SOiTBhPs5x4Xe
   IxGHgCNs/JpHXmm+4CDHkLUhn7grtW96+26YpLUjcpe4z0rLOyYO7BsM6
   eNji05eiXDwc62bqRHe5zk4XAFknrc7xS+sB7hUFukPaKRd3AAnIkHwea
   XzISmF3Cw8v8+m/RShp1eX8qGmCZEwI57yLhBaE3wNtDMepSwqX1es09S
   xxW8tm+QJHzWTD4FNrASpyKyLaq5rgr6SH8NaB11LTIGBSPJDiYjcrvmK
   p/mqXKqVo/S/UNzMpnBNlciJmiQSVEXNFI6qBacVyfduVnZ4eD/LcETnj
   A==;
X-CSE-ConnectionGUID: OIlRcdDTQ4eQZdM7DLeP+A==
X-CSE-MsgGUID: p74bnluZTvWBmDYGYUqTzg==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33712275"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:50:13 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:5637]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 770cc0a4-3f67-45fe-aca6-1faaa9514f91; Wed, 11 Nov 2026 13:50:12 +0000 (UTC)
X-Farcaster-Flow-ID: 770cc0a4-3f67-45fe-aca6-1faaa9514f91
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:12 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:11 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 01/19] nitro_enclaves: Release the reference on a rejected region page
Date: Wed, 11 Nov 2026 13:49:50 +0000
Message-ID: <caf1c1fc8d69035017f23b97ea6d87f4592b77be.1794393486.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

A process that passes ordinary anonymous memory to
NE_SET_USER_MEMORY_REGION can leak one page reference each time the driver
rejects it with NE_ERR_MEM_NOT_HUGE_PAGE. Any process with permission to open
/dev/nitro_enclaves and create an enclave can repeat that, which may lead
to situations where the system runs out of memory.

The ioctl takes a reference on one page at a time and only counts it in
ne_mem_region->nr_pages once that page has passed both of the checks
that follow, ne_sanity_check_user_mem_region_page() and
ne_merge_phys_contig_memory_regions(). The put_pages unwind walks
[0, nr_pages), so it misses the page whose check just failed.

Count the reference as soon as get_user_pages_unlocked() reports it, so
that the unwind covers it.

Fixes: 7dc9d4309fdb ("nitro_enclaves: Add logic for setting an enclave memory region")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 0d7bdad924b73..a50dc4f737b55 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -963,8 +963,8 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 		gup_rc = get_user_pages_unlocked(mem_region.userspace_addr + memory_size, 1,
 						 ne_mem_region->pages + i, FOLL_GET);
 
-		if (gup_rc < 0) {
-			rc = gup_rc;
+		if (gup_rc != 1) {
+			rc = gup_rc < 0 ? gup_rc : -EFAULT;
 
 			dev_err_ratelimited(ne_misc_dev.this_device,
 					    "Error in get user pages [rc=%d]\n", rc);
@@ -972,6 +972,12 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 			goto put_pages;
 		}
 
+		/*
+		 * Count the reference before the checks below, so that the
+		 * put_pages unwind releases this page as well.
+		 */
+		ne_mem_region->nr_pages++;
+
 		rc = ne_sanity_check_user_mem_region_page(ne_enclave, ne_mem_region->pages[i]);
 		if (rc < 0)
 			goto put_pages;
@@ -983,8 +989,6 @@ static int ne_set_user_memory_region_ioctl(struct ne_enclave *ne_enclave,
 			goto put_pages;
 
 		memory_size += page_size(ne_mem_region->pages[i]);
-
-		ne_mem_region->nr_pages++;
 	} while (memory_size < mem_region.memory_size);
 
 	if ((ne_enclave->nr_mem_regions + phys_contig_mem_regions.num) >
-- 
2.47.1

