Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41CB3590AE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324071; cv=none; b=uj4sHvf679xUk8zpu4aJE8CUMVgBU3Q0X2MtTKabtLAkgA5lCwL0KXx0x5elFZd751TGEaYZOML9V5Oo3r2ce0pPX6uBN7AG+vZn90vJWFj9gza8eFpo7PRluFhzlUxzxmaEBH3cdgz/AwonAAf5OV55gv9VWL7RMD/NtvdM7rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324071; c=relaxed/simple;
	bh=naWDN0pyZLWNc93EvdZ1r5h5QJkl363qtBoJNanvnAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvo6xiJab0vszZ5vQbo6Z/BjWp6LRRCYssjQgZzvHTUoaHsqpqtqMGlj1otuL5TiQUu/ljmUPv41FHFP2pbDIsuHXgAmSUpAmtfZHzlaJ050iTxpJRd2Uu6elPgxLhgnSfC+tEKn1wajy17SCxXvHsULo5BepBLMQj6JdQDO3jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0lU3OQB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NzLyu2yK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0lU3OQB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzLyu2yK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791324068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BX1nDoHfY9wIaK7n+kTY5G9GqR52mFVKGv7vDMVDhYE=;
	b=X0lU3OQBohx+0Z3dE0ZwlXL7oCCQq03cSQz7fgrNca0NIQLnj7BsBLDGZ2FNM+5GRXq240
	YYU/DdZmkXPLwb8CGdfQWZ+Lsjjf5X9fwK3Q5l3VTkM8r7x6BzkR3LYGYwc2K+18ptCpj6
	Bzt37KvggLGkddwafzrjM5mntUdlz7Y=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-U-sQWqemN2K45M6G4i6Ufw-1; Tue, 06 Oct 2026 18:01:07 -0400
X-MC-Unique: U-sQWqemN2K45M6G4i6Ufw-1
X-Mimecast-MFC-AGG-ID: U-sQWqemN2K45M6G4i6Ufw_1791324066
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso6962219c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791324066; x=1791928866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BX1nDoHfY9wIaK7n+kTY5G9GqR52mFVKGv7vDMVDhYE=;
        b=NzLyu2yKkvkFgTuA3LOlYdf+mqbciV/jG+j90yETeZbMR4WdzF1/KMOVopPa29CESG
         g/L88WEpoAxNiC3F8q4LrkPm3eqXOZ6XPv458LfhFC5MQhfR1d8EWETzbQqwUeg5Lwqh
         FgZ37U5EBzwciDHJ9UeBw8S62qJlhIbJTHh/VG/Mx2bsqHdoAhq6jMkfVDAOS3lg/Xxt
         Y0EXnbS52WpLAqfZZ5wXr2an9XR9YnQ8odRPo/iLFlZzHLlL/ZIUdmiw12MRnhJv+4hg
         YltvH9WXqjI4x7dldenDDXbOlrY68zSoHmwc/7ZxWBwg4pnBpX4ZAztDomaw9zdZbvlC
         Ok3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324066; x=1791928866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX1nDoHfY9wIaK7n+kTY5G9GqR52mFVKGv7vDMVDhYE=;
        b=ZNWjVM/QI5J6v/WU5Is85zLPrUSBhacdYWIBC5oJbq5sdXYJwSB7+/OrPRyCCnZe8G
         SKRqjRX9HNuW0Zr/sknCLdxSEnM6q7Mx9PGjmfYFvEnNhiDBGzum+M5xqR46uaFUJYpb
         G8cGGdrW6euIpmdqhJjneGb38c11fE1N2G8YRwxlMWpjs2R8Zdgce1rVWi/f9CEltSsd
         ltgSeFDoF9N5/jP4o80GQv9sbMPx1M4RkNGpLR+05yQrMyfSBF3H0OC9K1VsS+vaJugv
         xPF7HRm79im2ZYN/rVlGDrEYUq33SjQEkA/wCQNRFVZdrSwTlb2mEMdn7HNpe2+0s6m/
         3A3g==
X-Forwarded-Encrypted: i=1; AKwUvByKxEcm5/mDCSv18+ghfoZjErXpGVLV67QQipwhCNB5LpdG6N3qxIT4xCXq32I4ZkRi3yuNaUlVKhyYWj0=@vger.kernel.org
X-Gm-Message-State: AFuF++nlehfYuKqgZObJw8+DUx8E6HoX1z7STgpCeI8xhYVj1Fz8JXeg
	8/CjZXrERTm1j3OoXr7xMZRF/qT+/p8ZeOxDRHYkuhjclkDQV9sddpU4by6oOJXa9kgL9YCNKO/
	F/4TK3XeWJyIEJvQ7//srlqXvLZktkZKc3H0Ocr+ciwOjbofmmR1s0m1FZALdmqM4hQ==
X-Gm-Gg: AYBFou3YpxfTTCDe/ZXwgene0UULqIBTrguxYesi87E1bCVRrwHBZ7EothPQ3fF34Xd
	vlUqM30rf0RzRePAA0svL5bQHIPu1iLpBDAoS4keX5Zowww+qfc4PUGArFKfICPcWXaFYvsSlSm
	diJfaNWHe98YUdYsKAUlxgsfbfuOT4MvTo2e2itUe8udP/Yg4pdzHOn5d3aUEniPeXbhz9hzYqu
	Sep5VEiuZQtlrPDcOYnLv9ebVGM0DQUAvxn55DlxfJ+vy74IaEvPJgtaGUrYEwlr0/ur1ycQNtn
	cwh36hZw/Ccj9cwsxHpJQUZ+PZgqzssIVV7E/UPGcLtc/wRyXJdweiSKINVdMndxg7oGzaQ/qUS
	MisY6KDGbLKHeV3h5KaaSOLUuFJKc8k7BjL94CoZ/7A==
