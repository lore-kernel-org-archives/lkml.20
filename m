Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFC36C5AE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593496; cv=none; b=i/hPwsEZKm4ViNMElUVNlM5G7ABUEVTlh9YSyDwfHGv166VlyJP+R4y1TPICW7udZagc7BxujQnF4Z+EjTvep42mFEL2FSVsQyW5+T0qGyBF2sBhzpZ4/5hTcBtWJf6ep0BO1Ir74diDfC059C5aiBfvE9M3T1gFQkItpsEx6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593496; c=relaxed/simple;
	bh=HCukEaoShm9MOw1UXFUrJanR8yzROSjb4XGFHwFlqNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJClbMLedt2gkhQTq39Gg0Dab/g1FbPxUHgu8x5QkYOY3HN7I2rmmgLdZ2Bg53DzrfDaN+2wApgrvhu9Re7N2vDS/1dMdh470smzwF0CD6Dfdcnhz2stEPnCnw1k04WPrEcnpxpcbmbRY0EC3v7BliP8p7OpKVUP6mM6D7aA8Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ao/sIhvK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ao/sIhvK"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9a1xp578001;
	Mon, 28 Sep 2026 11:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=bauiuXxThr1M1tuKlLKW20iyQRT7cEIiyKt2vu3IA
	9M=; b=ao/sIhvKmvUSf2ZYD3NeFRPJYCroFBxYHmw5pmTXFNpO3jnnI4umMl4ll
	spNae+blwrxrMbgllA5jqJ8QpPD9ep8kHd3mT5OnUbl5U2nDbaE9r+aTMD1uHwgO
	4T6gGgymwRvlNtazarCMTQ9tfwj2fXEtn4AfpqZ1Cufo4qo2xfwfRAeMXvu4ltJN
	53dM5bSGWlSxP/SJdvHNpMdSieu5mIClDF/wvvuq07HqrKeP2JK19EE9xAKTYdL6
	7ZsA9E4zFcgecoIQPcpTqHTO3HfWWsZfac2oOsxfC1+grm8mzeXxhrdxSq68bEoq
	BtPShseGYExKBgBgklRIFzAmtydKQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx3fk0tbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:04:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9HcGp4117515;
	Mon, 28 Sep 2026 11:04:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gxu2y4nq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:04:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68SB4OWe50987476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Sep 2026 11:04:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C25F20043;
	Mon, 28 Sep 2026 11:04:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FA8A20040;
	Mon, 28 Sep 2026 11:04:20 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.213.68])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Sep 2026 11:04:20 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com
Subject: [PATCH 0/2] KVM: PPC: BookE: Fix boot hang on preemptible kernels
Date: Mon, 28 Sep 2026 16:34:09 +0530
Message-ID: <20260928110411.844582-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 4d7Bwx2TXR8wB1sgdDmCh-WGPNJQzTOG
X-Proofpoint-GUID: H8XYzw1x7xxTf_bByvrH_cIocGc6sg-X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfXwdZPzwPoV1Um
 PO+mUVn2HH3UMY3hFYlo8L7hNrbtLWRDhICdwtpvSD2gfdHpWGhgG0uat1yIyR5QvL8YvOQzvVk
 q45kwMKZd/ubTQ3i9iJvhdNd8JRY3Tg=
X-Authority-Analysis: v=2.4 cv=Vv62kO2n c=1 sm=1 tr=0 ts=6aba49bd cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8 a=ZFN0TsNAI0be_PaQA-wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfXxyPyfmW1GiFQ
 oWw/NSp3Op7VeOlejRY2oVsAsTykoD8kijKRf9lu4B3Nb4Xpe6QxZVD2TraSpqCBO7rKw7UFgHb
 qnhWR56b06Hhg+L9EwZO2u3bJ2kj9L+sBaIxBryKzYPU3gT+RGxTLdNYk3S7yb9AZSzq4nn00nP
 IymfYHqIUqrVCvJdww+hRyEBQrvhN5s+O3L1kmJolKbdekvm0OuyYid6iROdY3Y6BxVrdQIehWW
 pBjiPi3cTG2pxrCN4bY2xdxeyHWgnhlX/0uCTef4OLpao/8q9+xRjoLJiRACF3fgOi6fbPPCEjP
 dSoAEt+s6ghnXiRXvKmWaTMZUh9Q2JDeR0a2EE6Cs4MBOMrRIE6Q6AyV3hXQTwXOYIpvM8e+K0J
 3NjL47kXzJXJYDZxEpUq55p8mjEcGbc0CzFKiKusA/7cnfJiVGLX8/CWiLAORBBcg0PCXRqFkpz
 SZXSCShyydMCMnbxjIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280042

Christian Zigotzky had reported that preemptible kernels don't boot on
his FSL Cyrus+ board. The board freezes on running either full/lazy
preemption and has been an issue for a while now.

https://lore.kernel.org/all/b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de/#t

After 7.0, there is only preempt=full/lazy which removed the
preempt=none/voluntary workaround used to mask the issue. There was
challenge is getting the console logs which made the fixes difficult since
one couldn't know where the issue is.

Thanks to Michal for helping in getting the logs. That pointed at few
places where the issue could be. This series is an attempt at fixing
those.

Christian, KVM team, 
Please *test* the patches.

Shrikanth Hegde (2):
  KVM: PPC: BookE: Disable preemption before loading guest FP and
    Altivec
  KVM: PPC: Replay pending interrupts before entering the guest

 arch/powerpc/kvm/booke.c   |  9 ++++++++-
 arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.52.0

