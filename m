Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03BE1F192E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256073; cv=none; b=LQGc3aVFR8mXV+THGoRa56X68+dr+w7QSV7FN0O10NtORgn7JIKC0qlvdGeaPWlS20Mqm1sL/kNfmWYtxCLkxp6tdldDoAmwcIWcP20KMZZHsCG4A+icmzIgehDypCJsd98cdl8aNKP2Z1AHWYNuoky8UjCy9QqqaSfwdrhIidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256073; c=relaxed/simple;
	bh=gzkLCBUFd4kbcPEHkSHri54LfRKFf1qQMHTvyuqX+WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASAXw97bv9L4xmJRiDiTMWIJjKigo1RhEyiLX/7XjmolBWctX7m/tQEujtHiwfknmkd4sQwU/S9qlWrBcs2MOUzACZBmdae6wnsdLwLcdL0xwjTZVtfphshJaZ6+MEd+TTpv2Yq0vTqg8RZraGHku44LS69i7dq9jg39cRVYe08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N0ipT6mk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=re0PQvV6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0ipT6mk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="re0PQvV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
	b=N0ipT6mkeXBym7F+9+LDotE84QSlJvaz7/BmEdbrkn4Sv/n861xpct4rseeMMfk9JVY3XN
	zwVlqcD9PpMxX8Dk4+nmNs2q99JcQeHNHe8lDTYSRFUlIbSTgZ0gwV7ZeF5ThM/xUk1JX2
	0w6VOEWKfoLx1CE5Ok3Mqb49Lw1FSFs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-JYKnTDfMN-qeaSlur0Vrdg-1; Mon, 05 Oct 2026 23:07:49 -0400
X-MC-Unique: JYKnTDfMN-qeaSlur0Vrdg-1
X-Mimecast-MFC-AGG-ID: JYKnTDfMN-qeaSlur0Vrdg_1791256069
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ccacc75a997so1090005a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791256068; x=1791860868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
        b=re0PQvV67qYctLgx9GhK+QxB13q1y8jYF9x1+v0pTCeAsOd4PGxB4GG9IOWrXG7fhJ
         W/uJiqsHrumIwO/3lBIS+JREURKAm7nt8bnfHQHQpP0qqm0emYWnjVnQv1BLFnLBv2lR
         7OgXtCf9cmGVNYliEWvqBOmYmWyrIM/uOlrB8bCQjFrMIzFKZOUe+iyxCNH0NYZ/pUGA
         0q7V7i0LG467g94HKTVpo6VRV6wb3FXsQ6z8ue9KWqnaZGSWbkGrY875qu/mgAXOmHyG
         +kuGQktq94ktptl2uSP+ThAQNHRgUhhggHDlBKU3DlJ4tIejm7Ohie+jXoxJWlCI9x+q
         ueJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256068; x=1791860868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
        b=SjK6K6/Jd1gzGzzF9sJf3i6/2Q3wCB0BZ0/pGtHJrJbfXMzcQu4HBS5czO/Nb6Y4iK
         ndVuu/in8m2moLYeQrXD/KRzG6yhMF4nu0nl7ZTeMm+hn6nf1daZcIwNa7vhb5tzKEfK
         f+9b42PZ0MwLs8e0S7QqoYiVrrZPcR9IhgMc/IbA3xqZ56nJNYGC8wxx5yspR7PBJ6HU
         +iQMWg4rZ9tHuKSjLDkBG45UarqlOQJ2+Y7iDpDGsjyQtd/RJYMYbUn/WeBPLxM9YhCB
         L8ZlBp8uDVIDZtz91OotplptlhInUIB3UcnUHeUu/ZzQ9kTpIRBjuw6u9uJj+V74IENo
         zgsg==
X-Forwarded-Encrypted: i=1; AKwUvBwzsjdSr6VeGo7djiTc+t54YkfdVm0JuR7eUlth9hKWSQOfpAVVhF0DolX3NE3ktuF3V5DMHp9jv8zcQJg=@vger.kernel.org
X-Gm-Message-State: AFuF++lt6GJqzAmWEzPRT7MuPi+I0TWU9vXo26LUoW0Eus7wp16qSu2b
	k+laSPGxso1jzKp3a62y1+kG87+QxjzyMzz6dE2Zjq99xf7HXdj6sBAg7GDD4kd14jC76SSz5oZ
	vr0iJcahQr4V9Fr3iB5WdCyWahcA6xplv2L2LJp5DsLmu7ZpvTwIyOKu9ra6RfRVKyw==
