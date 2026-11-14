Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700206;
	b=aT4oGjqXuMmyU7gxABvzWdSHpguBX0MuwmJAxZGijHMjNXZQZ7J3NJDfvahusWOCrUx7
	 l60H7iS72/Sbpwj3BYKbFjTYpWRY6YvC/ORgr/BEnPONjH79MLQ4slGIG2vRdFlVF7vFl
	 nmQU8w08WB2P1JcbmJINQS+YQUVG7vJ9/WPQEx+W89/3t3BbMAkcCcZE6tVyPhP/wmK0I
	 kbxN1LsmBACS5GYIsUKbteyWOXSGEvpPyXBAzoe2ELap0khTslH3rUcPreb7YrhYoCVIZ
	 qBH8e7yAI2+hafEFa9Mud1bsYT9WzHn46IiQU0dAPPVUPdMY3mrgbRsp4NzW3nMQwLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHtKeqN1hXc=;
	b=kkEOmf1uHSUVu1vNWiteF6kaetVfb5notX8688mayzA6b5S+RPaHG1UpcBGYC8JKz134
	 kXkCSm9jK+6Oo16KCGNCTDF2IHrD7heAkccobbhJ5qqcZks3I9G7/CTP3Z8SQYGPmYxFy
	 DUS6F9SSMPk8z0J+j8vytygcT4Fd0gXzNKSBoKWmHFa6VxNfw/vaU2GWLHFBnwA/JNZRH
	 w+fetjEZJYNyYASWAKrfMa1+fQfyyatx5B99yw0FQQtX1G8pLxPFIY+Q8BwR3dt3o9o0G
	 CFcvHbCMMyR/EyhI9+fKDWFqxdfV7Ssp495++bpQ7mlaryd03SbNxvCM3dBUcKE9wSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAquq2I1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eUg5S4Ai;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C63606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C63606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAquq2I1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eUg5S4Ai
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AELG4Xd910903
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHt
	KeqN1hXc=; b=OAquq2I15Qtfs2s6bq3u7oU9WDcwHyUcjcTee+tBnhVkaZ2ADq7
	T+RLDOp75nORBbyaPSZoj+U9othw4bqKr8lMflze/57EDnXMML2T/6e5gIxgWeWq
	l+zFn1IbjPI4opea9RtsMAddnLsIDT4Bgi4Peu5yMr63FkGp56d28e7g8IzRAPNT
	ShUQAHXYy0y4IhVLthjMWSfeeEVGYqtGmJNb6SM4ktwsEqOxrg5Om6rE25kNp8Nn
	X//HtzNL/sNEnLi/uCNKsoEWhtTb/AjgvcGeQw9Tot6hsVCSYr++RO1McwAJCe2p
	bpPO6UlwzpVWUlEcocK0FKxKtRSIRocDssg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk21x07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so2982269eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794700204; x=1795305004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHtKeqN1hXc=;
        b=eUg5S4Air/hvG/72cbbFNo+qsGaHHSYX8lYZZv4sdBaemtJ5kO5i9yjqDR9pgLuwo0
         pVOmW0EwIWkElxfkne8YfTAZ3J8bvigcgl4PPHyDpgVKSMji6Wp2Xodz9atII5V4cVwj
         s536OSVFMS/9uIHt8Rc+rHJMB4WJW4vmglxLBDcG6h0QjsFg4FWMnUFZYFUYg5QofgHx
         Vpe0wzMw88VqvZ6Mj8c+a4ScB/PVFSC8z6ZqTCVqF5r4XCrNxSLZBE2AsxUQz4ooZcc6
         ThFi+98Rw05R+Lll8N3oW5CFGypvYeNRMlBTpwQP+j2HhBCZCH0vBInUETOHqz2m4ZUu
         WkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700204; x=1795305004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHtKeqN1hXc=;
        b=UNFOYO6dA3Hsq928xh/Nt4Op9u53h8MNJIxwh9J/oWwMiDORxkyUsTSuPiqGaaD7C1
         /JPDq5Cekk115FrVhu3bNu9/ZPev5DO5QPYg/MuSQoaZuN+ysyWhrRP1MCif+OghTWuM
         YVlme+FU/FLjf921ZNxEKL+XrXCX+CI2fKeiRkUnz64JgplKHzV2QYlPx9x17cSY9sJk
         Ba7v7VXd8XEl1gszdjteXtvn5ta5vvyg1e8MSHskRa+5/++nFnMX4B7LMKmeywNomRS8
         Wmr8FaTRY1ScUSndM09stK2edrG762rxyKqagHrsTxJUJjZzpxWBHuGK4qdSlIaSPflJ
         OpYQ==
X-Gm-Message-State: APuU4Z9Pt5KOY4xqjU3ZgOtfvVGItOzhvEM7+o3q/FCzJvC2CJDAJrF+
	g2ht5HvI8iGwTcVhQwacGfzeKENh4At0a9orAxN6Rn7+zPgTkpM7y1YXsdwaRJ4HotXRqaBtjeI
	UKw8T4BMUH3LKiK4BvtlcFlsVkNPJIN7YQABFVIgU+t3ibktnAWv4TRNUvy93WiaLxYTPimE3mA
	M4cg==
