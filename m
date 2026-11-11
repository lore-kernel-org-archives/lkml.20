Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426231;
	b=XJ8BRFBZqA5xV45zfN1zfRGtu4N6mpUx4L8TGtxIRVzy4glR30Iylfk3tEcVhvbNGVsu
	 z6xN3AdUKK/V3q18alX6CBl/H/ZYzLdB8haBi12pWzUoBabHP1zDe41TDxN1zkKmrIqMy
	 mJ7++IuCnRCPcTa7fDja/DX81WuzAMxt8ApgfQLwb/0d3TEcuJQvMvGNN+hxb/8BIQw94
	 DLdoEdoRm35cV5YKNqahhg2Mfp4rr5sQO74FFy6UbV2XSqUJFUE8yztXT+hxQxP8NbNhy
	 7qHDrbAyJ8MG6eoXibhwGasAr/GAsKJgxs/0fnhYNSGS2Jg/eBZPM+9Y+ODjpTlKIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qPQBpyJHjmsj5LG3VBmEeZ6gqORHq46wFNwC+BMZwmc=;
	b=A69sxLl3LExTDP3nSFXiqwhub1Dk2pLKZLSNaIM36HpYLDXWECcwaikU5vZkIXs2Ma83
	 Lbwa+siYephHfW4ABK0dSKlOp5GyTyyjgieW2HtkK2T4hkGpM0Ey8afBUf8+0HFiYq5sz
	 UHWnhym2kxB8AtpXrOE3zLDk76D6HiX39NhyoiNF3TCVrc0bB9Nn2F+/gGX+n4oheyja+
	 T5QMmZ/9Mo3wW0vwuagKIabSw9IEOpsY3abl2Ar2QLFJtbHa0K4dOL7WrCbiOn0SIIZYZ
	 uFZ5ZEZJdoHTbvddnbq7mcCpxw/WKncORO20ckn9YLDVN+v+jxY4iRJCIWGRnJkZJAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL80ifvK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34198606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34198606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL80ifvK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso37329015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426229; x=1795031029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPQBpyJHjmsj5LG3VBmEeZ6gqORHq46wFNwC+BMZwmc=;
        b=iL80ifvKLKFZgLpJn/e7lNXdSJam0veRmlVkdvTZNFBW22yP/7Z0D0aJpFwMwD2+r0
         cxRQmcmVZJ4t3jdjbvKfWPw/1sBjYKmdpzht24cQVBBDi2yB0Lew0TQXm4BLmGuFKzin
         o6qGkBuHRTqH4HJ4C3PKM/jx7w/L33n6vkvoCXoSzCFy7VHkHjOBqXRsTfEXpATqJJGB
         vK12CsMOV7Rzr50wQYK3bCxe7I2DLDubQHfiFs4RtSUK0Nqu4a7p3/gkOmRKxT6XgHsn
         Rzp4irT2QU0I/X9z0qPOK7Ndv0t6fbv+wkNGuVo9BZMKUtVufGdsSVqUMOv3Bo7aKpCF
         M2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426229; x=1795031029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPQBpyJHjmsj5LG3VBmEeZ6gqORHq46wFNwC+BMZwmc=;
        b=JdWlWVjO1anNT7z382sPA9v6Cl9LcCwW3uWSZKlv/biMT1h7bm3TzWVfyTzPPoxipA
         OjDinjJSsDa0+7spmqEoiJ/aqg1htlc++yPKQwobdojHs3uVnM4RXb736GbZB6HqEjjT
         QUeJvcgUoIHkhfkKohv2s2x09h5k7N8wXc+zXctJdXlMz3gztZn8u0d1nhECbhRx62CG
         UPq3V8mRhY6i8A08HStLkLPgkm63gChYn6nLjgHU5ycOAPVTZrQDr3isC1lLsQBJYN8j
         hhCRCNTTbwycwINE71/JeVJA6k0y/dvOfpQhVRNAdK6AgsAODQH3XeKf0AcDhkPw0wRf
         fF9A==
X-Forwarded-Encrypted: i=1; AL+hErG7H+gytkYTtN4oGdzd+jKDafRrP+7S52Aa7rFj6ani/W0YX8jUxe6GN3hG6IQkSb32etWIqs4rHCkr7ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+DHR12SHFpqI+o/DmTHdz8y4L9SUUPNrTKzBael0kTErC97Bp
	o0al8eV0xj+tEGoYM0/rBQTLFz/ZTQfArm/av2l/UsFwFdUGa1AAHppM
