Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761D3839B9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148715; cv=none; b=JgsL2QdmJldLLTVhIO6sWrMc1fv2kQoFjWemP3oX1zBYTc/SHhJbnAP4zTucTUGMTR3FopP2wG1oGVq7wsp6dObAKR6qGFbvUIjkuPlGJwQfosAKXikU1g7ByZCsoA2oKed+5DAsab6JuA1B6AwBo92GghdP208pljx/TbK/dWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148715; c=relaxed/simple;
	bh=/iMUIlXTectjQ0/oCLbGhS/BCvZthkJAsOLJvBp4+kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFoLQaK183MnJME/IamF8hcRfplq5hMGWIQahqqNflVywTodEdrc0bF9yg2Ob6NyUKjtSjQHLQa+HkgEglo3xXA+ilIY4Dt6DpFLvLG13Cu4zCL5Pf0S3U+2gmyQEuWMBV2Cuf6aNR2+JTDye95aJeZ4Hn7ZG6gxYaOJ8Ai2fuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YdvaZ8OY; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YdvaZ8OY"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAEItT3635226;
	Fri, 16 Oct 2026 11:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=O1/k7BEPWedblCgRI
	KV+dMiPtjVo72vwqXg/OCQ9JYA=; b=YdvaZ8OYv13n9uYyLrIC5XC1rK2fthdy9
	578xWbto+5ScOaerniy0yuyE2H5fSxq4KHItP9tDTgtE9u2xuqDUa0KIEIgVNte0
	xbKdtWt7WqohD83tNb87312XXkTWrzDUVzfu9lcmblpmFWlgMr5VBTZZnm47NJ4r
	+gzwMpCqyAHqoglsFVpjJZWiXp6mVovp2YPA8FDfz62cB/8ATmov/6glQPIES+ng
	CEPYeLKtFsq7/atL2CAWpB8bwU3359DLnpK60JohtxKKX78iSK9OiMPyeyLKQrbr
	lMUzkjMuQvN9CSmsjYkcp6xh/X7MVPMjsPSvYWjCRpyoop53xXRhw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dugxwj6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:04:55 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAK3u62327450;
	Fri, 16 Oct 2026 11:04:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h9wvgbf2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:04:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69GB4p7X50659720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Oct 2026 11:04:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C0E520040;
	Fri, 16 Oct 2026 11:04:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EB622004F;
	Fri, 16 Oct 2026 11:04:49 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.123.124.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Oct 2026 11:04:49 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] powerpc/numa: Allow coregroup detection when NUMA is disabled
Date: Fri, 16 Oct 2026 16:34:09 +0530
Message-ID: <20261016110412.1380298-5-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016110412.1380298-1-srikar@linux.ibm.com>
References: <20261016110412.1380298-1-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Cr0q4X4D c=1 sm=1 tr=0 ts=6ad204d8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=EcGycqTSA_H_-Od9rUwA:9
X-Proofpoint-GUID: Aih-8uAAJBTbB3RdtG_ttuGEeIeQXkTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX8cB4CdSuYopP
 zgcWi+BIsjicvBnbVybuMFJjdM/QghjyI5NMKO3ctOSJjh44EyzWP+KjkoXQ6+48m/VucP9q2cE
 +onQRs58fTaBcAdPbmVoWAwaAL9S+R/dF000sI4KuTveebD70ejOMxj/2QfanGxMaRjHni/loTx
 vgsLdbRePz87skRDkn42g0Ee+oxaV1I/p4YD1q/+eIyuJAUIIMPwzU/L1Q5Jjy/ssK/6tVcP8at
 elvZ1qHilb1r5Kx3aL2K5/n3K5QniAANkUsBcEXwoaCesLXhPCkRjpncrA+5feugfPmQXm9bF+a
 qZro3y81tTDzj0uNgX16xb4IaijQT7Xsz8L74hTQvL51UGgeU4KcCbBGn1yc1oxnNtmkSflFeq0
 GJXq99AFdj09G6EvoLT6bwqIkwI8WMBgErzOMmCWQkgw4rCKAIeWnoiX8/fkem11fTQ27pTvH02
 BFx5VQ3jYJHgpS94SdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX+OJV/POAaKAj
 k3cumFAewXrvZf1PEi5xeJVOagB5bNG9g1QF61nFoOZxNG+emqSp/9IMI79ho05QS9JhgvDhgFU
 9mXGkmIWSX8Ju5XKlMpqpu+KmpAdwUI=
X-Proofpoint-ORIG-GUID: Z353TaMdnjwHGalThy0w42LRVzZCnhjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160042

parse_numa_properties() currently returns immediately when NUMA is
disabled, which also prevents CPU associativity from being parsed for
coregroup information.

Move the numa_enabled check after CPU associativity processing so that
coregroup topology can still be detected. Keep node onlining conditional
on NUMA being enabled and return before processing memory and PCI NUMA
information when NUMA is disabled.

This allows coregroup topology to be initialized independently of NUMA
node topology.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 7cb37cb0c5db..ffdb07b995a8 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -925,11 +925,6 @@ static int __init parse_numa_properties(void)
 	const __be32 *associativity;
 	unsigned long i;
 
-	if (numa_enabled == 0) {
-		pr_warn("disabled by user\n");
-		return -1;
-	}
-
 	primary_domain_index = find_primary_domain_index();
 
 	if (primary_domain_index < 0) {
@@ -985,10 +980,15 @@ static int __init parse_numa_properties(void)
 		}
 
 		/* node_set_online() is an UB if 'nid' is negative */
-		if (likely(nid >= 0))
+		if (likely(nid >= 0) && numa_enabled)
 			node_set_online(nid);
 	}
 
+	if (numa_enabled == 0) {
+		pr_warn("disabled by user\n");
+		return -1;
+	}
+
 	get_n_mem_cells(&n_mem_addr_cells, &n_mem_size_cells);
 
 	for_each_node_by_type(memory, "memory") {
-- 
2.47.1

