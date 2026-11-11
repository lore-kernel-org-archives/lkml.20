Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438606;
	b=RS9WGpjKbJwcTJuuCquhH6DWht9HLn7PpL69y6Cc0j8bwRV05MtXBr4BBPFkrcSj/Sae
	 LWs+4QAkkbrtsMeyM1cBv5QHnDLBX0zc5IBQrpetBSCoV6MqIP5O3N38x40jiNrXJcHHa
	 IFqqr5FUiOifA8/1AXIhseOFfRf29hKbowCRheTcCS1b72oPrwLUDJmHqGwwdaQGiIVBQ
	 KyVZwgXjInh3rDjc5Lc8d4fgS6v2KQdnumAYzZUD7oaIVtgPZ8S0PvSgaW/FbQNX5LBiq
	 3MHfFo1et7dgNJDpN8487e7OcMyy+0nCVPJNfUqpoKkos+JyvWsThM5+W5hb78Nxslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438606;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=fDZYAyEwFLEPoM8ArVh+BkqBnqmxQ1pXMx5+/HtnG0M=;
	b=kJ1H30yR59CBtVa4ENzdikY0BBMnD/0vC2TIUebrxbmZ3AkUn2Wiq56QtJmFQKlLmgzY
	 eldQ+E7U2tonvjY3PguXfIBebVs+n7baoCsGu9bM7hlAZSf4FNq1nALEvziPgs0p8Mak6
	 V9j2icNKM8POTxMGn2fkLRf7Gp8/+CJIySWIRcEu26+JzsPIApxZtN4ECSZK0D0PBBb1w
	 aCS07d58dw/amj4lSC98dRb8RQidfVFvuC2y+adAErfyK6uDGBJu3QwB3/81ycpBk3l61
	 VfAZftmWBnjTpvubvGQs+wm/tZEyJPOnskVJB/S/gnt/Y4GN59+srUU4NJEoFF3sN4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=SmDXv4yz;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835B1606A321;
	Wed, 11 Nov 2026 23:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=SmDXv4yz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794438606; x=1825974606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fDZYAyEwFLEPoM8ArVh+BkqBnqmxQ1pXMx5+/HtnG0M=;
  b=SmDXv4yzxCe0a5u4O+rhss20JHsUbGJNZ1qw6KRWiSiDVn5Q1SYkreBL
   VMEys0voXJ3UpebzfqPK6DDCwBppsnTHZ7gTm3sBJuFTlmg9nJOUdB/hL
   /XorSm7pd/K6QOUevnFGn/SCnu/JoUhBJPen+IlH/FLllqSO6pPeiteVx
   gczIfblBghuXiDa4lSCX1ZZmxg9hcqTez/KF1dxxUi20+ZRMMGtXyiEiP
   m76cWS8Zovz+bjSxKPtFGB3jvi3EMwnPa8cyOeZx1JNZOjVp/KWIV273F
   RuRQ0fypGWqbQNiReTYPKI9laodmFOnuidhfoUgchRdqO7pZ3stKylcyh
   Q==;
X-CSE-ConnectionGUID: 05YxnUY0RjaUPxUvLr7Giw==
X-CSE-MsgGUID: iWVjtOBTSOSHBGZc5sNcHA==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33763365"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:10:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:29794]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 5a9ebbb9-a45f-4faf-9201-9772ae59d94b; Wed, 11 Nov 2026 23:10:03 +0000 (UTC)
X-Farcaster-Flow-ID: 5a9ebbb9-a45f-4faf-9201-9772ae59d94b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 23:10:03 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 23:10:00 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, <linux-doc@vger.kernel.org>, <iommu@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	<nh-open-source@amazon.com>, <linux-mm@kvack.org>, Jonathan Corbet
	<corbet@lwn.net>
Subject: [PATCH 33/40] nitro_enclaves: Assert the layout of the ioctl argument structs
Date: Wed, 11 Nov 2026 22:59:37 +0000
Message-ID: <32240c96b9b5ce841c6a71fb519e0047f01db097.1794393491.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300002.git.graf@amazon.com>
References: <cover.1794300002.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The structs the ioctls carry are the interface user space compiles
against, and a member that changes width or place breaks every caller
built before the change. Two members of the same width swapped for each
other leave sizeof alone, so a size check does not see it.

Assert the size of every struct in the uapi header along with the offset
of every one of its members. A transposition now stops the build at the
line that encodes the old layout.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 74 +++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index e2ff807ec673e..f3ad8ddc31e5b 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -80,6 +80,80 @@
  */
 static_assert(NE_NUMA_ANY == NUMA_NO_NODE);
 