X-Gm-Gg: AYBFou2hrvYIgk58MHUuhcoFQQ7V12xC/Zjqvf+UuBC9GrmbI1ePcdN6NEA0n4bY5Ad
	BuLZFWpjldk/DUPfl3Slrtpynqy4cVgqG/ckYJCSj3E+r9yHtUNHdfL9EHYzSnQIC4gPkoItu/Y
	i4U7Gk71PZ0wS2JA7GPu2TbG/2oqA0sKKTmxjImdeyVwOnzJxQssq0q5S9WGuNrsxdxFLc5xIO6
	pJ91/xlc2ENgY6E1iz5rC92J9D4JTFzMh+EW4A5kdgnyd94xizllWiSKyqtrAKIiLQxY5IkMgiR
	q+dLsppUKAfFJZXXyc+SQdh1x8PxqJXME8lAhVEvhF+TSLuxu07I07fWGsgBwRlRQr7umoNz9Ry
	yrLH0yC4Cxu9dJ+2Ino4B6lfKREYw48bIkmLWolE/vZb34PDh7iFmz0LvmGU7bg3ZdqjnbkHqy/
	kR5Djs2yIXKpMj2eddKoe/3Q==
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr2530343eec.36.1794700203838;
        Sat, 14 Nov 2026 15:50:03 -0800 (PST)
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr2530315eec.36.1794700203064;
        Sat, 14 Nov 2026 15:50:03 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm39456313eec.20.2026.11.14.15.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:50:00 -0800 (PST)
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: "Linux ARM Kernel" <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Vladimir Murzin" <vladimir.murzin@arm.com>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
        "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
        "Jinjie Ruan" <ruanjinjie@huawei.com>,
        "Liaochang" <liaochang1@huawei.com>, "Marc Zyngier" <maz@kernel.org>,
        "Radu Rendec" <radu@rendec.net>,
        "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
        "Ashok Raj" <ashok.raj@oss.qualcomm.com>,
        "Sathvika Vasireddy" <sathvika.vasireddy@oss.qualcomm.com>
Subject: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and show NMI counts
Date: Sat, 14 Nov 2026 15:49:44 -0800
Message-ID: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: zSD3D_jHlZqrLfa964hXALANVgx8_wvG
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8f3ad cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=kooc1xV3sY2Plk4Jpm8A:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX9meFJZzhbSmM
 HAbAKANzt5j+eehi8DUu2meIUuZNiEyQv3P8NQEcNuv3kdOad8znJl+Z6nw/QS2x8Rf4m2Klb7n
 odseFfwF8SnsSSfbySApyniWE2IsAi/+s0iipsBLSwBdY+vqIOhOyxh6cdn2HHPVQeeRy3eRki/
 7sLsHLtsRye6W10ccpZqewShCiSzpk9uaLMhqcg7EPtrD66DLPc4RQ8WmHOY7kY3m89X3WDt7nm
 IX4Tm/a7eW94jT+L9EGxBrXmEJ3qUtIFIrkIqjjyLyUqFdt1HYmRuWLVwQzP2f71Z8rhZfc22uZ
 h5Q7UQH2h1CDAxWrWT3/kPvQm6QWuAXM+cKMIA52Xuum2JcrCm3aUtp/PCt1ozbx3XbD1qaPY5O
 Uy1tlNlY/Eix6HWD31XCp8iS5BvXjU3xLsZVAFsEV1dDPSTCXeZHxYawbFb39wczUBFOGVbOucY
 z/FZ9kPX2f6Og5PRSnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX6vR0uVdOkZzu
 ZQ98B1j1kO3m3mSbkPv3oS7l32R/S8SHTU9ooALKJqS5XpF9a/NCczx9m2T20RskQgGYnRpDtBR
 mFC2FYdp9kKsGcsnTD/DRedIZCe6X4g=
X-Proofpoint-GUID: zSD3D_jHlZqrLfa964hXALANVgx8_wvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140094

request_nmi() currently models NMIs as per-CPU sources. This does not
represent a globally routed NMI source with an affinity-capable irqchip,
which needs to be rerouted when its target CPU is offlined.

This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
for such a source. It remains excluded from normal IRQ balancing, but the
generic startup and CPU-hotplug paths may select an online target. The
second patch fixes the related /proc/interrupts display: NMI-safe flow
handling updates the per-CPU counters rather than irq_desc::tot_count.

Patch 1: Add the migratable-NMI registration mode, validate that it is
used only through request_nmi() with an affinity-capable non-per-CPU
irqchip, and add IRQ KUnit coverage for registration and CPU-offline
migration.

Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
kstat_irqs_desc().

Testing:
  - ARM64 changed-object builds with WERROR=1
  - ARM64 !SMP changed-object build
  - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
    validation and CPU-offline migration
  - local downstream GHES delivery and migration validation for the intended
    consumer topology (not part of this series)

Base and dependencies:

This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
[1]. It depends on that series' GIC NMI support and is therefore not directly
applicable to mainline or linux-next as posted. This RFC is for design
feedback; it will need rebasing onto the upstream form of those prerequisites
before submission.

[1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/

A separate GHES Type-4 series is the intended first consumer and is not
included here.

Feedback is particularly welcome on the IRQF_NMI_MIGRATABLE API and its
placement in the generic IRQ API, as well as the NMI accounting presentation
in /proc/interrupts.

Ashok Raj (2):
  genirq: Add migratable NMI registration mode
  genirq/proc: Show NMI interrupt counts in /proc/interrupts

 include/linux/interrupt.h |   2 +
 kernel/irq/irq_test.c     | 141 +++++++++++++++++++++++++++++++++++++-
 kernel/irq/manage.c       |  33 +++++++--
 kernel/irq/proc.c         |   7 +-
 4 files changed, 172 insertions(+), 11 deletions(-)


--
2.43.0

