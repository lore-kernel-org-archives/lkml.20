Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707156;
	b=zWtH+fqCaXB1pkRcfOzvsxObEyNWytfa9SFYpcnY6WemV2TErwDZqguX/uP5LMgk7+Be
	 Je9CRmo6tUBWP38OPBkHyzHlvbQcZgf+3h6p2q6oUPUIsLgMtZxzvHYj2czYcjetPBBXZ
	 FAvjSwOQBP9QTCT4TQ6J+a8m+nvQxAqVhzWf55icJS7Gy9jRT3w1AqARhEKAjw0TBuEKV
	 9Ggx7gXbmWi5C+ihFiy3K/hiVTBV0okx858vI7e4RqWExE02zeLZ2I8eeq8+3XrAWLbfp
	 bb1fFHO+Kf5bmOrTL5Yq0k1F7GeKqyOL+TCdCqzrpOurTkUeATCZBNGbK+0FtuLKo+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oPfT2r0DJq5yqGsInZIZFg/Iplo7x3s5azqiGNXMZiY=;
	b=HqedkwWZxVLStMxVH1fYKmRM1144/86k0hm5zlmBt+WyeTdX63E1hTM7Io4+P1PlCL5d
	 54skkYQtuMr9JpSgZcb03I244OC8haweE2GvdVJryYBccM/5Oel3xnBgmfxFDcYj798Ra
	 4R/TTD2glfMV+YnueDODqGpkP5Ri8rZCSlLI0p06u7ysLGU1NlNmcxGXNar7pnLinlueg
	 CofGFfittUyFP5HexXyYKQQPHaaHUJaZMTFEAEgUVNBLYJSs4QoJ49VLOnrfitR+xR0+U
	 jdIexHem1gCXf5TE1JhtSzqeSOLl39+yMAxr161i8tf0FhNJ9V85kb8Tdyh+Neyvo0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q0E9MnFR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q0E9MnFR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so37218895e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707154; x=1794311954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPfT2r0DJq5yqGsInZIZFg/Iplo7x3s5azqiGNXMZiY=;
        b=Q0E9MnFRwZLfmMFoRQydzdxnoS2iQ3QxY+5eS9gx3faNv+6H1dBOIR1nXcTlGhMyOO
         02G1zQ0nsCTPbdhAAiVqOUGljxI2UDCmHSEBhZEhApPpwGKXri2P2pEmYhw0eufQZOG5
         ztOQB9to64WsBUgs+pehaeurpH9PRBW5SURkOt+E4BROAXjkgQI1rwL3o70IPBqayON8
         0pwad79j7ATrm6l3hgtY9ZhHBhpVQkRsEyotcWJBYTJOif3biBMJmB7FM3TMWJiZTm70
         CbzilfH2eTk1KgrkWtFtzc7wQxaA8Chb1EvJYu7e2kzs7BQitQ87iuuJxNt7Br3ILzgt
         BbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707154; x=1794311954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPfT2r0DJq5yqGsInZIZFg/Iplo7x3s5azqiGNXMZiY=;
        b=xI+9bqhda+ZwxMYvzToXLFSqqmJ7upDpLqcqbHvQGVEoukxvssNmZIvLuVeZgwueyU
         udzC4vVS1v1cTZY65hr/B4Ili8ccaidnTWS2HI6uGe4nRon4MWvU7xyHF2ZH9kwi6q+b
         JEPspftFfB910kSyYXBwnNpoLwEgFFcZvSz8V0AjvRIdPWt5ZJKZfrFF43dFazE3jkdQ
         smej3rp+55KJgz1/lFlU7QJR2yv8T3/LBxNjGUtZCmvp43U3ZSB4SF0WQY/dCS9Egrqq
         u5xgHrRxFEB5xjcAKER5iifXbI+LmIQyulAEJXXfbbyhXMcFvVeiGDArR+G7N4x4rdxV
         P7Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwugPaDeQLUwgketQITI/KkjRkziyoXh2Q8yY1l1i/6y4kMds+tyE7HhwUT9eV1Ib7ZQ+yzqopYKHYu12E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+saQTQ2Ywy/uKOkyO41LVI9yRyQe2n/EPfW26ddv+ZN3Z/TsLd
	aDlRU0PGeUMDy9auhT0LeYfAo8EfpSbV//DKO0rlBftmVYM7dH0w34vb
