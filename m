Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A42EEE9E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620357; cv=none; b=VoBkDuMMM4mdLC75VW4HYfYPlqyGjJpQ0651+e7WcTeDsZ9ciHp5rsLbccrUcwVvzB9ayhEuULBIeJVht7GSIpHF6YFl/uK97jCNA3DuHPn8CxHtW/W1G0gspeedAqIbGhU7b+SYywvG/sRyK0o/63m2n/wlqfbQRh2iTpmEGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620357; c=relaxed/simple;
	bh=3QVurLSAGraMcuB/l1/ZjIpRTvBboxRlay12D6wJqO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eomgj2SHs7G8FrB/dALmmaaqdC266067UnpaH5wdoTM9VNn242R0AAuPYUmZLdNkUiIt5s59ocZanUSCn1V2OwBOviCOT7kGtawQbUykUAiz3wufls7aHb90rkk+D8rReclfzByJ8fWH7tlBDewioeDydHsNSRgtCXlkWGGd/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Dr6g+1yh; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Dr6g+1yh"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685CkXfm2741214;
	Sat, 5 Sep 2026 14:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Ij9z5kPKoq2gHQuITtcWtjtOtVF5/aUZLaHD2xUAn
	Ec=; b=Dr6g+1yh2Y7PdCauRLyBLQ7PhMl5S5H31CZLT+lPBEctq1psTb2b9CeHP
	sErtPvOSEfi//r60GAcziDQQLR33OK+7NTU1dwGfq+cDVOQMd+gVPUoPJg0c1iz1
	4Q1WqsMus0JCKODt0NonHb+/V4xrlyne8QJRycS4hAHyNiYNlGi9fcGe5pvIn4Pg
	C4ZcW6a92LOXt8tgin1zQPU9Du9TWlMcbZ1VJcMxjGZRq0oMj5TVSx9RsffHDqvS
	qw8ognmmImXb8qQaGBwSg6y/7bC3T489ZB2bhcguJlfKCktHs3ap0A7LTgc6EucS
	xQORg2ngLL6MvDDNFvHXpx9CnEhXw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbqjhcqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 14:58:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 685EuPiA015563;
	Sat, 5 Sep 2026 14:58:51 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggbm49d8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 14:58:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 685EwmKg27132432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 5 Sep 2026 14:58:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B078820049;
	Sat,  5 Sep 2026 14:58:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D08F20040;
	Sat,  5 Sep 2026 14:58:45 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.52.173])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  5 Sep 2026 14:58:45 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        Baoquan He <baoquan.he@linux.dev>,
        Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: [PATCH v2] kexec_file: remove unused arch_kexec_locate_mem_hole hook
Date: Sat,  5 Sep 2026 20:28:35 +0530
Message-ID: <20260905145835.501635-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NGhEFk5FrrcP4fqNX72WvC7krHIvxnGR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE2MCBTYWx0ZWRfX+mNDmrWD8o2/
 iJbpgaKFbeuL3k70UD6/9EB8vA+bznHTQ34yS6SkUw62gRJWRq9VSDqWro92jzWxDUcXyke6g3w
 c73NTcV1KGsnn0ojieBqmua3lHT3m4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE2MCBTYWx0ZWRfX0WNMTW+7pmkb
 XnxVF2GDahTK7zdNV5hn8+146ObORibZ/tbUXcO0Ct09HiUMD9mKI6wT7kgYKk8wtYAzggq4Vxp
 rRCo//mNHNhai9M3VKpy4nL4RIqbAGbhO4xhXbS8T8tS6H2Yd1Ffq+Ymtyj5+zY0N1xtFsbkQr0
 QxJt1MQ9KLZA7jbh7z2lThDgzNmZf1P8SdPg5WpTIJogjy8bG0piOp8e9qFbtj2mx4Hwd0e6KLO
 2yIBk5c1krg4i/LRruDQ/94iaY5KK0PUSAdeJcjpdZK3F0yi/8Z8XngxvyQQU6ARrnq3vI5JxmF
 s1hKcabVH82OmzvI7nbuKKWedDoO7RO4BspngQUNtG08ZyVhKRaBPuvLZySf5skCZwjQQAFl1zQ
 0X6GLfGUBwVMErfdeWShJlteUesowas7a21+u5q7BpLcX+CLk96cDfJdjEXziNsTeD489aXfmM3
 w89W0eN1JuaZWtQzL/A==
X-Authority-Analysis: v=2.4 cv=JaKMa0KV c=1 sm=1 tr=0 ts=6a9c2e2c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=_O3DOGVWAAAA:8 a=7ipKWUHlAAAA:8 a=JfrnYn6hAAAA:8 a=20KFwNOVAAAA:8
 a=uyLIc9BhHJT_Q4kdqAgA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=2TKV-7w1aU1AVAwN0oqT:22
 a=gpc5p9EgBqZVLdJeV_V1:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: NGhEFk5FrrcP4fqNX72WvC7krHIvxnGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050160

No architecture provides an implementation of
arch_kexec_locate_mem_hole(). Use kexec_locate_mem_hole() directly
and remove the unused fallback wrapper from the kexec header.

This simplifies the kexec memory allocation path without changing
its behavior. No functional changes intended.

The arch hook was introduced by commit f891f19736bd ("kexec_file: Allow
archs to handle special regions while locating memory hole"), and its
last user was removed by commit 6e5250eaa665 ("powerpc/crash: use
generic APIs to locate memory hole for kdump").

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: kexec@lists.infradead.org
Acked-by: Baoquan He <baoquan.he@linux.dev>
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changelog:

v1:
https://lore.kernel.org/all/20260827144452.508328-1-sourabhjain@linux.ibm.com/

v2:
 - Update the commit references in the commit message to clarify the
   history of the arch hook.

---
 arch/riscv/kernel/kexec_elf.c |  2 +-
 include/linux/kexec.h         | 15 ---------------
 kernel/kexec_file.c           |  2 +-
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 3e9a32acb8f2..ca5abbad59e5 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -91,7 +91,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
 	kbuf.cma = NULL;
 	kbuf.top_down = false;
-	ret = arch_kexec_locate_mem_hole(&kbuf);
+	ret = kexec_locate_mem_hole(&kbuf);
 	if (!ret) {
 		*old_pbase = lowest_paddr;
 		*new_pbase = kbuf.mem;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0af8ae4fdd08..e5f1cfc11fef 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -259,21 +259,6 @@ int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
 extern int kexec_add_buffer(struct kexec_buf *kbuf);
 int kexec_locate_mem_hole(struct kexec_buf *kbuf);
 
-#ifndef arch_kexec_locate_mem_hole
-/**
- * arch_kexec_locate_mem_hole - Find free memory to place the segments.
- * @kbuf:                       Parameters for the memory search.
- *
- * On success, kbuf->mem will have the start address of the memory region found.
- *
- * Return: 0 on success, negative errno on error.
- */
-static inline int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
-{
-	return kexec_locate_mem_hole(kbuf);
-}
-#endif
-
 #ifndef arch_kexec_apply_relocations_add
 /*
  * arch_kexec_apply_relocations_add - apply relocations of type RELA
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..9a981359addd 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -784,7 +784,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
 	kbuf->cma = NULL;
 
 	/* Walk the RAM ranges and allocate a suitable range for the buffer */
-	ret = arch_kexec_locate_mem_hole(kbuf);
+	ret = kexec_locate_mem_hole(kbuf);
 	if (ret)
 		return ret;
 
-- 
2.55.0

