Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF69471271
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148710; cv=none; b=UUvzcCJWH0WvoWN/3jov/yWqhBJnB8aQpQoGNheTw//SabM7mJqQZZ2MblDNM9IVLgao4FiYOXL4X3VPgrjTHpcr7xapzG3I1PTSP7sDWM712B+P7/Uq3wgioyZ5r90nl8iJwefy/AhXk1k38XhrHLJ6cKO8EZvQqkoYui1NF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148710; c=relaxed/simple;
	bh=zRU5lUm6izUHOtnQguDkjU9FVD/wv6jBAfTJU0Js7Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WG4VeyZXfcHmG5Ihw8nTg0aWcrm44GRRYmQ3o8mHBzkmtmuDoNUswkgORvBwBsCTYFuzTuwV5phNza4HHHwN1B/OYKM0X/9jcCX7sJt6tAsfSymo/hke51Ras0ANItc6tfnhQbog/SOmxm6a2oiKdf1DlYgsVmstb/B+m9lp6XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qqyCrX3+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qqyCrX3+"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAEFu53425303;
	Fri, 16 Oct 2026 11:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QIC1Fl0ICckROyAjY
	3R8xPBrhgbPvYyJLgcigmdbLjU=; b=qqyCrX3+k9D73ABYfkbafJwpVMgCZHkiZ
	9f8C15XyH56GCATrqdCs8sc2lHTIHorX+wTAwztjLb5WD2ZDrfnrp8t/HKzUcr71
	tapq+6Pb4CSQp6tYN8U5lpnF6eJcQjh3tLyC6u4YBN5Vav/CTn4E98zCxBUxPc0W
	zALBeiayugYBdQaeKkPtuBZNeZAHdM5p7vdli6rFYIOq6hTeRhEwt3S+HbIhyB6w
	oQdZZZzkUXG8jEIZB+qGh53lxM5hnO0dluNWRfYvKDjCwDsYKo/NHuooYLFm8iH7
	/TKte0J66DXK3jaom94iyfmsC/pdwKHTtoiva89dN1I9DlaK+MPiA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwje9ng-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:04:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAKBDj2327627;
	Fri, 16 Oct 2026 11:04:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h9wvgbf21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:04:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69GB4n1k51511628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Oct 2026 11:04:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1293F2005A;
	Fri, 16 Oct 2026 11:04:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538CE2004B;
	Fri, 16 Oct 2026 11:04:47 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.123.124.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Oct 2026 11:04:47 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] powerpc/numa: Factor out coregroup availability check
Date: Fri, 16 Oct 2026 16:34:08 +0530
Message-ID: <20261016110412.1380298-4-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX78y6gFjYFT/o
 dhUXNkJdVI5pcnsEnkRWrUI82mS/ffLmjZxU58aSdeV0sow1I78dsaYlURaMmJ0D9yDQTp7m7m8
 5QQ+8AHd/oM7qbTBNGngCsH+gczVCNULjAKQS36xylEeplMTzBpsgFozlSC29Qhxzgk5fzLtNdk
 lt+n6pHJKxhY1GmxUecW1XHV4WqQOwMF32bG7RBVIxOJSJOfWp26W+vk/091lJLn0ihpvXWduWE
 UJWPEB9IIxW3TwK+PVD0F+p3f2YirtG6JysnyjYVxG0Hbj6gLhUqmeUviPTol3CP+kCEws020vo
 cQqJJ1fzffebRID2fBLVuxstNn7+ZQ8KPyML3PUmBgxWpnmXvk0MMWa27A4onRDjg9VdOeoACIr
 oidvsoROMnkiwFmCDfVmojxj7GDMLJ/oJcsp5/5tMDC/DesIb+DT2j9Yin6PJFxTFMOVG5IxNgH
 kno6GBMqWcr21yU1nFQ==
X-Proofpoint-GUID: KesnM_qCuiZ0x8uWMWZE-Kenb_Cjs5ir
X-Proofpoint-ORIG-GUID: NSp3SVh9kE5fpE5xMIS0AXpwSojTFawx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX2zez8ACKAtLl
 Uc8X215VBtQyG00a9Cq3EblK3/CugrpK0BilDfRywKAODanZqZuvxL7yCJUynrmLRq2nLQRThCj
 fdfPvpSF3Kn658yP8fJ6/+09nvm+bI8=
X-Authority-Analysis: v=2.4 cv=btHZl0ai c=1 sm=1 tr=0 ts=6ad204d6 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=4ndiwvc5_TsPzkbv8BsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160042

Coregroup information is present in the associativity hierarchy when
there is an associativity level beyond the primary NUMA domain.

Factor out the check for the presence of the coregroup associativity
level into a helper so that it can be reused when determining
coregroup availability.

No functional change intended.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index df3b51a1beb4..7cb37cb0c5db 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -889,6 +889,16 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 	return 0;
 }
 
+/*
+ * Coregroup info is present in associativity property just after
+ * primary_domain_index. In dedicated LPARs, coregroup info is present only
+ * if primary_domain_index is third from the last or earlier.
+ */
+static bool has_coregroup_level(int index)
+{
+	return index > primary_domain_index + 1;
+}
+
 /*
  * If hierarchy extends beyond primary_domain_index + 1, then next
  * level corresponds to coregroup.
@@ -899,8 +909,7 @@ static int detect_and_enable_coregroup(const __be32 *associativity, int index)
 		goto out;
 
 	index = of_read_number(associativity, 1);
-
-	if (index > primary_domain_index + 1) {
+	if (has_coregroup_level(index)) {
 		coregroup_enabled = 1;
 		return index;
 	}
-- 
2.47.1

