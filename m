Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A8455622
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037724; cv=none; b=TPCpw7f7tmy1QTJlb0u5ytmTKmrwxdZiacBdm10HUwaxCX/bkhh384teoRG0kpoQLlXIgKTc63K2d/lRXtjxFUXOB7SkpwWmrZie0aVbxynB/4RIsdPwU7SvClo+0r13VaoEH80Tkiei15rjKXgRkiSiYm5X0Qp3hJwsjaGnJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037724; c=relaxed/simple;
	bh=1NyCcixVrXL60MDlTpGIFvmNay2sIq1Ok+sWjQ5AMxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+jFFMZWKw8JW2Jbb43+Z0llRH8ohmrYjalUxiZUt6rins3fuMfg2WO6a92SXIxcubhDIsg3LqBh6Hkwqd3MvAQDCBeAFOqu8DeHjw5i5bh9mmX5o1BqM8icQHI49m0yU94G8jCKQr3n30MJ7xVqCqFVKkPmqwtvgH0oZscZuaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TplkauLe; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TplkauLe"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso2264139a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037716; x=1789642516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/lsWiPytaCYG5VQwzNu/fNcbbKarnBsAuYB2BQ7P9w=;
        b=TplkauLeUN8EE/NyAJDEHkz5dh7EISNKsX1rXSX/8DugajgRxytxtP/Kj9aMPWOFNL
         l95eQmKyPHsiiLl3TIWLSAe37AOZx7JrEKnTlWDjTDF6twnW5EMNMnVyg1WIU+aHKjxW
         4gIKk89f6ovOxQvdGyjZEcSVgYoj+/j7EZKH8EvHbjcSWo2QUwY67GQsODcAGqarjFVP
         0/ZJQJI6wC4B00yb14S4hadQlrvvj7uIZ2raem/zbSK4Y/JwXPo8hlN5QDHG/VwCyu9h
         uUHKwJmL9zh2p0edSrtncCabvFYFY+iPyseLhWXX6ZGT+SIc8/8K4h+wjI/QN+b2vImY
         K/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037716; x=1789642516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/lsWiPytaCYG5VQwzNu/fNcbbKarnBsAuYB2BQ7P9w=;
        b=sVAtFLkq1TKVtwwCksDRdiFVnIVIeQhdYU5eq0qiQPt1a1bhwXtcKJ05KP0rPId7gX
         DFQvCQVqxwnSJmarqMeQvsz63doXkscURybueZIcneD+1Zh5jvX1u2AeC9U0d1IQW54G
         F76Fj7mtvV0MVZMJfakCkM2L6w7KaaMO+Jsf8csO0/XspxStvb/Nz4TNlfkICRiefL2Z
         WyJ9Lf0rRQEl2keOReltDR8UPdytOLW4fyqgPKT8sYSMIko1hkNfKEU7AGQ22n7y6Qwr
         laBBSO7C5ODXySxl/JgwVM91RurG2TJudr25acq3Yvtcz4kioIHDm86koMtdbTx19ZIr
         qKNg==
X-Forwarded-Encrypted: i=1; AKwUvBxY8d9lR9rT9GVj5lS6zXmHeWcfklHDmYCScIAYYmFw23rvRWktZLLJiOGrywYXyh11RINu2iwLKCMJLfc=@vger.kernel.org
X-Gm-Message-State: AFuF++lxxOagc5z/9n4+bAXQXoYAMNK5xGrPNHiojYXg6Vxq9NR94Iz9
	rHcwyZG88FA4LR7H1R1WuzUkcBrUNwZZxk8gEN/8zODoBpeCIVbfERDv
