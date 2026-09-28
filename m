Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503344A403
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584399; cv=none; b=Zht23UY6pS44PkaZv2A6y/SaHdmjqbsXRMtjZzzwKxfLmm/KxT3uY/iv4p4axwXdnrz7Cy9uvB5NxT6AZAa3UiDEEbNEWcIBpkj3uEVIF6Q3jWCUYJqxaMpdUUzbjAuWvepvjH01uOgcmlsNAOPB8ZrJVWW2UVSt/l5Bo1fF6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584399; c=relaxed/simple;
	bh=OgPDIhxcy9WMhN2oPUgitX4ucNxTnOkGmTbwiUZ6gp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8oWFjj7lisRHu2lgkh7EVC3ZPVV1ftmHSbRWN2s/h+Xf6kr/jYuEjdxYHImC1YDj7g6Hrhf+l8BJCCyFVlchFfoHgV5Kh/Kq+/HIrF8c5p3njDqhM0mqxBdztcz0HjMKXsLgONLINeZv3TiWVL0dOElFcXNxo5WNGdP626j8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EMBu7fRr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EMBu7fRr"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S85qVP584948;
	Mon, 28 Sep 2026 08:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7Bc0zJhjHMAXrImpO
	KslL8zOJCNXijlXsUXhxfOdrmA=; b=EMBu7fRrXPaKSDdUmda2p5v9SyyXtsL1i
	MP5I4usMHWCjPfSBGKHkMuhTCw6mVG6dIw4/OvBrLjgX5Wy5gb2Rs4Tc2OWyB4er
	Hu9c739VxsSPC67SKFLznMnUO0GbrK4KKvi3HssPsZcmS8y0ZtgINyml/iBAxtP5
	sb4Yb594rj5NKJMOY2wbLAwBmLLdKZY7BQHoBrTs6yc2hoadvjFIpYWTkNLADP6y
	X0r0Yj3v/mODtFy9DCFL24TviUt9CQoyTOAuXGTJ3QaRdwR9ZEjGgsJqQowZ2Zv8
	L7gu70RZYCay8a1JAClxf2latRBIzJo7iUXiINQSr5skMbxeyvAvQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5psyumm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 08:32:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68S82WPe4006222;
	Mon, 28 Sep 2026 08:32:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxrrw4g6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 08:32:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68S8Wipe31720172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Sep 2026 08:32:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10B642004B;
	Mon, 28 Sep 2026 08:32:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F4FC20040;
	Mon, 28 Sep 2026 08:32:39 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.bl1-in.ibm.com (unknown [9.123.14.142])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Sep 2026 08:32:39 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: kexec@lists.infradead.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>, Alexander Graf <graf@amazon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/2] kho: check scratch vs CMA alignment at runtime
Date: Mon, 28 Sep 2026 14:02:25 +0530
Message-ID: <20260928083226.107807-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
References: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Ofdb2zgTo9pqoJua7TyL8qwd-FMaDm25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX0YWrYABFJkDV
 t97A9oL9GVCJIxay8dj4FYRFooOwfy5pgjK/IPGc38g0guDZto6OFMV4p2+wS9Ow/NrfXhabw8T
 a64bBO9mKaJb8gO4b4NUStPtg/ky7dpvsb1AYtmcM7SU6Kiq/MaLJ8GhGjpdD3O6td8gnN1sSUW
 kOnTUFZ8JVU/d+zFK6ZbJedA5sXXL9n9nHCKgc/kCLPxtWmrQgEYg18Me/Ly1DwNcgHyzawiqBn
 O8QqBjyQ3YZXgQGTwBuScHVOss9dr2AITJdY1K5lAe7gE86doEq18q1ye/sQmZu5whoOz4yP/y2
 et3/HLjBnyWcs3Ash8D9rf1MLhNjBVn+MLkXDpJUHO/vRv0tIS3tiwqC6NyQMhoK0HpvbQXCSgk
 xF3G3uMFM6GT+rhB/qw4Tdl/W61+DHYX0I0O87615+l9y/k++Fqsy7AmnGKL2GOX2mek1nJURsR
 teTRQtE0gmqsV9jTI9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX3qa4hy//9ruW
 7mNVI5KwTFRcy7B/1lD9g/S+3TkXTrfFnRKUovIh/p2dNnpN+1FfneD8vX3+vQuRX3l36eWjchl
 BpEDNYJERlpsxdx2A40U/RPqcLa939E=
