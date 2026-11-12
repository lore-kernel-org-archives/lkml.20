Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474634;
	b=y3FVppbxGykmcXmRdNVRhukVu8GlI9yTnDv4QVI8ilJv6oMValjJhy94JIUCRFujdRp2
	 WkLaNfpCczf9toL8DlBL8o7LfQa1XKfmqAbahwN4FxP8NFF2/cDAI6iJgb+sAEvXU1iny
	 zA9mrfEDL663CN1IrRYte55fENswEzilFtdmNwp/59HE20j88X6rDQj5Cu8r9VIaMicBy
	 6dU/ANiS6AmJz7c9kuyq+mBopKJ8Dl477c6NfPMS1+ybkbwsXONwMputgVaoDEgti8tEI
	 Uc5wj1sp9dcSkOVcQoHLQVkUAR9ziWJLdLeTUSYMuKBhZzidmFQ2ARr6GTPLi9D+/0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474634;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wQj27ksVjqLhjplnEMuQzGY5NWfyAFriN6cwBtDVCCk=;
	b=f4m8LU/Nk5mdJNg62zETk5Nn+N9Qnpz03XJq6+sLWngj+ZEm/2dE+fWHtn1dWfaDh7FC
	 bVOcdLH19MF5/zv4NQdg4BgjYD5HPgzBhLW0StDzYctld52qQiEDECcwXTEkDYM4JkvB9
	 x0/ZbohcuW4OXmTy/PdS7s0nDLc/gSxK5kYfLVTo5sJFjZzlBcKOPwDCO7Gskh0f8uBgM
	 tHbbMwTyTzce/C6BlNLKIT4R/zgMfU+WoYb4qs9lw2cDjckcSGrZsh7X+Sn/AohM91lOK
	 JfvpFau4Mnty7dEiKFws3BdPicVK19nZd2Q61/bN53pKZfBehGIYmgLj8004hPQuhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uswq2blK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117D0606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117D0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uswq2blK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16D16339;
	Thu, 12 Nov 2026 01:10:30 -0800 (PST)