X-Gm-Gg: AYBFou0xDieZIxfTVnbrLoyL9yjk8kGL2edLRBDy4Cdn587jScZwrfV46WoJQaSRqnj
	jFCCYPJ+8fBQbmOA7ArGZ8VKXG0LnY0JhF1tCbyDIWTK9S9ikm6zgvAXfRdsi2Tctkv2+aSNJPv
	DfYxYimEUCVYuiNOsCMtR9/I97fhSaSfuGm4krD9Aewo3Fw51v1q5mgd/NEJ3OlRXeFse/Trj7y
	/ZqqUV7Q0MHRfFFP/VlI6ef74aJnsmaD3q0t7RNSrgYcsxNcAYMiDY5nLSswFOyNf6KEHKAZAF4
	P/Gi+D9+WJ13Ow62Y9cBP3bJ+DUyX9t1Sn7HgtnEZtYQVMO1wvRi2sYSaeuUTb/tPtgT4XZAXhp
	tPgjkR53lUBVeAYlIpJyCud1hRRlPHWWM42A6l09nRQINnRoHO4lMhs4smY4dJQz0i3qsa/o2Ep
	7gr14Ajc+EM/SZgT8JkDEnxRwcweZEm7xf0KmVbPKF2mTwcNzYnLrbZuxtdGt7VXl5/i7+D2rZc
	CHa1gqE9PW38acQcA==
X-Received: by 2002:a17:90b:4c44:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39b261cdb38mr58067406a91.13.1789037715868;
        Thu, 10 Sep 2026 03:55:15 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77611asm3990224a91.6.2026.09.10.03.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:55:15 -0700 (PDT)
Message-ID: <7dd9e1c3-ddc8-482e-a560-e8dc4f2f0aac@gmail.com>
Date: Thu, 10 Sep 2026 18:55:08 +0800
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
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <7a964778-adc3-4186-9122-3858bb61c372@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/4/26 16:49, Marek Szyprowski wrote:
> On 31.08.2026 15:04, Wandun wrote:
>> On 8/26/26 21:14, Marek Szyprowski wrote:
>>> On 18.08.2026 11:24, Wandun Chen wrote:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> __reserved_mem_reserve_reg() discards the error from
>>>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>>>> caller counts the node in total_reserved_mem_cnt and the late scan
>>>> initializes it without checking whether the early reservation actually
>>>> succeeded. A region whose reservation failed is then handed to a
>>>> device assuming the memory is protected.
>>>>
>>>> Propagate the error so failed reservations are no longer counted, and
>>>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>>>
>>>> Recording the failed nodes explicitly is necessary because
>>>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>>>> tell from memblock whether early reservation succeeded.
>>>>
>>>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>>>> of static regions is not bounded by it, so on overflow the extra nodes
>>>> fall back to being initialized, which is the current behavior.
>>> I'm not very keen on such partial solution. Indeed we have no place to
>>>
>>> store the result of the early init call, but we can check if the given
>>>
>>> region has been earlier marked in memblock as reserved or no-map in
>>>
>>> fdt_scan_reserved_mem_late(). If those attributes don't match the
>>>
>>> region can be simply skipped then.
>> Considering the later patches that reject reservations for overlapping
>> nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
>> produce false positives.
>>
>> For example, if region A is reserved first and region B is a subset of
>> A, reserving B will fail because it overlaps with A (in patch 02/03).
>> However, during fdt_scan_reserved_mem_late(), B will still appear to
>> be reserved because its range is already covered by A. As a result,
>> B would be initialized even though its own reservation failed, which
>> is contrary to the intended behavior.
> Imho the overlapping reserved regions are some kind of configuration 
> mismatch and it is enough to detect them. fdt_scan_reserved_mem_late()
> can first store all regions to dynamic reserved_mem array, then check
> for overlaps, and only then initialize those, which don't overlap and
> have proper memblock attributes?

Thanks a lot for reviewing this series.

I did try this approach, and it looks clean. The overlap check works
well for regions within /reserved-memory. But there's one case I
couldn't make it handle, where it seems to still produce a false
positive, please correct me if I'm missing something.

For example, region A is reserved before /reserved-memory nodes are
processed. A is not a /reserved-memory node, so it never appears in
the reserved_mem array. Now region B in /reserved-memory is a subset
of A. At early reservation, patch 02/03 rejects B due to the overlap.
But at the late scan, B's range already appears reserved (covered by A),
so it looks like a successful reservation and gets initialized.

The root issue is that the late scan can only tell whether a region is
reserved, but it can't tell whether the reservation was made by
/reserved-memory node itself or by something else. Maybe we still need
to record during the early reservation stage.


Best regards,
Wandun

> 
> Best regards

