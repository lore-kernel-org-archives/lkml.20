Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A55284B37
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082768; cv=none; b=LfMcRdMyRJux++U9xWQY8GTd9YFGe+goghXUlH8l5E4vd4xXZXCsPbrznlMY6jC3LRBuwHRULxZAOmsX2hvhfnAnhsFQdzKPr+WkncHrs2EiAmPTIOR/rqri7AxfwMIN3mFuUHRuR8P33vCBQalxJFml9wGRy+r8kTn36KOHISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082768; c=relaxed/simple;
	bh=OFZv7EcCFiqdfnpc6gvvZfQvfVqIWtdjKMQzvj0C+PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFOLTi7ZV/CmEYqZOKiglk/ruSTLmLh3cK8rIMPbOKzjkWMqhT5R8k9snaV/PbbRjtGWMtoF7algFU0+4Tlj/udD+GUnyQWNjiyJJ8kufSvI4aW+tEwM4WLzqdIx3H2GalcpJFmXBolHzCkEkG5xX5gvTAlCyEwfOfwIYQ7Ix60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D7W8Bc8U; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D7W8Bc8U"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBZMZ9311640;
	Tue, 22 Sep 2026 13:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LulcYv9Jp0Lu1nB+vR85V1wbxQeb9j7OBR+DItzxW
	po=; b=D7W8Bc8UXzmUxRCDvJ8iB3rXA/zVyMs58y0Vd4kNdNlTOwWT/yG79e4YC
	WLgFInT3tF7ULlLDTi8WwOq1Kx6iFg+FO39vST5MnlbZYqZlkQmUPSl7SJEKg498
	7ohf29pwb0Yy7fwp19xujk3iefXiH3kMvlZNTlpv33tCjD/NBF+xvYnR/8taLghv
	EZUTRLhallvTkYuHB6y3k6jKk7uvgFipVpCO7SBONaMtzn5u7waomboPHrHTaGDC
	YuujVEOrZDk7SOsojUm4e/rKN+4PfAupZKPx/imm/m7zD0E936Wa3UecZzHKE8v9
	2bdKUYJuMZnre6C2JBwxz5RVieoLQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgs5un7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 13:12:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBWbsn2751978;
	Tue, 22 Sep 2026 13:12:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gt5qjswek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 13:12:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68MDCMfr39190998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2026 13:12:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E917620043;
	Tue, 22 Sep 2026 13:12:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72D6D20040;
	Tue, 22 Sep 2026 13:12:19 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.bl1-in.ibm.com (unknown [9.123.14.142])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Sep 2026 13:12:19 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: kexec@lists.infradead.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Alexander Graf <graf@amazon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        George Guo <guodongtai@kylinos.cn>, Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] kho: fix global scratch size calculation
Date: Tue, 22 Sep 2026 18:42:16 +0530
Message-ID: <20260922131217.698809-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=V/XoQuni c=1 sm=1 tr=0 ts=6ab27eb9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=vggBfdFIAAAA:8 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=7ipKWUHlAAAA:8 a=pGLkceISAAAA:8 a=37rDS-QxAAAA:8 a=VnNF1IyMAAAA:8
 a=6T--hvP_5G-zAOdN4VIA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=gpc5p9EgBqZVLdJeV_V1:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-ORIG-GUID: gqttuO_BfG_NChiGaJ8ifRqvHypgo3Ou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5MCBTYWx0ZWRfXyn70vEhCBxwE
 l7yZOlpOLP0E6LbdHjqdeqS+F8Plw1yC5kBIyA0FhshOwKyDCD/0PRIc/Qj9rX6/6A862TdI/SP
 iV5CN0K3k8UW7QHeqihLoLSGRIW3p84G3LLizcHhO0v4ztWQPRhVXKRh8wldplg3m7s3SVxCfUJ
 55iilRGkKBU6Y/Zs5ugZTbbwb1QCDtDL/k4uEO6napGkCnEDTp9fHBksgyEMA1l9Lq8mJD29dP6
 xFT+/ToiraFfeVJXEKFxlpJDmoH0OtiH7Q3XeEdsvHqB4CJJs8RsAKF3sCCP+3g9egQWe5Z9Q4M
 aiHlsz6+8maTXIfEPXZ9Bm2bN0cSLF2j11FsO5EJlrXUzBZR5DEO6jQ+zzosQYupNcp+Kx9wwXi
 Us87dEyRSMj0W2l9vtP/Jx3CfQl8R8rdzdMmI7ZZ2Cr9TMfbrBMx11GW6UWstFnIrEtHxdwo30U
 sFkN1dbND6Y6mP5y6kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5MCBTYWx0ZWRfX1DEAxZwtydKR
 0AQ+w1UCSB7MBp3kxXEV6sMQlxz+uakelr+B05Z8ArxDRKeQklkoRZ/tOz/WWWN7DJqaAvIpCvb
 x7rT5zecPpiPl14akTJXeIG9x+LlLSI=
