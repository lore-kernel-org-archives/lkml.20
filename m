Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1249E156
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401444; cv=none; b=rG/xPdxv8D0o2FW2YG14MiO6szAJyjiEB0eSqhe9RbdLrusX6NR5N7oDlxPbmUfpPqOnSruZIsF95NHnnAE7Sc3IjnzuX4e8b64TeilkoZBpJ50JERUV7TzbG8QRXhba470LM3gCw72jbtF5MdBARoCJ2ogUm1tm9aKAqcJ/m2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401444; c=relaxed/simple;
	bh=ZGYNpAdoVOs127uWuPqWVubWox46g+ZCn+AKme2aRUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayYToqbV9nQcWd2bfjVh4kbA4DayWKZLgtaQErlPOOw3VT0tuSTOCO0jbJ5/4Lb48fHqXsXJZPRhbAdgpxpotnWEoRvQD1C70yGcm1Qd8UcCqwh1V/iGj3BX5z+kJDxyZPNSZ0Y246baTE3K16zZf5Fdy1dRJ1jGvV03D4hGLQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBA2j350; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBA2j350"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso268285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792401441; x=1793006241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8zI4PFU7+iR63fa7JCvn5GLydDwgCivCmGKOvjvHWk=;
        b=bBA2j3504bH6OoqmaFdTXfQY6ENE+3ny2mEgBun0Hyl4Nkt9dxOS2JGEdXqVyEbsdn
         n+oGszlNU92HhQhY59LCg+1xfQ0KmYNN2JgCtSXL/7au0G+u6UHSbRd5TpvtmydQo+Lg
         V/+FVZFhyFJYiioRDbAFhS8GwRI5NZUFSGmLMcSDKhf65dFXueSFV34JwHtsSFrAMpOv
         JBsD3tARVfk0hF+OIXos3Mczqi0kn2Gkg8/leti8Iag6NrAjlonlqqzgfk3wwDxQHNjT
         rAwn/EC4wsU46cXB9F+8UBLIFwTtKn2kz+OCcsxgGju6AY+EcbNLRkRXx9ZvAT2AqpZN
         P/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401441; x=1793006241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8zI4PFU7+iR63fa7JCvn5GLydDwgCivCmGKOvjvHWk=;
        b=Cw5d1WXLx2cANHWOJ9h69EbOCJpOsR9KdWqDVDL8YDQqQ41EdSZ2+6skCYiH4fCSCX
         Cz9zo31pEDNx5mXEBONwsl5wKe7xggeLuLavYwVeXOjrbfVMlqpiR2WJHz/KUwn++nN1
         XxFzBvmWea0xW8KrvF/wTO6x7EmqjKV/d+7I0Omo1+8DeYPqhG03x7eFk9gfpQXbMn5o
         F/gjJEUhzhLsynodx7HdfZV+lrisACVLB64Yg+3ybiMw9jNwdFcsPww2Y/30VCaWQ86y
         b5LAx2dj3Zm3A7zDq5fcHo4z0bQpyIQs4fE8wmpsTtllgY+M6kkriQ3ePmPbceKFrkgP
         s44w==
X-Forwarded-Encrypted: i=1; AKwUvBw+Oq+bY9r5jDfbEfX2fEI3+y9zPMrKVsI8imeGLPwBWpliFTWyoWbAJTAXgWDXS/3ve9qZRcrECw821G0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE1fHWWS/5uoTLgK30IHVP8c1WkEg7qnmW4s4U7/zs+78Lxo2o
	Bn+imZEjTDe9S1x8JCHcua2vknR8WKEFt/hCiBCu6ig2bTyfmv+yYZmG
X-Gm-Gg: AYBFou2EBlHDXXB28uCQuQxEPF0D3WL0GQXdyJMOv/XZvaUlHcpu8xFF8R1PqoYlGlx
	oEZebnDYMUlJLDxZISHPzVOUSKxjeNqTZjTxy3VF8HkuOzAIAjze8iZtTJasL7ebPD36V2aN/oy
	Q1kqdYB1sfbP/DRlh1PerlaUXKMp2CKvJA69OyYEhIS2Y8JaMxXGJG2nSqynnRIFPVJCYgwVYMs
	72md3PPLxbXw9Np2BS6zTnVmWxhpqzsJed0WQzJXrQpRSVKKnlo1GljTAQfiJQpjca3RyQ4mUN9
	3J1ldEqnJormG9RJBll9hJaJaPtgCou/Q6pJHhVTsTa71hsHmd32I16gRik0ghQHv5y23SeIRBn
	lST/QJrkGrTvh36caJDca1Wgxo6YqNFsOkxMk9S7x/oMfiqvjwl2u1rkaLWXFDHFumbjR2f3Mul
	BIG3Qqz9ZO2syHU17kyf+Q1bjWb3ZToHLLlTLTCFJpW+cr58KFibuph5eyD4eqHqaS2Q==
