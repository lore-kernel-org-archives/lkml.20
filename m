Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556160;
	b=BeH9y6A0zpTbMaV7dZ0I7ZUk93nVfosPuhn7VtgwfkF0AzXo0+AiA0jAe6/MSG/hGHwF
	 w2Zi7Sa66uZpGo5pXBTP0j45/7SFGRgBQB26DsY4D7g3GtZw061CYA6SSyjfvswzhLWnz
	 3sAvzh7LXweTzhNbX18C6TotN5eAFy2QBZNUc/MYhoO9nS6jXyZEeRUfbpAUqXhDH3Gvc
	 4DqHcsC7R9klP6xzZtdt/skrtEt45Yf3FJHUNp4jnpKzoAZhPr3GrB1MaDiv62DeMuLFH
	 jHzSobUilci81MEonLgIjUn2YnOksQptCMz9y0ojmTggFXj1Bgi0r6QJDUk4ddErrcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yD3zIB455QGIB/nplw1nErpdlc6MJJqOdHe0pjiY9Ao=;
	b=EgAQaMzAraC65t3JXxD/oGUKFx4J01LAn5C68x9LhpBUvJtp4tzTtZjoq4EVgHeXZxyU
	 ABPNYh8Ftr8qDK51z7LHmY4UqSKgAITl1sm6i6uTqDldjvpRSXR3WS6VFq/tYmHBjGMfm
	 FVnM0UskGXjPuONoEZjLzJqQ2GN4z18q3DAWSPLq7JZveI7RRgr3uwISmmu+JKIqa+YRt
	 jNhEGgsJOGvabdz7E6W8PpdvZs8qsNZt0tVlJFBCZTwAluLugv9Emz5DAHpB5yTAMJtFY
	 M2CAWB4lwnS3pPiaxh9TDMZAeObXxgSSDJlfD3JJKVaitOc+3u6PM+JFEZ7t7uPD4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CD3DczT8;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D031A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CD3DczT8
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5Ec8K1898471;
	Fri, 13 Nov 2026 07:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=yD3zIB
	455QGIB/nplw1nErpdlc6MJJqOdHe0pjiY9Ao=; b=CD3DczT8fxjWk/eHhaL2j/
	EXGdFdiSuOGlt4x7EnI/xlpw2blskQEglVrZ5lMhe5p9JqKoMj/h+PduRoziNCdb
	aQXlnhnG7tHpDKpoMfMU2WWxxWWqi1WGBNR9KNwMjpb6MzMF3qNNm+xMwoP7DWHA
	bVur0tgXJAeNsoMeudt7qtnGXGDCcQHQpAxacv/d7z9PpJKD6ta9VdXu7BWn+7Q/
	64UXyTQE3Pj7dpZI4QdFrl1BC+bG4u0dlyc9XndDcT3KqQHPLPFlr1G47iFt8bD5
	JiXksrfVgYN7R2bsk99qHsVedgozFU84kH5W1T7J2TBq36FdxCgDeK74eFyL+Iwg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsuq7abbu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 07:49:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5Z1Pe1832382;
	Fri, 13 Nov 2026 07:49:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hvkq10de4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 07:49:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AD7mxD832571866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Nov 2026 07:48:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E27C20043;
	Fri, 13 Nov 2026 07:48:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 608C820040;
	Fri, 13 Nov 2026 07:48:56 +0000 (GMT)
Received: from [9.39.16.227] (unknown [9.39.16.227])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Nov 2026 07:48:56 +0000 (GMT)
Message-ID: <24f5303f-19d9-41c4-826d-b2a777008e87@linux.ibm.com>
Date: Fri, 13 Nov 2026 13:18:55 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] KVM: PPC: Use ppc_hard_irq_disable before guest
 entry
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com,
        harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
        venkat88@linux.ibm.com, mkchauras@gmail.com
References: <20261112130913.4124175-1-sshegde@linux.ibm.com>
 <20261112130913.4124175-4-sshegde@linux.ibm.com>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <20261112130913.4124175-4-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX878ZmJvolgTZ
 Wt/zK4a4coekuNhgGDwBt98tGyYCnApZHn1e+iSVKCdZr2NqucL1X0WNQwE3YRd7ILv+hJh43OM
 FBnOFLqZCwzM+zaw+rEK5HAz7rs/qPs=
X-Authority-Analysis: v=2.4 cv=HbCB3SE8 c=1 sm=1 tr=0 ts=6af6c0f1 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=jkjrswUoTJZ6kdcGLO8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mkgzvKllCj9yNTLhZCzhE44HrOLi1nYS
X-Proofpoint-GUID: 9y4abnksacH48eUbDO8BLwBJ5BUJdio_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfXy9B8pG/BP3GH
 pGEb4DU1rNasanq3oGI+MESGqZ1exOJo+hchupNyiMXAJdTb+nGii0W38aCx5AETl+4TEP6DSR6
 ZmHVFzKPYr1Qun3Ddq55rPKW18aTq8CdatZEaMrcoksfsR7zVvjGXAZqMpdm4vnDDUvF5Zk/2XW
 RG2GL44aoltImdmNPNkEswkmICKpGzCE5kAoXbu6uznVda96vSvKr/+LUreyYky2Ns8EC+z0YQy
 R4i/e+w1PpZv1bv4jrw5qD/DWR19Xyb7tI4f1f2RMwMNAGiz42EGGeCAaQ+5gk44HNBxCuqUFBm
 hGHUJQwZRLZ+KVgcLJdXh4jKvQH6udcf8eecIHLoztz2/tZK8ODAE7J54cbbftSPENPhKvx9b24
 eaTbwep6J6s/i9E8y4tyop5zNh2EY0nc3puZAbiZbmrjAhFEAdDMTCoauxC9WZFEGo09t26ulWD
 5Bb3qyTDQVvsrgpQidg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130030

