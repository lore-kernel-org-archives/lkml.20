Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18152530DE7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116727; cv=none; b=TUUOZzBMpyemg5jgIw3F/aMM0Ba58VjfmYdMaTSkn10ClvKuTXeFadTd+UOhWfXZ4MFzbMT2YR51UrDybas/N/5taOZBgPufNNjUJik4iMmc2/DbEvGDMPG5TI2ptSrehid7gyrtEm1dPkP7esPFBds//ZCpgWWpHX6EMKQb10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116727; c=relaxed/simple;
	bh=3/dkNKPPZhwKNFM+qynUyX6vwgw0I5X2dRSwnLFGk2s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jA8ihaivDG+wxwMhANCg6Vj2gPgiMKVd1R2ZqobLmgD+/ZLvFWlJj5mF4ec8A1g5RgZCV7nCsq9XmVWltSiIAzxdI2hGcnEdA6UWc3MRbyV0qWJtJdFPFEgTYOH/Kj5lvVHe4X/f6UOtWOpSaAJUPB6Yenm8Jxo06FnwQJ8czEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2rd/8n+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOv3Q6kA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2rd/8n+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOv3Q6kA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJCtYc1166677
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=; b=l2rd/8n+B47hSsLp
	dm9rKeJBloJJpWBYD9tTfVg5N4yZY3zxA2FdiNYnkn2Pdi87lB1r2vkiI6CIntcY
	biQPC3m8sZaHuOy7q40XCHL9Eu3dJhllRZVG1gkzMxduv4bmkRXqNqxjwd7NKhys
	3Rpp23gtahCeBn43yLdo/u9zoSqDZqDiOS5Ik187wrsvc9W47NQCEh0qUiMsp55k
	3Yx+arcyLIFHBbKIOoTtiZNno87NlNTaIbJU/9rLur+mUeXT+yxNW+sZA2VdfgCH
	aXxsrFn+XMTr0DD5H6dnQsmljDDhoIQnpYM1cJfupuhReouDDrKxqnQc7Xcl3ppU
	nmvQog==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0x6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:38:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-334f782d1abso676251eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116711; x=1790721511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=;
        b=FOv3Q6kAG8ZHpzbv9WSJZxd7e4ptg4ZyR3qXBnZIqoPoF1Ds1hhzLl3BK7byKRyC0l
         nq3+/aVo2THzHyldLKu8D1AR1YmatFQ/jbplBFCcQhij5QSHZID6hUTvsOa2vxfkHpyz
         N9lY5Zzk5l29J6ZNGiSTwMufZYOKRvNM7dZoI5cZkjrvtE9ozeO1hk5mikBYmqlAJSgt
         o6FHijaAH0NjVr+SBOEwdRuN9BQVe3xiWmk93mcpimikCCVsdN+Qpx95vXResfl2iU/l
         JfSEIgJJ0SNUWoxjhYT6jVld3+Ibp0P017dk+yTw4YSbioIgB4OCjcZU+uECOu3344Mp
         yStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116711; x=1790721511;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=;
        b=MYljCVukucBWY8mISAUcYq0BVD0o3qg2ER33e+fRoEULJzq9UVpBi7Q1dEh905PLH8
         9PAc3U49kVt9nipaXKXoo/tCgkhM4gNXaiephYrW+zhkALHDTu9ufOE9c8h5dQaml0Dd
         GltrpBGosffT6RE14XgoIxmy3UasYzNadjeeV7n6IH7+ZpCkbpbTRp/qmeaZ/4TX1eRW
         D0XEpn/myFZQ/fGGE9f9QSgjVCtdaw+Qskj10Za8sOg3e9QEERlzAxwEtCjOjFcK7rpq
         hN2dn4nbZZZ/CY6Fbg9ty8OvYogd668JEuqEgm8UaiAquOl66wmsTlvN/Xv8kRxTU7OX
         N78g==
X-Forwarded-Encrypted: i=1; AKwUvBwYx2Bh6KPU6bwg3OqA8Dj7BMlRoqmepbVntUhbVOlMorytd0dILWEA2xvw0f8xhnGSfkj6HlXB+O+jy6I=@vger.kernel.org
X-Gm-Message-State: AFuF++nZip+AYrMWii6qpd3m2f8MQe/CXqbR36McSUhEfOlGX4WeayU4
	/ON5d3OMLFDZitiYdiEYakSualtypYy8vGEdZzlzLviwYiu3J6aaIJmcTJ/1n2ZLYO8hT3GWqQl
	loKCnlOO4Rueph0zRrCHSP6u+0wcIYGFkTSXx//bHv3+rEPQB/K0XZ9Ezmvk16ubwRUc=
