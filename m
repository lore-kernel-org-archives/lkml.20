Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB9B48382F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398026; cv=none; b=KbCr/eBvASxLwV1cy+oX2U3bojTRXixJ4WjgqrOX8kiFXVlTKHXW4KoErrh4QTKljXoCgF7VyExHW//y1LyfQnrcaM/KG4qib/Tl+Sq3gceK04eoAkMdR+N9wP21RWp4X3QzVpwdhUOoU5EqHTpz0Gp/LT58247xDu7D9qfItX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398026; c=relaxed/simple;
	bh=j8WVXcxU/9BAlFoQkv9FeMl3yW4ba8hDvKHbI8ntaHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eW1gTZhsT/m1wtLKk/JfJ0PUQfK7oDQvRHObV28XziNwfIjuOwR9OxT7k89iAdkZ5HsuoCl+u3FY287fka6fVtiZFnpfWAgX3lsMxXbPYOBryDIDju0ZanMTWflkUELWjUFsylT+yt4VpBJmxP4gvnC4xK0ctJVd6jT4kD5KTxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdHeeCWJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdHeeCWJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15638715e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398023; x=1793002823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dETs3b2ome9uziZhue1inxGS0jrP6uSNFUFfPPGZ4os=;
        b=fdHeeCWJVO4s6PDG+kkinphZVZIUocz3FnPBfl/f96Ly+79u2TtFTBUflmF7oM6FBS
         It8CfGYcJaOxyuI9cSwTOZgv6GVOZF03XWMCHs4opLobzsfI6aO82CbhWkjJLPBbiBbu
         QyT+GQT2vvpqL8zYYbmLxnGHZl3AYUMYOYk1eDcS0huqAKNIalK/vlP7xXa//sKAA/kH
         jIxKKizN+PX5nuC46z5l9VNkUdaJF9CXETW+JOhaC4U+S449FLdJtSVbDb2m3oFUQcZB
         Gbqf28Nh8LDVRqQwE2wmVpbDinR9NIojVWzATppUI2J49RAdW6XBPT9CjnIY4JGA40Z0
         PNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398023; x=1793002823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dETs3b2ome9uziZhue1inxGS0jrP6uSNFUFfPPGZ4os=;
        b=cI+FL2eIcqXCmLkdCh61lz1ZaYxJUYg69V9GvLbpI8nXG/fic9p/BNsntAeFt7B7Le
         roxu4I36zLK90y4fI+BWtDvpoOa2ZzIhg4mMC/NT02w3tz4BIYkuWsJqnKoQntFCRs52
         iFiEGXE7HX/5Eph1nNmL5xGJPUwVnMcNM2a27gip+YnnCnF9ECL8IhSq65hOqSlNyyFv
         ckEK0/txwpRbXqkuSMVB/ArG3mMnaS+3FZooltNn5XdF4arCYZjdOWjjEdxA2vMfQGlz
         jA+VafynoQTc3mHdyjOEbk+EyggnE1yYp6OzHsCz4du2UMaNew/O88cz+K9/FJMZLrlD
         ZrVA==
X-Forwarded-Encrypted: i=1; AKwUvBwLX/EJPUDpk5/UBWtoyd1Et97ulIEByIJ2GJI59nVotUDDD5RsaF9XJ2303/Xdd3bRuvGRsEc9B7lMYzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpSy5eCMjcTzOmi9uNGkSTNjqjeIqF3qdMiuesF94D5iXPfl2+
	1FpScn626wiyQEmJmsWFUv1fXkYn522MZ2zR7QTbco7rVyfpfFwEMYhT
X-Gm-Gg: AYBFou2mpny82aNqukqxTpLsuKeid+eimmGD3iSbVJx9snkaVjoyPAtHNmX7Z7LVH1x
	rUiCkl/lecqBReOmydeOYpN31C5wpquS7CgcEbG8g9QGAeQpYxSsVRAwzhYfJHfDQVnzDqtUlV5
	3xgjetUDBDUiY7JUZOE9JcE1T6+OcspMXAdB3v16AWcNbixY/1pqFeYUHga/QOsq7STg1c/FEZ5
	buJMKD1jiSAPFl58gn4f76gJS5ou05e2XfoiBXLCWNHT+7CtVnIqCHpLD+MLrsiCfSP8GaQkMg8
	K5vIwcr9LLfylaoNcPAtLQAbn1WDUFkSW3qIFWdK3GsJaF40UD8bN1Z2MFCCERQ3igFZRJxwFqf
	0WTm0FbtT2ubney86NvKFBKdFVqitwLGpfTDjcIl518PledNlyBIMh1clntzpjSlYdgbJYe6g7b
	XI0i6quWpKDupUTnRP2+sMshPhAVFUw95OM3W27fD7JpZU9Cm9H45aFcoY62Ob7a75TAE=
