Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761464;
	b=pXmLAUcmAiQv442sDTIM5/+sXEZGxrzpK2V/qKlRxBYiiZZs80xgucNoWg7C8WzQUvHF
	 ++nWqOgPv7lQivBhF6w9HYBky8XUB1wKmQXiN0jEWqWRB2LmvO36Bbq+k8JMpl8EqTMj9
	 H90ssYpL3PwRhV3WrcKGaCz88tGHSO//X4DesYfm1SS/WILait2lUHce+njxXHa75UBAM
	 I/7KsD2tOyMQJ7hfKmiMexDXEzIRWUuBkEooRMHiYHO6+U6FSjeu+W9nGkb2ZgYeGqfDH
	 MKpgOT2kbFTNqO3m7NyzC9ErbmLM36AmK4gzRwYsSK9vKhMy2i5Tud+rmZsDVuk4/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4INMN6jfyiWPWNdUFOTQaGKc6GvuhZz5CWDkHfXlFIw=;
	b=U2hbmCx8+Ap4u0ZAmlfJ2lR9xyd/94rUg4ep1+6jbpxGBYmoBcQ/2fjXFHzbZeJYZZm7
	 ymaeNr+be/TDQJxlDp4vm9P0uVPx8kIHzEY2jSFEMB2BUzdVNQpbqvUyoHruzvDLMIvnS
	 YY7aPLFJqfgKBBmpV9Vy6OySfUCU2x7ycfiarIjJSq8cjYeNCT9Q4rCUtqp4ezMbTlGbo
	 jGrTRoSeHrV2M6OLA+7OoClLU/bIXSl7UGsSgL3CerxYkCek4gn6+0q0X6LG4ISmRxsJY
	 u/78b9MfXYC6mFEHuY3S3OSUNvTn9Dw2KiNtF5ydxBJ4ST8/SFrhckXA567KngBAFGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rkbUZE6b;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB10D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rkbUZE6b
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAF1ci947964;
	Fri, 23 Oct 2026 13:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4INMN6jfyiWPWNdUF
	OTQaGKc6GvuhZz5CWDkHfXlFIw=; b=rkbUZE6bZY3Q/lQEvrwpWrNXK3tYnthGX
	x8GJQMbd/8KduO9BGcpRVRLbOCzjTHSvf92NDTIvF4vcJKUcdLfHmdmaDfO3lTHo
	6vSi7nIke56GFiOR5lvU2Y5nI2Ga+9+CGc5XrntIhPRGM0g9HboPrqcKeqy13JcE
	yGifjlMsnjyryCPWWEqG/vMllfB86QA090eeJconOYkN0ZV97Hq0hjgQ/4Lk/DhU
	JRdnK74yBw9CIX5zWj575kjXfoLSVcUMioqAVl0bJjIbBCIrKrJU90aPH5wuginZ
	kUsPpScFbwILAiZUEM/UPGqL0z7lC2jbsxM0ez7fftTuuI/QtbjDA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw5bweqy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:17:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAJwqb2010122;
	Fri, 23 Oct 2026 13:17:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hfgck5khq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:17:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69NDHDSH32440632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Oct 2026 13:17:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFAF620043;
	Fri, 23 Oct 2026 13:17:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D9852004D;
	Fri, 23 Oct 2026 13:17:08 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.68])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Oct 2026 13:17:08 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH v2 4/4] Documentation/powerpc: Add details about llc_override
Date: Fri, 23 Oct 2026 18:46:46 +0530
Message-ID: <20261023131646.2907938-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023131646.2907938-1-sshegde@linux.ibm.com>
References: <20261023131646.2907938-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: mYiWZWp3FE02QV-FPj1QhIanFZo5R5fE
X-Proofpoint-ORIG-GUID: EfNZofRMjBi8XQjEi0XnUdb7SCIFw-Uo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfX/f3r3u0+F5PE
 jVxVTyf3siq6HDkkOFgfANlVwk7exnQJfmR8gbpcLs+izJ8uLkI8veV7s9tPZpjJNd+7yXeKGUU
 KWmdfCnGkX2Qe3i5RdDuGKP5vzP5mlA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfXywBv6kLsNHRN
 3w4T8UY153BKIUzdzSdLrahFVf2oMMi1OLJLtW3qDQHD2tuJZUgB5MNhRClWhhh/7s926UFlJeL
 sq2Nayn6JdD7Ul5xs7A1Tn5o9y6UI6S3JoR7U5XZkndqD8AHx9Gug2FxUgodayURfVw7ITHNIee
 mpMJV+ot53UPbwObNGd63CF9/kaucg2X13PaQ2edh5AsoMeAmy/xRX7TtyxyAhc6e5BFqXrrFHq
 pe2tauvjzuWXsAz8DdsQrYtvZavCA0O+m1Ip60j68Q/vCowPWp38xtVkeXBtznYj+k8wHhYY/j6
 SSR0ZjJ5dF5iOed4EQP2CkZ+fqF81sh1TKj+jaTRxbnwMUQgHFxdaX1u1Um3JYZKKwZRZEi0DS5
 vd+13Iggt7LNdAL3WfITv3pMBgDhn0R6xszHaeHYEcvzd0uSG1OaGLUIMXeamuG6bEDpWhxusfL
 NntgxzW2LADX85h2ptA==
X-Authority-Analysis: v=2.4 cv=Gb2CDgXL c=1 sm=1 tr=0 ts=6adb5e5e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=EDzFc5kV9KizNyu6t7gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230051

Provide documentation for the newly introduced llc_override kernel
parameter.

This may help one if they want to experiment with cache aware
scheduling on powerpc.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fbee7b544903..e13514076c18 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3568,6 +3568,21 @@ Kernel parameters
 			Enable Live Update Orchestrator (LUO).
 			Default: off.
 
+	llc_override=	[PPC] Override the scheduler-visible LLC domain.
+			Format: { mc | pkg }
+
+			Use the specified topology domain as the LLC domain
+			for scheduler decisions. This is intended for
+			experimenting with Cache Aware Scheduling.
+
+			mc	Use the MC domain as the LLC domain.
+			pkg	Use the package domain as the LLC domain.
+
+			If unset, use the platform-provided LLC topology.
+
+			This is a debug option only. It does not change the
+			hardware cache topology.
+
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
 
-- 
2.52.0

