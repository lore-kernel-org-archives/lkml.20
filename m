Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928188;
	b=2dRgFeqhdVVz+X5ewvzFYW9VvyHuqelJVJaSAl5R/O9q1zBxuG+F/Ox+zOnioRfOoimn
	 zrT0pU4hVo69S/cDclINGoAol0WGBuc2SwlyQBaJdYmOFaTVwf6bi2dRGQ6EMQlu9c0Z9
	 gFLhAE9byitQXb7mkq6PFELj2zmltgLKFus+NJYooFFzZS/si7lGdjvSZJ80580opum5I
	 yU1RMR1LjzHdGaRun4C/rbYVwHdQhlj3Fi8hnaga+p8AHyp/DDt3Ad3BfPszByNKYakhH
	 cju6G+NOwloMsdLAybm9w1VYO0/jmP15OXwTzHSGWUOlazLKm2qqX4WSmryoS6Kgw8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2Qz6D/MMnaIJLBmobteHtH5QPHpLY1Ir8hbKNSkhlFo=;
	b=NLxomgo0wjCBHOWBocehBGYcC4/FKiAJ4cTGVJOOzxmyV21DuMJuTvLhoYurfHsRG+wj
	 4AlmU5eUhjVDQ50QEG66SowH4Hq0G9CmBbmiJFLr4KuQ0hg8rwynOkKHS9a3Dyf+2DhBK
	 7rX/XXXfV0fpNQ+BpmbLc4Br4oKHT0FRLfiQEaOKIbwdnQ4Y8AytisYoStlmcTCrHJ88X
	 e5N2znQgbfKWm31LN1xvfM0h04P+ONSNPWTwncz/WlmwqM1Ih2i87jA4O5VfpGuUFfli5
	 /gOmgrE/81oF9365tC63iUwD8aAiXb2O7C6q8R1buGr7eTYXwQDx9uDlV2EivHeIOJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g0UNnS8E;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B72606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g0UNnS8E
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBwBHt2452238;
	Tue, 17 Nov 2026 15:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=2Qz6D/MMnaIJLBmobteHtH5QPHpLY1Ir8hbKNSkhl
	Fo=; b=g0UNnS8EqaFpCzo+/hZ6DKVUG5gD7xMBscPZOsx6B2lhQtLjwgw0+mw+/
	ZqNdw+hFJuEUliMXSnuWr9Esn3UzV+REeXKzKoQ11GX0Yz1Raa6amxlNQk+Z757o
	kGycCeqZQgcMM2Tau6McckmIEE5d5f6BQ/kkWvCWLugZrIFYenQIQcrpPNjPpQU4
	a8mxR/Mk5b0JCRkFBh4Zg1pDOC4HE4Ym+nkoU8OqrUSubYV6l7hTJ7wVi90YmDPH
	8bE6BKsQ2kflTWvgeZwHpKnqCmGGhlL7m0GoQSEM39i3i8HTHp+0JFbC+Mc9dr/R
	nvzd1BdTjwMNA6/Ne/70ZOcmazPHA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hxf56bx84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 15:09:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC4rKP471678;
	Tue, 17 Nov 2026 15:09:33 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j02dfdes6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 15:09:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AHF9W4r42729768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2026 15:09:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0744A20040;
	Tue, 17 Nov 2026 15:09:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D09312004B;
	Tue, 17 Nov 2026 15:09:29 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.217.181])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Nov 2026 15:09:29 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, sudeep.holla@kernel.org,
        gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, yury.norov@gmail.com,
        Yury Norov <ynorov@nvidia.com>
Subject: [PATCH RESEND] arch_topology: Use cpumask_intersects where applicable
Date: Tue, 17 Nov 2026 20:39:11 +0530
Message-ID: <20261117150911.730754-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfX2cFyPWvJ8BZH
 7v52makesGbPSabe/U3PkkTdfFEuCxzmRDYsPQkhly8A2Bw6ywrZ+LJ0YKNV0CsdPQiQp7mf0U8
 TX+Y9lN9DCCxOfp3UujNtH2gJxyIHS8=
X-Proofpoint-GUID: q7XOKXcp2MKWtMvcovcp0h6NwL6_YHUd
X-Authority-Analysis: v=2.4 cv=ROImjIi+ c=1 sm=1 tr=0 ts=6afc6e2e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Ikd4Dj_1AAAA:8
 a=qAZxUrsubVgMJM8mn74A:9
X-Proofpoint-ORIG-GUID: 5fZ9ISNKgkpQ8xAtkGJSM-JNx9kQlTzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfX2JmH7M0QvoZ1
 xSsJuPAQtV3rVPAA6xIUjsbQ4BxuntJI5MIQ8vDZxJs1GzQf5sIIO58D+kT5TDA6bCPqGw+NAie
 ijv9hD1XiSOd1Rn4V2wwoR859jE7F8o8QgTx1WTtslZFE7aJMWtxQvawhy0zD1dzHQMh/RAm1Lv
 0Rrfd/ClUQdZx2j+pU00qLv2CERn2rirtAyNDsQwYLbzfDG48ZWfe1wXjs7ZfMTmDEQIST6Qklb
 X2iGHkGK2BzalqypF3mVdf1+6h40D2r35M4g7Fr9mDrkOcFpAm08DK+W69KNxQi3nFy82hcOHi5
 dZCmZ+WSmF4O2d+qW2Oa9MTC4zuId9MVlbiNS02N0fo8MvCNSEkRSCsK45GNpbJkBrtnJM8l2Vo
 XERfODwUBI/hWidDHBSJI0wS7/bU4B9/jmBfG0Stup4lMrxxIXPJ5+qDUpyUhHeU0nrWhjbtorh
 2dkksoNr2i1gWrOmwqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170059

Looping over one cpumask and checking if any bit is set in another
cpumask is same as evaluating if two cpumasks intersects or not.

So use cpumask_intersects instead. It is probably faster too.

Reviewed-by: Yury Norov <ynorov@nvidia.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
This is resend of the v1 series posted as independent patch.
https://lore.kernel.org/all/20261111075945.3930230-1-sshegde@linux.ibm.com/

 drivers/base/arch_topology.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..aba86e9c2516 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -34,14 +34,7 @@ EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
 
 static bool supports_scale_freq_counters(const struct cpumask *cpus)
 {
-	int i;
-
-	for_each_cpu(i, cpus) {
-		if (cpumask_test_cpu(i, &scale_freq_counters_mask))
-			return true;
-	}
-
-	return false;
+	return cpumask_intersects(cpus, &scale_freq_counters_mask);
 }
 
 bool topology_scale_freq_invariant(void)
-- 
2.52.0

