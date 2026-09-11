Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF418373
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108676; cv=none; b=KhftURUdV5bYkXBb5AYWJvSfvAUG9xlXLW/vS4PKltIyLAxyjZ7jRw0ODOBTKtr+4VdC3UYFVRqrMheYgDIB6AXPmD0pjCODXyZHjsL+MAhRg0VwtSTQFpSzxQ878giWeOFcwT8yMjRV/wjxIVeDPJTo+0dIr2s58litvYIllCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108676; c=relaxed/simple;
	bh=Wr8Otja+SAbVp8kxHQbqxZW6hY/phYxsRrIKuP8VCzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhOLcBaJaILE93C9ylcrOCYzI5bAXVgZ8GJUaWlufigtIosenLhe3EbSfLBeD5+PKvr5ZdSAnV6NvPGYH7lt+pJ5YjJcnYrNeJvJ+5SawYmNWalvTmRnY3+GJAB2/lsC1UCQ2tzqtGwthL6SknhfsoDmNV9iyxQnFrrxFC7aox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuHBrfNU; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuHBrfNU"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-39b456fc4cbso316704a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789108664; x=1789713464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFqFJVoBVN5kZfJxUCTmdBnEcYhE5q7ZSLbJrzghpqw=;
        b=DuHBrfNU3zux1FRBQK5+vShBxlCTNneQMGwublIT1qZHpDOWUuoF0zrVldCzSdQVqV
         /GR6bRRI11UfwSAVDOvD08OH+bAltAHITcu9HLAIwFsHX6OqNhypQ/z/s+YBYbCW6jwB
         dUkm4k2pnUnotPDdyFCC93KFmi/yCoXhpeIWctPdfFO/asolG9XF0N3hC4h/aMNBoIlg
         fvDTGqOPXbN1Y1lfALtnfRwzWhxAa+nRZWA23kC7pIXTK8t5Fxrih4mJU2Jnl3liyXAd
         InlQXOV1fYdKyFGqBy+bSMlQ2E91PW9NlTwP5Zbwvh4dmy2Ue6AbmUNMX2faiH0g24b3
         Ytmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108664; x=1789713464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFqFJVoBVN5kZfJxUCTmdBnEcYhE5q7ZSLbJrzghpqw=;
        b=V7ijZrCDQUzAZYuch4G+keyblw+/dLWa+BMvkIQ7iMBIMZyR/nkaDV7vb56R+9sij4
         n+hVZzdsXLni6pUMZBwGaIOdkAp6uGrQ9/FC/+PBvpLk6enmrIO+0AhzB1UmCHJMTRre
         evORIovOMpfMxMoyS2qFIpV5WktjsLYQdxrVbk7r7kDlRte9tVY9SzE/nfj1GpCAMviK
         mjIiIcIdZFweCx9XAxCgwmJujHl1Z441odjwQIRsC9GzYiBO7tN9fMZRLarwxFwuslsy
         UJYmWufVs4kuVP3Mb2xVoGEt9YpjhI9ygHGBGojzh2sneQmXkcKbNHKxEjgNNZcToVy1
         RnGw==
X-Forwarded-Encrypted: i=1; AKwUvBwtjvIyG+/S/5XSM/xNUkXEsgRawe1+9HvV3Ekh/Hkg8N+tUj1IbTOyoDHrObeK17K1kKd8zxm8NtnVnms=@vger.kernel.org
X-Gm-Message-State: AFuF++n99FUKG9noPmujCXBao272/h4gh59HWI471pm5COFYKcG3iSKa
	XrRPvAgloZ/lX4hs9JE9NxLGGI8dzyDrO3EwpjPsrjHkmjDtPVWEC9AY
X-Gm-Gg: AYBFou3Y9FXRA6vTgBeB5qZ3l0u0wPhMGebnRvxqsf6RKFBQBF4Lr7FiTqN8zb/R3PT
	Td3YXHVYUaZzfXKAFwZd/ti5311G3szHCq6e7gQfKEJx0BgFqz8pRYSIuif1LAlfO1IydknOmTZ
	5l6ZV8sSpzT4lbuP49SrEFZ+VsPEOlN5MPtitBmwxFEMsALwlp8hHYreKFUpUfbGnN4Hh3GNYmd
	GRb5UXa5In+r4q2Oh+ri7pQnkRjTGg6AtB9xELl7m/iIFdRRKmxsIHfgktixRoJSehoSpZPzrnQ
	/t1YZxqRxIzNA5Gm0X32iwz0lUfIQT/BVFF7DgGrz8r6dxlatOSaV/xmkY92tZqX81xK7EPBgCk
	OBu5nBxXsSXiEAgwxMHsMTWva+SuuFVKaTe9+DMSZ8qtuIYlAnUJO6CPyp2VnjEfolwEg53HJdC
	QVcaCNGyWAdjnt1GjX71JU3FZvaUXpFyJPEx0q05SOwtOsEUZ6jTDt9sjIauAR3GHSgRjRsOkXR
	AMN/w==
X-Received: by 2002:a17:90b:548f:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39d9c1db3d4mr4983638a91.14.1789108663538;
        Thu, 10 Sep 2026 23:37:43 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da6016718sm783381a91.15.2026.09.10.23.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 23:37:42 -0700 (PDT)
