Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2C529401
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116952; cv=none; b=Ms7Z9zvc9jksonyPVFTMaqHOt4TvphzUTul7lRyLl2WHcDduiU0nE7hbJDLJV3jb+V+GSPoYKGIr1XZKOWDTy6tXKtJ5amrEkB9i56I7H+/VmLEZX9m4uqmfqZl0fcCb0pR5GJq0wBREDxkGifd5uZ/XZ2o+piOrDBq6aThIGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116952; c=relaxed/simple;
	bh=TuulLzPlORgXvFolK/4BKymKSY5UdUG0I9DOV79/2LA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CscA5hto/RxkDRESAX/sqHshonH1ZvYEcRtUacJq3HxJ7qrzsnqHivPu6jjOYxhl8xYNVfHuVeOurD3ehv4Axtj0TYBn+eiXrmhU3Qe1xJOVJD1uABu+PS5NnWl/s1XON7MN+tfP3pc4UfnYZzOPtyILJFOrldHnnaQK6rdebcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=my4HTeXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILtFyRuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="my4HTeXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILtFyRuo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Sd7900491
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=; b=my4HTeXumBECvXzV
	j4c3b7Ko5e6iN9r2j3NaIr1WpIryDMswNKztKULaiH8U/S7ed7WOZ7+wYlE1HGpZ
	Hjt7hlE+tqLbaKwoCMBzhnekwiW98RiuAjhMEWROURtje/dnsQNi5K9t8cLsfksg
	OK5dM07a0eZwN2xql6E+x7ZfZEREKFLZPhzP9ZLMIgCam6nPMdqMyypmmVAAAYrv
	cun2124+4GbE74oUkP+6ObMz39ad7IIGsV7TCdtRhCrD78bkU6Z2gexaPF3J59kR
	LDm5IvrdJQsW9cIS9LhubQ23adBqpJUs9wuxdR6EaJcni9Eeo5LQzoGg++obw/VM
	PV28Qg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyv56g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:42:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso1064585eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116944; x=1790721744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=;
        b=ILtFyRuoul5qDT04Sr38TVkpnLLidnNaHt4kiE0isfngZCnS/osDgwLxP1O3pHgaCI
         DeKP5m40Q4lblrBqaeOZdT/Z7RkyjxiEydRQq8wkz9fatnXqzF7Rhf9Tam1wJeOx0BB6
         NvO3OutbY/7KQ+mkeXUKNZ/pF0CkBDlExh+eoAwK6AVAjB0OwddWXGNzf5uGOlHyP2Xe
         nykWXrDmF6Pv9p4WnU2WQlIPPBePkMYNVFMOV4VX3F9vCkdPFAjTeRRThI5p2Ztz9SIZ
         gtkIU2mw1Yq6Nrg6GOgH5gMPSmgt/jTegG8Gej2CelVToP8sBs2iFM1CSNqZs17f7Sub
         beLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116944; x=1790721744;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=;
        b=WetDilWAZMtc8MCwsXIRFQKbXrsTDcuMJmpF+QMBXi9dh3ecwdZN4bk0RtuqKjcfHk
         BtcO88kzV/xKklGhvzC8Y+qeSeg1eOhkQ5SciJCRYgGFmM6CGSBp8KziCKtD17j77FB5
         8uQA96FTIyaMRQEbsUHZOZwIwddsdAnL7zCbeplP++gF5UP69J5+t708fE8Cl3SHflIF
         xxBHU0yrk9+FmQ9ubdekScGBo4q3nsLz2/+AIrohU9QGFESt19T8ffRpRb1DzddeXrDn
         ksv4j3icgaMMA42UyRUqs/c5dowqYFR5xiwG71iVVTtrcsQNL0F9TyB5IiWi69OUU50L
         9Gjw==
X-Forwarded-Encrypted: i=1; AKwUvBwmGuQNDOVhlc3JP/pohg7t1EQHx5gr9Lw0zlDUvOpltsi4k9U+aEmG5hHWpSlHpDkhtpTewGQeVY5zf/8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2bpdjsxF+lzP2DMPk4GekeS4YypqWLLc7yuxnd4XwFrRJ2PQ3
	BKSo+G6onXJbpWea2b5qqJ4MwUtAycVf0WS6W8HV1U2NZuFJo0u9MqCqH0H8qMrrk8geYZRTUWc
	tx7dC3TjbRLgDd1bPXh3GTd4I0smKrOvdlMH5bwAWZlMhDEqgKd5gWbZXrzymp49lWdU=
