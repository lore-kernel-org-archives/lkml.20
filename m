Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288795;
	b=vBB72myVgDBWBB5mwfe1jR2EYWCTgPokQ6LqR/G2m26y5jNPNW/lcPskAi43YU4de0OT
	 5B57IPgJoGezopngoB6QBkur4PKjKj0j+Lb9yTPgrgiQaBwWO8jqazIiNNpknmUy3Pl3O
	 qfA6RUB3ruAv4NvqHDXS6RmPpq6atRNGzD7dxVFz3IWtfuu6eeR8LGAFoKvgmsls3R+J7
	 7Gmh6aq0m8UM5k5xOvVLqsiJZb+gt95yR/ULsOj4AMLfU2Y7DQiL+RjRDjFMsvnb1cEEq
	 8Lud2PADsC3WrjcgWaW5mjXK54ZdjS/ZpSWWDGKA0TqzmUc8uw8gFAn0jBYGPpJw3+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TY0oDsmoL5DABkX9iOdPqFjagnXyMr42AsW3VL8dKA0=;
	b=ShkvEq/twTsfuQpYhhX31geoAN1YJElPLwWXlVP6vNaYn8rEXMlyOBs2RLwjIxRvQvoq
	 PNNDvQxj2RBTCHtqrIr0pStrZUMc13XpADTf3sgpX2MnpmoKHesR8UWUahAa/x23JdliP
	 hihugknwLbnieyhxqHRRxPHfKGyRMVVka6VfmKxjSPnHNTaBcyAfbjxkK2VQsx+tI8Vo5
	 ocJLBE11zu6g8ojTWeC9JmkRIgfE/trRC0w14mhiWPQmNWkglwwe7BwuZHdRu7Dy1ocOX
	 Pr3ajals/vwcBaO13hT/Pqw/IQqLYdpi9+tmXEOq8qipngOoLIyztGVxyCdHwqnxd0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r1azsUDl;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCD8606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCD8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r1azsUDl
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA537H81441747;
	Tue, 10 Nov 2026 05:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TY0oDsmoL5DABkX9i
	OdPqFjagnXyMr42AsW3VL8dKA0=; b=r1azsUDlc5fr6sG8aehPQItXxRC0my0XJ
	dZ9NJRTgR8vonf1tUzSphBHS+51BZEDOHRBNwQDokyBbjz7nay0/hvTdGnR8niPn
	JTQgeqIOAy/LkAE5p3cthcNuC02WRjtESlOAlrPhhBoUq8RTiQyZkT2xFJXIzj/i
	qyE4CkUgZc62vk6hWsikAHPnOmDwPSDog5D3kLhAEz7wEJV1Us9qGNNdHa/KEolJ
	lN5pQrZP276eHGRTSAbh24oYwNRF3rDC3+hOolFUIVbusqHQS5e3xMBlU+Ia0XMH
	xXLkIqAKsl5UnCpzoKV1ttQTzA23aTVbNIx2BrT3TgtjvOvGnEBAw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsumutpcp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:32:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4Jr031216356;
	Tue, 10 Nov 2026 05:32:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hteaq5g5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:32:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AA5Wqhl34406830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2026 05:32:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D742B20043;
	Tue, 10 Nov 2026 05:32:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1493520040;
	Tue, 10 Nov 2026 05:32:49 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.31.82])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Nov 2026 05:32:48 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v2 1/3] powerpc/irq: Add ppc_hard_irq_disable()
Date: Tue, 10 Nov 2026 11:02:36 +0530
Message-ID: <20261110053238.3794500-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110053238.3794500-1-sshegde@linux.ibm.com>
References: <20261110053238.3794500-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyMCBTYWx0ZWRfXx3C35IXnB9iu
 n7uFlZUtwXjqMWEeD/200jT8FUdM43o1JV0IknscBwtLumJ8Uptn2w/UGto3H1nMmHZoOBOqT42
 fEzE554ULHNHFkOABYF0ncCCB/v1nb0=
X-Authority-Analysis: v=2.4 cv=GISdgeNK c=1 sm=1 tr=0 ts=6af2ac89 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=_WWFrvYBg-EO3VjvraEA:9
X-Proofpoint-GUID: rR0nyAl3nPNUeVUuDfJ63aILRNMRjfZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyMCBTYWx0ZWRfXw3NbKi+xWrkv
 knjIw2raAej9inYYrVRSNC1lFJUxqZGlrA3ABGbW6snvomV9IQoR+4op4F2rzjMArLW/J049h+J
 x8bNrThcTBBdCUThGYEy1Lv0CBUEu2Gf7LBnqKwgequtdz/p3slmtx17da3fb5bpBU8xNGrgWbp
 tD1HxFk8A+2rZ0R3zXOCtZzOMAJ6xENFjod2FQbRi+GnuYQ4yC00n04Gq+JhoPlR+kVRp0usZlA
 tgt23AZMeh7YK1t+ELBSe1QlZjFa7sxuUZsKqPSU8VNUVzlpnRc0TmLxoA6MYpCjj0xCoh4ihtf
 n4tgG2lrvoyHLbrbG8RoCvjlm0inVS1bLog/9iAcosfJ6vm9eCnNdIISnHmxRnCFx8TST42j1+C
 ceqgXP1z8/lvbD/hMwb7208eC60kC/2lPvHL2LJiLlRC5HXYro/4zAUuzOz3SWoUxZoKWC/5wOq
 A7ikgiqB0xgBKY6t8aw==
X-Proofpoint-ORIG-GUID: LOEZH52wX5KIRoVw3NIT7dNUvCLXM4Dh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100020

Add a flavour of interrupt disable which could be used in
multiple places which also takes care of lockdep in both 32 and
64 bit archs.

On PPC64:
- Disable hard interrupts using hard_irq_disable. It takes care of
  lockdep and tracing. local_irq_disable only alters softmask's state.

On PPC32:
- Interrupts are hard disabled with local_irq_disable. It also takes
  care of lockdep and tacing.

Subsequent patch uses this API in KVM code to avoid the warnings.
Wider use of it is possible, but it will be taken subsequently.

Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_irq.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index b7eee6385ae5..075442366e1e 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -516,6 +516,23 @@ static inline unsigned long mtmsr_isync_irqsafe(unsigned long msr)
 
 #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
 
+/*
+ * Hard-disable interrupts while keeping the IRQ tracing state
+ * consistent.
+ *
+ * On PPC64, local_irq_disable() only soft-disables interrupts, leaving
+ * a window where an interrupt can be recorded in irq_happened before
+ * interrupts are hard-disabled.
+ *
+ * On PPC32, hard_irq_disable() does not update the IRQ tracing state, so
+ * use local_irq_disable().
+ */
+#ifdef CONFIG_PPC64
+#define ppc_hard_irq_disable()	hard_irq_disable()
+#else
+#define ppc_hard_irq_disable()	local_irq_disable()
+#endif
+
 #endif  /* __ASSEMBLER__ */
 #endif	/* __KERNEL__ */
 #endif	/* _ASM_POWERPC_HW_IRQ_H */
-- 
2.52.0

