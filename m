Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444C3E49EB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033241; cv=none; b=I3mizeDgal1nqeozlz8m+BCrqI8s8m/V8LUR2oQbOvAhDTb4XfmPfr9n1vHqRCa21VmkhICvuo2PGoNcriazXrnwu19quYxWxBJZVstc/xowLBEMvZB8B3efiT1ClgNt8b7yQV4DX8PVNciziJuWmaFSYH8BIAOBTl1N0UWQ52A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033241; c=relaxed/simple;
	bh=2U05edltdc65w78+ZV5IWr4TVwXUEOtUfX+tKTehz0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ph1QO6ABADFhPDaW9RDV5ezq6kT7UdNZdXJOHABFHVqC8VvKaDn6sc1Usyr8mnjU9dqTFseB7CQWk6g+kGwKn6XRlm/J+1JbZDJnKvcOvw60d3i9lswieciumpi0CJ10O6Xqsx0eYXJWwTftbUcxcxPQd4sZ1F9eMVfJTB0aP2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKZ5cacA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0uJv6DC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKZ5cacA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0uJv6DC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789033232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
	b=NKZ5cacAcuN7mbpNR4iCohIwEwYtwjhyns25Kft60c9AryPxgSIDVnK8pc1JboskiqBWA7
	qktrlSsfDTePoUwiq9eHeUwwDcgUV56eHKcZzUCG7GV6H6nIqpKepM4OVpe5FG4NMbe5GS
	VpgXBPPA0e55OVHxkA0M6TJYslBrXs0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-m3l02zWHNk6KpAkw0B45yw-1; Thu, 10 Sep 2026 05:40:29 -0400
X-MC-Unique: m3l02zWHNk6KpAkw0B45yw-1
X-Mimecast-MFC-AGG-ID: m3l02zWHNk6KpAkw0B45yw_1789033228
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso831504a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789033228; x=1789638028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
        b=c0uJv6DClKjJoMAyAxZHU7xVKL8bv6skzLXafrrrdmpEyq3FG+LauladmMQDN3gCgs
         QFNJ5gRdTUdw+yDcs6CCLpN/dPPMDjHfyAmO+N+taJT/qUW6R+ybwwGp3bWjteKNmYam
         mRBUyp+kV1G9PL0N8AUHCmiZDnzun/Nc/PcmX6+v4B/GGKEpzXMllad2abKX0SnSod7y
         KtoB6Lw2tujPfxQCnf9A5/Wf1XQJI0s+hBBOVrrTbnMfhKVOweOicKztoyKHNeQ4FldQ
         mIWaJ8ak+mLcaEjUBwfWH6ddKSo4a5TwfqZxUXh3EOOrqGlkIo+RavA+wqQN86wWSdA0
         VxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033228; x=1789638028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
        b=dpxxZNlOeNyTYj1KQL+DHqhM8TgqOOuBch3LIg/jrV5NkrjpfWrNivNNcRBKMRMSgf
         dlp7wx6Sj9YnRbHHwpWwsXcg/1GZ5lPPrG1XT13LNt4u4sgifIMyE4qRn6ZWMw6dnruC
         9b1LSpCClGBEqWSuPAs7Q6P2T7ztk0Q/IqeKDb951CiAQ6boksLA/SyY8Ar0lpsodLUy
         FTMbo0CVPtRs8npUDwhmvDCX4u7jN1ybUsazJ2GLuqOI6Lu8n+VYJM9+N3P81N99aLw6
         L52oW1nnEixbXL6+nxxcDc0KEz7PwCB6w3F8DRoyFm+XplOxXiqExM8LXcXKNjL2IRuj
         j5gg==
X-Forwarded-Encrypted: i=1; AKwUvBwyGRW1ubZ8pFosciGWpXOb8b6jK6LQ1ZXILevrwJoE7fs/Ea7vALxXjk8tNhbkhZP7b7ZWaYrR6JHreeM=@vger.kernel.org
X-Gm-Message-State: AFuF++lk4J7CagJxnS0Sjh/i7tsqlQ45gDqZIB2NFuc9VExR86yV163Z
	EzjtLyQARJZBVd3E0pQXaMwhG8jhdteKzlU8JRGuj9+3qO9pm80LL5uP/sH2vlzLH2NexV4sBXo
	WyWfKSUtjfwbTvj9VfTMQ59wkEnAtTPfCPPU5omLWf4mfkwwZ808LUPtXhkDFIWyjkQ==
X-Gm-Gg: AYBFou0UdQ89WGqJcBA0c8VxP3zYQHBw6QTNwFqW5W7vveyQPWvMl7K9rO9sJAPYJwS
	ST3y9+s0+idT0/YEX3ydkCXMgRIFoAY0MskLDkpnc3C4ZATLygpe05x5NlkU1keJ7HaApZa5o0E
	+tzzfLpwyjFN5aoaqWwD6KxYpm98gE7KEp6JsC3qme9uPxl5NcI4gn2TebEKEovUzgNzudnusmk
	CZLXKbXIc74TZ6rYvPK7dX8dxcSUE+irEQKHA3+YMl1y//jDzahb5G3vYQ8n7COL7CRiiJBDLaG
	ytmWyClBn6yv0rAJUtok5+c+tWhRaS4osF0kpy2D+N4WOGEZH1jgljI94xoGq6JE8hYk5sX1iay
	TCdT+Ns1atZ4Gpgxu85av0zBPumG0iTHAwMduvxoz9w==
X-Received: by 2002:a17:90b:4490:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39d77a08755mr3066638a91.5.1789033228075;
        Thu, 10 Sep 2026 02:40:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4490:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39d77a08755mr3066617a91.5.1789033227578;
        Thu, 10 Sep 2026 02:40:27 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d80f0068esm3343502a91.10.2026.09.10.02.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:40:26 -0700 (PDT)
Message-ID: <472daa5d-19e5-41f1-9650-44e0245bc1f0@redhat.com>
Date: Thu, 10 Sep 2026 19:40:13 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
 <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
 <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/26 6:43 PM, Suzuki K Poulose wrote:
> On 10/09/2026 06:53, Gavin Shan wrote:
>> Hi Suzuki,
>>
>> On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
>>> Add an explicit mode to support Arm CCA guests.
>>>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>>>   arch/arm64/include/asm/kvm_host.h               | 1 +
>>>   arch/arm64/kvm/arm.c                            | 5 +++++
>>>   3 files changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/ Documentation/admin-guide/kernel-parameters.txt
>>> index 68647ff4bdd24..1afe3df3b923e 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -3256,6 +3256,9 @@ Kernel parameters
>>>               nested: VHE-based mode with support for nested
>>>                   virtualization. Requires at least ARMv8.4
>>>                   hardware (with FEAT_NV2).
>>> +            rmm: Support for running confidential guests in Realm
>>> +                 world using RMM, as defined by Arm Confidential
>>> +                 Compute Architecture (CCA)
>>>
>>
>> I'm not sure, but 'realm' would be more appropriate name. rmm (Real Management Monitor) is
>> the term limited to the firmware to me. Besides, we have been using 'realm' broadly in this
>> series like kvm_vm_is_realm(), kvm_realm_state() and so on.
> 
> May be. But we use the "mode" of the hypervisor in question here, mostly. e.g., nvhe, vhe, protected etc. So, I went with RMM (in favor
> of CCA). Does that make sense ? Also, we rely on firmware/arm_rmm for
> the support. So, it kind of make sense to keep it "rmm" ?
> 

Ok, lets keep 'rmm' unless somebody else has better suggestion.

> Cheers
> Suzuki
> 

Thanks,
Gavin

