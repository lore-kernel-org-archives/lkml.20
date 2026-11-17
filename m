Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921422;
	b=k8mH0sSBp0+cMmYlWWkD50MQZ+aB/hAAGx35fRJYzO9vOpEfIXYUeRBlg006osMYNPX5
	 TQQ7gDUR/Kj7EKTLYf4KW4o/ivGjbDv1xcEqtWo7yzGs1t+6OUkXHjnFvlTkI5XxVovJQ
	 QL+KU/bnFSLjondlKWLJa8WJu8WTqAOMZKS8P+zJgduG5C/TfhEC0GFwG43rX9lgxDrY+
	 0Fe58Bd+7Plnw3ruqjv5IYN+GeY6F6pgjzZGRpO3e+4LnpXddcKuiAQlwYfYTX/YBvzkn
	 mDR+XBbUzLqjO42dmGFMu4vwKAluxnM0U4UQDU5llVKf6Z9dYgw+nFdfggmNOUnYJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GQMWrtw3uOcaW7xMHmc+IIvKr/pLDmUiEvProqVRDWY=;
	b=wCcNns7Xp99UXhUeL+NKixLo+kPcGGyuRXIHLrqUk8aRrnYSEuCsFuwZ0CSUCvediYoS
	 Z7cetW8/UGycm496dmNcSIPpRPTEQk9OdznRggcPK+kM9X+g71aTzYafmlAAw6OULh0vG
	 AeM9U/gub3GY/+bCt75G4RHAgAuRgyhNwEUdUtNqumu9S5R7Hqin0KUYcQzwbaP/Eeq+8
	 vCemJQwHZX1ElovYJivdD4iJmTTUbYcNT4LWxMH3DQbZfeqBtum4Yi7m40xis3fx6Yksh
	 bshXkNqZ342vswGnwAWgOPxyNNmsSlvQIG365Fvs5rv5fz/RaGU3M1UJDUFPhy6oStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="EDXlCB/v";
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61154606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61154606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EDXlCB/v
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBwAGF2290022;
	Tue, 17 Nov 2026 13:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GQMWrtw3uOcaW7xMH
	mc+IIvKr/pLDmUiEvProqVRDWY=; b=EDXlCB/vWSqnSr4S3TmpEYzsZiC9gnGtN
	Cx9HF5kXrbm9WeKTyb6yON0QAnYBzd8Srzks6L5skStC8WedXls3cWspmbNK1O5A
	1WZcxmyjhuqva6e0Yyrh5P00621DFBoZPgoRrGySVUGDITv6SB4YlIuK9RIF/nFa
	YiNyg2Wg3N00p4Yc3AKamxh2ukBddNNMn6nEY9muCFpYJTEslFUuFbHZYhJ0Xrc1
	g6Kqjk5nZS7nfuEUaeLN7MbqJZI+eaUCcyfm83PsbgV45sN3sm5+Rok4qhbjVk7O
	jX3Tsf9yDA0pNhcbceoVo0nDoBonzVrgTZlOC5EjOMNlZJ0SNE2qQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hxfc53d7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:16:46 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHCJmAL3918134;
	Tue, 17 Nov 2026 13:16:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hy2bvdyq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:16:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AHDGbH051708348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2026 13:16:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2D9F2004B;
	Tue, 17 Nov 2026 13:16:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21EC72004F;
	Tue, 17 Nov 2026 13:16:33 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.217.181])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Nov 2026 13:16:32 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v4 3/3] KVM: PPC: Hard disable interrupts before guest entry
Date: Tue, 17 Nov 2026 18:46:12 +0530
Message-ID: <20261117131612.707038-4-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX3djQtrP3be7U
 DclnT4oBJdFM8XYMaE8ckLXbCilVmjZltUwjjsit8QbCxXNfOVjj90kG2j2cIQG4r7UvLMmfdkv
 CQAJBmTXFgJjQgFiFQie0Sjr3viJJ/o=
