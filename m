Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018994;
	b=2WJ2b1BXjduWWbspK+YQ8bYasZODFMJ5gwCKNWupVSMAri8TVh7fMIN/DRsIgjkRKyH6
	 Pr+SvqW+ajwri/IdBi9KXiQvFsEZrciBA0X87+i0+A4V3VqnhoAwKHqmepzbGbKMNg/yS
	 RSgv0jxp+Lgr6W4o54YYpVVltoaOjkZ2XRab61zaNuDrFVqLXVNGakTj7ZgS9Mo7K7iTI
	 tvOLZo+XOofdqPDZdhWs/LvsseI0v5Te2NLAfNQYwe8vMkKJTu8YbpXXpq4sQwxE6dMch
	 Wbyo2JFMDK3ZQJYFf/Fqbj2czXSSkYpAzgYd3x+D7+Tnsr21bIIagpmFCIFrE9VO7XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info;
	bh=nl+ZTQ29g0X1AjvjZkhWS+s9s3MSc8Ju6CfIIVOuOlY=;
	b=D6zhz5SZNT9so3S/8ESCR9LDYYBlePUatX8OGAnwLkG5NVJCJoFDRptIOUCgGjqHxRK0
	 tvv6KgVwBnPwxmFUljykiSTlOP8l7urd8WvgPRuiBnBTGFw5O5pBMUIo312n4j1KXWFbA
	 RuDUzp80etPnI0UFAg25jaPQL68gNTavnXM7aIvfvEpk5UcRJfoxYtAVyJMNFWUbWAFJY
	 gtVVCrIAZ7TMcIcIXuk9Ud4uNzH68Y818qwFOPSvbzvyebvI9XQputrbow22pkehdAoIN
	 q1qbNFeGLyqhUHpyCB2rEwELWthijFvCR34ded+ZlHHi8bSoKzPO7teDit8Wn6hed6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=SQSr2+13;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C4606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9C4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=SQSr2+13
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAso3X019260;
	Mon, 26 Oct 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=n
	l+ZTQ29g0X1AjvjZkhWS+s9s3MSc8Ju6CfIIVOuOlY=; b=SQSr2+13iFiG+hRJI
	VBMz0VKmHOP8LDWgXTOrUZxPccXKQHx5B/JJREbSAY1lfJR/dEb/ULVbgRtid5Oc
	IzC64q1ei5DA2e9Yw0yUV2zCPsUgdFhWrVqI96orMjrjEyZuKd6rx2f/JxvwfQXs
	IfJqsg2e/7hgaI5EzY1u/DH1cOSbrsQ8DnILo3plkjOWovLiE6paqs/w6/GYbN0r
	INiq9wTnJUhvD2NaH6Trx+awVOPbcp+1xihMakvTRxtJ1dzsbsYRE0C7jiMuHya6
	oXmPkalRoq/JUzInr5DQ+JqO5ZlYp/eX/BK4G9ZzXaPiJq+JIFuE2NhjG3o0bSg4
	UK9ZA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hgjxpsha9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 12:49:24 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 26 Oct
 2026 12:49:22 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Mon, 26 Oct 2026 14:48:36 +0200
Subject: [PATCH v3 4/4] drm/imagination: Simplify MIPS PTE definitions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261026-b4-simplify-mips-pte-defs-v3-4-587087d8a284@imgtec.com>
References: <20261026-b4-simplify-mips-pte-defs-v3-0-587087d8a284@imgtec.com>
In-Reply-To: <20261026-b4-simplify-mips-pte-defs-v3-0-587087d8a284@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <linux-kernel@vger.kernel.org>, <imagination@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793018955; l=7675;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=gZ+1jGk3nIcTdTnoMuSwuwb14tHqVwWtI5PUAt8LcEU=;
 b=RT02y9qeQidLjxhrWM6vinPjf+7lsxgAnB0vxYiOuKHTn56JYYCgxNJGB0t3WGODb3jnflIu3
 Uk5P+3aeey2AdX88/cDdvWQTWCq2p1StUA8IZ9EKZQ9M07q17/nxe0x
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-ORIG-GUID: tXiU-DB_pjByiD3qyHFzzdk3CeUairPP
X-Authority-Analysis: v=2.4 cv=XvhvqlF9 c=1 sm=1 tr=0 ts=6adf4c54 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=vkN0XxrHRKDbMJCO9W8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX4v6bYmydnVON
 VJn2nUO21pP7y37mVYbBBoh7Riryyj/n/UGGJIeu1wu3OQHLm2NcDV5RDvjmHdpraGSf82Id2TH
 H3WtECIYbF2reZNYJFKVX/QrST8AofCwdfaKAiHIYwM6XUnmFFBevCtY40SG7w2rneZQNcN3RIc
 gWtIIZk4+jFsRw0eNjYwOprSl/0jNf/tN3Mywh2t3ANltN0O/1MxpULfeCr8l1o8fj3XVbbgvDq
 Qg7TQmGnt6dAkAZv1/WMET3hf84SEf/+WemjqG1aGagXoOX7j5yRAmEONDjXdkvcKPccdJGf/tX
 cN65voBZ0D2SJp44Rcspv7rRDm/zb+zKEeKiu+BzCLIjjHGkfo2MFGI5kW1+mFCVnC7RIuGgfre
 TsO/WOebC+wf9CbSz8qHnNffJv9KIvmcUDKutfXfFFWXesNa2MibthZ7O/DAUK7J0WKyvKclSJg
 RktxJLV+Ii6IlNQdKKw==