X-Gm-Gg: AYBFou12CzA7S1UrcrFAHG8rC8Je+kzO8tiM+IbmdUr2TZ0ZbBUusx8jGJHRqgfo1be
	dZEHazLFpDBAKH1eLzrdjnYrpq8dh3+y6FXcqdnN7Ehd/ImEsTAQgpv9DHG6eZ74Y1nXA6Q+pfD
	QriHTHpRysey8F4GfCCAAATuS8xDeVMOaV63sLI+EsJsRgE6KxuardNpkOuRu2jAmU3T0VScecl
	7LlQtwcA357RbMzaoEZfCwyX758tnhXWjvc0hkiFHiHVTVFl+/axRPccA4S6fbAJdBCaREl3TwT
	AxiHc2ve4FPMLCUcpUP86BfPT59tUzvP+d9qy7+XuMNNuhH1D//ynK15jE4XUugPf7PbjLLpj70
	iudAOZrj7ReQpSnE4CshqTOWuB9fb9kg5uceFGuI2Y4+tQe6gG6m6IvDFlw9DUD0A5R0IoXGr90
	DMrLEiRKPLXBZE2LtWgENy8VNdAd+Zokj+dgrjcM1CJq5I4KActEUq1EWNvl1ARm45EFkVZ1KPd
	Q/D0V6QoN0+wNgWgCcRCH4nx+wi48y6Yrl4TpK0g/yFwDT+OiePbsscGi/1qSDBVlunBEM70Enx
	Gb8NiE1Mizc+2s++8GV17J4vZV5mTcK7+TSdvM/HhkWivIkvYncRRidUb03EeSjEFcd4
X-Received: by 2002:a05:600c:1e04:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ba093b9702mr62316215e9.19.1794426229399;
        Wed, 11 Nov 2026 11:43:49 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm12088665e9.2.2026.11.11.11.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:43:48 -0800 (PST)
Message-ID: <60029f5a-091a-4022-ae48-8fb9a00d922c@gmail.com>
Date: Wed, 11 Nov 2026 20:43:47 +0100
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
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ljs@kernel.org" <ljs@kernel.org>, "kas@kernel.org" <kas@kernel.org>,
 "ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "security@kernel.org" <security@kernel.org>
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
 <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 8:29 AM, David Hildenbrand (Arm) wrote:
> On 11/11/26 04:19, Tal Zussman wrote:
>> On 11/10/26 6:55 AM, David Hildenbrand (Arm) wrote:
>>> On 11/10/26 12:54, n3rd wrote:
>>>>
>>>> Hello,
>>>>
>>>> I am reporting a security bug in the Linux kernel.
>>>
>>> Stop sending uffd problems as security bugs. STOP IT NOW.
>>>
>>> Tal has a long list of uffd-related fixes he is about to send out. CCing him.
>>>
>> So this issue was originally on my list and I had a fix for it... but it was
>> REALLY ugly and a band-aid, so I dropped it.
> 
> Yeah, RWP is a mess.
> 
>>
>> I think the real solution is to just add actual markers for RWP and solve
>> all of these issues at once... but that should be a separate series from my
>> batch of fixes (which I'll be sending shortly). Is there a reason RWP
>> markers weren't done in the first place that I'm missing?
> 
> Let's ask kiryl: why is it ok to drop RWP PTE bits during swapout, zap, collapse
> etc?
> 
> https://kernel.org/doc/html/latest/admin-guide/mm/userfaultfd.html?utm_source=chatgpt.com
> 
> states "Unlike WP (which persists via PTE_MARKER_UFFD_WP), there is no
> persistent RWP marker today. The user needs to re-arm the range with
> UFFDIO_RWPROTECT after any operation that explicitly frees PTEs."
> 
> But requiring the user to re-arm is rather questionable design if the kernel can
> just zap these page table entries.
> 
> @Jose, maybe you want to look into marker support for RWP to make RWP a bit less
> horrible?

oops. I overlooked the thread because of the AI report...

IMHO (and after reading Kiryl's email), I'd fix the doc instead. "Scope 
of protection" doesn't mention collapse or shmem reclaim, and it still 
tells the user to re-arm.

I could work on that patch :)

-- 
cheers,
jose a. p-a