X-Authority-Analysis: v=2.4 cv=EY5d0/mC c=1 sm=1 tr=0 ts=6aba2631 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=vggBfdFIAAAA:8 a=Z4Rwk6OoAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7ipKWUHlAAAA:8 a=voM4FWlXAAAA:8
 a=_wNytXbCy_MvFOkzVhYA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=gpc5p9EgBqZVLdJeV_V1:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: pAossNje91-esPafWyRn0veSt5GKWndN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032

KHO requires the scratch alignment to be at least CMA_MIN_ALIGNMENT_BYTES,
and this is currently enforced with a static_assert().

That assertion breaks the build on powerpc once CONFIG_KEXEC_HANDOVER is
enabled together with CONFIG_TRANSPARENT_HUGEPAGE or CONFIG_HUGETLB_PAGE:

    kernel/liveupdate/kexec_handover.c:49:39: error: expression in static assertion is not constant
       49 | static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
    ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
       80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
          |                                                        ^~~~
    kernel/liveupdate/kexec_handover.c:49:1: note: in expansion of macro 'static_assert'
       49 | static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);

CMA_MIN_ALIGNMENT_BYTES depends on pageblock_order, which is not a
compile-time constant with certain configs, such as
CONFIG_HUGETLB_PAGE_SIZE_VARIABLE on powerpc. The next patch in this
series enables KHO on powerpc, so the alignment must be checked at
runtime instead.

Replace the static_assert() with a runtime check at the start of
kho_reserve_scratch(), before any scratch memory is reserved. If the
scratch alignment is smaller than the CMA minimum alignment, warn once
and disable KHO rather than continue with a misaligned reservation.

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Alexander Graf <graf@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 kernel/liveupdate/kexec_handover.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 7c4d86daf86d..dc76dd6b74da 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -39,15 +39,7 @@
 #include "../kexec_internal.h"
 #include "kexec_handover_internal.h"
 
-/*
- * This is the minimal alignment required by deferred struct page init.
- * deferred_init_memmap_chunk frees memory to the buddy allocator, which looks
- * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
- * If KHO scratch is not aligned to that value, buddy can access uninitialized
- * struct pages, which can cause a crash.
- */
 #define SCRATCH_ALIGNMENT_BYTES (PAGE_SIZE * MAX_ORDER_NR_PAGES)
-static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
 
 /* The magic token for preserved pages */
 #define KHO_PAGE_MAGIC 0x4b484f50U /* ASCII for 'KHOP' */
@@ -836,6 +828,21 @@ static void __init kho_reserve_scratch(void)
 	if (!kho_enable)
 		return;
 
+	/*
+	 * This is the minimal alignment required by deferred struct page init.
+	 * deferred_init_memmap_chunk frees memory to the buddy allocator, which looks
+	 * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
+	 * If KHO scratch is not aligned to that value, buddy can access uninitialized
+	 * struct pages, which can cause a crash.
+	 */
+	if (WARN_ON_ONCE(SCRATCH_ALIGNMENT_BYTES < CMA_MIN_ALIGNMENT_BYTES)) {
+		pr_err("scratch alignment %lu < CMA minimum %lu, disabling\n",
+		       (unsigned long)SCRATCH_ALIGNMENT_BYTES,
+		       (unsigned long)CMA_MIN_ALIGNMENT_BYTES);
+		kho_enable = false;
+		return;
+	}
+
 	scratch_size_update();
 
 	/* FIXME: deal with node hot-plug/remove */
-- 
2.55.0

