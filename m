Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961808;
	b=4SFFoLndEFcVyw8CV4sOHJ45zzHN6NZ+54WDvEXCC3oQnEXU55ci2egZtVNWuyl+iwnr
	 QpZNqsiaQ42dKFeMWv3/RoNV5n83KubvC6qtoejdCiBgM4nUT8tIGbKfhg+DGG51cTRO3
	 6d4FOfCCA0jHB/nARKMFM8zzhg49dfc9xqyPvIeuvbkCAuoArquWFD5pz6GEUQuwMlINO
	 pUNVMJKLFS8OzBMeO9I57TWJ4vUuG0QlEUmknKXYGuZ71ZbmAlOPLL9ucW9ZW7yjy15cR
	 GUCX2ziUZzywDewq3p2V30QdhJ10Xrao6nSbCJuks8SUByzCcHMB5wtUnshhoRqODuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hsjGKsAeD8QaxYplDPt0EpldWweYT+Xkhb2l+NcQA2k=;
	b=5QR+SuP2ujRzVHCYswLvUf+1NBzOtlk++ytIb12B2rsNP8mfNrkP4Z+Ec21DROAs88XG
	 4NSdceVJzpCyJb0at5qs2Hf96TnnNJgTFrct+6aRgks6yhDmBOIDrzmCfL3eeGMiTPuyv
	 JUQhKDVl7lscTfKXp3GSnyNmC111yyHHmC2Ra/5o1JaNyi3t009q8S9bRXcQPJpphQOHM
	 veg5WffEXRsOQawPgnJl92CircoyVpL6QMXmwFjy+TPk5fZ1uuzD0a/D08KhEI7N5VZjN
	 4a+1cHjLrUsVTpK0P7Fs9mwNl7AC66pJGZj5VHSEJOL9LttL0Obcfr59FdOP5le6oPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FH9l+0PC;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC58606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC58606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FH9l+0PC
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67i72r1759530;
	Fri, 6 Nov 2026 10:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=hsjGKsAeD8QaxYplDPt0EpldWweYT+Xkhb2l+NcQA
	2k=; b=FH9l+0PCV+uL1gCx7gxdqtoa3VUvUUqiYG7FljwN1nKMk+/z16tla3Ufw
	OzUTVBDDCtVyvMnpDhh+5mW7ulDwZtS578x4dAIQGfazQoLunLhAYDs2I88v6CLN
	TjiKjfVut6GFgyOXyjTOoEIcCwxs035eKYKOmWwI1uWCgCRST2WYZy3aFcsQEaPh
	sQH+KcqPArxoxZhQzqrphQxBvVsMSoDh0gLuxHKZRVPzQbYLOV0yYm4w/jvNV2C6
	kSO3t+6INSTJUVB92U11Yu7KrRUh0pkHQI+uULDHbyG0WHN2wvqamDKV/m0rCWCT
	zKQR+AWAKYad6GPvXtaGI1H8wTIRw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3r9br7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 10:43:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AYx0i3268955;
	Fri, 6 Nov 2026 10:43:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hrka70m0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 10:43:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6Ah9RQ17498386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 10:43:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B511820043;
	Fri,  6 Nov 2026 10:43:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72F1520040;
	Fri,  6 Nov 2026 10:43:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 10:43:09 +0000 (GMT)
From: Mikhail Zaslonko <zaslonko@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Dave Young <ruirui.yang@linux.dev>, Jiri Bohac <jbohac@suse.cz>,
        David Hildenbrand <david@kernel.org>,
        Usama Arif <usama.arif@linux.dev>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kdump: Give crashkernel CMA areas unique names
Date: Fri,  6 Nov 2026 11:43:09 +0100
Message-ID: <20261106104309.3669583-1-zaslonko@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=LKHz05W9 c=1 sm=1 tr=0 ts=6aedaf42 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=hR5eV2nCcz1Zz8vUuPwA:9
X-Proofpoint-GUID: CVJwi85HMVi4di98wVuO7BMLHM0mh7Rm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MCBTYWx0ZWRfX46OaJdwxmACt
 eJ0su/177/KowBAIMk7OoWdwirMtqYrcLXeRoqSw7RAD5eyoCk8yh/wwbBr77pE5rpQXZSvawB7
 892uXMCU08MJVU79OyYVCtYtwag7kBg=
X-Proofpoint-ORIG-GUID: CVJwi85HMVi4di98wVuO7BMLHM0mh7Rm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MCBTYWx0ZWRfX80Zh2xVqO8L8
 D+Reh8yqrxwfG5pOc3L0Bwk2oYeYPnyyDec3iAiVYVSh6jG25dMlrtybpM8rLpHWeA/h1W2u6Ow
 BjdrIvJ7F/XJZcAt+Y+FNaDBZW2qjeMTdxChMZlDzx4Pd4NCsffzHeKP8Y73+u4GvO69bG8Lbv5
 GhwygeZQRGGRkUkGmCiLHw9hdXRJpR1qfXCukeE06hKF3z0zZtNSKfNF6ZE8WL7aI5ksJwJbxEr
 myQmewboZPFPGjPQrBWY+xAZPOaCqd2aS5mO7+8mGZILcE9DCiCvDtPWWoesvlvJE28pdk44MT6
 vj1QVwMC7RszoQyZ8MPc20F1fambmUPHdyv95efjGMO5BLV2Wcp7ZIdMtKCB1kaeTObHpAT5VeJ
 cbiYiApP49Z3WGbzDMVY8EwXTF7ouxQVRNBWDqBasMRaVtj//rISaUX5Ld/TaYECQbZz1D67RjK
 /nMwsxAnCLxXwOUk59g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060040

reserve_crashkernel_cma() names every CMA area it reserves
"crashkernel". If the requested size can't be reserved in one piece,
it falls back to several smaller areas, all with the same name.
With CONFIG_CMA_SYSFS, cma_sysfs_init() then fails to create the second
directory:

  sysfs: cannot create duplicate filename '/kernel/mm/cma/crashkernel'

and the error path removes the sysfs entries of all CMA areas.

With CONFIG_CMA_DEBUGFS, debugfs refuses the duplicate directories as
well:

  debugfs: 'crashkernel' already exists in 'cma'

so only the first area shows up in debugfs.

Keep the name of the first area and add the index to the others:
crashkernel, crashkernel1, crashkernel2, ...

Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
Signed-off-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
---
Found while adding crashkernel CMA support for s390.

 kernel/crash_reserve.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index eee37a11380c..e58318b1e092 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -483,10 +483,16 @@ void __init reserve_crashkernel_cma(unsigned long long cma_size)
 	while (cma_size > reserved_size &&
 	       crashk_cma_cnt < CRASHKERNEL_CMA_RANGES_MAX) {
 
+		char name[CMA_MAX_NAME];
 		struct cma *res;
 
+		/* CMA area names show up in sysfs and debugfs, keep them unique */
+		if (crashk_cma_cnt)
+			snprintf(name, sizeof(name), "crashkernel%d", crashk_cma_cnt);
+		else
+			strscpy(name, "crashkernel");
 		if (cma_declare_contiguous(0, request_size, 0, 0, 0, false,
-				       "crashkernel", &res)) {
+				       name, &res)) {
 			/* reservation failed, try half-sized blocks */
 			if (request_size <= PAGE_SIZE)
 				break;

base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
-- 
2.55.0