X-Gm-Gg: AYBFou00HRk9SlzHCddTI0J72To1j8IRiX9zc27BxHa4tN5mEj9ZviB/lMEbh9sALfZ
	c7ze5TlkxdNTA06Vfk8HUtm36FMO0jTU5euwhgAqKG/ZGHksj6w81bKKEbZdZZurkGeAgqDb9Vu
	arEI+BbUTZE8pB0IYzNUoyDVT1Wgf4F7J5C4CZpJ4skXk+gw5alAv+l9xZOB/UmlfzAxE1uURzo
	EV0Ilr+VAhTNWr8M7VXmpvP5MQ7ghTQ4Acotbnmqxlo/eVkKa4IDBXqPXP9H9KQ1j6gAnWvbUWB
	ksSkt5679oKf7bQazGa6/xuDcOFJuf/xioJXJcPnwNbPv787k3ep6DC2ASAENsSFZaAEpj1afIK
	9FHlsfev9yXiYq8mEONXRProrUvFs/jQluZoAk+7xjTZigRBfnRI/cA==
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr710470eec.28.1790116711128;
        Tue, 22 Sep 2026 15:38:31 -0700 (PDT)
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr710439eec.28.1790116710604;
        Tue, 22 Sep 2026 15:38:30 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm1162630eec.25.2026.09.22.15.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:38:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:38:26 -0700
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
Subject: Re: [PATCH v19 10/20] KVM: arm64: Abstract out memory abort
 handling
Message-ID: <20260922153826.000044fb@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-11-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-11-suzuki.poulose@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX+SpDliEMNOUa
 eLgxeE7Hr2Re/9i6vvipXlCj5yvZDL+g109SCl6YqzNpgZNXp8EJ1QjJWoPL0CAsQw+DH8b5ShV
 lzGLVaXARO2+csEbqL2GRkn5fcc2tcCu1Zw0d8VQv0QLpIbivkhvje8zG8yttZMI0Ii/o3kxbSc
 ZW/rClEVtLuuR3lO0Xf4EaiImZpa3uHIM7m6RF9mMua8u9sEJoqQ6lWuKN2NFulB98Gku0cd1rh
 ZGdx2paoRCh/tTOo8v9UH2r5Q7vdeCV5Tj6+DvOF8jep88rD1l6hzejeiwwFI0XCw4B/1/59NSw
 vAOvufxQNVBZ27hkBeJ9qmcaM4zTGbPWf5FVzXBqs/pUAY0jSfqUmg/6uvQo9k1thD6PmkZB5Rj
 9nKcvMUSrz5CkVNiidRu5yI8K8e0Vt1me2T13mMq8I0X1IlXtaIcjIrIl16GAskUtNZNvRCD9/i
 Y5sF1aR6jXQUgHvcwoQ==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab30367 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=rbqOqaJmvRITx-_xyQwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 8Wd9CfK7DKhsZ6RDZbxgr0pyQpfcdYRm
X-Proofpoint-ORIG-GUID: 8Wd9CfK7DKhsZ6RDZbxgr0pyQpfcdYRm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXwJ1DheWhp+ig
 RBE727M45ky6oJr95DAs82OXbkbll2KMzuoOzqLlBYoHqCzwe98OUXaD0J+kgavPiwUwOCLbWbz
 xtiDtQstaaTAvFFtlUqcf919ejhuQEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:35 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Move the memory abort handling under VM specific s2 operation.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial comment + request to follow through on adding the local
variable for kvm. I think the other places that can be used
survive the other changes in this patch set.

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d97a4a1bca23f..cf293d09e940a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c


> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	int ret;
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +
> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +			!kvm_is_write_fault(vcpu) &&
> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
> +
> +	if (kvm_slot_has_gmem(s2fd->memslot))
> +		ret = gmem_abort(s2fd);
> +	else
> +		ret = user_mem_abort(s2fd);
> +	return ret;

Personal preference but I'd just do
		return gmem_abort(s2fd);
	else
		return user_mem_abort(s2fd);

and save a couple of lines. I'd keep the else to make it clear it is
an either / or choice rather than an if something true one.

> +}
> +
>  /* Resolve the access fault by making the page young again. */
>  static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>  {
> @@ -2287,6 +2303,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_s2_trans nested_trans, *nested = NULL;
> +	struct kvm *kvm = vcpu->kvm;

If introducing this, also use it for the other places vcpu->kvm is used
in this function.  Separate patch though to keep down noise.
Looks like that's mostly to shorten the chain of dereferences in the
locks.


>  	unsigned long esr;
>  	phys_addr_t fault_ipa; /* The address we faulted on */
>  	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
> @@ -2448,19 +2465,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		.hva		= hva,
>  	};
>  
> -	if (kvm_vm_is_protected(vcpu->kvm)) {
> -		ret = pkvm_mem_abort(&s2fd);
> -	} else {
> -		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -				!write_fault &&
> -				!kvm_vcpu_trap_is_exec_fault(vcpu));
> -
> -		if (kvm_slot_has_gmem(memslot))
> -			ret = gmem_abort(&s2fd);
> -		else
> -			ret = user_mem_abort(&s2fd);
> -	}
> -
> +	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
>  	if (ret == 0)
>  		ret = 1;
>  out:


