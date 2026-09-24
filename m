Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEE71A6814
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247461; cv=none; b=tlJPhRXqtt0MBdjVPVuQoGsrDiwgvCYO7SEwSFALF7QYIkR6PkHMIiY5sFWpFpG2C35/xHwh7JbPyHiypAzGkOsJzNU3ucYb5VimzG7nc3jOWPRXhDFkeINyLCKAINmUvrMxrKlIW9bIL3ZBOeAdpT1IzvbLG64Gi2qMaTmDnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247461; c=relaxed/simple;
	bh=oOUCZZILsk0hUqiQcuS3HTKlqRWnJnpcIygspyaY3fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U/dc5Q8TsWPHPSouvt7AesbO12NcmdvQJe/u63CD8OFqOEhG8yUNzyoj2KsCzA018t9O2mI0LSxim9dTQmYNXPc9QyCyFk1bWelczszv4cYKjd4vL6q9aeYqao3kl14wPnItW+SRUi4nIqZIa4w8bWbFmu550vX0Tw7eSeqsz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TQ5jjoRE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TQ5jjoRE"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5cXRn1181139;
	Thu, 24 Sep 2026 10:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=0xwzu+veZri83zkDBLfszqSKll3o
	YYnhUkQxu8kB9BI=; b=TQ5jjoREWzuewzt6hEW+0ekG+QqtolDGzDks9K1oeepr
	E+gt7MsP9Sc2p/KfsgGm9nROEEUqNrgrqsJF/Z3KkN7jXMAYhWdIrMJMluY1ntCo
	VWjDGWJ5Feg+wMBvzBam7TlUomJC5saNP2C2lMoGvDV/vrwu51/Tg6cYPNDEoLw8
	4lmNav3YTCnTNyqLRlbPEJOr2I/Co3RR8il1xXxbyYCfF06q3J6KoE8dS3JjVdk/
	Vi1LF4+CDATu6o14V8OldkGfY2fqjJxxwsSUntwBS7JCLrZ9BQ8iclOTi1nO9DK1
	RDjMf+YOPYvSUAIqSzP7mSla3U4p1oDRRSEBL3lJAg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1qw47-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:57:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68OAB0RS1497550;
	Thu, 24 Sep 2026 10:57:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbu8w63h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:57:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68OAvMwn41615704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 10:57:22 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7272020043;
	Thu, 24 Sep 2026 10:57:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5224E20040;
	Thu, 24 Sep 2026 10:57:22 +0000 (GMT)
Received: from [127.0.1.1] (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Sep 2026 10:57:22 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Thu, 24 Sep 2026 12:57:18 +0200
Subject: [PATCH] arm64: Use proper include variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3eLKotR03cy85BzdNCOjFAtTU9MUUzMjJaCGgqLUtMwKsGHRsbW
 1AGbY9hZcAAAA
X-Change-ID: 20260924-syreg-incl-f22d8555d562
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.14.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8fjyX0uZLGl1K7oeBokdNDTmPasOnjHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwaKhA1bqkxLG
 bfWqS+n5lRrSmdiBEvs0mymLmd7YFKD7KW2HT1sFbdfwmpVd4K6nve8ubCMmNknaK1krVh04rhI
 iq6Gr9/Pxubkk76ruk6a5vdnB88esWsOXwl7A4wbkTVxihWxMz2Mds4Xv3YiG2+H5xmOPOwu2Xh
 ViE0ljtOVTeZWy9kTWRLWCIDEqzWmKPc6elzfCFxsmB32VgRUfszAnzuqqJWPBCqH8OL6p+whT1
 gMRwh6bDdXawbUEUYGMYYRd3AMx8h+8SjaS6hH+37KqR14D91FGs4CBOzE20DYNI9ICBngil/e9
 d05CpPC0LXs1D9o3eLzvCyG5xix9izv15gLbPVoP4btr3Yd2OsloiWYF40PoLV2pmsW+mbclg4j
 E9FppZV4eCZ3IBIvDFnMz4mo0PlamSJVVamgO1yvsG6xuosOBeeVcZfiqRdtqgH3BUDToov3gCK
 1C9L96TZXWyzx/ytkVQ==
X-Authority-Analysis: v=2.4 cv=O/KsLx9W c=1 sm=1 tr=0 ts=6ab50217 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=tLPIyUJEGWpIbh5-gX0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/Jzc70eXVoYJ
 rheCu1KwzLrbF9mN1OpD1eLgbdktDvPkftC8eBVa3FmiRD9C4+EYFhv3bofsURqZEm0CgpHZmpu
 4htuJjozUFa0yyuJCDzEXMNW3Z513Jw=
X-Proofpoint-GUID: 8fjyX0uZLGl1K7oeBokdNDTmPasOnjHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Use <> for including the sysreg header as it is not discoverable from
the current directory.

Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
This is just a spin off from [1]. There is no in-series dependency for
this patch and it fixes a minor issue. Using " for the include file does
not break anything (now) but it is not right as well. For [1] we need
this to correctly transform the includes to a new path for the
s390-generated version of this file.

	Steffen

[1] https://lore.kernel.org/all/20260918133107.1042730-1-seiden@linux.ibm.com/
---
 arch/arm64/include/asm/sysreg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..4bfdac9401bd 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -173,7 +173,7 @@
  * come from here. The header relies on the definition of sys_reg()
  * earlier in this file.
  */
-#include "asm/sysreg-defs.h"
+#include <asm/sysreg-defs.h>
 
 /*
  * System registers, organised loosely by encoding but grouped together



