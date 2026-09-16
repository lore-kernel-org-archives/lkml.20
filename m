Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB6378822
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571461; cv=none; b=fmRroMNthAGMzKyj8WUQpISYFyg7877opWwbjFId1tC2OdP0G2lthIh49Sy7Qi0+kbU0qNgUEQRYfrcGzelAt/4ySr1mNzIw0f7qT0BEld7gG1jgjCeXjS8iYpJCyx6/0MpbNyW6tkzRKcE1Jo3KhUfpJajQhS4hp0eqV4lXsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571461; c=relaxed/simple;
	bh=f1Pz0HKSoN85emANA8UE4hSHblNZM70x70nigPudmAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OrY8h8daPNKmKNrGvitMKcVBKf7zcYToKeyzYYwmqL5CCzpgvd6W4KdIce0/Vd/TaFxteGhBzK4hYAUxs3ycbgLSjcrMDR4p2HcqF+tsY4/EHhl6B9DxyfvlM1w0gSYSYSYbDBiFggIo8qTxEQ34uRHq/jcqoV7LlIJobSsGDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IciAV0do; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IciAV0do"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEVtH34047050;
	Wed, 16 Sep 2026 15:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=JW5Pu1SsAyTbLscA9P8f+NnCIDevJWTfc8oQqbG+X
	dE=; b=IciAV0dosAHcQf3J1bnCNZFevpg/2IvsWHlkZ9XUu24GmZKC6EwF3JDdc
	ZHUclvL1R2ck9I3Sn8lFQUTsOV6vpxz41SjChuBEKECC5OVPO+qUYuejdDbGm8hq
	Aysb25fkcJMfF3iUEEtUHj4nRLjXWpBhM7DSMLMFtlge29egKx80i10qCTnvuQp0
	visJ5xjAbYIjQaAstzcZZ2TX7tg7DsJi+vYtD4eNJZV3TWVKGNPcBXAr21qaUFXi
	F6DBNGtR2jrC4dJvF3Q4yqhSYKFNOrqvpar6okJEZiqbvE/vB28v8+HbYHBc5OhE
	LLeIl84/YqfCEWCtuO4+t2TXuOUcA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcv4w0t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:10:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEaBXg1585015;
	Wed, 16 Sep 2026 15:10:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gq089put0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:10:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68GFASPa13304202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2026 15:10:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A07920043;
	Wed, 16 Sep 2026 15:10:28 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1CA120040;
	Wed, 16 Sep 2026 15:10:23 +0000 (GMT)
Received: from li-a84c74cc-2b13-11b2-a85c-acdd023f0674.ibm.com.com (unknown [9.61.52.228])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Sep 2026 15:10:23 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        gjoyce@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>
Subject: [PATCH 0/2] nvmet: fix subtle race in I/O processing and ns configuration
Date: Wed, 16 Sep 2026 20:39:58 +0530
Message-ID: <20260916151012.3702896-1-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX6Ys+shPzrXK6
 jYasRjqqXJgQcDF01EUjALYCur+lJCwpMCy/c5GW5xzvVERoSi2yBvnhTPslLbRPqzQBYS8+POW
 rlfuRxvqXp+zC+i9MHDiW0WwTYfyoaY=
X-Proofpoint-ORIG-GUID: BaQ7WuAjrWEfOBXYn6c7r31Bb2s5RQlh
X-Proofpoint-GUID: BaQ7WuAjrWEfOBXYn6c7r31Bb2s5RQlh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX7rc8EZRMU7/J
 2T2Gnm63ZkAH7yWPOfh6x656ddLfy3h+0STUigaTa1z8Dkai0NBVKnG5iUnooZokUqQqS6f+70H
 Dn64xryvrBKX0FAn0GL23DMXdKiJo5gB/U59BU6thpreX34SoKZmJuu58hxCTP6qgCgQjpusoaa
 ibbSmnqw/o81PlfY7fY+4smlf6bKusHEwQyGxwnTlABMTI8q9YLN7lz4e82bUzdMEL+bQ3K4J1o
 juOrq+EjGyS5Qe7ghLdK/+Q2XU3gdXLRQ8Z2A3hlZM1g5Fha/nYNOv8MCKMz1Jq8hv13Nd0DP4y
 HEjRmIrmToBbSGtlkslUoStqVSyG3xjtheXWvHtaG+zR47vJxamKBlVtJQp4r1LEywLgLT2LBm0
 Lhumd24nDXuyVyOrRJIjtM/U/SeS9TQH43M5lit/MtzktQG7zr5g/p9IkOH2kmeUKhGl7ThlXIT
 AA28dVHZHutiGj0lsnw==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aaab168 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=jaXYEW7WMJ77ULbh9E8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160204

Hi,

This series addresses two race conditions in the nvmet core code that
handles I/O submission and namespace configuration.

The first patch addresses a race where target namespace attributes
could be changed while I/O is in progress. The second patch addresses
a subtle race that could allow I/O to be admitted even after the
percpu reference count has been killed or marked dead.

As usual, feedback, comments, and suggestions are most welcome!

Thanks!

Nilay Shroff (2):
  nvmet: defer setting ns->enabled to false in nvmet_ns_disable()
  nvmet: don't allow I/O admission after percpu ns reference is killed

 drivers/nvme/target/core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

-- 
2.53.0