X-Proofpoint-GUID: NHADODa1pqiCXbj9VYHMXNSgyid34FeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220190

KHO calculates the global scratch size based on memblock-reserved kernel
memory. It passes NUMA_NO_NODE to memblock_reserved_kern_size() for
this calculation.

When memblock_reserved_kern_size() is called with NUMA_NO_NODE, it
counts both:

- memory reserved for a specific NUMA node
- memory reserved with NUMA_NO_NODE

KHO needs to distinguish between these two types of reservations.
When calculating the size of global scratch memory, KHO only needs to
account for reservations made with NUMA_NO_NODE. Reservations made for
a specific NUMA node must not be included in the global scratch size.

Add memblock_reserved_size_nid() to calculate reserved memory for a
given reservation type and NUMA node. When NUMA_NO_NODE is passed, it
counts only memory reserved with NUMA_NO_NODE.

Use the new API for lowmem, global, and per-node KHO scratch size
calculations. For lowmem and global scratch, count only memory
reservations that were made with NUMA_NO_NODE. For per-node scratch,
count only memory reservations that were made with the corresponding
NUMA node ID.

Remove memblock_reserved_hugetlb_size() since it has the same
implementation as the new API and differs only in the memblock
reservation flag being checked. The new API handles both kernel and
HugeTLB reservations through its reservation type argument.

Define the new helper as a static function in the KHO implementation,
since it is only used by KHO and has no users outside
kernel/liveupdate/kexec_handover.c.

On powerpc, the difference can be seen in the scratch_len values
reported by:

cat /sys/kernel/debug/kho/out/scratch_len

Before this change, the global scratch allocation was 0x12000000
(288 MB):

0x1000000   (16 MB)
0x12000000  (288 MB)  <- global allocation
0x5000000   (80 MB)

After this change, the global scratch allocation is 0xd000000
(208 MB):

0x1000000   (16 MB)
0xd000000   (208 MB)  <- global allocation
0x5000000   (80 MB)

The 80 MB difference is the per-node reservation that was previously
being included in the global allocation.

The same issue also affects lowmem scratch memory, but its impact is
limited because the lowmem scratch memory calculation is restricted to
the first 4G of memory. The changes also cover the lowmem scratch
memory case.

Cc: Alexander Graf <graf@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: George Guo <guodongtai@kylinos.cn>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 include/linux/memblock.h           |  1 -
 kernel/liveupdate/kexec_handover.c | 49 ++++++++++++++++++++++--------
 mm/memblock.c                      | 22 --------------
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..678fe466529a 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -487,7 +487,6 @@ static inline __init_memblock bool memblock_bottom_up(void)
 phys_addr_t memblock_phys_mem_size(void);
 phys_addr_t memblock_reserved_size(void);
 phys_addr_t memblock_reserved_kern_size(phys_addr_t limit, int nid);
-phys_addr_t memblock_reserved_hugetlb_size(phys_addr_t limit, int nid);
 unsigned long memblock_estimated_nr_free_pages(void);
 phys_addr_t memblock_start_of_DRAM(void);
 phys_addr_t memblock_end_of_DRAM(void);
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 7c4d86daf86d..dc809e1e768c 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -752,6 +752,31 @@ static int __init kho_parse_scratch_size(char *p)
 }
 early_param("kho_scratch", kho_parse_scratch_size);
 
