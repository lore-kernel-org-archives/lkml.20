Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921413;
	b=E0rTchZKZSvKxf/15mClbFHfF2yiqrGg+j8eLbrrIcegLM9ZLMKrk99sjjkwkNxsDyo3
	 d4oIaicxCmMf7eaOAaRzGI3xWXNim9WiRxwF05VEe6HzDnynN0vmFnGvf/xr36Bpt+ppS
	 mIvb1cUf9itIevY9FoMSmBR8qnk+g5aJ0EsTs0XC6XP5P/Ueu+BX7QjA/+V8L+PD3Ymcu
	 6/to2phbolrQCmFCffnR4L8ua85fEHrpzt9PsREKlAw8RGehtoF39/80ys7AiVZ8soy1z
	 lZCkQrEHbhTrUuaTvK15rafuqQQ0c8YBFrgqWai4dl8KMb2nyg9vIJTRhwocdl5UiYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4o4zHuDiwag70E4bU6LjMjF3md0zDjIwd0+5IY4NeAY=;
	b=V9lf2CExGM8Y0RPlrhji0za34aqYT7HhzFURHtXVA2KfmJRI/jMqWn9TsdBueMyDFlKI
	 CIxM1C2pTr3oAweGQoJQNOl6TJ/BnOhUE4Cvf2tuHDIn520/XRVpndZTrcgGjio8b9SKq
	 k/9fkilD6tDgg2DFTXOmojNdcI/shJS5mtiUMIe0BKEGyva05iWCYhKQhYHRRPyPHtYiv
	 2OYR2JgmfhNAM2XSGN411SE5KzGBxpLDI/QELSjLyh0HaYf8uvt3tmw76AV63ZazuwtoY
	 Pcj/EXN71J8bz8R/hWJEcFNcpG6EpjJkT6H7C3WKfKddxSbJSGuFuBbuklzWsHk+MLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WhIkscXw;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA8A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA8A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WhIkscXw
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBw8Ns2270990;
	Tue, 17 Nov 2026 13:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4o4zHuDiwag70E4bU
	6LjMjF3md0zDjIwd0+5IY4NeAY=; b=WhIkscXwZepg1cfqXzvpy0r5rlrtLkJGJ
	kVe6/5j8AxxbII3kikcJx9j/areWnYi+j7FiIUjfVi1Ibs3Fv1H7YP/HE3NNEqgk
	WGtLrzv/Dl6MZr62x2zgYTo+vVxcT3jAofcUZ8FPa2ywbd572o9qv11jnvqTFFTl
	+m3IGqnbjNbohGK0FqEH5PFJaRh2XUowIhPsdw1QD9LPCFa7Ntcv2yB/V8c3narG
	Sx+EoXC1TAcv7Fke5Slum/zXlF7h7/AEVcD/OlqGdB2o86oZrXjvBOD4Ab874dC7
	lH81s8v37DHuhYZaTdwGmSBQTW5SvZRKPpe9TJwqU7peMVdwFA0og==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hxd2m2wp3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:16:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC4t791514792;
	Tue, 17 Nov 2026 13:16:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j02juc41r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:16:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AHDGRQ850987498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2026 13:16:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F0C020040;
	Tue, 17 Nov 2026 13:16:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 158362004B;
	Tue, 17 Nov 2026 13:16:22 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.217.181])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Nov 2026 13:16:21 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v4 1/3] PPC32: Fix hard_irq_disable to follow tracing and lockdep state
Date: Tue, 17 Nov 2026 18:46:10 +0530
Message-ID: <20261117131612.707038-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117131612.707038-1-sshegde@linux.ibm.com>
References: <20261117131612.707038-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=B6UsQ+tM c=1 sm=1 tr=0 ts=6afc53b1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=UTOWjhEXSVwx40Q-rnQA:9
X-Proofpoint-GUID: oMVaW4W2nMcEgFLl8BY3ZwLBWZMwsGfH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX0u1Gk1uCvcay
 GjYVOZR8Wkmxu3PyZ3Ij4+2A2drO1t6yFGC2dPWEv4VgQ/xtHc+GsGUx7ISo0H68xPHordoCxF1
 wV5Y2HXyCdSRfdplfWFL0KTtqixa+4Y=
X-Proofpoint-ORIG-GUID: YhKhRw-R0U_WCb1tHCOx1IShGvgljHHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX+zezlp1Ry2b/
 BAIjh9HaSM9/rNB3uZf83bRCSUV7WX3oActwhNDnUF76K8EGJZ/Y7MXN5JSJzB+TfYCgdkyZ5yQ
 QFasrsESsafcN6j8RDoJTbiPYjEC2EEsbvsGu6lM5HcXJLE2a2kIXw3OqRhKaBbTFXye+CWuc5l
 yvLnIrJr9MC34i++uNzxiQ37zc4Xqj2j/nd+XMD1oa6w93QBC3QVB15W5kCG7Yj1WBO7lWKYHMM
 eVVyOy+9VnQdZNtShiCOWKbz+OrLOMoRJ4k/U9RndSPauVgkeafRDMJUh87JRDOMbeMy/7z39CY
 6NX2F0idefqiUMP+LOOip+B1DQJ16Y5hmr5KSNUihVONsGx0I1IkZu16ZtmwvEDykIy7yVV4Zx6
 ZT6CWVvhtSBF9mowSOg0zO2ZnybB4HCsaoDhRV6uU//Y+wNZmcngn/yon8enc4bHhn5tTAHlRQG
 BugX2AMqv+6+OdKDE8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

On PPC32, the code for hard_irq_disable has diverged and it doesn't
do lockdep/tracing anymore, leading to use of both local_irq_disable
and hard_irq_disable on PPC32 to overcome those.

That is un-necessary, instead simply calling local_irq_disable is
enough. It disables EE bit and does lockdep tracking.

Subsequent patch uses this API in KVM code to avoid the warnings.
Wider use of it is possible, but it will be taken subsequently.

Fixes: 5d38902c4838 ("powerpc: Add irqtrace support for 32-bit powerpc")
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
PS: Fixes tag is based on the historical analysis done by Ritesh.
I haven't got a chance to delve deep into it. Note that it is old
commit and lot of code interleave would have happened since 
including local_irq_disable at some would have added proper
lockdep support.

 arch/powerpc/include/asm/hw_irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index b7eee6385ae5..ddb850e62abd 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -464,7 +464,7 @@ static inline bool arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
-#define hard_irq_disable()		arch_local_irq_disable()
+#define hard_irq_disable()		local_irq_disable()
 
 static inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
-- 
2.54.0