X-Gm-Gg: AYBFou0zWDewsAMw+0d78ATtJywNi7NiDL8ZglcJXhoplLnzCqtWN2/cUBDcC/TwfBi
	Oi3Fj7f5PzXmq2lFc5c00+6Xyu4YCYHg9dncuhY1pwohxKcrTJ9lC0DrlbzT3/XAarLgBa1h2oZ
	vErNMDyUliXNUtEqOV+8wJ78FBUf5cvqHfvvftr/a8+6rLBv+u48NzMP9noYPZ2gyb/Ja8HC+Zd
	3vTknniNPOPuYPt4r+lAgN5CtIKwILKAtuDg00sDwcRr70NkvXnbVkA6REzuoGrW0LkewcoFx2E
	bkjLVSR+V5sSd8Tw1/+o8aU0G/2FB+wz/hHvxyFDq01Q1XvlqjCejKPM3bw+HWHk4ZA/atPuLkL
	TP8OqJF3fNmokaAy3emegGUzej0lwuJ+G8xn027Lczw==
X-Received: by 2002:a05:6a21:1392:b0:3e0:c57c:200b with SMTP id adf61e73a8af0-3e0d6cda067mr8229889637.40.1791256068597;
        Mon, 05 Oct 2026 20:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:1392:b0:3e0:c57c:200b with SMTP id adf61e73a8af0-3e0d6cda067mr8229853637.40.1791256068087;
        Mon, 05 Oct 2026 20:07:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6b542fc9sm1722095a12.1.2026.10.05.20.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:07:46 -0700 (PDT)
Message-ID: <d8bdfcaf-3b4f-4ab1-9b73-597c60bbb60b@redhat.com>
Date: Tue, 6 Oct 2026 13:07:37 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 13/23] KVM: arm64: Abstract out memory abort handling
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-14-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-14-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Move the memory abort handling under VM specific s2 operation.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Rename protected_vm_mem_abort => protected_pkvm_mem_abort for consistency
>     with the other callbacks.
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 ++
>   arch/arm64/kvm/mmu.c              | 33 ++++++++++++++++++-------------
>   2 files changed, 21 insertions(+), 14 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 0778c308ce597..7cb343583953d 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -156,6 +156,7 @@ struct kvm_vcpu_ops {
>   };
>   
>   struct kvm_gfn_range;
> +struct kvm_s2_fault_desc;
>   
>   struct kvm_vm_s2_ops {
>   	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> @@ -166,6 +167,7 @@ struct kvm_vm_s2_ops {
>   	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
>   				      phys_addr_t start, u64 size,
>   				      bool may_block);
> +	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
>   };
>   
>   struct kvm_s2_mmu {
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9cc7fcde4dd0a..ccbe2ffeda40b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1740,7 +1740,7 @@ struct kvm_s2_fault_vma_info {
>   	bool		map_non_cacheable;
>   };
>   
> -static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>   {
>   	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
>   	struct kvm_vcpu *vcpu = s2fd->vcpu;
> @@ -2178,6 +2178,20 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>   	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
>   }
>   
> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +
> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +			!kvm_is_write_fault(vcpu) &&
> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
> +
> +	if (kvm_slot_has_gmem(s2fd->memslot))
> +		return gmem_abort(s2fd);
> +	else
> +		return user_mem_abort(s2fd);
> +}

The "if...else" block is moved from kvm_handle_guest_abort(), but it might be
clearer if we have:

	if (kvm_slot_has_gmem(s2fd->memslot))
		return gmem_abort(s2fd);

	return user_mem_abort(s2fd);

> +
>   /* Resolve the access fault by making the page young again. */
>   static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>   {
> @@ -2447,19 +2461,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   		.hva		= hva,
>   	};
>   
> -	if (kvm_vm_is_protected(kvm)) {
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
>   	if (ret == 0)
>   		ret = 1;
>   out:
> @@ -2873,6 +2875,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= no_age_gfn,
>   	.vm_test_age_gfn		= no_age_gfn,
>   	.vm_stage2_unmap_range		= no_stage2_unmap_range,
> +	.vm_mem_abort			= protected_pkvm_mem_abort,
>   };
>   
>   static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
> @@ -2881,6 +2884,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= pkvm_age_gfn,
>   	.vm_test_age_gfn		= pkvm_test_age_gfn,
>   	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
> +	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
>   static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
> @@ -2889,6 +2893,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
>   	.vm_age_gfn			= kvm_vm_age_gfn,
>   	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
>   	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> +	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
>   #define KVM_VM_S2_OPS(flavor, ops)		\

Thanks,
Gavin