Hi,

On 12/11/26 6:39 PM, Shrikanth Hegde wrote:
> After applying preempt disable patch, i.e PATCH 2/3, Christian reported
> a subsequent warning stopping his board to boot properly.
> 
> WARNING: at .kvmppc_fix_ee_before_entry+0x10/0x28, CPU#0: qemu-system-ppc/4667
> CPU: 0 UID: 1000 PID: 4667 Comm: qemu-system-ppc Tainted: G        W           7.3.0-rc4-2-powerpc64-smp #1 PREEMPT
> Tainted: [W]=WARN
> Hardware name: varisys,CYRUS5040 e5500 0x80240012 CoreNet Generic
> NIP [c00000000005dc3c] .kvmppc_fix_ee_before_entry+0x10/0x28
> LR [c00000000005f298] .kvmppc_handle_exit+0x5b4/0x5e8
> Call Trace:
> [c000000086587780] [c00000000005ee10] .kvmppc_handle_exit+0x12c/0x5e8 (unreliable)
> [c000000086587830] [c000000000062068] .kvmppc_resume_host+0xb8/0x10c
> 
> It triggers below warning...
> 
> static inline void kvmppc_fix_ee_before_entry(void)
> {
>          trace_hardirqs_on();
> 
>          /*
>           * To avoid races, the caller must have gone directly from having
>           * interrupts fully-enabled to hard-disabled.
>           */
>          WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);
> 
> This happens since kvmppc_prepare_to_enter does first local_irq_disable
> followed by hard_irq_disable. This leaves a small window where interrupt
> may occur and it could set the irq pending bit in PACA.
> 
> That local_irq_disable was necessary for PPC32 to track the lockdep
> state etc. On PPC64 hard_irq_disable is good enough. There is no need to
> do both. Use the new irq api to do the necessary one.
> 
> Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> Reported-by: Christian Zigotzky<chzigotzky@xenosoft.de>
> Closes:https://lore.kernel.org/all/b8f82519-9ae5-c247-e020- 
> e79c627e57df@xenosoft.de/
> Tested-by: Christian Zigotzky<chzigotzky@xenosoft.de>
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM)<mkchauras@gmail.com>
> Signed-off-by: Shrikanth Hegde<sshegde@linux.ibm.com>
> ---
>   arch/powerpc/kvm/booke.c   |  3 +--
>   arch/powerpc/kvm/powerpc.c | 14 +++-----------
>   2 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index aed7b476b7eb..1ba28848e8bc 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -722,8 +722,7 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
>   	if (vcpu->arch.shared->msr & MSR_WE) {
>   		local_irq_enable();
>   		kvm_vcpu_halt(vcpu);
> -		local_irq_disable();
> -		hard_irq_disable();
> +		ppc_hard_irq_disable();
>   
>   		kvmppc_set_exit_type(vcpu, EMULATED_MTMSRWE_EXITS);
>   		r = 1;
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9194cf492d1c..4ee3d7bfe917 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -81,13 +81,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>   	int r;
>   
>   	WARN_ON(irqs_disabled());
> -	/*
> -	 * local_irq_disable() first: on 32-bit, hard_irq_disable() alone is a
> -	 * raw MSR[EE] clear that bypasses the lockdep/irq-tracing state, and
> -	 * the xfer_to_guest_mode helpers assert IRQs are seen as disabled.
> -	 */
> -	local_irq_disable();
> -	hard_irq_disable();
> +	ppc_hard_irq_disable();
>   
>   	while (true) {
>   		xfer_to_guest_mode_prepare();
> @@ -101,8 +95,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>   			 */
>   			local_irq_enable();
>   			r = kvm_xfer_to_guest_mode_handle_work(vcpu);
> -			local_irq_disable();
> -			hard_irq_disable();
> +			ppc_hard_irq_disable();
>   			if (r) {
>   				/*
>   				 * The generic helper does not set the exit
> @@ -134,8 +127,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>   			local_irq_enable();
>   			trace_kvm_check_requests(vcpu);
>   			r = kvmppc_core_check_requests(vcpu);
> -			local_irq_disable();
> -			hard_irq_disable();
> +			ppc_hard_irq_disable();
>   			if (r > 0)
>   				continue;
>   			break;
The changes look good to me.

Using ppc_hard_irq_disable() directly on PPC64 avoids the soft-disable 
to hard-disable window, while preserving the software IRQ mask and 
tracing state required by the guest-entry path. The BookE halt path and 
the guest-work retry paths are covered as well.

Reviewed-by: Narayana Murty N nnmlinux@linux.ibm.com

