Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2CC4A64D4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107051; cv=none; b=LEeF8/I5eGeBfzSPg8lvEZVAErYl651VCuV/xmWeBq9lkmor+GymZp4HEcHUrpmvZ8DLoT9NMl/NjPOXk5DkxcZi9sLjBcTTGaT8GYx/Goa3OwzkOMu4pAf9DrVkRitudv5ZhWbPXPaPeptYfcNUGnZ4bGY2h3eSAJtP5Ge65Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107051; c=relaxed/simple;
	bh=9JvbDLSyQrfrPc2pw153E2x+FuYYskw3Od9BLkW7on4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhnUj7qsGrDSbleVR/IU6tKzRGWaWz64MCMaNHOCBMbuJObDBy9RnCSJWur45FeuG8g0q6Qrj11K2pZ0tvA5BeKIyvFZW4vDX9QKyh5JGsKbwmU1v9tGAzHQUuDBzDQBj767y3+U906gQT7KYjg93434Eig2ArsS7+2r1OfmE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0uPXZoH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGVprdqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0uPXZoH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGVprdqs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI80PA767753
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=; b=d0uPXZoHzbyscvk9
	Fui+SId+pi+/38DYBmJ4SUmJj3TBIOl02UaIYHzThs7bokVlSzJZkfGbSRFsL68/
	cZ/uP/7WOGeXAlcTU4vmV+HflDvNyN5Z0fnAcM7nU/XcvaTETkXOUSJ2f1ZojAc4
	0zLDZ8ltivPnVLqpPWKKeqfPg3JacgZQKAOB6RcwGV524NRBSIUWLShhBgtt/L5r
	7FvnTgzpCnyqgX+bp9PyoWBEh/mB7BrjGXjBo4j1BWeuUZUdClE0HfyiaD9y3FRZ
	4UMgUMuzREVwjn8607kyf0+UyBgezQRsBNMpLq9Jd/sUhd3kjkArdqLJu7ivd9Kp
	BNfMeA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqk884-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:57:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so245537c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790107047; x=1790711847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=;
        b=kGVprdqsLJE/kF6PcWZCAvzY0M1iKvhixxMmog5XQTIL2HOLrVo8Gaj149gaKhExy0
         Fi4HnT5h38lwlwco4ha+/isdJJN4vus+x2CGHyyZThzJUc6GuZk6UyzxNZVCQeZYHcTx
         zf41eqJGPrSEjTnzbnhlDPLZzh45aBufynWkt4Sc7Hw+R2zetIf3J00Jt40Jc2MasH7/
         IBPPqD+63YVs3LTo2RGjUIcE4nXoY7b1bkyWrKuqZ7cWLgOZSKRLH5sfPACmxLg9Xg2S
         dJd+r8cDRy2LIbxBvCQhln0fiks9ruBnfs0NTgiT1KrChjCT/I5x0I+XGbCnIwYIulUM
         P4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107047; x=1790711847;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=;
        b=eX8uFKQdOi+a4ZMW+BYPP6klVrIvZA7M1Ldj4Ic/AmWNchT6NQ3N+0OVWczpXoKVMc
         BZmMX3rzHdeqIFxcRJRL4XrgqzSMspVuZKcy/mYCcPrsiPfnC6WXXvgI8f3xWT8qIERu
         nS5fOtOI1f8X6eL9f9IcLxn+WT8A45wrXm1vsSDgrFAIW32w6WnxoqgXLZZqpXv9o3+N
         4tKfbL/C69VDjqcZcO9Vhvw1/tmIF1wiUnNdzr9BzAhTVRzZ/WDSl2jlqn4mfjVovZbI
         8x5WXeeng6h5TPqG62J215nMu5gmbiMCR4q7cVWTfHUjsk43KH0Mf5drlYecUhqEGxY2
         RUkw==
X-Forwarded-Encrypted: i=1; AKwUvBw1lCxefEFjA+vZ4okKNrQqM2pNtENhx6cwjojH0ueU1bdNRSeNhyQVfGTD5fNhQrMUg1Em1g3XceFKRus=@vger.kernel.org
X-Gm-Message-State: AFuF++nJWLbT+ZfMf+MR5wFcg6NfjZ6RQKScqNmk+bBBG0MUhsFqxk4Y
	jrYjjW5JlVluioIjwMV+2+768AA5bHWSZrOlzUjGDbS3Sb5YsA0tr5To8eDfdkBMHz2Em945TNP
	Sbjk/tIjl8Us+s1RiYtkgdEdgv6Utabwfwdv6541douRS+oIi/pdxhkutwE8eVk3ndG0=