X-Received: by 2002:a05:701b:2618:b0:145:7a:7765 with SMTP id a92af1059eb24-162092950d9mr130461c88.36.1791324064765;
        Tue, 06 Oct 2026 15:01:04 -0700 (PDT)
X-Received: by 2002:a05:701b:2618:b0:145:7a:7765 with SMTP id a92af1059eb24-162092950d9mr130376c88.36.1791324062351;
        Tue, 06 Oct 2026 15:01:02 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167463910sm1401330c88.9.2026.10.06.15.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 15:01:01 -0700 (PDT)
Message-ID: <e854517f-b364-4c64-b542-7546afadbda3@redhat.com>
Date: Wed, 7 Oct 2026 08:00:45 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
 <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
 <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
 <6bd785aa-4693-407d-b70a-39b1d0eda63e@redhat.com>
 <71ceb680-e168-450e-99e0-7a8cf4160bba@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <71ceb680-e168-450e-99e0-7a8cf4160bba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/26 10:36 PM, Suzuki K Poulose wrote:
> On 06/10/2026 07:16, Gavin Shan wrote:
>> On 10/6/26 4:01 PM, Suzuki K Poulose wrote:
>>> On 06/10/2026 06:47, Gavin Shan wrote:
>>>> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>>>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>>
>>>>> The RMM restricts the access to the register states that the host can
>>>>> read/modify for a given Realm.
>>>>>
>>>>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>>>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>>>>        requests.
>>>>>        MMIO emulation in the unprotected space.
>>>>>
>>>>> Additionally we use the sysreg configuration to advertise/configure the
>>>>> following Realm parameters, which are required before the Realm Descriptor
>>>>> is created:
>>>>>   - SVE Vector Length
>>>>>   - Number of HW Breakpoints/Watchpoints
>>>>>   - PMU Counters.
>>>>>
>>>>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
>>>>> the configuration of Realm creation parameters. We don't support PMUs for
>>>>> the Realm VMs yet, so PMCR is not exposed.
>>>>>
>>>>> The RMM makes similar restrictions for reading of the guest's registers
>>>>> (this is *confidential* compute after all), however we don't impose the
>>>>> restriction here. This allows the VMM to read (stale) values from the
>>>>> registers which might be useful to read back the initial values even if
>>>>> the RMM doesn't provide the latest version. For migration of a realm VM,
>>>>> a new interface will be needed so that the VMM can receive an
>>>>> (encrypted) blob of the VM's state.
>>>>>
>>>>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
>>>
>>>>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>>>>>   {
>>>>>       int size;
>>>>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
>>>>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>>>>           int size = core_reg_size_from_offset(vcpu, i);
>>>>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>>>>> +            continue;
>>>>> +
>>>>>           if (size < 0)
>>>>>               continue;
>>>>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>>>>>       if (!vcpu_has_sve(vcpu))
>>>>>           return 0;
>>>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>>>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>>> +
> 
> This could be vcpu_is_rec().

vcpu_is_rec() is preferred here.

>>>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>>>
>>>>
>>>> Aren't above two checks conflicting to each other?
>>>
>>> Do they? We allow SVE_VLS only for the Realms and we allow that
>>> before the vCPUs are finalized. For normal VMs, depending on
>>> whether the vcpus are finalized, we either send 1 or the full list.
>>>
>>
>> num_sve_regs() can be called for 3 cases: (a) non-finalized RECs; (b) finalized
>> RECs; (c) Other finalized vCPUs, correct? "if (kvm_vm_is_realm(vcpu-  >kvm))", which
>> would be "if (vcpu_is_rec(vcpu))", covers (a) and (b). We needn't the excessive
>> check "if (!kvm_arm_vcpu_sve_finalized(vcpu))". So the check would be something
>> as below after this series is applied:
>>
>>      /*
>>       * KVM_REG_ARM64_SVE_VLS is visible on realm vCPU no matter if it
>>       * has been finalized.
>>       */
>>      if (vcpu_is_rec(vcpu))
>>          return 1;
>>
>> This check "if (vcpu_is_rec(vcpu))" belongs to PATCH[22]. Hope I make myself
>> clear this time :)
> 
> Sure, these two patches are closely related and may be even could be
> folded in. I split it out to make it easier to review.
> 
> 22: Allow exposing SVE_VLS for unfinalized VCPU RECs
> 23: Control register accesses includingthe SVE_VLS, but prevent
> everything else
> 
> Does it help ?
> 

I would suggest to fold PATCH[22] into PATCH[23].

Thanks,
Gavin

> Cheers
> Suzuki
> 
> 
>>
>>>>
>>>>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>>>>>           return -EFAULT;
>>>>>       ++num_regs;
>>>>> +    /* For Realms only support SVE_VLS */
>>>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>>>> +        return num_regs;
>>>>> +
>>>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>>>           return num_regs;
>>>>
>>>> Same question here.
>>>
>>> As above.
>>>
>>> Suzuki
>>
>> Thanks,
>> Gavin
>>
> 