X-Proofpoint-GUID: tXiU-DB_pjByiD3qyHFzzdk3CeUairPP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXxgCQNp868ja6
 QeaUCaM5jIsuT4p0vRltPVEEal4XLpfJfw7Rllapusw3mhBNGzQBHkJLEshalkouLp7h9mavhd8
 tW9/y7V9qfElXmQwf98rYEklwvQX9GY=

From: Matt Coster <matt.coster@imgtec.com>

Use BIT() and GENMASK() in the definitions of the MIPS PTE format, and
remove some unused definitions that add no value.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
Reviewed-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_mips_internal.h | 74 +++++++---------------
 drivers/gpu/drm/imagination/pvr_vm_mips.c          | 25 ++++----
 2 files changed, 35 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips_internal.h b/drivers/gpu/drm/imagination/pvr_fw_mips_internal.h
index f13829e63e1c..cbbf3982179a 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips_internal.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips_internal.h
@@ -39,63 +39,33 @@
 #define PVR_MIPSFW_MAX_NUM_PAGETABLE_PAGES (4)
 /* Total number of TLB entries. */
 #define PVR_MIPSFW_NUMBER_OF_TLB_ENTRIES (16)
-/* "Uncached" caching policy. */
-#define PVR_MIPSFW_UNCACHED_CACHE_POLICY (2)
-/* "Write-back write-allocate" caching policy. */
-#define PVR_MIPSFW_WRITEBACK_CACHE_POLICY (3)
-/* "Write-through no write-allocate" caching policy. */
-#define PVR_MIPSFW_WRITETHROUGH_CACHE_POLICY (1)
+
+enum pvr_fw_mips_cache_policy {
+	/* "Write-through no write-allocate" caching policy. */
+	PVR_MIPSFW_CACHE_POLICY_WRITETHROUGH = 1,
+	/* "Uncached" caching policy. */
+	PVR_MIPSFW_CACHE_POLICY_UNCACHED = 2,
+	/* "Write-back write-allocate" caching policy. */
+	PVR_MIPSFW_CACHE_POLICY_WRITEBACK = 3,
+};
+
 /* Cached policy used by MIPS in case of physical bus on 32 bit. */
-#define PVR_MIPSFW_CACHED_POLICY (PVR_MIPSFW_WRITEBACK_CACHE_POLICY)
+#define PVR_MIPSFW_CACHE_POLICY_CACHED (PVR_MIPSFW_CACHE_POLICY_WRITEBACK)
 /* Cached policy used by MIPS in case of physical bus on more than 32 bit. */
-#define PVR_MIPSFW_CACHED_POLICY_ABOVE_32BIT (PVR_MIPSFW_WRITETHROUGH_CACHE_POLICY)
+#define PVR_MIPSFW_CACHE_POLICY_CACHED_ABOVE_32BIT (PVR_MIPSFW_CACHE_POLICY_WRITETHROUGH)
+
 /* Total number of Remap entries. */
 #define PVR_MIPSFW_NUMBER_OF_REMAP_ENTRIES (2 * PVR_MIPSFW_NUMBER_OF_TLB_ENTRIES)
 
 /* MIPS EntryLo/PTE format. */