+/*
+ * User space and the driver have to lay the ioctl interface structs out the
+ * same way. A size assert does not catch two members of the same width swapped
+ * for each other, so assert the offsets as well.
+ */
+static_assert(sizeof(struct ne_vq_info) == 8);
+static_assert(offsetof(struct ne_vq_info, msix_vector) == 0);
+static_assert(offsetof(struct ne_vq_info, notify_index) == 2);
+static_assert(offsetof(struct ne_vq_info, msix_entry) == 4);
+static_assert(offsetof(struct ne_vq_info, doorbell_offset) == 6);
+
+static_assert(sizeof(struct ne_shm_region) == 8);
+static_assert(offsetof(struct ne_shm_region, fd) == 0);
+static_assert(offsetof(struct ne_shm_region, shm_id) == 4);
+static_assert(offsetof(struct ne_shm_region, reserved) == 5);
+
+static_assert(sizeof(struct ne_add_device_args) == 688);
+static_assert(offsetof(struct ne_add_device_args, flags) == 0);
+static_assert(offsetof(struct ne_add_device_args, device_type) == 4);
+static_assert(offsetof(struct ne_add_device_args, num_vqs) == 8);
+static_assert(offsetof(struct ne_add_device_args, config_size) == 12);
+static_assert(offsetof(struct ne_add_device_args, num_shm_regions) == 16);
+static_assert(offsetof(struct ne_add_device_args, padding) == 20);
+static_assert(offsetof(struct ne_add_device_args, device_features) == 24);
+static_assert(offsetof(struct ne_add_device_args, device_config) == 88);
+static_assert(offsetof(struct ne_add_device_args, shm_regions_ptr) == 152);
+static_assert(offsetof(struct ne_add_device_args, device_uid) == 160);
+static_assert(offsetof(struct ne_add_device_args, vq_info) == 168);
+static_assert(offsetof(struct ne_add_device_args, info_notify_index) == 680);
+static_assert(offsetof(struct ne_add_device_args, padding2) == 684);
+
+static_assert(sizeof(struct ne_notify_eventfd) == 8);
+static_assert(offsetof(struct ne_notify_eventfd, fd) == 0);
+static_assert(offsetof(struct ne_notify_eventfd, notify_index) == 4);
+
+static_assert(sizeof(struct ne_vring_call) == 8);
+static_assert(offsetof(struct ne_vring_call, fd) == 0);
+static_assert(offsetof(struct ne_vring_call, doorbell_offset) == 4);
+static_assert(offsetof(struct ne_vring_call, reserved) == 6);
+
+static_assert(sizeof(struct ne_create_vm_args) == 16);
+static_assert(offsetof(struct ne_create_vm_args, flags) == 0);
+static_assert(offsetof(struct ne_create_vm_args, slot_uid) == 8);
+
+static_assert(sizeof(struct ne_add_any_vcpu_args) == 8);
+static_assert(offsetof(struct ne_add_any_vcpu_args, numa_node) == 0);
+static_assert(offsetof(struct ne_add_any_vcpu_args, vcpu_id) == 4);
+
+static_assert(sizeof(struct ne_alloc_memory_args) == 16);
+static_assert(offsetof(struct ne_alloc_memory_args, size) == 0);
+static_assert(offsetof(struct ne_alloc_memory_args, nid) == 8);
+static_assert(offsetof(struct ne_alloc_memory_args, flags) == 12);
+
+static_assert(sizeof(struct ne_add_memory_region_args) == 8);
+static_assert(offsetof(struct ne_add_memory_region_args, fd) == 0);
+static_assert(offsetof(struct ne_add_memory_region_args, flags) == 4);
+
+static_assert(sizeof(struct ne_set_info_page_args) == 8);
+static_assert(offsetof(struct ne_set_info_page_args, fd) == 0);
+static_assert(offsetof(struct ne_set_info_page_args, flags) == 4);
+
+static_assert(sizeof(struct ne_image_load_info) == 16);
+static_assert(offsetof(struct ne_image_load_info, flags) == 0);
+static_assert(offsetof(struct ne_image_load_info, memory_offset) == 8);
+
+static_assert(sizeof(struct ne_user_memory_region) == 24);
+static_assert(offsetof(struct ne_user_memory_region, flags) == 0);
+static_assert(offsetof(struct ne_user_memory_region, memory_size) == 8);
+static_assert(offsetof(struct ne_user_memory_region, userspace_addr) == 16);
+
+static_assert(sizeof(struct ne_enclave_start_info) == 16);
+static_assert(offsetof(struct ne_enclave_start_info, flags) == 0);
+static_assert(offsetof(struct ne_enclave_start_info, enclave_cid) == 8);
+
 /**
  * NE_EIF_LOAD_OFFSET - The offset where to copy the Enclave Image Format (EIF)
  *			image in enclave memory.
-- 
2.47.1

