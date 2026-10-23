Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761449;
	b=qLh9QdpProOS5GP6EyeVUSgpXULUDksG1kUyZ15aY8o9B3mEhAk0E0BayVkuI0Mo48w6
	 CIf3cD4GVgTAmvPqlvTKrRg9xbUMQL09IPWuUghQdpAeUEUgFXDBE81VANZF1epWtsoQX
	 P1Uym6nbAuxI9N9mrzaEKWDhUV/B3bcXGI6bdtxyZaH0dsXHWZ1UqhJfWdSrNCeCJKSa4
	 X0YshIN/9joYOQfzSD7vrnWuD3rYcJrm7A4+mrcTmhPIh/H3X4Wv5vQ711PrDTA0h9Jru
	 +2+HqVnYB5el/VrkKJm9c+CnDoRFjrOnLMbOmoauSATPePO4x4RuQmPBQx1N5DLY9tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8zmldvaYoe7Mp4MxwSY1m+UK3fG/NAgF/n9tmVSG5EM=;
	b=3pGX+sHSnwqkwSxTiaV8WISOlz4GSH/C6DJV76k18PhV4Fb40QiNWbZDqZvpHH8EmjLt
	 pYlAwshXXRBQSG1/xLR4U4Sxeg0TaS5XsqaNoqSqOWqSwfsLn0yLXwYPbxU8MkPCKhyQD
	 anFiLdgYZe+c4SDIC6r5rGD4mGeNE56S8zzoJwKviEFPoBp/+dCICjZ6EVJ1NKr36v50y
	 t848RMqQeVW0KeYsU1iPDJ5j9QMNcxcJpevg2yC/USeOoett36+dssn71v4MZz8rNh5Mq
	 APGlTSo/cYVHjm8cZ6TdbzNPYKLoybbUgSucTpx/LBz4J2gxCcXQa7rbIv/uGLNvGyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WF9nphJZ;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13887606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13887606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WF9nphJZ
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAEB6O1465764;
	Fri, 23 Oct 2026 13:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=8zmldvaYoe7Mp4MxwSY1m+UK3fG/NAgF/n9tmVSG5
	EM=; b=WF9nphJZ/Za/0GVffeoaQxVCOdYjpwyT7S5AVyj2m6rsatV1N3UnITf8Z
	q14aj9Vx77ARP+UvllW/q53sLO74+zma4Si6hFWVmgn52ntpBQ/7OGqEbXhWBuE2
	WdnaK+3DON70CPuQpheWWKcM0V7sEll5591G367WxNfkQaKpPBNMAvf9NDwdg/Oz
	qxH/AvRlP7JFMNkOq6JQhQNYfrJw2hBWWSPscnaZy7M2uBPXtRmo0ZbaXO8VSn2c
	g07WPxXubu5n1pprnUnTQr50+3SBwjbKy4qPbPCGrAq6YGzBcrjZUGryLSma1Ngv
	TSZTN10VRSsY30Qic/g+FfYoa1cjQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw58mngs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:16:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAYpXr1950329;
	Fri, 23 Oct 2026 13:16:58 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hekdgm4t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:16:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69NDGr7F27525876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Oct 2026 13:16:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B971A2004D;
	Fri, 23 Oct 2026 13:16:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D45820043;
	Fri, 23 Oct 2026 13:16:49 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.68])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Oct 2026 13:16:48 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH v2 0/4] powerpc/topology: Introduce llc_override kernel parameter
Date: Fri, 23 Oct 2026 18:46:42 +0530
Message-ID: <20261023131646.2907938-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfX1Qv7yeFQ2Ik+
 hT9ZniMGpDaLa7hZZS5PDho5oSQRPf+YP7FzHQvLJWLgM/LSyxx3EMv6nBXlA1f6mf5f1L7FlX7
 TuXQ6xONuAP4ZK2kswpXQB83nTZQE6M=
X-Proofpoint-GUID: xgkZ0ph2K9rIvFShh5kCe0CLFO70v21W
X-Proofpoint-ORIG-GUID: tkcAVau6K2n4UuIhay--Pbxct1tq9QaI
X-Authority-Analysis: v=2.4 cv=UOBIjyfy c=1 sm=1 tr=0 ts=6adb5e4a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=f8snuxdgJl2q5W0zcO8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfXxv3urJTNI5YK
 MXwyWHpU9WzewKFMQOveglX1Z62OBfwAU/aae3KTl1K5uDQn4aXNBEWeoppqYNRMQ7yYydz/dZ1
 N6dth86/3Ijsuppo8QwMdJUmKGLe0NOOZsi+rNnyIV2AjST08kUWKbB088tHdi83kUs7ud/Q6Qf
 cv2XrWV8sp5aCeeUe98JU6fFFW/Vn2g9yEMYEtXni04njG3TuEACRcTWwGIDlRH2+PK+sJkgQb0
 d/E3JexysWlKUNLBnm9fECpeGddjXv3z8VY6AWOC7XSbnCfRtzE/XEUy8ndUCZIIJd06CWTVrAT
 Q6QI8XQkWDj4O/s4MW/v8nHDdN/gNJitWINcajWL91ITmQdZrYbLDS07DhpiDoyK3twaqbEjYCF
 V7AuBL/FU5PSnmpU0iULw/EQ72BN4jBw438isH0BttKmAYtVcj1/SICjWUdaHyjQHnTcBZSQI5E
 vhEUaxLVuw3+W2LboKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230051

Provide an option for users to enable cache aware scheduling on powerpc
via a command line parameter.

More details of the problem and context is in cover-letter of v1.
v1: https://lore.kernel.org/all/20261012102037.2477378-1-sshegde@linux.ibm.com/

v1->v2:
- Move to kernel parameters from debugfs. This helps to keep
  llc_id consistent which doesn't change across sched domain
  rebuilds. (Tim Chen)
- Update arch_llc_mask to reflect the override (Tim Chen)
- Limit only to mc, pkg (Srikar Dronamraju)

Notes:

- A selftest for the functional validation of cache aware scheduling
  is a good idea as we discussed in v1. It is a significant change on
  its own and likely takes time. I am thinking it might be good idea to
  revisit selftests for scheduler in general. (We have very few).
  Maybe worth a discussion in coming OSPM. 

- I am on parental leave. This version is pretty much what I had last week
  and I haven't gotten any chance to update since. just sending it out.
  Sorry if I have missed to address any comments.
  Please expect delays in my response.

Shrikanth Hegde (4):
  powerpc/topology: Introduce llc_override kernel parameter
  powerpc/topology: Update mc/pkg flags based on llc_override
  powerpc/topology: update arch_llc_mask based llc_override
  Documentation/powerpc: Add details about llc_override

 .../admin-guide/kernel-parameters.txt         | 15 ++++
 arch/powerpc/include/asm/topology.h           |  8 +--
 arch/powerpc/kernel/smp.c                     | 69 +++++++++++++++++--
 3 files changed, 81 insertions(+), 11 deletions(-)

-- 
2.52.0

