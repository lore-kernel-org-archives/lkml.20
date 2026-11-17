Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921423;
	b=2iuJmYs6YS9EQ3qukpjsd86u+BKg1M3iftdWf4CMq2YlEmcdGfiwTvN6FpitX9tcNbRt
	 QXt7uISJJ+7QDz4hutfHOZS4NOp2QjGYkRPyziByw6BbQTxGwDW6tSSLJHPJ/qzJ8W8IQ
	 3ddOLGF5uw2+dmKGZunsFkAt/GRWNGle4cicvnpjB54P9ACnPMAPpJx+jIxJ8TSp0VKj2
	 EhL9HsbtU2Exk+fyUQJr9xzConjiK6GkC2cugOkyXccCpfuFwP7DNKzjUSlqdZHrOQgrT
	 Ea5p2/i+lPmlATXPCXJxyO9hmW1eP/cf5zR0hbyl7Hv7ldCsdVsKeWt32p3Uymaj+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tjgKiaaz9e7qoHiFwJCppI10mxoqPyPjumN5RnXHqkg=;
	b=pLl+mDBr/3gGReVtJFcKEG0zpLdSTRREbzLiwERWpGIf/zUle6MDiLgYFESbXWwpnsAs
	 BH7id5LcrmsBAJ8r0GvRhOrdaBUJ6dCnwVaq04UP4xFxFdnhzHNeAJ/KQKvhdCRfP2eeq
	 p/Amyq6gwORxMefRKY7Q5KZE8td67g9vJE6x4l9mqjujS3SX78t0rYRn5LU/YYDPYeh9M
	 f6hyWc1rYVrEms+YV0Ia7IXoZ2VIIwYNwqFZnKbZX0ek5YC+aYPGCKytKF/dO98w0rLnS
	 Yx4duJWkSvDG21DYkWnz8G9kCapdf0OP6KsABsIaYuVh1+Ars5MVek0b/rDo6z0nsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HTZMN6Xz;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611EE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HTZMN6Xz
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBwENv2452532;
	Tue, 17 Nov 2026 13:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tjgKiaaz9e7qoHiFw
	JCppI10mxoqPyPjumN5RnXHqkg=; b=HTZMN6XzCJQysR9C90qUtw9INeOC45skz
	tba1XDtB6eifDNG7APnTgrCQwyuC5Y9Kyxr28FlhUAEFf1oyBwSWi7h5cK3h4PA/
	woetu7p2+YMtYU/g5D67xGVXxAq/9K8hv/KTe0kAcYvNFPHKlxKICwXb+UUlA44N
	VDf7jMUCNVPkjfitzj4h7QgcYYH9XcvARInMtnTilfnUwhBSPJEQuocWZ/imDBRz
	D1lma1G8hEW7Wc+ef1Kra8+hwhFtHj3I+quNU66p8iyo6clResQVChDU7bztJbl0
	zxzIroNu1PyuIL2yubFwIcdgYSm+3rYVqSoaGiRBvT/1seZWrhm9g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hxf56bdhy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:16:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC4rsH471678;
	Tue, 17 Nov 2026 13:16:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j02dfd2ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:16:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AHDGWGc56492420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2026 13:16:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 843C420043;
	Tue, 17 Nov 2026 13:16:32 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A9A20040;
	Tue, 17 Nov 2026 13:16:27 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.217.181])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Nov 2026 13:16:27 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v4 2/3] KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts
Date: Tue, 17 Nov 2026 18:46:11 +0530
Message-ID: <20261117131612.707038-3-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX6+Y5AYLUCWhy
 +mDpi82atyTOq88cR7bjZ6DqJL0pDYdrMT6hMMbq9LXnZjBTRNKF7v+u56dr7hV+GGzlpm90bCh
 eWxEqugoKkRWuIVo2RWaNvm6Yl9d1c8=
X-Proofpoint-GUID: WD4WS3SffMazWzQIpofurbvbFZzGSA7l
X-Authority-Analysis: v=2.4 cv=ROImjIi+ c=1 sm=1 tr=0 ts=6afc53b7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=hyHdCrymTFJ9VBfVSMoA:9
X-Proofpoint-ORIG-GUID: XUdHcqpxlHK6rrgo8Qzk9X2MPztAjJmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXyaPQPAqfJvRg
 E/M/MjYQHHm3Qn6mJW2Fyco3zKllHMQn4MVLv043EmUTbCyOWbM5P2XlKcq1JTE39CG1l8zgFXi
 1UD60SbdddJt0kgsjDsQJ7sxhmp6Y3NDA7A0CRHxkni3dHr0EYZaXHQ4vW7RZnVgM0FLJ4Be+c9
 GEler+sQEsqwsef/Ms42v60W4/Z3mkC0TYMFwCB3IJbK1tA10fd0ndlSlj07P97XGDekeCpUAJc
 KAx7/sYPIIsKD7h89hSbM0+tknlNAs4wU4FuwiKCB1vF3dN/VI0TlbCx331P3GHvrhfrAa5xPHU
 AwYfD/9sOspxVNR8gMZ94kx7aP2oXbnU7HQlt/6RzfjgZjUhUcQLwiEavVZFN0+T6M2+U8rv/Wl
 l+FzCA5NgS6MPd0dJQeYjhLmVCx3k+AK16k7weGbyjYpYMAYdWF3KuaEPDYOxtVN2tlQj5D01GS
 RSnqVpIJ/hQpdBs+dIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

Christian reported that booting preemptible kernel on FSL Cyrus+ board
causes boot hang.

The logs pointed that system was busy in printing below warning.

WARNING: at .enable_kernel_fp+0x30/0x78, CPU#3: qemu-system-ppc/4884
Modules linked in:
CPU: 3 UID: 1000 PID: 4884 Comm: qemu-system-ppc Not tainted 7.3.0-rc1-powerpc64-smp-preempt #1 PREEMPT
NIP [c000000000003338] .enable_kernel_fp+0x30/0x78
LR [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
Call Trace:
[c000000085ca7700] [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
[c000000085ca7780] [c00000000005f2a0] .kvmppc_handle_exit+0x5bc/0x5cc
[c000000085ca7830] [c00000000006204c] .kvmppc_resume_host+0xb8/0x10c

Which is...

void enable_kernel_fp(void)
{
        unsigned long cpumsr;
        WARN_ON(preemptible());

And...

Though irq's are hard disabled after kvmppc_prepare_to_enter, but
kvmppc_fix_ee_before_entry enables the softmask's IRQ state.
That causes the irqs_disabled to return false.
Hence leading to the warnings.

Fix it by re-ordering the code to load the FP and Altivec
before enabling the softmask IRQ state.

Suggested-by: Narayana Murty N <nnmlinux@linux.ibm.com>
Fixes: 3efc7da61f6c ("KVM: PPC: Book3E: Increase FPU laziness")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/all/33342fbf-eb7b-bde6-2c8c-254fe8bfb993@xenosoft.de/
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Reviewed-by: Narayana Murty N <nnmlinux@linux.ibm.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kvm/booke.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 13ad4cf5fa71..aed7b476b7eb 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1404,10 +1404,9 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		if (s <= 0)
 			r = (s << 2) | RESUME_HOST | (r & RESUME_FLAG_NV);
 		else {
-			/* interrupts now hard-disabled */
-			kvmppc_fix_ee_before_entry();
 			kvmppc_load_guest_fp(vcpu);
 			kvmppc_load_guest_altivec(vcpu);
+			kvmppc_fix_ee_before_entry();
 		}
 	}
 
-- 
2.54.0

