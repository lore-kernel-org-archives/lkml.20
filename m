Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2035632B1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115144; cv=none; b=TMbw2iPfRA5tprt3L74URbwBiKRpu8wSRIbENuI7e6Dc42L6d7J6gDtA+FPn743Y2SuDe8SHikBWChrpKXsGoGpVGR6OiNlOha5sXAy8uEUePJ03bIz63lAg0IF3LJGXlApusBfMpT8bgaw0B3nhrjcgDQpTXR5frP5X1H3I38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115144; c=relaxed/simple;
	bh=ilYK4JBuirT8HWj9lb7kNesQ7ONo66yaGSx6NVf2VE0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gA8OgAEVeA4WCyERU6tmYlNSTHA1Y6nzpWdY7Nrxcli7gTmoeLWlQhIF39Fr9g8eyVHO3VJvRmCBhOeQItvoVz/Rh2FLr32Kd1M5mk6jERllnQBe24xZpcsP1Eos+AaThrykLvNs1qsH7MvMM8tAmlxlp5YRuQMm++WahEipbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xi5iBYok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnm/H/7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xi5iBYok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnm/H/7f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7xNX767737
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=; b=Xi5iBYokt2Ym60y1
	vpsVpXo8tMWGOaetwjaQuZwvfcEM0uLpPU1gEgyshw/wom2fcML7yMokSyv/bN67
	aPzoeG3QveP9rSjDgKD6X7DEI+TDD2KRztD8yWHPGJC4Dv1hHaR34TrBwrqxAKgH
	xit/WxV4HJQg6GhWjom3Kks0KUcjV/MNt60Re4x1Z3XuDYRpTWIuKd7pxK5+4bN9
	6ylLrW5+P47ZKjuSE1vH9XSMXXmCeiaiUP/ZjdPsoGm3xsT/0g8XYPSBYqSK5dhQ
	oghfRPror1+lpoUXwjMxNR9csqCnxWGFBdinqWCmNv1vmhasJO9sOcaeQvliyR+i
	F6C7Kg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqkvka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:12:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso353420eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115134; x=1790719934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=;
        b=bnm/H/7fnMuCYQpXPrQaTq/Lj/bxiU7VDbLztOek85oYJ3aWzMraxk8gQSMm/4WlYW
         PI8+/HWYbKRdqCkbx4hyCvbOHclSWVH+DchOtqhyw/jMMa3rxuP9Lk2rPouIluxTuOfL
         tiLODnnPxB7Fn0PMWX8NJx/F2MiYi4+i64fmPoA9j2dwbbUirhI8gibTXD/Kq/Oy8Nc1
         XxUtFAGRUalQbriTj/l9qm0R9rmT4Ixv5Svi/ITKYsQ7pXBr3+chBzcirBxykzmXwdYP
         Z5gH8d+4+lic3vfGLKe9s7jYJdJXYsnSx+dYPqfoZ9GE5/AMAskBLvu3e20jFWOe1Wab
         SQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115135; x=1790719935;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=;
        b=VO0FaJQ5VnUIlYU/eVOqza8XmT0xR+55AiQ/+SiXr2IQJYMcbfAHyEaEozuM0bJE9K
         kzOGEz7f39Oh1En+XWP4IhlcuY1gIBnowAmqlzxJQcIBb72q97y0YLhmQep16QRrdEWt
         vqaMQFzpwIRzMg4mKLi/HWgdue7SZc6FEx//8un/VB8E8Xu1FWFKK2J9z4WGXprn1OLr
         PsNEIQyBbVfMRITt1bmjJVt+2SdhMCqF22MqtIjCJf11FNBlyJ8g+9OwPEGh3GloQQXe
         mJX5f/7gtYRgm249EoON0eTsLpPDjexH+89zPw23ETFPFk47xC7W3+GdD15TjvuZcEcu
         wVsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm58izY+6VbVZ9eKizoCbFQfnL02BRViALfvrtGBZF1slUWU4cabOTS24ojsUt03UDz8WSoa4iIrpdrtI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGciNU+3Li26pJeIE15wSWB7TupU0txvh1ORy7lNXm7A6hNbMd
	3uXBPoqSYSjzgqFlWsfMqQGNPtHHA3oPYpe6F+SRnLqeuyjGPa1dg0oQ0mfcE0XTOCte0qjTEZY
	uE6PvLAzGZM5NbrlLY84QCG5fnTZuHSOb2ZeQDs7p3ZX6y9i2bsVaS52tke1YraCWrYU=
X-Gm-Gg: AYBFou2fU1dAD0aB+j4LmeGgMlSIiRa8GeOpExxMYzqk+fdJqSHLqmoRd34aVTtkCF/
	XQgg4Q6EleDDYU/lI6ECfwuXZdffEBzcPsiX/a9QVJohRx7CbjmCa6+xCSZBYrwi3QSMiFnl3pL
	7gWx/XSJ9voTI623Lh7cOU3ivdASkfBiq7LROoEkSS7Q3hKkH8fi38J4VQZn41x13Cjvm8Y/TAq
	RMlRWK1+1BAKC5EtWLMid2lGimp9Srg9mRIVNVbj03IdrYnLRcvZQLF4Po0wcDwHZ8iTqGbEx4g
	SlbVevqt6X3Y9Qux+xHT+B1keDkIVBkmcKPx3y7U8Z1PJfoOdCw/lbvJ1+j6RHrxuoxlVntzPGF
	aH7QJEfw8xGwz+33qrte1XLOr22vf3jitwzPWfNNleZ9iiRfOORE1s8c=