Received: from [10.0.130.226] (e127648.arm.com [10.0.130.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CEA73F673;
	Thu, 12 Nov 2026 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794474633; bh=BYQlVTt2TsRYaw7IbDV9qQr5GG+v5qK7pRAPyT0Uld8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uswq2blKugXllc32B9EkYHllbNXq+RNpfxr0gL5G8z+TuwvAAwqG/9GWpKlGFCU2B
	 WQCpnAG3OVLNUmIq8dsY0u9Wxzb3ApojwCTUBAabrO+vR++HncNcEsehCuQNZYewnn
	 OqRbeCuFXdyaXWAN6i9Xe+KcMToka0jAht+o6CGo=
Message-ID: <30ba2eb9-5fe4-4b8a-879d-0283a8388f28@arm.com>
Date: Thu, 12 Nov 2026 09:10:28 +0000
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
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
 catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com> <avS2In7pb6A2XJaT@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <avS2In7pb6A2XJaT@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 18:38, Beata Michalska wrote:
> Hi Christian,
> On Wed, Nov 11, 2026 at 01:56:49PM +0000, Christian Loehle wrote:
>> On 11/11/26 12:39, Beata Michalska wrote:
>>> With the FFH support for CPPC, the AMU feedback counters, core and const
>>> counter, are being sampled to measure CPU performance. Checking for errata
>>> (which can affect both counters) between the reads delays the second
>>> sample and can skew the result.
>>>
>>> Take both samples in succession, then discard values from affected
>>> counters. This narrows the sampling interval used for CPPC feedback.
>>>
>>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
>>> ---
>>>  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
>>>  1 file changed, 49 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>>> index 66ac67bd025e..c968fa5b0c88 100644
>>> --- a/arch/arm64/kernel/topology.c
>>> +++ b/arch/arm64/kernel/topology.c
>>> @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
>>>  	CPC_FFH_CTR_CONST = 0x1,
>>>  };
>>>  
>>> -static void cpu_read_corecnt(void *val)
>>> +static inline void cpu_read_corecnt(void *val)
>>>  {
>>> -	/*
>>> -	 * A value of 0 can be returned if the current CPU does not support AMUs
>>> -	 * or if the counter is disabled for this CPU. A return value of 0 at
>>> -	 * counter read is properly handled as an error case by the users of the
>>> -	 * counter.
>>> -	 */
>>> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
>>> -		0UL : read_corecnt();
>>> +	*(u64 *)val = read_corecnt();
>>>  }
>>>  
>>> -static void cpu_read_constcnt(void *val)
>>> +static void cpu_try_read_corecnt(void *val)
>>>  {
>>> -	/*
>>> -	 * Return 0 if the current CPU is affected by a HW erratum.
>>> -	 * A value of 0 is also returned if the current CPU does not
>>> -	 * support AMUs or if the counter is disabled. A return
>>> -	 * value of 0 at counter read is properly handled as an error
>>> -	 * case by the users of the counter.
>>> -	 */
>>> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
>>> -		      0UL : read_constcnt();
>>> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
>>> +		cpu_read_corecnt(val);
>>> +	} else {
>>> +		/*
>>> +		 * A value of 0 can be returned if the current CPU does not support AMUs
>>> +		 * or if the counter is disabled for this CPU. A return value of 0 at
>>> +		 * counter read is properly handled as an error case by the users of the
>>> +		 * counter.
>>> +		 */
>>> +		*(u64 *)val = 0UL;
>>> +	}
>>> +}
>>> +
>>> +static inline void cpu_read_constcnt(void *val)
>>> +{
>>> +	*(u64 *)val = read_constcnt();
>>> +}
>>> +
>>> +static void cpu_try_read_constcnt(void *val)
>>> +{
>>> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
>>> +		cpu_read_constcnt(val);
>>> +	} else {
>>> +		/*
>>> +		 * Return 0 if the current CPU is affected by a HW erratum.
>>> +		 * A value of 0 is also returned if the current CPU does not
>>> +		 * support AMUs or if the counter is disabled. A return
>>> +		 * value of 0 at counter read is properly handled as an error
>>> +		 * case by the users of the counter.
>>> +		 */
>>> +		*(u64 *)val = 0UL;
>>> +	}
>>>  }
>>>  
>>>  static inline
>>> @@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
>>>  {
>>>  	struct amu_ffh_ctrs *ctrs = val;
>>>  
>>> +	cpu_read_corecnt(&ctrs->corecnt);
>>> +	cpu_read_constcnt(&ctrs->constcnt);
>>> +
>>>  	/*
>>> -	 * cpu_read_constcnt() incurs slight latency due to the
>>> -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
>>> -	 * Read it first to minimize the sampling skew between the const
>>> -	 * and core counters.
>>> +	 * Return 0 if the current CPU is affected by a HW erratum.
>>> +	 * A value of 0 is also returned if the current CPU does not
>>> +	 * support AMUs or if the counter is disabled. A return
>>> +	 * value of 0 at counter read is properly handled as an error
>>> +	 * case by the users of the counter.
>>
>> Why do we read them first then on 
>> ARM64_WORKAROUND_BROKEN_AMU_CORECNT or ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
>> respectively?
>>
> That's what this patch is all about - isn't it ?

I thought it's about getting (all GCC 11.4 here)
mrs x0, amevcntr00_el0
str x0, [x19]
mrs x0, amevcntr01_el0

instead of
mrs     x1, amevcntr01_el0
[100 instructions here...]
mrs     x1, amevcntr00_el0

(before this patch)

> It allows direct read of both counters (those being read first),
> and only once that's done, it verifies whether the workaround should be applied
> or not. For cores that do not have either it eliminates the check between
> reading the counters.
> Or you had smth else in mind I did not quite manage to grasp ?

Something like:

    bool core_broken = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT);
    bool const_broken = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);

    if (core_broken) {
        ctrs->corecnt = 0;
        ctrs->constcnt = const_broken ? 0 : read_constcnt();
    } else if (const_broken) {
        ctrs->corecnt = read_corecnt();
        ctrs->constcnt = 0;
    } else {
        ctrs->corecnt = read_corecnt();
        ctrs->constcnt = read_constcnt();
    }


gives us

mrs x0, amevcntr00_el0
mrs x1, amevcntr01_el0
stp x0, x1, [x19]

(for the non-broken case obviously)
