Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744D45DF42
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148716; cv=none; b=ZngYial3XsF1jxHojCV1e0e6DuYVGYq2qVALDqyIEYxfg/Agx51D7GYEDDnNqJBjMXKeC4YyM/6P6rTJWNlpwoVR9ETlVla/jXd+IuMWE8MViw1kdwKoGDg+T4u2RGbIVZqzFcPEWh9GiJMXdApmJmxjFPC5v190MRdSXvk9n+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148716; c=relaxed/simple;
	bh=ZGPMsTO1lsF8Cwx8cviMxC9s+BajgyyHe6wCUk3b55k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWMKjP9NQDvfw1aBExRUsJ3TA37I3w8P3jUqmesffqE93D+inkF56bNw/2xpZ6alwqW+PyUeCb7eZxa9z/zLIlKD6ScsMAwMiDTOt9xdpwu/muwtuN1eLwkr27fx7QIbDuL5TbEHTNovAHmgI/NLbaeGGdWZ7IHEh7HA00wwA54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AJ2y0Sn9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AJ2y0Sn9"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAE8m51774771;
	Fri, 16 Oct 2026 11:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=gzIMU1lprTY7s5W0f
	0/E0wPeOKAOuhxsm4qumfhYU5U=; b=AJ2y0Sn9yYdZ3rtrwQQFzJL5nB4DSLyfQ
	DsMW3maBMBPnBNCOvexmN+mL7tAlSzHL1jdhtLTMWTfAEshQGyHhH6zIG7Qbf6rT
	zACopsdTer6Oh4pboLX47cRLgzjV8yDbuD+rl+MvEbgt1yBnnqYLOmb/HiZA18oL
	//pGmRhDFW1aOMaI9JDlfke8lKiX73F829Ws1f80OsWAbFeotKSgyHdnxDgA4JYv
	Ru1FpyXEr/rL8cH51+s91x3A6iYyjqSbR0+cKogz/CxOXha5kBjN2SpTFpkDc+WE
	Mytg9J0+2bEyYEBTmpgsWGYiykiDV1p5i0b77dtU1hbcaRlwk5T/Q==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhxwdp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:04:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAYsbq3534812;
	Fri, 16 Oct 2026 11:04:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h9ypqb2s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:04:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69GB4swT47579608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Oct 2026 11:04:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 285152004B;
	Fri, 16 Oct 2026 11:04:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 688C720040;
	Fri, 16 Oct 2026 11:04:51 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.123.124.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Oct 2026 11:04:51 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] powerpc/numa: Consolidate associativity lookup in parse_numa_properties
Date: Fri, 16 Oct 2026 16:34:10 +0530
Message-ID: <20261016110412.1380298-6-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX6qIn9ij9Muf7
 oS55GUmdLonBNOXNOdRGrpOCVILq/rVOhoOGg01DJcODCfnuNYWVbDnKMKV6PSkyJM7IwW2/Cxx
 VSco+ekOCj8iOxOp1V+/49uh56dR8rY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfXwB0PvEqIcSm2
 DugJ1NZ/wDKKbNgU7Lm2oo9wa8gapsTmV7xCMk9SGkiG1l8fZzzRo4NdJO2RV56V91mhVJRdb1C
 K+aUMItCShyP098E7fkUVYtK44F1fmN3FVn+mEHDvj6GhqJf3X7DRVtbTcBRvVuinQccLVkcale
 oYA2778l/TDbvrIXF2YxDyoxyEEPEYq/RX4barts63S3hRZ646zlizpzOPY0IjlfQgzYEXrcjIT
 D223Gv0ycPXrTkvJfH/X39PKBhc9str+aTRZ+yqbqWNxCBgiZCf7Cm2yGcLo/3Ldi1XQKfg21//
 Aep/y0QQKfHrDrFPNSfI4YJjRsuOEwR5XJ6SeuGBgXgwNV+JFPyrDFj5kCoiwCQN0jprP6kMECA
 W4IQL90eHKh8hM0tB9EltYSFHAi/dWjgn9FUV5kzOvuWhIDbF0MVHGIWIYL6jp4chngao3eQzRT
 56TtKLzVwkJ/O1TOTPg==
X-Proofpoint-GUID: ANmADZKCdFz1pbHFa_MSuqISLBh_XRh7
X-Authority-Analysis: v=2.4 cv=RoFQvymK c=1 sm=1 tr=0 ts=6ad204db cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=l-5_yRjKRVHm491GHVAA:9
X-Proofpoint-ORIG-GUID: GiBhVEH-_Sw07U0hpNdd0c4vyWharw-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160042

Refactor the CPU associativity lookup logic to reduce code nesting and
improve readability. Previously, the code had separate paths for VPHN
and device tree lookups with duplicated processing logic.

Consolidate the lookup into a unified flow:
1. Try VPHN associativity if firmware supports it
2. Fall back to device tree associativity if VPHN fails or unavailable
3. Process the associativity information once, regardless of source

No functional change is intended. Both VPHN and device tree paths
continue to work as before, with the common associativity processing
performed in one place.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index ffdb07b995a8..c2aefb60ed5a 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -920,6 +920,7 @@ static int detect_and_enable_coregroup(const __be32 *associativity, int index)
 
 static int __init parse_numa_properties(void)
 {
+	bool vphn = firmware_has_feature(FW_FEATURE_VPHN);
 	struct device_node *memory, *pci;
 	int default_nid = 0, index = 0;
 	const __be32 *associativity;
@@ -951,17 +952,16 @@ static int __init parse_numa_properties(void)
 	 */
 	for_each_present_cpu(i) {
 		__be32 vphn_assoc[VPHN_ASSOC_BUFSIZE];
+		struct device_node *cpu = NULL;
 		int nid = NUMA_NO_NODE;
 
-		memset(vphn_assoc, 0, VPHN_ASSOC_BUFSIZE * sizeof(__be32));
-
-		if (vphn_get_associativity(i, vphn_assoc) == 0) {
-			nid = associativity_to_nid(vphn_assoc);
-			initialize_form1_numa_distance(vphn_assoc);
-			index = detect_and_enable_coregroup(vphn_assoc, index);
-		} else {
-			struct device_node *cpu;
-
+		associativity = NULL;
+		if (vphn) {
+			memset(vphn_assoc, 0, VPHN_ASSOC_BUFSIZE * sizeof(__be32));
+			if (vphn_get_associativity(i, vphn_assoc) == 0)
+				associativity = vphn_assoc;
+		}
+		if (!associativity) {
 			/*
 			 * Don't fall back to default_nid yet -- we will plug
 			 * cpus into nodes once the memory scan has discovered
@@ -971,13 +971,14 @@ static int __init parse_numa_properties(void)
 			BUG_ON(!cpu);
 
 			associativity = of_get_associativity(cpu);
-			if (associativity) {
-				nid = associativity_to_nid(associativity);
-				index = detect_and_enable_coregroup(associativity, index);
-				initialize_form1_numa_distance(associativity);
-			}
-			of_node_put(cpu);
 		}
+		if (associativity) {
+			nid = associativity_to_nid(associativity);
+			initialize_form1_numa_distance(associativity);
+			index = detect_and_enable_coregroup(associativity, index);
+		}
+		if (cpu)
+			of_node_put(cpu);
 
 		/* node_set_online() is an UB if 'nid' is negative */
 		if (likely(nid >= 0) && numa_enabled)
-- 
2.47.1