+static phys_addr_t __init_memblock memblock_reserved_size_nid(phys_addr_t limit, int nid,
+							      enum memblock_flags region_type)
+{
+	struct memblock_region *r;
+	phys_addr_t total = 0;
+
+	for_each_reserved_mem_region(r) {
+		phys_addr_t size = r->size;
+
+		if (r->base > limit)
+			break;
+
+		if (r->base + r->size > limit)
+			size = limit - r->base;
+
+#ifdef CONFIG_NUMA
+		if (nid == memblock_get_region_node(r))
+#endif
+			if (r->flags & region_type)
+				total += size;
+	}
+
+	return total;
+}
+
 static void __init scratch_size_update(void)
 {
 	/*
@@ -762,17 +787,17 @@ static void __init scratch_size_update(void)
 	if (scratch_scale) {
 		phys_addr_t size;
 
-		size = memblock_reserved_kern_size(ARCH_LOW_ADDRESS_LIMIT,
-						   NUMA_NO_NODE);
-		size -= memblock_reserved_hugetlb_size(ARCH_LOW_ADDRESS_LIMIT,
-						       NUMA_NO_NODE);
+		size = memblock_reserved_size_nid(ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE,
+						  MEMBLOCK_RSRV_KERN);
+		size -= memblock_reserved_size_nid(ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE,
+						   MEMBLOCK_RSRV_HUGETLB);
 		size = size * scratch_scale / 100;
 		scratch_size_lowmem = size;
 
-		size = memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
-						   NUMA_NO_NODE);
-		size -= memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
-						       NUMA_NO_NODE);
+		size = memblock_reserved_size_nid(MEMBLOCK_ALLOC_ANYWHERE, NUMA_NO_NODE,
+						  MEMBLOCK_RSRV_KERN);
+		size -= memblock_reserved_size_nid(MEMBLOCK_ALLOC_ANYWHERE, NUMA_NO_NODE,
+						   MEMBLOCK_RSRV_HUGETLB);
 		size = size * scratch_scale / 100 - scratch_size_lowmem;
 		scratch_size_global = size;
 	}
@@ -790,11 +815,11 @@ static phys_addr_t __init scratch_size_node(int nid)
 	phys_addr_t size;
 
 	if (scratch_scale) {
-		size = memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
-						   nid);
+		size = memblock_reserved_size_nid(MEMBLOCK_ALLOC_ANYWHERE, nid,
+						  MEMBLOCK_RSRV_KERN);
 		/* Do not count HugeTLB pages. */
-		size -= memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
-						       nid);
+		size -= memblock_reserved_size_nid(MEMBLOCK_ALLOC_ANYWHERE, nid,
+						   MEMBLOCK_RSRV_HUGETLB);
 		size = size * scratch_scale / 100;
 	} else {
 		size = scratch_size_pernode;
diff --git a/mm/memblock.c b/mm/memblock.c
index 021db49eb7fc..9da748e774ea 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1900,28 +1900,6 @@ phys_addr_t __init_memblock memblock_reserved_size(void)
 	return memblock.reserved.total_size;
 }
 
-phys_addr_t __init_memblock memblock_reserved_hugetlb_size(phys_addr_t limit, int nid)
-{
-	struct memblock_region *r;
-	phys_addr_t total = 0;
-
-	for_each_reserved_mem_region(r) {
-		phys_addr_t size = r->size;
-
-		if (r->base > limit)
-			break;
-
-		if (r->base + r->size > limit)
-			size = limit - r->base;
-
-		if (nid == memblock_get_region_node(r) || !numa_valid_node(nid))
-			if (r->flags & MEMBLOCK_RSRV_HUGETLB)
-				total += size;
-	}
-
-	return total;
-}
-
 phys_addr_t __init_memblock memblock_reserved_kern_size(phys_addr_t limit, int nid)
 {
 	struct memblock_region *r;
-- 
2.55.0