X-Received: by 2002:a05:693c:8948:10b0:33b:de3b:8b09 with SMTP id 5a478bee46e88-33e8e1b4b4cmr574482eec.40.1790115134431;
        Tue, 22 Sep 2026 15:12:14 -0700 (PDT)
X-Received: by 2002:a05:693c:8948:10b0:33b:de3b:8b09 with SMTP id 5a478bee46e88-33e8e1b4b4cmr574460eec.40.1790115133819;
        Tue, 22 Sep 2026 15:12:13 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm1032300eec.9.2026.09.22.15.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:12:13 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:12:02 -0700
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
Subject: Re: [PATCH v19 07/20] KVM: arm64: Add vcpu load/put call backs for
 flavors
Message-ID: <20260922151202.0000549c@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-8-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-8-suzuki.poulose@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX5MFocbEX0HXL
 yojdKYXEwKlZiaHpvzxQMnty1UIhftaS3eX1gfrtnIvLvpjnvV1KDmRlU+1m3EKwSIR7olSrFv9
 BrsXg2CWMWRrgZzp6sY6OxRgb2DoJip8fFCKiOtv2qtqPIbp6AUZ0qdVByhh/VjJtsUUO9/vL64
 L7/k+bkdJ0H1uAKMKSQaLp+4jxVjYTr92zRS66xVJk8GX5shvhSVDV0liVRKtpo40MkNvBEv42H
 Y1uPQczFK8tJeLZHwCRLClVVBuT2iyLiS2nnaAtj/gm3JVDUuus0xQhnO9AtktpoE8LjSsab1sh
 8kRq3Cv07AL4HIUoVXm638en0TnpYPxjPf+3PWjyxKjGjjy5HUWCqmQnlHId3V+MWWh+qD7pv/y
 vWGlDO0gJfupuc7K2v6QMXofCgV7Lsv8IxA1+2PawaW7hKTEgUtXRH+lp8RpdhrC5fy0M+GM+k6
 UTzB7uA871CKfWOd1bg==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2fd3f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=eF-YeP4ItYG6qj9G5aAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: QLowCxZJeo84mFwRvQP10sgzafxriWKD
X-Proofpoint-GUID: QLowCxZJeo84mFwRvQP10sgzafxriWKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX25iSNZaWNbpg
 tpsCANgFYDo6qsFdZmhVdiRxkpEfmbj4OC4/gLlCveFKz+4rcQcNaC0HRydt7v2R4rX5gWU16I0
 ZhTPhXnwC1VT2NTXpqgUPqYHf12UiKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

On Sun, 20 Sep 2026 22:28:32 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
 
A couple of comments on this one.

> ---
> Changes since v17:
>  - Use macro to initialize the per-flavor ops
>  - Add a wrapper to initialise ops in the vcpu structure.
>  - Add BUILD_BUG_ON for the array size
>  - Remove irrelevant comment about the order of timer loading for !VHE
>  - Use the explicti kvm_call_hyp_nvhe for nVHE flavor
>  - Don't call nvhe_vcpu_put from pkvm_vcpu_put, open code them
>  - Drop cpu argument for vcpu_load() callback. We set the cpu
>    before the callbacks are invoked


> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index c74706ed9a531..9b977dc734220 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +static void nvhe_vcpu_load(struct kvm_vcpu *vcpu)
> +{
> +	vcpu_prepare_mmu(vcpu);
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
> +	vcpu_set_pauth_traps(vcpu);

Now it isn't called from the pkvm path can you remove the defenses
in there on !is_protected_kvm_enabled()?

> +}
> +

> +
> +static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_call_hyp_nvhe(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> +	kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> +
> +	/* __pkvm_vcpu_put implies a sync of the state */
> +	if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
> +		vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +
> +	kvm_vcpu_put_debug(vcpu);
> +	kvm_arch_vcpu_put_fp(vcpu);
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +	kvm_vcpu_pmu_restore_host(vcpu);

May have been incorrect or pointless but wasn't kvm_arm_vmid_clear_active()
previously called in this path?  Would be nice to tweak that to be under
an appropriate gate in a precursor patch with explanation of why.

> +}
> +
> +void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
>  	vcpu_clear_on_unsupported_cpu(vcpu);
>  	vcpu->cpu = -1;
>  }
> @@ -2136,6 +2187,37 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  	}
>  }

> +
> +#define KVM_VCPU_OPS(flavor, ops)		\
> +	[(flavor)] = (ops)
> +
> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
> +	KVM_VCPU_OPS(VM_VHE, &vhe_vcpu_ops),
> +	KVM_VCPU_OPS(VM_NVHE, &nvhe_vcpu_ops),
> +	KVM_VCPU_OPS(VM_PKVM, &pkvm_vcpu_ops),
> +	KVM_VCPU_OPS(VM_PROTECTED_PKVM, &pkvm_vcpu_ops),

I'd put these in same order as the enum. Given the construction
doesn't really matter but just feels more natural when reading
the code to check they are all there (obviously the BUILD_BUG
below also does that).

> +};
> +
> +static void kvm_init_vcpu_ops(struct kvm_vcpu *vcpu)
> +{
> +	BUILD_BUG_ON(ARRAY_SIZE(arm64_vcpu_ops) != VM_FLAVOR_MAX);
> +	vcpu->arch.vcpu_ops = arm64_vcpu_ops[vcpu->kvm->arch.vm_flavor];
> +}
> +
>  static unsigned long nvhe_percpu_size(void)
>  {
>  	return (unsigned long)CHOOSE_NVHE_SYM(__per_cpu_end) -