X-Authority-Analysis: v=2.4 cv=Fu6QbGrq c=1 sm=1 tr=0 ts=6afc53be cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=SkEQ8EbvhdlHpgZ8pF0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX0Jdzwqxuwggi
 4GJBRrC3rRhnAivX3nqrZHI/sSgztQvZbwd9Xfn0h/XlaRzWYvvBrLum38/bvD4D4QYprVPFGDZ
 3PU97xxRc71yqnt0P3/C7UmXwEpp9l06edQaReyDazXG47wf4+gg9x6lT/N4qyMApLxIoLMqCtT
 KLTKyh1XaoCmIGzpQDd05gjGjhWD9SNqsRh2gLiGkcTF0gJhqLPCMgYbJVexHKLCkfYlEeGVab/
 OFC2zpT/YM5cXXyxo4MNs8IYdu35JEkDb63gIcNQxdLQQT2N0js6nfYiUvPTjNe5pS8sq/2PdYw
 3gHhkJz1Qj8GlhJL+J2yEWpd2mcpLt+APZNZqj5cyIl5GhPvke1ZtRHklyVVFdWdAVuddvlhtzY
 BYUe3fWZjIsM1jEYVOvf6lmT+FCkJ/YmfkrWRTETtImfZyHn5JjIoSmJPN1fB1i8fStbdjHK/aH
 jk9WgJqM/wS8/xW3+xw==
X-Proofpoint-GUID: CmRTWixKgxeJ8PtTpJRsXN7WQckI-dzI
X-Proofpoint-ORIG-GUID: nH3wojI4PGTzPYURodqK6hUp2SQ4UQNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

After applying preempt disable patch, i.e PATCH 2/3, Christian reported
a subsequent warning stopping his board to boot properly.

WARNING: at .kvmppc_fix_ee_before_entry+0x10/0x28, CPU#0: qemu-system-ppc/4667
CPU: 0 UID: 1000 PID: 4667 Comm: qemu-system-ppc Tainted: G        W           7.3.0-rc4-2-powerpc64-smp #1 PREEMPT
Tainted: [W]=WARN
Hardware name: varisys,CYRUS5040 e5500 0x80240012 CoreNet Generic
NIP [c00000000005dc3c] .kvmppc_fix_ee_before_entry+0x10/0x28
LR [c00000000005f298] .kvmppc_handle_exit+0x5b4/0x5e8
Call Trace:
[c000000086587780] [c00000000005ee10] .kvmppc_handle_exit+0x12c/0x5e8 (unreliable)
[c000000086587830] [c000000000062068] .kvmppc_resume_host+0xb8/0x10c

It triggers below warning...

static inline void kvmppc_fix_ee_before_entry(void)
{
        trace_hardirqs_on();

        /*
         * To avoid races, the caller must have gone directly from having
         * interrupts fully-enabled to hard-disabled.
         */
        WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);

This happens since kvmppc_prepare_to_enter does first local_irq_disable
followed by hard_irq_disable. This leaves a small window where interrupt
may occur and it could set the irq pending bit in PACA.

That local_irq_disable was necessary for PPC32 to track the lockdep
state etc. On PPC64 hard_irq_disable is good enough. There is no need to
do both. With now hard_irq_disable, doing local_irq_disable for PPC32,
just calling that is enough.

Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/all/b8f82519-9ae5-c247-e020-e79c627e57df@xenosoft.de/
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reviewed-by: Narayana Murty N <nnmlinux@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kvm/booke.c   | 1 -
 arch/powerpc/kvm/powerpc.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index aed7b476b7eb..2593f7ae6c09 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -722,7 +722,6 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.shared->msr & MSR_WE) {
 		local_irq_enable();
 		kvm_vcpu_halt(vcpu);
-		local_irq_disable();
 		hard_irq_disable();
 
 		kvmppc_set_exit_type(vcpu, EMULATED_MTMSRWE_EXITS);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..f4db7dea57b3 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -81,12 +81,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 	int r;
 
 	WARN_ON(irqs_disabled());
-	/*
-	 * local_irq_disable() first: on 32-bit, hard_irq_disable() alone is a
-	 * raw MSR[EE] clear that bypasses the lockdep/irq-tracing state, and
-	 * the xfer_to_guest_mode helpers assert IRQs are seen as disabled.
-	 */
-	local_irq_disable();
 	hard_irq_disable();
 
 	while (true) {
@@ -101,7 +95,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 			 */
 			local_irq_enable();
 			r = kvm_xfer_to_guest_mode_handle_work(vcpu);
-			local_irq_disable();
 			hard_irq_disable();
 			if (r) {
 				/*
@@ -134,7 +127,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 			local_irq_enable();
 			trace_kvm_check_requests(vcpu);
 			r = kvmppc_core_check_requests(vcpu);
-			local_irq_disable();
 			hard_irq_disable();
 			if (r > 0)
 				continue;
-- 
2.54.0

