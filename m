Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489003;
	b=xlfsAJauMhINsC+UOChcty9jQFyZ1yb+9d4TCmTtCNgWN1rhnJ75d/OUr/EqeQZL9xI9
	 gkDP7UDFel//GNJXnizcUKEk12HHf4R8uFJBPro01cM41ZMqGoSi+GKSjizye8SqR/3zq
	 hfzQD6oqRc3MDHQTSl2+KtngBy6qIq8FCv8SS9p+lSfGT/Y3rcNYbbfxNYXII5iwxy4se
	 IBnuFQAsgCMd7EWOtWEs52xI/DY7JGHqyFVWlR0XYR8ySzy8yQWR0qU2Ha9WbsLONfkFj
	 vVT1zW3U7HiPrbiIBgcJtw+4Ez8ITVFVbGH4NQXVol86/U2ah+apsXvPmcEo0lJTC2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489003;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=28NcXF69IBm63jhL8+R+KZ/QK0wdb3iYbvA7FIBBfo4=;
	b=nt7xJEcQ2g2vKyCWZaGEiXjvaMnG6CbKXC8DFQYI0V3cZLYUN+TyeHoaqfNUmL/GZ3Lj
	 wd9Xm2iTgWp1h1zJ4rUcHwr60R8CCAzn34KzkaG5ZgaUkKAM8+0KjeAZMn0b60Gt3mygN
	 o6rBp5+HdJDCSqiE3FVLEgMHR5URwwOBNbKXKpPsPzM/JJcyED/PXiSzQFT8vJ38xLpt0
	 3+OlfQdzxWiEw3fyzmpRpJzj6U8o9tk4iPevOlbSakR2FqtYjGeNJWGJjbh7rZTae7HS5
	 lCjq9BBIymqUS+Bmsott0BpBQTaqFkyzdMsiJKZ0OZiotgMYTDJbkZzPEXCWdvEpZ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndra2zLK;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE1606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAE1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndra2zLK
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2iLOo1637014;
	Thu, 12 Nov 2026 13:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=28NcXF69IBm63jhL8
	+R+KZ/QK0wdb3iYbvA7FIBBfo4=; b=ndra2zLKitjN7UlkJJkFmUy6CnLd8K0fc
	qrAIkE7SaqLxXM/TjIKbH6+UdHZVNN9/KcTrHVfVa1mFoszzitW6wXsZMpPx+sv3
	Ms3jEdrLUpeD2v01xohCQjhX5alUxENetc2Wqpf4nBuKl0Pm/idGOt3PfCU359FB
	bhWr4HGKyzsdLco/peUD7u6WIuLj3VI+jm8zqwD7MRCkbEaIjDipsMXSDJJiEv68
	o6oWQLDFLFxBZrMuxymlgoP/RByN9rF0Wg7SFyEe/eBcic8ybLkzh1f9cDrlVC4y
	DISgkJSU9Elf2mJYbALGpEuN2RLsfyHIXdtOhVrWfuExfo1oHMH0A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hstdgegvf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 13:09:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACD3jjt3145599;
	Thu, 12 Nov 2026 13:09:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hvd51xj4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 13:09:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ACD9ai028901710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Nov 2026 13:09:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C87F92004B;
	Thu, 12 Nov 2026 13:09:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C09720040;
	Thu, 12 Nov 2026 13:09:32 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.18.47])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Nov 2026 13:09:32 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v3 3/3] KVM: PPC: Use ppc_hard_irq_disable before guest entry
Date: Thu, 12 Nov 2026 18:39:13 +0530
Message-ID: <20261112130913.4124175-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112130913.4124175-1-sshegde@linux.ibm.com>
References: <20261112130913.4124175-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=J+M/fwnS c=1 sm=1 tr=0 ts=6af5ba95 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=SkEQ8EbvhdlHpgZ8pF0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX0X2U15DzsuEK
 4mF2K3PJ7pHcBNyDV/rNA8A1Lr9h1dvFIpFpIiZZpYwFvPTjvJrxfUFOcNUp0E8uDytq3Z40E1n
 RdlQeC6CQnvT3Q4S5b8Q8YHUh+6wAY6t9CZ+kcPiqKFKltEmEpMxJQLbG/n0Pz/iMIwgIyg4gmk
 wPGIFF/8MWdKT1INnTXy25IFHYdLRchKT53CsibyXkwSyGk4ZnMDg8iL965SkS13KlabQrt1AXU
 bwDABGLpVexL7OQ5QgL4His/QLZM3pae2NKoNPsxZrfsEPHPc6n0jjKjYGL12zLEnTnsunG78jF
 0aZJLP2Itixq3PFJoNLSkvVI/b8VqKXgtizv0phzb/cfsk/WDliPc+oGtxtYQwIhs76fmpeyJNX
 UfC86/z0//nMWnH+YToprylfExcog6xhaAVhwEQjCCf9fXI+iSLEYdbn7fowll7RFPOqyHGZPhP
 KiLLeHlJkrkVI2dBTVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX/iCtcI092T8L
 788tuSxG1ZtLJFK5tsS3Y5WCIO97KLE63IMjl7el0EI+F7DBL5CHbs/vtaVZvkqNwOdBvbGIuXP
 GvI56NfvgxxvsoJvYnLiyo31abnkCQY=
X-Proofpoint-GUID: Kch17STND8cqv_2vGzVKNnzGBdQrVuiQ
X-Proofpoint-ORIG-GUID: ww6IZzwLdaZVVKxu8wClHTVAB6xC8BdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

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
do both. Use the new irq api to do the necessary one.

Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/all/b8f82519-9ae5-c247-e020-e79c627e57df@xenosoft.de/
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kvm/booke.c   |  3 +--
 arch/powerpc/kvm/powerpc.c | 14 +++-----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index aed7b476b7eb..1ba28848e8bc 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -722,8 +722,7 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.shared->msr & MSR_WE) {
 		local_irq_enable();
 		kvm_vcpu_halt(vcpu);
-		local_irq_disable();
-		hard_irq_disable();
+		ppc_hard_irq_disable();
 
 		kvmppc_set_exit_type(vcpu, EMULATED_MTMSRWE_EXITS);
 		r = 1;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..4ee3d7bfe917 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -81,13 +81,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 	int r;
 
 	WARN_ON(irqs_disabled());
-	/*
-	 * local_irq_disable() first: on 32-bit, hard_irq_disable() alone is a
-	 * raw MSR[EE] clear that bypasses the lockdep/irq-tracing state, and
-	 * the xfer_to_guest_mode helpers assert IRQs are seen as disabled.
-	 */
-	local_irq_disable();
-	hard_irq_disable();
+	ppc_hard_irq_disable();
 
 	while (true) {
 		xfer_to_guest_mode_prepare();
@@ -101,8 +95,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 			 */
 			local_irq_enable();
 			r = kvm_xfer_to_guest_mode_handle_work(vcpu);
-			local_irq_disable();
-			hard_irq_disable();
+			ppc_hard_irq_disable();
 			if (r) {
 				/*
 				 * The generic helper does not set the exit
@@ -134,8 +127,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 			local_irq_enable();
 			trace_kvm_check_requests(vcpu);
 			r = kvmppc_core_check_requests(vcpu);
-			local_irq_disable();
-			hard_irq_disable();
+			ppc_hard_irq_disable();
 			if (r > 0)
 				continue;
 			break;
-- 
2.52.0