-
-#define PVR_MIPSFW_ENTRYLO_READ_INHIBIT_SHIFT (31U)
-#define PVR_MIPSFW_ENTRYLO_READ_INHIBIT_CLRMSK (0X7FFFFFFF)
-#define PVR_MIPSFW_ENTRYLO_READ_INHIBIT_EN (0X80000000)
-
-#define PVR_MIPSFW_ENTRYLO_EXEC_INHIBIT_SHIFT (30U)
-#define PVR_MIPSFW_ENTRYLO_EXEC_INHIBIT_CLRMSK (0XBFFFFFFF)
-#define PVR_MIPSFW_ENTRYLO_EXEC_INHIBIT_EN (0X40000000)
-
-/* Page Frame Number */
-#define PVR_MIPSFW_ENTRYLO_PFN_SHIFT (6)
-#define PVR_MIPSFW_ENTRYLO_PFN_ALIGNSHIFT (12)
-/* Mask used for the MIPS Page Table in case of physical bus on 32 bit. */
-#define PVR_MIPSFW_ENTRYLO_PFN_MASK (0x03FFFFC0)
-#define PVR_MIPSFW_ENTRYLO_PFN_SIZE (20)
-/* Mask used for the MIPS Page Table in case of physical bus on more than 32 bit. */
-#define PVR_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT (0x3FFFFFC0)
-#define PVR_MIPSFW_ENTRYLO_PFN_SIZE_ABOVE_32BIT (24)
-#define PVR_MIPSFW_ADDR_TO_ENTRYLO_PFN_RSHIFT (PVR_MIPSFW_ENTRYLO_PFN_ALIGNSHIFT - \
-					       PVR_MIPSFW_ENTRYLO_PFN_SHIFT)
-
-#define PVR_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT (3U)
-#define PVR_MIPSFW_ENTRYLO_CACHE_POLICY_CLRMSK (0XFFFFFFC7)
-
-#define PVR_MIPSFW_ENTRYLO_DIRTY_SHIFT (2U)
-#define PVR_MIPSFW_ENTRYLO_DIRTY_CLRMSK (0XFFFFFFFB)
-#define PVR_MIPSFW_ENTRYLO_DIRTY_EN (0X00000004)
-
-#define PVR_MIPSFW_ENTRYLO_VALID_SHIFT (1U)
-#define PVR_MIPSFW_ENTRYLO_VALID_CLRMSK (0XFFFFFFFD)
-#define PVR_MIPSFW_ENTRYLO_VALID_EN (0X00000002)
-
-#define PVR_MIPSFW_ENTRYLO_GLOBAL_SHIFT (0U)
-#define PVR_MIPSFW_ENTRYLO_GLOBAL_CLRMSK (0XFFFFFFFE)
-#define PVR_MIPSFW_ENTRYLO_GLOBAL_EN (0X00000001)
-
-#define PVR_MIPSFW_ENTRYLO_DVG (PVR_MIPSFW_ENTRYLO_DIRTY_EN | \
-				PVR_MIPSFW_ENTRYLO_VALID_EN | \
-				PVR_MIPSFW_ENTRYLO_GLOBAL_EN)
-#define PVR_MIPSFW_ENTRYLO_UNCACHED (PVR_MIPSFW_UNCACHED_CACHE_POLICY << \
-				     PVR_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT)
-#define PVR_MIPSFW_ENTRYLO_DVG_UNCACHED (PVR_MIPSFW_ENTRYLO_DVG | \
-					 PVR_MIPSFW_ENTRYLO_UNCACHED)
+#define PVR_MIPSFW_ENTRYLO_READ_INHIBIT BIT_U32(31)
+#define PVR_MIPSFW_ENTRYLO_EXEC_INHIBIT BIT_U32(30)
+#define PVR_MIPSFW_ENTRYLO_PFN GENMASK_U32(25, 6)
+#define PVR_MIPSFW_ENTRYLO_PFN_ABOVE_32BIT GENMASK_U32(29, 6)
+#define PVR_MIPSFW_ENTRYLO_CACHE_POLICY GENMASK_U32(5, 3)
+#define PVR_MIPSFW_ENTRYLO_DIRTY BIT_U32(2)
+#define PVR_MIPSFW_ENTRYLO_VALID BIT_U32(1)
+#define PVR_MIPSFW_ENTRYLO_GLOBAL BIT_U32(0)
 
 /* Remap Range Config Addr Out. */
 /* These defines refer to the upper half of the Remap Range Config register. */