X-Gm-Gg: AYBFou3ciFlNchG/FW6zEQO/i0U66I6lkkp3nv7Uwpx3j1tj7przdN01tudklY/j1/n
	mokB8D1Bpqvs6gStrX9M7CqV8QgvY7PTEVXzmyRDw8NVJEYJ7tK5MX2qgyOwR9rRC3WdZIgfx0r
	zZWxrEzDCZ7xkEDw6paGn0YqkSQyILhdcTP12xfWPr9h5yyH+p03Gu9rO196G7p1OtxWNlwgOqM
	nngvK2trXVpoid+Guhz8qvONArhnbBqcdYL8Nf3XVH0Z41/HpDAtDA99obml8b5oYiZKeEGK62h
	1WENGLfuoO41Fc+T/oBUVveZWk2l0UcMQUXZKOylckBgT4OMXwb+hu013oDsZAVWEglEEuUgSt9
	oGNJAjhNAwmOkuJYYLa7GJ+0lAHiJzNCFP0jlBma340lmcA/aLNx1DoPLK5kAjUPXVfbJjnr8XZ
	/NXC67Aww0XDmpqXtSfJ28zWF0s1iMuuhZEca4MggO22/MgrIfQGbXis3uj4M0xIK15de3B22bD
	xSKROsulJecfnPEhTmsXO4McHY3i3wvZmed9Ia2IIJwDLNiL0YH6I+4XGPVQ09VTc/mMcUEvtqc
	yhojv1Hcw2CnE7XQ/+Ne7LY=
X-Received: by 2002:a05:600c:c088:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4acda922e24mr201283785e9.1.1793707154535;
        Tue, 03 Nov 2026 03:59:14 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm53255815e9.10.2026.11.03.03.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:59:13 -0800 (PST)
Message-ID: <41851e94-640b-418f-bdc9-45db3f9842ad@gmail.com>
Date: Tue, 3 Nov 2026 12:59:12 +0100
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
Subject: Re: [PATCH 2/4] mm: hugetlb: skip CMA allocations under
 PF_MEMALLOC_PIN
To: Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>
Cc: osalvador@suse.de, David Hildenbrand <david@kernel.org>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
 <5bc00742fe249cf09a3095abccf8889d5fa71116.1793692578.git.zhengqi.arch@bytedance.com>
 <4EC5E593-7537-4659-879C-95ECC2224D2F@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <4EC5E593-7537-4659-879C-95ECC2224D2F@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 11:56 AM, Muchun Song wrote:
> 
> 
>> On Nov 3, 2026, at 16:01, Qi Zheng <qi.zheng@linux.dev> wrote:
>>
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> With gigantic overcommit enabled, a fault during long-term pinning
>> can allocate a fresh HugeTLB folio from CMA despite PF_MEMALLOC_PIN.
>>
>> The folio must then be migrated before it can be pinned. However,
>> fresh gigantic migration targets are not supported, so pinning fails
>> when the HugeTLB pool has no suitable target, even if the original
>> fault could have allocated pinnable memory outside CMA.
>>
>> Honor PF_MEMALLOC_PIN in the HugeTLB CMA allocator so the fault can
>> try the non-CMA fallback, or fail when allocation is restricted to CMA.
> 
> Wait... I think my Acked-by got ahead of me here. :)
> 
> There seems to be a rather odd distinction that GUP is missing.
> 
> The usual reason long-term GUP must migrate a page out of a
> MIGRATE_CMA pageblock is that the page was only borrowed from CMA by the
> normal page allocator.  The corresponding CMA bitmap range is still
> available, so a future CMA allocation relies on being able to migrate
> that page away.  A long-term pin would prevent that.
> 
> However, a HugeTLB folio returned by
> hugetlb_cma_alloc_frozen_folio() is different.  It is the actual CMA
> allocation, not merely a movable page that happens to reside in a
> MIGRATE_CMA pageblock.  Its range has already been marked allocated in
> the hugetlb CMA bitmap.
> 
> Therefore, CMA cannot allocate that range again until the HugeTLB folio
> is freed anyway.  Long-term pinning the folio does not seem to make the
> CMA area any less available than keeping the HugeTLB folio mapped for
> the same amount of time.
> 
> folio_is_longterm_pinnable() currently only sees MIGRATE_CMA and does
> not distinguish these two cases.  In that light, rejecting
> PF_MEMALLOC_PIN in hugetlb_cma_alloc_frozen_folio() looks like working
> around an overly broad GUP classification.  It also means that
> hugetlb_cma_only users will fail the fault, while other users may consume
> a gigantic contiguous range outside the dedicated hugetlb CMA area even
> when that area has free space.
> 
> Would it make more sense to fix the long-term GUP check instead, so that
> an explicitly CMA-allocated HugeTLB folio is considered pinnable, while
> ordinary pages merely borrowed from MIGRATE_CMA pageblocks remain unpinnable?
> 

makes sense to me. with hugetlb_cma_only=1 a 1G FOLL_LONGTERM pin can't
succeed at all today, even on preallocated pages.


-- 
cheers,
jose a. p-a
