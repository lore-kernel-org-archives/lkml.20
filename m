Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74939481FCE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188145; cv=none; b=g4e5Jc1Gxcbml5bgclQ2Vkq9a3bZ5jPD06bbhzswa+CCpNBL9hHrM1PC4FTvx9pdu3zPRSoW8i9CUR2quw/3sLvAsEDQI+fiRfrUu0R1LDArjj/P+OUHswoCcUFZVT5yhKgPyX68NSuVu6pxRwzeImpcE7V1FutQUVyxAKTn/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188145; c=relaxed/simple;
	bh=vJisDw5DC1S0s1a4aehQdzDRsma82GyJ6e3BFLajTUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBKPVbFK6XLGgAXEJJuyzMEk94nwA59PgHtHdm9/0w7ZHMM/eH4ggPGklMCQCGE/BoBwYI9EwK6HV9BAiNWPcr+86mX5q3Zp2eqJL2E4fVyu6lINeluKGjq1VHXn2RE9cX2dKlDSE7Rstf6C7ByjceEVbehBpTFLU/7e9K6uW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MBF24Ejt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MBF24Ejt"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGZqAB3922730;
	Wed, 23 Sep 2026 18:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=6cs+K9BJAXUAW4hdllCCE0cbtyq7y2Zvu4pBy6ew7
	rM=; b=MBF24Ejt+V6HEW/0/jd31I+/Valeh9ffPeulyGtiUqb292ACYyrImKBBl
	dKUKTEZ2OytQuI3yk8VnAGBpJk1ocW+IZuoi7TM8INEds3ULGK3p6px8kE7YQAbV
	z8Y1zmIudzrh+OaVTggc9sRpRMLoCQd0ZONM143KqbP2qL6JZiJcPAkrWGzKUDy5
	LkhlFZpek0ZrKHisdHjH6tsOoVlEzKAAbVXkx+Jge4l/CkfNwko5XFwbmPKVKiQf
	KJGIemVUceeRahLCPeSvmZpnV8Sz/EifZO6C51z27Ont74TdSGWYjoP0LKVStX/X
	N8nSc9ui1bqIdwtg7y3k9POUWYPbA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgscxh2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 18:28:48 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGWls0681739;
	Wed, 23 Sep 2026 18:28:47 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gvb6qj9qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 18:28:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68NIShmt14418180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 18:28:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A90C20043;
	Wed, 23 Sep 2026 18:28:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D0DE20040;
	Wed, 23 Sep 2026 18:28:38 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com (unknown [9.67.83.254])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Sep 2026 18:28:37 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, nayna@linux.ibm.com, gjoyce@linux.ibm.com,
        ritesh.list@gmail.com, sshegde@linux.ibm.com,
        linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com,
        ssrish@linux.ibm.com
Subject: [PATCH 00/12] Refactor and harden PLPKS code
Date: Wed, 23 Sep 2026 23:58:04 +0530
Message-ID: <20260923182816.151451-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=V/XoQuni c=1 sm=1 tr=0 ts=6ab41a60 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=bCaFoZH6CQiNIRCMrF4A:9
X-Proofpoint-ORIG-GUID: hS0flbWP82QcT2CNLAL-V8m3QceiVDM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3MiBTYWx0ZWRfX7AiLAmVZ9CHp
 KjLt0EM2tDb5NQf3oG1tWkN3GDd1am/h5rSNHqmdfFcWml07UfH+tm0MTx4YApO3CZZjHgGAySE
 b0XljD0I5Z3NwofmT+Bp8+w9FWt/LvdUBpDZIdW8UFfQ5oC4xCvADIwOqYOL4zoP/fTWPbbKKWB
 FRwW5YHsP6+qz0uaXOiNxOrZjHB/j3PX4JMTH85uINC2o6bhxqhayQgx29qbnkBd+C/eje4szjA
 TLxQe9xFVgKmS4xpgJFy1YwT17mSxBd9iHpFnxyymf4wttaM6FAWrH1YkZUdEUtjyolBu46+54R
 jnybrYP1qrLE1W1NrlxVhTO7aCrFImLKK1/lT6ZRuWCnyxWpNnQvP+zKLaM9midemj+xJ57x10d
 qEP2I18eysKuXDocs9qd8XHndzST7dp5n87+p0GLwr6jvxfM2LkDUI9U7P3KzWM1OlO0Qr1grMV
 ZNuA6+NNK6vG/DoNUOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3MiBTYWx0ZWRfX9dqsmIjiVYpR
 BArVyhnegcYxVv3uPsKvzDfQ7+IZZMyV8zsHUqL71UoGLoJKy1HVL0X+f0ifX3I9nlJYczktgDb
 Mv8TeTEFN2xOtaJoysG8t1mvvM20yzI=
X-Proofpoint-GUID: 33cMQ-3a_8hVuirfIScx8mq6b2dCovJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230072

This series contains fixes, hardening changes, and general cleanup for
the PLPKS code. It addresses error handling and input validation issues,
improves the cleanup of sensitive data, and prevents the wrapping_features
sysfs attribute from being exposed when the key-wrapping interface is not
supported.

Srish Srinivasan (12):
  pseries/plpks: fix error handling in plpks_read_var()
  pseries/plpks: fix error code for wrapping key reads
  pseries/plpks: validate input to plpks_signed_update_var()
  pseries/plpks: clear sensitive PLPKS buffers
  pseries/plpks: clear sensitive buffers in wrapping operations
  pseries/plpks: clear signed update authentication buffer
  pseries/plpks: clear SED key data after use
  pseries/plpks: fix self-reference in plpks_var initializer
  pseries/plpks: hide wrapping_features when unsupported
  pseries/plpks: make narrowing conversions explicit
  pseries/plpks: rename the default wrapping key macro
  pseries/plpks: update PKS documentation and MAINTAINERS entry

 Documentation/arch/powerpc/papr_hcalls.rst    | 16 +++---
 MAINTAINERS                                   |  2 +-
 arch/powerpc/platforms/pseries/plpks-sysfs.c  | 20 ++++++--
 arch/powerpc/platforms/pseries/plpks.c        | 51 ++++++++++---------
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 12 +++--
 5 files changed, 61 insertions(+), 40 deletions(-)

-- 
2.52.0

