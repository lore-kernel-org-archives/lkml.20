Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906EF488219
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352591; cv=none; b=Bl4GNSOnVXcZjFueeD09U1PyswJBmtJl6QtL4U7NMZEDSFXaMdEdFijJ4mjd38e2DkT8bdlvazVWKT9id0oe6Cn2szdCX8zexgpA0bxkw/n7GYEE88YvpQfb39uUlHN8gI7mKk3jq0UqKLB5fnO+zQ4fw5kkvt+s9jntCSzVefo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352591; c=relaxed/simple;
	bh=IrhGbg+YXWaq6711Ey9UFnHjv0tJgsPvXhJvcPmXdIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwwSo7hcWwXOfubWhwZ2scyTIT2KTuo/Rxn5Q4Rcc0qyZzUUw3YI3bCsxbv199kRzn2QPw0l6+S8lsdyHsKMF0On/PVtW0FjMOM5ZF4eN9ycs3W+CdtgogBhY2IFMKK2xfw0aLwQdaWb5k3MmqPUKFRwWIb8ORAHEpFvcnhzvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ayzL9ECJ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ayzL9ECJ"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CVlAx4189252;
	Wed, 2 Sep 2026 12:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9USx7SBxQdUVBkBwl
	naMqaLZsuMs+5ljn2vpYH326po=; b=ayzL9ECJCGIh8kSqSUU7JO1tN7pZ6NT6v
	4HdBCg3H6oyqN5zbCqbonH7IMtlmZ296PtxoX5yX2UdKYV3aB9lLzS8IZPt8SWv7
	iEWLp3D/okF2g3WPDPw1gmvysi6tv02NkbvlEqeH0xk4cVoiWZ0krAYpIU5udoOz
	9+1itECSfJpMNT3vNEwcl1MBYryMU7KrwPEWih5vuYU3cB4ifVbFgjlZHEUOVkBr
	UJygtoLVb+I5XNbb/e1RpwPazZXwHr/rUPzCHHodlPuLvWZe32naFmoaqvn5xMFY
	FKQwDBMhVTzy0yqWzQ3/Weqf1aoK1drUIr9k2fq5CUpjwTov/1hnw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbpx5pd3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 12:36:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 682CU1Ki024915;
	Wed, 2 Sep 2026 12:36:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gecjaj05w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 12:36:04 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 682Ca0Of39256406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 12:36:00 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87A7820043;
	Wed,  2 Sep 2026 12:36:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 224FA20040;
	Wed,  2 Sep 2026 12:35:57 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.3.140])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Sep 2026 12:35:56 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: skiboot@lists.ozlabs.org, arbab@linux.ibm.com, mahesh@linux.ibm.com,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] powerpc/numa: Simplify find_primary_domain_index
Date: Wed,  2 Sep 2026 18:05:00 +0530
Message-ID: <20260902123458.340456-6-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902123458.340456-5-srikar@linux.ibm.com>
References: <20260902123458.340456-5-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=PPc/P/qC c=1 sm=1 tr=0 ts=6a981836 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=PUaLgzmSHm3KdX723h0A:9
X-Proofpoint-GUID: HyVEp5nbC4GRYEsQGOpoOYb2ioRYH7BH
X-Proofpoint-ORIG-GUID: p9cgBGVPMIrlnbsmqXXp-URB0jLhVryp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMSBTYWx0ZWRfX+Rv60LOYO/ob
 Xhhs40CxyGL6LlWn8lbyAket0vuxT+xmzZJyXjaXnpRDlnGuPFY+ZBww0M+4jnHq/JdOBnqoICD
 OVDQSDV3E2poiUqTCYrXgnAtXYTpuxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMSBTYWx0ZWRfX6xchg/jDQ8uR
 qK46S+UraSCQn9tz+oqagV+QBOpwc1ApKHVb0buo0/WrgoVqmSHKprB5lmgLlPJCbI9RB2XPCye
 hRiKRwPx5ZQ7uhuQzYZFRuZrx5zgVxYwKGE2SqX53c8v4uC+9C2Rufh9g9P7Tr4ZQW282P9P3J6
 fNTkiuMAtpACjHGATdISapUvrURf8Af+I8zDtkifEx/xf1pA+DfaJd54jcEpvoIq0ie3I6ixZCo
 DgcRl8Mhyy1lgv1t/9nx3+Mwi693JMtdRoQeEZ9NgfRg1PEwp5GYSmXtFd+oNOJf6qynj49wgzY
 4+n+8usjq+jmajKBCBRXxZwfbJ1Dgv3jFwlMp/WU7Hwo87RDeNDrbtSt+JlWHBXq7dF2GLF8t1m
 SbYyyxj/3cx3cZjWXU15s0wHdWXQLdsgTZcpEMzuZ1qFYmct4UBVqKZZ+/In8kCx9KHzgEbraY5
 qqqsvp/lPJFyiBzeiBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020111

Initialize the return value once and use a single exit path in
find_primary_domain_index().

This is a small cleanup that keeps the existing behavior unchanged while
making the control flow easier to follow.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
Changelog from v1:
- Handle comments from Christophe Leroy

 arch/powerpc/mm/numa.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f4cf3ae036de..c44a80d8fc11 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -432,7 +432,7 @@ static void __init initialize_form2_numa_distance_lookup_table(void)
 
 static int __init find_primary_domain_index(void)
 {
-	int index;
+	int index = -1;
 	struct device_node *root;
 
 	/*
@@ -502,12 +502,9 @@ static int __init find_primary_domain_index(void)
 		distance_ref_points_depth = MAX_DISTANCE_REF_POINTS;
 	}
 
-	of_node_put(root);
-	return index;
-
 err:
 	of_node_put(root);
-	return -1;
+	return index;
 }
 
 static void __init get_n_mem_cells(int *n_addr_cells, int *n_size_cells)
-- 
2.43.7