X-Received: by 2002:a05:600c:6c49:b0:4a1:d45a:3ae9 with SMTP id 5b1f17b1804b1-4a1d45a3b3amr136069365e9.15.1792401441443;
        Mon, 19 Oct 2026 02:17:21 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm22612421f8f.47.2026.10.19.02.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:17:21 -0700 (PDT)
Message-ID: <1385f5a1-b842-45e6-8986-fec4123037f1@gmail.com>
Date: Mon, 19 Oct 2026 11:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
To: Muchun Song <muchun.song@linux.dev>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, Qi Zheng <qi.zheng@linux.dev>,
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>
 <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com>
 <BEADD50D-94AA-4B05-B9AD-136E37247FDD@linux.dev>
 <988249c7-abf0-4f4f-9386-27e835a4d2de@gmail.com>
 <EE02C2AF-E4BD-4854-B235-928842456253@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <EE02C2AF-E4BD-4854-B235-928842456253@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 10:43 AM, Muchun Song wrote:
> 
> 
>> On Oct 19, 2026, at 16:20, Jose A. Perez de Azpillaga <azpijr@gmail.com> wrote:
>>
>> On 10/19/26 9:50 AM, Muchun Song wrote:
>>>
>>>
>>>> On Oct 19, 2026, at 15:37, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>>
>>>> Hi Muchun,
>>>>
>>>> On 10/19/26 2:50 PM, Muchun Song wrote:
>>>>>
>>>>>
>>>>>> On Oct 16, 2026, at 18:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>>>>>
>>>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> Allocating PMD-sized HugeTLB pages at runtime can become slow or fail
>>>>>> as physical memory becomes fragmented. Reserving HugeTLB pages at boot
>>>>>> avoids this problem, but keeps unused pages unavailable to ordinary
>>>>>> allocations.
>>>>>>
>>>>>> Live upgrades are one example: they need additional HugeTLB pages only
>>>>>> during the upgrade. HugeTLB already supports CMA for gigantic pages,
>>>>>> but reserving a CMA pool for 1 GiB pages can fail when physical KASLR
>>>>>> and other early reservations leave too few suitable 1 GiB-aligned
>>>>>> ranges. At runtime, 1 GiB allocations can also fail when pages cannot
>>>>>> be migrated out of a suitable contiguous range.
>>>>>
>>>>> Yes, that's our use case at ByteDance. Allocating a 1GB HugeTLB page from
>>>>> the CMA pool is more prone to failure than allocating a 2MB one. To improve
>>>>> the probability of successful allocation, we typically configure the CMA
>>>>> size to be larger than our actual requirement, keeping a certain margin to
>>>>> handle cases where temporary kernel operations (such as DMA) prevent successful
>>>>> migration. For 1G HugeTLB pages, since the margin must be an integer multiple
>>>>> of 1G, the extra memory configured as headroom is also relatively large,
>>>>> making it less flexible than 2M pages.
>>>>>
>>>>>>
>>>>>> Extend CMA support to PMD-sized pages so their backing memory can be
>>>>>> reserved at boot while remaining usable for movable allocations until
>>>>>> needed. This relaxes the reservation alignment requirement and reduces
>>>>>> the contiguous range required per allocation.
>>>>>>
>>>>>> The series adds an optional @<page-size> suffix to hugetlb_cma and a
>>>>>> separate PMD-sized pool. For example, on x86-64:
>>>>>>
>>>>>> hugetlb_cma=4G hugetlb_cma=1G@2M
>>>>>
>>>>> Different sizes of gigantic pages already share a single HugeTLB CMA pool.
>>>>> Given that, why not let 2M pages also reuse this same pool? Would that make
>>>>> the overall code implementation simpler? And if it does make things simpler,
>>>>> should we go ahead and do it first?
>>>>
>>>> Sharing the pool would simplify the implementation. My concern is that
>>>> small PMD allocations could fragment the default pool and prevent later
>>>> gigantic allocations.
>>>
>>> Yes. However, the premise is that there has to be a mixed-use scenario.
>>> I'm not sure if this kind of mixed usage is a common scenario.
>>>
>>> Of course, we don't have much experience to draw on, because on most
>>> architectures there is generally only one kind of gigantic page, and
>>> prior to this, mixed-use scenarios could not arise.
>>>
>>> Therefore, I think that before the need arises, a simpler design is
>>> easier to maintain.
>>
>> wouldn't a shared pool still be sized and aligned for 1G? then the 2M
>> headroom stays a multiple of 1G and the 1G-aligned reservation can still
>> fail, which is what the series is trying to avoid.
> 
> If we decide to use a shared pool, I think the current alignment strategy
> should be adapted as well, it should be changed to align with the minimal
> acquirement, like 2M.
> 
> For example, if a user reserves 1G+2M through hugetlb_cma, then the memory
> reserved by the pool is also 1G+2M, except that the starting address needs
> to be aligned to the largest gigantic page (1G). Therefore, this pool is
> suitable for both 1GB and 2MB allocation. The only problem I see with a
> shared pool is that it may not support mixed-use scenarios very well.
> 
> What do you think?

makes sense to me. existing hugetlb_cma= users with WM pages would get
mixed use without asking for it though.

-- 
cheers,
jose a. p-a