X-Gm-Gg: AYBFou3tJDRk5sE7eVaQrWYmzR5fR22d+nZcuGkAFqAAd0MCaiDQKzzSZwQAXFnPJ/x
	ee8ysl4dtnKdDFaOe+OnP4x8kb+s8QySLd3SQSAUTLnzzhnVfPqOBS+71lmB85DE0T6srxR780Z
	Tkge7XTq1AcYz9RqmnYj6AX1fhUlZTZwohD+JfcJozND0IhAEMhy4zBhUfIPB6szHb7NCh+uacI
	RqvS2l8uo6QT3e6dLJ1KQi/b6eRRt1p7q6+/3tI+lhFcElI6BxoCoJLTV9oK+6W5ebPatIp3wYE
	MXUhcjSdk9uxAW1EjB6/TmUre6V5JT/nE1+ZOB/usNq2zdXQkPmIkd+aOBdwN8zLc5/fLHLcmP1
	G/TArFszE0VQpDiTEAds9Vu9NO/hGIFOWgY1dom96vz2/WsXiNGCCe7w=
X-Received: by 2002:a05:693c:6211:b0:33b:de13:9574 with SMTP id 5a478bee46e88-33e8dbc4479mr743996eec.19.1790116943630;
        Tue, 22 Sep 2026 15:42:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6211:b0:33b:de13:9574 with SMTP id 5a478bee46e88-33e8dbc4479mr743958eec.19.1790116942985;
        Tue, 22 Sep 2026 15:42:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm1266199eec.26.2026.09.22.15.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:42:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:42:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs
 running on hyp that don't trust the host
Message-ID: <20260922154219.00000999@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-12-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-12-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rD8zr7Onx-0A4THQW3d0jk9w-BwXTsSa
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab30451 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=7nvTRwv7b12_b2Z3:21 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=99P15FIpgWgLHUSX_UoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX1PkrcY0k2khY
 RpsHL6Jdd7qkIZDkZjKFXDrSONARcfr6wFiMQwjI+82fTSb+hTh2934rHaioL8yREUh4n2gHjbD
 cpDobAm1ci9tOr0tTUkMOcSEK4rbXiWeKUBOtURa8eRXT8U7cAE20Jx+bnrMabwivZJL0ySe3gN
 7I6NZ1epewRJ1CtANwd4bdszegtEGuRETaWlm87dnpCDQnyMAiaIPCtquOjONadsrezfynkO+Q3
 eeeBxZ2IG3J4QPSt00iwGon0aSWs4YlEo/TShNj5M5DRm3Qn0o1BrQthFIxAamaEvUrdnJn4eZ2
 zTzW87lqMryebtHfwNx8UM5Z4AIM++aeA9x/Li1yZQ+GoaYe/9LShbNmX/LyUoG81J/oDFAW+CP
 z2Hi3vqobDdWe0ZcS08BoDrtwZjhbddDJtbDCx5xjBY6RebytAgUguyEa/i1iqSISJ6ngTM6Nlw
 1w4wRwIALkknRrMAl9w==
X-Proofpoint-ORIG-GUID: rD8zr7Onx-0A4THQW3d0jk9w-BwXTsSa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX/nKUL9rULQZ0
 TA0T19Ft0F/KX7VQHLWG7OHc7NXKk9iqPi75ORNPQlpFRg1fuh5EWBYPh+uXuGFcY8eoxqRDqCL
 LPcTNGqbgLxCLB0XxB/0QdXSGumTrMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:36 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs

Maybe don't mention RMM yet, or make it clear that isn't here in this
patch.

> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
> stage2 and prevent creation of VGIC other than v3.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Other than minor comments, it feels to me like these first 11
patches are good cleanup even without the RMM stuff that follows.
Perhaps can get these upstream faster than the rest?

Jonathan

> ---
> Changes since v18:
>  - Cover pKVM guests for VGIC v3 mandate.
>  - Merge the VGIC mandate check in here.
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/mmu.c              | 2 +-
>  arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3211543a85b38..bb156a633ab75 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -328,6 +328,8 @@ enum fgt_group_id {
>  enum kvm_arm_vm_flavor {
>  	VM_NVHE,
>  	VM_VHE,
> +	/* VMs running on a hyp that doesn't trust */
> +	MARKER(__VM_DISTRUSTING_HYP),
>  	VM_PKVM,		/* Normal guests on pKVM */
>  	MARKER(__VM_PROTECTED),
>  	VM_PROTECTED_PKVM,	/* Protected VM */
> @@ -1546,6 +1548,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>  #define kvm_vm_is_unprotected_pkvm(kvm)		\
>  	(is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PKVM))
>  
> +#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>  
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index cf293d09e940a..413c4b114d75d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1251,7 +1251,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  				     KVM_PGTABLE_PROT_R |
>  				     (writable ? KVM_PGTABLE_PROT_W : 0);
>  
> -	if (is_protected_kvm_enabled())
> +	if (kvm_vm_hyp_is_distrusting(kvm))
>  		return -EPERM;
>  
>  	size += offset_in_page(guest_ipa);
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 4012df6002ea6..874025513afcc 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -84,6 +84,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  		!kvm_vgic_global_state.can_emulate_gicv2)
>  		return -ENODEV;
>  
> +	if (kvm_vm_hyp_is_distrusting(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
> +		return -ENODEV;
>  	/*
>  	 * Ensure mutual exclusion with vCPU creation and any vCPU ioctls by:
>  	 *