X-Received: by 2002:a05:600c:8b22:b0:4a1:8627:aec7 with SMTP id 5b1f17b1804b1-4a1d75e6fe3mr151926975e9.5.1792398023183;
        Mon, 19 Oct 2026 01:20:23 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm385910145e9.10.2026.10.19.01.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:20:22 -0700 (PDT)
Message-ID: <988249c7-abf0-4f4f-9386-27e835a4d2de@gmail.com>
Date: Mon, 19 Oct 2026 10:20:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
To: Muchun Song <muchun.song@linux.dev>, Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Qi Zheng <qi.zheng@linux.dev>, osalvador@suse.de, david@kernel.org,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>
 <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com>
 <BEADD50D-94AA-4B05-B9AD-136E37247FDD@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <BEADD50D-94AA-4B05-B9AD-136E37247FDD@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 9:50 AM, Muchun Song wrote:
> 
> 
>> On Oct 19, 2026, at 15:37, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> Hi Muchun,
>>
>> On 10/19/26 2:50 PM, Muchun Song wrote:
>>>
>>>
>>>> On Oct 16, 2026, at 18:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>>>
>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>
>>>> Hi all,
>>>>
>>>> Allocating PMD-sized HugeTLB pages at runtime can become slow or fail
>>>> as physical memory becomes fragmented. Reserving HugeTLB pages at boot
>>>> avoids this problem, but keeps unused pages unavailable to ordinary
>>>> allocations.
>>>>
>>>> Live upgrades are one example: they need additional HugeTLB pages only
>>>> during the upgrade. HugeTLB already supports CMA for gigantic pages,
>>>> but reserving a CMA pool for 1 GiB pages can fail when physical KASLR
>>>> and other early reservations leave too few suitable 1 GiB-aligned
>>>> ranges. At runtime, 1 GiB allocations can also fail when pages cannot
>>>> be migrated out of a suitable contiguous range.
>>>
>>> Yes, that's our use case at ByteDance. Allocating a 1GB HugeTLB page from
>>> the CMA pool is more prone to failure than allocating a 2MB one. To improve
>>> the probability of successful allocation, we typically configure the CMA
>>> size to be larger than our actual requirement, keeping a certain margin to
>>> handle cases where temporary kernel operations (such as DMA) prevent successful
>>> migration. For 1G HugeTLB pages, since the margin must be an integer multiple
>>> of 1G, the extra memory configured as headroom is also relatively large,
>>> making it less flexible than 2M pages.
>>>
>>>>
>>>> Extend CMA support to PMD-sized pages so their backing memory can be
>>>> reserved at boot while remaining usable for movable allocations until
>>>> needed. This relaxes the reservation alignment requirement and reduces
>>>> the contiguous range required per allocation.
>>>>
>>>> The series adds an optional @<page-size> suffix to hugetlb_cma and a
>>>> separate PMD-sized pool. For example, on x86-64:
>>>>
>>>> hugetlb_cma=4G hugetlb_cma=1G@2M
>>>
>>> Different sizes of gigantic pages already share a single HugeTLB CMA pool.
>>> Given that, why not let 2M pages also reuse this same pool? Would that make
>>> the overall code implementation simpler? And if it does make things simpler,
>>> should we go ahead and do it first?
>>
>> Sharing the pool would simplify the implementation. My concern is that
>> small PMD allocations could fragment the default pool and prevent later
>> gigantic allocations.
> 
> Yes. However, the premise is that there has to be a mixed-use scenario.
> I'm not sure if this kind of mixed usage is a common scenario.
> 
> Of course, we don't have much experience to draw on, because on most
> architectures there is generally only one kind of gigantic page, and
> prior to this, mixed-use scenarios could not arise.
> 
> Therefore, I think that before the need arises, a simpler design is
> easier to maintain.

wouldn't a shared pool still be sized and aligned for 1G? then the 2M
headroom stays a multiple of 1G and the 1G-aligned reservation can still
fail, which is what the series is trying to avoid.

-- 
cheers,
jose a. p-a
