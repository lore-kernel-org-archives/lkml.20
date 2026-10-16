Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874744E66B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141046; cv=none; b=B0nG1hjiq9grO8M+01uiFQCJSpW3qF7Op/e4z5o+xdVtUpqqgUb7QDd6qTUxVQFI0ZeUeRUSSQk1jJ2ybIw+oZeoJaWKPjGIT7N29lzuWT/e9hzzT8yjb5EP852ADxdpgsIKt/YS6IEUabTP9NmAjKYew/EdBntRA8/ineXwYcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141046; c=relaxed/simple;
	bh=uL1w8BEtt8Np/I2lqGqbLuXM7I9yviHkRH0NnWW0ons=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5XZjyjJiXNYfIayeqFmRzgQXkGjqeLi/cpqAztM4G6TwWxw74BYGlRgVnI1HvZnO5YLbs4RkZzN9asAS5js9EDywK1+qU4lCe10lDJ/Hk8OqBesBXFd7IfTwdVxlVj7vDi/WCBTMuwIU1vND8s4H4UoWdCF4lM/KOQC3/KppEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdledJKk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdledJKk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e00eee27dso171395f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141043; x=1792745843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/q2L7BS45aTpoyNh7m1QrG5eRubgbrBzhsyuMzS0/Y=;
        b=OdledJKkHyKkUe6e5iBmeFLKmwU4PVSsxli3jDVGIf+o2l8l/lL/Q+j1oJ2S+OFZkZ
         vu1HLC3kzj3iQ81Du7bUKzkjPOXU6kzbKOss+TygfuoNDqCJpX9bnLZh6HATnZ6gFEpC
         2cFzzS5HTqFarzB0Fe4uaW/n83p3wxocH21RfEM02yq6NBTJPhuaJGU6P5yDl7K7GC28
         FT219PpULEJ93e3nq047QIiZ+xObxIw7LApAj16ai6Y+1iFPmVjW4L9m+gs40+k/R5TJ
         Nd7sfxW0mU3wypTvpiiXEuSj7lDUbSD75uz0m9WjqXnxtRDLLaRAnsGaS4TErlGrUrtY
         b+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141043; x=1792745843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/q2L7BS45aTpoyNh7m1QrG5eRubgbrBzhsyuMzS0/Y=;
        b=Zux5dlYKd8QknQPKp/ZQ0wJnz2evF7ir6lynuUKEI2KpPPaHfiBDXyESipEbBa5cpz
         b7pmzt4+9fimuL3UaXoy0nWXa2MY+Ya+wIPZygiRxSQKHiz5HsQcDZILFx9e1l44uMVP
         1Bpp5qP1IJRu8/KAPmhgwVqH31JWZO4kz1zipZdA9w29SoxwlOFNN22jPJLZgYzscoJq
         eN0Dehu41xeHFySCMiHui5uw4m+vTlMhawVgYEH/nsjbQon5Pp8Ru6hkZyMcbMuwWDh3
         VQb4iyWdcEWbYo7pu4RqEgNazkAtBiWXUX0Uu9slEOcVhrMZbvr73XeXM1qFURkvGnFu
         CyEg==
X-Forwarded-Encrypted: i=1; AKwUvBwCvdNu9aGN+DLTmishHamm+88kHTgb38Di4SY+ejV6GQ141L+14+1o5FJb0ZWOT1GKCBVd7SqLaY7/rZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhzC227VvVJf3wtgplXBu6WcIIqtGMl9nFI0jNFE2gw96wz7ON
	J0n1foAsPdV+FjE8xAPbRtbNhYA6nE5WtIObxg72WinVKqyLRku9Re83
X-Gm-Gg: AYBFou3McAF23hjkjyjJYz7bZ27Ro/Gho8P2rJPWv9s8TvfxL4e78Gqq5GumIxbSO2m
	hgVGh8qC6dCyzmsMZdKh2G9t7M4gby00AYS3O+SAaGWEGvbg2LVjVvnKAxiV8tDQUw1dcr6MSVP
	m6qla133NYSPnXLKL4TbN89+ZKfjIo1sfv68GHPtVkPJmRR4fD7MCYcXE663PEhe6iz5aCVhVRe
	aeBdyYYshYrErJ7VrRD/TAOLel6JNoDXWHxZpJF+7orn3scC6iFZlVjuZXYxtJJNJ3i8zBuK3px
	+tgfFHVL9uvT/6fD6YtAXGNKnYBR+tYEiSlgW+QzSoy6rvxI7GLaVDs2EPGCsmXMGXw7W3RuSER
	L3lgpIQXqMDuI0dd9VU4kx322Sh8Co9ln3bQIubABCEIVoCdeJRoFdxylpyL071H3tTD1HyRkLw
	zK+kWBJTEXqXt8pSw5CBdxUjsZn3QDJC7pbvq+KCXSKSL2Nm84uV6f6XWw+bAM+jHGtIV3MDPgP
	FM614ych/z3e2+qsRzg/Ehy7ZNY3zkVv+9i2rD78R1UzNHpPJ4=
X-Received: by 2002:a5d:5e8d:0:b0:48d:f7ef:721f with SMTP id ffacd0b85a97d-48df7ef72e4mr8636884f8f.11.1792141042620;
        Fri, 16 Oct 2026 01:57:22 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdcc0f20sm3509146f8f.11.2026.10.16.01.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:57:22 -0700 (PDT)
Message-ID: <eaeeaecd-f51a-4c2e-8439-36c7b8f6721b@gmail.com>
Date: Fri, 16 Oct 2026 10:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vma: avoid spurious write locks when mm->mm_lock_seq
 overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daehyeon Ko <4ncienth@gmail.com>, stable@vger.kernel.org
References: <20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org>
 <f5548d05-5aec-42d0-b9d9-c14fb575dec9@gmail.com> <atHa3-KlMPg6oy8v@gremlin>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <atHa3-KlMPg6oy8v@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 10:19 AM, Lorenzo Stoakes (ARM) wrote:
> It seems likely that you're using AI to generate these review points. Please do
> say if you're doing that, thanks.

yes, I used an LLM to find the commits I pointed out and check if my
reasoning was correct. my bad for not mentioning it. anyway, I reviewed
everything and checked that it was correct.

[snip]

>>> Cc: stable@vger.kernel.org
>>
>> the parity check relies on e5e7fb278e59. before that, mm_lock_seq only
>> increments on unlock, so locked values can be odd or even. should this
>> be limited to 6.14+, with a note that older trees need a different fix?
>> a straight backport of the odd check would ignore write locks taken on
>> even cycles.
> 
> I have a plan for older kernels (just make the value 64 bit...)

okay, I didn't know.

-- 
cheers,
jose a. p-a
