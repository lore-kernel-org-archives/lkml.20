Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C93B8945
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857976; cv=none; b=bmqAdEtn7zjIOihAn/2MPtdJIc+3o2oZtLIeKyqbZZm1S5SjtlsnGu3z1Gy3yw54qOkRZJZ3ac5k+9iTxitZtcXiai6XwNkDlyWJtd0XVPaOTry4+b8h0gxEjyvR0+mReW4WS+F5555SJxd7nOddvzqW77MHR8HZRIZqdvKOOYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857976; c=relaxed/simple;
	bh=k3JA2v41OnZ7UfxKKtnSfTR/W9JbMqA8ZaWuRot9ZAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKXmYvdK0ACGCLfZ8OsseRB9NWknKoWm9KX/864BkvIDFKGyTskchwgzCGKEMtLjXuHkso8N9GuCEoXmwPu+YqaQh0EGX+s1t214KcqvxH1Lvj9RdiGuD8+LzhWEtbbZ9XqM98kbhcCkT9uj5mMa2nydVPqBwqUMlHanoqUx8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dsbiKCWR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0JgCYmh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dsbiKCWR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0JgCYmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790857974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMYtf80P5oX4IkVB/3A4AGGwzt6DCWZzJjMZ+oV75Lw=;
	b=dsbiKCWRcPo3JHVQATD7pnGI54Dy///72+h5mNUG7ucISNVmqJJrOO0uNqd6jeBk4NIoo7
	Wakv34+ONuxXZ3CRgCSylvyetLhuCgsHramVcCw7W1iVTrvEgAzuv9jh+PglERa/YeZfZc
	WoIG7jSwPoY8/gg2H+pFyiarLQBrpKk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-PWiAgteCPFWWVRaV023LvQ-1; Thu, 01 Oct 2026 08:32:52 -0400
X-MC-Unique: PWiAgteCPFWWVRaV023LvQ-1
X-Mimecast-MFC-AGG-ID: PWiAgteCPFWWVRaV023LvQ_1790857971
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4870663a5c4so3265987f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790857971; x=1791462771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMYtf80P5oX4IkVB/3A4AGGwzt6DCWZzJjMZ+oV75Lw=;
        b=c0JgCYmhlu+QLKm+uCK++ues4PWTYV2OQEJ1L/r62kEcm4Bu7eOmmidsjBvAlTGx5a
         /PWM0BDFiD6CDTT/3qdGfBwtMNvBJ1jUv9S/pB59cUwfilHFYM82WZ3XfAm8a/p92606
         yT3ce8N5LHQle/RHsGaVHj36r0so3jZ3CSQcSdmuWh07+2VbvVnamzvdgaT2UfDn2wkn
         ir32+dtt38zfwsLZnZQlxHutbm0Htn4yT9Uv9VzSMco8ouojq6Y64lL36WVO8bG0QSGt
         8GpbNNxAVvPPOn3b5nrpLg5q7E6zIbYwCnA8bEkjtrkGolBEJyiYDbf4XY8e9V0YRyc6
         i4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857971; x=1791462771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMYtf80P5oX4IkVB/3A4AGGwzt6DCWZzJjMZ+oV75Lw=;
        b=d6wl42uqGhYdxjoWsjQ3wsT9ac8okLxdcsDcV3k1yvD4zMK6t3ly51mBIK3bInRdV2
         O3+wR2ny3zI3l6GPqtB2mKfdCXHAGJn3/PCY49eyEuujYYbOEWN0SpN3gFRyyeh8BOX3
         eMRP1f9S0OByZhEciEVzjYnIjdDsO0QqU8IQoP38FkJUmeqcJipE4vXmFyaOzRWf3aU8
         jafY5AOgUDwtWSOicG1R4O0m7ZKMu6a85fwPRkt+M23/2LZhGi1f+moe0188KkSevOtP
         3ZrggAhQVPZcc6KuyHBvV9hZgBRA7qQrqHiZ9U/R6ugsHVaMZtccWx2kC+NPYX3bAozX
         RJPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+RkYwOlV3cwScE9l7bOJ7Js7Yv7/P8mfquUlKnOiBzMaB99DBARhTXSoCSKloBiqP2P15TIF1IRNpkQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiIsdhUEooemjKEfQG+QbnkgvvJgGxu3Q62ijGDoegyOW9zXgY
	g5NWOHqTEFlSwtftKrE6+fPzR+/+DZeCXVyN0QNoclTfo9DpgDoXZxt8tB99M+ZWPrkG+SLxUqd
	NkA8xEFPj8++LC14KlTaszcV05Jyovot6C3RqpppL/NQ7SoNjEyW5A/dgzVtJc45C
