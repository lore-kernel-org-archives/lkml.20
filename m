Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEAD4B66D3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825683; cv=none; b=iNG12y8l2wpTGDYHmrXxIkCax4TuaW62LKTaZzLBai2v5SHG9jtoVLNiAEqxoLcAesF9oirSGk6eab+ax5UXGBox4UwE4/cB2BJmjtzlcCZQtFQDp3DzIz71WFsoV0Bexj5r6YR9Xpm1AJmrhB7pIu6okfZxHyvc8RMbdLXciMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825683; c=relaxed/simple;
	bh=iGIk0bg7YEavvAiz9L9Dgo+JZmGsNHsjcYqlYsCIoJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+0bhfR5NWGPu5vNkPuE+WNVEiFItxqocAUBIfpED0kCQyNWutgQLXgwvDrJjDjUrGGH2eb7a5Al2PheySHeVcCvBBMBNenLR4oqj5XM6HADTfHYUFRetHvarpcVjhB5HU5SX899mKrXDhIV691PaMMdzJ98i5ExsCHeNd/Wlgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZX0QB/B; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZX0QB/B"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c45111bebso1211926f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825680; x=1792430480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=;
        b=RZX0QB/BV9cAkYFB47nUBwzId+E0a2hPsAXsVopoxLT+krWQOqjtIgAfUd7PptjJhh
         NyReJINoYy1w6HEZyyb1xPyWrvWRBPCIAwGwHHpuapcWNSTMb5PhqU1Me/9lIpFRdiD7
         7YqyrF7II4o0OJaII9beTSXX0YYPUxi2ebJQtLNx3fURuq5SeWEAb05x6zq3mFyuB+O4
         w7/I4nWvbR7dsHLjDxzhgX+0MGBv44vVRpvpCLBb4LDC1VtUxpmqOTlLA5T69jTnt61+
         8GzklcQH3Mu3t1/nCDnAF8IECOKuURGRkKP/dvVji2TJ5vcWqlRVw5mkO9K5mmhn3MS0
         85Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825680; x=1792430480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=;
        b=VBWuzYEbcf5z0RJQJl7Pramr6z+FWndizHLFOmNqpKpwYMAAVPMNvgEZ2bWA2cOvlZ
         vjyDAg4ujr93Vn9CVNI6JXvLtBQLhMX8vDOjOgGurSj3rCHW+a+w0MEh934Z+ycB3512
         swDgWg6j94zDhCrLkHli8Q4bZPVwZ7srYsFdSaZEHmim0zYnmL+9WiM3FzGRPC1chcgo
         08rt1MEDZ4dLWqlA0BjUjyXDouWrU7L8c4fEdJ/78IKvBhhYTjz9+A2PYEJAm7VCOmZB
         OiQekdkO6EZLeOBXDZ5u2RqS7sRaSmA0wE9WynWH0UkW2GTwpo+sOk5ggwjRqtGNVRSf
         uwUg==
X-Forwarded-Encrypted: i=1; AKwUvBzH75ElRlNh3x5PfgZ1Y/98eA3sODd1YszEbCtoEpr/lL228bT9+5Pvb2SIHkBk8epi54k2RNthaWgZm8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk0DRy5SlBtYRv/kqLy1RMnKxjJkIZBI7JA0DBH6ocgp4rlt84
	BEMwxqI9aI7fLhZi+YjePXR2MOrQ3dJhqbN5b/1mAPT5988LuvdrucJh
X-Gm-Gg: AYBFou3aoFaj0gv5cPXnpVyjFxLX1uiKjppoo1H/BJVTludi6R6OxRicsrZy/FfMpd4
	9OmjrHf0BLkIDNtse4LZ9BNL4uhWpfSjMx+6vVfCjafi9qOxJ80Z4CHrh5HFcU6+TXaI8IVe+VO
	sGfwBC9QB46WZKv0sR6zAtq3Yg9yaXDPSNDTWb9lBTa1mAsR/ttcFquWEk39F73mp/n/VzWPuFV
	Nhm53QBcGe+st2W2VatNrOxkhNFQsdNJ8UFre6XdqwZmMRDuSHBC4gOFdD2TaQs9OkTXwC9gNi3
	o8JUf0WEkZQZaYKP1GS12UfI4GP9UlB3IpFimcNJVTL8TpvAlVDvJ/BQUK1kn5UUyFcEanqXb0S
	r02Nf2pRE6yzHQoCCitV6ypJF7C3RXv2LlwzdiBYSq01Ywv/lnT5tfodghrLg/roOrDz8Hq6T0u
	EnxB0ULpACCG7KzqUBKn4PApHmnj1wUWCweZFYf28dK+Ohz2SueQGyj/gB9sQTNf+DZw==
X-Received: by 2002:a05:6000:2990:10b0:48d:de7b:9caf with SMTP id ffacd0b85a97d-48dde7b9d70mr2473124f8f.8.1791825679711;
        Mon, 12 Oct 2026 10:21:19 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm583094f8f.9.2026.10.12.10.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:21:18 -0700 (PDT)
Message-ID: <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
Date: Mon, 12 Oct 2026 19:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
To: Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/26 2:55 PM, Muchun Song wrote:
> 
> 
>> On Oct 12, 2026, at 19:15, Jose A. Perez de Azpillaga <azpijr@gmail.com> wrote:
>>
>> On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
>>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>>> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
>>> tables.
>>>
>>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>>> splitting a PMD. Restoring the vmemmap backing pages does not collapse
>>> the PTE table, so a later memory hot-remove eventually frees it through
>>> pagetable_free() on x86-64. That releases the page without running the
>>> matching destructor and leaves NR_PAGETABLE elevated.
>>>
>>> Make pagetable_free() detect constructor-backed pages and run the
>>> destructor before releasing their memory to fix the problem.
>>>
>>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>>> Cc: stable@vger.kernel.org
>>
>> is the x86 case covered for 6.16-6.18? as far as I can see, x86
>> free_pagetable() only uses pagetable_free() since bf9e4e30f353
>> ("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
>> change anything there. or am I missing something?
> 
> Yes, you are absolutely right — thanks for catching this.
> 
> I double-checked and indeed x86's free_pagetable() only starts using
> pagetable_free() since bf9e4e30f353 ("x86/mm: use pagetable_free()"),
> which landed in v6.19. So for 6.16-6.18 the prerequisite is not present
> and the backport would be a no-op there.
> 
> The correct trailer is:
> 
> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use pagetable_free()

also, bf9e4e30f353 alone leaks PMD-sized vmemmap pages on those trees,
it needs 39406c05f8f1 ("x86/mm: Fix freeing of PMD-sized vmemmap pages")
as well :)

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