Message-ID: <cbbe6ba0-5ee2-4597-92b8-3257e152be75@gmail.com>
Date: Fri, 11 Sep 2026 14:37:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] of: reserved_mem: skip init for regions whose
 early reservation failed
To: Marek Szyprowski <m.szyprowski@samsung.com>, robh@kernel.org,
 saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <CGME20260818092438eucas1p20115e5d33908e32ef4433cb246da8098@eucas1p2.samsung.com>
 <20260818092420.2859026-2-chenwandun1@gmail.com>
 <72074a49-2963-4f96-b939-79bf95a829cb@samsung.com>
 <af87036b-0809-4880-b088-545780b4d963@gmail.com>
 <7a964778-adc3-4186-9122-3858bb61c372@samsung.com>
 <7dd9e1c3-ddc8-482e-a560-e8dc4f2f0aac@gmail.com>
 <518729f2-db28-4af5-8ed3-9985c124db3e@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <518729f2-db28-4af5-8ed3-9985c124db3e@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/10/26 23:20, Marek Szyprowski wrote:
> On 10.09.2026 12:55, Wandun wrote:
>> On 9/4/26 16:49, Marek Szyprowski wrote:
>>> On 31.08.2026 15:04, Wandun wrote:
>>>> On 8/26/26 21:14, Marek Szyprowski wrote:
>>>>> On 18.08.2026 11:24, Wandun Chen wrote:
>>>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>>>
>>>>>> __reserved_mem_reserve_reg() discards the error from
>>>>>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>>>>>> caller counts the node in total_reserved_mem_cnt and the late scan
>>>>>> initializes it without checking whether the early reservation actually
>>>>>> succeeded. A region whose reservation failed is then handed to a
>>>>>> device assuming the memory is protected.
>>>>>>
>>>>>> Propagate the error so failed reservations are no longer counted, and
>>>>>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>>>>>
>>>>>> Recording the failed nodes explicitly is necessary because
>>>>>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>>>>>> tell from memblock whether early reservation succeeded.
>>>>>>
>>>>>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>>>>>> of static regions is not bounded by it, so on overflow the extra nodes
>>>>>> fall back to being initialized, which is the current behavior.
>>>>> I'm not very keen on such partial solution. Indeed we have no place to
>>>>>
>>>>> store the result of the early init call, but we can check if the given
>>>>>
>>>>> region has been earlier marked in memblock as reserved or no-map in
>>>>>
>>>>> fdt_scan_reserved_mem_late(). If those attributes don't match the
>>>>>
>>>>> region can be simply skipped then.
>>>> Considering the later patches that reject reservations for overlapping
>>>> nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
>>>> produce false positives.
>>>>
>>>> For example, if region A is reserved first and region B is a subset of
>>>> A, reserving B will fail because it overlaps with A (in patch 02/03).
>>>> However, during fdt_scan_reserved_mem_late(), B will still appear to
>>>> be reserved because its range is already covered by A. As a result,
>>>> B would be initialized even though its own reservation failed, which
>>>> is contrary to the intended behavior.
>>> Imho the overlapping reserved regions are some kind of configuration 
>>> mismatch and it is enough to detect them. fdt_scan_reserved_mem_late()
>>> can first store all regions to dynamic reserved_mem array, then check
>>> for overlaps, and only then initialize those, which don't overlap and
>>> have proper memblock attributes?
>> Thanks a lot for reviewing this series.
>>
>> I did try this approach, and it looks clean. The overlap check works
>> well for regions within /reserved-memory. But there's one case I
>> couldn't make it handle, where it seems to still produce a false
>> positive, please correct me if I'm missing something.
>>
>> For example, region A is reserved before /reserved-memory nodes are
>> processed. A is not a /reserved-memory node, so it never appears in
>> the reserved_mem array. Now region B in /reserved-memory is a subset
>> of A. At early reservation, patch 02/03 rejects B due to the overlap.
>> But at the late scan, B's range already appears reserved (covered by A),
>> so it looks like a successful reservation and gets initialized.
>>
>> The root issue is that the late scan can only tell whether a region is
>> reserved, but it can't tell whether the reservation was made by
>> /reserved-memory node itself or by something else. Maybe we still need
>> to record during the early reservation stage.
> Then maybe it will be easier and cleaner just to add a new flag to 
> memblock_flags (see include/linux/memblock.h) and mark each successfully
> reserved region with it? There are some spare bits there.

I really like this idea, it's cleaner and directly solves the
"late scan can't tell who reserved the region" problem. Combining your
two suggestions gives a clean and simple approach, and I'll implement it
in v3.

One concern: a reserved region carrying the new flag won't merge with a
reserved region wihtout it, so memblock.memory and memblock.reserved may
end up with more regions than today. When fdt_scan_reserved_mem() runs,
memblock is not allowed to resize, so if regions in memblock.reserved or
memblock.memory are exhausted, panic will occur.
The default regions number of memblock.memory/memblock.reserved is
INIT_MEMBLOCK_RESERVED_REGIONS, it can be raised if a platform actually
hits it, so I don't think this blocks the approach, what's your view?

Best regards,
Wandun
> 
> Best regards