@@ -293,7 +263,7 @@ struct pvr_mipsfw_boot_data {
 #define PVR_MIPSFW_TLB_GET_PFN(entry_lo) (((entry_lo) >> 6) & 0XFFFFFU)
 /* GET_PA uses a non-standard PFN mask for 36 bit addresses. */
 #define PVR_MIPSFW_TLB_GET_PA(entry_lo) (((u64)(entry_lo) & \
-					  PVR_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT) << 6)
+					  PVR_MIPSFW_ENTRYLO_PFN_ABOVE_32BIT) << 6)
 #define PVR_MIPSFW_TLB_GET_INHIBIT(entry_lo) (((entry_lo) >> 30) & 0x3U)
 #define PVR_MIPSFW_TLB_GET_DGV(entry_lo) ((entry_lo) & 0x7U)
 #define PVR_MIPSFW_TLB_GLOBAL BIT(0)
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index b74386032e6a..f6fa723649d3 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -97,11 +97,13 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
 		goto err_free_pages;
 	}
 
-	vm_data->pfn_mask = (phys_bus_width > 32) ? PVR_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT :
-						    PVR_MIPSFW_ENTRYLO_PFN_MASK;
-
-	vm_data->cache_policy = (phys_bus_width > 32) ? PVR_MIPSFW_CACHED_POLICY_ABOVE_32BIT :
-							PVR_MIPSFW_CACHED_POLICY;
+	if (phys_bus_width > 32) {
+		vm_data->pfn_mask = PVR_MIPSFW_ENTRYLO_PFN_ABOVE_32BIT;
+		vm_data->cache_policy = PVR_MIPSFW_CACHE_POLICY_CACHED_ABOVE_32BIT;
+	} else {
+		vm_data->pfn_mask = PVR_MIPSFW_ENTRYLO_PFN;
+		vm_data->cache_policy = PVR_MIPSFW_CACHE_POLICY_CACHED;
+	}
 
 	pvr_dev->fw_dev.processor_data.mips_data.vm_data = vm_data;
 
@@ -145,15 +147,15 @@ get_mips_pte_flags(bool read, bool write, u32 cache_policy)
 	u32 flags = 0;
 
 	if (read && write) /* Read/write. */
-		flags |= PVR_MIPSFW_ENTRYLO_DIRTY_EN;
+		flags |= PVR_MIPSFW_ENTRYLO_DIRTY;
 	else if (write)    /* Write only. */
-		flags |= PVR_MIPSFW_ENTRYLO_READ_INHIBIT_EN;
+		flags |= PVR_MIPSFW_ENTRYLO_READ_INHIBIT;
 	else
 		WARN_ON(!read);
 
-	flags |= cache_policy << PVR_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT;
+	flags |= FIELD_PREP(PVR_MIPSFW_ENTRYLO_CACHE_POLICY, cache_policy);
 
-	flags |= PVR_MIPSFW_ENTRYLO_VALID_EN | PVR_MIPSFW_ENTRYLO_GLOBAL_EN;
+	flags |= PVR_MIPSFW_ENTRYLO_VALID | PVR_MIPSFW_ENTRYLO_GLOBAL;
 
 	return flags;
 }
@@ -199,7 +201,7 @@ pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 	end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> PVR_MIPSFW_LOG2_PAGE_SIZE_4K;
 
 	if (pvr_obj->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
-		cache_policy = PVR_MIPSFW_UNCACHED_CACHE_POLICY;
+		cache_policy = PVR_MIPSFW_CACHE_POLICY_UNCACHED;
 	else
 		cache_policy = vm_data->cache_policy;
 
@@ -216,8 +218,7 @@ pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 		if (err)
 			goto err_unmap_pages;
 
-		pte = ((dma_addr >> PVR_MIPSFW_LOG2_PAGE_SIZE_4K)
-		       << PVR_MIPSFW_ENTRYLO_PFN_SHIFT) & vm_data->pfn_mask;
+		pte = field_prep(vm_data->pfn_mask, dma_addr >> PVR_MIPSFW_LOG2_PAGE_SIZE_4K);
 		pte |= pte_flags;
 
 		WRITE_ONCE(vm_data->pt[pfn], pte);

-- 
2.43.0