X-Gm-Gg: AYBFou3arm5OZQG+j9jnGUCEw3b/QGG3rrpvg7zSCZ+phe4KS1PRmuezJ+S2UsptyH8
	aK/s8mF5fKPg+EW6rOVN5es5a2CRodXIIohG9Z+tzYXINRyLbO8bBwRZmz63UpqFCssZed0bWLG
	5LS6Fd0bg9jUCn6fhglF6Bjo/jUWhVjA5Uo6qNcpPXFx4lHelkZHzxNlSyXvuWJUDNYDU7m5cY/
	C2ds8GE4k2dIzQ1Pu0DOoxKQ7XgKLfkUdXvBaL+dx11KO63u8lglRQJWQSKK0v/kUzNiV2hv+sG
	NCPu2FsDbVIZ8FYQyt4UnEijrOkW7BrOwPEqKSfyaQxkct+fmi5Lt8gG8ff2+WGz5SToIuzfrdW
	q3SerNMNB9lDRMXSXWSo5rl8xR/zaLebXDhRLe18ZBeaEHk0564mcdA==
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr551678c88.10.1790107046996;
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr551637c88.10.1790107046436;
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258204sm448771eec.11.2026.09.22.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:57:22 -0700
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
Subject: Re: [PATCH v19 06/20] KVM: arm64: Refactor the vcpu_load to allow
 for VM specific callbacks
Message-ID: <20260922125722.00006b2e@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-7-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-7-suzuki.poulose@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5MCBTYWx0ZWRfX0WkQCY+LaRV0
 oYJ2o18LlHaMPllpY+SARlk9+qYmwn+EZmAWDHv7NTX1nUgtn8WREV2yid9HivFosTenxLGR8n2
 /RPzMmUc/l836d71QlhOn/QVJfeGZQrGWXOamzYYCRON3oNLkoXzZwA+c/DZOABUuAOXonolEwX
 /+NcWz4qFLoZb1FBrnrCNF2jBEAXvZq0rzxqZUwMlOarcfx1tdT49OnC6CtUi0uXfgE0jhwnAFf
 jWj2nPG/imAgnB60iCOJ6msTczcCMWSNEVvR1R/8pe45O2q0UZyhbqy82C4qC0wCAXbDMvplpgX
 xOnflUXJgO+jgkUr3subQFDkSPHCrHe03tQoOBqdU+VYIsm0We4amp+dUOq7y4WN0kHlA3tRd55
 DYykAHTF8i74XPSFuZ+x11iLFMTQoNI8QS2Y52FefoCHDIPRNED8Ru1HtA5qftKj106aRLO5Dx5
 g0voRYNmKiw6pjV7r9Q==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2dda8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=X9DOVUd_aP98ggfEJksA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YMZoUjVQqawhL7NPydfNHVq4DggsEMAZ
X-Proofpoint-GUID: YMZoUjVQqawhL7NPydfNHVq4DggsEMAZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5MCBTYWx0ZWRfXxak6VKFZ91hU
 DpAEuz/w7Guz22GxL+WSYiFnmmXQWPEk/83awV+O8C4qrJwS/RYK+CgnMcztnAMLFkPxbTAtJ8s
 0jqpHtMMQdmqdQXaBfATwrELELj82w8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220290

On Sun, 20 Sep 2026 22:28:31 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> To keep the VCPU load/put handling cleaner with the different kinds of VM
> types, we are about to introduce VM specific callbacks to do just the right
> thing. In preparation for that, make some refactoring to add the change
> easier.
> 
> No functional changes intended. Based on a work by Marc Zyngier.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial stuff inline + maybe one blob that should be in previous patch?


> ---
>  arch/arm64/kvm/arm.c | 48 ++++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8c784b266a8e8..c74706ed9a531 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +
> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_vcpu_should_clear_twe(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWE;
> +
> +	if (kvm_vcpu_should_clear_twi(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWI;

You could use FIELD_MODIFY() for these but maybe not worth it.

> +}
> +
> +static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> +		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> +}
> 
> @@ -772,7 +782,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>  
>  		/* __pkvm_vcpu_put implies a sync of the state */
> -		if (!kvm_vm_is_protected(vcpu->kvm))
> +		if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>  			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);

Why in this patch?

>  	}
>  

