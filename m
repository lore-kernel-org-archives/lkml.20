Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160750;
	b=jC0yLXCy8CXROqYw6yFM9gd1qKyAoAeM2Opw+AIGPqCYPv9OK5gMpV1GxhfUoeQ66XIF
	 PWJGp+YfoMHSnRIOfZUjJWKm8T8PZwtG6j7NH9ApvlLR+Sab49LBzpYjBbT1v8oEIN5Dn
	 oqGgLyXKrVhSrUvCVgw3NFF2PfXo4y0+ZREYwrCH2GxTXxZmsQndsonqt6L3fEQ8lWBgU
	 wFGjfkelECXZUbb6TUiT+YgPM1XQFP5d0xZaQ5i2F86Mw2Fc3UTRZ5tRtVdgQKsS+e/dy
	 m7SNfdoCHfJNXqQs2RsLJKXoe1hFjJEfWMrlPMDmzQ30oDTTH0/AX5h+ej7VjDEyKhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MpDlwjuRFgwBHHvnjINiRA7cF+LE+auMwtdlBgg5/l4=;
	b=STgJtYHZWVjv4g2ZAJMv14Rq8ptM53m3Y9L9q2xkIc/aFfzMDrQMFWC9Oa7+Wd2yBOyl
	 kRhbcto6aMt6lZ+kyRV7Kyh/vFvhj6SGSWuhQEPz2lDyitcxBrSfpI12JJmvthDHGIM4p
	 kFSnBoioNhdcya0fOQaenmOgEwc8T1rDjrOERwzDGMeyPrgNow8DEhCl23MUIOgEqQc9f
	 /t23UcuXgkaSGpHHuEO/y2mNm8v6eDAJ5OY1axeaUHifxFOhZ8Ay70TOlPDSv4H/el7Gm
	 qk5fQT7CdwaeeaGAAGSPHnUQEO+ovUZrhrUubtgFJP9KopW6NsD+KU+MFK6xrYTfNSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="NlsE5S/g";
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94ED9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NlsE5S/g
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0j3pH3957940;
	Wed, 28 Oct 2026 04:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=MpDlwjuRFgwBHHvnjINiRA7cF+LE+auMwtdlBgg5/
	l4=; b=NlsE5S/gCL5/QtJD8e1i/Q3/PcpVW06RtWqXykHYXXPffgOnFqzdfC2W+
	O7t5Pmlq8ej0vSRTh1aYHp38SK8hcbtdRv77KXhrxzAjdVdcn6+w/OPHAQT1FnLr
	S417kOXQgwdRwrDkVr+prkSXPm1iZGzs7Qa7QPxyjqo0kyl1Cc5I38tHXQ0GmEIT
	z2GO1Fb9/PGFYwi9VxlkO68dYuNlGdQ5yLoIMCMK1E2i8WUYIH8myh2m4VWBZFgB
	ofs3ueeNUD7eszzZlLRWrllzjvKWSqyt46u/RvVjiolvlSGM6SGmJM+Xb2iGiiGp
	kYmFJmUXDzUnn0vhx/tX4yM/4MBKg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hgj3mb0jt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 04:12:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0o7Dj736333;
	Wed, 28 Oct 2026 04:12:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hjtnnbggk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 04:12:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69S4CKkf30802208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2026 04:12:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1953C20043;
	Wed, 28 Oct 2026 04:12:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE39620040;
	Wed, 28 Oct 2026 04:12:18 +0000 (GMT)
Received: from jupiter.bl1-in.ibm.com (unknown [9.123.6.78])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Oct 2026 04:12:18 +0000 (GMT)
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] MAINTAINERS: Update OCXL maintainer details
Date: Wed, 28 Oct 2026 09:42:17 +0530
Message-ID: <20261028041217.499673-1-mahesh@linux.ibm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX2VmK41fDm6B3
 pMOmLOAQppV4IdtRRsTIrvwIonbLOHsxJFbn68uSrKKdw1zoQLBCD/1ugQL010Ii0MuBxwh/rB7
 9Z/5TuGaRMFK4OAv37Qtc0N6H6D5S2w=
X-Proofpoint-ORIG-GUID: 2pk3XT-co2aNojj1OPwRvG3pFBb8pDrF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX+r0SRFozpAn9
 0M/am6MMW4bKcqL/TIpni9IphyLhSG7Rk4kP9FJu2jruISxPpg5/E0JIFHgI+CMu1QPRc1hJkkO
 g3CMcB0xhCGEfusFaoJ5xuCrpnHiuLNv4LXJM7fFlQjNqfpZwiWMfy4JIhAcEC3wxEyfiGfzD7S
 2UJj1W5sxaiC0cCaS3A87Dv4cL8jEG2Pg0jYF7XiaEBQQ9U4aut9AI3tgGsmJiC9SjKfEHilXBd
 hDQZg1g8+OsujJDNG0jnbF+n3O0SqhGsjY8rsns8h8yBkGqrTgkWIW6L9G3w1pGkOzDlxWovDWA
 nGNmx+HTiVlmPDpq80laAaOZNthk3rFuRKY6+revVPd9hyAPV4GWBF2ePes7vXy4sjq+BJJzgwq
 r7JTR6Oz2iE7dQxJQuTNub+vTxb3AmhYAMbhKaoJjU2CVHPM8GW+gu++SHmt96QM+H0c88XuSDF
 EZYbS2KKElycHInhUhg==
X-Authority-Analysis: v=2.4 cv=G7uJgNk5 c=1 sm=1 tr=0 ts=6ae17626 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8
 a=Zu9sFVggB4hjnozgOzMA:9 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: 2pk3XT-co2aNojj1OPwRvG3pFBb8pDrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280014

I no longer have the bandwidth to maintain OCXL. The powerpc maintainer,
Madhavan Srinivasan, has kindly agreed to take over.

- Add Madhavan Srinivasan as the OCXL maintainer
- Remove myself from the OCXL maintainer role

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7bc0bb7353d..aeac4300e0b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19967,7 +19967,7 @@ F:	drivers/net/dsa/ocelot/ocelot_ext.c
 F:	include/linux/mfd/ocelot.h
 
 OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
-M:	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
+M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 R:	Andrew Donnellan <andrew+kernel@donnellan.id.au>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Odd Fixes
-- 
2.56.0

