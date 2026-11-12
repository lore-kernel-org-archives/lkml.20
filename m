Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475371;
	b=q0MFHxrCMpOvfkR99ZlGPXz506BDc99cvwjnmg3PSy7ebCbjJD66Je2p0hL164xHfZu7
	 t1/v7rW14h+/PkUzUILsXBUOHiNfzjeC+rdHNJNItZtjYFabL8bA+JDdhaUPUIR583kNy
	 zYpUSD57Emhfu4NmwIenJnusj8+4RMR+6lgQvT346fL670iEV2xEarmyJS+3WP36j2mLj
	 MRU68EKLMpYo2/j8tXpRGXlWPGdWkDRS8nyKdKuaozNNLHTKu4GIPM6k3bOnT3zOgdA+X
	 eEENYG62DIMw8Ifk2MtHJNKBJeIrOSh7u2MvKldC6oB8LsRrVpW8hn5jjtYuL+Rp2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475371;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XLjQ9N+ETz22LHl7JVoKY8YKKdytIbDT+K/gK6twSwI=;
	b=gC+rOf+HT7wrGXCUQPiPhC5C3PpunonmwvQ+BRQhGU8Ol6ibV6s5ptRz/XB26rCcJHlf
	 ttHzxvX+eGZ6W9oDGv4E1SozgeF6puoecLLGx8O1MDFT54+1lrt8tqlhNTB+xEQRhaDHy
	 fcfC/l1xG+q80gEUgGd0jBKoLylew8Ubx95iMwDkA4mnLBbxZ4Tp8pP1ryeYjuNU0j4I9
	 A1cl1HN5O6Z5NvmtwWtrv9dz16AnrV2jekWojhn8iouPjnIj4v060En8P3SJwEDUEjf0B
	 UzAWFVa4/xq1jO4Cewxm93GTvSO6PePaoYvCmL9FaKxyRNzrESoOnQv0pVOT27/oKiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cGyT9P3D;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FE3606A8A3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FE3606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cGyT9P3D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDB01153B;
	Thu, 12 Nov 2026 01:22:46 -0800 (PST)
Received: from [10.0.130.226] (e127648.arm.com [10.0.130.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E7CE3F632;
	Thu, 12 Nov 2026 01:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794475369; bh=7msOILnF2iV34j3YNeMMSLuZTv+hcDHQmdRUXPoS4iw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cGyT9P3Dp5Yok3OCIw76O+oLX1gE4awDG/OBBDi9aY5DCbqh0VKIV1choshoK0vUk
	 xHLXSl84F+0IbRUf8y7tdktYsu3mWFi78nCAN2XLV/zXiKQk4CuOol+YgbtWgVrquy
	 nXGHvjycRU7ysM5MxlGNkd0VqS/X7ZMVOyez0+Pc=
Message-ID: <10a9170d-9ec7-46be-ad0f-d364c65563cd@arm.com>
Date: Thu, 12 Nov 2026 09:22:46 +0000
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
 <1493f335-a808-471f-932a-393aaa390d25@arm.com> <avS3CJI82z3xDQQT@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <avS3CJI82z3xDQQT@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 18:42, Beata Michalska wrote:
> On Wed, Nov 11, 2026 at 02:08:11PM +0000, Christian Loehle wrote:
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
>>
>> Since you're moving this comment around, AFAICT it's not actually true?
>> cpu_has_amu_feat() is checked (which will return -EOPNOTSUPP) before
>> landing here, right?
>>
> Not entirely, no.
> `cpu_has_amu_feat()` verifies the support for AMUs, the extension itself
> (ID_AA64PFR0_EL1). Workarounds are applied on top of it.

Right, I was only referring to:
"A value of 0 is also returned if the current CPU does not support AMUs[...]"

> [snip]

