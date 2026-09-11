Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA90257844
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138553; cv=none; b=YJtz0K6Gm6LcJusa/koo5dAj5+9g1zN0NlQMaiGFLxJKikCvzxswbeAFL5VOUM1ZUBGc0adXk5DWZd0eQ5FbX9wcmHmlkCdcmLG/rrn4YxpX1IcBsHhbs+W3ExUyeHU1A964awlovhFOoj/hTBG4P1Lugg3KOMdvuIsIdmF7970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138553; c=relaxed/simple;
	bh=zPZGk1vxERfRcanAsZShseukdti04juJdVA94TVfAWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWkeEi8tB4EccccKkwpFHixUyLZ0R6Kl4TSg18QfFffK9rkQU6P447Pe5hrK0DPcmrwoc3/cIEo+SsjAUmJPZNfFjlk8Uu4esuub61xLAYid+LE5KNi7xd9zAkwx4PxMOT5Y3GRx3QXq3FDN/q9UtPPWUUCgGjLLcJ2kjozUM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fvHYyr/K; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fvHYyr/K"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616D216A3;
	Fri, 11 Sep 2026 07:55:46 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8653F7B4;
	Fri, 11 Sep 2026 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789138550; bh=zPZGk1vxERfRcanAsZShseukdti04juJdVA94TVfAWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fvHYyr/KUqnR0dTJ/eQnFEAFSi4QhvOoYyjPmKA21Vo0XlGXBR+ynNbQN8nsKJEky
	 5x41N4+6/ZAQS2iuSTVEdghlKTv+fzK1D7gWov9U8WCZ8Vzw3ahvwYWOyczOCTxHyv
	 CNxfUXXTjBI2UKTYIjF+j6ThNBOiNquQsehRJPvM=
Message-ID: <d8ab9189-7804-4e4a-a270-b4e3d61c4271@arm.com>
Date: Fri, 11 Sep 2026 15:55:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
 <178855077571.693280.17942746234757215326.b4-review@b4>
 <yq5atsnyeuz5.fsf@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5atsnyeuz5.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2026 08:37, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
>>> [ ... 42 lines skipped ... ]
>>> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>>   		.requires_smc   = false,
>>>   		.device_name    = "arm-smccc-trng",
>>>   	},
>>> +	{
>>> +		.func_id        = SMC_RSI_ABI_VERSION,
>>> +		.requires_smc   = true,
>>> +		.device_name    = "arm-rsi",
>>> +	},
>>>   };
>>>   
>>>   static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>>
>>     [Severity: High]
>>     When this new entry is probed by smccc_probe_smccc_device(), does
>>     arm_smccc_1_1_invoke() pass uninitialized registers to the firmware?
>>
>>     Looking at smccc_probe_smccc_device() during system initialization:
>>
>>     drivers/firmware/smccc/smccc.c:smccc_probe_smccc_device() {
>>         ...
>> 	   arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>>         ...
>>     }
>>
>>     Since arm_smccc_1_1_invoke() is a variadic macro, providing only the func_id
>>     leaves x1/r1 uninitialized in the SMC inline assembly.
>>
>>     For SMC_RSI_ABI_VERSION, the RMM uses x1 as the requested interface revision
>>     to determine supported revisions.
>>
>>     Could this pass a garbage requested interface revision to the RMM,
>>     potentially causing probe failures or returning an unsupported boundary?
>>
>>     Could this also leak kernel register state to EL2?
>>
>> Sashiko still has this to say, I think it should pass 0 as the x1
>> 'requested version' instead of unpredictable garbage.
>>
> 
> To handle
> 
>> Could this also leak kernel register state to EL2?
>>
> 
> Should we instead do
> 
> 	arm_smccc_1_1_invoke(smccc_dev->func_id,
> 			     0, 0, 0, 0, 0, 0, 0, &res);

That looks safe to me.


> 	ret = res.a0;
> 
> There is no standard defining how the various SMCCC VERSION calls are
> expected to work. For example, ARM_SMCCC_TRNG_VERSION does not use x1,
> while SMC_RSI_ABI_VERSION does. Another VERSION call could use both x1
> and x2. The only consistent behavior is to return
> SMCCC_RET_NOT_SUPPORTED when the SMCCC function ID is not supported.

True, relying on "SMCCC_RET_NOT_SUPPORTED" => Function ID is not
supported is the safe way. If one of the parameters are not supported,
then the call should return INVALID_PARAMETER.

Cheers
Suzuki

> 
> -aneesh