X-Gm-Gg: AYBFou17xj5ToKpkueb/F4TX7SM/pD+aHybMcQsvAlNSwcjiYyhXQ3/EDeI4at2UxxU
	lN1MN27ywKnOAZiKcij6HVBkpFWGs1+3ZFGsvGVu4kgY+3GHNorvwsrtSzNrAd6/sF7vZUV89vD
	R5HCCxOVkML+Z4fnTlfzsX2n+Gb3cYJN65jeRlp1hkqA2LP/hikrb0n8eaY4WQXHOW5C30PMU3o
	Lo08kGQ1G6hac3A8UmcqqiKH1zT1D6pC3fqKFFYMf50Opa/c05FLm51hlcd23MJtEEe5WNsh3pI
	zZGnZkWIzIcqBhP0eWo9D8M8EnZ4XkRd3540DRH30fA+nCfgsfRHx8e88PL7ujFSJfLNbzI23Dl
	1MB9cDO8LT4StQ8iCF9kfWP0hxrOrILt9yA==
X-Received: by 2002:a05:6000:4107:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48b05870bd4mr4665291f8f.15.1790857970894;
        Thu, 01 Oct 2026 05:32:50 -0700 (PDT)
X-Received: by 2002:a05:6000:4107:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48b05870bd4mr4665181f8f.15.1790857969830;
        Thu, 01 Oct 2026 05:32:49 -0700 (PDT)
Received: from [192.168.0.101] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691d681sm5371173f8f.23.2026.10.01.05.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:32:49 -0700 (PDT)
Message-ID: <5e183c24-4acd-4b79-b601-bd1aa2f53dce@redhat.com>
Date: Thu, 1 Oct 2026 14:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] maccess: Use a scoped guard for page faults
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)"
 <bpf@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT - CORE" <linux-mm@kvack.org>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
 <20260824160523.3907021-5-usama.anjum@arm.com>
 <79daa73b-0d34-4e84-8450-56f90bc700d4@kernel.org>
 <98e9ac67-7df3-4c0a-8814-37e196d94020@arm.com>
 <7454d7a3-57c6-4883-a66b-26129e633c6e@kernel.org>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <7454d7a3-57c6-4883-a66b-26129e633c6e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 13:33, David Hildenbrand (Arm) wrote:
> On 8/25/26 14:07, Muhammad Usama Anjum wrote:
>> On 25/08/2026 11:36 am, David Hildenbrand (Arm) wrote:
>>> On 8/24/26 18:04, Muhammad Usama Anjum wrote:
>>>> Kernel nofault copy and string paths open-code page-fault disable and
>>>> enable around label-based loops, duplicating cleanup on success and
>>>> failure.
>>>>
>>>> Use a page-fault scope guard instead. Leaving the scope now re-enables
>>>> page faults on both paths without separate cleanup at the fault label.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>>> ---
>>>>  mm/maccess.c | 53 +++++++++++++++++++++++++---------------------------
>>>>  1 file changed, 25 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/mm/maccess.c b/mm/maccess.c
>>>> index c59a0e092d24a..f695ceefe6fcc 100644
>>>> --- a/mm/maccess.c
>>>> +++ b/mm/maccess.c
>>>> @@ -38,18 +38,17 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
>>>>  	if (!size)
>>>>  		return 0;
>>>>  
>>>> -	pagefault_disable();
>>>> -	if (!(align & 7))
>>>> -		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>>>> -	if (!(align & 3))
>>>> -		copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
>>>> -	if (!(align & 1))
>>>> -		copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
>>>> -	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
>>>> -	pagefault_enable();
>>>> +	scoped_guard(pagefault) {
>>>> +		if (!(align & 7))
>>>> +			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>>>> +		if (!(align & 3))
>>>> +			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
>>>> +		if (!(align & 1))
>>>> +			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
>>>> +		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
>>>> +	}
>>>
>>> While I understand what pagefault_disable+pagefault_enable does, it is
>>> completely unclear what scoped_guard(pagefault) does.
>>>
>>> Should this be scoped_guard(disabled_pagefaults) or sth like that?
>>>
>>
>> The `pagefault` guard is already defined in `include/linux/uaccess.h`:
> 
> Ah, sorry, I thought this was added in this series.
> 
> It's completely confusing.
> 
> 	guard(pagefault)();
> 
> meaning "disable pagefault", what?! :)
> 
> CCin Viktor: I see that the patch that introduced that has no acks from MM. I
> don't blame you, because the file is not actually listed under the MM section.

You're right, looking at it back, it's a really unfortunate name.
Renaming to nofault or disable_pagefault is certainly better.

Thanks for pointing this out.

Viktor

> 
> I think this really needs to be cleaned up to clarify that we *disable* pagefaults.
> 
> Usama, can you throw in a patch to clean that up? (calling it nofault,
> disable_pagefaults or whatever)
> 

